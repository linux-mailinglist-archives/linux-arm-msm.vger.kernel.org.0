Return-Path: <linux-arm-msm+bounces-98925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHVnH487vWkH8AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:20:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D67772DA101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D27B4300C00B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A223AC0F1;
	Fri, 20 Mar 2026 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSybmHtS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C42D3AC0D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009136; cv=pass; b=mZNgI1pfkfuChJRImBMChoVvlTBTWwWMGBQoSD8+9lhznKCmcXCFRMunVliaw0/oY50kJY1grmee3QzieXK2JIvTBp6oZOxR4KYDt+WnwdTiyqBm8UlAJMJcRe6Mufs1cFP71eDVuhjvuATHyZBxNtp7LZb+r6sHs0f6Lw5mnEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009136; c=relaxed/simple;
	bh=U/nfKQ4VDWkkxA2qk1NHIKri7XXUQm6IAMMvqmToj1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcdYHrqG2mbFHb5fDPJf4p7jDE9wmLPMwa9fmBTP5FWlZOpubpmFZpJP+PvbRkyxmk8sJFyDk8VI5XQlJmWGC06eLiJTJHw2zDSD4xuI/npfAMQHROD1hlCsw6mudiUtWQj8DbkoWF4FzoqL0B4CULGs/+T/ctK2y4KZ+CTKYC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSybmHtS; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ffbcfbcec4so121615137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 05:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774009132; cv=none;
        d=google.com; s=arc-20240605;
        b=UDCzs8FVfGu3PWhr7OmD+n0O1N2CHV7i4/RJ2WcWdK5+Yj/9nwgDw0Fl2UIM1fMIcW
         Y/u74D5tVpVCPhPzPfQdJyJF7q8nPDVvWhdpNq4iF3BrWVhnkR/5+XwSQZzg0J0Hv8yX
         LodMzPseYz3wgVPDpJJP4ibKTcdbXeGOHmn8KNoxCgqn/5MqGQJUWuWdLTbmRcsSltAE
         4H8/fcghPWrQppVHvnysSRWi2OErh9finUx4rx/XAmnJxuPBu83P87e8HOB3DloXe4oT
         EHirBRBVLiPHaeddjteK4OV5QafwXT9njJImk6Gf6t88MGidc0+Yzch03VM2xbCWEDge
         a5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9M1XBpPJACJ8r0qgNMAcAJHeDA994mwU5uq6wMMh5Ng=;
        fh=RYVIuDy32lZQTx8d6kJXC2h5/njKsowsFLXJDgnilUc=;
        b=ihaUBMoPnCso0rBBngltU15ODTexk78uXKeK9/kCNib1eZ6izo3Jt5eLfGTD8JtmNL
         6yy/VDu4MA9aacPAkWwUzyZokn1XwP14lyeCADW8Sb5dOcgVsX9jllH+BGZVF/5nDU8D
         +UX/w4WP8vZOwosiq/VCOPB42LbTTc/qNQ6NWh+I5EMP1UCIBq/MC1GwvD0d+5kFTAxu
         nf9RUVnZEhNk4AJ+ZZjvY54fdwXa8ofWNJx7wsz4xRTJnkKaJuqFrXZJjJuIzTbUUoA0
         OnjLaKIR7ZTu2R/klcxrwc6BfcH5lXr2pk2vQaHDKKiXOrtYjz/H/P8/1EsHtX7rEKov
         q9sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774009132; x=1774613932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9M1XBpPJACJ8r0qgNMAcAJHeDA994mwU5uq6wMMh5Ng=;
        b=cSybmHtShwIfzw/66NJ8et8HeRob6nUHniz4XVqLULZ3Kcq3IkZj3FJzJS1CQdonGh
         Xos2e3F+Ib3Ed85APF+u0TTIkPKgBEzG87GDxJaHWE4WfiKENf3tLIFWlBc7hv1V54mt
         PIqxMNNm8PWYR+xhOQmcYfmnbfidxmyGUOat2zxO4PxhWDkMiP++U+aEwSHrhXpXvES3
         aoF5p1Tyq5PaUEDirs3Ks7ns0n+npI3z7MPskcLDNDfro9Ju2ZtLRjhBbw7G8U4Zebrm
         EdoEo4nFQisrqa0PK5S+XFsKIQbjV3FlKtZmGWGgUSbXJY4GnNfDCpKdoovWDc9vBYl4
         zUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774009132; x=1774613932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9M1XBpPJACJ8r0qgNMAcAJHeDA994mwU5uq6wMMh5Ng=;
        b=fHM5Qj4zixsY6FevUy/aKfceaYDABqQt2i5tT3fEJbm581TpBw+j+RIcg1KgaUTDNi
         pmurkzcWOCQ8th7m+9jy1k1lRcovA5zPWmHpJaq44tjQxpQ74Q5PFSFWIX1YOc2WTCjm
         8RByAKzYvZcMLAeaL3+fxYT4fFgS0BIIbTHLky/EytcW2m6rDcAZCcy1TDiswDidTg4X
         fvNGHtFmSYJZxHFRA6dhX33kHB3d4zSnR9a4ncmxEsb9COh21/Zky6/+YY295NqSgMOf
         Cq/JAIm/3/ISgshCReB7hzdwS0HkXbzUQx7YBVomCAh9qdUY4vXy4WAqgB0inkgneXEx
         EAKg==
