Return-Path: <linux-arm-msm+bounces-85736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D2CCD070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 18:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2A383079AA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 17:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1672D5C76;
	Thu, 18 Dec 2025 17:50:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D732E3A1E61;
	Thu, 18 Dec 2025 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080246; cv=none; b=TCnvJ9+gDfSct0Y75vTufQR0GSZXbA+PghmCc0Cu3F0YOxfSuOxJXcDTvcOZRMrE94Q788Y1F6f7gnMYOdkmqyqPGyt0FAIDvV+a8VL5WHSWHTDd0Rlk8UTknSNjKuqb3izTdw+zXdcdXCWbugPOKIf21J1qZiR4Ttt29WlJ3HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080246; c=relaxed/simple;
	bh=7MocPNFiS1PLagVCn4nP44Xa9mAjylDN77Gx7FHV8ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nETGeuvFo1L6QS0wBTchZjN9pQDFujFeXIFEB6x7B6jEPirLH3OEqUsydlOZskeymb9JIByM1XesWHwRLG7opBAsJTNDf4hG8tNwYh0f5YbDpCP+7GPRA/x038NAEaJuve/T+E+eAMmRaTKbBmPY7dg+JvaUhOgGFKQHPVk6Z5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF0CFEC;
	Thu, 18 Dec 2025 09:50:36 -0800 (PST)
Received: from [10.57.74.203] (unknown [10.57.74.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EB363F73F;
	Thu, 18 Dec 2025 09:50:40 -0800 (PST)
Message-ID: <dd043b78-d60c-4a79-85a8-9f352a4d89e1@arm.com>
Date: Thu, 18 Dec 2025 17:50:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] coresight: core: add a new API to retrieve the
 helper device
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2025 06:10, Jie Gan wrote:
> Retrieving the helper device of the specific coresight device based on
> its helper_subtype because a single coresight device may has multiple types
> of the helper devices.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0e8448784c62..667883ccb4b7 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -585,6 +585,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>   
> +/**
> + * coresight_get_helper: find the helper device of the assigned csdev.
> + *
> + * @csdev: The csdev the helper device is conntected to.
> + * @type:  helper_subtype of the expected helper device.
> + *
> + * Retrieve the helper device for the specific csdev based on its
> + * helper_subtype.
> + *
> + * Return: the helper's csdev upon success or NULL for fail.
> + */
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +					      enum coresight_dev_subtype_helper subtype)

We have almost a similar function in coresight-core.c :

coresight_find_output_type(pdata, type, subtype).

Please could we reuse that, instead of adding similar funcitons ?

Please be careful about the mutex.

Suzuki

> +{
> +	int i;
> +	struct coresight_device *helper;
> +
> +	/* protect the connections */
> +	mutex_lock(&coresight_mutex);
> +	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> +		helper = csdev->pdata->out_conns[i]->dest_dev;
> +		if (!helper || !coresight_is_helper(helper))
> +			continue;
> +
> +		if (helper->subtype.helper_subtype == subtype) {
> +			mutex_unlock(&coresight_mutex);
> +			return helper;
> +		}
> +	}
> +	mutex_unlock(&coresight_mutex);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_helper);
> +
>   /**
>    * coresight_get_in_port: Find the input port number at @csdev where a @remote
>    * device is connected to.
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index cbf80b83e5ce..8e39a4dc7256 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -157,6 +157,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>   				   enum cs_mode mode);
>   int coresight_get_in_port(struct coresight_device *csdev,
>   			  struct coresight_device *remote);
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +					      enum coresight_dev_subtype_helper subtype);
>   
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>   int etm_readl_cp14(u32 off, unsigned int *val);
> 


