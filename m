Return-Path: <linux-arm-msm+bounces-98923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FOMLNw4vWkN7wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:09:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689C2D9EB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBC84300A3A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81467359A92;
	Fri, 20 Mar 2026 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQv9Er5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101813A451C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008495; cv=pass; b=nPa50BDNwXGrTlFI+6jUlnyyTkhSBoJAi6t8ojOS63h5wt9n2yMFNAxFCkWkMBH/gvRKAlzX33zJm7nqLQ5WwmPH9NFG8gpp8K3Z4xF+ZF104gczXBzmM5Q23lHBNWouo3YiqXytXqXRH+XfvEsWI2J5NEKWym/2qaYuzhXPSss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008495; c=relaxed/simple;
	bh=54mu5yl7FfxvRsubRkTvYZ2DjGDhxvkVEkBfB6Y/WY0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lgjrFTOAOeyw3ZWSSaFJK7mtw+acyTx8rSgrLH1Yx1RdY3SFYsN0+fWiaDN/faMIlY0UhfwxzkWHDv6tvnm+svTjMXmmy+yv7daKGEY3XuGz40sdLl71+R6UaZwjIgHWPGg4UbD4i1P4fXtx3s4briYlUcedEOgOVJPsGopoCQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQv9Er5e; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94acd026e45so361505241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 05:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774008493; cv=none;
        d=google.com; s=arc-20240605;
        b=AXuaF4OIfj/8oAqB4xJUbFAV7MiJLHVFzRpao1dbb6JIwyeTyEfmzdYBnyQKQ5wCST
         S43OEfYUrV6wQdfvHfp36vl3hiSJ4ocqZikTgzym/BQhjGJYruhS8UZfGAWZcmBfN+/F
         GRFBL+v5qTJYjJzouDRAgb9M+ziSlyGgDee4mo25ANx2Mp5SesidxHV+aLeEEB8I8DnN
         0492SmeFKOYdQTSBanU1QsHcC22LWoKWo4M7pVzFFrPO4ZRxWBTYqXF3epeMHxhY8RX9
         MAMxEJCoW8D94t4j9LFkmAJDCEx7Y+fSz3SOfyu8T9pc85m2/NMOdW9A/5qfz22D0hdt
         GzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Qpko9v6Uv9SOlICvwfaBdGeXRMXz2LcJLxIYJaIJnHg=;
        fh=psDKfokZAgsV/Ni9usEDeg1nP/GEH8/qf0u4cR/VsoM=;
        b=T/d8LGYQoLWjtKcWmNxMeA6ffee+5KFYuaQLfjs+kkGwIxQDZNZEU9zZJbmWx3ndN+
         oPCc8KsGwUKEccdFmAjlhz8fweE/UgLuCdPtQvRifgFAafaea7rC7UyGAk12ygz7MzbO
         iLfrtb3lHq88M4AMNdsLsSbsB+o71Z8NlI9FBt5GSRfbPNRu5X9gPqXUblURvkkFKoIJ
         1TJFhuKq6Na+An5qP0N/9+eGuMcivD3FcgntqsGoQBw0cAjQjA4HqJ7agdfigKz7g99t
         wFEI8TnsdatxmQ5dVUw7Oszm70kJ7jhlm2snm9ZEdxoQulthQDYdd+BJZT/0ZGspU377
         rEMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774008493; x=1774613293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qpko9v6Uv9SOlICvwfaBdGeXRMXz2LcJLxIYJaIJnHg=;
        b=EQv9Er5e+wWtwTPP8GCjROwUOH0BIUi9aCaDDj7lW4bQumm1n6OOhtMNrrjlAkWdgB
         cfX4EmMd2tGI4qjbpdgrJAmlT/8TJ88lr7Whfg+EkZ8suwbsejdB6pbL+dMlLYKb6alf
         mIoWCstbXOQ7N7gZ2BWdfb/hi0X2B5tezn2Jf15K7BLWlmsmkq41Y3y/s2GuODbbBnRF
         9+fqGQbQ9QVlICz5nuqaa5c6xoUVqooFCo5P5zIsR+1gn0GAClUuIcSmRTH3jlaBRC5n
         japYCjjE4BC758uAW6f2M+wf+HKLJ38S85Ju1pPmoSwhANLrOMkvdxG9VWIZVxzsKKmc
         1QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774008493; x=1774613293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpko9v6Uv9SOlICvwfaBdGeXRMXz2LcJLxIYJaIJnHg=;
        b=YySXPppAxcpxHsUQ31IYRdPz2CPItMF3z6rh8dVIMC2LmKl2x7luS5FGL8vHWryeOw
         EHpI7bxi3cPtQiZItG9/fhoQb9hZOUVTF5hq7pVSUNp99sMJ+GA0DVniH5HFCUo8vF9q
         9ph3rGIPiOOu2SW5TrTc9BeHrJBtnF78Iq9GwKYfdOp/goSp2wgWvlNOcRHKGNMzXIH7
         usT/UU70dNUC59yeeCdod8Mbq9hPyYQoMLtt0aZdxXZeipc2UzZ7w2xRSu+sqJ1Sz4os
         l+qzYQ2Bgzn0G0/2Q0VEH9w26YK/0HvTYtKiA4Z3kNpurDoZJZLMhllhxa1s40kgZIFJ
         Leig==
