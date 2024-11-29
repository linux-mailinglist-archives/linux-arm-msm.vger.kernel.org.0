Return-Path: <linux-arm-msm+bounces-39612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9ED9DE986
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 16:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD5D02823A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 15:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17BE1422C7;
	Fri, 29 Nov 2024 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhPNY0Xq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B9B82D66
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732894423; cv=none; b=t7CNkpKWp5W19flkARcXiRRjrmR4KkenEYtao34GNosTsDtuHqXhj0vijkcMv6r2LOfJdtAcGQVo81FwsuulrFlOKTEU/pzVG+CjHjiUJVamz0isgwe+T+1Ohg766GbbR2DlkTgwq+AOqL99C0d9cXZduoB+es6+fJ5K422P3eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732894423; c=relaxed/simple;
	bh=DAdlG520/SUTDf9jpDwBay4S7+/i/rqvBOQvuNodE70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhLUBRpeM5BEF3vn9WJ17hP5T/NqsR+qq+E1owGo5YFArs5WqBpYlHekt3K7xrNLd9wu5ZAHJaoFaNrgUmPddVHnBQWAStT3/Oawch19hIuXAi6gL2CrmEyMHv5aVw/4RH+2B+BtjtrElrAnG2cM98ZH1EUbqJ24SZVll7pBQkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhPNY0Xq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCGPYt025659
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 15:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shaW82SALXb2Kh8WEaB1wWyqmB0pJy4OE+cwXVqtroA=; b=mhPNY0XqQfzyWk6j
	Z71lpa2MSZLp6PGgBCT0RqH+AXWVpCpM+mbFK39YjEXA8P385s2HNEySkMkHfgjU
	eBmYQdaECTUiTjoFxAgtXPz0GjHpPNfxyzCb/69s2XvzLOGFJlwaofXG/NCRkYVO
	7YOhpb5pIPoq6NXTugLpsTY+yKJNk0c+z/ZLbhdDV2lxKo0qqr8sx88zLsyhxNPp
	TWmd0vxxG0DkCeR4pgjk5KUGlVaaozAHPE4RH9hdx6E61lUyS2GN7ZQwKMIgtGdf
	rR7JEj1p1Sts8MAQUB5hcuGNE/UwsxUNytQVbbaaH8J7J3l08gN7X0ZEtrcScaWD
	6Gupzg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvny4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 15:33:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d880eea0a1so3475746d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 07:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732894420; x=1733499220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shaW82SALXb2Kh8WEaB1wWyqmB0pJy4OE+cwXVqtroA=;
        b=g8dSwzf7MyiaqDSg0MuBlyMBI52I+bISSsV+hWMF3tvLZD8GB8oV+Iqvk8BwHCTx7J
         kDZVvMlOGMqVAUCpy+SVvuD6jQgOfmZy07KqeoyzD/chwIXvmNNbxgyVGtJbp+Wb/WJF
         Yoh1/QjO0l2IYnmmT7qR799W2N/ZTlN7M+VZV1FbXXSNW8SaSm14PtagMev60dMpmpwu
         Y4CTlLhZDVKQH/WbFZ/D45kFvlqpreeBHLnhrZacrvvl9LbUHY2Voi4VrdfRTSwZQeWq
         xXBcu9fKrtngEZzOMyzf345E9q99wioDV+VvF0gOOWLQtzwVg2jJcVjKyhp7yvj7mR+D
         8P8g==
X-Gm-Message-State: AOJu0YwmVqlwX8n5D1jAs0Z72rAyLt+SiaNk1kuIXrRHc/RKti4eTmI8
	3rz3sHz0SoNia3JlQA0Br30A5Pqqfp1CvRsyEURI/iuvSaA9Qw5R/Fbu4fZ6jzXsH17RRbOvpMN
	ewtZ5ZbOfyxwe6l7+a0Rrmh7JsezoW1PWE3VOMZvknRTMc53vAz3flTsd2Ev2t8us
