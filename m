Return-Path: <linux-arm-msm+bounces-35580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C847C9AC6E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 11:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 028B61C2365C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B7B152517;
	Wed, 23 Oct 2024 09:45:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62167156F3F;
	Wed, 23 Oct 2024 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729676734; cv=none; b=B8BBN80FhsBY8gOSAfrePR/pAQdDPsDMCcb9euyd1eYnV1tkEdln01/6tVwCLkl+RJkCR77kCBnqkR+QSuMP/js5PhdVjJuTW8wt46jrYUVhe0uCvC5uzFvsz33ohTBBCMdcHhE1hLDCH8pAndnKcfZC2ou09JZ7hylgin7yoMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729676734; c=relaxed/simple;
	bh=6bdiM1C9x9DzXpyduWBjkQ6YQKqrdVrwqalYTJ3PLcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mb6lUphDRp5wh8itiL1cYVAOICpmxBQvJkFS3GxDBZpHj9iizAxj09oLXur3Vjz0FoaftDIb3wZ++UaNK9+OfmdzfrV28QFt/0sYSO7xEFF1IBv/Yddl9vrNQNUuE3B1nWEEIObpsgr01Wg8zfWOtvT6qEyGqAOdD47A1AP7Emw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A0BB339;
	Wed, 23 Oct 2024 02:46:01 -0700 (PDT)
Received: from [10.57.66.28] (unknown [10.57.66.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C6DE3F71E;
	Wed, 23 Oct 2024 02:45:30 -0700 (PDT)
Message-ID: <98173130-bb52-4378-aa54-119b5c3ab131@arm.com>
Date: Wed, 23 Oct 2024 10:45:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 3/3] coresight-tpdm: Add support to enable the
 lane for MCMB TPDM
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
 <20241011064732.8480-4-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241011064732.8480-4-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 07:47, Mao Jinlong wrote:
> From: Tao Zhang <quic_taozha@quicinc.com>
> 
> Add the sysfs file to set/get the enablement of the lane. For MCMB
> configurations, the field "E_LN" in CMB_CR register is the
> individual lane enables. MCMB lane N is enabled for trace
> generation when M_CMB_CR.E=1 and M_CMB_CR.E_LN[N]=1. For lanes
> that are not implemented on a given MCMB configuration, the
> corresponding bits of this field read as 0 and ignore writes.
> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  7 +++++
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 29 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
>   3 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index b3292fa2a022..214f681a68ec 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -265,3 +265,10 @@ Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
>   Description:
>   		(RW) Set/Get which lane participates in the output pattern
>   		match cross trigger mechanism for the MCMB subunit TPDM.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_lanes_select
> +Date:		June 2024
> +KernelVersion	6.9
> +Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
> +Description:
> +		(RW) Set/Get the enablement of the individual lane.
> \ No newline at end of file
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index f32c119e1b67..f8e22f4c3b52 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1055,6 +1055,34 @@ static ssize_t mcmb_trig_lane_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(mcmb_trig_lane);
>   
> +static ssize_t mcmb_lanes_select_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n",
> +			  (unsigned int)drvdata->cmb->mcmb->mcmb_lane_select);
> +}
> +
> +static ssize_t mcmb_lanes_select_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf,
> +				       size_t size)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))

	if (kstrstoul(buf, 0, &val) || (val & ~TPDM_MCMB_E_LN_MASK)) ?

> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->cmb->mcmb->mcmb_lane_select = val & TPDM_MCMB_E_LN_MASK;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(mcmb_lanes_select);
> +
>   static struct attribute *tpdm_dsb_edge_attrs[] = {
>   	&dev_attr_ctrl_idx.attr,
>   	&dev_attr_ctrl_val.attr,
> @@ -1219,6 +1247,7 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
>   
>   static struct attribute *tpdm_mcmb_attrs[] = {
>   	&dev_attr_mcmb_trig_lane.attr,
> +	&dev_attr_mcmb_lanes_select.attr,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index e72dc19da310..e740039cd650 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -48,6 +48,9 @@
>   /* MAX lanes in the output pattern for MCMB configurations*/
>   #define TPDM_MCMB_MAX_LANES 8
>   
> +/* High performance mode */

This doesn't match the descriptions ?

Suzuki

> +#define TPDM_MCMB_E_LN_MASK		GENMASK(7, 0)
> +
>   /* DSB Subunit Registers */
>   #define TPDM_DSB_CR		(0x780)
>   #define TPDM_DSB_TIER		(0x784)


