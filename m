Return-Path: <linux-arm-msm+bounces-110515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO8PDPQ0HWoqWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:29:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E3461AE3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA70D3013249
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 07:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7DE384CDB;
	Mon,  1 Jun 2026 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KY53wnmq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vWLLkcjb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1A3845A2;
	Mon,  1 Jun 2026 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780298764; cv=none; b=PnoLz17a+hWpU7XR1lBLoYLIxt+ywqrM9oqg+w1ah2J7gx3unoEdmRbmgmyvtQDLDXTKOvIHCU4CmLG0PRvKTfotk1/QX7BsYL4bcmDyoIeDNf07i+GOjyvmxoDYjzDys+kdBGWPdT/SH9ZvoROrSeQVLlEwQGtCoYoBADwu42Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780298764; c=relaxed/simple;
	bh=tXnpdsDCt57BJYmMaOirkJsWDUoOOn+z6QEvOX5EOQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9ajNiPuSd2OkyFY20gpMrkKlAe9jOD+Z4dv2CU4XOQ/RS4bWRByBh/z6g1QgYUhDy/pRd8r5n5iejeo8Mo6MVgufPO1FAQn7fmR3x8OV206pTEAU92/qIp2Lf6E/ZQkK3tJXfBHzJMlpRM/+1i2Pw4YTdU+r1LO4VDjMBoUBCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KY53wnmq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vWLLkcjb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 1 Jun 2026 09:25:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780298758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErsW1kxQ2wXq7SuUTwKS458YfvTC8trO9R0Xvvgkemo=;
	b=KY53wnmqT9B5gmThhZiRT8PF9Crv+HRaXptZoGL0/t9Lgg2CYHtrlT9QbyPxcXg9iq/qlD
	6DEFlqbCGqr1ZL3FKt0dukerlMALgznnu2elNjd5epaKIQYDyZrCbaLlHpeGwiBGtz+ScZ
	yHZ/3lDBR4w4slwJoOU6vACtKc3P1lsXArtLvU+QrcoY/xnY/KL1SjIuLl+l0bTQNei9+o
	0Zp3sa6RvFyiTFiiU2tjNRPV5Wb8Iu1edM3jA1CB5pvJFA+xN9F6dtJwQu6i7DPwnrNWP+
	grCpqrS0IAhY8rmuIdOwrXGQL9P37ru/9goj9IBA4e0LQGVRN3LvW0UU4FCx7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780298758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErsW1kxQ2wXq7SuUTwKS458YfvTC8trO9R0Xvvgkemo=;
	b=vWLLkcjbph/QqB5nn4UNhCmT7OKPUu56d02QmcXLnFHxFwSmB9W2c0UZxeNRGoYU9f7AIW
	y5mJrf4DB0+Wm5CA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 2/2] irqchip: add MSM8x60 MPM wakeup interrupt
 controller driver
Message-ID: <20260601072556.8gQxC6lw@linutronix.de>
References: <cover.1780148149.git.github.com@herrie.org>
 <cover.1780195817.git.github.com@herrie.org>
 <0133fce127c7507bbb907d0258ad69ac8d753218.1780195817.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0133fce127c7507bbb907d0258ad69ac8d753218.1780195817.git.github.com@herrie.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110515-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B9E3461AE3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-31 06:09:11 [+0200], Herman van Hazendonk wrote:
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -525,6 +525,29 @@ config QCOM_MPM
>  	  MSM Power Manager driver to manage and configure wakeup
>  	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
> =20
> +config QCOM_MSM8660_MPM
> +	bool "MSM8x60 MPM wakeup interrupt controller"
> +	depends on ARCH_QCOM
> +	depends on MFD_SYSCON
> +	depends on MAILBOX
> +	select IRQ_DOMAIN_HIERARCHY
> +	default y

This shouldn't by y by default.

> +	help
> +	  Platform driver for the MSM Power Manager (MPM) wakeup interrupt
> +	  controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060). The vMPM =
registers live inside
> +	  the RPM control block, which makes the generic QCOM_MPM driver
> +	  unusable here (it assumes a dedicated MPM SRAM region, an IPCC
> +	  mailbox, and uses IRQCHIP_DECLARE early-init that races platform
> +	  device creation).
> +
> +	  This driver replicates the legacy 2.6.35-palm arch/arm/mach-msm/
> +	  mpm.c mechanism as a regular platform driver, accessing the vMPM
> +	  registers via a syscon phandle to the RPM block and signaling the
> +	  MPM via the qcom-apcs-ipc mailbox (writing to GCC + 0x008 bit 1).

This is a reference to something that does not exist.

> +	  Required for cpuidle deep-sleep states (SPC/PC) and for
> +	  WoWLAN-style wake-from-suspend on MSM8x60 SoCs.
> +
>  config CSKY_MPINTC
>  	bool
>  	depends on CSKY
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 26aa3b6ec99f..3e64591f0f5b 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -100,6 +100,7 @@ obj-$(CONFIG_MESON_IRQ_GPIO)		+=3D irq-meson-gpio.o
>  obj-$(CONFIG_GOLDFISH_PIC) 		+=3D irq-goldfish-pic.o
>  obj-$(CONFIG_QCOM_PDC)			+=3D qcom-pdc.o
>  obj-$(CONFIG_QCOM_MPM)			+=3D irq-qcom-mpm.o
> +obj-$(CONFIG_QCOM_MSM8660_MPM)		+=3D irq-msm8660-mpm.o
>  obj-$(CONFIG_CSKY_MPINTC)		+=3D irq-csky-mpintc.o
>  obj-$(CONFIG_CSKY_APB_INTC)		+=3D irq-csky-apb-intc.o
>  obj-$(CONFIG_RISCV_INTC)		+=3D irq-riscv-intc.o
> diff --git a/drivers/irqchip/irq-msm8660-mpm.c b/drivers/irqchip/irq-msm8=
660-mpm.c
> new file mode 100644
> index 000000000000..b8394d9c076d
> --- /dev/null
> +++ b/drivers/irqchip/irq-msm8660-mpm.c
> @@ -0,0 +1,740 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MSM8x60 family (MSM8260/MSM8660/APQ8060) MPM (MSM Power Manager) wake=
up interrupt controller
> + *
> + * The MPM is an always-on hardware block that keeps a small set of wake
> + * sources alive while the application processor is powered down for
> + * cpuidle Power Collapse or suspend-to-RAM. On MSM8x60 the
> + * vMPM (virtual MPM) registers live INSIDE the RPM's 4 KB control block
> + * at:
> + *
> + *   request (control) regs: RPM_BASE + 0x9d8  (ENABLE, DETECT_CTL,
> + *                                              POLARITY, CLEAR)
> + *   status (pending) regs:  RPM_BASE + 0xdf8  (=3D=3D 0x9d8 + 0x420)
> + *
> + * The mainline qcom-mpm driver (drivers/irqchip/irq-qcom-mpm.c) is
> + * fundamentally incompatible with this layout:
> + *   - it assumes a dedicated MPM SRAM region separate from RPM;
> + *   - it assumes a mailbox controller (IPCC) for wake notification;
> + *   - it uses IRQCHIP_DECLARE which runs before platform devices exist,
> + *     so of_find_device_by_node() returns NULL and the init silently
> + *     hangs.
> + *
> + * This driver replicates the 2.6.35-palm `arch/arm/mach-msm/mpm.c`
> + * mechanism as a regular platform driver: probes after platform
> + * infrastructure is ready, ioremaps the vMPM sub-region of the RPM
> + * control block (the qcom,rpm driver maps the surrounding area for
> + * its own use; the two mappings overlap and neither claims exclusive
> + * ownership), and uses the qcom-apcs-ipc mailbox for wake notification
> + * (writing to GCC + 0x008 bit 1).

Again, a file reference to something that does not exist.

> + * Register access is done with readl_relaxed/writel_relaxed rather than
> + * via the RPM syscon regmap. The IRQ core invokes our mask/unmask/
> + * set_type/set_wake callbacks with the irq_desc's raw_spinlock_t held,
> + * and syscon regmaps use a sleepable spinlock_t which on PREEMPT_RT
> + * would deadlock under that raw lock. Direct MMIO is also what every
> + * other SoC irqchip (qcom-pdc, gic-v3, ...) does.

Why is this kind of description here and not in the commit message.

> + * Two consumer interfaces:
> + *
> + *   1. Hierarchical irqdomain: for MPM pins that map to GIC SPIs (USB,
> + *      HDMI, ...). Consumers wire their interrupts through this
> + *      controller via interrupts-extended and the kernel manages
> + *      enable / mask / set_type / set_wake via the IRQ subsystem.
> + *
> + *   2. Raw-pin API: for MPM pins that do NOT correspond to a GIC IRQ
> + *      (SDC3_DAT1=3D21, SDC3_DAT3=3D22, SDC4_DAT1=3D23, SDC4_DAT3=3D24).
> + *      These are physical wake-signal lines monitored by MPM
> + *      directly. Consumers (mmci for SDC4 wake) call
> + *      msm8660_mpm_set_pin_wake() etc. The consumer API establishes
> + *      a device_link from consumer to producer so the MPM device
> + *      cannot disappear while a consumer holds a handle.
> + *
> + * Copyright (c) 2026 Herman van Hazendonk <github.com@herrie.org>
> + * Copyright (c) 2010-2012, The Linux Foundation (legacy mpm.c reference)
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <soc/qcom/msm8660-mpm.h>
> +
> +/*
> + * vMPM register offsets (relative to the start of the ioremap'd window
> + * =3D RPM base + 0x9d8). Each register is two 32-bit slots because MPM
> + * exposes 64 wake pins.
> + */
> +#define MSM8660_MPM_REG_ENABLE		0x00
> +#define MSM8660_MPM_REG_DETECT_CTL	0x08
> +#define MSM8660_MPM_REG_POLARITY	0x10
> +#define MSM8660_MPM_REG_CLEAR		0x18
> +
> +/* Status registers at +0x420 from vMPM base (=3D=3D RPM + 0xdf8). */
> +#define MSM8660_MPM_STATUS_OFFSET	0x420
> +
> +#define MSM8660_MPM_PIN_COUNT		64
> +#define MSM8660_MPM_REG_WIDTH		2
> +
> +struct msm8660_mpm_pin {
> +	int pin;
> +	int hwirq;
> +};
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
> +{
> +	writel_relaxed(val, mpm->base + reg);
> +}
> +
> +/*
> + * Doorbell the RPM after touching the vMPM request registers. Without
> + * this the RPM keeps using its last cached copy of the enable/detect/
> + * polarity state and our configuration changes have no effect.
> + *
> + * Called from raw_spinlock_t-held contexts (irq_chip mask/unmask/
> + * set_type/set_wake), so the mailbox driver must accept that. The
> + * qcom-apcs-ipc mailbox just does a writel into the IPC trigger
> + * register; it is safe under a raw lock.
> + */

Where are these comments coming from?

> +static void msm8660_mpm_doorbell(struct msm8660_mpm *mpm)
=E2=80=A6

Sebastian