X-Gm-Gg: ASbGnct3qoB8LLcHvHliqr8TE26qyif6ED4EhKBRtCGTN4DWQul8I4Ezb3+nqDPve7x
	Yx6N4EbTUcaXVZelV+3PQcc30P72PieamhUxp/N9LRXOCNB7++JZe6L6d6Q322aTJikhELtpy+w
	65KhBaKK5miUrZRbqrQV8N1caC1nl62jl0LMaiOvKQWZsF/8XsT+Jn7sPut7BbYIEkTQrogxfIW
	x3rd2KHVRgMpfEi5wiRGgAdE3uWvVNO7A/0qitm7t1quXDZKIJYMW3mbj5qkMcW4cMh20kMg+rO
	GIgqnyagYyXK+ePn1lFDm4L4y+p5A3U=
X-Received: by 2002:a05:620a:2447:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b67c50621dmr664300585a.16.1732894419894;
        Fri, 29 Nov 2024 07:33:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjvimuE9VJMKaI6/pwzXY6EhhoZkPvjvninXPgPQEWRNX1VJCXzVg7RD/kix02hgfkfKIAyg==
X-Received: by 2002:a05:620a:2447:b0:7b3:2107:2eef with SMTP id af79cd13be357-7b67c50621dmr664298385a.16.1732894419463;
        Fri, 29 Nov 2024 07:33:39 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8dcefsm1995978a12.55.2024.11.29.07.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 07:33:38 -0800 (PST)
Message-ID: <e3bb3f66-9cad-40a4-ab55-f1d5a8e34d4d@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 16:33:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-4-81d60c10fb73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-4-81d60c10fb73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8jHFzooOaWwdEyxRmtpXCwzDUSYv4AH-
X-Proofpoint-ORIG-GUID: 8jHFzooOaWwdEyxRmtpXCwzDUSYv4AH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290127

On 28.11.2024 11:25 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, until now we left the OPP
> core scale the OPP bandwidth via the interconnect path.
> 
> In order to enable bandwidth voting via the GPU Management
> Unit (GMU), when an opp is set by devfreq we also look for
> the corresponding bandwidth index in the previously generated
> bw_table and pass this value along the frequency index to the GMU.
> 
> The AB pre-calculated vote is appended to the bandwidth index
> to inform the GMU firmware the quantity of bandwidth we need.
> 
> Since we now vote for all resources via the GMU, setting the OPP
> is no more needed, so we can completely skip calling
> dev_pm_opp_set_opp() in this situation.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 23 +++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>  3 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index ee2010a01186721dd377f1655fcf05ddaff77131..c09442ecc861c4e56c81e7e775b9e57baf7d2e51 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		       bool suspended)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	u32 perf_index;
> +	u32 bw_index = 0;
>  	unsigned long gpu_freq;
>  	int ret = 0;
>  
> @@ -125,6 +127,21 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		if (gpu_freq == gmu->gpu_freqs[perf_index])
>  			break;
>  
> +	/* If enabled, find the corresponding DDR bandwidth index */
> +	if (info->bcms && gmu->nr_gpu_bws > 1) {
> +		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
> +
> +		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
> +			if (bw == gmu->gpu_bw_table[bw_index])
> +				break;
> +		}
> +
> +		if (bw_index) {
> +			bw_index |= AB_VOTE(gmu->gpu_ab_votes[bw_index]);
> +			bw_index |= AB_VOTE_ENABLE;
> +		}
> +	}

If we couple frequency levels with bw levels (i.e. duplicate the highest
bandwidth a couple times), we can drop all this search logic..

> +
>  	gmu->current_perf_index = perf_index;
>  	gmu->freq = gmu->gpu_freqs[perf_index];
>  
> @@ -140,8 +157,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		return;
>  
>  	if (!gmu->legacy) {
> -		a6xx_hfi_set_freq(gmu, perf_index);
> -		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> +		a6xx_hfi_set_freq(gmu, perf_index, bw_index);
> +		/* With Bandwidth voting, we now vote for all resources, so skip OPP set */
> +		if (!bw_index)
> +			dev_pm_opp_set_opp(&gpu->pdev->dev, opp);

..and then it would come down to..

if (!info->bcms)

Konrad

