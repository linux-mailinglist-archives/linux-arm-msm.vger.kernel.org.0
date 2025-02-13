Return-Path: <linux-arm-msm+bounces-47958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE42A35230
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 00:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37305189044B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 23:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D57522D7A3;
	Thu, 13 Feb 2025 23:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cXAIzKUh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fqCj/4yq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F6E2753EF;
	Thu, 13 Feb 2025 23:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739489360; cv=none; b=YhCpzctiPp7rkjs2bZrc8YoBryDEULh6sDhSPtG0Ks1HaTmzvvrM4ssCmSEJ17/EonhUIsyL9d02d/sUVODFge5wTlaUvZAvtUkit5yNx82IL1i5hXOaCeGOkCcFHvQHJHSfOSoJdDGe2w7toDqX4KXoj2/Wkl7V1U5Sb4WKs/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739489360; c=relaxed/simple;
	bh=yCg+JHVGinmY71jeGMv9PqGMuyQ8s3jFb15Rdodj5zU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C3HXgHGTlPUocivxDwOszFja2Q/P3P9EkRRHbcc+PBF7nd13DpvjlE0TZZs6pk0OJdHgb5/m9jNGmpjSPN5pmnhaMc0Phu0M8aIuZXpvbLZxNzo9e56B/nbJ6vLtZAJcWELWj53euWtDpuUXnr+ZBE0DgnyhEtf3BxzKLaF2TPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cXAIzKUh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fqCj/4yq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739489356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFcNt5odMLbKiXquXUnztFXtBhO5k6+W01eUJBMil2g=;
	b=cXAIzKUh/DXopgkkyFWkTTBW8LgVQ+67V4PJk0k+1gyCqZPPD8+GLX4eY/sxRdThNwQhEi
	IrUqQKXn/71/T1gVrYlfxNzGWxjPIxgSLwWGzIwNPefG/MXH6iUE+uWvWqrWwwI/pAp4G/
	4pQp1rPTb0ZYbf8Fus8A7mxXgpF6BoXz3EunJ8M7xTx74TJJVDEr912IepD7b0En8C5C/M
	e8ho3SZTUdsKXImSIs6eKNKxaO+WzTHl3cDlDAbtqVqnQ551Cw8zzbIbBnwtTm96vh7/S3
	MAyy9vCA7wvS9sMzMP6GOLjDyWZhUTld0pVr2Qwu9EgaGb+Mkxwej220jMT+9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739489356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFcNt5odMLbKiXquXUnztFXtBhO5k6+W01eUJBMil2g=;
	b=fqCj/4yqaHP++Z90jOneJHDu4njRFMgeh4MQsVWo4uGjsN8JOpmHUa21LAX9uP3y7Dv1QZ
	ZiSyWWpRtUYoW5CA==
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Maulik Shah <quic_mkshah@quicinc.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, Johan
 Hovold <johan.hovold@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-pdc: Workaround hardware register bug on
 X1E80100
In-Reply-To: <20250213-x1e80100-pdc-hw-wa-v1-1-f8c248a48cba@linaro.org>
References: <20250213-x1e80100-pdc-hw-wa-v1-1-f8c248a48cba@linaro.org>
Date: Fri, 14 Feb 2025 00:29:16 +0100
Message-ID: <87h64xjuer.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 13 2025 at 18:04, Stephan Gerhold wrote:
> +
> +static void _pdc_reg_write(void __iomem *base, int reg, u32 i, u32 val)

Please use two leading underscores to make this easy to
distinguish. But ideally you provide a proper function name which makes
it clear that this function operates on a given base address contrary to
pdc_reg_write() which uses pdc_base unconditionally.

> +{
> +	writel_relaxed(val, base + reg + i * sizeof(u32));
> +}
>  
>  static void pdc_reg_write(int reg, u32 i, u32 val)
>  {
> -	writel_relaxed(val, pdc_base + reg + i * sizeof(u32));
> +	_pdc_reg_write(pdc_base, reg, i, val);
>  }
>  
>  static u32 pdc_reg_read(int reg, u32 i)
> @@ -60,6 +69,26 @@ static u32 pdc_reg_read(int reg, u32 i)
>  	return readl_relaxed(pdc_base + reg + i * sizeof(u32));
>  }
>  
> +static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
> +{
> +	void __iomem *base = pdc_base; /* DRV2 */

Please do not use tail comments. Also what is DRV2? 

> +
> +	/*
> +	 * Workaround hardware bug in the register logic on X1E80100:
> +	 *  - For bank 0-1, writes need to be made to DRV1, bank 3 and 4.
> +	 *  - For bank 2-4, writes need to be made to DRV2, bank 0-2.
> +	 *  - Bank 5 works as expected.
> +	 */
> +	if (bank <= 1) {
> +		base = pdc_drv1;
> +		bank += 3;
> +	} else if (bank <= 4) {
> +		bank -= 2;
> +	}

This is confusing at best. You map two different base addresses:

  1) The existing pdc_base, which magically is associated to DRV2
     (whatever that means)

  2) A new magic pdc_drv1 mapping

Then you implement the workaround logic in a pretty uncomprehensible
way. I had to stare at it more than once to make sure that it matches
the comment. What about:

    /* Remap the bank access to work around the X1E hardware bug. */
    switch (bank) {
    case 0..1:
         /* Use special mapping and shift to bank 3-4 */
         base = pdc_base_x1e_quirk;
         bank += 3;
         break;
    case 2..4:
         /* Use regular mapping and shift to bank 0-2 */
         base = pdc_base;
         bank -= 2;
         break;
    case 5:
         /* No fixup required */
         base = pdc_base;
         break;
    }

which makes it obvious what this is about. Hmm?

> +	_pdc_reg_write(base, IRQ_ENABLE_BANK, bank, enable);

> @@ -324,10 +357,21 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
>  	if (res_size > resource_size(&res))
>  		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
>  
> +	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
> +		pdc_drv1 = ioremap(res.start - PDC_DRV_OFFSET, IRQ_ENABLE_BANK_MAX);

What? This maps outside of the resource region. That's neither documented in
the change log nor explained here.

I assume this can't be properly fixed in the device tree for backwards
compability reasons, but leaving this undocumented is a recipe for head
scratching three month down the road.

PDC_DRV_OFFSET is not obvious either.

You really want to explain this properly at least in the change log,
i.e.:

    X1E80100 has a hardware bug related to the address decoding of write
    accesses to the IRQ_ENABLE_BANK register.

    Correct implementations access it linear from the base address:

      addr[bank] = base_addr + IRQ_ENABLE_BANK + bank * sizeof(u32);

    The X1E80100 bug requires the following address mangling:

      addr[bank0] = base_addr - 0x10000 + IRQ_ENABLE_BANK + 3 * sizeof(u32);
      addr[bank1] = base_addr - 0x10000 + IRQ_ENABLE_BANK + 4 * sizeof(u32);
      addr[bank2] = base_addr           + IRQ_ENABLE_BANK + 0 * sizeof(u32);
      addr[bank3] = base_addr           + IRQ_ENABLE_BANK + 1 * sizeof(u32);
      addr[bank4] = base_addr           + IRQ_ENABLE_BANK + 2 * sizeof(u32);
      addr[bank5] = base_addr           + IRQ_ENABLE_BANK + 5 * sizeof(u32);

    The offset (0x10000) is outside of the resource region and requires
    therefore a seperate mapping. This can't be expressed in the device
    tree for $sensible reasons.

    Mapping this region is safe because $sensible reason.

I might have oracled this out of the patch/change log incorrectly, but
you get the idea.

Thanks,

        tglx

