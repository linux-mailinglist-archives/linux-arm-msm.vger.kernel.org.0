Return-Path: <linux-arm-msm+bounces-98985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDNDJfQqvmmaIAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 06:21:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D077A2E35C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 06:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E00AD303454E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 05:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6102E2D0C7E;
	Sat, 21 Mar 2026 05:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gllKGBee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA621F0E25
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 05:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774070403; cv=pass; b=X1uHYX3mzRpCLHEUXKYxynqCwE+TBiwng7qjpvZB9fnDZv5q79vMXMQXwUgWuiLYUom+H/PbAPKpe0DNWYi1WA9IanX2DDxlvsyeERvGDcIFPBSUJFCayDMfURM5LI315V0//EcC4yIq/TMNOYKeq/kisag+03MXTpzv3NrXHyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774070403; c=relaxed/simple;
	bh=SEZbQkWF+yEBGQfOuUplRC48LoBThxzx4kC+AICDU30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLfoeCLFI2oOrXrqoTLtCVP0PDrKu7jLIc5lzqn6Qfr9vQZFw6Aq11E1JpufYNjadKxXjnaiapAMIEHWOqImapvaG/Fkcf4kCDN9nbgV6gmd7vZ13IMQF3p5hfyqVY0W/IMu+iWRWa1r38vJCpBFL7CAESm01U+nYNL7D8s8zcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gllKGBee; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5674d8be45eso991234e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 22:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774070398; cv=none;
        d=google.com; s=arc-20240605;
        b=ScvqrDbX6PswCR1uKKQhGRUICYzJ5gbEAKHwfJYwSYFV1XUJmRrEjmIgZFG4yI2pk7
         DeAeMj79FOpOOT56JwEsidUJlwMAFrG/HSOvlivlRXzA5q3MReiGuykDdsNiINJhYQFS
         fxH0KXMI4XPwtbvtGxG4AM9542qBh4vvjmISO0762vRW+f8h23yOpoxVQszR4SV3FU9t
         e9Oyt3WH/eZMhyRclWHtpsAZw99jYeeaDCTSlpO68nqJqnINdaZy3QPKf+FSoew1Mq9T
         1TRrWU4/nL0RFc9hNVzHVP+hlU5nYhv8j4QFWegJlCPxiXmDOWftRVmoUg1ShJcnX2pS
         bymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnFDGG/qO8xQBCsXITOmY6HdAR3OjQn9h41sAssDEU4=;
        fh=iLLTkdYYmNc3O8snlSFyThomNvJCLqBFt+djgwsFEEM=;
        b=Zuge3R4r3PxRz94VO0KL5jHOK9kSyfO4OxcZcPDIKG62gDCi/0IBX4R67Md2d/t/Er
         GAaYbwpW8UN+KUAgeqN+TDR9MVrDat2i2a0bqNXwvoAI6dsjoD7Pg9XMwBVWYkNtanEp
         rCxlwqkCAzMWzfqobAFifC/yXFjMATj1CL5tDNVXu+HiChfjVMCeG1BwDXfpqkjiYmav
         CnYV7UFLeyq5riHznjaCgde2RIr7SNBro7wRXu+8Ljs5pdFOmdR9CzG5Rwap+j21vSvz
         UUlFjWF0FDrbRt6lFIgscZcgJaTgPhjOj4OnR7r0QezrGr/IJvm7Zv5aqkR6WokOuK5k
         87sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774070398; x=1774675198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnFDGG/qO8xQBCsXITOmY6HdAR3OjQn9h41sAssDEU4=;
        b=gllKGBeeF6UPGMNXiPh3wPCjZNUo0pKBFUTMB17Spzs2zigQxYme/xzkl49k22uQ2k
         lh6/JbifBratX2NjSDz6wtrOQ+NmO4UQWerh8FqflPEbkWalbpGaYrXirtmVevu5A5IG
         Ep1ifRGovoYAkPxzvwDTYk3pUNTs5DxlNvsYOHA1KYaziU4iZ5FTEpqZ3Y8BC+BE2/fL
         hU5OPfKCdzux8oN4/AZLkPvJlxEtKHF1xgF/48OgLQ5iaS4LIfqC7+5wkao1SGYH3SfE
         TdS1WBLSWJzKNm14mfwbInOqVmNkVXUy52yzdBHl7+bK9piqEHrvSnYBIlqjfgxAIpkp
         Yo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774070398; x=1774675198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnFDGG/qO8xQBCsXITOmY6HdAR3OjQn9h41sAssDEU4=;
        b=NmmBXtHccogRBObhatr4vPLG6V/u4pl2jo1yeCdkOdZaXSYEMimguHG33kcapU5ngh
         NKtRCBtXtaRnqsBE9Wu3joJwElDenH4bdDP9TyhQ2gwdZghHx/g0vJjl0EXbyCOZ/4Mu
         OZfLM6IhNpJ1Ezxrr0epO1tZO4nNgELGRi+dzh7Su2VYqwZjDff5f0SVt8xnTijiab82
         9eWEuuVQM5CREsa3nvQom4mZUTuZT6NHxHYhPxTAWEFy+IOsXbwtyPmzAWDTqWjLQ9rH
         oDc+3R8pBM3gTSABlnpPb1f/zfdS48iPCLFiZRsVny+A5IwtYkxAz/MVa/VluhCXCCLo
         K2PA==
