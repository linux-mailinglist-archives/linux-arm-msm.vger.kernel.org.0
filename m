Return-Path: <linux-arm-msm+bounces-98924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CilODU6vWkN7wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:14:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBD2D9F91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 13:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8D46300B44A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A2B3793CC;
	Fri, 20 Mar 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="I9G91HQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE8D2F363B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008880; cv=none; b=WIp8dvndyH0LBt0BZ19c2qb3TVY5dtaVrwuF6FM8LKw8V+qWeoV66bbEPih40ID0k4hkmto1bvAh/JNOhZOMMj4atFda1ZAhLHtVrQuqlQc4CG35VWKY/F1ZCDXpTXD2ZwwlaKXkW6uIKUtX3dMj7nC2q6uMTs22pKXZd2qymgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008880; c=relaxed/simple;
	bh=qiok4B1e2Q6H+Z4md9atr/uX8QpS8pdZ/+mo+OjhwgU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0fk6aws7pXnfwlI5KGlGt8Vi2IwWFCegv4gEgvncFZnZFE+5NjdXvuFEfRnWyCG83RdknFFSM9STDwrDKJP4PP2/jGOXrqVZR8nYq46ZJjmj/flaRftvxMiFTfq+5dw5RbYbOP3ODfUnWPbBkOBbvYDTHyXGYcKh3/nZuUJpE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=I9G91HQb; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774008869; x=1774268069;
	bh=McfKvgJscPws77vkJGSz0R3EuSi8TlMcmAKcZHfGOzU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I9G91HQbfa0sgVOUJgRqgaupqRABbNvqt2RYN/IKDM+iMdBpoyAXuB/LZzAEqz/wD
	 ygzXC4znBfVDl4BcCXoy6mkbsphQf6+b7MWSC8z2G5aFssSiWNEhxhkOTdsiLwCCee
	 tsAQeNFwubBTMFUuPR30Le4urx5Ice6BzefFO/gobQFlJv08aLNHkkT1pPonpC0vX5
	 D0rQQaVOln0Fcjm9r/LQJORpt6dbz1wYXicsDeLzUvK4Poh2BQKTGg6/iUsTIK0sTq
	 5uN3MPBsWbhefg+icsVcVdWy5s2slANtDmOvVlAmb6E1YItaSSEPuMEbryLdsF/x8m
	 SOi6C943Pr+Aw==
Date: Fri, 20 Mar 2026 12:14:21 +0000
To: Pengyu Luo <mitltlatltl@gmail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, jeffrey.l.hugo@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>, Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <X2fV9mpVHV6Qk8-ImS7vxqDQXFt4K85jPKJWnxVono324hHaRh7x13f2HYM4CKNK-UDqrmP8Jz79-oVklw8vLBfaxPbVuQq4FBfblu27R9s=@pm.me>
In-Reply-To: <CAH2e8h6oinKxN1ndcvHCSc+=bFLXVVDZVAVF0cQHoiaMvEwhPQ@mail.gmail.com>
References: <CAH2e8h6oinKxN1ndcvHCSc+=bFLXVVDZVAVF0cQHoiaMvEwhPQ@mail.gmail.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 538fe9858a7d92e7e53160b18525f09482ad2577
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98924-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,oss.qualcomm.com,lists.freedesktop.org,marek.ca,vger.kernel.org,kernel.org,linux.intel.com,somainline.org,linaro.org,poorly.run,ffwll.ch,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.872];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,marek.ca:email]
X-Rspamd-Queue-Id: E3FBD2D9F91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, March 20th, 2026 at 8:08 AM, Pengyu Luo <mitltlatltl@gmail.com> =
wrote:

> On Fri, Mar 20, 2026 at 4:17=E2=80=AFPM Alexander Koskovich <akoskovich@p=
m.me> wrote:
> > >
> > > On Friday, March 20th, 2026 at 3:36 AM, Dmitry Baryshkov <dmitry.bary=
shkov@oss.qualcomm.com> wrote:
> > >
> > > > On Fri, Mar 20, 2026 at 07:02:54AM +0000, Alexander Koskovich wrote=
:
> > > > > On Friday, March 20th, 2026 at 2:50 AM, Alexander Koskovich <akos=
kovich@pm.me> wrote:
> > > > >
> > > > > > On Friday, March 20th, 2026 at 2:38 AM, Dmitry Baryshkov <dmitr=
y.baryshkov@oss.qualcomm.com> wrote:
> > > > > >
> > > > > > > On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander Koskovich=
 wrote:
> > > > > > > > On Friday, March 20th, 2026 at 12:25 AM, Jonathan Marek <jo=
nathan@marek.ca> wrote:
> > > > > > > >
> > > > > > > > > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Mare=
k wrote:
> > > > > > > > > ...
> > > > > > > > > >>
> > > > > > > > > >> That's not how it works. INTF (which feeds DSI) is aft=
er DSC compression.
> > > > > > > > > >>
> > > > > > > > > >> INTF timings are always in RGB888 (24-bit) units. Igno=
ring widebus details,
> > > > > > > > > >> the INTF timing should match what is programmed on the=
 DSI side (hdisplay,
> > > > > > > > > >> which is calculated as bytes per line / 3).
> > > > > > > > > >>
> > > > > > > > > >> (fwiw, the current "timing->width =3D ..." calculation=
 here blames to me, but
> > > > > > > > > >> what I wrote originally was just "timing->width =3D ti=
ming->width / 3" with a
> > > > > > > > > >> comment about being incomplete.)
> > > > > > > > > >>
> > > > > > > > > > Okay. After reading the docs (sorry, it took a while).
> > > > > > > > > >
> > > > > > > > > > - When widebus is not enabled, the transfer is always 2=
4 bit of
> > > > > > > > > >    compressed data. Thus if it is not in play, pclk and=
 timing->width
> > > > > > > > > >    should be scaled by source_pixel_depth / compression=
_ratio / 24. In
> > > > > > > > > >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 2=
4'.
> > > > > > > > > >
> > > > > > > > > >    For RGB101010 / 8bpp DSC this should result in the P=
CLK being lowered
> > > > > > > > > >    by the factor of 3 (=3D 24 / (30 / 3.75))
> > > > > > > > > >
> > > > > > > > > > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the tr=
ansfer takes
> > > > > > > > > >    more than 24 bits. In this case the PCLK and timing-=
>width should be
> > > > > > > > > >    scaled exactly by the DSC compression ratio, which i=
s
> > > > > > > > > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_compo=
nent).
> > > > > > > > > >
> > > > > > > > > > So, this piece of code needs to be adjusted to check fo=
r the widebus
> > > > > > > > > > being enabled or not.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > The widebus adjustment on the MDP/INTF side is already in
> > > > > > > > > dpu_hw_intf_setup_timing_engine: the "data width" is divi=
ded by 2 for
> > > > > > > > > 48-bit widebus instead of 24-bit. there shouldn't be any =
other
> > > > > > > > > adjustment (downstream doesn't have any other adjustment)=
.
> > > > > > > > >
> > > > > > > > > a relevant downstream comment: "In DATABUS-WIDEN mode, MD=
P always sends
> > > > > > > > > out 48-bit compressed data per pclk and on average, DSI c=
onsumes an
> > > > > > > > > amount of compressed data equivalent to the uncompressed =
pixel depth per
> > > > > > > > > pclk."
> > > > > > > > >
> > > > > > > > > Based on that comment, this patch is correct, and the
> > > > > > > > > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component=
)' adjustment
> > > > > > > > > only applies to DSI.
> > > > > > > >
> > > > > > > > If I keep the INTF side at /24 and change the DSI side to:
> > > > > > > >
> > > > > > > > if (wide_bus)
> > > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_=
dsc_get_bpp_int(dsc), dsc->bits_per_component * 3);
> > > > > > > > else
> > > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_=
dsc_get_bpp_int(dsc), 24);
> > > > > > >
> > > > > > > Please check the actual fps (I'm usually using a vblank-synce=
d GL, e.g.
> > > > > > > kmscube).
> > > > > > >
> > > > > > > At least this matches my expectations.
> > > > > >
> > > > > > Hmmm with kmscube I am getting 120FPS with 24 and 100FPS with 3=
0. So I guess that's a no go
> > > > >
> > > > > Although it was using dsc->bits_per_component * 3 regardless befo=
re for
> > > > > dsi_adjust_pclk_for_compression so I guess that's what Jonathan w=
as
> > > > > referring to earlier...
> > > >
> > > > Do you have any of the patches by Marijn or Pengyu?
> > > >
> > > > - https://lore.kernel.org/linux-arm-msm/20260311-dsi-dsc-regresses-=
again-v1-1-6a422141eeea@somainline.org/
> > > >
> > > > - https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mit=
ltlatltl@gmail.com/
> > >
> > > Nope, I can test with them though if you'd like
> >
> > Tested the following 3 patches on top of this series:
> > drm/msm/dsi: fix hdisplay calculation when programming dsi registers
> > drm/msm/dsi: fix bits_per_pclk
> > drm/msm/dsi: fix hdisplay calculation for CMD mode panel
> >
> > Getting constant FIFO errors with them applied:
> > [   64.851635] dsi_err_worker: status=3D4
> > [   64.851692] dsi_err_worker: status=3D4
> > [   64.851730] dsi_err_worker: status=3D4
> > [   64.851766] dsi_err_worker: status=3D4
> > [   64.851802] dsi_err_worker: status=3D4
> > [   64.851837] dsi_err_worker: status=3D4
> > [   64.851903] dsi_err_worker: status=3D4
> > [   64.851940] dsi_err_worker: status=3D4
> > [   64.851976] dsi_err_worker: status=3D4
> > [   64.852011] dsi_err_worker: status=3D4
>=20
> Personally, I use
> timing->width =3D DIV_ROUND_UP(timing->width * drm_dsc_get_bpp_int(dsc),
>                          dsc->bits_per_component * 3);
>=20
> DIV_ROUND_UP is magic for me. If not, I got status=3D4 too.
>=20
> This works for 8-bit dst bpc with 10-bit src bpc.

Did a quick test with that (plus the 3 changes listed above), still getting=
 the
FIFO errors and no display.

Are you using RGB101010?

>=20
> Best wishes,
> Pengyu
>=20

Thanks,
Alex

