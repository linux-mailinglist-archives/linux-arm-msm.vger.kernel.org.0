Return-Path: <linux-arm-msm+bounces-35579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A75C9AC6DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 11:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 640D8B21201
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B5119C578;
	Wed, 23 Oct 2024 09:40:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34FD18953D;
	Wed, 23 Oct 2024 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729676443; cv=none; b=p3KHPLcUp7vSwC8Tc6b5gpJzFghIZfLF5JkrwU1bf8zZ6bwfasSia7YaSMAP7U91aijydO3oErsAch9SoWHvcuMSU7F+LMuF6bLrIO7Ijp7Cdi6NTehvRwcPT7TYA+F8WDjfoBX5ARTeDaM+t5qvicwjANwbIDqmqggFL87kXvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729676443; c=relaxed/simple;
	bh=/CHZCWTp4ckqXYyv/MfuoO0nRTPcJ6wCWDVAQgZrZXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdJV2yscUNjOuRohx3FDGyB+FpkpKpty20bigmiQ9hCdq4wQjexZWejWG9xA/NLyYsNF2bSWKR5RZxa8zwuAbJxD3hX/TygQRl0IniCysoXJEgubC9zndftrtVYZ7H3DT2Tvm68pT/pLFIieSviudNH2cqIhGbrT7CiM+tCGE7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2062339;
	Wed, 23 Oct 2024 02:41:09 -0700 (PDT)
Received: from [10.57.66.28] (unknown [10.57.66.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF8A03F71E;
	Wed, 23 Oct 2024 02:40:38 -0700 (PDT)
Message-ID: <d57eca00-1196-4ac7-ac45-7420ee4ac603@arm.com>
Date: Wed, 23 Oct 2024 10:40:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND 2/3] coresight-tpdm: Add support to select lane
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
 <20241011064732.8480-3-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241011064732.8480-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 07:47, Mao Jinlong wrote:
> From: Tao Zhang <quic_taozha@quicinc.com>
> 
> TPDM MCMB subunits supports up to 8 lanes CMB. For MCMB
> configurations, the field "XTRIG_LNSEL" in CMB_CR register selects
> which lane participates in the output pattern mach cross trigger
> mechanism goverened by the M_CMB_DXPR and M_CMB_XPMR regisers.

minor nit: s/goverened/governed/

> 
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpdm  |  8 +++
>   drivers/hwtracing/coresight/coresight-tpdm.c  | 51 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpdm.h  |  3 ++
>   3 files changed, 62 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index bf710ea6e0ef..b3292fa2a022 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -257,3 +257,11 @@ Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
>   Description:
>   		(RW) Set/Get the MSR(mux select register) for the CMB subunit
>   		TPDM.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/mcmb_trig_lane
> +Date:		June 2024
> +KernelVersion	6.9
> +Contact:	Tao Zhang (QUIC) <quic_taozha@quicinc.com>

Didn't we already discuss about modifying the date and version ? Simply 
resending the patch is not going to help if it is not uptodate.

Please fix all the dates in the series

Suzuki

> +Description:
> +		(RW) Set/Get which lane participates in the output pattern
> +		match cross trigger mechanism for the MCMB subunit TPDM.
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 58f8c3e804c1..f32c119e1b67 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -238,6 +238,18 @@ static umode_t tpdm_cmb_msr_is_visible(struct kobject *kobj,
>   	return 0;
>   }
>   
> +static umode_t tpdm_mcmb_is_visible(struct kobject *kobj,
> +				    struct attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	if (drvdata && tpdm_has_mcmb_dataset(drvdata))
> +		return attr->mode;
> +
> +	return 0;
> +}
> +
>   static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
>   {
>   	if (tpdm_has_dsb_dataset(drvdata)) {
> @@ -1015,6 +1027,34 @@ static ssize_t cmb_trig_ts_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(cmb_trig_ts);
>   
> +static ssize_t mcmb_trig_lane_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n",
> +			  (unsigned int)drvdata->cmb->mcmb->mcmb_trig_lane);
> +}
> +
> +static ssize_t mcmb_trig_lane_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf,
> +				    size_t size)
> +{
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if ((kstrtoul(buf, 0, &val)) || (val >= TPDM_MCMB_MAX_LANES))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->cmb->mcmb->mcmb_trig_lane = val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(mcmb_trig_lane);
> +
>   static struct attribute *tpdm_dsb_edge_attrs[] = {
>   	&dev_attr_ctrl_idx.attr,
>   	&dev_attr_ctrl_val.attr,
> @@ -1177,6 +1217,11 @@ static struct attribute *tpdm_cmb_msr_attrs[] = {
>   	NULL,
>   };
>   
> +static struct attribute *tpdm_mcmb_attrs[] = {
> +	&dev_attr_mcmb_trig_lane.attr,
> +	NULL,
> +};
> +
>   static struct attribute *tpdm_dsb_attrs[] = {
>   	&dev_attr_dsb_mode.attr,
>   	&dev_attr_dsb_trig_ts.attr,
> @@ -1243,6 +1288,11 @@ static struct attribute_group tpdm_cmb_msr_grp = {
>   	.name = "cmb_msr",
>   };
>   
> +static struct attribute_group tpdm_mcmb_attr_grp = {
> +	.attrs = tpdm_mcmb_attrs,
> +	.is_visible = tpdm_mcmb_is_visible,
> +};
> +
>   static const struct attribute_group *tpdm_attr_grps[] = {
>   	&tpdm_attr_grp,
>   	&tpdm_dsb_attr_grp,
> @@ -1254,6 +1304,7 @@ static const struct attribute_group *tpdm_attr_grps[] = {
>   	&tpdm_cmb_trig_patt_grp,
>   	&tpdm_cmb_patt_grp,
>   	&tpdm_cmb_msr_grp,
> +	&tpdm_mcmb_attr_grp,
>   	NULL,
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index 2e84daad1a58..e72dc19da310 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -45,6 +45,9 @@
>   /* MAX number of DSB MSR */
>   #define TPDM_CMB_MAX_MSR 32
>   
> +/* MAX lanes in the output pattern for MCMB configurations*/
> +#define TPDM_MCMB_MAX_LANES 8
> +
>   /* DSB Subunit Registers */
>   #define TPDM_DSB_CR		(0x780)
>   #define TPDM_DSB_TIER		(0x784)


