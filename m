Return-Path: <linux-arm-msm+bounces-111027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xPUXCipQIGpf0wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:02:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6586C639868
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:02:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=M4tKmGsa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6120318333C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 15:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245BF3B6350;
	Wed,  3 Jun 2026 15:13:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047283D1AB3;
	Wed,  3 Jun 2026 15:13:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499584; cv=none; b=CBRtwLwwnhMDpovwo+ZXYACgwEkjOAYVLoZkYMx7yRULwHgLXevR7xA0LP72R+lfkxdTkrEdTsTts/afNrVelMd81449rlKwLWSrbgC0zyVSJPkzjtZl2rs3K6vGYq9/g1dXEP1iSz3ktjhu1Hxb/a99gn+am2qq7v57H7tW5y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499584; c=relaxed/simple;
	bh=bGv6026XnhDm8i+aKTBXzQ0LNc5FoJ6CnAMYvnx4k6Q=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i4ZthIeQFj9GEoMPn4N47EtZ/h2SaqNE/GwprCNnI37g4hZotcROgimcuTPqnXMyiFqTgCBfZkJVbCMKTjiytM4mpI4DuK0kzOSJsXmfVhgFGEdxcJBng01oMIZvGZKko0OZDq+z36r8obZdoTmo4Qbo4gLQa0UqSwhdRBmZJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4tKmGsa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9051F00893;
	Wed,  3 Jun 2026 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499582;
	bh=9gPkGzXG0HU/tmXo8RdeundsdIGxa43c7OU1rJGKo7A=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=M4tKmGsaYH/lff+c0Ae3MHSW2FbvA6PTeiPQ4bIhA2KQJzMf+I3V8Qgc8w1GJn2Vy
	 KHYCsPeMkMWj244DQb0D27w3oZnqkFqvhisTxN5k+q/X0usb0MAaJ9jAfSEs7lL9AQ
	 39TgzIvy5WIC64XM//kGYp/2kq6zyAVVu5czwpGaAbIeFesePdG2etoWRvU1ssSPTM
	 LQpd0Q1jLYBVzbeIiL5yxBKETbMfSza/xALr1qmNnJ+N3zDCjMkp8FXxDPxuwSNTAh
	 F0dFEHGPKDAxLSPu0ghoQ40eZWSaQD8boCmDskDcOzWI+jZpyB2oUJ3BS4JlpMghxx
	 mRWG6nm8MjQPQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>, Bjorn Andersson
 <andersson@kernel.org>, Clark Williams <clrkwllms@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Konrad Dybcio
 <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Rob Herring <robh@kernel.org>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Steven Rostedt
 <rostedt@goodmis.org>, van Hazendonk <github.com@herrie.org>
Subject: Re: [PATCH v2 2/2] irqchip: add MSM8x60 MPM wakeup interrupt
 controller driver
In-Reply-To: <0133fce127c7507bbb907d0258ad69ac8d753218.1780195817.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org>
 <cover.1780195817.git.github.com@herrie.org>
 <0133fce127c7507bbb907d0258ad69ac8d753218.1780195817.git.github.com@herrie.org>
