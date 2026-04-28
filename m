Return-Path: <linux-arm-msm+bounces-104907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI8zEsZt8GmgTQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:20:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54A47FE11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B9973072108
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8988638947D;
	Tue, 28 Apr 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQ6LIjGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99713385534
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363823; cv=none; b=HQaPPEpHS6HtGGdZUJ/G9LpeuB8erC45PDRxerhWX5MrZlOg6S/d2q/RJiOAkU3m3mATO8heXJlk+xt6N2daCF8kGy1LG//8uKbV4QoAcQVEwdRY5KB3IZni8hQOXH56XYhM861KwZdLrq7BaOtumDuQrKdch+0r6T6KjA4a+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363823; c=relaxed/simple;
	bh=fei4LdvFh1HIVfZOFUIllx5UOPiuzB+jiy/kfxhgcV8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojhxXACosWIPdflwDItI6RzUTVV3theXt4Zn0WTVk1w+8XVUd/qXmxPdsgz+XLbupbhNBCijXNuDLwi+YpHrBX2dmmbR3rO/tYCS3crGXnixWY8jDoJ4RcmWGZ69OE7U7EjAe3WOTpim0zhqvwPkEJIIOSVLfn/ieNs8neo/MKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQ6LIjGf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BCCC2BCAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363822;
	bh=fei4LdvFh1HIVfZOFUIllx5UOPiuzB+jiy/kfxhgcV8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=NQ6LIjGfSNolA82t/VIMUh1JKDC5WhfQ802maI9h9z6VF+s8BFEGmXsTJFUnJRRFi
	 0CCxLWmH22iq/3JBIIUc/k+dWBN8JvDHOzu1RwSKbe9fEndcA3YWjv/jLZ29cPTfpa
	 v80V3XoUXUR2y4fRmDPNXEoMKTN6QTKo7snjASSmcx3fUjV3/1ASsUd2LUXLZ+bd/a
	 RgD8FzYLjP+R0zrSMelHJvTqWDqUk9YzQ71vj9IjRvUumCV30/u7cUB9cG54Pb0r4s
	 liV98oDihwO9WQcQGE3l1EQli6feNZ0AVNw3g2i12crzP/n6f5Edj/OWVhEuL2EYbT
	 mN2qNbN6wfBlw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38cc8708d76so95151111fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8woPiqaegKPgrgg2nKOQ0ZWmNOmJixIuensVJiESsqHtlDAydhWypExMj7yD6uc6zdTsfgaLkm0mr4dkCD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyej3CraQzyRe3y2wFUuaFvSDL6G+zr7q0MnBSHIzDNGWIQOpAl
	Li3grOOh1f+sDV2vtPZoAnNTZI7Ts5iQtnqFBEyM6f6ec/Jt4ZBVvorQjnAYli0ZPbQUJhjj13O
	nYIn2UGcEhVSfKewfm3WnYCmu+tbgWzDkxsS5hl5YxQ==
X-Received: by 2002:a2e:bc1d:0:b0:392:c9a:ac43 with SMTP id
 38308e7fff4ca-39240cc2503mr6861281fa.8.1777363821168; Tue, 28 Apr 2026
 01:10:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:10:20 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:10:20 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <afAsFcydwlCEgWZf@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org> <afAsFcydwlCEgWZf@sirena.co.uk>
Date: Tue, 28 Apr 2026 01:10:20 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcx2xwAQBnHpJoV2fp-hp3oRpMc=PnmGmVSX+NjtoesJw@mail.gmail.com>
X-Gm-Features: AVHnY4KMgZSwcI18Mg0I8qURCC0YSMOQTqAaLXrcA8GhCJwxSp9Ykvsjgl2hOIY
Message-ID: <CAMRc=Mcx2xwAQBnHpJoV2fp-hp3oRpMc=PnmGmVSX+NjtoesJw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wsa881x: Move custom workaround to gpiolib-of
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9B54A47FE11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104907-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, 28 Apr 2026 05:40:05 +0200, Mark Brown <broonie@kernel.org> said:
> On Mon, Apr 27, 2026 at 10:43:21AM +0200, Linus Walleij wrote:
>> The WSA881x codec driver has a local workaround for old device
>> trees that have the "powerdown" GPIO flagged as active high,
>> despite it is active low.
>
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
>
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-wsa881x-gpiolib-of
>
> for you to fetch changes up to bfa336cee3324f991e93e9e570e8b827273df97e:
>
>   ASoC: wsa881x: Move custom workaround to gpiolib-of (2026-04-28 07:39:15 +0900)
>
> ----------------------------------------------------------------
> ASoC: wsa881x: Move custom workaround to gpiolib-of
>
> Move a workaround for misdescribed GPIOs from the wsa881x to use a
> generic implementation in gpiolib-of.
>
> ----------------------------------------------------------------
> Linus Walleij (1):
>       ASoC: wsa881x: Move custom workaround to gpiolib-of
>
>  drivers/gpio/gpiolib-of.c  |  8 ++++++++
>  sound/soc/codecs/wsa881x.c | 35 ++++-------------------------------
>  2 files changed, 12 insertions(+), 31 deletions(-)
>

Pulled, thanks!

Bart

