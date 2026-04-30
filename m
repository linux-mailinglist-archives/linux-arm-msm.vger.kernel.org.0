Return-Path: <linux-arm-msm+bounces-105363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDFXMlpG82kMzAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:08:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D76A4A2975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9704301BCD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 12:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5072B3B19D5;
	Thu, 30 Apr 2026 12:06:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30CE39479F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550799; cv=none; b=F6kSTRxGs7fhaa4Flsoxk/uUhrjNJHq8ArnLdp+UyYgbUpC7qzpcTRxc59molhGNA97DZC7IpdZVfiMJdzymsB6sYmKW31MGMvdpM2S1iqgjGKD+9B2VDDN1LsACmZ9+RysgDLFSH0KUebBOBseskF6zswjOcjEIJaeJQ99yAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550799; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B967H9Mjol5YADvIQJ8Hb9vsPEMIN7vtLeLEj/0cF8t30xSOFQxLfnZL4OWw9PdIA9WYgXm1M1vuZpiLh8nUPQFhgD++cbQfzB69PbdwB0GxPDA1wdk56fNQZcAHk71x217zH9mwXCWqnduGDJ5PooILBGHR/F0A39Jt+2jc7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4645dde00a7so1352065b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550797; x=1778155597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=cyjOwNTu/wYAZDc5KUgiCKsH00l98u6LN/9JxWSd12vg6kkxqds90AXysdokLiqLXN
         QzxW0bhTSpF3haaVyg1dmeR2jEOVqxIOKMeKJzQcgcKo4RAfR4Jc5R7PA73BGa8p9S+7
         O9Js4ojaUVACl8s+GV+odfrMfk074xdANjLxwU6i9RsmmFFFYcCu8ynuDr+xJRnG4Hyv
         0dzI0u/bSkFDWUo1KMAeET1Kehy/kkXE4yu2DGz4teFK7KTMV+Xa16rGhiu1tPsXv3ja
         hctRg3/4X7WgQr3m4bHhfX3kV+Hv0hFzJT5KAW0HUad49M0nNpysw6TgT5SDMU24/ZV+
         K+ew==
X-Forwarded-Encrypted: i=1; AFNElJ8i8eu7FBK6qtsSaTq7CAkidsE3DP4OtALPXQFJLXz9LLqvhfwH2W45dOzwfNWaeyQJOeyWJsNl98YPqefg@vger.kernel.org
X-Gm-Message-State: AOJu0YxayT5c8yl2OHvL6Kno7WGa3Sp1DycUAkoVmdhkLmI459lh61L5
	egvbJCjDx+UtS3YV3ILX4nI2owL6Qe+NOeRm0SeBiSbBsh5IxAZN05vWqP26PzLM9gM=
X-Gm-Gg: AeBDietsUbPQGErNsMJASCxngUIhVDjvDvwJKhJlX2huziyg9RNKB3WO8iu+y9qSlzq
	pTrPaEjBqNThlpSCTWFqybRcJHoUcq4KVdvMC6pwS4THFMWGWmJ1U5heC+kwQebOUutvj/OOcVt
	SY5lGtU8PM4mzRRF5v9wEBRtBzz4Q3STbMhjB7136/6NeuvgLjU+NwayQzq6okFrZiHhC4WVhWY
	c4R6xII/0BgBHzZqRGojffTAlCFTxOZlojuqZB2KE3rde/HQ7pU0af6DaevcG1QGva/0JWZ3ozv
	b8y46WKebUNWmGVBz91qEA4hCEDhKXkjIwCIRE2gl2lpAKh1vjM2/avTJ4GwwFpDh5sE10kuSEC
	87XX+R6uzb3pKE5OcR708Z3bniB/qCs3a4Zee0q8UwBu4BmGSx8MZxvXaOT2ACn0JgZxqHntfp5
	x8D04N2LcIwuguAhpjY/mZjZIK68IeCMjUd7HwilX+sVQ3X6WTGjCFF23Wl547H1gaYve0QWM=
X-Received: by 2002:a05:6808:4fe3:b0:47b:e166:a277 with SMTP id 5614622812f47-47c621863a3mr718487b6e.33.1777550796831;
        Thu, 30 Apr 2026 05:06:36 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c440f1402sm2565105b6e.10.2026.04.30.05.06.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:06:36 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-42321c8b8f5so675234fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 05:06:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ83x+4Ji0N9HAcONJRVRjHhUC/Np8SZvSFFW41tywC2nvGJ9l5qM6/VDgwLlanf4rANN1zbysXwA0c+V4I9@vger.kernel.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2D76A4A2975
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,baylibre.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,glider.be];
	TAGGED_FROM(0.00)[bounces-105363-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,glider.be:email,mail.gmail.com:mid,linux-m68k.org:email,baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

