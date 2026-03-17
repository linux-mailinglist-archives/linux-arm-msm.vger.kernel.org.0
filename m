Return-Path: <linux-arm-msm+bounces-98096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z+DIFscSuWkmpQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:37:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE55A2A5C42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81D553055C42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE90338E5D6;
	Tue, 17 Mar 2026 08:36:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880073947B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736587; cv=none; b=XYxica0z7HVTCcz4aOLuiiNURuIggSuWB6wOWMjk8DKVKKkD4AurrHIShsJ4Uu86UiYtIEeWS54KjhxWcfXb+GoR08Gi9kXNgZgKJ+D6vwSwfWdGplZUtMBc88uuD33/kxSvVKpfSau41dasPPtu4dTXiN/5uD7hRE+6HImaZu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736587; c=relaxed/simple;
	bh=1IbAI1LF70M+Kjw+h3BaLZwBsh7cf418N6PFDl+oOnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/tGwwyAJJaNVpy2Jbc+wnqoCK9C+yVvO4Np+Sq886W+HllSaOTiBgvkzsh7aez5d77yDIOm9kv3a74bxVN5v9MlxlWolSizbcpWZuzGIY7ltrHbv5Bzlb4JpkfPK5inruJbjyiuzdN9RkYYKMzfvbagi7rEgsKsCfVls0A+bfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-950de852f31so470124241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 01:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773736585; x=1774341385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idH2bB7nbOzzZw2WFTC74GwVow5g1kiitlzGsuFZK5o=;
        b=W3+iZAZ5aZSJ81uUVatSmMa/w6LjdtU6Rrsk6CD/Xp50KYlPb0pVQRZYr70RMe1hBi
         s6Vr+UMKaKAKn6oDRWZ2HoWpL5ssqJNDFXUmkKTDTHj0fusG76ZzzBJBWo33lNxl7Bxb
         vmQsoIzM8kNr6aBJGLEZ2g6h5tQIR71fkW50JAB6NNWia4yAmRJPka2uqIXpxAwuOlGh
         ay4nc3UXw6Ise4ovJ16ZVxKxTASmLN1V/XQ2A55BR4R9VR8a9CyhyQCUIKLnju47toH6
         KpngRNQUfxvqwt29dmlt4Rw9HPR4qnoVkbpMWlehufXL7wv4zCy12EiBwQsOubmzoTej
         Ofyw==
X-Forwarded-Encrypted: i=1; AJvYcCUWfbXHOUxEcKJULCdUIzXIxCwrTRCh43/wwi0p5ER8OaQdJVwlnc2a9frm+At6kWa6JqTsoMGl/WARPCR/@vger.kernel.org
X-Gm-Message-State: AOJu0YyE3nZNs1iTb7tBHWqLMdL1DW8pSu4NGS93wcp9v3AXppBIRYOz
	GAJ/0qVfqar8kkGUnFWtkb35yfzIbDuloUSYMKyRgLIDvufzg/ll32loDmkzhAJs
X-Gm-Gg: ATEYQzx+lvlg2invEoYLI3uwfZDDH5l6gH8CjE2UhQLlhl2fgfRtbqTXnDjeWgnJ5Mb
	LlK+6izlKqQanQazeVSeeFZFL4SP8Nv0kOKYTEnu7A3GEM8OUVzJASGSjM4O1mNOocsWg9/SZ0j
	cY72SUs4U+6QL6vVRSLaCLPzqwdjmpFBY8LpyX90MtYyuy+iyM2otupRRCnOtUUtZnw0RlDlra+
	jZo6r3tIZsT46s7dvKFF9c0bUdBbSiailqcCIgqPVZlzpOE9Z3fVoaH4F/N9nuc8qBuoJxrbWDk
	CREhnBorEUBAH/A/pdH10RTt9ElCouhHNjIy8/RiSd7CuvBoMJFKey/maYrPOGAWmRJ/pUaxXzE
	OVGcy5kBQHWBXIi3sS2Gv7dafVUOHz33e2j1G6s5Ix/yBmYtDDSqjU+gLosRfDiDrf04Eel+cxd
	LKmUL+X0FIR+Kvy9O+Odv9qIdqiQRv7FhvTlibq7FuaHm6fkEKN7mtNci/wkYWo/ol