X-Forwarded-Encrypted: i=1; AJvYcCVocmX44KCEzxTM7T3vj/oAJA3sTjGztmn4uPWatYSbh2QAcwURFDifLoPZAjP99RiRD3b9mz2iH46T3KaO@vger.kernel.org
X-Gm-Message-State: AOJu0YwoDbBnuqkewojX92II+0Cq9h9clLLtm0tfuhyj7PuoFLjQDYHe
	TmxD9v+DuQpG+KuD1QIp2XkLaBf0HM/Qci3bB/Ym04pBy8VTTFTaeiAYGIAlcfE6boe/d+XpllU
	fysEOXeI04d5wr6yIUgMYz46bATjbYCFyVLvJF9X+aQ==
X-Gm-Gg: ATEYQzxPYyY/FEdcZKB6ON5Uhrto89m1NlLI+59+qWGMUi5TG3XWGHrRtHtO6VIBm5W
	2KXUhSVp40oEjKWc++NALAZy+dgmZ7UO1vARXxG/3ry60iYADoF5Q2+PZoOuaolW+hkGrGe7S1z
	5FvnaZEBWfIjTufB1MNMM2q4pzjb6wUsCw6zun2JUT+dtPY6wRFEnMUbI24EmgijbKb2majHKuD
	XTNmv2vg6pP29G5wRRH5ugjwMvRhkgmRwSHN1N4dFUl3xsMTHUOau25ppUDDxu6mU+zwNGaJzrl
	ftmwus2ww1LBgQyBSho=
X-Received: by 2002:a05:6102:3e1b:b0:602:8ccb:c993 with SMTP id
 ada2fe7eead31-602aeca3685mr1117017137.24.1774009131910; Fri, 20 Mar 2026
 05:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH2e8h6oinKxN1ndcvHCSc+=bFLXVVDZVAVF0cQHoiaMvEwhPQ@mail.gmail.com>
 <X2fV9mpVHV6Qk8-ImS7vxqDQXFt4K85jPKJWnxVono324hHaRh7x13f2HYM4CKNK-UDqrmP8Jz79-oVklw8vLBfaxPbVuQq4FBfblu27R9s=@pm.me>
