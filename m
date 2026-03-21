Return-Path: <linux-arm-msm+bounces-98998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PAlLJNVvmmrMwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 09:23:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F62E42A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 09:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3214130075D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF792347535;
	Sat, 21 Mar 2026 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3pDPwrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4E13491F4
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774081400; cv=pass; b=fDnfkIk4KCKI5Kk6wyHLZcoux+uxS79eF9dweQP6ufLEtD5yLK6AgqODVcDJTcqBopVTrkF3ngCIlDmhlM4lGuT9L/YlM7teA2HcJsc4qSjpZJP0Qw+3nG85CRuWC1j+3NtoPkPofB5VlynULFc8vLOd0mrNiJ2Jm0xIC2Rd3FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774081400; c=relaxed/simple;
	bh=8gdwVYGgM+/U+YXM2cqEInbWOAcx66cyyNvae+Lua/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYiqfgHV5qNxZDfr1rWV/GwOZR1RtR2/igvDj6iTb7BUgwr66xndb145LY5IBMI63MaCsvyScnMJ5GZcuU5RBvUiix+PGy+KQypP9j3Kcq003h9Yp0L1qArrr3tBxy0gLdxjloHoPFuCBI5EiIWZE6yjIwBdChdgH2zMF+KNX4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3pDPwrh; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-950cc286d86so337442241.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 01:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774081398; cv=none;
        d=google.com; s=arc-20240605;
        b=N5QooS4sMjd9fcAArM6mQM/fdRMOrPjnL8l+sWYjzznNTlRcf8cILaaPuZGhu87vli
         psM0XtspAqCN3ApAJyp0+1TjIdUPY3f3MOzAviUuhBH9upBoNo9KTw+j10iztTxZwbmv
         cBhjTRMshQe34U5eDR0BYZ2GbwAuYyyeBi6zkrG6uCNBnE93uEar2fDcKtADOHgFaif/
         hmN1anVWjf6M5Lonb7/PrUWHLKmOcKEA0e10FobuEv2ChSSrGaYvrY6UY1ja4sTG9/SH
         PlmdvXwaj+oRytZowiM7R6+UUy5IKG6jKzeYcBHoZvESr3w7DVe0rRXLrUBMFwplcIof
         L+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCbu8utOzfSKxWf/KKfGOPZf2jQVjk8Ie8gwBnqmka4=;
        fh=nxYYRGXQpQC8Q586cvPzXrs9uuwaKKcJJIHK7KhDIi4=;
        b=KKrZr2TDTBt7HaMyz+1/SVN/iZ07JPbyQEGQJ+qKfGl4MJWqPLY7zosXtB0lJotJEm
         33GAnL/J7fzrFOoVtth4nqD6kKuMuOMl1pS5JKMCs2jl9Y+15hbm5LLs9Nctcy/UIruN
         XlBdM3pv6tkLkXXhhakt/ypbwhteunB6sQEmSF850w+QqewQHLXmMw6r7O6nDeBHCOpP
         V3otU8qK8o281cfGYB/wxamh9x/Dt5BbZxk9WqPfwy1Hp9DxPiCWaA4zZEoNz0ixEbnh
         mhQFISbWpgv7vWOGxC2J82Q6WrRhsUpzGUMTwrzEm+xrScYsa0WGo7PCtC3wYyFiht4w
         Uesg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774081398; x=1774686198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCbu8utOzfSKxWf/KKfGOPZf2jQVjk8Ie8gwBnqmka4=;
        b=j3pDPwrhSrpFmXgry6YicDOyNeM4WJty181fr4FkMpEFxgTB2N2sKL6rWllGWS78tn
         Ihum8iPzijhsMOTaDKj1pYOFtE63ArlKJe5p6lS0fZU5iO1Py6jRU8/jtAP9LyxmyRqz
         PBLo47BsMNeATw8tmS7FTy1toy1EUhxVDCkt7iExHvXv2KcxHYr4aKbmvh+7lIzdzrZP
         jrjhDWbpW52HV/AyIgcuiaL4mOjXmYTPXHW1fAMewg9Ldz2zXLIBLBKIOTQHcvhNr2CO
         Uk00tlhVAeaAoBrXEmkNvzOOe96SIsdmtbQ/xnXuImauCpJynDs/24g9gsE2RUObvNxt
         hUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774081398; x=1774686198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCbu8utOzfSKxWf/KKfGOPZf2jQVjk8Ie8gwBnqmka4=;
        b=Oyx5G5azfJy2DICZdsLivrlMK4iXxh/VcjGN6oWsX0ZoyRQUlgIAVt3me92uomedoo
         0rt/+r30JI7eB3+P5kpBb+iYIuR8QpAylLixofT+2npgEqGDDdVgyjWQ+OoUzrFYNPOY
         NO+Uu6MOklJ8Pcg0Lh1+DRUcdrClog69fNooI1ezNrTmjtCjqG6PxzuRsxd8A6mZZ8zG
         6da3jjobBb87NusO0Vhy21q2e9L3A5vzVQ/wNXAAkELQW1LQQPTVVGRuQQDzZFhQqZNF
         WDYRYnmCT96jUxx01fwUBmFnftjzqUvcUlbq1JQATVfjzFXc7lL44NPlHGVh3mjy31Kf
         7f4g==
