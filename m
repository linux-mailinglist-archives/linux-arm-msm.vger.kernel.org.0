Return-Path: <linux-arm-msm+bounces-81374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD05AC51A15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51D7E4F1C96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6AF302157;
	Wed, 12 Nov 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHG/U/xg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSDKofYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000A3019A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942692; cv=none; b=eCuYdpl9PuLU/H90HNjm5BWIHadxfhhcAft0RCyb33zrm5rQhrA3uGbbCPOOHK8Ei+2lY3VzQghau5BRidsziYGWanhPvq68JxTJmBR5DMLhH9llj3+Ou5RrtWtH61sy/rDJ25Er6ow28eaAetWHGNhu7pfNUt/HZDZ4eb/bu0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942692; c=relaxed/simple;
	bh=6ExUaprOrb7bYmHFnlrq+UtunG+UsbsFRXBeLvcjM0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Et/yOGNvzlC1Zs4IaRYx0CVYJVaUnwJDjdmTCzmGKBTq9E2f9xs5sYXlCe5Z/ED8XSu4HC943+osRgJ9Yh5UQJsF5VAiF+GCkciivDQ0ecN4Ag1pFYrwuMQO7d+wP12bdVnOpTg+KVrHMo1myuYnZSMRnX3asakLip/vAYTbJCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHG/U/xg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSDKofYN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9rWPp4052798
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=; b=XHG/U/xgXOWnwci/
	cbr10cJY9Vt1KgKxrd5wTZGGN7zmOyK3bgcF4K16kGw2s+flbPOVsa5yuY+U9C71
	GUdBTbMP0/9VrCf6+FqRxann05mQXG1D6YLuLAQXMEIFZSf0AUa5FG+JoX3RiyAB
	RR2hEBqBi1jo18d4cxDgheO984q1tR9tsiBCi6yksRqG1uO2QaOVtW+GxTpRASn+
	Rwl5DE0SBlnvtnEfMDP1pKUdc8H4naeKgABrfuOEZOvelQhB6UKWgk69l3UKWmIF
	/z5QGbCOmHcBTIBO7rx0gkghX2PaWhX3rGTitX/HYNfaSywUOHYw6jsPsXOxVZwS
	PykLqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acj6v9aam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:18:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88233ac98f7so2191966d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762942689; x=1763547489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=;
        b=hSDKofYNWze5tcK0sSYaFi57CPDlREcU0jGeJg3//+YBBd+Oi6mgB7CthlCBB0uFhR
         hMPmyB3yDD9tnUPxGnVqq006MyT6yPsrPG93LNukq4pXlvzuQd3IMMc7NJOtC3pYjuFw
         Vb1xnzH7kICiHp32XEh291fiR0dTAKJqQmXAL7NCgKlztqkf2Cj1OkQJQ/srUb7Mjdpq
         YG5cHKVJ69J95KvCZ2bD/PWPEIz+DLevZMu6o+xQNDi3AbL8EBZi1ZFTf1Q322VsX0+P
         IRj7Nj+wMgQk9F1ByYfifDIrh5okKgzuLv0VQWuJBrMLk+vx+Yvn3ik4/GrSs3CKVbX3
         Bd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942689; x=1763547489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/lopT9opyCf90Ve+odq78rypOpIc2a0jmLTtA1UVZ8=;
        b=NrA6URLQWqulESD1+D2yyEAviq2JzKPZDNuXaX+A5b1IeLmFKbcoLMAksincn/BOuS
         b1nGnAtJgWk6CCXlCpg1pxlmj7EoPVMoZ0dlFBRCqiSVErC1d34TpqxJwlmjpIOjFZ1f
         pdSdh3Y02emPJ4h9UumlOXn571UGOvTeiRj0yV6gAXmKZvrPwUcXMpcOHRiYfSfoM51N
         w36RfPqg+j0tDoW8opc+/xTzsvGj1jBmqEmrse9owSBvy4TdHqRBJSyY5SRInfciIiSL
         HqPetn0Y2WaLTGOoZOs0pYJN4MDoESPlTutY1WnP+96kvN/iuUrbpMuqn7XDYbTlszSa
         BVsA==
