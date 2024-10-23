Return-Path: <linux-arm-msm+bounces-35578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719369AC6AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 11:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927FA1C20F29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47D617BEB8;
	Wed, 23 Oct 2024 09:33:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C800514F9ED;
	Wed, 23 Oct 2024 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729676022; cv=none; b=HzRqFomn5mZHaxo5Po6R6JUyvhRRDPEozlRuXH41YC/UwkfjfS/OhbOUvyXhVhhxZlntZFyqK/XnGzrzier7Z1B3hjO1zN9ABMQDU06JFIH8c/2HzW8dBbgx94mZ7WXsSw3oatLpbQ/32WqQqiP3x+Ejb9n09k+Z5If+VCP2kOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729676022; c=relaxed/simple;
	bh=aVZas9W7uRbdTvkTd5Bq3L2seAifoKKGuw+MSM3dcjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lz64wdX3T1GIBajquhX20qz2LTiRuCSi5lf1X934VvdeLgo6Q1Kxrja9nI3nfCV01aKdfH+tI3cCg5yUn7CFrQPnvnDAPetX8MP1afGjJcd+mADOV0sLINr7vdtLU8xqNnAUvqORUGlR5UJOtt8oLNX6FvV/GuLsnvtJYKN7p/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8EFA339;
	Wed, 23 Oct 2024 02:34:08 -0700 (PDT)
