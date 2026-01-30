Return-Path: <linux-arm-msm+bounces-91330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD3dN9b0fGlLPgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 19:13:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FACBD9F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 19:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73D123017015
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 18:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD7A37649A;
	Fri, 30 Jan 2026 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFeuUM2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B821337474F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796808; cv=none; b=pEZC+i0nvt8xebD+oe3IoI60SteYJKLchVqfXbik9D8iW23yL6YEsHH6h9S0D9CPh9KQqTKApqs3rv5TpSJlt66R8ujyEyfka9KGQ/R83bGpORKEpCCc2DUqCz6ynGTSTk0wzWuA9Cd4gIT4WxMccD8mz4gC8n7Lgv1TnOMavp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796808; c=relaxed/simple;
	bh=LISfKR93PEiaIWL+rTvqe4PKK99gaFt2J2IfiA8N2Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWXX7tsjfWKTM94da4N//uhx1f07OX11ifY5zbccQ+UEj3BHZgf2tyYO8Rne3dDG1UChjISIvbfhVdsjxgCPhwtLeHH4M0lx5nAlsl5ckJRTLn2YiiEqVOZrBtYIZCEYeUpSLb72pYhWfHLbT7ZBhBB9MZ4/ReVf5KtAdiT2hBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFeuUM2Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A15AC2BCB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769796808;
	bh=LISfKR93PEiaIWL+rTvqe4PKK99gaFt2J2IfiA8N2Y0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fFeuUM2Zply4Zz/89pdRyy3dNKc114K1NgteUFUj42cd1ctvepZrZ4JQRlcP122Br
	 2AOIWbJvBTa+mh6q4u4IeG2FY+QJeX9giekBix1ML+B3hedC/d0onaegNXTS6B5iy+
	 P9eNdItP1aexRQMQ3df0CVJDlyhoAuBmcs6gXsDFJWg2+XrlrI3I/UM8WEdryWzvgn
	 6uBu9JTEG4vlIfbsjgz2TuhzOghbmzELYj610+WRcBEIWlvYxyKbpMGIFX8/A+HL5N
	 czBpQrA47ssJxyOhi/pgdwkKeUu2PsQjgumzdFALnhbBRlJwvqRn3ftU9vYdo/7x+f
	 8qKyEbhaLDiYA==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-662f9b82a36so1030910eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:13:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNLEjKqSQr72auhQgE1lM8Yfd7cyixhSZGBU5na8GTtxFXe25FLbHX+TtV/fNdZTi0Y64jBT1e069hLc2Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6h7CMVOBQwG6Er+vGhAAe3/Xt6b6g2k/ERQ7vt/Mu7AYEEh4u
	GbNxa7URb+fOFow1LedK30ZYnqFaCDktnk+5VVbQhAigVLCOlxLId+RxOQ9SbKENMoMNXB25RIM
	6Z3UibRXqgwbvQQo1WqbWgJ5nbjZFxRg=
X-Received: by 2002:a05:6820:f0b:b0:663:b6f:c25c with SMTP id
 006d021491bc7-6630f36f8ccmr1745766eaf.41.1769796807350; Fri, 30 Jan 2026
 10:13:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-thermal-lmh-oneshot-v1-1-9b132204ef1b@kernel.org>
 <CAJZ5v0h5CKydWU-o-Zu2z6mCtEcCszkfpL4Vuz_VmSqhxKbozg@mail.gmail.com> <7b231d33-9c40-4f25-a693-8f2e08280ce4@sirena.org.uk>
In-Reply-To: <7b231d33-9c40-4f25-a693-8f2e08280ce4@sirena.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 30 Jan 2026 19:13:15 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gG0=AJk9wUqwMps2p-ypDre4fU-1L7EVCAZY+a75tTSg@mail.gmail.com>
X-Gm-Features: AZwV_QhtaIMBGridiBfqnH3P9NGAN0931kY95YDlXuEAROW9jN9WqHKBOgrS4RE
Message-ID: <CAJZ5v0gG0=AJk9wUqwMps2p-ypDre4fU-1L7EVCAZY+a75tTSg@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/qcom/lmh: Remove spurious IRQF_ONESHOT
To: Mark Brown <broonie@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-91330-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 45FACBD9F4
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 7:09=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Jan 30, 2026 at 07:06:06PM +0100, Rafael J. Wysocki wrote:
> > On Fri, Jan 30, 2026 at 5:55=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > This warning is there because IRQF_ONESHOT is only meaningful when th=
ere is
> > > a threaded interrupt handler and this driver does not register one. J=
ust
> > > remove IRQF_ONESHOT, it wasn't doing anything.
>
> > Daniel, do you want me to pick up this one?  I can still push it for
> > 6.19 as a fix.
>
> FWIW the WARN_ON() is introduced in -next so won't be seen in v6.19
> (though the issue has been there since forever).

OK, so it need not go into 6.19, but it would be good to have in 6.20/7.0.

