Return-Path: <linux-arm-msm+bounces-104805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKeJLfKo72mpDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:20:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7514786C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63536300332D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D4E3B9D90;
	Mon, 27 Apr 2026 18:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZopmOAXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CBE31159C;
	Mon, 27 Apr 2026 18:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313762; cv=none; b=rhS5mmTvj1/u4JaBgYLLb2+uELifdU2gKjPHueVXO8JtK0F+iedgH5UCFcfIGIYGa2D6egZOJT0UV7jBXOs1fXGs1P7zdOXSAy063xpAFY8mNifLfxY5abKsz2F/2o/ATm7teeXO1OuMEJvJtQskbil7vjAats6UCwx4U4jdxRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313762; c=relaxed/simple;
	bh=ACljZHaJXDWWo3KsuPklvBKX5osHaF3OHqjq1FWimAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVH7pCmZhxJCQE7ZJGoRhI0mxwNGk+hYgBa1isygfZJl2zncRYTt2unH4WK9QP9035YCyveIlRDPdtIih/hnONTxEeG/HpjyXsRwHdMP58G8vW7yjkrrbxDCC+Zutq+6DIWxzJhcU3iIfIOBNsm2eubcYjQRAGWaguPEiH6r7oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZopmOAXe; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 265B3202C;
	Mon, 27 Apr 2026 11:15:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 469703F763;
	Mon, 27 Apr 2026 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777313759; bh=ACljZHaJXDWWo3KsuPklvBKX5osHaF3OHqjq1FWimAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZopmOAXeyH32KlGCBGqNDXyu19rK+2znV5qmuL6PJA7mimU6Oc+SKnYg1/H0vDLp5
	 uYzMS4Vv17gPGguTlkQXqWOg/q2/g8szaE/GTN1VCvKsLqE3YlhDgehhZuB6MqVIrQ
	 /dQGBqskJ7TeuiNmPahrOI2PQa2VlylsGsI4pGBE=
Date: Mon, 27 Apr 2026 19:15:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	quic_yingdeng@quicinc.com,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 4/4] coresight: cti: expose banked sysfs registers for
 Qualcomm extended CTI
Message-ID: <20260427181557.GC16537@e132581.arm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-4-23b900a4902f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-extended-cti-v8-4-23b900a4902f@oss.qualcomm.com>
X-Rspamd-Queue-Id: 1F7514786C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-104805-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,arm.com:dkim]

On Sun, Apr 26, 2026 at 05:44:41PM +0800, Yingchao Deng wrote:
> Qualcomm extended CTI implements banked trigger status and integration
> registers, where each bank covers 32 triggers. Multiple instances of
> these registers are required to expose the full trigger space.
> 
> Add static sysfs entries for the banked CTI registers and control their
> visibility based on the underlying hardware configuration. Numbered
> sysfs nodes are hidden on standard ARM CTIs, preserving the existing ABI.
> On Qualcomm CTIs, only banked registers backed by hardware are exposed,
> with the number of visible banks derived from nr_trig_max.
> 
> This ensures that userspace only sees registers that are actually
> implemented, while maintaining compatibility with existing CTI tooling.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c | 58 +++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index 8b70e7e38ea3..046757e4e9b6 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -512,18 +512,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
>  	&dev_attr_appclear.attr,
>  	&dev_attr_apppulse.attr,
>  	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
> +	coresight_cti_reg(triginstatus1, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 1)),

How about extend the cs_off_attribute struct:

  struct cs_off_attribute {
        struct device_attribute attr;
        u32 off;
        u32 index;
  };

  // by default, the index is 0
  #define coresight_cti_reg(name, offset)                               \
        (&((struct cs_off_attribute[]) {                                \
           {                                                            \
                __ATTR(name, 0444, coresight_cti_reg_show, NULL),       \
                offset                                                  \
                0                                                       \
           }                                                            \
  })[0].attr.attr)

  // For the register with index
  #define coresight_cti_reg_index(name, offset, index)                  \
        (&((struct cs_off_attribute[]) {                                \
           {                                                            \
                __ATTR(name, 0444, coresight_cti_reg_show, NULL),       \
                offset                                                  \
                index                                                   \
           }                                                            \
  })[0].attr.attr)

  coresight_cti_reg_index(triginstatus1, CTITRIGINSTATUS, 1),

