
void setup() 
{
  
}

void draw()
{
  
}

import java.util.List;
import java.util.ArrayList;

class Simulation
{
  
  List<Particle> particles;
  Environment env;
  
  float timeScale = 1;
  
  public Simulation()
  {
    particles = new ArrayList<>();
    env = new Environment();
  }
  
  public step()
  {
    for()
    {
    }
  }
}

class Environment
{
  // Environments are circles
  
  // Environment geometry
  float radius = 50;
  Vector center = new Vector(0, 0);
  
  // Environment parameters
  float friction = 0;
  float gravity = 1;
}

// a particle is basically any dynamic object in an Environment
class Particle
{
  // Geometry
  float radius;
  
  // transform
  Vector pos;
  Vector velocity;
  
  // misc
  float friction;
  float mass;
  
  void updatePosAndVel(Environment e, float dt)
  {
    Vector newVelocity = velocity.copy();
    
    // Velocity update due to friction derrivation:
    // F=ma
    // F = uN (opposite direction of v)
    // N = mg
    //
    // ma = uN
    // ma = umg
    // a = ug
    //
    // u is defined as particle.friction + environment.friction
    
    // dv = a*dt
    float u = e.friction + this.friction;
    float a = u * e.gravity;
    
    Vector dv_friction = velocity.newMag(-a*dt);
    newVelocity = newVelocity.add(dv_friction);
    
    
    // record new velocity
    velocity = newVelocity;
    
    // update position based on new velocity
    pos = pos.add(velocity.scale(dt));
  }
  
  
}

class Vector
{
  public float x, y;
  
  public Vector(float a, float b)
  {
    x = a;
    y = b;
  }
  
  public Vector()
  {
    this(0,0);
  }
  
  public Vector copy()
  {
    return new Vector(x, y);
  }
  
  public float mag()
  {
    return (float)Math.sqrt(x*x+y*y);
  }
  
  public Vector norm()
  {
    float mag = mag();
    return new Vector(x/mag, y/mag);
  }
  
  public Vector newMag(float m)
  {
    return norm().scale(m);
  }
  
  public Vector add(Vector v2)
  {
    return new Vector(x+v2.x, y+v2.y);
  }
  
  public Vector sub(Vector v2)
  {
    return new Vector(x-v2.x, y-v2.y);
  }
  
  public Vector scale(float s)
  {
    return new Vector(x*s, y*s);
  }
  
  public float dot(Vector v2)
  {
    return x*v2.x+y*v2.y;
  }
}
