Return-Path: <linux-arm-msm+bounces-94607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHVkK2j4omn18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:15:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 589DA1C3774
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C56D304EF7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE83C3EDACC;
	Sat, 28 Feb 2026 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRZoMRh8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9830F2C0296
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288100; cv=pass; b=aIf8kEAmV0xQUe74NfgFSHYST0UcPfgnAJ4wVBAdaVydYaXAbDD1V6s+kCKYebAfWxlr0HccfWdFdkKDoYJyVuwc2oZ3kdVHVvlFyellb3tEyid8Wj6KJCDjTQDGh0+lRLO+fhIpwI7tL0aXIO9QzoLeUoZ8dm1ryYMVQOV7el4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288100; c=relaxed/simple;
	bh=tDN3Cme7vTQP/3ACecjLrjDroJOpD8UhxZvthgwpOlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXx1cKJI0dGmCZyp+QAPjLA5SgJsPDMdFl/yj+QFYSBuTSTGv7v314wI5/yYNuudZZWF5B81jRWGQLrgJz9c4QFvRo3tkTJWs/S1rE8Z3QWTYX6yuA3XtNVogmOkz+1LkB0ioaouejBquK/g5bjHysfwFWYtbZXG0ANFTSl4nMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRZoMRh8; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94dda16ff9aso909766241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 06:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772288097; cv=none;
        d=google.com; s=arc-20240605;
        b=DKcpQx0zofDUSCLTCdki+iqu+MjJudCJ4yHBczAJbFkpDkpYF8glCbAjSc9oRfEp04
         z0bcS5McUqobQIXxn1pH0N07wrq8KmXFgoGxMXh7gQRvK/YXKSHn2Z4YWWs8PMkslEwl
         8dG1GyccfCW//TkyjPwVXhEkIis91KD0fmOfqyEYka/oHeGOUVE+gNkdsdcZe+hKR+hl
         BOqn2cQUs1R7zU0std7wsl0afdH6bD/0/dkcdrgtcwKWsAYaf+P3A174ZFoTeiW8gqS0
         c+o5E1cBpOMroQ3xuFyvW4WYdNyGD2cxZW3qcg6W5wlPaNF3dhE+z/TNzqutmOOoHWa8
         fUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDN3Cme7vTQP/3ACecjLrjDroJOpD8UhxZvthgwpOlk=;
        fh=ZGfKCSL5HgbwnTtHfLa47SGyrleselFP2zzJgyQ8FHk=;
        b=FbkAhcqvxv6nfdBExxzsbSSqdPmDMn+vOVwzFlmN3ngALtZMNgC1Io3NduMfIQGPlo
         c5mjoPGL+RP1o5nC64MlPXow4Io//eSoROTPvoPRHilUxM/qaqPcp8KPNSxJ3ef9TkOX
         fItovvUexrPpJD7rK6xmin9ajbWC4ir2cp2cGaoOyBpnLIWHExlxEKKY3J/zowrURGrY
         g+910vvtRploDA6SzbPjisjpSw6FtBl9EVZ8PeZ1OG2w5twYyHWe6JJZ7gv2qqYgPqkw
         gtsd7eVAT9U/8/klXPidi3xMQB9PSMIJfuFAiheboQ4Q9qiPp0xgEoMq+cjNnznelJ/l
         XyQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772288097; x=1772892897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDN3Cme7vTQP/3ACecjLrjDroJOpD8UhxZvthgwpOlk=;
        b=BRZoMRh84Ww0/rSzjkKu/MVTYVcrXsDIzODDQKOOVhW0F1tq/gIZvRvU3Ajv3OjMm3
         owYqXyfKLUjDbcG1hgVQWwHGXHDfWLYo8b1RV3E71tyrCqUZd6YGsIYQtmuFOmGzbT52
         rD8pdw7BxiPA+2LYoye6/Vo85pGnzGSi7nFmExl7pSnJEHIuTw3gu7Rhp8xO8Dr//pXN
         CzbzX7wgrdy++Y4YqcE5Ob15rRL5xU5cCP6Ba6JUed5iMsGXzUAsZ+vLAmzj5950casU
         SwXT7jf1XTxYthuc6ghYuFr/yZzgf/vEawWWgnENk6f4mIqhZNfvLyk28e9o+Ij9//Mt
         D1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288097; x=1772892897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDN3Cme7vTQP/3ACecjLrjDroJOpD8UhxZvthgwpOlk=;
        b=YXjBDD7g84e0T3n9Et90J+YS5O9Mpzgg8ADL8L8SoopXTl7wVn2KTDWSdYLe9u8YTG
         XQyynkwriVwFN33gGib1MsbcD3IsMYkL5DrxAsdFNaH1Q97fPcBsS2K+FKqC6l4dg5VG
         z9GakLvaRwY1L0RIK7xfRLsWNW53dxi73Gx+hcmLSA0sE0iwKefuh3O7sNXDElvpd4jC
         slaPN8SvRfn84VA/hJjZ2RF/v513sH6VN3nEkjI9nispkmZijo1eF5uY2hYTVCdhTEMJ
         41Yu8aTuu3KRm6I4HttVSwCVp57VNLHCykOkGezYT8gWr/Db1E5lLPQMOHYbm9HxGq3T
         Eb1g==
