Return-Path: <linux-arm-msm+bounces-104791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJMJOleh72kcDgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:48:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D31477E62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07EA73009CEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63D43E275B;
	Mon, 27 Apr 2026 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VVQWVjfg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19B73E63AA;
	Mon, 27 Apr 2026 17:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312085; cv=none; b=XeYU0uHjgKdmt0JTqwaYPpl0ddXPdzBMBA3jCdcueesw2P2IOeBolyzGsK8vdDNppK72wvWNFOjIuLhmC6hDSr0sVVFBYCcjN1Y37icRTTAlvXjValrIXOimoBMpxCjeSiEP9PQ6dXKxgjzSGoT3uhATXLotaLtP1A4cmVRxsmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312085; c=relaxed/simple;
	bh=N/CxeRp4C6J/EUwjsMwrEoNIFMJIT8gvExYabDUQsz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKlrw4Rp+sqiShB7TuC5oPXCRyvqxEmUYzWHl9GQ0m1A3g3aP0KKaBprZ6sTyt4UtmK0rFe41hSkPsuRp0FdtHO5zuOZVGuAAcJSP3KaoPKHP9Wi0R1w6LFywi4qoYqO53oo3jlciRs+lt0ctYHI+J5I8xDKDFu/pWBGMRAG8I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VVQWVjfg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64D90202C;
	Mon, 27 Apr 2026 10:47:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 716393F7B4;
	Mon, 27 Apr 2026 10:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777312082; bh=N/CxeRp4C6J/EUwjsMwrEoNIFMJIT8gvExYabDUQsz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVQWVjfgBCs2hRc9+41J14g/U5UOqbdTm65/UhKrQjn+wXcfuqHPfMwP7J+uExY5i
	 WVeaV+uLgs5Yrql9L2krQR2f6KdsxuTH6Bn6k0OlSitZ9OjO3xstMJC3jKiL1Srqup
	 EQgPPuYyDZ7oVgSRAlESqy5C19bSNZIKERyMCrhA=
Date: Mon, 27 Apr 2026 18:48:00 +0100
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
Subject: Re: [PATCH v8 2/4] coresight: cti: encode trigger register index in
 register offsets
Message-ID: <20260427174800.GB16537@e132581.arm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426-extended-cti-v8-2-23b900a4902f@oss.qualcomm.com>
X-Rspamd-Queue-Id: 94D31477E62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-104791-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:dkim,qualcomm.com:email]

On Sun, Apr 26, 2026 at 05:44:39PM +0800, Yingchao Deng wrote:
> Introduce a small encoding to carry the register index together with the
> base offset in a single u32, and use a common helper to compute the final
> MMIO address. This refactors register access to be based on the encoded
> (reg, nr) pair, reducing duplicated arithmetic and making it easier to
> support variants that bank or relocate trigger-indexed registers.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
>  drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
>  drivers/hwtracing/coresight/coresight-cti.h       | 16 ++++++++++--
>  3 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index 4e7d12bd2d3e..c4cbeb64365b 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
>  #define csdev_to_cti_drvdata(csdev)	\
>  	dev_get_drvdata(csdev->dev.parent)
>  
> +static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
> +{
> +	u32 offset = CTI_REG_CLR_NR(reg);
> +	u32 nr = CTI_REG_GET_NR(reg);
> +
> +	return drvdata->base + offset + sizeof(u32) * nr;
> +}

Could you try below change, which is more straightforward?

  static void __iomem *__reg_addr(struct cti_drvdata *drvdata, int off,
                                  int index)
  {
  	return drvdata->base + offset + sizeof(u32) * index;
  }

  #define reg_addr(drvdata, off)                 \
        __reg_addr((drvdata), (off), 0)

  #define reg_index_addr(drvdata, off, i)        \
        __reg_addr((drvdata), (off), (i))

> +
>  /* write set of regs to hardware - call with spinlock claimed */
>  void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>  {
> @@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
>  
>  	/* write the CTI trigger registers */
>  	for (i = 0; i < config->nr_trig_max; i++) {
> -		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
> +		writel_relaxed(config->ctiinen[i],
> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));

                writel_relaxed(config->ctiinen[i],
                               reg_index_addr(drvdata, CTIINEN, i));

>  		writel_relaxed(config->ctiouten[i],
> -			       drvdata->base + CTIOUTEN(i));
> +			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));

                writel_relaxed(config->ctiouten[i],
                               reg_index_addr(drvdata, CTIOUTEN, i));

[...]

> +/*
> + * Encode CTI register offset and register index in one u32:
> + *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
> + *   - bits[24:31] : register index (nr)
> + */
> +#define CTI_REG_NR_MASK			GENMASK(31, 24)
> +#define CTI_REG_GET_NR(reg)		FIELD_GET(CTI_REG_NR_MASK, (reg))
> +#define CTI_REG_SET_NR_CONST(reg, nr)	((reg) | FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
> +#define CTI_REG_SET_NR(reg, nr)		((reg) | FIELD_PREP(CTI_REG_NR_MASK, (nr)))
> +#define CTI_REG_CLR_NR(reg)		((reg) & (~CTI_REG_NR_MASK))

I know this might come from my suggestion, and it is also will be
heavily used in patch 04.  We can have strightforward way to
implement this, please drop these macros.

I will reply in patch 04 separately.  Sorry my review might cause
extra effort.

Thanks,
Leo

