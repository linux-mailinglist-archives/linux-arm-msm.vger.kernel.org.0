Return-Path: <linux-arm-msm+bounces-41846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 289B79EFCD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 20:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A38E1886C9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7FE1A01B9;
	Thu, 12 Dec 2024 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzlgFAK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE8D189BBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734033317; cv=none; b=t5hWB9ssX/F3NRz7smoDqewq+6uGWt1AT2tBxWm4sS78eZUC2KEfQ6cTPP4rkjeaxLZVtkfxLAAL5+EBiR2bFNkEoefEox3dlaPK2NkTD2VJAkGE87o9vFRPOpKgdDTjIDqYwwFDfpK6EZqyxriYXwX/rDT0F/UeH1Zv4dePxvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734033317; c=relaxed/simple;
	bh=4Xk0iuSuUcACy1SkPzsDgJfFobNYaYnbcTp17a02bNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZh9CQ5fes4xKq7ayM//XkwJoW8FTD11GF+rh2CSaN0oH7LJO/+H2s/8KivV6GWWL04i1ZyE7UHm4x9lYCzy0VchhRfMTr8TgqDLgxbe5bNvu3N8+6ds899C3ZVH1Nzatw9sZd1TOu0e7sB14Or+rMU/gLdZeDyIf0VuPfs+qqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzlgFAK9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCG9WhZ030098
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 19:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhgiumrxiM7n/En/vNa/ikofuwRr79X7+UFWSDfUsGI=; b=OzlgFAK90iTRsPl3
	1EIm/Bw2dZW2JEfcXYGB82FHlB0eTIlv5uEoHQ83G0Go+d5HNpcpsiIgeKMyYQt1
	KgRicLNBO/SxKC4z6fdwgxYIE/DeBDfYVa50g1DouqhxlMQJB/NmB8+vfaAZ11As
	mkthpASPywnF3kDeh2RMdUufizXIvSyOGGhiW4FR+m69Mq1PxWlyUU2AaU6uNxwU
	YDWvfIEWi8PXjVD1EG13pDsqOoBN9ph0ejJWzjr0gRwK/9xNQo+DzHMWqufA1waX
	D7jD5AQ7aRBMgn0ohboOWPILpIWgmN70JWy7f/Knk810501zQntq7weHTbEhBVnb
	Ieuz2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw4cg8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 19:55:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f8762a69so2033616d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 11:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734033313; x=1734638113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FhgiumrxiM7n/En/vNa/ikofuwRr79X7+UFWSDfUsGI=;
        b=wHIZd3LBodb7h45zkLO+EUj6lHw75zLvNJKZnc/3GsKg03V1IjS2zEJVK6aweV4QgY
         xXuRwsR4tQVL0+uQMpBTZeI0EOGru+RjVhrietqeZJdiknimUst/9QgUB5ZhKbCgCDg0
         y7dA0uaBMA9ry7qMZqjmrrf0vN0YJGo/EU25+CIFeJWgyR5iFWX/yqx44YUmIoc2v5rh
         M5E7pIbuhvzDN1YvkZfN7Lg/viq2MwKPCCsfghxRxf/q3JBV8MVxGl5v0Ji3HIMsKaZ7
         vGjtNL9HKsbuuKQrZzDFRWsJbHtrrKqtn8jI9PKS8bO+Rpx9W7kenVy7935YOzUZ4rbr
         UyPg==
X-Gm-Message-State: AOJu0Ywhr31X84qqrKLceWR+JAZ3ACxR+pxDIykq5KBAjrBz7l6bCQNN
	YOtYATgJMYpj3YKfSe8N7QCkl/iHuvTwW0/ifphF8jkTWABddlCKzSfQi6FQIRA9uLc0X0Knmwl
	NLs2km7za9WTsazQbFzXcAY44uUukbpf42HU78W72+css5W+z9gJeJT7Y01QqLwR9WDsho3Q6
X-Gm-Gg: ASbGncsIdxDVtBnqDHEqKo+RJd56cMYRxbpgY5T08iyLzXvRPvX03ezXHuB5rZkHhff
	V9mFXPN7YRUSv+C+8UdtPjERc6/am/McZpKZD78hXlFkNaWcuoDxfoEhdYhbmme3lNDz6s3SqoG
	rBk2a3MCrunF5Mrk73cMRPZVNIcgUtLuuqTYfQTf76usGWI1Q0p/cHt0yXf3/vZg7ayqkHbTczE
	lHkYq6JpT72QNGtC+tAWkd8cxqrh1+35r3okLw8I5+lHd5pnu5yAjDc1/wYFEooCk79mj05tjDZ
	lNiY0EpTO8ao7rX0KN0kK6JL67mmef1jnGuGlA==
X-Received: by 2002:a05:6214:2527:b0:6d8:f750:b2f1 with SMTP id 6a1803df08f44-6db0f833ae5mr8033386d6.11.1734033313182;
        Thu, 12 Dec 2024 11:55:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjTsRrIxl4jM8Aw3TRdwR13Fi0Jt/svjVNrvUPTFZaAFCRmzkg7Yfxtsyp/ej45ehVuNN9Xg==
X-Received: by 2002:a05:6214:2527:b0:6d8:f750:b2f1 with SMTP id 6a1803df08f44-6db0f833ae5mr8033156d6.11.1734033312773;
        Thu, 12 Dec 2024 11:55:12 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm550614466b.45.2024.12.12.11.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 11:55:12 -0800 (PST)