X-Forwarded-Encrypted: i=1; AJvYcCURsqMiL2kU7NGgipbocoQHpncHiRU4+iY4lIojqrrGUVm18ZdLtIn1NG703iYkuhtsS6W++pFrfgFoDTLV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl+TeOPf/MXUexmT8k+Twu6i7Q+pGuMFNGFOLsQWmOD1ItO9U3
	d+E8c78qddzAdU4ZCOL1JEHAiEIjX1++f+zWHXVAV7/N030BVgftzyww94F7XPSQZEh3OuR1hzd
	KTzjSYDGAZTf5NbUCXVZlSA4mKKMbiSg=
X-Gm-Gg: ATEYQzzPcwvsSLaSWeU+VeAnosTIk6queN9bW6uRNPAgBnbb1YjlMky653brF2jCT/o
	qOpapsmYb7RjcSrqDsS4HMNSg5ooqAMAOTN/xNBi7CuJbU3b5vSu9cgunY0BAfVPqmRa2vjw0St
	ySXH9f365L+LkDXXM5L1vkifW+dQlw9++I6jNAtyj+kHqq7uPSltOfoAsvmBSiv8R/5ziNQGuVt
	y7k9qob06ZjHY/IMvPttgJCrjQUm4NYeTte7N0k8nVNFGj5ofFLNY5IhdYPLrJbGChjbsIUnTry
	WREWVhBH
X-Received: by 2002:a05:6102:4a81:b0:5f1:72a7:f879 with SMTP id
 ada2fe7eead31-602aed27230mr1195716137.28.1774008492934; Fri, 20 Mar 2026
 05:08:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 20 Mar 2026 20:07:46 +0800
X-Gm-Features: AaiRm53IYd5mxSjYs0gkBExJVtx1S6K0r6ROFO9ciiV3q521x0whe0nuV42GAAs
Message-ID: <CAH2e8h6oinKxN1ndcvHCSc+=bFLXVVDZVAVF0cQHoiaMvEwhPQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
To: akoskovich@pm.me
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
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98923-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.178];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,oss.qualcomm.com,lists.freedesktop.org,marek.ca,vger.kernel.org,kernel.org,linux.intel.com,somainline.org,linaro.org,poorly.run,ffwll.ch,suse.de];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marek.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,pm.me:email]
X-Rspamd-Queue-Id: 3689C2D9EB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 4:17=E2=80=AFPM Alexander Koskovich <akoskovich@pm.=
me> wrote:
> >
> > On Friday, March 20th, 2026 at 3:36 AM, Dmitry Baryshkov <dmitry.barysh=
kov@oss.qualcomm.com> wrote:
> >
> > > On Fri, Mar 20, 2026 at 07:02:54AM +0000, Alexander Koskovich wrote:
> > > > On Friday, March 20th, 2026 at 2:50 AM, Alexander Koskovich <akosko=
vich@pm.me> wrote:
> > > >
> > > > > On Friday, March 20th, 2026 at 2:38 AM, Dmitry Baryshkov <dmitry.=
baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > > On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander Koskovich w=
rote:
> > > > > > > On Friday, March 20th, 2026 at 12:25 AM, Jonathan Marek <jona=
than@marek.ca> wrote:
> > > > > > >
> > > > > > > > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > > > > > > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek =
wrote:
> > > > > > > > ...
> > > > > > > > >>
> > > > > > > > >> That's not how it works. INTF (which feeds DSI) is after=
 DSC compression.
