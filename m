Return-Path: <linux-arm-msm+bounces-42565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2661E9F4E85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 15:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07CF47A4260
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46841F428F;
	Tue, 17 Dec 2024 14:52:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66CB1F4E3A;
	Tue, 17 Dec 2024 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447145; cv=none; b=b15hiPQjwHJbwC/EaEakYk8XZybGpWmVGDY1F0NwlVYjw8D0WjVX/+1FF5XmubhBLwNRdTi+9tB+YGCUGhnD6oQ4zfpf1hOTxfiWIfYsSj2l5MP+QPX5TTJW1VinnukdGLZwi7t1S2kNttiBF112VlYC/zca8MACQUn5QELVFz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447145; c=relaxed/simple;
	bh=HxBm0VKYt56BYQPamI5DUBpPW9jCoTQSAp4pWa3e7Nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or/j/Vx1EN87xDUp1MIGZWcmi3+phzza6QK6Wst8ZQXNq+WkYkz0XPfiSOF2kYFVx77CeCjGfsAfmPjm5k3zKf3baEutluMixV1SaEM2RXY6bWV6cV4mh0zXIgfyRruQWdB4aR8JIqkm3W6yRG+ZoHwxjaKi0Tg9Mxvkl1LYfr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F0ED1063;
	Tue, 17 Dec 2024 06:52:49 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CA4B3F528;
	Tue, 17 Dec 2024 06:52:20 -0800 (PST)
Message-ID: <065b4ad2-db39-42ed-91d1-d818f82ece79@arm.com>
Date: Tue, 17 Dec 2024 14:52:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] coresight-tpdm: Add MCMB dataset support
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Tao Zhang <quic_taozha@quicinc.com>
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
 <20241105123940.39602-2-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241105123940.39602-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 12:39, Mao Jinlong wrote:
> MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
> subunit TPDM has the same number and usage of registers as CMB
> subunit TPDM. MCMB subunit can be enabled for data collection by
> writing 1 to the first bit of CMB_CR register. The difference is
> that MCMB subunit TPDM needs to select the lane and enable it in
> using it.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c |  7 ++--
>   drivers/hwtracing/coresight/coresight-tpdm.c | 44 +++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-tpdm.h | 27 ++++++------
>   3 files changed, 57 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index bfca103f9f84..4b61b9840740 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <linux/amba/bus.h>
> @@ -68,11 +68,12 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   	int rc = -EINVAL;
>   	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
>   
> -	if (tpdm_has_dsb_dataset(tpdm_data)) {
> +	if (tpdm_data->dsb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
>   	}
> -	if (tpdm_has_cmb_dataset(tpdm_data)) {
> +
> +	if (tpdm_data->cmb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,cmb-element-bits", &drvdata->cmb_esize);
>   	}
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index b7d99e91ab84..0529858586c1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <linux/amba/bus.h>
> @@ -21,6 +21,21 @@
>   
>   DEFINE_CORESIGHT_DEVLIST(tpdm_devs, "tpdm");
>   
> +static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
> +{
> +	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
> +}
> +
> +static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
> +{
> +	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
> +}
> +
> +static bool tpdm_has_mcmb_dataset(struct tpdm_drvdata *drvdata)
> +{
> +	return (drvdata->datasets & TPDM_PIDR0_DS_MCMB);
> +}
> +
>   /* Read dataset array member with the index number */
>   static ssize_t tpdm_simple_dataset_show(struct device *dev,
>   					struct device_attribute *attr,
> @@ -198,7 +213,7 @@ static umode_t tpdm_cmb_is_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
> -	if (drvdata && tpdm_has_cmb_dataset(drvdata))
> +	if (drvdata && drvdata->cmb)
>   		return attr->mode;
>   
>   	return 0;
> @@ -246,8 +261,10 @@ static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
>   		drvdata->dsb->trig_type = false;
>   	}
>   
> -	if (drvdata->cmb)
> +	if (drvdata->cmb) {
>   		memset(drvdata->cmb, 0, sizeof(struct cmb_dataset));
> +		drvdata->cmb->trig_ts = true;

This looks like an unrelated change from the MCMB dataset. Is there an 
explanation ? Is this a mistake ? If it is intended, please make it a
separate patch.

> +	}
>   }
>   
>   static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
> @@ -388,7 +405,7 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
>   {
>   	u32 val, i;
>   
> -	if (!tpdm_has_cmb_dataset(drvdata))
> +	if (!drvdata->cmb)
>   		return;
>   
>   	/* Configure pattern registers */
> @@ -415,6 +432,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
>   		val |= TPDM_CMB_CR_MODE;
>   	else
>   		val &= ~TPDM_CMB_CR_MODE;
> +
> +	if (tpdm_has_mcmb_dataset(drvdata)) {
> +		val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
> +		/* Set the lane participates in tghe output pattern */

minor nit: typo "tghe" => "the"

> +		val |= FIELD_PREP(TPDM_CMB_CR_XTRIG_LNSEL,
> +			drvdata->cmb->mcmb.trig_lane);
> +
> +		/* Set the enablement of the lane */
> +		val &= ~TPDM_CMB_CR_E_LN;
> +		val |= FIELD_PREP(TPDM_CMB_CR_E_LN,
> +			drvdata->cmb->mcmb.lane_select);
> +	}
> +
>   	/* Set the enable bit of CMB control register to 1 */
>   	val |= TPDM_CMB_CR_ENA;
>   	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
> @@ -480,7 +510,7 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
>   {
>   	u32 val;
>   
> -	if (!tpdm_has_cmb_dataset(drvdata))
> +	if (!drvdata->cmb)
>   		return;
>   
>   	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
> @@ -542,12 +572,14 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
>   		if (!drvdata->dsb)
>   			return -ENOMEM;
>   	}
> -	if (tpdm_has_cmb_dataset(drvdata) && (!drvdata->cmb)) {
> +	if ((tpdm_has_cmb_dataset(drvdata) || tpdm_has_mcmb_dataset(drvdata))
> +			&& (!drvdata->cmb)) {
>   		drvdata->cmb = devm_kzalloc(drvdata->dev,
>   						sizeof(*drvdata->cmb), GFP_KERNEL);
>   		if (!drvdata->cmb)
>   			return -ENOMEM;
>   	}
> +
>   	tpdm_reset_datasets(drvdata);
>   
>   	return 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index e08d212642e3..fd9153b92335 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef _CORESIGHT_CORESIGHT_TPDM_H
> @@ -9,7 +9,7 @@
>   /* The max number of the datasets that TPDM supports */
>   #define TPDM_DATASETS       7
>   
> -/* CMB Subunit Registers */
> +/* CMB/MCMB Subunit Registers */
>   #define TPDM_CMB_CR		(0xA00)
>   /* CMB subunit timestamp insertion enable register */
>   #define TPDM_CMB_TIER		(0xA04)
> @@ -34,6 +34,10 @@
>   #define TPDM_CMB_TIER_XTRIG_TSENAB	BIT(1)
>   /* For timestamp fo all trace */
>   #define TPDM_CMB_TIER_TS_ALL		BIT(2)
> +/* MCMB trigger lane select */
> +#define TPDM_CMB_CR_XTRIG_LNSEL		GENMASK(20, 18)
> +/* MCMB lane enablement */
> +#define TPDM_CMB_CR_E_LN		GENMASK(17, 10)

Please could you move the CMB_CR related defintions together ?
i.e., closer to TPDM_CMB_CR_MODE

Suzuki

>   
>   /* Patten register number */
>   #define TPDM_CMB_MAX_PATT		2
> @@ -112,11 +116,13 @@
>    * PERIPHIDR0[0] : Fix to 1 if ImplDef subunit present, else 0
>    * PERIPHIDR0[1] : Fix to 1 if DSB subunit present, else 0
>    * PERIPHIDR0[2] : Fix to 1 if CMB subunit present, else 0
> + * PERIPHIDR0[6] : Fix to 1 if MCMB subunit present, else 0
>    */
>   
>   #define TPDM_PIDR0_DS_IMPDEF	BIT(0)
>   #define TPDM_PIDR0_DS_DSB	BIT(1)
>   #define TPDM_PIDR0_DS_CMB	BIT(2)
> +#define TPDM_PIDR0_DS_MCMB	BIT(6)
>   
>   #define TPDM_DSB_MAX_LINES	256
>   /* MAX number of EDCR registers */
> @@ -256,6 +262,9 @@ struct dsb_dataset {
>    * @patt_ts:          Indicates if pattern match for timestamp is enabled.
>    * @trig_ts:          Indicates if CTI trigger for timestamp is enabled.
>    * @ts_all:           Indicates if timestamp is enabled for all packets.
> + * struct mcmb_dataset
> + * @mcmb_trig_lane:       Save data for trigger lane
> + * @mcmb_lane_select:     Save data for lane enablement
>    */
>   struct cmb_dataset {
>   	u32			trace_mode;
> @@ -267,6 +276,10 @@ struct cmb_dataset {
>   	bool			patt_ts;
>   	bool			trig_ts;
>   	bool			ts_all;
> +	struct {
> +		u8		trig_lane;
> +		u8		lane_select;
> +	} mcmb;
>   };
>   
>   /**
> @@ -324,14 +337,4 @@ struct tpdm_dataset_attribute {
>   	enum dataset_mem mem;
>   	u32 idx;
>   };
> -
> -static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
> -{
> -	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
> -}
> -
> -static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
> -{
> -	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
> -}
>   #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */


