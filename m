Return-Path: <linux-arm-msm+bounces-95585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KadE8BXqWkh5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:15:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE54520F86F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A7D8306CEE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B7937DE8F;
	Thu,  5 Mar 2026 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGxx742k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC81331204;
	Thu,  5 Mar 2026 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705637; cv=none; b=p2SOiWC9UcBh7z/Y8/AK2jfCXJ9Yk5qlDl8+qVjkhwL5+NmSjWzzyVR/E4xQ3U2X1DC+kQuGLqu2bWHXK0Mbm/3oAT/k4fWUmIZJsvBISq9ExX3HH9uFutbjRmtt2/b0vq/cH8oe+3jzaxuGnRVfNVGgUQUGJ7Zcx3Carqg9AcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705637; c=relaxed/simple;
	bh=gLlEtYagEKIFjG5F8a3A/NR9PRdUS4OHscROMOIMXZA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcbEFctYv9Cgfbw27kGCh+gsj8XCP1/QN8m64Iobst3elptXHTd2f9+S3qUFTcA6oXGeKT3sFoTsE55/txW69zHsqyHJVVymq3M9XHCYqaf9p90KlwdtvlmBKKNrqN2aaYUeM/ndBCbt/wi0zdCIpuWTBBaZ3QG9r6qy1ewGCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGxx742k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52AEC116C6;
	Thu,  5 Mar 2026 10:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772705636;
	bh=gLlEtYagEKIFjG5F8a3A/NR9PRdUS4OHscROMOIMXZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OGxx742ke8ndUq+KKpCoK78oYVQ+tBt9CF0nBSTEw5V6sjEK34QB1i75slSO+ilb5
	 bzv8SKdM+Aj941MheVLLmptyNHH2aZRlbMyfKcyximmU0Iqru503CIvVVpvKQewuVJ
	 I1gkrYmmRNt70fhzjJFOJIBOr43VyqJZnMKOHmI4BpNrGBTGz3h27oyGs2gULFRa48
	 cK56WnPdi+Oq6gXwLZby4u/gIzKC/Y28ebuttCuqXyLbELbpasi/D2md3AQnhSl5BY
	 P9X2qwHlg3WZH66oyHfOnWJ2bJhliZovnSdIh46cr0FMTHaQ40jjxu7XbWLeozpAnG
	 I1rOHUQJMHF/Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vy5iM-0000000GOHR-0DfY;
	Thu, 05 Mar 2026 10:13:54 +0000
Date: Thu, 05 Mar 2026 10:13:53 +0000
Message-ID: <86v7fa7fdq.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
In-Reply-To: <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
References: <cover.1772644406.git.geert+renesas@glider.be>
	<d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
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
X-SA-Exim-Rcpt-To: geert+renesas@glider.be, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org, atenart@kernel.org, florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, mark-pk.tsai@mediatek.com, daniel@thingy.jp, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, jonathanh@nvidia.com, nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Queue-Id: EE54520F86F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,nxp.com,pengutronix.de,gmail.com,linaro.org,baylibre.com,googlemail.com,mediatek.com,thingy.jp,collabora.com,nvidia.com,ti.com,socionext.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95585-lists,linux-arm-msm=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 04 Mar 2026 17:21:58 +0000,
Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> Replace magic numbers by symbolic DT binding definitions.  This improves
> readability, and makes it easier to find where the various GIC
> interrupts types are handled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/irqchip/irq-gic-v3.c | 14 ++++++++------
>  drivers/irqchip/irq-gic.c    |  6 ++++--
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index d75163e71bf22473..6ac103cb40097acc 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -35,6 +35,8 @@
>  #include <asm/smp_plat.h>
>  #include <asm/virt.h>
>  
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>  #include "irq-gic-common.h"
>  
>  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
>  			return -EINVAL;
>  
>  		switch (fwspec->param[0]) {
> -		case 0:			/* SPI */
> +		case GIC_SPI:

I'd rather not do that. I use *numeric* values on purpose, because
that's what the DT *binding* describes, and I have no control over
what lives in that include file (it gets changed without me being even
Cc'd).

So I want to stick to the binding, and not to the interpretation of
it. If you want symbolic values to be used, describe them in the
binding, have a tool to generate the values from the binding, and use
that everywhere.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

