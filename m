Return-Path: <linux-arm-msm+bounces-9291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DB845058
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 05:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2CFF2811C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 04:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F02A2C1BC;
	Thu,  1 Feb 2024 04:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2Oj5llR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D08A1E488
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 04:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706762228; cv=none; b=X5SLPdAjUT4PDQtgFPsXzOcu5+CoObh8O2xlLZFW0DueDqc9CysLUO9DIWTGcvghqWgyNl5CD8+xFOl1AMZekpJrGTPJQyjowsiQ5wtvg0Pie1TTEVVrtDkKzNXGeSnvICeuUdDthaRach6nT6EVo3kQoCfPxQfRVbG7//FN24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706762228; c=relaxed/simple;
	bh=2ChIeX8nRozfaa86oevNJZ1z2UfoS96KQR1asADS5/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2F4BypKl5cZt9sI+Aeq4WerPpUTWsDz9P1Rb3IFNnmfqniYvIIuanaVR/czg+0y1hKb+ODNaPJzu1M4/Q+WLFFQWhgtmSzLrdANOKDK3q7NR90o7YHxRUBIrRCjBBa5O1IxZStnT6EkCOwBQfLQv5rRG4rLkrO9d0w4FFO2e64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2Oj5llR; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-604055e48a3so5530077b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 20:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706762225; x=1707367025; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xnyRgFXmIa37dv1zDYpPmO7tWt6Jjv0i3f83USXhMxc=;
        b=W2Oj5llRU3GWvcelStcLsInpa9SaKnxAys0Pd0hCUCxL/1av/6j7mh9f+wwxh5TK1G
         SsaI8mwBLon1X/Q8LEYG3IkEJ7F2j9ThlprZCpeYY82gZ+ZOmLY94TE/e51Wp65r74Lv
         dYvUrJZjg/kkzxuEMnWnZGRPETjPzx7eas9VR1JD636wGDsBCAoBNAI3YEl8NWjG2b9S
         0wzCoqkRo604HAvMefrKDANZ3XVx3FnnhvRpivBkGFO6BoVZVi3lOsfDBSxeWQfD/gIa
         3gNwPn/kq+inQBjlnoOTYfPIX1VoCV8c4DEiBK+QUHen8QQ6kYc4bnSWZA9/7EbPZh3l
         aXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706762225; x=1707367025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnyRgFXmIa37dv1zDYpPmO7tWt6Jjv0i3f83USXhMxc=;
        b=YpguEryIEd0+BTFWmXOwYFBqe9gNjeET5qOzwhyUqeXsosFDe8K9+26kWfbZIsUjV1
         of2MK87Dhq8lPTbw1Mvd1WexClafxv9gNfx94uzH3ztRHWBG8C1yr51r5f4Jz0+P53J9
         Y3Cl+S4sO92ZpJPbMBKh7tJWxXevYKmBAGgGR/bfrLF7zb3F6j29jS8Yw5ETxM4nblLk
         Qfrc82HjrFzpB1ExvHHgSdk/EW3VN53Ie1UB2uvElW+EIjGMLvqKVGtT8iyGZUKSUivO
         iAUL6ygywkpRJ1bAjjs8gsNpHC3deNNVudmgi+w/E0hYInPSbqziAKe2WsvBtEb1foIW
         kYoQ==
X-Gm-Message-State: AOJu0YydyizA2oO9C/MHxKc3GGNYpvrm+/p3gzCTaRO1FqzX9VH3SF7V
	v1HVNrhjbPG7XB2C22PTsFvHlMeSeuUXwSU0xzlnl2voHyH+yi5Jm5SWCpk6rmmfp9dBN8nKbC0
	0YKRkZ3jJu7K0b9YW0D/umYmzqWmXH2yuWAEtGg==
