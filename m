Return-Path: <linux-arm-msm+bounces-95592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB2vA0ddqWkL6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:39:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC9B20FCAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68F2D301F785
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D673822B8;
	Thu,  5 Mar 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNXALXvs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C137AA83;
	Thu,  5 Mar 2026 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707137; cv=none; b=DPZDolij282wzUaZfrRoUJYGE0n9GG1FeiYJApJhbQFSVSCecAqEJa1nJEyXZs9nvzVR65X04AmUoFei8AqW2uISleXB4Z2nAsu8rJwNcQCQGHBe7jZJ5Z0SFWMypS0xkSJqjn6ePN9t5YDeYvI6Qi/en5i5EijIIR3R9U32RK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707137; c=relaxed/simple;
	bh=56dnd+yJBrELoNOf74QX1gXElP1APH+JtJUeVGWJ7VE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JzcvfSpi7cZos+vl3vrC0VMRaO+3gTLlcwWXrjnAMWRqoZ61gmP7SlICkYlUfb2QibMU50R0svbunedpx4zLxi5MjjdO7DBWwBYTwXCG5Styf0dfOhXMyLqZDAPOdJhkenyk9NlIpMG3qn34q/Krh/EabrigzF2j/cvtigSW0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNXALXvs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD304C116C6;
	Thu,  5 Mar 2026 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707136;
	bh=56dnd+yJBrELoNOf74QX1gXElP1APH+JtJUeVGWJ7VE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aNXALXvs+G1hWLA6P+I+h/DReCJXZSm97mHKep8u8GFL36LFVxIH+i5y7WFv+iKDf
	 45lyWVNJcbnfmUSizIK1p/UBS8e7RFQIp5f3mE6X07ogThBerQzn7xQC0Shd7VE7cU
	 KiR82ar/+6EdLt20Ma6DhKNQwIrZ038LN8Mc5GCw/5/EpuWBWmx2bY5TlKmOVzfZ5w
	 GuNJtHMaYCew95aZFYNZ+rUml6q3wiVNhVMuCROl8gMx+t0njgof7PG++ea3FnNO1k
	 Mxr4pwcNMwUq/T0qaURlUt+cqz7aRmpPKyfU3p/AJmRmDIUXrcXM0NOAv/TJeEX+Lh
	 nsjyHZw1EbifA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vy66Y-0000000GOmb-1qAv;
	Thu, 05 Mar 2026 10:38:54 +0000
Date: Thu, 05 Mar 2026 10:38:53 +0000
Message-ID: <86tsuu7e82.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
In-Reply-To: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
References: <cover.1772644406.git.geert+renesas@glider.be>
	<d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
	<86v7fa7fdq.wl-maz@kernel.org>
	<CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: geert@linux-m68k.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org, atenart@kernel.org, florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, mark-pk.tsai@mediatek.com, daniel@thingy.jp, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, jonathanh@nvidia.com, nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Queue-Id: 7BC9B20FCAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,nxp.com,pengutronix.de,gmail.com,linaro.org,baylibre.com,googlemail.com,mediatek.com,thingy.jp,collabora.com,nvidia.com,ti.com,socionext.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95592-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026 10:24:23 +0000,
Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> Hi Marc,
> 
> On Thu, 5 Mar 2026 at 11:13, Marc Zyngier <maz@kernel.org> wrote:
> > On Wed, 04 Mar 2026 17:21:58 +0000,
> > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > > Replace magic numbers by symbolic DT binding definitions.  This improves
> > > readability, and makes it easier to find where the various GIC
> > > interrupts types are handled.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/drivers/irqchip/irq-gic-v3.c
> > > +++ b/drivers/irqchip/irq-gic-v3.c
> > > @@ -35,6 +35,8 @@
> > >  #include <asm/smp_plat.h>
> > >  #include <asm/virt.h>
> > >
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > >  #include "irq-gic-common.h"
> > >
> > >  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> > > @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> > >                       return -EINVAL;
> > >
> > >               switch (fwspec->param[0]) {
> > > -             case 0:                 /* SPI */
> > > +             case GIC_SPI:
> >
> > I'd rather not do that. I use *numeric* values on purpose, because
> > that's what the DT *binding* describes, and I have no control over
> > what lives in that include file (it gets changed without me being even
> > Cc'd).
> >
> > So I want to stick to the binding, and not to the interpretation of
> > it. If you want symbolic values to be used, describe them in the
> > binding, have a tool to generate the values from the binding, and use
> > that everywhere.
> 
> This sounds more like a philosophical debate, so I'd like to defer
> to the DT maintainers...

That's not philosophical.

That's a pragmatic approach to having a common source of information,
and a unique reference. Carrying an extra copy that can be
independently changed is a source of errors, which I've been trying to
reduce in other parts of the kernel (system register description and
encoding, for example).

> 
> About you not being notified: that can be fixed easily ;-)
> 
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2110,6 +2110,7 @@ F:        arch/arm64/include/asm/arch_gicv3.h
>  F:     drivers/irqchip/irq-gic*.[ch]
>  F:     include/linux/irqchip/arm-gic*.h
>  F:     include/linux/irqchip/arm-vgic-info.h
> +F:     include/dt-bindings/interrupt-controller/arm-gic.h

I'm actively trying to *remove* myself from the kernel, not to grab
more stuff.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

