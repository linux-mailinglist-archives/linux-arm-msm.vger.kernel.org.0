Return-Path: <linux-arm-msm+bounces-98804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHxRFng1vGl3uwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:42:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7362D02BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B304302D49A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 17:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFE72BFC7B;
	Thu, 19 Mar 2026 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="SCItzt50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BFF2FFF81
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941510; cv=none; b=u7V47iRFuydQPnPew2qvgedX7wh8OgYEqn5NJx5YVLKaAIizZc5/iPCZRg64BKWepzXKniR5JCeChfhKiuXS4w+NspS3kPguadxolmwLzy69nkQGsSu98NZu5pfBoK6Fp9YqtB2EwfsfbwO7Q99yZJCaai8HDX55odwMyEATpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941510; c=relaxed/simple;
	bh=BGrW2i21aU6SxYACQdwr7P1HONyoX0vwRbl5dsPFbvI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IzK9nwKcHwYJN5Iw0qUUF4lihjwGoM7H2EuOD06QxkSBUdxk0sfltfUVSzrHUO+1kxPbwaLP8QpGA9Lz4cMb2ROPfQVZBGxcxFL5RexYK5d/lAlx6h7VBe1GXw9xurwUtvhnPahy3Azchjel4CMd9l5BsaEH27Wk9h8P58pEhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=SCItzt50; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773941497; x=1774200697;
	bh=RvMMo0NAF7orTfavYi+xzo3XwN7ul4xPql6mf0zDMBA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SCItzt50M2hsKF/KJzBDcKLrd0PwQGDXRmDFMfBDKyI4i1Lfy5rbsLjFwOqwFy1Ex
	 mQHItr7Es0hTUT1ldkm2xCAqm4Wg0BLCqOFatWhMJOV14lI3sbuL9OlERV+PZXDo0G
	 yVeAwfKyCJ+w3H25/kFFiNuRv+VfjPIJq5rmMurL0KK1tf++1DgnXlBTf7mZdAtZ/V
	 LDtbuF/9Or7N8UVNRI0fWbw9rs5JMD35CsGC+RVxcr0lSaI7i1/u4sEIGKKwcgXNFd
	 ccAz4/geTCqgXjvX4/l+5HN8dAOq9fX9SvRXk6q6sGnAYPTlsG7ewW2OIz9WIdsDRf
	 ydJAdw4VMoOWQ==
Date: Thu, 19 Mar 2026 17:31:35 +0000
To: Jonathan Marek <jonathan@marek.ca>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <EEQIOfQNcsc4wya1P0uxlYBG4w9lAeW4OcTZpsxmpGCzf-tgl_3YO0H5zoZyU5XIwBKurxuki_gGca-Z9YfcdYOXN_wpwixoK8q_fITL1bw=@pm.me>
In-Reply-To: <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me> <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me> <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org> <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me> <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org> <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: d2b1ed9fad43303dd5f9f8c1a38a2936ff8bc4ec
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98804-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,marek.ca:email,linaro.org:email,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 5F7362D02BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, March 19th, 2026 at 1:23 PM, Jonathan Marek <jonathan@marek.ca=
> wrote:

> On 3/19/26 10:54 AM, Neil Armstrong wrote:
> > On 3/19/26 15:40, Alexander Koskovich wrote:
> >> On Thursday, March 19th, 2026 at 10:13 AM, Neil Armstrong
> >> <neil.armstrong@linaro.org> wrote:
> >>
> >>> Hi,
> >>>
> >>> On 3/19/26 12:58, Alexander Koskovich wrote:
> >>>> Using bits_per_component * 3 as the divisor for the compressed INTF
> >>>> timing width produces constant FIFO errors for the BOE BF068MWM-TD0
> >>>> panel due to bits_per_component being 10 which results in a divisor
> >>>> of 30 instead of 24.
> >>>>
> >>>> Regardless of the compression ratio and pixel depth, 24 bits of
> >>>> compressed data are transferred per pclk, so the divisor should
> >>>> always be 24.
> >>>
> >>> Not true with widebus, specify why 24 and because DSI widebus is not
> >>> implemented yet.
> >>>
>=20
> DSI widebus is implemented, and always used when available. The
> adjustment for DSI widebus just doesn't happen in this function.
>=20
> >>>>
> >>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 ++++----=
-
> >>>>    1 file changed, 4 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>> index 0ba777bda253..5419ef0be137 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>> @@ -122,19 +122,18 @@ static void drm_mode_to_intf_timing_params(
> >>>>        }
> >>>>
> >>>>        /*
> >>>> -     * for DSI, if compression is enabled, then divide the
> >>>> horizonal active
> >>>> -     * timing parameters by compression ratio. bits of 3
> >>>> components(R/G/B)
> >>>> -     * is compressed into bits of 1 pixel.
> >>>> +     * For DSI, if DSC is enabled, 24 bits of compressed data are
> >>>> +     * transferred per pclk regardless of the source pixel depth.
> >>>>         */
> >>>>        if (phys_enc->hw_intf->cap->type !=3D INTF_DP &&
> >>>> timing->compression_en) {
> >>>>            struct drm_dsc_config *dsc =3D
> >>>>                   dpu_encoder_get_dsc_config(phys_enc->parent);
> >>>> +
> >>> Drop this change
> >>>
> >>>>            /*
> >>>>             * TODO: replace drm_dsc_get_bpp_int with logic to handle
> >>>>             * fractional part if there is fraction
> >>>>             */
> >>>> -        timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc) =
/
> >>>> -                (dsc->bits_per_component * 3);
> >>>> +        timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc) =
/ 24;
> >>>
> >>> It would be helpful to somehow show that 24 is 8 * 3, 8 being the
> >>> byte width and 3 the compression ratio.
> >>
> >> Can you clarify what the 3 represents? My panel should have a 3.75:1
> >> compression
> >> ratio (30/8) so the final divisor of 24 would be wrong for my panel if
> >> its the
> >> compression ratio?
> >
> > So my guess is that while the exact ratio on the DSI lanes is 3.75:1,
> > the ratio
> > used to calculate the INTF timings is 3, then the DSC encoder probably
> > does the
> > magic to feed 10bpp into a 3.75:1 ratio over the DSI lanes.
> >
>=20
> That's not how it works. INTF (which feeds DSI) is after DSC compression.
>=20
> INTF timings are always in RGB888 (24-bit) units. Ignoring widebus
> details, the INTF timing should match what is programmed on the DSI side
> (hdisplay, which is calculated as bytes per line / 3).
>=20
> (fwiw, the current "timing->width =3D ..." calculation here blames to me,
> but what I wrote originally was just "timing->width =3D timing->width / 3=
"
> with a comment about being incomplete.)
>=20
> > In dsi_adjust_pclk_for_compression, the pclk is adjusted to take in
> > account bits_per_component,
> > so I presume the actual DSI pclk _is_  timing->width *
> > drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3),
> > which is your 3.75:1, but the INTF needs to generate timing->width *
> > drm_dsc_get_bpp_int(dsc) / (8 * 3) pixels
> > to the DSC encoder which will emit timing->width *
> > drm_dsc_get_bpp_int(dsc) / (dsc->bits_per_component * 3) pixels.
> >
>=20
> The hdisplay calculation in dsi_adjust_pclk_for_compression (which only
> affects the clock rate) seems to be wrong, and I think Alexander's panel
> must be running at a 20% lower clock because of it. dsi_timing_setup has
> the right hdisplay adjustment.

Checked against downstream and the clocks seem to match more or less:

downstream:
pclk: 110070156
byte: 103190771

upstream:
pclk: 110073457
byte: 103193865


>=20
> > In any case, 24 _is_ 3 * 8, 3 being the DSC compression ratio on the
> > INTF side.
> >
> > Dmitry, Konrad, could you help confirming this ?
> >
> > Neil
> >
> >>
> >>>
> >>>>            timing->xres =3D timing->width;
> >>>>        }
> >>>>    }
> >>>>
> >>>
> >>>
> >>>
> >>
> >> Thanks,
> >> Alex
> >
> 

