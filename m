Return-Path: <linux-arm-msm+bounces-95526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAXQGPE2qWlk3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:55:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C006120D007
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C99C7302F731
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734D32472AA;
	Thu,  5 Mar 2026 07:54:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271C13358B9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697263; cv=none; b=H3svznk5npMlOe3gZJBs2qvyXsnEvk0tDeNJrcJtzw9Uo8+OCL1s46y25ZaBArxeHEFYPFBorqZ5AR/zhMFHn23msA7TDNnIBrJIZkBPbfeFyfB3bUvDLWS01h5lZ+zOcYnvaPxk5as8qm1vWIsyziJB1/pwEZcd8/lKmzgAIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697263; c=relaxed/simple;
	bh=urVD1xPdaF3hV5GqXqVqTidMinFWi7P2lc2J0G3o7gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eF1CjnfdCNGEeRY42MBfTTt6AUmZHBHe8JBjLAbYRSLMnIJa2mhoHCX1X7VZDIGV5V9KiLcsIsZvDwCC9Gy7OXw7YlLQVeBB2x/SgWk3+7JCoaRM6fu9k2cX3e4xsOelKjhUHb2OMgmDO3Yu+SkGjUUsEwf3/uOMCfHX7nkQe44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4c9537f90so5498614a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 23:54:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697261; x=1773302061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=ugDbClm1YHMFXO9MaS2pGivaCXZzcNJjnXCbm+/IqbL2MjTHJMt8btaKzOaL74VBtx
         Lw8uLMCf4B/3/wdySzrxAtEU6f26D8zjvS+8UBzg8ZKW5R5DUeLcjj/cp0jCv4bOa2oa
         MRznukCW4UGSuJTf3vmIfmNTgs9ggpCWoHPDOulmtcLg2g+/soQvBz4q/WZlfUCi38JY
         Ipn4BUMUZvsNMNmGhB1i+e33BjYsg3vuGodzTwv7NIH3K00I0z/u18BuR/HgFhyrjyep
         vRD8QQAwaaAqpIaE1has20dHZIWWfiSERhOCaC/SnSCaeYsaqg8QrXE3nFArIFl5UGtj
         bddA==
X-Forwarded-Encrypted: i=1; AJvYcCX13jKLTLaVidxkteeFweOySZYU1LBAkLTwbry0YqEGRrVTvjCOZ3vTdnBObHNh9V/W/qu8D3CXSeh43QT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5IJMenRkffHENaMnWvKLO6hKnOUldPcu70tVEJbjFaQNDyV91
	zT/h9KGRRSzNpQWWzNvPcbiJUmF3q16bWca7ikWoNYSWuQgSyaRnFyv8UYUPshAF
X-Gm-Gg: ATEYQzznKwBITHTlwym7hcRN9GxAfXD2qSMaXnkp8DWVXV4PbR9aIvCF4XOGMUeRyqq
	YyqihCxarRV1JG5QgD4EL9mX8mdEc2w0XKr20S7ZT+7kNjBu3HPdBiO5NiTZC6CPw0eiEinKLaD
	yye062Oiy7Q7/ioZ1lc2NGzOLeyRqnI08seSZw3Droam+vWDR/5ckrM0P87D8jKw9DP/txcpkxw
	i9Nw3z7Y42CObWITc+p0+5XBHV/EchGsJKQ4m6Cn1oPtsu+zasV+zmPO6dEw3ZTZkTWauB5QATR
	wS3djEOvTGz1Fa7fNfCJvTVAXF3chwSvRS9ELz2trXJReoaXMfOkx34RdtxLauUQSH4QJpp0NWn
	HUE88NEMskAt2azjuQt9rEb1VKkbKaihxSuJgUNE3VKJD/zuaJMPZ98lIXkwGDo4luitETcRm6Q
	EJ+DuwArDMmDi2wiAkAVgC/d69CaEnP14s/UPW9qbdQZSiIz5yH2++sn99WLtYKTYFSMV4Xpx5f
	Q8=
X-Received: by 2002:a05:6830:4984:b0:7d4:96c3:3f6d with SMTP id 46e09a7af769-7d6c7f541fbmr3202368a34.7.1772697261198;
        Wed, 04 Mar 2026 23:54:21 -0800 (PST)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586626895sm19688308a34.18.2026.03.04.23.54.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:54:20 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4648447c899so4862222b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 23:54:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsmqO+WyejFYIFMpvaH0xXi2vlctsvoHfw8oy0OwdHp8FYu2/rkjQ3Qmpu4kUe5p7NJJbEdaBE7AalrmVM@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
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
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C006120D007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,baylibre.com];
	TAGGED_FROM(0.00)[bounces-95526-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

