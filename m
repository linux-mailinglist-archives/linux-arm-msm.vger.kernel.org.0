Return-Path: <linux-arm-msm+bounces-100488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IApvIPcJx2kyRwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:51:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F05EF34C247
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A3F5301703E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0442392C34;
	Fri, 27 Mar 2026 22:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxbKioEu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78B382371
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651849; cv=none; b=MBF5QsiG8zco41TEz7MgN1Bp0z3SORFyf8SuMhq/Wz7PXc9+31/0pedogRWULxQSqkTeNTXRIZuAf6Ug0hLKKtGAJuSTLUfi1XcYLuu15OpG+18L+BvJNTehISlz9prnE1h3PImHXW93rmTKek/4Hgo6faYIiy+pp03Agenyn6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651849; c=relaxed/simple;
	bh=0eGc8ssDw2nhR1hlhrKYnnwf3OeDSalYxD5Yo1jKxLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHVUFTyDHiv9bYwSLMnTnVra7SpImNmp7mGNTyGgd6mgDE6X0WcaIydYatnd5DUJKFDThgIZc5crq3sLQrUOnW86+HQJkGOmFPifpYQSrozH+0uNrFMNHBE1UZiJmy3VY59tLgkWDwA7jaA2jefXU0i4eDFl0WrZg1KGaVM/Q94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxbKioEu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD1FC19423
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774651849;
	bh=0eGc8ssDw2nhR1hlhrKYnnwf3OeDSalYxD5Yo1jKxLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cxbKioEur5duMrtyTAU1Deisj7mpKxAVdjRTEqyGnOdvZe4C67/XT5JdYoD4Kktf2
	 /TL8/98RRX7bLUVoIGGyY2dKW0mYOWYOpXjCgJ+QEFbKB14X4EHrhY8PHJ/gLQ17KD
	 ojrTRcwO0JL/R0QATnQQ5BfA3ojTdpF3QSBhMRJ19u5Ra4U6vVPJscGzkN7ED/DQhV
	 VvfhLy5WGEv6hO1zdGZaPu9zTqP9kT67vJNo07yHA7Y3njNXSzsZRRiXE0PXJvWP8v
	 vth126p9ASXZFFI9qNJEnos+zO6foS09VvepT50U+aDCw31WVdGn4Cf44OkP/5alqB
	 scAJev0wu+JTQ==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6500040ef83so804237d50.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:50:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnnNtRb0b6UX4gTVSjBj8Il7knUTPuxRL7q473eKOGzxoaOIeOJEsvuXvOkbTE9U8R+OLZ79ufQKxrnoJW@vger.kernel.org
X-Gm-Message-State: AOJu0YzwokbfhhACQq1tEoMowhJVesugX74mTxABngnvhSAFWSzvhl1K
	opJQwWbOcxnVuTk8jTujkfqbrPrIg2WNGe9clXGar8tRbHOnltxdwB9ygUT0sMl3PP7PoDGVTiR
	kSRQeqRRvC6hjp39LkjdrAwffr8T0oew=
X-Received: by 2002:a05:690c:e0dc:20b0:79a:b118:4386 with SMTP id
 00721157ae682-79bde0fb879mr33317957b3.48.1774651848807; Fri, 27 Mar 2026
 15:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-asoc-wsa881x-v1-1-53dc05867e6b@kernel.org> <acbGBtY0zsPntsoE@sirena.co.uk>
In-Reply-To: <acbGBtY0zsPntsoE@sirena.co.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 23:50:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVa2ykiZcedui7a2PnAdSyVxnJEr4hpm-B4Bwj+R=sUg@mail.gmail.com>
X-Gm-Features: AQROBzAyjQY1OZCHAsqMvibuQZyLS2BoFTjTly-UOI7Q0JomPhqR4-3bqG6UXew
Message-ID: <CAD++jLnVa2ykiZcedui7a2PnAdSyVxnJEr4hpm-B4Bwj+R=sUg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wsa881x: Move custom workaround to gpiolib-of
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100488-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F05EF34C247
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 7:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Fri, Mar 27, 2026 at 12:10:46AM +0100, Linus Walleij wrote:
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -240,6 +240,14 @@ static void of_gpio_try_fixup_polarity(const struc=
t device_node *np,
> >                * treats it as "active low".
> >                */
> >               { "ti,tsc2005",         "reset-gpios",  false },
> > +#endif
> > +#if IS_ENABLED(CONFIG_SND_SOC_WSA881X)
> > +             /*
> > +              * WSA881 powerdown is always active low, but some device=
 trees
> > +              * missed this when first contributed. It also has a very=
 strange
> > +              * compatible.
> > +              */
> > +             { "sdw10217201000",     "powerdown",    false },
> >  #endif
>
> The quirk in the hunk immediately above (and from a quick glance all the
> others) has the -gpios suffix but this one doesn't - should it?

It should, let me respin!

Thanks Mark,
Linus Walleij