Received: from [10.57.66.28] (unknown [10.57.66.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4E933F71E;
	Wed, 23 Oct 2024 02:33:37 -0700 (PDT)
Message-ID: <111ddb4d-4765-4acd-82ba-efe25b3c4470@arm.com>
Date: Wed, 23 Oct 2024 10:33:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 1/3] coresight-tpdm: Add MCMB dataset support
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Tao Zhang <quic_taozha@quicinc.com>
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
 <20241011064732.8480-2-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241011064732.8480-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 07:47, Mao Jinlong wrote:
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
>   drivers/hwtracing/coresight/coresight-tpda.c |  5 ++-
>   drivers/hwtracing/coresight/coresight-tpdm.c | 41 +++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-tpdm.h | 26 ++++++++++++-
>   3 files changed, 63 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index bfca103f9f84..e063a31ff88a 100644
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
> @@ -72,7 +72,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
>   	}
> -	if (tpdm_has_cmb_dataset(tpdm_data)) {
> +
> +	if (tpdm_has_cmb_dataset(tpdm_data) || tpdm_has_mcmb_dataset(tpdm_data)) {

minor nit: All such places could be replaced by

if (tdpm_data->cmb)

Because at probe time we allocate the above structure ?


>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,cmb-element-bits", &drvdata->cmb_esize);
>   	}
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 0726f8842552..58f8c3e804c1 100644
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
> @@ -198,7 +198,8 @@ static umode_t tpdm_cmb_is_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
> -	if (drvdata && tpdm_has_cmb_dataset(drvdata))
> +	if (drvdata && (tpdm_has_cmb_dataset(drvdata) ||
> +			tpdm_has_mcmb_dataset(drvdata)))

	if (drvdata && drvdata->cmb) ?

>   		return attr->mode;
>   
>   	return 0;
> @@ -246,8 +247,10 @@ static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
>   		drvdata->dsb->trig_type = false;
>   	}
>   
> -	if (drvdata->cmb)
> +	if (drvdata->cmb) {
>   		memset(drvdata->cmb, 0, sizeof(struct cmb_dataset));
> +		drvdata->cmb->trig_ts = true;
> +	}
>   }
>   
>   static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
> @@ -388,7 +391,8 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
>   {
>   	u32 val, i;
>   
> -	if (!tpdm_has_cmb_dataset(drvdata))
> +	if (!(tpdm_has_cmb_dataset(drvdata) ||
> +		tpdm_has_mcmb_dataset(drvdata)))

	if (!drvdata->cmb)

>   		return;
>   
>   	/* Configure pattern registers */
> @@ -415,6 +419,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
>   		val |= TPDM_CMB_CR_MODE;
>   	else
>   		val &= ~TPDM_CMB_CR_MODE;
> +
> +	if (tpdm_has_mcmb_dataset(drvdata)) {
> +		val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
> +		/*Set the lane participates in tghe output pattern*/

minor nit: Leave a single space after '/*' and before '*/'

> +		val |= FIELD_PREP(TPDM_CMB_CR_XTRIG_LNSEL,
> +			drvdata->cmb->mcmb->mcmb_trig_lane);
> +
> +		/* Set the enablement of the lane */
> +		val &= ~TPDM_CMB_CR_E_LN;
> +		val |= FIELD_PREP(TPDM_CMB_CR_E_LN,
> +			drvdata->cmb->mcmb->mcmb_lane_select);
> +	}
> +
>   	/* Set the enable bit of CMB control register to 1 */
>   	val |= TPDM_CMB_CR_ENA;
>   	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
> @@ -474,7 +491,8 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
>   {
>   	u32 val;
>   
> -	if (!tpdm_has_cmb_dataset(drvdata))
> +	if (!(tpdm_has_cmb_dataset(drvdata) ||
> +		tpdm_has_mcmb_dataset(drvdata)))

	if (!drvdata->cmb) ?

>   		return;
>   
>   	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
> @@ -541,6 +559,19 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
>   		if (!drvdata->cmb)
>   			return -ENOMEM;
>   	}
> +
> +	if (tpdm_has_mcmb_dataset(drvdata) && (!drvdata->cmb)) {
> +		drvdata->cmb = devm_kzalloc(drvdata->dev,
> +						sizeof(*drvdata->cmb), GFP_KERNEL);
> +		if (!drvdata->cmb)
> +			return -ENOMEM;
> +		drvdata->cmb->mcmb = devm_kzalloc(drvdata->dev,
> +						sizeof(*drvdata->cmb->mcmb),
> +						GFP_KERNEL);

Please avoid this ^^, instead embed the fields in drvdata as mentioned
below.

Is it possible that both CMB and MCMB can be present on the same TPDM ?
If so, we need to be careful about ^ block ?


> +		if (!drvdata->cmb->mcmb)
> +			return -ENOMEM;
> +	}
> +
>   	tpdm_reset_datasets(drvdata);
>   
>   	return 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index e08d212642e3..2e84daad1a58 100644
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
> @@ -245,6 +251,16 @@ struct dsb_dataset {
>   	bool			trig_type;
>   };
>   
> +/**
> + * struct mcmb_dataset
> + * @mcmb_trig_lane:       Save data for trigger lane
> + * @mcmb_lane_select:     Save data for lane enablement
> + */
> +struct mcmb_dataset {
> +	u8		mcmb_trig_lane;
> +	u8		mcmb_lane_select;
> +};
> +

If it is only these two members, why not embed this in the cmb_dataset ?
This takes just 2bytes and we are instead allocating 2bytes + 4bytes for 
storing and additional pointer dereference + error handling of
allocations etc.

>   /**
>    * struct cmb_dataset
>    * @trace_mode:       Dataset collection mode
> @@ -267,6 +283,7 @@ struct cmb_dataset {
>   	bool			patt_ts;
>   	bool			trig_ts;
>   	bool			ts_all;
> +	struct mcmb_dataset	*mcmb;

	struct 			{
		u8		trig_lane;
		u8		lane_select;
	} mcmb;

?

Suzuki



>   };
>   
>   /**
> @@ -334,4 +351,9 @@ static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
>   {
>   	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
>   }
> +
> +static bool tpdm_has_mcmb_dataset(struct tpdm_drvdata *drvdata)
> +{
> +	return (drvdata->datasets & TPDM_PIDR0_DS_MCMB);
> +}
>   #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */


