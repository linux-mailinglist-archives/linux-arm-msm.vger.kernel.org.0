Return-Path: <linux-arm-msm+bounces-104591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cUdFCm3A7mnexQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:48:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7246C002
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A46C30015B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDB12594B9;
	Mon, 27 Apr 2026 01:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDDLvQgK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghOYsF+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88A1A073F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777254501; cv=none; b=RHgTRik1krgCQ7rxwoPY+PZRqNocCtkAoK+Y2SnAUkMSneHTn3t0ke15rPq1fr1BKMjMr8f4b6YyeqpN0a+kPcrzCCWC7t9O/bewjU/NBWYnwMLVQQctOsLolSRrdKgWOLicQ+NSa2kVTwL/d7hmK9Y7NhiWeFf05jIVCDeYfLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777254501; c=relaxed/simple;
	bh=h0nXLe7fp1GeMFOyDMdzTPzjqbNGtPgrjgwvfNhhbz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwEEZgwDv7TGDU39amyz+JRrL4sqyseRHhZi+AiCZcRiuzhwi6WCZCXNGzLgEh9OLN0zaeRXpIKn/o5s2cy03Ue8pOVKRhK7khNx6qEp/aeLQZnnqNV+hhmnC1FrXefaPxaCRRXogClGCValxOzZy6nfC+VA2QnTEmARFp0s1cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDDLvQgK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghOYsF+S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QIuaha3974632
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8GBD1a2LMejI0qpcrBvJat9tmGk0O5jJGPgElCnlm0=; b=JDDLvQgKjeLByiC0
	+MbdNXKomnjUXBqW8pQ6t0HF++Z9xzh0e2OZdve1qdbEG9GviviveuEpwy+Pk6TR
	+9oI85cNri2o02XuAUMJBcw1tCt1JlzLU7GsSgXRNqEwIjy13TvJiHTW5QJHFg5F
	K6FuZjpnhxATZaUTvJ+P/kdpaS9xSNa1rtC+49fXf/zVYukSqpUaIAVq4E5n3Q13
	OaEMMBT+0vdUojIcSIMD4hsOokuLvTkfh1/aa+PVsuK899JG/Zz5ZtrTwwlQsDUG
	wXvRsgjFdDX0yIxnw5rzU+wxpblnqlfCyvXan1miuwiblma8DEbhtYxMS9Ib0hJd
	hFcNkw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrkwcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:48:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adc527eaf5so74299135ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777254497; x=1777859297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8GBD1a2LMejI0qpcrBvJat9tmGk0O5jJGPgElCnlm0=;
        b=ghOYsF+SF+xTnbdRhC4yL5b0a3ZE0J20hrSfqZWOB1M9WV1YM9PtwFqtofEFhf4WEq
         HDuy/KJ5DS+ii1cxiJe0gCwQ2oYC+480rdF3VfC3nbm07Zjhg+PhIwtDxYeIDBtFCpRD
         O9Tse3fMwW8E35FgRRgWmCnNtqZqXKReGSW6Nl4/J+TzsnePTDUkugfSFTzG6QC9i3J7
         5PNwLYTbuQUK/7j1FAd5Tg1VIM8hcUiBOmYDU3wkwCwHzC25a/oX+7FJFai1x1SCdCZJ
         gqfoFt1wpEZ2ieZhDLfR65DaSgE9tG+GfPwX9cMF/hDWcDfUCTaLamlLqq7MsxhjCTHI
         DEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777254497; x=1777859297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8GBD1a2LMejI0qpcrBvJat9tmGk0O5jJGPgElCnlm0=;
        b=WnOka0YYxpwHlqVG4n+9Mt8CbI0m08/KYr5xHlphuc+1LtvQ6dZrip8UXL6JXlju9A
         k4wAoRY3A7lqysRhm76ktlGW4QMt39RzPGhFH7fvEKfewt3hKGSI/SIEmntJpa89W/Rn
         vzh7QoSobir8tSnNdjjCURJyt6JvcnNebF/gq0/Hvex1eH1ICOok5E4gBX31KN5mSHnK
         Il1cfA431XcwggcdLS8+5gydMlXWrCPY2ySVBdsPEcLEHdxQBVio+0CCU9Tq37LR7cey
         JsS9XGb/N9VlHSjpGaOguk2vW14c8a8EMA62M3oZNC0P96Ar0yQVQhLPvhQI+dyOhLLj
         4Seg==
