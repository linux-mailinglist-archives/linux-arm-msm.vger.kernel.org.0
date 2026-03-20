Return-Path: <linux-arm-msm+bounces-98887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMUUJCfxvGlA4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:03:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E92D667E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B19E73066BDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4263290BD;
	Fri, 20 Mar 2026 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TF5qGqOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E612D23BC;
	Fri, 20 Mar 2026 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990181; cv=none; b=BA3C0yRDbidUAUi8g0T1+0sVWv8/OL3Q6f+olxRBODnJYRriMGI8XLpHZka2GxBsGvz8/I6RlDMjeRADdkcPFQGc2oAwffiDwf69DwTWoEiRaax0WKTP62b4WRiRy3KNizyHkgEwU7CkC53auT7Kd/Y7HV9gwxLpqryvMJtMX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990181; c=relaxed/simple;
	bh=a2oFo6Is0GASQxLUipxtC1zN1tlN2faiHNQGbzbQKbM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFlVd4HX0jcfZKaQau2ICm0/2rZUSVQrgDk4Xn3a/vZwHe55T4k+xbjroNjOg6ZWG4E532gkBZIvNSRMbIUPZxPhh+UtLErG1UnyD4ShrYnxeoEziDIeKPm3oxgx0mXfCOL91ObNhCPhxCDLDPmsUEOt1Pq6AbLn+WCvVntpqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TF5qGqOU; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773990177; x=1774249377;
	bh=jMvCsZ59x3tWS2RUz/pZcaEggkrELqRs5zNhCzUuqWo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TF5qGqOUumLopeUQUuBVOz5WrwH8IrGTB42SAlFDKJtJEZjWRGutiwpsQGDgx+3sk
	 1/MirGKhh4+mgKRzk6bOcHn6y3lXdraDdSDUbPyxRN30M1JPzjU7lNC5N8tJD3oT0B
	 VoVSm4b3MMlcfUO/nZuS8n34/4+tLtRhmoNVC/zs1gTG/RDD90JldqTHq1L3MvcmYx
	 gmm9YL2lpDJzOjCm8h2vcmCnCcjHnziD28sF/CaP8WxVAeE5KdKoIgEnwyh+xAxnBv
	 mt1ayfIwZaIhoGPhxu6ZmuPn2od55KMtIJo+9qQT6Dd9JXrqmmE9SWdfs28SZUMuBF
	 FIItCdrsWoTqA==
Date: Fri, 20 Mar 2026 07:02:54 +0000
To: Alexander Koskovich <akoskovich@pm.me>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jonathan Marek <jonathan@marek.ca>, Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <nVcYZQOh7dB65LsiaXejmQP-Cmp-eSxp7fvDiTwS2P5WJc03m4CwXtUP_2w-D2dflxo9rwKPI68FxnfswATouZxK8QhF256JJf3F7BkbmY0=@pm.me>
In-Reply-To: <jv_kU6i1uCSu--2-KIWkgsC0NsVK1yE396Nv_fCFA5v9uR-zrMGhrBmKNnG_ztHPiKPqlcjWif3R-XF1bINB387ezJEKtXDY453253BM6fc=@pm.me>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me> <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me> <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org> <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca> <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt> <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca> <pVeuxasxaau60kEIgTW1W6DmFLuzLUGYvmYtTN_Cv0htPbokC6lMObfmql3lWkAxtO5Lp-aD2l0Uzt_xL8cGYVxBmDey-5-HA7968eocg8c=@pm.me> <a7jukaag6juswudeeuskgzahzbixxn5oq4qjnxfny2oapinfnv@kmn7b33yxric> <jv_kU6i1uCSu--2-KIWkgsC0NsVK1yE396Nv_fCFA5v9uR-zrMGhrBmKNnG_ztHPiKPqlcjWif3R-XF1bINB387ezJEKtXDY453253BM6fc=@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 5e012a168b37548f92366937e341cbd52bc7a89f
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98887-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,marek.ca,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.823];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid,marek.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F00E92D667E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, March 20th, 2026 at 2:50 AM, Alexander Koskovich <akoskovich@pm.=
me> wrote:

> On Friday, March 20th, 2026 at 2:38 AM, Dmitry Baryshkov <dmitry.baryshko=
v@oss.qualcomm.com> wrote:
>=20
> > On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander Koskovich wrote:
> > > On Friday, March 20th, 2026 at 12:25 AM, Jonathan Marek <jonathan@mar=
ek.ca> wrote:
> > >
> > > > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
> > > > ...
> > > > >>
> > > > >> That's not how it works. INTF (which feeds DSI) is after DSC com=
pression.
> > > > >>
> > > > >> INTF timings are always in RGB888 (24-bit) units. Ignoring wideb=
us details,
> > > > >> the INTF timing should match what is programmed on the DSI side =
(hdisplay,
> > > > >> which is calculated as bytes per line / 3).
> > > > >>
> > > > >> (fwiw, the current "timing->width =3D ..." calculation here blam=
es to me, but
> > > > >> what I wrote originally was just "timing->width =3D timing->widt=
h / 3" with a
> > > > >> comment about being incomplete.)
> > > > >>
> > > > > Okay. After reading the docs (sorry, it took a while).
> > > > >
> > > > > - When widebus is not enabled, the transfer is always 24 bit of
> > > > >    compressed data. Thus if it is not in play, pclk and timing->w=
idth
> > > > >    should be scaled by source_pixel_depth / compression_ratio / 2=
4. In
> > > > >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
> > > > >
> > > > >    For RGB101010 / 8bpp DSC this should result in the PCLK being =
lowered
> > > > >    by the factor of 3 (=3D 24 / (30 / 3.75))
> > > > >
> > > > > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer tak=
es
> > > > >    more than 24 bits. In this case the PCLK and timing->width sho=
uld be
> > > > >    scaled exactly by the DSC compression ratio, which is
> > > > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).
> > > > >
> > > > > So, this piece of code needs to be adjusted to check for the wide=
bus
> > > > > being enabled or not.
> > > > >
> > > >
> > > > The widebus adjustment on the MDP/INTF side is already in
> > > > dpu_hw_intf_setup_timing_engine: the "data width" is divided by 2 f=
or
> > > > 48-bit widebus instead of 24-bit. there shouldn't be any other
> > > > adjustment (downstream doesn't have any other adjustment).
> > > >
> > > > a relevant downstream comment: "In DATABUS-WIDEN mode, MDP always s=
ends
> > > > out 48-bit compressed data per pclk and on average, DSI consumes an
> > > > amount of compressed data equivalent to the uncompressed pixel dept=
h per
> > > > pclk."
> > > >
> > > > Based on that comment, this patch is correct, and the
> > > > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)' adjustm=
ent
> > > > only applies to DSI.
> > >
> > > If I keep the INTF side at /24 and change the DSI side to:
> > >
> > > if (wide_bus)
> > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bp=
p_int(dsc), dsc->bits_per_component * 3);
> > > else
> > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bp=
p_int(dsc), 24);
> >
> > Please check the actual fps (I'm usually using a vblank-synced GL, e.g.
> > kmscube).
> >
> > At least this matches my expectations.
>=20
> Hmmm with kmscube I am getting 120FPS with 24 and 100FPS with 30. So I gu=
ess that's a no go

Although it was using dsc->bits_per_component * 3 regardless before for
dsi_adjust_pclk_for_compression so I guess that's what Jonathan was
referring to earlier...

>=20
> >
> > >
> > > This also works on my panel.
> > >
> > > Should I send this in a v4 for this series or just leave it for a sep=
erate
> > > change as panel seems to work with /24 here anyways?
> > >
> > > > (note: newer downstream looks like it would divide
> > > > by 3.75 here, which doesn't make sense. older downstream would divi=
de by
> > > > 3 here. I guess downstream is broken now and video mode + 10-bit ds=
c
> > > > doesn't get tested?)
> > > >
> > > > on DSI side, "uncompressed pixel depth" shouldn't matter either: DS=
I
> > > > only sees the compressed data. But based on that comment, when wide=
bus
> > > > is enabled, by setting DSI_VID_CFG0_DST_FORMAT(?) to 30bpp, then th=
e DSI
> > > > pclk is in 30-bit units instead of 24-bits. And with this series DS=
I
> > > > side ends up with the right result if 30bpp format and widebus is e=
nabled.
> > > >
> > > >
> > >
> > > Thanks,
> > > Alex
> >
> > --
> > With best wishes
> > Dmitry
> >
>=20
> 