X-Forwarded-Encrypted: i=1; AJvYcCXcIMOEaCeXPHl1iurRDTo0oLCDvbOQR2cqFnvIpa99JGNaWgmsK123fj93GlLqtQqBVi0OMA70S+ap8Mj8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8cvd22jIGwxmT1RH6CdrvWXHDuvB7JLWGpcYuuSLEsVmtg57Y
	0lUDX9990sBjHvut4sKo7OGMWiPHmZIFJmhVXkhjd0d8dR0USBIfM35WSSZYOvsBBZwFK0BTgig
	rUGZS2Tm8PK3EeBTkaZ0L/lQVPOSd890=
X-Gm-Gg: ATEYQzzaWZJi5J9ShyFuxh4+GHyvRDQo/e4XW/C4X402xXZbW+OtLdz/42QqgECzWlM
	Wbaz38Grlrfv4Kyx1bgtXxKQmJ9x4lfwhw9tKpUB92oQQGEp1BbfLAuESEy0/uT51hB/nJvhHB6
	1xXtI+/pq2ZCSqTLZF1kmDPXGpBdFK9Fxo0ybiI26+wIgm3LNhI6k8qY1m6IsV7IUayFrcbOVk9
	gKU169BgZbTB5ycWp8m5uLoO3nsh8bh8WngI6EbPFKHh4HTxNKV1ejLJeZ7zTkrHTdOM3sWhDmh
	oDN0C8c=
X-Received: by 2002:a05:6102:390b:b0:5ff:1a8a:7093 with SMTP id
 ada2fe7eead31-5ff32514574mr2805913137.30.1772288097469; Sat, 28 Feb 2026
 06:14:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228125431.23098-1-mitltlatltl@gmail.com> <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
 <CAH2e8h75H5ZZ88pkFYTwr5xir_giW5DxV16Pvo1_DFQuqWGFKQ@mail.gmail.com> <7gba4xjc3rk36y6e7ztc22jortvteo4lsyywoxfxl3xa5qb6pp@mgm2mcczdrk5>
In-Reply-To: <7gba4xjc3rk36y6e7ztc22jortvteo4lsyywoxfxl3xa5qb6pp@mgm2mcczdrk5>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Feb 2026 22:14:40 +0800
X-Gm-Features: AaiRm53eO9eL4cvsCpyi6nHdrCVe-COFKP8PbIePx_MMgPU7ylDPNXWb9q7J7nI
Message-ID: <CAH2e8h5sRuTdb0dawiUfO4A3tCYN7omrPK74_UpyEmUmd6OKHA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94607-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 589DA1C3774
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 9:44=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 28, 2026 at 09:38:43PM +0800, Pengyu Luo wrote:
> > On Sat, Feb 28, 2026 at 9:13=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
> > > > Use it for the DSI controllers, since DSI nodes have been added.
> > > >
> > > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > > ---
> > > > This patch depends on the below series:
> > > > https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltl=
atltl@gmail.com/
> > >
> > > Why was it not squashed into that series? I'd assume that DSI nodes a=
re
> > > incomplete and are working "by luck" without the refgen supplies.
> > >
> >
> > I had completely forgotten about it until I found the patch when I was
> > sorting these old day unverified patches. At that time, I just sent
> > DSI patches. I will put it into DSI patches.
> >
> > Many platforms should work without refgen. Bootloder may have
> > initialized it and be untouched later? Once there was no refgen
> > regulator, my sdm845 phone worked.
>
> If there is no refgen driver, then the bootloader setup will continue to
> work since nobody touches it. If there is a refgen driver, then the
> kernel will shut it off during the bootup procedure.
>

Thanks for explaining this. I saw a similar thing on sm8750, I had to
reboot again and again to turn on the display once.

Best wishes,
Pengyu