X-Forwarded-Encrypted: i=1; AJvYcCX3FkW9dmp67/F1i0s4b2RUk0s+AUq7ZqZb5kiEMwkMzB4BugfBC4vxHL/X65gq/cOBOPn+3OVGIwmf6/dT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2TT1wCzquZ4/gOtmc/Dwq830qo69zUYJ0HNDPnBCh6WuBQwMw
	hCiEYPyOZLJuQezojoxyTTWBe84wZ30sUvpUbj9j+s4+bkX27cFcz54zxqd5PWqo4sSJVpa6vuo
	9wAweuoXBxNRiOxFJyGIOZXZ+0lxS9cSpitIMTbM=
X-Gm-Gg: ATEYQzw1FCQZdXDkbyxZgwFYVLOqXyJwt1yeHwJKfUvXgYbYzxWCgqQ8ESFbsYEkwYx
	Mqo9cRMqDjIG5mKMG6K0SJYXOH4HZasm1+jCS9nM1kHGq5fp5bJSWsf5GMPX7j/WfoIo4WKvspM
	3+QmK1jUXEhNR6ICmo/toEOFAW2T8I0rrNpJr5UuCPrY/Ufts+PcMoIyLjx6SFqAL6cAEK/qqYk
	2rS8tYjITYbCBFbuvpjnw6H7xCZ/EVvdjkFpaiqOywM1XQKw17TtQxPEwrMhKT2YxhFai580ZZq
	xUMTn4zISrV4eRk=
X-Received: by 2002:a05:6102:8004:b0:602:97a8:10c0 with SMTP id
 ada2fe7eead31-602aeac9488mr2779671137.1.1774081397529; Sat, 21 Mar 2026
 01:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH2e8h6oinKxN1ndcvHCSc+=bFLXVVDZVAVF0cQHoiaMvEwhPQ@mail.gmail.com>
 <X2fV9mpVHV6Qk8-ImS7vxqDQXFt4K85jPKJWnxVono324hHaRh7x13f2HYM4CKNK-UDqrmP8Jz79-oVklw8vLBfaxPbVuQq4FBfblu27R9s=@pm.me>
 <CAH2e8h5tns-sXZ3-cvBmeAgbkNT1sG0kxNeaUGZnHoFEYh-Tjg@mail.gmail.com>
 <ZPf83Rxo54mgr4un9o9CNu9rXp4-8cQ8jkYIfHZODIzbJXEMISRS2PZKYqDCijOAq1N2eq0Wnt-kS0ys9KV0uB5TawUQLNjNcSzfQeUWe10=@pm.me>
 <CAH2e8h6wvab7tvZRUt0xS=SA5+hnKopQKCayT0JEgWL9_e3uTQ@mail.gmail.com> <z5Q2MMTkjlFG1ye2Vv0uZrEyVqazEnPeBWDmYwlvpZKK1m5tRSfP94gZNEUbec9qKSiaUQpzyqveE8ehad3JkL69HRKnHMSKJUhOm7mP1nE=@pm.me>