X-Forwarded-Encrypted: i=1; AFNElJ9gQYX4DQzNL/rafJJRFHyKyJZ+N5fGBaQ8HPAo4aAXKHivU8ZuLBSq3Uce2RRTAWfvXjzpWrYxwjr/ZFxC@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEoTYS/14CCX+ldDrDsrZz/43Y2NKDStrFzq+ob5A4UcVqH7e
	2HHdkb7Xe8727khxMKP1B+g1s+pRFax/se423tB4A06H54X+So8FcsKTqHSJjLbscWa0wwY1K1D
	bffBttsH0gsS/rGZ/5T6KAqVS+lOgiCJqBEevl8Mwts3f8z0eUdNEwdd6MhqFfPMPUBVP
X-Gm-Gg: AeBDietyDeF7QgxqMkicJm/akBCC1vTv14Z2FzbXhR/1F/e/nKJ8LECb8BeQwfP6BTV
	xhExZg4JOTWC4n7bw1g1mfHkfo6SRfc8fS2I1BShDcEBQ4oDiGtM0zbK1lSE0OOlrKYLxa116sL
	oshjiir68vX65EOW/ISMrxJKhDM9f99isME7jlm9ZkOE0dz8vYazprg13/1HXla+ykOc0EjQVZH
	jM2f6DfCkc4mWMI84M55I5vImhB+iGehyHH+12JLjmAtaRgXFsKvYAEdPFO/rZSieXkTOhT8OpV
	6xZcjEkqra3aMwNBZp2JA0LRTXowTvl4ZGjh+xJTnniAdg4an5btoC0SQrd0RySE5UGkANzexhO
	FrEqbB19jSCP7v1gDHYBAiKh63lTTUkZ5qdSs2cRP6KmSkaO6FNE54z+ZOBGZl2yz2ZW33MPqVY
	2DJStHJD0NndUVsHjQ0Y8e
X-Received: by 2002:a17:903:1450:b0:2b7:a350:463f with SMTP id d9443c01a7336-2b7a3505063mr163890015ad.10.1777254497101;
        Sun, 26 Apr 2026 18:48:17 -0700 (PDT)
X-Received: by 2002:a17:903:1450:b0:2b7:a350:463f with SMTP id d9443c01a7336-2b7a3505063mr163889675ad.10.1777254496415;
        Sun, 26 Apr 2026 18:48:16 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0caf1sm304225505ad.42.2026.04.26.18.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2026 18:48:16 -0700 (PDT)
Message-ID: <1c99a162-475e-4d6c-af85-a16322d31476@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 09:48:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNyBTYWx0ZWRfX1rEHdkPKbXTe
 MLYzjO81U/Jc5PB2uXlSJfcuHboGU8FTK/R/WBN/tvSUyHI15Zto+IEeGyQ9nmsnfvTD+tYL7Me
 BWrwLZeThExb39BjpM+vOPLZn5O+7TDFq6WkMY+hFUCu+Kdmxfv9UKmxikRWGqbR1mhLllu1y7A
 POqcWQCX63G3zud1UzWFGSv8SS0zEFklhA0iwg0Nx7/IRLS99pVE3PD4ok2VS0sRy0vV1Q1z8G6
 vTkbXcQR3bPu72RpBlAHg02v1XqBYyH4uFtHb8TEjNQ/lFXm6tal44OkEluAokX/fSv6Kw8U82Z
 71xdwHvyoI3oQm+LjsOZkE/TWUD6WastwqGhxPvmXrpEVoIHTxsXLZKea2LA2FIgJXZY6r/klMR
 UDL8Bll0Od50yJ3pZyxsUANUt27rR//wGmZt5thVJGEyHpS1OFTuxjBiv2ieNnnH82u0RJqplde
 Fh6B/NLwiQp4Mf6/lNw==
