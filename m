Return-Path: <linux-arm-msm+bounces-42567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D06089F4EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 16:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18D421895343
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3937A1F8900;
	Tue, 17 Dec 2024 14:55:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D811F5408;
	Tue, 17 Dec 2024 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447316; cv=none; b=exQXJE9sqwkIvbKyoT0ekZnuTw6XcO0UxxX/XGqE4mfOOKyFs9zhJlNmEmH8sYSdffsouWncxmu7XbhikEGbYRLOia1ElRCbrJm/OvCeipEOsUyAofHjzxpA9xBDqHWYT4L0d1aeJbhqjqWe8N7fgs02ijLJCdfGLO3PNBxyRGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447316; c=relaxed/simple;
	bh=tnOaCXr1PcPaOn0GsFurLu91jOQAlKHY2qOHCJ8XDB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7QcUcvGQy9yEjdY6oGO5vXD5IKxwB3LK6skMmLVo2ZJt9K3glwh0xk8V+2QcmdCY/cvl6f4DZpWZq1Hnfg6doV30OL96Xha9J/0Kc9sGE7PExeroxnR4+bm/ESTX9e5mFTpcPFHfoaNaq3I+Z7YToJOTeTEFQaoFI778ZfL/60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E25D91063;
	Tue, 17 Dec 2024 06:55:40 -0800 (PST)
Received: from [10.57.71.247] (unknown [10.57.71.247])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EFE03F528;
	Tue, 17 Dec 2024 06:55:11 -0800 (PST)
Message-ID: <8ca3d31b-74a0-497a-9b53-dfe9becd0f7a@arm.com>
Date: Tue, 17 Dec 2024 14:55:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight-tpdm: Add support to enable the lane for
 MCMB TPDM
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
 <20241105123940.39602-4-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241105123940.39602-4-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 12:39, Mao Jinlong wrote:
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
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  7 +++++
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 29 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
>   3 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index e833edfec79e..fcc2a8f1f17f 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -265,3 +265,10 @@ Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
>   Description:
>   		(RW) Set/Get which lane participates in the output pattern
>   		match cross trigger mechanism for the MCMB subunit TPDM.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_lanes_select
> +Date:		Nov 2024
> +KernelVersion	6.13

6.14

Suzuki


> +Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>
> +Description:
> +		(RW) Set/Get the enablement of the individual lane.
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 2e4dc86b03ea..bb0d6505ec9f 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1063,6 +1063,34 @@ static ssize_t mcmb_trig_lane_store(struct device *dev,
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
> +			  (unsigned int)drvdata->cmb->mcmb.lane_select);
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
> +	if (kstrtoul(buf, 0, &val) || (val & ~TPDM_MCMB_E_LN_MASK))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->cmb->mcmb.lane_select = val & TPDM_MCMB_E_LN_MASK;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(mcmb_lanes_select);
> +
>   static struct attribute *tpdm_dsb_edge_attrs[] = {
>   	&dev_attr_ctrl_idx.attr,
>   	&dev_attr_ctrl_val.attr,
> @@ -1227,6 +1255,7 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
>   
>   static struct attribute *tpdm_mcmb_attrs[] = {
>   	&dev_attr_mcmb_trig_lane.attr,
> +	&dev_attr_mcmb_lanes_select.attr,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index aa9746b2e77f..a80f3d680995 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -48,6 +48,9 @@
>   /* MAX lanes in the output pattern for MCMB configurations*/
>   #define TPDM_MCMB_MAX_LANES 8
>   
> +/* Filter bit 0~7 from the value for CR_E_LN */
> +#define TPDM_MCMB_E_LN_MASK		GENMASK(7, 0)
> +
>   /* DSB Subunit Registers */
>   #define TPDM_DSB_CR		(0x780)
>   #define TPDM_DSB_TIER		(0x784)