In-Reply-To: <z5Q2MMTkjlFG1ye2Vv0uZrEyVqazEnPeBWDmYwlvpZKK1m5tRSfP94gZNEUbec9qKSiaUQpzyqveE8ehad3JkL69HRKnHMSKJUhOm7mP1nE=@pm.me>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 21 Mar 2026 16:22:50 +0800
X-Gm-Features: AaiRm52jjXvDxakeU60nDVdaapYhdmmlSmf31ADk9cKh0mkKT4lyAI6BNcV7ToI
Message-ID: <CAH2e8h7DaS428LcB47+2dZh_pjkhvUU2k5riS1a57R_GNcxOTw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, jeffrey.l.hugo@gmail.com, 
	Jessica Zhang <jesszhan0024@gmail.com>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <lumag@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98998-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,oss.qualcomm.com,lists.freedesktop.org,marek.ca,vger.kernel.org,kernel.org,linux.intel.com,somainline.org,linaro.org,poorly.run,ffwll.ch,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,pm.me:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,marek.ca:email]
X-Rspamd-Queue-Id: 170F62E42A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 3:13=E2=80=AFAM Alexander Koskovich <akoskovich@pm.=
me> wrote:
>
>
> On Friday, March 20th, 2026 at 9:36 AM, Pengyu Luo <mitltlatltl@gmail.com=
> wrote:
>
> > On Fri, Mar 20, 2026 at 9:18=E2=80=AFPM Alexander Koskovich <akoskovich=
@pm.me> wrote:
> > >
> > > On Friday, March 20th, 2026 at 8:20 AM, Pengyu Luo <mitltlatltl@gmail=
.com> wrote:
> > >
> > > > On Fri, Mar 20, 2026 at 8:14=E2=80=AFPM Alexander Koskovich <akosko=
vich@pm.me> wrote:
> > > > >
> > > > > On Friday, March 20th, 2026 at 8:08 AM, Pengyu Luo <mitltlatltl@g=
mail.com> wrote:
> > > > >
> > > > > > On Fri, Mar 20, 2026 at 4:17=E2=80=AFPM Alexander Koskovich <ak=
oskovich@pm.me> wrote:
> > > > > > > >
> > > > > > > > On Friday, March 20th, 2026 at 3:36 AM, Dmitry Baryshkov <d=
mitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > >
> > > > > > > > > On Fri, Mar 20, 2026 at 07:02:54AM +0000, Alexander Kosko=
vich wrote:
> > > > > > > > > > On Friday, March 20th, 2026 at 2:50 AM, Alexander Kosko=
vich <akoskovich@pm.me> wrote:
> > > > > > > > > >
> > > > > > > > > > > On Friday, March 20th, 2026 at 2:38 AM, Dmitry Barysh=
kov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander=
 Koskovich wrote:
> > > > > > > > > > > > > On Friday, March 20th, 2026 at 12:25 AM, Jonathan=
 Marek <jonathan@marek.ca> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jon=
