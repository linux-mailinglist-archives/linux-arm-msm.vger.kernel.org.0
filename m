Return-Path: <linux-arm-msm+bounces-112481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tyxFF55qKWr2WQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:46:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3791669E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:46:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=E2or5bt2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112481-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112481-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2CE73180D34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6863D8128;
	Wed, 10 Jun 2026 13:38:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7373388E57
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:38:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098734; cv=none; b=Dazowwu9+3DQjXaZmqxByKXuxFqF0923zXOKO96xH+9WlDGXj4bg2nv6t1s2eJnyoBkUP1yko9H1LUSvCkpwjprDQJ8ehSE4LbDMT8I1DI8MmpdzmrCnhLuZO6yhiF3lJez+2IgCWjGOFAdPOjlx23zIYdTBkNGWiCAJiQ3TDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098734; c=relaxed/simple;
	bh=LiDPD502aNFj7TV1fAchY59EExnmYWDT1KIERp9pxQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRyfi0gTsx0+xED4fhgHOHqwClTTTQvfjLsS8Fmn/NcPIJTTajGIWg46JyTOaoEm92pfZ3TEP8LBqmonr4HYgsf7M/lCD04JQYb5iOK9pV3ayk4jXW0/J6BAQgYP5yuLmTcopv+WN+PG4zg+q906XBx0uiVyvOhEN2Wqw72LmXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2or5bt2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBF81F0089C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098733;
	bh=LiDPD502aNFj7TV1fAchY59EExnmYWDT1KIERp9pxQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E2or5bt2rvXSetk1M1A6hE+bIwWXM8k5QSDOnWK4clnYp2+FfiNst2Eh0tpDpI/jv
	 8fM8Hsmf3i8R6Kzq/aoG+zpSw+O28YJ/dHFXHPO44knvS+RikAsYRHaZkw01zhc3TY
	 5Ne+c8pnPurZkfUxi+Bxct6S+GckeY9+8p5gWOSmTQ4KY49SqWzHK4shZePkqi4Tdk
	 ldo+WLOgUB6PPZPS+IT/5nC9JilQtXGoLcRn4OJYff1CJ+lKcH0DcC00mweB4Wfy8E
	 hv1CWZe49rumYdyBB5TM9rJwWczC5EZAwmfmmHBGWMrc7hYhBceigEaFxQ3xibQRPl
	 wmr/C6+xJCaVQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39677234558so68914551fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:38:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8SefyR7IgaeuQ5WRadvdWrpsaHp7eGFg907iBAQHsiLWzc9aEq7QMH1iTbszL0lZP7dcEmDHlduxdn6mYi@vger.kernel.org
X-Gm-Message-State: AOJu0YxsmXvbICfN7llAecsImU5+dWFp/dXVS1UHrmrqX1P2zWBboFEY
	/EMpBCoZWhCYjn8vsza2IFWsCgOCLzX1+69+mG5XvYRhTXQDM5WHE9uM9OhZlQnNqAyhI5KNREh
	fEz0/iTGlMqnwXEZDxgp8Vz6F1cJtal0=
X-Received: by 2002:a2e:bc0f:0:b0:393:a37e:b131 with SMTP id
 38308e7fff4ca-396d079d2e6mr65556041fa.9.1781098732456; Wed, 10 Jun 2026
 06:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602062927.467249-1-github.com@herrie.org>
In-Reply-To: <20260602062927.467249-1-github.com@herrie.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 15:38:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLmu257Dvc28pR2zWzR7QVC7ALTZ5YTogtXpwuetMm2gHw@mail.gmail.com>
X-Gm-Features: AVVi8CcBl1eEu1t1aSv7SadamVzIrFdhwp6YSvRQhe3eZfWTWpyUG5I-wUmdWy4
Message-ID: <CAD++jLmu257Dvc28pR2zWzR7QVC7ALTZ5YTogtXpwuetMm2gHw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112481-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,herrie.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3791669E3D

On Tue, Jun 2, 2026 at 8:29=E2=80=AFAM Herman van Hazendonk
<github.com@herrie.org> wrote:

> clk_pll_vote_enable() unconditionally feeds the result of
> clk_hw_get_parent(hw) through to_clk_pll() and on to wait_for_pll().
> The common clock framework permits clk_enable() on an orphan clock
> (supplier not bound yet), in which case clk_hw_get_parent() returns
> NULL. to_clk_pll(NULL) then yields container_of(NULL, struct clk_pll,
> clkr) -- a non-NULL bogus pointer pointing into the negative offset
> of struct clk_pll.
>
> wait_for_pll() reaches for the parent's name via
> clk_hw_get_name(&pll->clkr.hw). Because clkr sits at a fixed offset
> inside struct clk_pll, &pll->clkr.hw cancels the to_clk_pll offset
> exactly back to NULL and clk_hw_get_name() then dereferences
> core->name on a NULL clk_hw, panicking the kernel.
>
> This is reachable today: gcc-msm8960.c and gcc-apq8064.c register a
> pll4_vote whose parent (pll4) lives in lcc-msm8960.c, and the future
> gcc-msm8660 pll4_vote does the same. If anything calls clk_enable()
> on pll4_vote between gcc probe and the LCC clock controller binding,
> the system panics. The exposure widens as more SoCs adopt the same
> cross-controller voter pattern.
>
> Resolve the parent with clk_hw_get_parent() once, return -ENODEV when
> it is NULL, and only call into wait_for_pll() with a real
> struct clk_pll. The enable-regmap write is also gated behind the
> parent check so a failed enable cannot leave the vote bit asserted
> against a clock the framework has not finished wiring up.
>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Sashiko complained, Herman fixed. Obviously a job well done, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

