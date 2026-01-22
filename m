Return-Path: <linux-arm-msm+bounces-90162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLk+Bg75cWmvZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:16:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B4651CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E097066ADF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DD636CE15;
	Thu, 22 Jan 2026 10:08:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312BF36AB7B;
	Thu, 22 Jan 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076488; cv=none; b=szal9kwTBPk6cTmvcJynIv7b6koUp2h4+gXwquGIf6AktK8GLIUjV9fX9K+UFyzONJrFd0FtyxD4r9DV/avUjVcgwD3gyqI6QApB01ZUNAlEkGwGKuCF/ROMoS6deavJINyLNqDiGjPGqXzu3nrcpyGQ1dAQajxF87MHEqbZiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076488; c=relaxed/simple;
	bh=/IZJ43DMXTsidp4+uOtb0424hHkYMwj/G8r5vHAeT10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0sF7xsTFT9YMiLw218gphFzsgDOFykjpCw2tDYt0kviLpazmq8Vn7wYKTMhmh1A0Mul/IiTdDtueuPLHDgyEp95k18W9Gd4VtKt908NM98CeBEjrvVll6yVId37R4jqscnP1u8R6fahliHmsZTGhBUlzdG6ohvaYi3xLvckJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B15EC1476;
	Thu, 22 Jan 2026 02:07:57 -0800 (PST)
Received: from [10.57.9.125] (unknown [10.57.9.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D5243F740;
	Thu, 22 Jan 2026 02:08:01 -0800 (PST)
Message-ID: <f78f72ec-9b57-4373-a7f0-a9295326832b@arm.com>
Date: Thu, 22 Jan 2026 10:07:59 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
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
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-3-22978e3c169f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-3-22978e3c169f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : No valid SPF, No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90162-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,arm.com:mid,qualcomm.com:email,desc.name:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: CC5B4651CC
X-Rspamd-Action: no action

On 22/01/2026 02:08, Jie Gan wrote:
> Introduce sysfs_read_ops as a wrapper, wrap sysfs read operations, for reading
> trace data from the TMC buffer.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tmc-core.c | 50 +++++++++++-------------
>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++++++
>   2 files changed, 40 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 1ea255ffa67c..8b0397a77e57 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
>   
> -	switch (drvdata->config_type) {
> -	case TMC_CONFIG_TYPE_ETB:
> -	case TMC_CONFIG_TYPE_ETF:
> -		ret = tmc_read_prepare_etb(drvdata);
> -		break;
> -	case TMC_CONFIG_TYPE_ETR:
> -		ret = tmc_read_prepare_etr(drvdata);
> -		break;
> -	default:
> +	if (drvdata->sysfs_ops)
> +		ret = drvdata->sysfs_ops->read_prepare(drvdata);
> +	else
>   		ret = -EINVAL;
> -	}
>   
>   	if (!ret)
>   		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
> @@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
>   
> -	switch (drvdata->config_type) {
> -	case TMC_CONFIG_TYPE_ETB:
> -	case TMC_CONFIG_TYPE_ETF:
> -		ret = tmc_read_unprepare_etb(drvdata);
> -		break;
> -	case TMC_CONFIG_TYPE_ETR:
> -		ret = tmc_read_unprepare_etr(drvdata);
> -		break;
> -	default:
> +	if (drvdata->sysfs_ops)
> +		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
> +	else
>   		ret = -EINVAL;
> -	}
>   
>   	if (!ret)
>   		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
> @@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
>   				   char **bufpp)
>   {
> -	switch (drvdata->config_type) {
> -	case TMC_CONFIG_TYPE_ETB:
> -	case TMC_CONFIG_TYPE_ETF:
> -		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
> -	case TMC_CONFIG_TYPE_ETR:
> -		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
> -	}
> +	if (drvdata->sysfs_ops)
> +		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);

minor nit: Please could we bail out in tmc_open() if the 
drvdata->sysfs_ops is not set. That way, we don't have to sprinkle it 
everywhere. And also, we don't expect to see this case anyways.

>   
>   	return -EINVAL;
>   }
> @@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
>   			"Valid crash tracedata found\n");
>   }
>   
> +static const struct sysfs_read_ops tmc_etb_sysfs_read_ops = {

minor nit: please could we rename the struct type to :

struct tmc_sysfs_ops

and then use

etb_sysfs_ops = {}
etr_sysfs_ops = {}


Rest looks fine to me

Suzuki

> +	.read_prepare	= tmc_read_prepare_etb,
> +	.read_unprepare	= tmc_read_unprepare_etb,
> +	.get_trace_data	= tmc_etb_get_sysfs_trace,
> +};
> +
> +static const struct sysfs_read_ops tmc_etr_sysfs_read_ops = {
> +	.read_prepare	= tmc_read_prepare_etr,
> +	.read_unprepare	= tmc_read_unprepare_etr,
> +	.get_trace_data	= tmc_etr_get_sysfs_trace,
> +};
> +
>   static int __tmc_probe(struct device *dev, struct resource *res)
>   {
>   	int ret = 0;
> @@ -828,6 +821,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
>   		desc.ops = &tmc_etb_cs_ops;
>   		dev_list = &etb_devs;
> +		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
>   		break;
>   	case TMC_CONFIG_TYPE_ETR:
>   		desc.groups = coresight_etr_groups;
> @@ -841,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		mutex_init(&drvdata->idr_mutex);
>   		dev_list = &etr_devs;
>   		INIT_LIST_HEAD(&drvdata->etr_buf_list);
> +		drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
>   		break;
>   	case TMC_CONFIG_TYPE_ETF:
>   		desc.groups = coresight_etf_groups;
> @@ -849,6 +844,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>   		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>   		desc.ops = &tmc_etf_cs_ops;
>   		dev_list = &etf_devs;
> +		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
>   		break;
>   	default:
>   		pr_err("%s: Unsupported TMC config\n", desc.name);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 9b3c4e6f0a5e..c9a82ff6cd00 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -221,6 +221,8 @@ struct etr_buf_node {
>   	struct list_head	node;
>   };
>   
> +struct sysfs_read_ops;
> +
>   /**
>    * struct tmc_drvdata - specifics associated to an TMC component
>    * @atclk:	optional clock for the core parts of the TMC.
> @@ -258,6 +260,7 @@ struct etr_buf_node {
>    *		 Used by ETR/ETF.
>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>    * @reading_node: Available buffer_node for byte-cntr reading.
> + * @sysfs_ops:	Read operations for sysfs mode.
>    */
>   struct tmc_drvdata {
>   	struct clk		*atclk;
> @@ -290,6 +293,20 @@ struct tmc_drvdata {
>   	struct tmc_resrv_buf	crash_mdata;
>   	struct list_head        etr_buf_list;
>   	struct etr_buf_node     *reading_node;
> +	const struct sysfs_read_ops	*sysfs_ops;
> +};
> +
> +/**
> + * struct sysfs_read_ops - read operations for TMC and its helper devices
> + * @read_prepare:	prepare operation.
> + * @read_unprepare:	unprepare operation.
> + * @get_trace_data:	read operation.
> + */
> +struct sysfs_read_ops {
> +	int (*read_prepare)(struct tmc_drvdata *drvdata);
> +	int (*read_unprepare)(struct tmc_drvdata *drvdata);
> +	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
> +				  size_t len, char **bufpp);
>   };
>   
>   struct etr_buf_operations {
> 