> +	coresight_cti_reg(triginstatus2, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 2)),
> +	coresight_cti_reg(triginstatus3, CTI_REG_SET_NR_CONST(CTITRIGINSTATUS, 3)),
>  	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
> +	coresight_cti_reg(trigoutstatus1, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 1)),
> +	coresight_cti_reg(trigoutstatus2, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 2)),
> +	coresight_cti_reg(trigoutstatus3, CTI_REG_SET_NR_CONST(CTITRIGOUTSTATUS, 3)),
>  	coresight_cti_reg(chinstatus, CTICHINSTATUS),
>  	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
>  #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
>  	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
>  	coresight_cti_reg(ittrigin, ITTRIGIN),
> +	coresight_cti_reg(ittrigin1, CTI_REG_SET_NR_CONST(ITTRIGIN, 1)),
> +	coresight_cti_reg(ittrigin2, CTI_REG_SET_NR_CONST(ITTRIGIN, 2)),
> +	coresight_cti_reg(ittrigin3, CTI_REG_SET_NR_CONST(ITTRIGIN, 3)),
>  	coresight_cti_reg(itchin, ITCHIN),
>  	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
> +	coresight_cti_reg_rw(ittrigout1, CTI_REG_SET_NR_CONST(ITTRIGOUT, 1)),
> +	coresight_cti_reg_rw(ittrigout2, CTI_REG_SET_NR_CONST(ITTRIGOUT, 2)),
> +	coresight_cti_reg_rw(ittrigout3, CTI_REG_SET_NR_CONST(ITTRIGOUT, 3)),
>  	coresight_cti_reg_rw(itchout, ITCHOUT),
>  	coresight_cti_reg(itchoutack, ITCHOUTACK),
>  	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
> +	coresight_cti_reg(ittrigoutack1, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 1)),
> +	coresight_cti_reg(ittrigoutack2, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 2)),
> +	coresight_cti_reg(ittrigoutack3, CTI_REG_SET_NR_CONST(ITTRIGOUTACK, 3)),
>  	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
> +	coresight_cti_reg_wo(ittriginack1, CTI_REG_SET_NR_CONST(ITTRIGINACK, 1)),
> +	coresight_cti_reg_wo(ittriginack2, CTI_REG_SET_NR_CONST(ITTRIGINACK, 2)),
> +	coresight_cti_reg_wo(ittriginack3, CTI_REG_SET_NR_CONST(ITTRIGINACK, 3)),
>  	coresight_cti_reg_wo(itchinack, ITCHINACK),
>  #endif
>  	NULL,
> @@ -534,10 +552,50 @@ static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	static const char * const qcom_suffix_registers[] = {
> +		"triginstatus",
> +		"trigoutstatus",
> +#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
> +		"ittrigin",
> +		"ittrigout",
> +		"ittriginack",
> +		"ittrigoutack",
> +#endif
> +	};
> +	int i, nr, max_bank;
> +	size_t len;
>  
>  	if (attr == &dev_attr_asicctl.attr && !drvdata->config.asicctl_impl)
>  		return 0;
>  
> +	/*
> +	 * Banked regs are exposed as <qcom_suffix_registers><nr> (nr = 1..3).
> +	 * - Hide them on standard CTIs.
> +	 * - On QCOM CTIs, hide suffixes beyond the number of banks implied
> +	 *   by nr_trig_max (32 triggers per bank).
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(qcom_suffix_registers); i++) {

This can be general for a register with index?  Like:

  for (i = 0; i < ARRAY_SIZE(registers_with_index); i++) {

> +		len = strlen(qcom_suffix_registers[i]);
> +
> +		if (strncmp(attr->name, qcom_suffix_registers[i], len))
> +			continue;
> +
> +		if (kstrtoint(attr->name + len, 10, &nr))
> +			continue;
> +
> +		if (!drvdata->is_qcom_cti)
> +			return 0;
> +
> +		if (nr < 1 || nr > 3)
> +			return 0;
> +
> +		max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32) - 1;
> +		if (nr > max_bank)
> +			return 0;

Directly check the attr's index here?

  struct cs_off_attribute *cti_attr =
                container_of(attr, struct cs_off_attribute, attr);

  max_bank = DIV_ROUND_UP(drvdata->config.nr_trig_max, 32);
  if (cti_attr->index >= max_bank)
      return 0;

Thanks,
Leo