X-Google-Smtp-Source: AGHT+IG5T0loKoRkm89KkSUtgnQImfOgVCH6Tyo5zytYxni6CSEWcNj4om1YaV/hsbfvHDt7Cop1uvl5zWsuWyMYSEQ=
X-Received: by 2002:a05:690c:82d:b0:5ff:cbab:2625 with SMTP id
 by13-20020a05690c082d00b005ffcbab2625mr3519562ywb.36.1706762224912; Wed, 31
 Jan 2024 20:37:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-12-quic_parellan@quicinc.com> <d94434ec-00fd-489f-98f2-8c811522ff82@linaro.org>
 <11c6fdbe-f85a-088d-92df-abd8405c966b@quicinc.com> <CAA8EJprPziRHhxVK9mAdQZNEeon9q95ZMKSBhs-s95O-7W10NA@mail.gmail.com>
 <6fd0cc09-a1c4-123e-966d-111d44263286@quicinc.com>
In-Reply-To: <6fd0cc09-a1c4-123e-966d-111d44263286@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Feb 2024 06:36:52 +0200
Message-ID: <CAA8EJppT_i4=O8hx96FF+9-PP5w__bP6iqqzxDtFQmHXPPROfw@mail.gmail.com>
Subject: Re: [PATCH 11/17] drm/msm/dp: add VSC SDP support for YUV420 over DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 03:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/27/2024 9:39 PM, Dmitry Baryshkov wrote:
> > On Sun, 28 Jan 2024 at 07:34, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >>
> >> On 1/25/2024 1:48 PM, Dmitry Baryshkov wrote:
> >>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>> Add support to pack and send the VSC SDP packet for DP. This therefore
> >>>> allows the transmision of format information to the sinks which is
> >>>> needed for YUV420 support over DP.
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 147 ++++++++++++++++++++++++++++
> >>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
> >>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
> >>>>    drivers/gpu/drm/msm/dp/dp_panel.c   |  47 +++++++++
> >>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
> >>>>    5 files changed, 205 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> index c025786170ba5..7e4c68be23e56 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> @@ -29,6 +29,9 @@
> >>>>      #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
> >>>>    +#define DP_GENERIC0_6_YUV_8_BPC        BIT(0)
> >>>> +#define DP_GENERIC0_6_YUV_10_BPC    BIT(1)
> >>>> +
> >>>>    #define DP_INTERRUPT_STATUS1 \
> >>>>        (DP_INTR_AUX_XFER_DONE| \
> >>>>        DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
> >>>> @@ -907,6 +910,150 @@ int dp_catalog_panel_timing_cfg(struct
> >>>> dp_catalog *dp_catalog)
> >>>>        return 0;
> >>>>    }
> >>>>    +static void dp_catalog_panel_setup_vsc_sdp(struct dp_catalog
> >>>> *dp_catalog)
> >>>> +{
> >>>> +    struct dp_catalog_private *catalog;
> >>>> +    u32 header, parity, data;
> >>>> +    u8 bpc, off = 0;
> >>>> +    u8 buf[SZ_128];
> >>>> +
> >>>> +    if (!dp_catalog) {
> >>>> +        pr_err("invalid input\n");
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>> +    catalog = container_of(dp_catalog, struct dp_catalog_private,
> >>>> dp_catalog);
> >>>> +
> >>>> +    /* HEADER BYTE 1 */
> >>>> +    header = dp_catalog->sdp.sdp_header.HB1;
> >>>> +    parity = dp_catalog_calculate_parity(header);
> >>>> +    data   = ((header << HEADER_BYTE_1_BIT) | (parity <<
> >>>> PARITY_BYTE_1_BIT));
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_0, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >>>> +
> >>>> +    /* HEADER BYTE 2 */
> >>>> +    header = dp_catalog->sdp.sdp_header.HB2;
> >>>> +    parity = dp_catalog_calculate_parity(header);
> >>>> +    data   = ((header << HEADER_BYTE_2_BIT) | (parity <<
> >>>> PARITY_BYTE_2_BIT));
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
> >>>> +
> >>>> +    /* HEADER BYTE 3 */
> >>>> +    header = dp_catalog->sdp.sdp_header.HB3;
> >>>> +    parity = dp_catalog_calculate_parity(header);
> >>>> +    data   = ((header << HEADER_BYTE_3_BIT) | (parity <<
> >>>> PARITY_BYTE_3_BIT));
> >>>> +    data |= dp_read_link(catalog, MMSS_DP_GENERIC0_1);
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >>>
> >>> This seems to be common with the dp_audio code. Please extract this
> >>> header writing too.
> >> These are two different sdp's. audio and vsc, are different with
> >> different registers being written to and different amount of registers
> >> being set. Can you please clarify since in audio we only need 3
> >> registers to write to, and in vsc we need 10.
> >
> > Bitmagic with the header is the same. Then the rest of the data is
> > written one dword per register, if I'm not mistaken.
> >
>
> We can generalize the MMSS_DP_GENERIC0 register writing by breaking it
> up to two things:
>
> 1) Add a function vsc_sdp_pack() similar to hdmi_avi_infoframe_pack_only()

Note, there is already a hdmi_audio_infoframe_pack_for_dp() function.
I think this patchset can add hdmi_colorimetry_infoframe_pack_for_dp()
[you can choose any other similar name that suits from your POV].

Also please extract the function that inits the dp_sdp_header. It can
be reused as is for both existing hdmi_audio_infoframe_pack_for_dp(),
your new function and the dp_audio code.

>
> 2) dp_catalog_write_generic_pkt() which will just write the packed
> buffer byte-by-byte to these MMSS_DP_GENERIC0_xxx register
>
> But audio seems a bit different. We use DP_AUDIO_STREAM_0/1.
> More importantly, it uses this sdp_map and writes each header one by one
> with dp_catalog_audio_set_header().
>
> Not sure if that entirely fits with this pack and then write model.
>
> It can be simplified. But I dont think this effort is needed for this
> series.
>
> So I would prefer to generalize audio SDP programming separately.