X-Gm-Message-State: AOJu0YwmGbLJzCkdmV3BZ9/EgZmIOneYC3BMWH3MUK2/6cCPwBp+XSG8
	iuPWWbi7Ji+7sn11cV7zXr7DA/eid6aMTmizWYuf0bG1OR19F4Drhv3GrY4X3Jwu/9j7orSyTO3
	UGxYFsTlBytcHaq1zIXTT3TSjjXAHAEbFqn6BvLtR++5UFoDjzs2rH1nQisEkYJVm8mhK
X-Gm-Gg: ASbGnctO9nyFsfnv/Fq2P6siExO+fdNNeu0puVHMHsPdhdGW2cTF2toTqqAVJKHpx/I
	tEfyHk0YaHotll82AcKmvYkvG1piObUOIE1hM0mFlgWM3t/15yCSvdvEysnezwV0dn8vXJXTgZx
	OewKVxnae1qdWss1Nhaksr65CrGlK5chc1RfTkprIVFXdaPndqr0QOfaiXDysiEvjgngPgL7WEn
	Vhj1sdShOXYsCGF4n/6lHH20OPDU0sP6Q/2cmXKCEn+lCV9bbTHWAVpik45gJ3BBG8qUyteqjBN
	BRD2mTSi3XQtu0dbcZCLDpKaCUnoEei5tsWsJgWTCMHhhoyDdB++xeFdTR0rc5lKU7CVXz08Gun
	r3Av4VZYwbMSjxCOf/hj53hMGOm7d73gMCoBzcRB0SlH7vp2kzSXcg6Kt
X-Received: by 2002:a05:622a:2cd:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ede41f17b2mr892411cf.0.1762942689299;
        Wed, 12 Nov 2025 02:18:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYtQ29X5tXvxSDaU/JA+AKkzXH/dnj2dUKb+nxLC9dFOdNM6v1tgVxXnY84nYUEM2+bTg7cQ==
X-Received: by 2002:a05:622a:2cd:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ede41f17b2mr892001cf.0.1762942688856;
        Wed, 12 Nov 2025 02:18:08 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eb6sm15397422a12.14.2025.11.12.02.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:18:08 -0800 (PST)
Message-ID: <a1273bdf-d926-48b4-877e-48d5ff45e7d9@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:18:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] drm/msm/a6xx: Fix the gemnoc workaround
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-2-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nOoEES1DmK4N0UEwMuAo4wBVizcMa73-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MiBTYWx0ZWRfX19Xggg/gihMV
 jrOJmPDjetS+9ffgWKBewHmzAqIVNkRmLFhRvlUfO5tmKE1rkE6AMGMkyFGmkSHVN7f3LtJmVXF
 1StyVYxZtKUMEPe2y2w01G2y8mVukZWiVeaPd9sBMECZpqC4x4xLGgPUPv/VnBa9LaGujb+CM29
 fB6kpmNZYw1GzI7fgQJl8UtwYS+JFFRE58odJLUHFWOyvGPAQjKPssVvAG409skw5QHqqLus9GA
 k2OTR96VYxqDpCC1nrOaGAswtk3rPhKQYEHybJi/YIk2HxaQb2qfsUiGK4Bg7IVViVgr8/9b19B
 XLWtR+e+J4xMiTjKeMOQgf0djl4syzl2+rQk5EAHCPULqm7YYCRraxjztn82AuvwV1HpF5odxGV
 JWbRD6Ombqk4BGG0qILDCVAleVA8/A==
X-Authority-Analysis: v=2.4 cv=f8dFxeyM c=1 sm=1 tr=0 ts=69145ee2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B6ldIsYNqgrP1okBzpgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: nOoEES1DmK4N0UEwMuAo4wBVizcMa73-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120082

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match the recommendation. Also, downstream does this
> w/a after moving the fence to allow mode. So do the same.

It does so for _notify_slumber(), but not for _pwrctl_suspend() in kgsl,
but in my understanding, making sure the bus arbiter doesn't gate access
first makes more sense

> 
> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 4e6dc16e4a4c..605bb55de8d5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>  	 * in the power down sequence not being fully executed. That in turn can
>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>  	 */
> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
> +				adreno_is_7c3(adreno_gpu)))
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));

Arghhh copypasta, thanks for catching this!

Konrad

