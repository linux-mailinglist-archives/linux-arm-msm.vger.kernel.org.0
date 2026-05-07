Return-Path: <linux-arm-msm+bounces-106323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHa3A8NZ/GnMOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:22:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CFF4E5B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D93583006093
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 09:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5853B47C1;
	Thu,  7 May 2026 09:22:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A73BE17F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145720; cv=none; b=r4VMF0lGtTrEB5hHPLeTwm+xRjTZCW0r8lw22Uo+bc5SLgXLpTFclZYruCMS0Qxyqu0zTsP515ulCqLT4p0T9VQlQUVwRjWfyfG/0ZE4MNGqsdbbpjkW9WtxzY9ZmNg32vDpS0egxiZeaQur1rf0Bpj8D5YWE6NIPATiV2WcSZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145720; c=relaxed/simple;
	bh=IwrNVFKzSRTdZ5JveLi918fTr6rocBDAoIvz3oaLMZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7rfHU8FWLFjaI/bTGKerlhFZTZ7qQ9BdT4Kp7MopPFMbCiAG9ucz1t/VGa538BsN+/5KAXtyoYRLkq4qwka7e3DVoAk93ECQRr7hLKoBMBy5Rld+cqxzgBKpdzez/xjXc4UOyN4osJLJ+c6Z7r4WpUtQP5NNvxIXZWBnYgEJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-575320e6f2aso484422e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 02:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145713; x=1778750513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlQwLkoJNNdnPrw8knAwIybrcJ+s/HKf8ofWJf6H5hI=;
        b=CepacyKyEriXVqJByhv85Jl08+AKMzFVcY7yMFm25l5VJzAf/E0/cRMHejzc7nftqi
         fiD8LZJp6OuiTVhkO9S6YQAFk3B96Rt+5vZUmZKU4VzROHvR7u2r0lNbOkJkfpIWjyIU
         fhK7xTnU8fgHlSUn0rG/mWdL7sSadxPV4aB3yI4I0mV49K9jlzKoUfVbUbO9EfKwq9Lw
         BDJJX68nLSP0A7BjCl3Sh4EEuZCdH8G5V9BHsUrZzK+l5v25NpRyDr3tGBaDi6jx42Qb
         5iDaXvKtkhGjTTVmo9xaQo3Ppi4z/Y47ZZyitnUtUI+wZOOvw0KU7pcXr2Ea8dZ1GCwe
         IADA==
X-Forwarded-Encrypted: i=1; AFNElJ/WEO9jFrkY5FzUFpbIEtsrmzwg32EW9hNtVPq8DDf6KWzgdfuGCI47P8ZNfwR5+MAlS3+WRV88jDkRUkj+@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpYrw6rZ5I9hOMvYc2fRis6DoYBIApuiwGJuo1bJXX5ziepwy
	lo9u0+DMv7F6TsW+fghNbBnEZdfZysbzI9iAArKVPAhnOuyKU7ZCp1OTPDrnqM7bwi8=
X-Gm-Gg: AeBDiesolgxH2RE/xKw3ZnIktdIVcBT7gKqcUrshGTPsk0Qv4kD3aKintgNWVSEw45f
	9yfFDUZDb9dxCa/WDPZhVujVOtFbTWBUuJr+nSovR0Mnrp7lBWjme1poWFp6i/0663pkWFgLTES
	d7pAWmI2rVyP1zVwvypgthgu4zSXqQXD0sez0fXiG9/XMBRMTrjShP3feurNZXYA23zqEiydrz9
	seLgbN02OGsPpn3MddoU7riVzX6kfwQ5xr0iiPtKUPGMeTDu2e4GeAn2NN0l7hobEBnkjGJxBVk
	K1rHIDyO2tp1C7hUZxho9kGlzhOA5htRUkMib9bs7S1DN2eoTIisc2UewavLwYzCC9P1xvaCS1v
	Yh3o897VvMlaJY435GZluAWfDoDCN3P/USuiKUIVACyLfvEo/uXxNP86v0rChzJmWNEXRbRX1UH
	blBOKeQSZIq98k+0kW7hLnwWlNiVzBpxfgs+kJXu9H9Czzq2swgjEiHPUQo+qLLcSoS3xd8L9Yt
	E4=
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-575591f7b22mr4344616e0c.0.1778145713016;
        Thu, 07 May 2026 02:21:53 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f7e8c25sm11809233e0c.2.2026.05.07.02.21.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:21:52 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56f70865797so343434e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 02:21:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9c+UgKQffy13MHdG5zwPchBHBW/UG882kmoL8t9kge2OftaEOJ2otNos/Cv/K5CxfDHzrdWAh11mXR3wzc@vger.kernel.org
X-Received: by 2002:a05:6122:2a48:b0:56e:f1d2:c3ca with SMTP id
 71dfb90a1353d-5755937cdfamr4080066e0c.2.1778145712572; Thu, 07 May 2026
 02:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772468323.git.geert+renesas@glider.be> <10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be>
 <20260313215912.GA3415767-robh@kernel.org> <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXFd5Sva4Hu7KufgMfiiF02Z1z+UgLyJH=KYPvch4673Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:21:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzBzFEfgQePb6xrEHnAYWFKR7L8OvBJfaAg_VxN+mB6w@mail.gmail.com>
X-Gm-Features: AVHnY4K1hvlIze4Kwir9AQf6-zlk9HJ7JWrXBp9drztoS3rJo0JwuvmBgBmS4rQ
Message-ID: <CAMuHMdWzBzFEfgQePb6xrEHnAYWFKR7L8OvBJfaAg_VxN+mB6w@mail.gmail.com>
Subject: Re: [PATCH 7/7] soc: renesas: Convert to of_machine_get_match()
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E2CFF4E5B8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-106323-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Action: no action

On Wed, 25 Mar 2026 at 17:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 13 Mar 2026 at 22:59, Rob Herring <robh@kernel.org> wrote:
> > On Mon, Mar 02, 2026 at 05:29:11PM +0100, Geert Uytterhoeven wrote:
> > > Use the of_machine_get_match() helper to avoid accessing of_root
> > > directly, which is planned to become private.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > This is an alternative solution to "[PATCH v2 8/9] soc: renesas: don't
> > > access of_root directly"
> > > https://lore.kernel.org/20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com
> >
> > Greg applied this, so you'll have to respin on top of that. Next cycle I
> > guess. Unless you get him to revert it.
>
> That was my impression, too, but apparently he skipped that patch.
> So you can still apply this patch, too.

Seems like it fell through the cracks... Will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

