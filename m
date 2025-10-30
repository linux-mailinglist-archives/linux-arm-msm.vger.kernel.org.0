Return-Path: <linux-arm-msm+bounces-79766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3EC226BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 22:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 512174E103D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 21:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5958A2E1F1F;
	Thu, 30 Oct 2025 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB5i1vu0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NlM9Cnxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00191E834B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761859791; cv=none; b=ElWmjour8G10PghsplN2NbbJ7deItSjizwHvVEuj+b/g55YKQviZwQinnYsuwrZPYTzv/MQhyhyxRCmMlthtZnsN0vNz312ByUC3Nbm4JkxScuNZHIUV8OJ3jj2NQub5L1uifDk6rWtzWC01NbIoO8zkQ/F5AzdXOv1IqIfL890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761859791; c=relaxed/simple;
	bh=1VkUuFXgKh18q/VVXbawt/jZlRqLYdXeO4NSmx4UsGg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BaijAedZ6tK2WG54zUr9TedrA6LW7l9UBJ9jMZET4gjYyh9Tr/XKz1a97UTXwEdX+lxmQbAV2H1u8CTfwujSajXKt3gDlydOFM8E2qERut9RxElz6FkfxVkiHyRtzsVadAZhr48Oj0gv07eP0zWalQmbB/rJcdG4E2GeRFKH394=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB5i1vu0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NlM9Cnxj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKuo2o3808756
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=; b=nB5i1vu0NdPS2wPx
	eoVqkrmQogyhWYaOs20hxamRBiclaCE1rJP/ANv1/v66gfysCp87g8B0X6yAfDVG
	tBBv5x0wietJnBXQMZaMn+xUcUikSp7wzsR09UlMBuxFz7ND/5jjoxg8Ji1d/jeT
	f1Ibr1HMacj/mYR0bk+n+P1NWw0B9BteWOemHdm4KlMW5Q5M44k8dNVDXt1V22GI
	r3y0rOO2pK2Xb0sJsM+NII+umkQUahqhzai6A3uf06FGHWZAmDtd0rjjERqwrHIF
	bIpb3G5Bsy+ppJpefCSyQAhCKnYZ9nRwuiX2UaEG2P7WGW9N1d3H1MsaDyTm2JP2
	VIc9JA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vv9rdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:29:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a432101881so2720332b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761859787; x=1762464587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=;
        b=NlM9CnxjjNDe1SF1fGp1DJEAPcJzHpy+UnhI0wdzIMJb9R2bQS2EC0DViJonDgiLBQ
         KmJunZK1GIUO8n/96Fm8CdQuzlPSOqJ8wdp2yHeOML8AHpKKvWkD4jAvYfsa3+cKpQIN
         KUQPODJ7MlINsWVjoQ+N/SBq7Incm2nqsqkraGnehQ520ye3/th7jXx27UU//f1FVQeB
         RSr15TigsIwWbaKk8W3BWUw2YMq0LY1oYbUqOmzODtoSvm9mYoJcAXeH8zIWAkYyWVVA
         69wqsy4E2B5akWIGE0fxCQztNnePOsNOR9AO2x6gYEfpDQESBW6aayRV+0w8rrd6oxPy
         eVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761859787; x=1762464587;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzlUFB86mAlTUURMeKWMWkUk71VirJXlKOjLKibgrMs=;
        b=BaQ4p+dG1Kf4cyTAxEoSY/v1L/5MeK2189dPahwUo55T9ah4EPIwXN0TzIKJ2wdwAj
         oQAqWKTHuiMzY710QhKlHsaToB9xjaU8tMCzDwnItR9OA3NSb4T9S/nZHJ2ndOQ0EWGu
         iByQPxKvCrYGn4qZIVyiS3uHFPN+BfWaLhKWeZ9Fr2qu0Czv+gulrI1NKlNgCnyKi86/
         JzyFYVxgui3V7rbiWoduqutFTgO0CISebC7pG+IHwehZ7sPBMCAFAtTiks42/rHk+1jf
         JCQ/jNjhVodOk/aGFOvIvFX2nIxG+VqQ4nIKgCix21ZJSlvZ1ZWCEQXUU6Z+YVYR19Hg
         niOA==
X-Gm-Message-State: AOJu0YwjDyu5KllEL3v7tKYdzODT/NnGakmUR+bb+tYnEBnP8OdGLLOz
	5KOey3UBrxUHejI8G3QEWsm4ScgURv1xYsOxvR6p5mxFRMfdD2RbGNjRBroXEVaga/sA9MYdEJE
	GG6dJD3m0els+6JokketHAaHptXeU8+NB2vG3Z0UwQMISw7uJ1rgYOaTLi/KxG2OuWsrP
X-Gm-Gg: ASbGncsX46KRzKgR56ynkrFsTDY8xWxFqwlWkRMleaL35kmVASgT0eyeKslNwZi8mm5
	cqI+GpKiaxxeasvAodSH6urgtG4vD14tpF7dYmemZZsKfQZ4ibQCCfntgXto/qkfDlCKBEqdkQP
	3Tui8Xc0P+K2+qioQ57DLA14dvsEYf//6GX6wdU/LM2H7jB+Equi3bEHLDTFmLmneFdu+o3I13n
	27VNtghooLN3MomTOeV6sdqql9qqh+g6Ii3/v+JqX7yclzhnPYFjAb0at5w3MSx3uABXddpep7x
	SSNmwTu618v2Xar4TNmwiSorHC1ITk5PqKd9TfSto0e0/vX805ZqDpM0aKphL2fce6RauxxXTqT
	o+Kts4x4COwtQJ7EkjdToA7s=
