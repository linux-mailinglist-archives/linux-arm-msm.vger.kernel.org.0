Return-Path: <linux-arm-msm+bounces-112476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ayQKImRoKWp0WQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:36:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F1669CE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:36:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BT0YRaGi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112476-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112476-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B151302A581
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0841640963D;
	Wed, 10 Jun 2026 13:32:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D740B6FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:32:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098349; cv=none; b=S8PA7Uv4STW7WJco6V6oKasjjO1dWhBSfnRpB2RY5UGnsgi4nkT2qq2HNLhn718YCNbiosPpzaOK/ObvPCOQtu5QmZZVBe0h0QdVGQISB7JZI5psTMNgiLPy2qhSVNtf26P8heXxXCL0olJtcznMSK7YfyL47DCDeJcmdrFmGPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098349; c=relaxed/simple;
	bh=IgAupGvScjfbhKfY5lPJxx9nbOE4SEkTMe2CoSfY0jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqQl6ECUbSElnofAG9uQDXBt/l53WYC4VUEEua5bTOylUXcQuRDH5MKEFEL30Gg26AQe1c1UrYDoL26+bbCwHCtRwhopFmv7gi/LghnGvf6U1PDZic5pHBXcuo1eRE+3vbCga4OMjE3riYRZTtd8jkAMSK+CttTRrapSWwZsdd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BT0YRaGi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36F31F00898
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098343;
	bh=BNI1PCEPtc+B5bYIDRykhposVSqpBr76ONmeSLj+UAY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BT0YRaGiDZqFui6OakQFT6iw+BZPmtCNRCoB9Z+Y91CpbjZx/UtWKjimW6VyQ76Ij
	 Gbb1KU6mguAC8fSKUM6v20NtnI2M9EENzZ45qvRyrOnd/h2oWhDGZCcdt1kvrpPVHS
	 Xiu0AgJqvgv39hNIOMRSVyjUY70jJj5ipT6nuTSHOYCcPCo+a6acCWIfnfVzi31Zii
	 jXhX7tudJtW84H9kP4175NFSO8bDqm+vVUvdi86F3vj1hFxF0QkbpUnGlP65i8qSLe
	 z8Iz1RGFx3n6g1UN7v0N3/6/znuANly8Ia/CSpUsr3H+inTHUyyq9kzxYQKREIcBYf
	 09nO5+SvwLiYQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso6875387e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:32:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Cqnn+52HJJcjILkW79vj/LZHmqJX8jXfHgu30nNMLos5zdl50EDlAw7zpEje3yE7JWfPwuuzsqeq7Q7tx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw5GdnqMUqqwRWqSi0y+EMpghZmD1+DgUzbR1D8lcnQRWU0LBM
	0ob4FiqXDZ9Kgp6U7O8aJSMPwUd9/kFUYQgFLyVVaqbRR6A4NowG4IC5eYiyEzPjrf/hfkLhhVw
	Wmn6lzf3f39jOM4QLtlxtYRp9rn8Dnxs=
X-Received: by 2002:a05:6512:6c4:b0:5a8:74c3:5d9b with SMTP id
 2adb3069b0e04-5aa87a26912mr7836915e87.0.1781098341798; Wed, 10 Jun 2026
 06:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780148149.git.github.com@herrie.org> <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
In-Reply-To: <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 15:32:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLnQCLp2cbdCxxnZu4=W4OvnsCE9RRjR3Q6vvHZZzknNhg@mail.gmail.com>
X-Gm-Features: AVVi8CcXbaPa7gxq5YUbuuUEakfV-22s8Fg-evhaaw6TvfSPYoJx07r1ZWHIoO8
Message-ID: <CAD++jLnQCLp2cbdCxxnZu4=W4OvnsCE9RRjR3Q6vvHZZzknNhg@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112476-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 802F1669CE3

On Sat, May 30, 2026 at 3:58=E2=80=AFPM Herman van Hazendonk
<github.com@herrie.org> wrote:

> Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> generation that preceded MSM8960's Krait CPUs.
>
> The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> make a separate driver cleaner than parameterising mmcc-msm8960.c:
>
>   - the pix_rdi mux requires a custom set_parent op that temporarily
>     enables both parents during the glitch-free transition;
>   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
>   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
>     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
>   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
>     later 8960 reorganisation.
>
> Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> rotator. Reset IDs are exposed via a separate header so consumers
> can reset the GDSCs and individual blocks.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

I spent some time looking at this driver and comparing it to my
earlier attempt at the same, it's basically a better and more complete
version of what I was hacking on so naturally I'm a big fan of this
driver.

I can't find anything more to add, except perhaps a top-level
comment that in some documentation PLL2 is called called
MM_PLL1 and PLL3 is called MM_PLL2 which can be confusing,
so it's good to mention this somewhere.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

