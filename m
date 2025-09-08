Return-Path: <linux-arm-msm+bounces-72595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F367B4931D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA9C42041A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B9230DED4;
	Mon,  8 Sep 2025 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPbNWXMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7612E8E12
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757345084; cv=none; b=Pu/b596SgaRNfp8kFxgjhtZk8ApqOnz4g0dW2Y7qIy3fmdwvK7a84f25PlEQ2b7X8+IIitz5iFz6GArR9X4q6vAf6YXkeZKVdVkJpBZkRA+KIKqtOB/aOxRa/xT8FuRjUMu6iUzd4EkXDRlq8iqdMAm+PAX4KmS7CeJ78ONFzFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757345084; c=relaxed/simple;
	bh=BVmhf05AnvENSu4Q2O9muu1fjrqbpmJnlrdvdpeVF4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tyv1LSPb8CTzmTyI/xyleKJkELqtujBHU/OiMWxVHeEOpKFJiYEmQ7eE7DugOfF5IG3jHhkDz4lctP4f+VANO32CoNdlMVPCsVbw69c/VNTsnZN3RgDVyKm6c/ALjZe/rOvqCIIsAjtDQ3A0gPZOMVYe8SnsK87/H+aDKrghuGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPbNWXMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889Isn1016905
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9XBnFXGBmeYr88ojm2wcO7hWjCnRSWfP1E0HSc5a+g=; b=mPbNWXMhJIB1bhi+
	SKij4Hcmz4JORbUy7bwGxi3KJY/+t4JGgD6HzXlAAEHPTTssApfucuAqDPJwi2II
	N1rDHu8CzFGOQqHKI6eF4dbDNiQT25jWJEIEwKqWU0TirDKbYSWANZs/2T2BCvI0
	Kg9uRJgYeyk7i13NetjTPIAatSDzc22wyNHmZImgB7Df/YvYbohcidA44G5As0KV
	m91nklRxVxSdeWzUPK0cZYAa+kOMqufPNUqhctvDtrhYnLYc4ZHCro/s7IiSFZ5y
	Vs500sioapGS9OTfo5KdQbqtaa5tBH3KZRx8mnqmKHuipfw9ZdpkZ4Pv8UrerKC8
	IHPvFg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfvw9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:24:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-74910ab069bso1841526d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757345081; x=1757949881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9XBnFXGBmeYr88ojm2wcO7hWjCnRSWfP1E0HSc5a+g=;
        b=XBTch6ZC814aWI1joyZ6eGSCWQmTZWBfSR8hlJl+zKm/efltVX0nxaAfoxQoHlxSBi
         i0DHAyekrKDUvUXqoeVGftITqS22EVEANTqDWY8hfXzo+uMefizM9+wkRjGAhZajxpvt
         o4R2DlR4WkoEjO4k20kqErYYR0hv3wiZIFHAu6Xq6lRohLxMEfGXV+7UO4mAdPKsiIqN
         /0iWRqVjdNf9JnYtXinWDFGgZ6fgMa6/G8PQ/0eRTilAkHogRyO+QzAhmwZpnkfTEJzQ
         iSvIbT8fwwQwesxmR3Jrnwa2kDeJGYNRYCnQ+33P+IhqOH/bOTkbGI1IMDLHj+uoPk5d
         14Kw==
X-Gm-Message-State: AOJu0Ywz3Md55XigIZATz6c+1l50vdN7rBomxK8sTE49zf6bLLg1Y0Gi
	xYZGtjAGDonSVWSuJLHnZv8WCnnykyzwt1LkdO5/03tJtAnTrNf1Ejs9xPl3oUjNopi/NfAAM3s
	x8715T6gpsjPFRie9lzcJOP0HMvqtV2fnpQT6Nww6jDTOV9hfQcQEHT+wL2Q5+6j7YDu3
X-Gm-Gg: ASbGncta7C/+71tJccXQteTFI8sCkDtkotqLQ4Zd4dN4R8dpXVaDoo1wLlCmSpXQyJg
	taKW+pQcfrCL8Sk/evbIoYJNLwgg6TbwDrYsgis/t6tF2UAyHOaJQwmUYWMGHOlQBv8fPfxCGrL
	BLD2yNoJK9KRe75Fe0oaoLGEL6q1/Zd6HbFMI4uvWwZaYtOhrKfQlLpPpkfiTLQ3SN5QXNQtJSz
	GjfVMLEqc73w4EW2i17Xd6/h1yQ6jxc4/cRNmTGYc3KF5pwQYnaaggDNl0FOtcUiFJVmi2c5iFI
	SCWbRVK3ZVszImosFxjtkifPST3BItHcSdIdY9zwVnUYkUCH4BArsEJ1PsnecCuUvUNZhYnFye8
	Vo07Y+I+ga4IL/RXsVMpCHA==
X-Received: by 2002:ad4:5c62:0:b0:72a:df4a:e3 with SMTP id 6a1803df08f44-73946f70409mr55645176d6.8.1757345080638;
        Mon, 08 Sep 2025 08:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/dM+YUVzCoKCgc+8cdXvnS5qCmMcy7DhBINwLAE11WFETAeMMaRl0ZDxjjD0D4fmvZpBH8A==
X-Received: by 2002:ad4:5c62:0:b0:72a:df4a:e3 with SMTP id 6a1803df08f44-73946f70409mr55644876d6.8.1757345080079;
        Mon, 08 Sep 2025 08:24:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62778a094a0sm3537550a12.31.2025.09.08.08.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:24:39 -0700 (PDT)
Message-ID: <8cf65d78-2790-4467-a9b3-372af53c1374@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:24:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5tqMP6WfQg4lxDCI_pZ7Et_-Y5xJKo-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX/ocHkW7xg4g0
 MFUiEujnQ2Pwg6SrJQ8QwxNBbhI8A7oq+cxTwoBpbxJJVvL7imkvGLMJd0NI5057tqIr96FB0CQ
 K54vrgTvrdXLhH4DajPgyO0o01jcAv7vuHDvvHW68AglQNrRFkDlSURUMoti2uehWt1NDQyZmPn
 ftlRfYLtnEev6M/SSCpY0Z5/Ow/+qLbJ4ZKn/sfMsC2WxhdK6e+E6LTsRTP6t51bnF/P64ZEH0L
 Zcfq+BozA9+Dr13PytPsqHqDFtkMeERU6gkkNaP8tBNxIYjTvK6Tv8pi9jfn/81YpcSiVDrzDlS
 hbwBF+iu3+U2iQ+gOnPD7KE2UNgGyunBGoOD5G87KElW/TJ2AqxUqnmQ7qHVWQ1D4F9UZ8aiGw3
 NLiNOWK9
X-Proofpoint-GUID: 5tqMP6WfQg4lxDCI_pZ7Et_-Y5xJKo-n
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bef53a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=l1a4ANfPRBzC3aqxuR8A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On 9/8/25 10:27 AM, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>  			  ADRENO_QUIRK_HAS_HW_APRIV |
> -			  ADRENO_QUIRK_PREEMPTION,
> +			  ADRENO_QUIRK_PREEMPTION |
> +			  ADRENO_QUIRK_IFPC,
>  		.init = a6xx_gpu_init,
>  		.a6xx = &(const struct a6xx_info) {
>  			.hwcg = a740_hwcg,
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
>  		},
> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a730_protect,
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,

The latter one should be part of the last patch

Konrad

