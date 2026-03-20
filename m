Return-Path: <linux-arm-msm+bounces-98898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHJ0FcACvWkO5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:18:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 039BB2D7180
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:18:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4D0730185C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0195E311950;
	Fri, 20 Mar 2026 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NTm0yq8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768A83596E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994673; cv=none; b=XrXdPx22npOKdg++cVMU9orYDVc1bn/6jvJ+1Iw2VB2GLHfRUs6q1SVJLxc8xWvLpSETS2PKWBb3hRPD7xYUBaztP6Aab5E18B4V4BrYF4u2Cged1n8QJUFVkhkkr3ke4Zvk42Fr60SY6X2N1vhxO8lfzpFXS/c5rlU2e0svmm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994673; c=relaxed/simple;
	bh=PeKmk++O1+X37JLMnmIp1o9smWfILhH5cUIyHzUAg3c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KdG9I5+7h4NDVYzygtCVf5Y4CJs6lMiS+3at1PFp8xDesEoXdsxBbIzNTC/a5CwTkgBGIuw72ILuU/aHy5xf1WGgxqqesrTawSBID859bRaslFKkY6r3cMdlLh1GKeeli0tVfaxVYllMZLr6p+8urem36nt/HNrEPNTxMqvwA2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NTm0yq8E; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773994663; x=1774253863;
	bh=fM7dL1/cHCx+Ecxe9pDNzmAwYJLh6/HrEMptDcRGWZ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NTm0yq8EGUJ3OEgTtw6o49sQURoYcrrg1jSWltkQFjAKPx5l52jUW/NpROLBfaC14
	 EgwmgpsN4b2xzepLab7eOCJzXLZgiHT+10Ko7YxciXmQbmRqNzPmyGVuOr93tnfPMy
	 59bT/P3yXn5g0BFTxDssmpLjWwKXmgedv+xoh5A9QLZZ91rJo9kLcfqz8faOu0tMyP
	 kajtEKit1Wkwq/zHH9VGtZfr/vJs0wrWlnRpo5NpzWi0V4+NIQm+LvW5M9ShcMCYYU
	 eSldgWDIMdLkpveuOEcyBfEnoU8buoRBxfMNGf0pIy1+k8V+OmugfFOyi21ioaLTVy
	 up7UM0+SAeBTQ==
Date: Fri, 20 Mar 2026 08:17:39 +0000
To: Alexander Koskovich <akoskovich@pm.me>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jonathan Marek <jonathan@marek.ca>, Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <naP6t_tS7tuJtjxhfb4JtC4B6CLhiZiSstDWtFS6TWtZQYwd4XkdHNEGGC8pH_-K6OzDF0sleZl9PF1b8NKDhNB7C9a2bzJw3d0FPAAqlAE=@pm.me>
In-Reply-To: <LbtagEimreS2mF7RubKMs6Tv0gw7HnkqlhleCglof53bICr7FUqEgwta1rQ6ysgUHF6_BsA9Us2TPGO6m40POMVZ-vKyV4KN8D-S_Hrs-pc=@pm.me>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me> <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca> <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt> <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca> <pVeuxasxaau60kEIgTW1W6DmFLuzLUGYvmYtTN_Cv0htPbokC6lMObfmql3lWkAxtO5Lp-aD2l0Uzt_xL8cGYVxBmDey-5-HA7968eocg8c=@pm.me> <a7jukaag6juswudeeuskgzahzbixxn5oq4qjnxfny2oapinfnv@kmn7b33yxric> <jv_kU6i1uCSu--2-KIWkgsC0NsVK1yE396Nv_fCFA5v9uR-zrMGhrBmKNnG_ztHPiKPqlcjWif3R-XF1bINB387ezJEKtXDY453253BM6fc=@pm.me> <nVcYZQOh7dB65LsiaXejmQP-Cmp-eSxp7fvDiTwS2P5WJc03m4CwXtUP_2w-D2dflxo9rwKPI68FxnfswATouZxK8QhF256JJf3F7BkbmY0=@pm.me> <7o6ddv23aft3eerc7xz7r5rawe24d6vl3qp33ewnqllv5xkfrf@n3dosrwbvlhf> <LbtagEimreS2mF7RubKMs6Tv0gw7HnkqlhleCglof53bICr7FUqEgwta1rQ6ysgUHF6_BsA9Us2TPGO6m40POMVZ-vKyV4KN8D-S_Hrs-pc=@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b30bb89dbeef0ddcc77b2475bd87723c3906d17d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98898-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,marek.ca,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.890];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,marek.ca:email]
X-Rspamd-Queue-Id: 039BB2D7180
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, March 20th, 2026 at 3:48 AM, Alexander Koskovich <akoskovich@pm.=
me> wrote:

>=20
> On Friday, March 20th, 2026 at 3:36 AM, Dmitry Baryshkov <dmitry.baryshko=
v@oss.qualcomm.com> wrote:
>=20
> > On Fri, Mar 20, 2026 at 07:02:54AM +0000, Alexander Koskovich wrote:
> > > On Friday, March 20th, 2026 at 2:50 AM, Alexander Koskovich <akoskovi=
ch@pm.me> wrote:
> > >
> > > > On Friday, March 20th, 2026 at 2:38 AM, Dmitry Baryshkov <dmitry.ba=
ryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > > On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander Koskovich wro=
te:
> > > > > > On Friday, March 20th, 2026 at 12:25 AM, Jonathan Marek <jonath=
an@marek.ca> wrote:
> > > > > >
> > > > > > > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wr=
ote:
> > > > > > > ...
> > > > > > > >>
> > > > > > > >> That's not how it works. INTF (which feeds DSI) is after D=
SC compression.
> > > > > > > >>
> > > > > > > >> INTF timings are always in RGB888 (24-bit) units. Ignoring=
 widebus details,
> > > > > > > >> the INTF timing should match what is programmed on the DSI=
 side (hdisplay,
> > > > > > > >> which is calculated as bytes per line / 3).
> > > > > > > >>
> > > > > > > >> (fwiw, the current "timing->width =3D ..." calculation her=
e blames to me, but
> > > > > > > >> what I wrote originally was just "timing->width =3D timing=
->width / 3" with a
> > > > > > > >> comment about being incomplete.)
> > > > > > > >>
> > > > > > > > Okay. After reading the docs (sorry, it took a while).
> > > > > > > >
> > > > > > > > - When widebus is not enabled, the transfer is always 24 bi=
t of
> > > > > > > >    compressed data. Thus if it is not in play, pclk and tim=
ing->width
> > > > > > > >    should be scaled by source_pixel_depth / compression_rat=
io / 24. In
> > > > > > > >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
> > > > > > > >
> > > > > > > >    For RGB101010 / 8bpp DSC this should result in the PCLK =
being lowered
> > > > > > > >    by the factor of 3 (=3D 24 / (30 / 3.75))
> > > > > > > >
> > > > > > > > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transf=
er takes
> > > > > > > >    more than 24 bits. In this case the PCLK and timing->wid=
th should be
> > > > > > > >    scaled exactly by the DSC compression ratio, which is
> > > > > > > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component=
).
> > > > > > > >
> > > > > > > > So, this piece of code needs to be adjusted to check for th=
e widebus
> > > > > > > > being enabled or not.
> > > > > > > >
> > > > > > >
> > > > > > > The widebus adjustment on the MDP/INTF side is already in
> > > > > > > dpu_hw_intf_setup_timing_engine: the "data width" is divided =
by 2 for
> > > > > > > 48-bit widebus instead of 24-bit. there shouldn't be any othe=
r
> > > > > > > adjustment (downstream doesn't have any other adjustment).
> > > > > > >
> > > > > > > a relevant downstream comment: "In DATABUS-WIDEN mode, MDP al=
ways sends
> > > > > > > out 48-bit compressed data per pclk and on average, DSI consu=
mes an
> > > > > > > amount of compressed data equivalent to the uncompressed pixe=
l depth per
> > > > > > > pclk."
> > > > > > >
> > > > > > > Based on that comment, this patch is correct, and the
> > > > > > > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)' a=
djustment
> > > > > > > only applies to DSI.
> > > > > >
> > > > > > If I keep the INTF side at /24 and change the DSI side to:
> > > > > >
> > > > > > if (wide_bus)
> > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_=
get_bpp_int(dsc), dsc->bits_per_component * 3);
> > > > > > else
> > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_=
get_bpp_int(dsc), 24);
> > > > >
> > > > > Please check the actual fps (I'm usually using a vblank-synced GL=
, e.g.
> > > > > kmscube).
> > > > >
> > > > > At least this matches my expectations.
> > > >
> > > > Hmmm with kmscube I am getting 120FPS with 24 and 100FPS with 30. S=
o I guess that's a no go
> > >
> > > Although it was using dsc->bits_per_component * 3 regardless before f=
or
> > > dsi_adjust_pclk_for_compression so I guess that's what Jonathan was
> > > referring to earlier...
> >
> > Do you have any of the patches by Marijn or Pengyu?
> >
> > - https://lore.kernel.org/linux-arm-msm/20260311-dsi-dsc-regresses-agai=
n-v1-1-6a422141eeea@somainline.org/
> >
> > - https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitltla=
tltl@gmail.com/
>=20
> Nope, I can test with them though if you'd like

Tested the following 3 patches on top of this series:
drm/msm/dsi: fix hdisplay calculation when programming dsi registers
drm/msm/dsi: fix bits_per_pclk
drm/msm/dsi: fix hdisplay calculation for CMD mode panel

Getting constant FIFO errors with them applied:
[   64.851635] dsi_err_worker: status=3D4
[   64.851692] dsi_err_worker: status=3D4
[   64.851730] dsi_err_worker: status=3D4
[   64.851766] dsi_err_worker: status=3D4
[   64.851802] dsi_err_worker: status=3D4
[   64.851837] dsi_err_worker: status=3D4
[   64.851903] dsi_err_worker: status=3D4
[   64.851940] dsi_err_worker: status=3D4
[   64.851976] dsi_err_worker: status=3D4
[   64.852011] dsi_err_worker: status=3D4


>=20
> >
> > --
> > With best wishes
> > Dmitry
> >
>=20
> 