I'd definitely ask to add a utility function that merges 4 header
bytes with the parity data. We already have 5 instances of that code
in dp_audio.c, which is already too much by the number of 4. Adding
the 6th copy is NAKed.

BTW, I see both in this path and in dp_audio that the driver reads a
register, ORs it with the value for the next header byte and writes it
back to the hardware. Shouldn't the driver clear the corresponding
data bits first? I see the clears in the techpack, but not in the
upstream code. If my assumption is correct, we should end up with the
utility function that packs dp_sdp_header into u32[2], which can then
be used by both YUV and dp_audio code to just write two corresponding
registers.

BTW2: where is the rest of the audio infoframe? I see that the old
fbdev driver was at least clearing the first 4 bytes of the frame.

>
> >>>
> >>>> +
> >>>> +    data = 0;
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_2, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >>>
> >>> Generally this is not how these functions are expected to be written.
> >>> Please take a look at drivers/video/hdmi.c. It should be split into:
> >>> - generic function that packs the C structure into a flat byte buffer,
> >>> - driver-specific function that formats and writes the buffer to the
> >>> hardware.
> >>>
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_3, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >>>> +
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_4, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >>>> +
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_5, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >>>> +
> >>>> +    switch (dp_catalog->vsc_sdp_data.bpc) {
> >>>> +    case 10:
> >>>> +        bpc = DP_GENERIC0_6_YUV_10_BPC;
> >>>> +        break;
> >>>> +    case 8:
> >>>> +    default:
> >>>> +        bpc = DP_GENERIC0_6_YUV_8_BPC;
> >>>> +        break;
> >>>> +    }
> >>>> +
> >>>> +    /* VSC SDP payload as per table 2-117 of DP 1.4 specification */
> >>>> +    data = (dp_catalog->vsc_sdp_data.colorimetry & 0xF) |
> >>>> +           ((dp_catalog->vsc_sdp_data.pixelformat & 0xF) << 4) |
> >>>> +           (bpc << 8) |
> >>>> +           ((dp_catalog->vsc_sdp_data.dynamic_range & 0x1) << 15) |
> >>>> +           ((dp_catalog->vsc_sdp_data.content_type & 0x7) << 16);
> >>>> +
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_6, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >>>> +
> >>>> +    data = 0;
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_7, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >>>> +
> >>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_8, data);
> >>>> +    memcpy(buf + off, &data, sizeof(data));
> >>>> +    off += sizeof(data);
> >
> >



-- 
With best wishes
Dmitry