X-Proofpoint-ORIG-GUID: UnGn_-aN_ilEx6cH45FqS_Qnhwm2uWVL
X-Proofpoint-GUID: UnGn_-aN_ilEx6cH45FqS_Qnhwm2uWVL
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69eec062 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aOqihR9C_jEbX6RSOTkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270017
X-Rspamd-Queue-Id: 0AC7246C002
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104591-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/26/2026 5:44 PM, Yingchao Deng wrote:
> Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
> structure with dynamically allocated bitmaps and arrays. This allows
> memory to be allocated based on the actual number of triggers during probe
> time, reducing memory footprint and improving scalability for platforms
> with varying trigger counts.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti-core.c   | 59 +++++++++++++++++-----
>   .../hwtracing/coresight/coresight-cti-platform.c   | 26 +++++++---
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 14 ++---
>   drivers/hwtracing/coresight/coresight-cti.h        | 12 ++---
>   4 files changed, 76 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 2f4c9362709a..4e7d12bd2d3e 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
>   
> -static void cti_set_default_config(struct device *dev,
> -				   struct cti_drvdata *drvdata)
> +static int cti_set_default_config(struct device *dev,
> +				  struct cti_drvdata *drvdata)
>   {
>   	struct cti_config *config = &drvdata->config;
>   	u32 devid;
> @@ -181,6 +181,26 @@ static void cti_set_default_config(struct device *dev,
>   		config->nr_trig_max = CTIINOUTEN_MAX;
>   	}
>   
> +	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +	if (!config->trig_in_use)
> +		return -ENOMEM;
> +
> +	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +	if (!config->trig_out_use)
> +		return -ENOMEM;
> +
> +	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
> +	if (!config->trig_out_filter)
> +		return -ENOMEM;
> +
> +	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
> +	if (!config->ctiinen)
> +		return -ENOMEM;
> +
> +	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
> +	if (!config->ctiouten)
> +		return -ENOMEM;
> +
>   	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
>   
>   	/* Most regs default to 0 as zalloc'ed except...*/
> @@ -189,6 +209,7 @@ static void cti_set_default_config(struct device *dev,
>   	config->enable_req_count = 0;
>   
>   	config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
> +	return 0;
>   }
>   
>   /*
> @@ -219,8 +240,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
>   	cti_dev->nr_trig_con++;
>   
>   	/* add connection usage bit info to overall info */
> -	drvdata->config.trig_in_use |= tc->con_in->used_mask;
> -	drvdata->config.trig_out_use |= tc->con_out->used_mask;
> +	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
> +		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
> +	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
> +		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
>   
>   	return 0;
>   }
> @@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>   {
>   	struct cti_trig_con *tc = NULL;
>   	struct cti_trig_grp *in = NULL, *out = NULL;
> +	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
> +	int n_trigs = drvdata->config.nr_trig_max;
>   
>   	tc = devm_kzalloc(dev, sizeof(struct cti_trig_con), GFP_KERNEL);
>   	if (!tc)
> @@ -242,12 +267,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
>   	if (!in)
>   		return NULL;
>   
> +	in->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
> +	if (!in->used_mask)
> +		return NULL;
> +
>   	out = devm_kzalloc(dev,
>   			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
>   			   GFP_KERNEL);
>   	if (!out)
>   		return NULL;
>   
> +	out->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
> +	if (!out->used_mask)
> +		return NULL;
> +
>   	tc->con_in = in;
>   	tc->con_out = out;
>   	tc->con_in->nr_sigs = in_sigs;
> @@ -263,7 +296,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>   {
>   	int ret = 0;
>   	int n_trigs = drvdata->config.nr_trig_max;
> -	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
>   	struct cti_trig_con *tc = NULL;
>   
>   	/*
> @@ -274,8 +306,8 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
>   	if (!tc)
>   		return -ENOMEM;
>   
> -	tc->con_in->used_mask = n_trig_mask;
> -	tc->con_out->used_mask = n_trig_mask;
> +	bitmap_fill(tc->con_in->used_mask, n_trigs);
> +	bitmap_fill(tc->con_out->used_mask, n_trigs);
>   	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
>   	return ret;
>   }
> @@ -288,7 +320,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   {
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *config = &drvdata->config;
> -	u32 trig_bitmask;
>   	u32 chan_bitmask;
>   	u32 reg_value;
>   	int reg_offset;
> @@ -298,18 +329,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
>   	   (trigger_idx >= config->nr_trig_max))
>   		return -EINVAL;
>   
> -	trig_bitmask = BIT(trigger_idx);
> -
>   	/* ensure registered triggers and not out filtered */
>   	if (direction == CTI_TRIG_IN)	{
> -		if (!(trig_bitmask & config->trig_in_use))
> +		if (!(test_bit(trigger_idx, config->trig_in_use)))
>   			return -EINVAL;
>   	} else {
> -		if (!(trig_bitmask & config->trig_out_use))
> +		if (!(test_bit(trigger_idx, config->trig_out_use)))
>   			return -EINVAL;
>   
>   		if ((config->trig_filter_enable) &&
> -		    (config->trig_out_filter & trig_bitmask))
> +		    test_bit(trigger_idx, config->trig_out_filter))
>   			return -EINVAL;
>   	}
>   
> @@ -687,7 +716,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>   	raw_spin_lock_init(&drvdata->spinlock);
>   
>   	/* initialise CTI driver config values */
> -	cti_set_default_config(dev, drvdata);
> +	ret = cti_set_default_config(dev, drvdata);
> +	if (ret)
> +		return ret;
>   
>   	pdata = coresight_cti_get_platform_data(dev);
>   	if (IS_ERR(pdata)) {
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index 4eff96f48594..557debbc8ca4 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
>   		goto create_v8_etm_out;
>   
>   	/* build connection data */
> -	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
> -	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
> +	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
> +	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
>   
>   	/*
>   	 * The EXTOUT type signals from the ETM are connected to a set of input
> @@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
>   		goto of_create_v8_out;
>   
>   	/* Set the v8 PE CTI connection data */
> -	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
> +	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
>   	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
>   	tc->con_in->sig_types[1] = PE_PMUIRQ;
> -	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
> +	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
>   	tc->con_out->sig_types[0] = PE_EDBGREQ;
>   	tc->con_out->sig_types[1] = PE_DBGRESTART;
>   	tc->con_out->sig_types[2] = PE_CTIIRQ;
> @@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
>   		goto of_create_v8_out;
>   
>   	/* filter pe_edbgreq - PE trigout sig <0> */
> -	drvdata->config.trig_out_filter |= 0x1;
> +	set_bit(0, drvdata->config.trig_out_filter);
>   
>   of_create_v8_out:
>   	return ret;
> @@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
>   	if (!err) {
>   		/* set the signal usage mask */
>   		for (idx = 0; idx < tgrp->nr_sigs; idx++)
> -			tgrp->used_mask |= BIT(values[idx]);
> +			set_bit(values[idx], tgrp->used_mask);
>   	}
>   
>   	kfree(values);
> @@ -316,23 +316,33 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
>   {
>   	struct cti_trig_grp *tg = NULL;
>   	int err = 0, nr_filter_sigs;
> +	int nr_trigs = drvdata->config.nr_trig_max;
>   
>   	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
>   						     CTI_DT_FILTER_OUT_SIGS);
>   	if (nr_filter_sigs == 0)
>   		return 0;
>   
> -	if (nr_filter_sigs > drvdata->config.nr_trig_max)
> +	if (nr_filter_sigs > nr_trigs)
>   		return -EINVAL;
>   
>   	tg = kzalloc_obj(*tg);
>   	if (!tg)
>   		return -ENOMEM;
>   
> +	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
> +	if (!tg->used_mask) {
> +		kfree(tg);
> +		return -ENOMEM;
> +	}
> +
>   	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
>   	if (!err)
> -		drvdata->config.trig_out_filter |= tg->used_mask;
> +		bitmap_or(drvdata->config.trig_out_filter,
> +			  drvdata->config.trig_out_filter,
> +			  tg->used_mask, nr_trigs);

The error may be silently ignored when a memory allocation error 
occured. I think it's better to add a log print to tell user what happened.

Thanks,
Jie

>   
> +	bitmap_free(tg->used_mask);
>   	kfree(tg);
>   	return err;
>   }
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 3fe2c916d228..2bbfa405cb6b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -719,12 +719,12 @@ static ssize_t trigout_filtered_show(struct device *dev,
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
>   	int nr_trig_max = cfg->nr_trig_max;
> -	unsigned long mask = cfg->trig_out_filter;
> +	unsigned long *mask = cfg->trig_out_filter;
>   
> -	if (mask == 0)
> +	if (bitmap_empty(mask, nr_trig_max))
>   		return 0;
>   
> -	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, mask);
>   }
>   static DEVICE_ATTR_RO(trigout_filtered);
>   
> @@ -931,9 +931,9 @@ static ssize_t trigin_sig_show(struct device *dev,
>   	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
> -	unsigned long mask = con->con_in->used_mask;
> +	unsigned long *mask = con->con_in->used_mask;
>   
> -	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>   }
>   
>   static ssize_t trigout_sig_show(struct device *dev,
> @@ -945,9 +945,9 @@ static ssize_t trigout_sig_show(struct device *dev,
>   	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
>   	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   	struct cti_config *cfg = &drvdata->config;
> -	unsigned long mask = con->con_out->used_mask;
> +	unsigned long *mask = con->con_out->used_mask;
>   
> -	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
> +	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
>   }
>   
>   /* convert a sig type id to a name */
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index c5f9e79fabc6..ef079fc18b72 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -68,7 +68,7 @@ struct fwnode_handle;
>    */
>   struct cti_trig_grp {
>   	int nr_sigs;
> -	u32 used_mask;
> +	unsigned long *used_mask;
>   	int sig_types[];
>   };
>   
> @@ -145,17 +145,17 @@ struct cti_config {
>   	int enable_req_count;
>   
>   	/* registered triggers and filtering */
> -	u32 trig_in_use;
> -	u32 trig_out_use;
> -	u32 trig_out_filter;
> +	unsigned long *trig_in_use;
> +	unsigned long *trig_out_use;
> +	unsigned long *trig_out_filter;
>   	bool trig_filter_enable;
>   	u8 xtrig_rchan_sel;
>   
>   	/* cti cross trig programmable regs */
>   	u32 ctiappset;
>   	u8 ctiinout_sel;
> -	u32 ctiinen[CTIINOUTEN_MAX];
> -	u32 ctiouten[CTIINOUTEN_MAX];
> +	u32 *ctiinen;
> +	u32 *ctiouten;
>   	u32 ctigate;
>   	u32 asicctl;
>   };
> 