X-Received: by 2002:a05:6102:ccd:b0:600:11e1:2a4b with SMTP id ada2fe7eead31-6020e5a22bbmr6033992137.34.1773736585440;
        Tue, 17 Mar 2026 01:36:25 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601d505285bsm8164064137.0.2026.03.17.01.36.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:36:24 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso2008669e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 01:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkfxilejWBYTU3FXmvnHUY/bmgOz1122QEMcfDjxyFPlO9SSropwNsUnhe21RuAVJ4D/AeUb2+oHphd9YO@vger.kernel.org
X-Received: by 2002:a05:6102:5127:b0:5ff:2569:cfe7 with SMTP id
 ada2fe7eead31-6020e2129e6mr6024902137.10.1773736584585; Tue, 17 Mar 2026
 01:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org> <20260303115720.48783-5-dakr@kernel.org>
 <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
In-Reply-To: <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:36:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
X-Gm-Features: AaiRm50LJFP1R3ITAUSRjqb1napf13plX5N5KjefHP89RPorlF5H9VKuGn2urAs
Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-98096-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.955];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE55A2A5C42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Danilo,

On Tue, 17 Mar 2026 at 00:57, Danilo Krummrich <dakr@kernel.org> wrote:
> On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
> > diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> > index 143747c45206..3cd17bb0be67 100644
> > --- a/arch/sh/drivers/platform_early.c
> > +++ b/arch/sh/drivers/platform_early.c
> > @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct device_driver *drv)
> >  {
> >       struct platform_device *pdev = to_platform_device(dev);
> >       struct platform_driver *pdrv = to_platform_driver(drv);
> > +     int ret;
> >
> >       /* When driver_override is set, only bind to the matching driver */
> > -     if (pdev->driver_override)
> > -             return !strcmp(pdev->driver_override, drv->name);
> > +     ret = device_match_driver_override(dev, drv);
> > +     if (ret >= 0)
> > +             return ret;
> >
> >       /* Then try to match against the id table */
> >       if (pdrv->id_table)
>
> I was just about to pick up this series, but then noticed that checking for
> driver_override in the platform_early case doesn't make sense in the first place
> and was accidentally added when the platform_match() callback was copied over in
> commit 507fd01d5333 ("drivers: move the early platform device support to
> arch/sh").
>
> Thus, I'm going to drop this hunk and add in the following patch; please let me
> know if there are any concerns.
>
> commit 39cae4095efda4b00b436c0fc46f21de84128969
> Author: Danilo Krummrich <dakr@kernel.org>
> Date:   Tue Mar 17 00:37:15 2026 +0100
>
>     sh: platform_early: remove pdev->driver_override check
>
>     In commit 507fd01d5333 ("drivers: move the early platform device support to
>     arch/sh") platform_match() was copied over to the sh platform_early
>     code, accidentally including the driver_override check.
>
>     This check does not make sense for platform_early, as sysfs is not even
>     available in first place at this point in the boot process, hence remove
>     the check.
>
>     Fixes: 507fd01d5333 ("drivers: move the early platform device support to arch/sh")
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> index 143747c45206..48ddbc547bd9 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -26,10 +26,6 @@ static int platform_match(struct device *dev, struct device_driver *drv)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct platform_driver *pdrv = to_platform_driver(drv);
>
> -       /* When driver_override is set, only bind to the matching driver */
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> -
>         /* Then try to match against the id table */
>         if (pdrv->id_table)
>                 return platform_match_id(pdrv->id_table, pdev) != NULL;

Nice catch!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