> > > > > > > > >>
> > > > > > > > >> INTF timings are always in RGB888 (24-bit) units. Ignori=
ng widebus details,
> > > > > > > > >> the INTF timing should match what is programmed on the D=
SI side (hdisplay,
> > > > > > > > >> which is calculated as bytes per line / 3).
> > > > > > > > >>
> > > > > > > > >> (fwiw, the current "timing->width =3D ..." calculation h=
ere blames to me, but
> > > > > > > > >> what I wrote originally was just "timing->width =3D timi=
ng->width / 3" with a
> > > > > > > > >> comment about being incomplete.)
> > > > > > > > >>
> > > > > > > > > Okay. After reading the docs (sorry, it took a while).
> > > > > > > > >
> > > > > > > > > - When widebus is not enabled, the transfer is always 24 =
bit of
> > > > > > > > >    compressed data. Thus if it is not in play, pclk and t=
iming->width
> > > > > > > > >    should be scaled by source_pixel_depth / compression_r=
atio / 24. In
> > > > > > > > >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'=
.
> > > > > > > > >
> > > > > > > > >    For RGB101010 / 8bpp DSC this should result in the PCL=
K being lowered
> > > > > > > > >    by the factor of 3 (=3D 24 / (30 / 3.75))
> > > > > > > > >
> > > > > > > > > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the tran=
sfer takes
> > > > > > > > >    more than 24 bits. In this case the PCLK and timing->w=
idth should be
> > > > > > > > >    scaled exactly by the DSC compression ratio, which is
> > > > > > > > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_compone=
nt).
> > > > > > > > >
> > > > > > > > > So, this piece of code needs to be adjusted to check for =
the widebus
> > > > > > > > > being enabled or not.
> > > > > > > > >
> > > > > > > >
> > > > > > > > The widebus adjustment on the MDP/INTF side is already in
> > > > > > > > dpu_hw_intf_setup_timing_engine: the "data width" is divide=
d by 2 for
> > > > > > > > 48-bit widebus instead of 24-bit. there shouldn't be any ot=
her
> > > > > > > > adjustment (downstream doesn't have any other adjustment).
> > > > > > > >
> > > > > > > > a relevant downstream comment: "In DATABUS-WIDEN mode, MDP =
always sends
> > > > > > > > out 48-bit compressed data per pclk and on average, DSI con=
sumes an
> > > > > > > > amount of compressed data equivalent to the uncompressed pi=
xel depth per
> > > > > > > > pclk."
> > > > > > > >
> > > > > > > > Based on that comment, this patch is correct, and the
> > > > > > > > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)'=
 adjustment
> > > > > > > > only applies to DSI.
> > > > > > >
> > > > > > > If I keep the INTF side at /24 and change the DSI side to:
> > > > > > >
> > > > > > > if (wide_bus)
> > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_ds=
c_get_bpp_int(dsc), dsc->bits_per_component * 3);
> > > > > > > else
> > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_ds=
c_get_bpp_int(dsc), 24);
> > > > > >
> > > > > > Please check the actual fps (I'm usually using a vblank-synced =
GL, e.g.
> > > > > > kmscube).
> > > > > >
> > > > > > At least this matches my expectations.
> > > > >
> > > > > Hmmm with kmscube I am getting 120FPS with 24 and 100FPS with 30.=
 So I guess that's a no go
> > > >
> > > > Although it was using dsc->bits_per_component * 3 regardless before=
 for
> > > > dsi_adjust_pclk_for_compression so I guess that's what Jonathan was
> > > > referring to earlier...
> > >
> > > Do you have any of the patches by Marijn or Pengyu?
> > >
> > > - https://lore.kernel.org/linux-arm-msm/20260311-dsi-dsc-regresses-ag=
ain-v1-1-6a422141eeea@somainline.org/
> > >
> > > - https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitlt=
latltl@gmail.com/
> >
> > Nope, I can test with them though if you'd like
>
> Tested the following 3 patches on top of this series:
> drm/msm/dsi: fix hdisplay calculation when programming dsi registers
> drm/msm/dsi: fix bits_per_pclk
> drm/msm/dsi: fix hdisplay calculation for CMD mode panel
>
> Getting constant FIFO errors with them applied:
> [   64.851635] dsi_err_worker: status=3D4
> [   64.851692] dsi_err_worker: status=3D4
> [   64.851730] dsi_err_worker: status=3D4
> [   64.851766] dsi_err_worker: status=3D4
> [   64.851802] dsi_err_worker: status=3D4
> [   64.851837] dsi_err_worker: status=3D4
> [   64.851903] dsi_err_worker: status=3D4
> [   64.851940] dsi_err_worker: status=3D4
> [   64.851976] dsi_err_worker: status=3D4
> [   64.852011] dsi_err_worker: status=3D4

Personally, I use
timing->width =3D DIV_ROUND_UP(timing->width * drm_dsc_get_bpp_int(dsc),
                         dsc->bits_per_component * 3);

DIV_ROUND_UP is magic for me. If not, I got status=3D4 too.

This works for 8-bit dst bpc with 10-bit src bpc.

Best wishes,
Pengyu