Date: Wed, 03 Jun 2026 17:12:59 +0200
Message-ID: <87ecin7j44.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111027-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:clrkwllms@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:robh@kernel.org,m:bigeasy@linutronix.de,m:rostedt@goodmis.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[sashiko.dev:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6586C639868

On Sun, May 31 2026 at 06:09, Herman van Hazendonk wrote:
> + *
> + *   1. Hierarchical irqdomain: for MPM pins that map to GIC SPIs (USB,
> + *      HDMI, ...). Consumers wire their interrupts through this
> + *      controller via interrupts-extended and the kernel manages
> + *      enable / mask / set_type / set_wake via the IRQ subsystem.
> + *
> + *   2. Raw-pin API: for MPM pins that do NOT correspond to a GIC IRQ
> + *      (SDC3_DAT1=21, SDC3_DAT3=22, SDC4_DAT1=23, SDC4_DAT3=24).
> + *      These are physical wake-signal lines monitored by MPM
> + *      directly. Consumers (mmci for SDC4 wake) call
> + *      msm8660_mpm_set_pin_wake() etc. The consumer API establishes
> + *      a device_link from consumer to producer so the MPM device
> + *      cannot disappear while a consumer holds a handle.

Why can't this be described in the device tree?

> +
> +struct msm8660_mpm {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct irq_domain *domain;
> +	struct msm8660_mpm_pin *pin_map;
> +	unsigned int pin_map_count;
> +	int parent_irq;
> +	struct mbox_client mbox_client;
> +	struct mbox_chan *mbox_chan;
> +};

https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers

Please read the rest of this document too.

> +
> +/*
> + * Singleton - there is only one MPM instance per SoC. msm8660_mpm_get()
> + * returns this. Updates are serialised through the binding lifecycle so
> + * a plain pointer is sufficient.
> + */
> +static struct msm8660_mpm *msm8660_mpm_global;
> +
> +static u32 msm8660_mpm_read(struct msm8660_mpm *mpm, unsigned int reg)
> +{
> +	return readl_relaxed(mpm->base + reg);
> +}
> +
> +static void msm8660_mpm_write(struct msm8660_mpm *mpm, unsigned int reg,
> +			      u32 val)

No line break required. You have 100 characters. All over the place.

> +static int msm8660_mpm_pin_to_hwirq(struct msm8660_mpm *mpm, int pin)
> +{
> +	int i;
> +
> +	for (i = 0; i < mpm->pin_map_count; i++) {

for (int i = 0; ....

> +		if (mpm->pin_map[i].pin == pin)
> +			return mpm->pin_map[i].hwirq;
> +	}
> +	return -ENOENT;
> +}
> +
> +/*
> + * IPC handler: MPM fires this IRQ when one or more enabled wake pins
> + * have pending activity. Read pending status, CLEAR the pending bits
> + * BEFORE dispatching the per-pin handlers so a fresh edge that arrives
> + * during dispatch cannot be wiped out by a later CLEAR write, then
> + * replay each pending pin through the irqdomain.
> + */
> +static irqreturn_t msm8660_mpm_irq(int irq, void *data)
> +{
> +	struct msm8660_mpm *mpm = data;
> +	unsigned long pending[MSM8660_MPM_REG_WIDTH];
> +	unsigned long enable[MSM8660_MPM_REG_WIDTH];
> +	int i, j;

See documented variable ordering and put the iterator variables into context.

> +static void msm8660_mpm_enable_hwirq(struct irq_data *d, bool enable)
> +{
> +	struct msm8660_mpm *mpm = irq_data_get_irq_chip_data(d);
> +	int pin;
> +	u32 val, mask;

See docs

> +static int msm8660_mpm_domain_alloc(struct irq_domain *domain,
> +				    unsigned int virq, unsigned int nr_irqs,
> +				    void *data)
> +{
> +	struct msm8660_mpm *mpm = domain->host_data;
> +	struct irq_fwspec *fwspec = data;
> +	struct irq_fwspec parent_fwspec;
> +	irq_hw_number_t hwirq;
> +	int i, ret;
> +
> +	if (fwspec->param_count != 2)
> +		return -EINVAL;
> +
> +	hwirq = fwspec->param[0];
> +
> +	for (i = 0; i < nr_irqs; i++)
> +		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +					      &msm8660_mpm_chip, mpm);

See bracket rules.

> +static void msm8660_mpm_remove(struct platform_device *pdev)
> +{
> +	struct msm8660_mpm *mpm = platform_get_drvdata(pdev);
> +
> +	/*
> +	 * Tear down in strict reverse order: drop the singleton so new
> +	 * consumers cannot grab a handle, free the IRQ so the handler

How is that serialized against a concurrent consumer request?

Also please look at:

   https://sashiko.dev/#/message/20260531043213.D18801F00893%40smtp.kernel.org

Thanks,

        tglx

