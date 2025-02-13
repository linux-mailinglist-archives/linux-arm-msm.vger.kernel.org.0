Return-Path: <linux-arm-msm+bounces-47938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDFA34BC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D81931888FCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735F524290E;
	Thu, 13 Feb 2025 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCfTb9B8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7C6242908
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467312; cv=none; b=CGLBHqE7+31cnj9Ctw8MOYSX3cPCWN42aRZR0+1/2EII9MtWHguLmCut95nesw+20KjwILp34kaaeF+zKYY0B97kxxrtZJrVeLCdpohLqfGmpKJNSMGjWP74mTW64riE9Q93gR+FYMVPl4H+JXlL7RMrnu2cxwLa5G+0aHS0Zzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467312; c=relaxed/simple;
	bh=6FF4MWoMA1OKUMuWXqqU+2xHw2F5QwcGRsPezlTY0YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYzO9BITht/OkCeH6Lj0b3Y8EDAuyk4nGumCUl2navmMxcsjxMNTFK3gHV5og8JwVmwjJCoQC5FysCWWbLLFuWKQ3S2aNQnIetnuNy+vC6HaAXRrjsabodg/bq3ke+9jHaiMlG5pqHS9P7rusDRQ3lT0d2ZEk3mdSdNE6DsUG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCfTb9B8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D9grB7027721
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbuXiVVzDaeS+xX9GP61rxfDPpXPI4a6eC/HT3/7Z38=; b=HCfTb9B8m92OhwOh
	Ei0ZTfJLaAOyjhyN6pPVNira3u0j926HVdpNTjKhl/yAD1kcwiWzoXjhLgTim1NT
	4AI095az/Iv+rYBN+ZReunWCBCdp0qau/cNWeh+NM41OmuiROarHp+dEhX5Lw2pp
	2iid9candxGUYXg+9Ylfv/8QgCqcRhaR8z8F88UBq8KNsy6Nh7z3YgX8KsbPEMUx
	KkIHx5AjbYHjT8zNJCxAQb3Y/xjcwJa/5Xb+avxKdfcM+/EVB4irAnH1lTtyTwQs
	N27ECfOaMW8JzprSX1+wCUzGdYwKimnbLbzbxqk3iI+4CzMXmAYu/MjMHGFwFEfG
	Fo5uZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebn97p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:21:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e4546f8c47so3567646d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 09:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467309; x=1740072109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbuXiVVzDaeS+xX9GP61rxfDPpXPI4a6eC/HT3/7Z38=;
        b=mZGaHIPoG5Jm995zE1zkWQJ5ppLM8+5HM62OzuKNF/aGm+XhT1dGzG8u4R3BG++CLq
         mKAX++mfUppGpqAXAn+Ghnl7fDey0VxnMW0PQ4DtpQp2IQpFYT7kp73Ry9yUAel/RdGC
         NJVU1uOEndVU58X/PWhlHA4EXNmESad8goPT7GaUZJGbuwUd0wDOrLpNXZk3F6hDMs/N
         zm/9Mtqk9dW0VeHt06Zq7NPBIaNGI6bHIceT5CcFl/b7W3AJppFL59zOlJbjNE916SBT
         fkPmpfEz7BmQn2J7sWMkRqk0rxsSRNqtsizmnIo6Nxm5WSUn9QX0FKyquHYh1NIlhIL3
         b9fg==
X-Gm-Message-State: AOJu0YwNmDxf2gID2gINeO8RMh56wBx6e1ElUAd5ylRmhwn7mDqEAL2S
	2X6x1TQIwuxDCrHPO/vpuTXIbqCvUlr5hcGEuiC7/hx1wEy5zhHjk2ddIKYPDee+udLqjuI41F+
	k14B9M4pwBmbXgMtbatYJxb+1RcqvKanuAgFDj0eBy0sL85c4vzkm+pw1Px7JPqKE
X-Gm-Gg: ASbGncvLMMXYedFkEIpQATFXfMAuaFstY7UqStMD7EbfWZXvI9aHICJNR5/l0bXkmTg
	ZVMpHDfKv4UCpDvI8gX8eC/sE9aWCi4OMmU64+z6Zpq2pPv3wh6IERKNwFHw4iFpAmUhDf2aSKE
	FwPPCSluLX9yuerykHhIHkyeGO4l/ebnsVb3SPKKlGPtFne2zirGONxPTyn03kraMt1ke4e9/m8
	IZB83adYA4mUIAKzkp832nyxp6Y2v1xQzWxB3yhIXn0mVLlNNLSIsgTw9aYX+arwxwQFZ+EdQZX
	zWxr1+LZKR/hNaQ09tLuUE4aQNjl/CGiJNT1xdCKgLF/qOgG63Azks2rbdk=
X-Received: by 2002:a05:6214:48c:b0:6da:dbf0:9645 with SMTP id 6a1803df08f44-6e46f886c88mr43338886d6.3.1739467308560;
        Thu, 13 Feb 2025 09:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFY/XCimTxvjm84xoncA2p+VwjKdnzksODuhc+qDaYGL+fpJgnRW7IaJN9QBFnX0LV+tfedg==
X-Received: by 2002:a05:6214:48c:b0:6da:dbf0:9645 with SMTP id 6a1803df08f44-6e46f886c88mr43338756d6.3.1739467308127;
        Thu, 13 Feb 2025 09:21:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c4687sm1498611a12.22.2025.02.13.09.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:21:46 -0800 (PST)
Message-ID: <4a3eec8a-4f71-4ac7-a6e6-0e8490c020bc@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 18:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/a6xx: Add support for Adreno 623
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OyMarMW_x-0Zy5vc4klkjpxdqfdZ_wnN
X-Proofpoint-ORIG-GUID: OyMarMW_x-0Zy5vc4klkjpxdqfdZ_wnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130124

On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 623 GPU found in QCS8300 chipsets.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>  4 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index edffb7737a97..ac156c8b5af9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
>  			{ 0, 0 },
>  			{ 137, 1 },
>  		),
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x06020300),
> +		.family = ADRENO_6XX_GEN3,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
> +			[ADRENO_FW_GMU] = "a623_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
> +		.init = a6xx_gpu_init,
> +		.a6xx = &(const struct a6xx_info) {
> +			.hwcg = a620_hwcg,

On downstream a663 hwcg table is used, with the following differences:

< A620
> A663

< {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
> {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},

< {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000777},
> {REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000}

Konrad

