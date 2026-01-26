Return-Path: <linux-arm-msm+bounces-90586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Jq6ET2Sd2m9hgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:11:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 068398A874
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0F00301DC3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0CC2D7817;
	Mon, 26 Jan 2026 16:10:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78191281368;
	Mon, 26 Jan 2026 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443844; cv=none; b=MNBckyCeGDL/r3ToHdRpy9L0YzCVAlNibIORyFc9iiq7bAl/apyiGjHcFf1dMYsepyE82Kd3TOuTS6Sl5+UjqimZ4pjPhYilAzanvkaL0Czg/Ty9RO6OTf6HOq8FaRKbIf1+jgdhuBOyuJBEOrfpptowSJKtb9dCKoL8XDScQpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443844; c=relaxed/simple;
	bh=8+OVp7ZwxGOehdlaVwAiNh0ESXe5jydntpry8Va+y/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8cHRgKBOtdSt5TcJjbSKsi7DvD+MCHd5v0jVkZSbQMnWA5n3Ol+ZRgodeIqH6/3NBdQDbTZMpnnRUh9Y6U1QqAEljCHQ7PhjDk+hxQU4ZFacuKtVppFNet878aF6owYEl6moIs4U7IqR4wz+IcHh5NaGOKNahV/bj+20rbDCvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52723339;
	Mon, 26 Jan 2026 08:10:35 -0800 (PST)
Received: from [10.57.68.157] (unknown [10.57.68.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D7493F5CA;
	Mon, 26 Jan 2026 08:10:39 -0800 (PST)
Message-ID: <c046085f-82e8-4a77-93be-c2a8d59db97e@arm.com>
Date: Mon, 26 Jan 2026 16:10:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
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
 <20260122-enable-byte-cntr-for-ctcu-v10-4-22978e3c169f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-4-22978e3c169f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90586-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:mid]
X-Rspamd-Queue-Id: 068398A874
X-Rspamd-Action: no action

On 22/01/2026 02:08, Jie Gan wrote:
> Refactor tmc_etr_get_catu_device to retrieve the helper device connected
> to the TMC ETR based on helper_subtype.

Please could you leave this as it is and add :

tmc_etr_get_ctcu_device() ?

It doesn't make much sense to refactor something that is a wrapper for
a generic function. Please avoid un-necessary abstraction

Suzuki


> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c    |  3 ++-
>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 32 ++++++++++++++++---------
>   drivers/hwtracing/coresight/coresight-tmc.h     |  3 ++-
>   3 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 69b36bae97ab..d3972619cc96 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -334,7 +334,8 @@ static int catu_alloc_etr_buf(struct tmc_drvdata *tmc_drvdata,
>   	struct tmc_sg_table *catu_table;
>   	struct catu_etr_buf *catu_buf;
>   
> -	csdev = tmc_etr_get_catu_device(tmc_drvdata);
> +	csdev = tmc_etr_get_helper_device(tmc_drvdata,
> +			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
>   	if (!csdev)
>   		return -ENODEV;
>   	catu_buf = kzalloc(sizeof(*catu_buf), GFP_KERNEL);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index cbbb15648fb7..16a4562533d5 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -844,28 +844,37 @@ static const struct etr_buf_operations etr_sg_buf_ops = {
>   };
>   
>   /*
> - * TMC ETR could be connected to a CATU device, which can provide address
> - * translation service. This is represented by the Output port of the TMC
> - * (ETR) connected to the input port of the CATU.
> + * TMC ETR could be connected to the helper device, which can provide address
> + * translation service(CATU) or data filter function(CTCU). This is represented
> + * by the Output port of the TMC (ETR) connected to the input port of the helper.
>    *
> - * Returns	: coresight_device ptr for the CATU device if a CATU is found.
> + * @drvdata	: drvdata of the TMC device
> + * @subtype	: helper_subtype of the helper device
> + *
> + * Returns	: coresight_device ptr for the helper device if a helper is found.
>    *		: NULL otherwise.
>    */
>   struct coresight_device *
> -tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
> +tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
> +			  enum coresight_dev_subtype_helper subtype)
>   {
>   	struct coresight_device *etr = drvdata->csdev;
> -	union coresight_dev_subtype catu_subtype = {
> -		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU
> +	union coresight_dev_subtype helper_subtype = {
> +		.helper_subtype = subtype
>   	};
>   
> -	if (!IS_ENABLED(CONFIG_CORESIGHT_CATU))
> +
> +	if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CATU &&
> +	    !IS_ENABLED(CONFIG_CORESIGHT_CATU))
> +		return NULL;
> +	else if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU &&
> +		 !IS_ENABLED(CONFIG_CORESIGHT_CTCU))
>   		return NULL;
>   
>   	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
> -					  catu_subtype);
> +					  helper_subtype);
>   }
> -EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
> +EXPORT_SYMBOL_GPL(tmc_etr_get_helper_device);
>   
>   static const struct etr_buf_operations *etr_buf_ops[] = {
>   	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
> @@ -913,7 +922,8 @@ static void get_etr_buf_hw(struct device *dev, struct etr_buf_hw *buf_hw)
>   
>   	buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
>   	buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
> -	buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
> +	buf_hw->has_catu = !!tmc_etr_get_helper_device(drvdata,
> +			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
>   	buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
>   }
>   
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index c9a82ff6cd00..7690a70069da 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -471,7 +471,8 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
>   	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
>   }
>   
> -struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
> +struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
> +						   enum coresight_dev_subtype_helper subtype);
>   
>   void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
>   void tmc_etr_remove_catu_ops(void);
> 


