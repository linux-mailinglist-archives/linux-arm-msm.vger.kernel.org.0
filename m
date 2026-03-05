Return-Path: <linux-arm-msm+bounces-95539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MZfL0RAqWkJ3gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:35:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E920D832
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF5D73014F6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D878329E7E;
	Thu,  5 Mar 2026 08:35:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA9340D90
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699711; cv=none; b=TRUe79T3c301cJHgabDWrcaAl5pUdghNV+Ze3u2wHIWx8bElx6ICEPmzZDwTX6/lcDT37+4D17dyWBFaQnf6LbacFH7UE2xpJ6ysGANVj0YH0GmSV8ApR29aoHpCIJbBlSDEyKDfzFkzsBbZBuHC7TIulfim6LXxk4LCcYKXrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699711; c=relaxed/simple;
	bh=CSh/OPgCewZMrxAGotXGAjNREHTmD2ri4RotS2E+6yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WL2bNS+vFpfHGMFSUiGGmmQObsrivBAi+eZfRodvrJ2nxpNj7lz/sVlMFU7usjGS90IgHA5zsM8kqxhPQOf+drSlD+GPW94D98Ec+Z5fqUkyzookaqyKvcTBGzO9oTuebHL6Dzsf0TNNKfb52Q3eJROYRC4Nj2N81zllFzwyMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4638a18efc2so5251273b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699709; x=1773304509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=;
        b=KZMtyZoug1EAnATzW0OS4UWTNCLxCFxHllUGhuebHDYD0LO+2fJgBugrzyGm9SLxcP
         ZLvpUmyh8Gq3qKADZ+psvtU/MUbmADnztt/N63wfc0yiQESLlMgbioPh8uO9qucBOshh
         ovOzyV8sB+0SXWi8qhNK0uldx/J3hfsIEjegzgZpE4L5rcnty8kI7J2Q3hXzKZa3Yt6c
         iNeLO2J75+QVaLHhw2Cq7hhjCYcQvMbBpZKeryWDghLz9Fo9mvl1N6YKsRVccNymfNOF
         D1AWKMZPr9oN3g2oD1zhI8DnCpEv8E4G+FFzcHamf8VuweSx79uCrn7Ho6YVvLV/R8On
         mQqw==
X-Forwarded-Encrypted: i=1; AJvYcCX5LMKWfLmp37ceCdB2lzJJpobRcabGcGr56s0owM1bczLPgdpQ/L3AELDu2jDrT+GECbwXr94g/q4uiFfH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc96dHXWWKU4/DAcHH7+MITh205GCyfeDdL5t4MDxw8ELJS0GX
	C4Kub5pweAYR/idhA34sHFijlMFhUsDQvsfboeGTKe745xBPmYyeY7TL3r5ovrqX
X-Gm-Gg: ATEYQzyso6/gZBDplHbB6y3Sq1yRIo6iM+m2gUIdePO99TlfJRvVSjQ/buROSdgs/bf
	mzt6FCrxzc8drpZ5JOdaiVyKBxo49fZ6s09ZiMu5DNJRpxLouh8+ZQ5zMMKPijdBOQP8dn+c3Vj
	H/Gt2X73S1NXOiQ8uDv1eCGv5f60ftcM3sJo8xQWS6nmNXd6fi5SmgzlkL4jNTXWAQNQjmQVAhg
	acLrjzJyqSzqMihCIZ6xwCVEF/sjyQywlgE2OvyCRg6/p6PtvTsfa7IGJScXbyvqra/ILdCRayZ
	kT91b/wf/kYNLIAUVMWqJXFXKuOANagb3OO0ExLdJ61kufxjVCdQuI7aZAQoJysD0Vt1sdNpWEp
	egiEojfVCA19c3KNARgFDI/BOdNCfh9wzIuKZngndoOXoSW3q5notf30DpmMi4wx71wc6UsnZED
	pjHqGhZlU1c0QRKECwGA+R7hsOewWmfi/7g5hh1qGct7qR9bQjCyql1lp8W28Pbmzt
X-Received: by 2002:a05:6808:1921:b0:463:b0f9:63c1 with SMTP id 5614622812f47-4651abb3f04mr2707221b6e.20.1772699708798;
        Thu, 05 Mar 2026 00:35:08 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb605f15sm13278504b6e.20.2026.03.05.00.35.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:35:08 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4638a18efc2so5251265b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:35:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWEc6n//5OJtOk/fTMejNlaXfE8ro9KcWOgE2eDXYJ8sP1Us/BUjyuEEI3IwPpPgsxPzIE2y2WPDy0ze3w5@vger.kernel.org
X-Received: by 2002:a05:6102:2ac9:b0:5f7:24dc:3ac3 with SMTP id
 ada2fe7eead31-5ffaaa86250mr1899404137.7.1772699399463; Thu, 05 Mar 2026
 00:29:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
X-Gm-Features: AaiRm53mHozL13yvxji6rv0MKzaGvWxuhr7SWHD2SjBJ0VWNhqppZZeXezGpDhg
Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
Subject: Re: [PATCH phy-next 17/22] net: renesas: rswitch: include PHY
 provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Michael Dege <michael.dege@renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C76E920D832
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-95539-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.948];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,nxp.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> As a PHY consumer driver, the Renesas rswitch dereferences internal
> fields of struct phy, something which shouldn't be done, as that is
> going to be made an opaque pointer.
>
> It is quite clearly visible that the driver is tightly coupled with the
> drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
> on the Generic PHY subsystem.
>
> This was discussed before here:
> https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/
>
> but to summarize, it is generally expected that when a Generic PHY
> function is called, it takes effect immediately. When this doesn't
> happen, the PHY provider driver must change its implementation rather
> than the consumer be made to work around it. PHY providers which rely on
> a hardcoded call sequence in the consumer are just lazy and wrong.
>
> The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
> Add phy_power_{on,off}() calling"). Problem description:
> - Ethernet PHYs may change phydev->interface. When this happens, the
>   SerDes must learn of the new phydev->interface using phy_set_mode_ext().
> - drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
>   but this only caches the mode and submode into channel->phy_interface
>   and applies this to hardware during phy_power_on().
>
> The commit author decided to work around this at the consumer site, by
> power cycling the PHY for the configuration to take effect.
>
> This had a worse implication from an API perspective in subsequent
> commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
> It was observed that phy_power_on() and phy_power_off() calls need to be
> balanced, and so, the consumer decided to start looking at the struct
> phy :: power_count (the technical reason why I'm making this change).
>
> This is also wrong from an API perspective because
> - a consumer should only care about its own vote on the PHY power state.
>   If this is a multi-port submode like QSGMII, a single phy_power_off()
>   call will not actually turn the PHY off (nor should it).
> - the power_count is written under the &phy->mutex, but read unlocked
>   here.
>
> The rswitch and r8a779f0-ether-serdes drivers both need to be completely
> rethought in terms of Generic PHY API call sequence. There is no quick
> fix to apply. Just include the PHY provider API along with the consumer
> one, to keep working as before when struct phy will be made an opaque
> pointer to normal PHY consumers. But this is a bad offender (and it's
> not even a provider) so add a FIXME.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

