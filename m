Return-Path: <linux-arm-msm+bounces-78355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACDABFCCFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F4E43A31B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAEC34B43B;
	Wed, 22 Oct 2025 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VesLKiOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E42634845D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146013; cv=none; b=Ep+65bI0myCHrrr52rRIQaAAO5LCrw5s1NAh7gEB4gCbCcdiJFZjsYGlg5+X+cRbo+0EPF4FKHgfKnCM3YbxdTOn1tLnh3nlCE6eTJg9KVyjGQk4M9uOaAorVkQlTanfYyacuC8rJfnvXiAjaToV2TUK8pYeeXV210TW8voh0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146013; c=relaxed/simple;
	bh=2ovnrrkNxN1AfFLOidZK7o+t/WuyEwDsv4AO1qXtgkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmL+sM+rNWoLVbAJ3JCmmTfbWv1omJVy9QYjz4cWoEs5BmJUIV4XcOU+lAjJG6LewzE41eLCvJTYokAxzMBpDuMYvaBYBHgXy33qCksBfifSZXPM94T3BDF0sRsSZ+DxcjHDb3ofrFOD/bG/VEx8KsEx7lQ7Yw2V+eajYSGSOGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VesLKiOR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M8i1xC003553
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AtOPiC6l9BljB6aQ9rnOst9XuL/E0zhfUfs2IkZsLyo=; b=VesLKiORCVMrQ7GS
	14L63ABO0Np/2mo+V3ZHRiAAcI5h6Qo2xbbMhqTOTHZzUol66uQ+RzffZYpA7/ra
	zAUo4MmZUiRwNnuF+JdbcWeXK/i+KJhUYfg6+mJjSF1o4vebYWuFAgFCg+zYlwpL
	wk1L6Dd4gyCkGlPizScFg0RYu/erxPBtU/LtV/3IrsC42Djkr0BR2FWOPIEsTGtP
	hC55ihaIUhzZmCmm0MczwdGSLUkv4BWeo+WdoXLwIp9t4siyvXmD0OfHYiSfYtsj
	0UxAzp1nJPotu4qrBl/CCwrF1PVaDwAIVE0b1ka+e3353q131VRCRS9TeT7ZFdmF
	HvQ3/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsapfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:13:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e887bef16aso4027621cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146009; x=1761750809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtOPiC6l9BljB6aQ9rnOst9XuL/E0zhfUfs2IkZsLyo=;
        b=YuM/+WLgTM1GVo8dnnxUr5W7uXSxdWXQaPYWB3n0YSGAPNs4zbUE88oJiPy2ovO7cG
         8IMNLVDWLP0vPCeQMv18BbY22qV84LP9LrTJc15l1HYTHFGEcXTmpyhMhaQia8Z0mfo1
         yOahycC5S9RwJ89lZYjPK8l3qfR2+c3DR6e2uP4BqzPn/TCfdF94AFCtRiH0hnCNg9Qx
         0AqhcSql/3YyS+pHPciwE+VQdrnjnA4SDQt5DgzRX0IMPySs0gY4oOTRY50IeXiHeVAI
         6DuGpcN10QB/mtT0ANSClUTaz8ZVasUROaFsAOXBwXBmro/+EUnT9/8XUJKjEsaNlXn0
         gVNg==
X-Gm-Message-State: AOJu0Yw8sn8ibgeWLYYREJYDdv4CMussUgRzmIC6Q8xNsBIeSDjkhshC
	PlDT6Cw8DBtHDmtmvJiRSlhYsSjlUETI+30R4rrRCop57oHRyaSBpmWKbs6z4F5kcLxQTsv9oZ7
	sYjWyVwGyGCrwvTYyi8c5ntbV94rNHTV1TmiTGW+DCEJOGBPch4UpfLmd0hv5mFLB1Zdw