In-Reply-To: <X2fV9mpVHV6Qk8-ImS7vxqDQXFt4K85jPKJWnxVono324hHaRh7x13f2HYM4CKNK-UDqrmP8Jz79-oVklw8vLBfaxPbVuQq4FBfblu27R9s=@pm.me>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 20 Mar 2026 20:18:25 +0800
X-Gm-Features: AaiRm53LTU8wDCJYrqqJ0gCya3PGyhV0RKl3jbpxe7hECfpaOd_OZ97fvpacJVc
Message-ID: <CAH2e8h5tns-sXZ3-cvBmeAgbkNT1sG0kxNeaUGZnHoFEYh-Tjg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98925-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,oss.qualcomm.com,lists.freedesktop.org,marek.ca,vger.kernel.org,kernel.org,linux.intel.com,somainline.org,linaro.org,poorly.run,ffwll.ch,suse.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.576];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D67772DA101
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 8:14=E2=80=AFPM Alexander Koskovich <akoskovich@pm.=
me> wrote:
>
> On Friday, March 20th, 2026 at 8:08 AM, Pengyu Luo <mitltlatltl@gmail.com=
> wrote:
>
> > On Fri, Mar 20, 2026 at 4:17=E2=80=AFPM Alexander Koskovich <akoskovich=
@pm.me> wrote:
> > > >
> > > > On Friday, March 20th, 2026 at 3:36 AM, Dmitry Baryshkov <dmitry.ba=
ryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > > On Fri, Mar 20, 2026 at 07:02:54AM +0000, Alexander Koskovich wro=
te:
> > > > > > On Friday, March 20th, 2026 at 2:50 AM, Alexander Koskovich <ak=
oskovich@pm.me> wrote:
> > > > > >
> > > > > > > On Friday, March 20th, 2026 at 2:38 AM, Dmitry Baryshkov <dmi=
try.baryshkov@oss.qualcomm.com> wrote:
> > > > > > >
> > > > > > > > On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander Koskovi=
ch wrote:
> > > > > > > > > On Friday, March 20th, 2026 at 12:25 AM, Jonathan Marek <=
jonathan@marek.ca> wrote:
> > > > > > > > >
> > > > > > > > > > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Ma=
rek wrote:
> > > > > > > > > > ...
> > > > > > > > > > >>
> > > > > > > > > > >> That's not how it works. INTF (which feeds DSI) is a=
fter DSC compression.
> > > > > > > > > > >>
> > > > > > > > > > >> INTF timings are always in RGB888 (24-bit) units. Ig=
noring widebus details,
> > > > > > > > > > >> the INTF timing should match what is programmed on t=
he DSI side (hdisplay,
> > > > > > > > > > >> which is calculated as bytes per line / 3).
> > > > > > > > > > >>
> > > > > > > > > > >> (fwiw, the current "timing->width =3D ..." calculati=
on here blames to me, but
> > > > > > > > > > >> what I wrote originally was just "timing->width =3D =
timing->width / 3" with a
> > > > > > > > > > >> comment about being incomplete.)
> > > > > > > > > > >>
> > > > > > > > > > > Okay. After reading the docs (sorry, it took a while)=
.
> > > > > > > > > > >
> > > > > > > > > > > - When widebus is not enabled, the transfer is always=
 24 bit of
> > > > > > > > > > >    compressed data. Thus if it is not in play, pclk a=
nd timing->width
> > > > > > > > > > >    should be scaled by source_pixel_depth / compressi=
on_ratio / 24. In
> > > > > > > > > > >    case of the code it is 'drm_dsc_get_bpp_int(dsc) /=
 24'.
> > > > > > > > > > >
> > > > > > > > > > >    For RGB101010 / 8bpp DSC this should result in the=
 PCLK being lowered
> > > > > > > > > > >    by the factor of 3 (=3D 24 / (30 / 3.75))
> > > > > > > > > > >
> > > > > > > > > > > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the =
transfer takes
> > > > > > > > > > >    more than 24 bits. In this case the PCLK and timin=
g->width should be
> > > > > > > > > > >    scaled exactly by the DSC compression ratio, which=
 is
> > > > > > > > > > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_com=
ponent).
> > > > > > > > > > >
> > > > > > > > > > > So, this piece of code needs to be adjusted to check =
for the widebus
> > > > > > > > > > > being enabled or not.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > The widebus adjustment on the MDP/INTF side is already =
in
> > > > > > > > > > dpu_hw_intf_setup_timing_engine: the "data width" is di=
vided by 2 for
> > > > > > > > > > 48-bit widebus instead of 24-bit. there shouldn't be an=
y other
> > > > > > > > > > adjustment (downstream doesn't have any other adjustmen=
t).
> > > > > > > > > >
> > > > > > > > > > a relevant downstream comment: "In DATABUS-WIDEN mode, =
MDP always sends
> > > > > > > > > > out 48-bit compressed data per pclk and on average, DSI=
 consumes an