Message-ID: <3aad9de3-76a5-4106-a513-4707b3e39e7a@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 20:55:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
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
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-2-6112f9f785ec@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-2-6112f9f785ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vsIkJVi3PG_7RSrDPLl6vz-rl6u2VJ1O
X-Proofpoint-GUID: vsIkJVi3PG_7RSrDPLl6vz-rl6u2VJ1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120144

On 11.12.2024 9:29 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> While scaling via the interconnect path was sufficient, newer GPUs
> like the A750 requires specific vote paremeters and bandwidth to
> achieve full functionality.
> 
> In order to calculate vote values used by the GPU Management
> Unit (GMU), we need to parse all the possible OPP Bandwidths and
> create a vote value to be sent to the appropriate Bus Control
> Modules (BCMs) declared in the GPU info struct.
> 
> This vote value is called IB, while on the other side the GMU also
> takes another vote called AB which is a 16bit quantized value
> of the floor bandwidth against the maximum supported bandwidth.
> The AB vote will be calculated later when setting the frequency.
> 
> The vote array will then be used to dynamically generate the GMU
> bw_table sent during the GMU power-up.
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 144 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  13 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>  3 files changed, 158 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 14db7376c712d19446b38152e480bd5a1e0a5198..36696d372a42a27b26a018b19e73bc6d8a4a5235 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <soc/qcom/cmd-db.h>
> +#include <soc/qcom/tcs.h>
>  #include <drm/drm_gem.h>
>  
>  #include "a6xx_gpu.h"
> @@ -1287,6 +1288,101 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>  	return 0;
>  }
>  
> +/**
> + * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
> + * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
> + * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
> + * @vcd: virtual clock domain that this bcm belongs to
> + * @reserved: reserved field
> + */
> +struct bcm_db {
> +	__le32 unit;
> +	__le16 width;
> +	u8 vcd;
> +	u8 reserved;
> +};

No. This is a direct copypasta of drivers/interconnect/qcom/icc-rpmh.h
You cannot just randomly duplicate things..

Move it out to a shared header in include/ (and remove the duplicate from
clk-rpmh.c while at it)


I'd also really prefer if you took

drivers/interconnect/qcom/bcm-voter.c : tcs_list_gen()

and abstracted it to operate on struct bcm_db with any additional
required parameters passed as arguments.. Still left some comments
on this version if you decide to go with it

> +
> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
> +				       struct a6xx_gmu *gmu)
> +{
> +	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
> +	unsigned int bcm_index, bw_index, bcm_count = 0;
> +
> +	if (!info->bcms)
> +		return 0;

You already checked that from the caller

> +
> +	/* Retrieve BCM data from cmd-db */
> +	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
> +		size_t count;
> +
> +		/* Stop at first unconfigured bcm */
> +		if (!info->bcms[bcm_index].name)
> +			break;

Unconfigured doesn't really fit here.. Maybe just mention the list is NULL
-terminated

> +
> +		bcm_data[bcm_index] = cmd_db_read_aux_data(
> +						info->bcms[bcm_index].name,
> +						&count);
> +		if (IS_ERR(bcm_data[bcm_index]))
> +			return PTR_ERR(bcm_data[bcm_index]);
> +
> +		if (!count)
> +			return -EINVAL;

If this condition ever happens, it'll be impossible to track down,
please add an err message

> +
> +		++bcm_count;

I've heard somewhere that prefixed increments are discouraged for
"reasons" and my OCD would like to support that

> +	}
> +
> +	/* Generate BCM votes values for each bandwidth & BCM */
> +	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
> +		u32 *data = gmu->gpu_ib_votes[bw_index];
> +		u32 bw = gmu->gpu_bw_table[bw_index];
> +
> +		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
> +		for (bcm_index = 0; bcm_index < bcm_count; bcm_index++) {
> +			bool commit = false;
> +			u64 peak;
> +			u32 vote;
> +
> +			/* Skip unconfigured BCM */
> +			if (!bcm_data[bcm_index])
> +				continue;

I don't see how this is useful here

> +
> +			if (bcm_index == bcm_count - 1 ||
> +			    (bcm_data[bcm_index + 1] &&
> +			     bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
> +				commit = true;
> +
> +			if (!bw) {
> +				data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
> +				continue;
> +			}
> +
> +			if (info->bcms[bcm_index].fixed) {

You may want to take a pointer to info->bcms[bcm_index]

> +				u32 perfmode = 0;
> +
> +				if (bw >= info->bcms[bcm_index].perfmode_bw)
> +					perfmode = info->bcms[bcm_index].perfmode;
> +
> +				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
> +				continue;
> +			}
> +
> +			/* Multiply the bandwidth by the width of the connection */
> +			peak = (u64)bw * le16_to_cpu(bcm_data[bcm_index]->width);
> +			do_div(peak, info->bcms[bcm_index].buswidth);
> +
> +			/* Input bandwidth value is in KBps, scale the value to BCM unit */
> +			peak *= 1000ULL;

I don't think this needs to be ULL since the other argument is an u64

> +			do_div(peak, le32_to_cpu(bcm_data[bcm_index]->unit));
> +
> +			vote = clamp(peak, 1, BCM_TCS_CMD_VOTE_MASK);
> +
> +			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);

x is the avg vote, y is the peak vote

Just noting down for my future self I guess, a6xx sets ab=0,
a7xx sets ab=ib like you did here

Konrad