X-Forwarded-Encrypted: i=1; AJvYcCWmtoYKI2SqGa+4l50RTwJE7YNVrJRkr1Q0KOz1CleZP7dD4pQSOw5YC82VKo4k0aakHZJOycm9M7X9wqPe@vger.kernel.org
X-Gm-Message-State: AOJu0YwjdOwoyP/nkH6K7G1Pyln/kYkOms0dRi2K6dgfkEB/n13+35Tx
	BHUVTyoiGqFj8fGReu4C5M+CyJ4Dp4kibz9pEdW/6lgsarCCW8n/xjFKpBEmbMPq852X6jObVoi
	gvJ9F7oXpqP4jMFIjtDWWkbqcGheRdLo=
X-Gm-Gg: ATEYQzxgIrb/0cg7rZtqq3nit9PByNBmjoLpKMPjcyrUA6bob92K3KkuW6l9zt4/PfM
	t+u0VGXVQ6wsd0WhB0Lm/Ps8Crba0PJvnbFQx4uHfFVaX00dgA6unOvEncoCZ4AXybkL/FNFEQL
	S1bnUmaW8dIrxXooGfRBYud8yuRJR/9BoTy3sKCebrEU/atLx/jekVCLFU3VMJk9AXIIeZXg5QD
	u7loW5oLih/FPtchh2PG7JSagkPdJpHtVFYWjKWMYtJ58ZR3JuCf7hMvtSnO/FKcTIeA1Xw6PRV
	tulqh79SCat4geU=
X-Received: by 2002:a05:6122:6991:b0:56c:d401:4aff with SMTP id
 71dfb90a1353d-56cde1d346amr2343537e0c.0.1774070398385; Fri, 20 Mar 2026
 22:19:58 -0700 (PDT)
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
Date: Sat, 21 Mar 2026 13:19:30 +0800
X-Gm-Features: AaiRm509pDsaLob8VR2rUbuqVPa4XMCfftiC0fPCVru4BUfq5hnC8J6WJxEZoeg
Message-ID: <CAH2e8h7RJA5w2XnJ6inr_a3w-3YMmtjzXErGNCr0Z-qELNz-fQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-98985-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url,qualcomm.com:email,pm.me:email]
X-Rspamd-Queue-Id: D077A2E35C6
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

Yes, that would work. I recently hardcoded data_width(not dig it yet),
after I fixed
clock issues(mentioned in the last email) last night, 10b input w/
output works well now.
But the clock issues may not confuse you. My panel is 2 * 952*3040
with C-PHY native
10b, pclk goes unusual, the ratio(35/16) only shows in 10b in with10b out m=
ode.

 dsi0_phy_pll_out_dsiclk             2       2        0        378420000
     disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
 dsi0_phy_pll_out_byteclk            2       2        0        108120000
     disp_cc_mdss_byte1_clk_src       2       2        0        108120000

> Can you try with just this (ignore other change I suggested):
> https://github.com/AKoskovich/linux/commit/af24b0e2ee212153953dfee040da5c=
c077567363
>
> That should make the display_data_hctl calculation correct so you don't n=
eed to
> hardcode (I think)
>

Awesome! I will later. I hope this will fix the data_width issue finally.

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