X-Gm-Gg: ASbGnctinm2Vde393zwidCM/E2stCGVJfyUkpEe/mm/BuQdbO/DB38QUWfWRDOTy0WR
	QlWlhppXT43uj1iDbXlt/TdiKP7b0NxOfM7KUaa+5SeFigoLcExbTVYIIaSmX7Q331tzKUzO3jl
	9LFih651v9EL9HPU8iphhOpvMNl8L2OCQCE869EMDHOViMeKl655ga3DTzYT5wWdao2/pQuzndv
	vFSqnS7f7H2XbfRCHgVOrBwuy+LmAeyJ+A3M5A/0LHCMmZWqmeuTE1IlCT/58U514uUxNl56YL7
	tphckNvf1H6kJssyiQZl0aHemFbt6DkD55sOi+0gu7X+rwU+8cKHW9KonDV4jsQYfL4wMC+eMUm
	OP6wKm0vly5j7el4gWfVrtxoLMdgJBTPx8PnFwkJxot0B6/aEvYpiuJOU
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr61450121cf.10.1761146008818;
        Wed, 22 Oct 2025 08:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEierfzFT+Ehux93IgCTLHvl2L0VFHL4qLUlUPHsnWhN8MQCEyk8V77qdJ6+vl24wozTMkFJw==
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr61449171cf.10.1761146008174;
        Wed, 22 Oct 2025 08:13:28 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036846sm1378295966b.54.2025.10.22.08.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:13:27 -0700 (PDT)
Message-ID: <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:13:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX/rrwaimZkfWr
 VnYqTAyj0fBjnpb4KikQZigK090Akn2lFzYTRsP28L/gDP5spxrw1Ng0V8ddXm/3GMK1WHwWFrj
 IOpELE+0tStxfwraBhDHViyZKEZfzhrIArzzUgwxnl1HFcsN0II+8Pm9OphfThiuesTyYFpmzdX
 2Ur3SDZqYcX/dqB9BySIzu2j+m1zj8y01E6vWMZGH0KbNehBT+miuuztAqBsga9Ow7441HUvoHR
 t8LCFew1EjvsxYdTyFeP14qVb2lmntsZSvD6JputzGnVbedjXjIaQaqfue/87mFoQ5/fFpR7s9j
 yXt5IhCKLJP4VqmyrzdE7wdqvytCkYk9xO8ymgXlIU2H6irOWY2mz5heOLIe/WjPfekXZlwB+8T
 T53vkvSdhzGbkOouYgonYx5exgZRng==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f8f49a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NFg73xRieO-LzbxsZPIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: U1tlOrUwGGC1tItlL6GyYc6Terf1NH34
X-Proofpoint-ORIG-GUID: U1tlOrUwGGC1tItlL6GyYc6Terf1NH34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> of A615 GPU.
> 
> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> which is a small state machine which helps to toggle GX GDSC
> (connected to CX rail) to implement IFPC feature. It doesn't support
> any other features of a full fledged GMU like clock control, resource
> voting to rpmh etc. So we need linux clock driver support like other
> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
> This patch skips RGMU core initialization and act more like a
> gmu-wrapper case.
> 
> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_oob_bits[] = {
>  /* Trigger a OOB (out of band) request to the GMU */
>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>  {
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	int ret;
>  	u32 val;
>  	int request, ack;
>  
>  	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
>  
> +	/* Skip OOB calls since RGMU is not enabled */

"RGMU doesn't handle OOB calls"

[...]

> +int a6xx_rgmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(node);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	int ret;
> +
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	gmu->dev = &pdev->dev;
> +
> +	ret = of_dma_configure(gmu->dev, node, true);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_enable(gmu->dev);
> +
> +	/* Mark legacy for manual SPTPRAC control */
> +	gmu->legacy = true;
> +
> +	/* RGMU requires clocks */
> +	ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
> +	if (ret < 1)
> +		return ret;

Simply add this clock detail to a6xx_gmu_wrapper_init and use _optional

[...]

>  	/* Enable fault detection */
>  	if (adreno_is_a730(adreno_gpu) ||
> -	    adreno_is_a740_family(adreno_gpu))
> +	    adreno_is_a740_family(adreno_gpu) || adreno_is_a612(adreno_gpu))

Sorting this would be neat

[...]

> +static int a6xx_rgmu_pm_resume(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	unsigned long freq = gpu->fast_rate;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	gpu->needs_hw_init = true;
> +
> +	trace_msm_gpu_resume(0);
> +
> +	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	dev_pm_opp_put(opp);
> +
> +	/* Set the core clock and bus bw, having VDD scaling in mind */
> +	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> +
> +	pm_runtime_resume_and_get(gmu->dev);
> +	pm_runtime_resume_and_get(gmu->gxpd);
> +
> +	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
> +	if (ret)
> +		goto err_bulk_clk;

Add this as-is to a6xx_pm_resume(), nr_clocks==0 is valid, similarly
for _suspend

Konrad

