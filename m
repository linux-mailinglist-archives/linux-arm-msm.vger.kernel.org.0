Return-Path: <linux-arm-msm+bounces-98878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Bp4DW7FvGkY2wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 04:56:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE12D5A70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 04:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D07E230515E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB392773D8;
	Fri, 20 Mar 2026 03:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="UmkTdwkn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492D575809
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 03:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773978941; cv=none; b=pzuOTrNm6PAJZp8XRxC7qO3pz/H/PafGxuSsnm++fDH6NdbA+9i7zsX8LSpVS2KkaYFo7sj1z712r/Ma1HvNWixi/wweJ3H/hDeKjyluVCyia29dwVfV2Qt0fUr2lfDKZj6Y2BL3PlfqDlUsI+DWTNFKpUbu/Q9lMPwmUan47HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773978941; c=relaxed/simple;
	bh=xrlPZA+rVsBp0HmSAZ6xpYu95HI12xRzXllym65bSO8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGveh6PN0HkboH8s9omG/iawU3C1pdA52qKM5mCOGZli+2zXJqcufwsxPv3xfLVq71YyFk1/zrSnne76QxDtCjf7Lw2nsDKnl26+eTKuR1WOnWDl8fws+twUisKQC+0Oqt9qzlNDVYVm+j+16yjJSUJM74Z6c64gR0fPok1xgMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=UmkTdwkn; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773978929; x=1774238129;
	bh=6hSHoAw+FRg4yq7oAQNcLdcehITdZuUHNxQc1UYr+tQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UmkTdwknZC4PQKwvcBvl6lE8BO7HtecVoEMgnk0Xa+PTjHeN7ir0CEbRHH8H+vevr
	 lzJKtK7aLpp6GOkGf0FXEid0USpYtzZraxtfLKY9pVvqzTKnGkETKaJAOpvmxaDrQV
	 i/Mf0YiEor6qIklVuiaiSIvyNf0hDVWitncFYAKQ0bDKbaQ8J6Gunsb9zl0essO7u0
	 rM2fSWEAT1C1aWsDwLM+O6H9wBvweJgr4DYssDPUotXHcigWsBGuoBmE3Mhx3tCOqO
	 6YPQnzH2zvJp8QuthcdgqoK/0SPEekqPKd+QJ4vFyR7N2UtZG5UzKSg2Mj8R9+vJUB
	 gf3kduvyQ2XKw==
Date: Fri, 20 Mar 2026 03:55:24 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Jonathan Marek <jonathan@marek.ca>, Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <PbBNYyLi9hlGibM2kCPIHwRs8B3rnYEFgShF5AYjmRTTHPMjnQAcE-KQXZJ1nkSf_r8bl2XQYlTa-6LuCw3_JvqJz1oqaYQ7I_4MD6Dqeoo=@pm.me>
In-Reply-To: <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me> <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me> <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org> <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me> <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org> <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca> <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b39faaa2045b0f5a2a636019996afd901f86c9aa
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98878-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[marek.ca,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.892];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: D2FE12D5A70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, March 19th, 2026 at 9:45 PM, Dmitry Baryshkov <dmitry.baryshko=
v@oss.qualcomm.com> wrote:

> On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
> > On 3/19/26 10:54 AM, Neil Armstrong wrote:
> > > On 3/19/26 15:40, Alexander Koskovich wrote:
> > > > On Thursday, March 19th, 2026 at 10:13 AM, Neil Armstrong
> > > > <neil.armstrong@linaro.org> wrote:
> > > >
> > > > > Hi,
> > > > >
> > > > > On 3/19/26 12:58, Alexander Koskovich wrote:
> > > > > > Using bits_per_component * 3 as the divisor for the compressed =
INTF
> > > > > > timing width produces constant FIFO errors for the BOE BF068MWM=
-TD0
> > > > > > panel due to bits_per_component being 10 which results in a div=
isor
> > > > > > of 30 instead of 24.
> > > > > >
> > > > > > Regardless of the compression ratio and pixel depth, 24 bits of
> > > > > > compressed data are transferred per pclk, so the divisor should
> > > > > > always be 24.
> > > > >
> > > > > Not true with widebus, specify why 24 and because DSI widebus is
> > > > > not implemented yet.
> > > > >
> >
> > DSI widebus is implemented, and always used when available. The adjustm=
ent
> > for DSI widebus just doesn't happen in this function.
> >
> > > > > >
> > > > > > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > > > > > ---
> > > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++=
+-----
> > > > > >    1 file changed, 4 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git
> > > > > > a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > > > index 0ba777bda253..5419ef0be137 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > > > > @@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_param=
s(
> > > > > >        }
> > > > > >
> > > > > >        /*
> > > > > > -     * for DSI, if compression is enabled, then divide the
> > > > > > horizonal active
> > > > > > -     * timing parameters by compression ratio. bits of 3
> > > > > > components(R/G/B)
> > > > > > -     * is compressed into bits of 1 pixel.
> > > > > > +     * For DSI, if DSC is enabled, 24 bits of compressed data =
are
> > > > > > +     * transferred per pclk regardless of the source pixel dep=
th.
> > > > > >         */
> > > > > >        if (phys_enc->hw_intf->cap->type !=3D INTF_DP &&
> > > > > > timing->compression_en) {
> > > > > >            struct drm_dsc_config *dsc =3D
> > > > > >                   dpu_encoder_get_dsc_config(phys_enc->parent);
> > > > > > +
> > > > > Drop this change
> > > > >
> > > > > >            /*
> > > > > >             * TODO: replace drm_dsc_get_bpp_int with logic to h=
andle
> > > > > >             * fractional part if there is fraction
> > > > > >             */
> > > > > > -        timing->width =3D timing->width * drm_dsc_get_bpp_int(=
dsc) /
> > > > > > -                (dsc->bits_per_component * 3);
> > > > > > +        timing->width =3D timing->width * drm_dsc_get_bpp_int(=
dsc) / 24;
> > > > >
> > > > > It would be helpful to somehow show that 24 is 8 * 3, 8 being
> > > > > the byte width and 3 the compression ratio.
> > > >
> > > > Can you clarify what the 3 represents? My panel should have a 3.75:=
1
> > > > compression
> > > > ratio (30/8) so the final divisor of 24 would be wrong for my panel
> > > > if its the
> > > > compression ratio?
> > >
> > > So my guess is that while the exact ratio on the DSI lanes is 3.75:1,
> > > the ratio
> > > used to calculate the INTF timings is 3, then the DSC encoder probabl=
y
> > > does the
> > > magic to feed 10bpp into a 3.75:1 ratio over the DSI lanes.
> > >
> >
> > That's not how it works. INTF (which feeds DSI) is after DSC compressio=
n.
> >
> > INTF timings are always in RGB888 (24-bit) units. Ignoring widebus deta=
ils,
> > the INTF timing should match what is programmed on the DSI side (hdispl=
ay,
> > which is calculated as bytes per line / 3).
> >
> > (fwiw, the current "timing->width =3D ..." calculation here blames to m=
e, but
> > what I wrote originally was just "timing->width =3D timing->width / 3" =
with a
> > comment about being incomplete.)
> >
> Okay. After reading the docs (sorry, it took a while).
>=20
> - When widebus is not enabled, the transfer is always 24 bit of
>   compressed data. Thus if it is not in play, pclk and timing->width
>   should be scaled by source_pixel_depth / compression_ratio / 24. In
>   case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
>=20
>   For RGB101010 / 8bpp DSC this should result in the PCLK being lowered
>   by the factor of 3 (=3D 24 / (30 / 3.75))
>=20
> - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer takes
>   more than 24 bits. In this case the PCLK and timing->width should be
>   scaled exactly by the DSC compression ratio, which is
>   'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).
>=20
> So, this piece of code needs to be adjusted to check for the widebus
> being enabled or not.
>=20

Modified drm_mode_to_intf_timing_params & dsi_adjust_pclk_for_compression t=
o account for widebus, but the hdisplay I get is different from stock with =
widebus factored in. Getting 288 instead of 360 now which produces constant=
 FIFO errors.

This is with widebus enabled, using 3 * dsc->bits_per_component. Should it =
be 24 regardless of widebus?

> > > In dsi_adjust_pclk_for_compression, the pclk is adjusted to take in
> > > account bits_per_component,
> > > so I presume the actual DSI pclk _is_  timing->width *
> > > drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3),
> > > which is your 3.75:1, but the INTF needs to generate timing->width *
> > > drm_dsc_get_bpp_int(dsc) / (8 * 3) pixels
> > > to the DSC encoder which will emit timing->width *
> > > drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3) pixels.
> > >
> >
> > The hdisplay calculation in dsi_adjust_pclk_for_compression (which only
> > affects the clock rate) seems to be wrong, and I think Alexander's pane=
l
> > must be running at a 20% lower clock because of it. dsi_timing_setup ha=
s the
> > right hdisplay adjustment.
>=20
> That function also needs to be adjusted accordingly. I think only the
> dsi_timing_setup() is correct at this point. Note, widebus / not-widebus
> cases should be handled separately.
>=20
> > > In any case, 24 _is_ 3 * 8, 3 being the DSC compression ratio on the
> > > INTF side.
>=20
> In this case DSC compression ratio is 3.75, so it's not true.
>=20
> --
> With best wishes
> Dmitry
>=20

Thanks,
Alex