athan Marek wrote:
> > > > > > > > > > > > > > ...
> > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > >> That's not how it works. INTF (which feeds D=
SI) is after DSC compression.
> > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > >> INTF timings are always in RGB888 (24-bit) u=
nits. Ignoring widebus details,
> > > > > > > > > > > > > > >> the INTF timing should match what is program=
med on the DSI side (hdisplay,
> > > > > > > > > > > > > > >> which is calculated as bytes per line / 3).
> > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > >> (fwiw, the current "timing->width =3D ..." c=
alculation here blames to me, but
> > > > > > > > > > > > > > >> what I wrote originally was just "timing->wi=
dth =3D timing->width / 3" with a
> > > > > > > > > > > > > > >> comment about being incomplete.)
> > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > > Okay. After reading the docs (sorry, it took =
a while).
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > - When widebus is not enabled, the transfer i=
s always 24 bit of
> > > > > > > > > > > > > > >    compressed data. Thus if it is not in play=
, pclk and timing->width
> > > > > > > > > > > > > > >    should be scaled by source_pixel_depth / c=
ompression_ratio / 24. In
> > > > > > > > > > > > > > >    case of the code it is 'drm_dsc_get_bpp_in=
t(dsc) / 24'.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >    For RGB101010 / 8bpp DSC this should resul=
t in the PCLK being lowered
> > > > > > > > > > > > > > >    by the factor of 3 (=3D 24 / (30 / 3.75))
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > - When widebus is in play (MDSS 6.x+, DSI 2.4=
+), the transfer takes
> > > > > > > > > > > > > > >    more than 24 bits. In this case the PCLK a=
nd timing->width should be
> > > > > > > > > > > > > > >    scaled exactly by the DSC compression rati=
o, which is
> > > > > > > > > > > > > > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits=
_per_component).
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > So, this piece of code needs to be adjusted t=
o check for the widebus
> > > > > > > > > > > > > > > being enabled or not.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The widebus adjustment on the MDP/INTF side is =
already in
> > > > > > > > > > > > > > dpu_hw_intf_setup_timing_engine: the "data widt=
h" is divided by 2 for
> > > > > > > > > > > > > > 48-bit widebus instead of 24-bit. there shouldn=
't be any other
> > > > > > > > > > > > > > adjustment (downstream doesn't have any other a=
djustment).
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > a relevant downstream comment: "In DATABUS-WIDE=
N mode, MDP always sends
> > > > > > > > > > > > > > out 48-bit compressed data per pclk and on aver=
age, DSI consumes an
> > > > > > > > > > > > > > amount of compressed data equivalent to the unc=
ompressed pixel depth per
> > > > > > > > > > > > > > pclk."
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Based on that comment, this patch is correct, a=
nd the
> > > > > > > > > > > > > > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per=
_component)' adjustment
> > > > > > > > > > > > > > only applies to DSI.
> > > > > > > > > > > > >
> > > > > > > > > > > > > If I keep the INTF side at /24 and change the DSI=
 side to:
> > > > > > > > > > > > >
> > > > > > > > > > > > > if (wide_bus)
> > > > > > > > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisp=
lay * drm_dsc_get_bpp_int(dsc), dsc->bits_per_component * 3);
> > > > > > > > > > > > > else
> > > > > > > > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisp=
lay * drm_dsc_get_bpp_int(dsc), 24);
> > > > > > > > > > > >
> > > > > > > > > > > > Please check the actual fps (I'm usually using a vb=
lank-synced GL, e.g.
> > > > > > > > > > > > kmscube).
> > > > > > > > > > > >
> > > > > > > > > > > > At least this matches my expectations.
> > > > > > > > > > >
> > > > > > > > > > > Hmmm with kmscube I am getting 120FPS with 24 and 100=
FPS with 30. So I guess that's a no go
> > > > > > > > > >
> > > > > > > > > > Although it was using dsc->bits_per_component * 3 regar=
dless before for
> > > > > > > > > > dsi_adjust_pclk_for_compression so I guess that's what =
Jonathan was
> > > > > > > > > > referring to earlier...
> > > > > > > > >
> > > > > > > > > Do you have any of the patches by Marijn or Pengyu?
> > > > > > > > >
> > > > > > > > > - https://lore.kernel.org/linux-arm-msm/20260311-dsi-dsc-=
regresses-again-v1-1-6a422141eeea@somainline.org/
> > > > > > > > >
> > > > > > > > > - https://lore.kernel.org/linux-arm-msm/20260307111250.10=
5772-1-mitltlatltl@gmail.com/
> > > > > > > >
> > > > > > > > Nope, I can test with them though if you'd like
> > > > > > >
> > > > > > > Tested the following 3 patches on top of this series:
> > > > > > > drm/msm/dsi: fix hdisplay calculation when programming dsi re=
gisters
> > > > > > > drm/msm/dsi: fix bits_per_pclk
> > > > > > > drm/msm/dsi: fix hdisplay calculation for CMD mode panel
> > > > > > >
> > > > > > > Getting constant FIFO errors with them applied:
> > > > > > > [   64.851635] dsi_err_worker: status=3D4
> > > > > > > [   64.851692] dsi_err_worker: status=3D4
> > > > > > > [   64.851730] dsi_err_worker: status=3D4
> > > > > > > [   64.851766] dsi_err_worker: status=3D4
> > > > > > > [   64.851802] dsi_err_worker: status=3D4
> > > > > > > [   64.851837] dsi_err_worker: status=3D4
> > > > > > > [   64.851903] dsi_err_worker: status=3D4
> > > > > > > [   64.851940] dsi_err_worker: status=3D4
> > > > > > > [   64.851976] dsi_err_worker: status=3D4
> > > > > > > [   64.852011] dsi_err_worker: status=3D4
> > > > > >
> > > > > > Personally, I use
> > > > > > timing->width =3D DIV_ROUND_UP(timing->width * drm_dsc_get_bpp_=
int(dsc),
> > > > > >                          dsc->bits_per_component * 3);
> > > > > >
> > > > > > DIV_ROUND_UP is magic for me. If not, I got status=3D4 too.
> > > > > >
> > > > > > This works for 8-bit dst bpc with 10-bit src bpc.
> > > > >
> > > > > Did a quick test with that (plus the 3 changes listed above), sti=
ll getting the
> > > > > FIFO errors and no display.
> > > > >
> > > > > Are you using RGB101010?
> > > > >
> > > >
> > > > RGB101010(dst bpp) downstream, my panel supports RGB101010, and I c=
an
> > > > use RGB888 for it too.
> > > > I am testing rgb101010.
> > > > BTW, have you dumped registers? compared with downstream.
> > > >
> > > > I hardcode
> > > > display_data_hctl =3D (0xbe << 16) | hsync_data_start_x;
> > > > in dpu_hw_intf.c
> > > > downstream uses 0xbe for data_width
> > >
> > > Can you try this series with ac47870fd ("drm/msm/dsi: fix hdisplay ca=
lculation when programming dsi registers") reverted and with the following =
2 changes?
> > >
> > > https://github.com/AKoskovich/linux/commit/af24b0e2ee212153953dfee040=
da5cc077567363
> > > https://github.com/AKoskovich/linux/commit/e334675c0caf47956a838e2eaf=
da22fb689a967d
> > >
> >
> > I don't mind testing it, but some parameters are obviously wrong for me=
.
>
> Did some additional testing, reverted the change in dpu_encoder_phys_vid.=
c and
> picked only "drm/msm/dsi: fix hdisplay calculation when programming dsi
> registers". This results in the FIFO errors. But then when I mirror data_=
width
> calculation I see downstream, display then works.
>
> Can you try with just this (ignore other change I suggested):
> https://github.com/AKoskovich/linux/commit/af24b0e2ee212153953dfee040da5c=
c077567363
>
> That should make the display_data_hctl calculation correct so you don't n=
eed to
> hardcode (I think)
>

Yes! it will give the right data_width.

It seems when the compressed ratio is 3:1, compressed_width =3D
hdisplay/3, then halved because of the wide bus.
That makes data_width =3D DIV_ROUND_UP(p->width, 2); work. But this will
break when the compressed ratio is not 3:1, like bpp=3D8 with bpc=3D10.

Best wishes,
Pengyu

> >
> > int new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(=
dsc),
> >             dsc->bits_per_component * 3);
> >
> > This gives the correct clkrate with fixes([1]).
> >
> > fixed ac47870fd([2]) will give me the right hdisplay register value
> > @0xae94024 (I compared with downstream)
> >
> > [1]: https://gitlab.freedesktop.org/drm/msm/-/commit/e4eb11b34d6c84f398=
d8f08d7cb4d6c38e739dd2
> > [2]: https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitl=
tlatltl@gmail.com/
> >
> > BTW, I can only do 8-bit dst and 10-bit src test, 10-bit dst and
> > 10-bit src gave me
> >
> > Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_mode_set: set mode:
> > "1904x3040": 120 915552 1904 2180 2212 2244 3040 3066 3070 3400 0x48
> >  0x0
> > Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_pre_enable: id=3D0
> > Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_power_on: id=3D0
> > Mar 20 20:46:00 qcom kernel: msm_dsi_host_reset_phy:
> > Mar 20 20:46:00 qcom kernel: msm_dsi_host_reset_phy:
> > Mar 20 20:46:00 qcom kernel: dsi_calc_pclk: pclk=3D172992000, bclk=3D10=
8120000
> > Mar 20 20:46:00 qcom kernel: dsi_calc_pclk: pclk=3D172992000, bclk=3D10=
8120000
> > Mar 20 20:46:00 qcom kernel: dsi_link_clk_set_rate_6g: Set clk rates:
> > pclk=3D172992000, byteclk=3D108120000
> > Mar 20 20:46:00 qcom kernel: dsi_link_clk_set_rate_6g: Failed to set
> > rate pixel clk, -22
> > Mar 20 20:46:00 qcom kernel: msm_dsi_host_power_on: failed to enable
> > link clocks. ret=3D-22
> > Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_power_on: power on host 0
> > failed, -22
> > Mar 20 20:46:00 qcom kernel: msm_dsi ae94000.dsi: Power on failed: -22
> > Mar 20 20:46:00 qcom kernel: bias enabled
> > Mar 20 20:46:00 qcom kernel: panel-nt36536 ae94000.dsi.0: sending dcs
> > data ff 20 failed: -22
> > Mar 20 20:46:00 qcom kernel: panel-nt36536 ae94000.dsi.0: Failed to
> > initialize panel: -22
> > Mar 20 20:46:00 qcom kernel: [drm:dpu_encoder_phys_vid_enable:471] enc3=
3 intf2
> > Mar 20 20:46:00 qcom kernel:
> > [drm:dpu_encoder_phys_vid_setup_timing_engine:292] enc33 intf2
> > enabling mode:
> > Mar 20 20:46:00 qcom kernel:
> > [drm:dpu_encoder_phys_vid_setup_timing_engine:304] enc33 intf2
> > split_role 2, halve horizontal 952 1122
> > 1090 1106 0
> > Mar 20 20:46:00 qcom kernel:
> > [drm:dpu_encoder_phys_vid_setup_timing_engine:315] enc33 intf2
> > fmt_fourcc 0x34324752
> > Mar 20 20:46:00 qcom kernel:
> > [drm:programmable_fetch_get_num_lines:202] enc33 intf2 prog fetch is
> > not needed, large vbp+vsw
> > Mar 20 20:46:00 qcom kernel:
> > [drm:programmable_fetch_get_num_lines:217] enc33 intf2 v_front_porch
> > 26 v_back_porch 330 vsync_pulse_wi
> > dth 4
> > Mar 20 20:46:00 qcom kernel:
> > [drm:programmable_fetch_get_num_lines:221] enc33 intf2 wc_lines 24
> > needed_vfp_lines 4294966986 actual_v
> > fp_lines 0
> > Mar 20 20:46:00 qcom kernel: [drm:programmable_fetch_config:261] enc33
> > intf2 vfp_fetch_lines 0 vfp_fetch_start_vsync_counter 0
> > Mar 20 20:46:00 qcom kernel: [drm:dpu_encoder_phys_vid_enable:507]
> > enc33 intf2 update pending flush ctl 0 intf 3
> > Mar 20 20:46:00 qcom kernel: [drm:dpu_encoder_phys_vid_enable:471] enc3=
3 intf1
> > Mar 20 20:46:00 qcom kernel:
> > [drm:dpu_encoder_phys_vid_setup_timing_engine:292] enc33 intf1
> > enabling mode:
> > Mar 20 20:46:00 qcom kernel:
> > [drm:dpu_encoder_phys_vid_setup_timing_engine:304] enc33 intf1
> > split_role 1, halve horizontal 952 1122
> > 1090 1106 0
> > Mar 20 20:46:00 qcom kernel:
> > [drm:dpu_encoder_phys_vid_setup_timing_engine:315] enc33 intf1
> > fmt_fourcc 0x34324752
> >
> >
> > Best wishes,
> > Pengyu
> >
> > >
> > > >
> > > > Best wishes,
> > > > Pengyu
> > > > > >
> > > > > > Best wishes,
> > > > > > Pengyu
> > > > > >
> > > > >
> > > > > Thanks,
> > > > > Alex
> > > >
> > > >
> >
> >

