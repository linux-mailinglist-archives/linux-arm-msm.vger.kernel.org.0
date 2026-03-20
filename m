Return-Path: <linux-arm-msm+bounces-98880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFkHFBnRvGkU3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 05:46:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB942D5CE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 05:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CC43302000D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 04:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB261F5842;
	Fri, 20 Mar 2026 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gqHUcLqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA443F9E8;
	Fri, 20 Mar 2026 04:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773981974; cv=none; b=OqI2pgyWHpjSEXAuvS+P4r2D7fd1zvjrsb7jNNKEagKTXedf3d+WiHZpGzLzr0dx2UokJ5JphLjrwTyWTBvf+Be3XwY8waYwAY3hfMXnw40v+Jcb+kwPCeKwGJctus64sODvUyAUv4QAWLyUhJ9PzUYBwF+P+almIgrouO/TMg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773981974; c=relaxed/simple;
	bh=Ur4Xmdcx9U1bmQmz7COVjsy9RXZ7cFmKs/2LUm0ZkQc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2Qpu/VXQQnids/qqWnvP7xBM/YaSxpxCgsSplU0yxf6kKSlp6dGuyNLUz6Ye9rhTpk8/X5vZGdTiuUegUOc6iwdi3YzvFo30jrphGCQ1C0+bPYk8ydhwsaJP0+08h887FK2S4pgZ6OwNq7TS0oYFlbVP71U9Zf7O/MooNSsBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gqHUcLqp; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773981968; x=1774241168;
	bh=v1I8cxLVFRsbyTjmNsAiiWf1PwQf0NpaR3sllOW+bd0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gqHUcLqpShDkn+SxFZ8sL0va0Eoo0BwubXCxIZJ9tjUJftEewX3K6hyEgjayoA8fz
	 4FxdjB/g09HIZe8rO5pBtpnrx+W939hTYUQhhth9MVWKTaN8hIdAxL0SOMsgktM1RV
	 7CzJFrJJZsxh3GKEg08koPgsNpzA+Z42p5PNRaiv4hIqlOlSkW6WoNVBG3m1IsF6ie
	 Pm378SVrFoxGgXPUJZtUujbF0QJ3sQ+xbrlyMpt7ywpU2+vKYup6zqc2SVW14iJmEs
	 rFGtsd/0p3L5QVpGpplNUM7ggM6i6QY4FqEJKzIUvdvmZU0Rxh2s7lk/1/tbJQyoLY
	 Lv0Amqle8f8dg==
Date: Fri, 20 Mar 2026 04:46:02 +0000
To: Jonathan Marek <jonathan@marek.ca>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <pVeuxasxaau60kEIgTW1W6DmFLuzLUGYvmYtTN_Cv0htPbokC6lMObfmql3lWkAxtO5Lp-aD2l0Uzt_xL8cGYVxBmDey-5-HA7968eocg8c=@pm.me>
In-Reply-To: <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me> <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me> <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org> <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me> <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org> <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca> <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt> <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 68cc4c8d3d9917e9277b073cbb9534c74d8b2759
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98880-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.918];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marek.ca:email,pm.me:dkim,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABB942D5CE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, March 20th, 2026 at 12:25 AM, Jonathan Marek <jonathan@marek.ca>=
 wrote:

> On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
> ...
> >>
> >> That's not how it works. INTF (which feeds DSI) is after DSC compressi=
on.
> >>
> >> INTF timings are always in RGB888 (24-bit) units. Ignoring widebus det=
ails,
> >> the INTF timing should match what is programmed on the DSI side (hdisp=
lay,
> >> which is calculated as bytes per line / 3).
> >>
> >> (fwiw, the current "timing->width =3D ..." calculation here blames to =
me, but
> >> what I wrote originally was just "timing->width =3D timing->width / 3"=
 with a
> >> comment about being incomplete.)
> >>
> > Okay. After reading the docs (sorry, it took a while).
> >
> > - When widebus is not enabled, the transfer is always 24 bit of
> >    compressed data. Thus if it is not in play, pclk and timing->width
> >    should be scaled by source_pixel_depth / compression_ratio / 24. In
> >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
> >
> >    For RGB101010 / 8bpp DSC this should result in the PCLK being lowere=
d
> >    by the factor of 3 (=3D 24 / (30 / 3.75))
> >
> > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer takes
> >    more than 24 bits. In this case the PCLK and timing->width should be
> >    scaled exactly by the DSC compression ratio, which is
> >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).
> >
> > So, this piece of code needs to be adjusted to check for the widebus
> > being enabled or not.
> >
>=20
> The widebus adjustment on the MDP/INTF side is already in
> dpu_hw_intf_setup_timing_engine: the "data width" is divided by 2 for
> 48-bit widebus instead of 24-bit. there shouldn't be any other
> adjustment (downstream doesn't have any other adjustment).
>=20
> a relevant downstream comment: "In DATABUS-WIDEN mode, MDP always sends
> out 48-bit compressed data per pclk and on average, DSI consumes an
> amount of compressed data equivalent to the uncompressed pixel depth per
> pclk."
>=20
> Based on that comment, this patch is correct, and the
> ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)' adjustment
> only applies to DSI.=20

If I keep the INTF side at /24 and change the DSI side to:

if (wide_bus)
        new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(=
dsc), dsc->bits_per_component * 3);
else
        new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(=
dsc), 24);

This also works on my panel.

Should I send this in a v4 for this series or just leave it for a seperate
change as panel seems to work with /24 here anyways?

> (note: newer downstream looks like it would divide
> by 3.75 here, which doesn't make sense. older downstream would divide by
> 3 here. I guess downstream is broken now and video mode + 10-bit dsc
> doesn't get tested?)
>=20
> on DSI side, "uncompressed pixel depth" shouldn't matter either: DSI
> only sees the compressed data. But based on that comment, when widebus
> is enabled, by setting DSI_VID_CFG0_DST_FORMAT(?) to 30bpp, then the DSI
> pclk is in 30-bit units instead of 24-bits. And with this series DSI
> side ends up with the right result if 30bpp format and widebus is enabled=
.
>=20
>=20

Thanks,
Alex

