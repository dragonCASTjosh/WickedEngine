#ifndef _SKY_HF_
#define _SKY_HF_
#include "globals.hlsli"
#include "effectHF_PS.hlsli"

inline float4 GetSkyColor(in float3 normal)
{
	static const float overBright = 1.005f;

	normal = normalize(normal) * overBright;

	float3 col = /*lerp( xHorizon.rgb,*/ enviroTex.SampleLevel(texSampler, normal, 0).rgb/*, saturate(nor.y/0.3f) )*/;
	float3 sun = max(pow(abs(dot(g_xWorld_SunDir.xyz, normal)), 256)*g_xWorld_SunColor.rgb, 0);

	return float4(col + sun, 1);
}


#endif // _SKY_HF_