X-Received: by 2002:a05:6a00:8d1:b0:7a2:7bdd:cbf4 with SMTP id d2e1a72fcca58-7a77a9ca32dmr956519b3a.27.1761859787069;
        Thu, 30 Oct 2025 14:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7gJS7A8SHkbq5oKF6sDj7A6I6fhFxuB0Lxorh9exZXB3/O9HNGHkmZRZA8yyMj7usEqcVoQ==
X-Received: by 2002:a05:6a00:8d1:b0:7a2:7bdd:cbf4 with SMTP id d2e1a72fcca58-7a77a9ca32dmr956495b3a.27.1761859786477;
        Thu, 30 Oct 2025 14:29:46 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.233.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012d13sm19972568b3a.9.2025.10.30.14.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:29:46 -0700 (PDT)
Message-ID: <c8058713-b126-461b-8ae6-19c4574a8105@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 02:59:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a
 driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xZaYbG9ba5t3z9zD0smX16NYNEyac0En
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6903d8cb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=rTtKBu4o5onlnI9juXDqsQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=ZJ4cUMe89lpGfuoIxrAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xZaYbG9ba5t3z9zD0smX16NYNEyac0En
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4MSBTYWx0ZWRfX9FSNU325NjzC
 u5JjWe/AfmrqKvAs/hddKiYcyA7rsWu4nuE9u5ZV+RXFrmdmDCFWuXJApbYO/5QbEKM5H/ebI2Q
 lFFT9I4yS7PneTUCc2iGuKQ3itoqjTwETmsUpPK4EqUzvpg3BY1nWVpqhWFmJs2NHU+jg0QIOrM
 nQGEGTsra7lHAZM4QS73BzNcC0PS0VLn2HOhb9IXYseAsZazuojOwP0DD4R85cG/LnRdje38juY
 8pCaPxYhdV74lEmlniKINBHjULOhoE+jun6vK1UBPLaUfXC6AaQNzL9ceBcKj9w8IHiogykU9za
 rkwI4BIgpoz4bR3KNHE4BnWwynZAwTLqHEdh2p8ymZEmD6k5ng+sktnH+M2vsdtPWDsl+Cv8IAb
 4Z17kHJImQku9TqsONF5QpB/18hqsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300181

On 10/22/2025 6:14 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
> 
> In order to fix this state and allow the GMU to be properly
> probed, let's add a proper driver for the GMU and add it to
> the MSM driver components.
> 
> Only the proper GMU has been tested since I don't have
> access to hardware with a GMU wrapper.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>  drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>  6 files changed, 192 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc62fef2fed8..6e7c3e627509 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1859,11 +1859,14 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
>  	pm_runtime_put(&gpu->pdev->dev);
>  }
>  
> -void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> +static void a6xx_gmu_unbind(struct device *dev, struct device *master, void *data)
>  {

I feel we should keep gmu and gmu_wrapper implementations separate. It
is already overloaded. How about adding a separate gmu_wrapper_bind_ops
and keep it in the match data?

> -	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct msm_drm_private *priv = dev_get_drvdata(master);
> +	struct msm_gpu *gpu = priv->gpu;

<< snip >>

>  static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>  {
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7e977fec4100..0618da7e8b40 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -998,18 +998,30 @@ static const struct of_device_id msm_gpu_match[] = {
>  	{ },
>  };
>  
> +static const struct of_device_id msm_gmu_match[] = {
> +	{ .compatible = "qcom,adreno-gmu" },
> +	{ .compatible = "qcom,adreno-gmu-wrapper" },
> +	{ },
> +};
> +
>  static int add_gpu_components(struct device *dev,
>  			      struct component_match **matchptr)
>  {
> -	struct device_node *np;
> +	struct device_node *np, *gmu;
>  
>  	np = of_find_matching_node(NULL, msm_gpu_match);
>  	if (!np)
>  		return 0;
>  
> -	if (of_device_is_available(np) && adreno_has_gpu(np))
> +	if (of_device_is_available(np) && adreno_has_gpu(np)) {
>  		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
>  
> +		gmu = of_find_matching_node(NULL, msm_gmu_match);

Instead of this, we can probably use the gmu phandle from "qcom,gmu"
property? That is quicker and also doesn't assume that there is only a
single GPU.

> +		if (of_device_is_available(gmu))
> +			drm_of_component_match_add(dev, matchptr, component_compare_of, gmu);
> +		of_node_put(gmu);
I think you missed the recently added headless support. Please check
separate_gpu_kms modparam and msm_gpu_probe().

-Akhil

> +	}
> +
>  	of_node_put(np);
>  
>  	return 0;
> 
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251022-topic-adreno-attach-gmu-to-driver-e47025fd7ebb
> 
> Best regards,