> > > > > > > > > > amount of compressed data equivalent to the uncompresse=
d pixel depth per
> > > > > > > > > > pclk."
> > > > > > > > > >
> > > > > > > > > > Based on that comment, this patch is correct, and the
> > > > > > > > > > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_compone=
nt)' adjustment
> > > > > > > > > > only applies to DSI.
> > > > > > > > >
> > > > > > > > > If I keep the INTF side at /24 and change the DSI side to=
:
> > > > > > > > >
> > > > > > > > > if (wide_bus)
> > > > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * dr=
m_dsc_get_bpp_int(dsc), dsc->bits_per_component * 3);
> > > > > > > > > else
> > > > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * dr=
m_dsc_get_bpp_int(dsc), 24);
> > > > > > > >
> > > > > > > > Please check the actual fps (I'm usually using a vblank-syn=
ced GL, e.g.
> > > > > > > > kmscube).
> > > > > > > >
> > > > > > > > At least this matches my expectations.
> > > > > > >
> > > > > > > Hmmm with kmscube I am getting 120FPS with 24 and 100FPS with=
 30. So I guess that's a no go
> > > > > >
> > > > > > Although it was using dsc->bits_per_component * 3 regardless be=
fore for
> > > > > > dsi_adjust_pclk_for_compression so I guess that's what Jonathan=
 was
> > > > > > referring to earlier...
> > > > >
> > > > > Do you have any of the patches by Marijn or Pengyu?
> > > > >
> > > > > - https://lore.kernel.org/linux-arm-msm/20260311-dsi-dsc-regresse=
s-again-v1-1-6a422141eeea@somainline.org/
> > > > >
> > > > > - https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-m=
itltlatltl@gmail.com/
> > > >
> > > > Nope, I can test with them though if you'd like
> > >
> > > Tested the following 3 patches on top of this series:
> > > drm/msm/dsi: fix hdisplay calculation when programming dsi registers
> > > drm/msm/dsi: fix bits_per_pclk
> > > drm/msm/dsi: fix hdisplay calculation for CMD mode panel
> > >
> > > Getting constant FIFO errors with them applied:
> > > [   64.851635] dsi_err_worker: status=3D4
> > > [   64.851692] dsi_err_worker: status=3D4
> > > [   64.851730] dsi_err_worker: status=3D4
> > > [   64.851766] dsi_err_worker: status=3D4
> > > [   64.851802] dsi_err_worker: status=3D4
> > > [   64.851837] dsi_err_worker: status=3D4
> > > [   64.851903] dsi_err_worker: status=3D4
> > > [   64.851940] dsi_err_worker: status=3D4
> > > [   64.851976] dsi_err_worker: status=3D4
> > > [   64.852011] dsi_err_worker: status=3D4
> >
> > Personally, I use
> > timing->width =3D DIV_ROUND_UP(timing->width * drm_dsc_get_bpp_int(dsc)=
,
> >                          dsc->bits_per_component * 3);
> >
> > DIV_ROUND_UP is magic for me. If not, I got status=3D4 too.
> >
> > This works for 8-bit dst bpc with 10-bit src bpc.
>
> Did a quick test with that (plus the 3 changes listed above), still getti=
ng the
> FIFO errors and no display.
>
> Are you using RGB101010?
>

RGB101010(dst bpp) downstream, my panel supports RGB101010, and I can
use RGB888 for it too.
I am testing rgb101010.
BTW, have you dumped registers? compared with downstream.

I hardcode
display_data_hctl =3D (0xbe << 16) | hsync_data_start_x;
in dpu_hw_intf.c
downstream uses 0xbe for data_width

Best wishes,
Pengyu
> >
> > Best wishes,
> > Pengyu
> >
>
> Thanks,
> Alex

