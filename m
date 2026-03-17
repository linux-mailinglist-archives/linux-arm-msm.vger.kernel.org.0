Return-Path: <linux-arm-msm+bounces-98151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y9REAi41uWmcvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:04:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 795302A86E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96934304DF2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 11:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A8E37BE9E;
	Tue, 17 Mar 2026 11:01:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1BF373BF2;
	Tue, 17 Mar 2026 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745282; cv=none; b=fepgPAapp+SpcxfN20tbMH6PkkgsIDnsRQXJUyIX5svMyEnvfL2YC42vJMineFZrDHXsPu+53XlgpHYc6Zp1VIUpz+5UfCgUSD/x3vgnD9Ug9jUH+/si/gVBmebixGWTpjerMGOwIEexuaaNB2Bv9DmYSzuBj+VhkBEbFa2MBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745282; c=relaxed/simple;
	bh=0Y6usg7zBh1OvQlKFbecGoWf3gNBs6KQNaYhOeFm6EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdVpVxqd/bb9djdz8MPxZHpOYoZt4oKfeshOvtEtBp0glrObmY8EY3Zeo3Cqu8MjDgEYJxLuV+0pQwqV1IHsJEJ+GrQ0nmTCrJb2PWDuR1fV+AIt+i3IxQemrdXIyVYGY97EU6/sVLU6IN3ip74HJLdB9qnERdFKrngOwZZBaU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE7D61756;
	Tue, 17 Mar 2026 04:01:13 -0700 (PDT)
Received: from [10.57.19.134] (unknown [10.57.19.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D33D3F7BD;
	Tue, 17 Mar 2026 04:01:18 -0700 (PDT)
Message-ID: <1c4ab892-6f01-40ff-83e2-9060aa69616f@arm.com>
Date: Tue, 17 Mar 2026 11:01:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
 <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98151-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.754];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:mid]
X-Rspamd-Queue-Id: 795302A86E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 09:02, Jie Gan wrote:
> Introduce functions for creating and inserting or removing the
> etr_buf_node to/from the etr_buf_list.
> 
> The byte-cntr functionality requires two etr_buf to receive trace data.
> The active etr_buf collects the trace data from source device, while the
> byte-cntr reading function accesses the deactivated etr_buf after is
> has been filled and synced, transferring data to the userspace.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 108 +++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h      |  17 ++++
>   3 files changed, 126 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index c89fe996af23..bac3278ef4dd 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		idr_init(&drvdata->idr);
>   		mutex_init(&drvdata->idr_mutex);
>   		dev_list = "tmc_etr";
> +		INIT_LIST_HEAD(&drvdata->etr_buf_list);
>   		break;
>   	case TMC_CONFIG_TYPE_ETF:
>   		desc.groups = coresight_etf_groups;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 4dc1defe27a5..fdf23e1c932f 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1918,6 +1918,114 @@ const struct coresight_ops tmc_etr_cs_ops = {
>   	.panic_ops	= &tmc_etr_sync_ops,
>   };
>   
> +/**
> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
> + * @drvdata:	driver data of the TMC device.
> + *
> + * Remove unused buffers from @drvdata->etr_buf_list and free them.
> + */
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
> +{
> +	struct etr_buf_node *nd, *next;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&drvdata->spinlock);
> +	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
> +		if (nd->sysfs_buf == drvdata->sysfs_buf) {
> +			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
> +				/*
> +				 * Dont free the sysfs_buf, just remove it from list.
> +				 * drvdata->sysfs_buf will hold the buffer and free it later.
> +				 */
> +				nd->sysfs_buf = NULL;
> +				list_del(&nd->link);
> +				kfree(nd);
> +				continue;
> +			}
> +		}
> +		/* Free allocated buffers which are not utilized by ETR */
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);

This is dangerous ! Restoring the irqflags to an uninitialised value 
from a different function thant where it was locked. Please clean this up

Suzuki


> +		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
> +		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +		drvdata->sysfs_buf = NULL;
> +		nd->sysfs_buf = NULL;
> +		list_del(&nd->link);
> +		kfree(nd);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
> +
> +/**
> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
> + * @drvdata:	driver data of the TMC device.
> + * @num_nodes:	number of nodes want to create with the list.
> + *
> + * Return 0 upon success and return the error number if fail.
> + */
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> +{
> +	struct etr_buf_node *new_node;
> +	struct etr_buf *sysfs_buf;
> +	unsigned long flags;
> +	int i = 0, ret = 0;
> +
> +	lockdep_assert_held(&drvdata->spinlock);
> +	/* We dont need a list if there is only one node */
> +	if (num_nodes < 2)
> +		return -EINVAL;
> +
> +	/* We expect that sysfs_buf in drvdata has already been allocated. */
> +	if (drvdata->sysfs_buf) {
> +		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +		/* Directly insert the allocated sysfs_buf into the list first */
> +		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
> +		if (IS_ERR(new_node))
> +			return PTR_ERR(new_node);
> +
> +		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +		new_node->sysfs_buf = drvdata->sysfs_buf;
> +		new_node->is_free = false;
> +		list_add(&new_node->link, &drvdata->etr_buf_list);
> +		i++;
> +	}
> +
> +	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> +	while (i < num_nodes) {
> +		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
> +		if (IS_ERR(new_node)) {
> +			ret = PTR_ERR(new_node);
> +			break;
> +		}
> +
> +		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
> +		if (IS_ERR(sysfs_buf)) {
> +			kfree(new_node);
> +			ret = PTR_ERR(sysfs_buf);
> +			break;
> +		}
> +
> +		/* We dont have a available sysfs_buf in drvdata, setup one */
> +		if (!drvdata->sysfs_buf) {
> +			drvdata->sysfs_buf = sysfs_buf;
> +			new_node->is_free = false;
> +		} else
> +			new_node->is_free = true;
> +
> +		new_node->sysfs_buf = sysfs_buf;
> +		list_add(&new_node->link, &drvdata->etr_buf_list);
> +		i++;
> +	}
> +
> +	/* Clean the list if there is an error */
> +	if (ret)
> +		tmc_clean_etr_buf_list(drvdata);
> +
> +	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
> +
>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 319a354ede9f..81237944b986 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>   	s64		len;
>   };
>   
> +/**
> + * @sysfs_buf:	Allocated sysfs_buf.
> + * @is_free:	Indicates whether the buffer is free to choose.
> + * @pos:	Position of the buffer.
> + * @link:	list_head of the node.
> + */
> +struct etr_buf_node {
> +	struct etr_buf		*sysfs_buf;
> +	bool			is_free;
> +	loff_t			pos;
> +	struct list_head	link;
> +};
> +
>   /**
>    * struct tmc_drvdata - specifics associated to an TMC component
>    * @atclk:	optional clock for the core parts of the TMC.
> @@ -245,6 +258,7 @@ struct tmc_resrv_buf {
>    *		(after crash) by default.
>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>    *		 Used by ETR/ETF.
> + * @etr_buf_list: List that is used to manage allocated etr_buf.
>    */
>   struct tmc_drvdata {
>   	struct clk		*atclk;
> @@ -275,6 +289,7 @@ struct tmc_drvdata {
>   	struct etr_buf		*perf_buf;
>   	struct tmc_resrv_buf	resrv_buf;
>   	struct tmc_resrv_buf	crash_mdata;
> +	struct list_head        etr_buf_list;
>   };
>   
>   struct etr_buf_operations {
> @@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>   				   enum cs_mode mode,
>   				   struct coresight_path *path);
>   extern const struct attribute_group coresight_etr_group;
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
>   
>   #endif
> 


