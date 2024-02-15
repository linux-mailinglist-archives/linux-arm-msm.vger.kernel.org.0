Return-Path: <linux-arm-msm+bounces-11228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC3856CE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 19:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C9B6B219F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 18:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24470136641;
	Thu, 15 Feb 2024 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="meBg59C3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA75134721
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708022439; cv=none; b=a4FSLZRAzTxALFiO8jmeQzEpA6OBMA6UpB2KMLJMGGsnVAkOnHKTWI4l5yoeY0S5k9ypzj1SPY/eTqDkM5/iV3fbYyy+QK8P421x+fSW3GEAGUawUGpX0CFy8t2H7I5A8EM7ssK3Y/+9pGa67roEaNByg6svcxNjmS6G36Q1B84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708022439; c=relaxed/simple;
	bh=RSgq5hUc7p1G7CFmwccNkq//4POKlPFTSrlo6nmU72I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpDvZY/Au8Ivpsc8ser0ptvFw9tc1xgyapWlRcHc/IX1hbOMY19nzacGmciJuCUHbvcGLa9SzcJpjTK8wUtXSZYcjPtwj7BqjgR+lyvpLkCTeXi1BKJfS6w9+lPahbBN/u5RuywWYLsMRjSC4bble27xfPE44ucAci+s0KDwEEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=meBg59C3; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so1321403276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708022436; x=1708627236; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JglBwXSntLlCbyjy/GHZdM028F64P17qowaUV5IhPx0=;
        b=meBg59C3gBCqNULQFIkoJiz7jtwknBQAyGByeeNjQoDyrOiP+rpWVGaG+s88XiwPM/
         M0VA7ROa+9dknGB/IB+e+ch5pdRdoB4ZNbUpVLVYTvYFUxnsBQyU23117TvkBJxIVxuS
         yZ/NWWu0qrgcthPt/UMiggsz0RxHR9JGR0Fpwo47THcZZ47LXbHiX4y5X+36yuWjs7ZX
         Tl55FXXjLSeBNW4SKKSOxyealae4o7DGJgM3Lx7YNEKZzr1w6lKavThXS97CgK2BBF3t
         pwj5AFxp1NBiFUgSEa5apegd3s1vvyZ7gPPOQF3CF6TkgREQ/O7VM0LlSFC/USHF+MHc
         abUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708022436; x=1708627236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JglBwXSntLlCbyjy/GHZdM028F64P17qowaUV5IhPx0=;
        b=LVe/5lsolRL2kw5B2EDtFxzyMYEd0FKV0UzsXbT7/ePnMhy1/Dh5USquIj+mV+j8hI
         ram2RtxPLf/OsbKER5v/jE9xVGAu9diEtQoqkoxkpgxjFaXQp+jNqGq8zMRoLR7wpI6d
         OwXs46JGxVwoQ16BrKm9MK4wCHY03tfeDGnJ3Wvnkr+eYY324Uj+YW7K87xKxbkZlr9O
         iuKc6pfVFhncalvjCI+hklAO/RGUWKOoU4E8ClsohpYOr44cHcwOnH2zCf7W09wqK6U8
         4Afh7b2LmvpI/7qtE2R6pgzHGHBDIm8/6W0G7I/eA/YHiQqIRrWO4PWkir7+BGj6uCqn
         DPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuPAgIuVGzia+vtyNpi6dfi15BfWxQ12Wjm4BFR43BGssD8RB1+weBtRENG3+idhnLRkTYGM/OKx4TpP0kSDQzgH5UNKN+6MVkx2x9Ug==
X-Gm-Message-State: AOJu0YyTCPoVICoxIfX/gPFPi3dP/JVPD/Bia5p/Beq4z5GeXp/Y2EPm
	lNmCEFpQ4fY0Kmb735ScRGR0SWrMTKbpGzZ5G84/sQTLv1Mo9yZxstW1sE06yxxGuNFGLf6ZhVa
	JAqxwlJd+aIeZgh6KRag1BuMTDHkLI2tzRkPQPw==
X-Google-Smtp-Source: AGHT+IGBc1DKEt44dJP+HARF8uN8GAF96QgYekZsW2BRKFHllOv5Vc7K0jzqLyY+mmENRqYLN1HGEXEPUYCDbI13GTo=
X-Received: by 2002:a25:6b11:0:b0:dc6:4713:bbf1 with SMTP id
 g17-20020a256b11000000b00dc64713bbf1mr2476660ybc.21.1708022436155; Thu, 15
 Feb 2024 10:40:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-14-quic_parellan@quicinc.com> <CAA8EJppCxHrcUYRdtGJYmjLYu=VwX3KbPXZ4YNsCzagkMEPvLQ@mail.gmail.com>
 <917eadef-0d84-be62-9ef2-9048dea97144@quicinc.com> <CAA8EJprroq8mcAgaPMO_g-XrpbaGOfZhjCDQ-4vxHy5Ae9iY3w@mail.gmail.com>
 <8f0ef8a0-9075-8bb4-e08e-58e35f6ab116@quicinc.com> <CAA8EJprWzyJpU4Q-o7qEgTytG_pUfoiBMos+LF-MdcmMpYHYkQ@mail.gmail.com>
In-Reply-To: <CAA8EJprWzyJpU4Q-o7qEgTytG_pUfoiBMos+LF-MdcmMpYHYkQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 20:40:24 +0200
Message-ID: <CAA8EJpr8WLC26rVU2YVhB1tt6VYny5MPXPwQ7CTGf5eRfNJpDw@mail.gmail.com>
Subject: Re: [PATCH v3 13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Feb 2024 at 19:03, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 15 Feb 2024 at 18:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 2/15/2024 12:40 AM, Dmitry Baryshkov wrote:
> > > On Wed, 14 Feb 2024 at 22:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >>
> > >>
> > >>
> > >> On 2/14/2024 11:39 AM, Dmitry Baryshkov wrote:
> > >>> On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> > >>>>
> > >>>> Add support to pack and send the VSC SDP packet for DP. This therefore
> > >>>> allows the transmision of format information to the sinks which is
> > >>>> needed for YUV420 support over DP.
> > >>>>
> > >>>> Changes in v3:
> > >>>>           - Create a new struct, msm_dp_sdp_with_parity, which holds the
> > >>>>             packing information for VSC SDP
> > >>>>           - Use drm_dp_vsc_sdp_pack() to pack the data into the new
> > >>>>             msm_dp_sdp_with_parity struct instead of specifically packing
> > >>>>             for YUV420 format
> > >>>>           - Modify dp_catalog_panel_send_vsc_sdp() to send the VSC SDP
> > >>>>             data using the new msm_dp_sdp_with_parity struct
> > >>>>
> > >>>> Changes in v2:
> > >>>>           - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
> > >>>>           - Remove dp_sdp from the dp_catalog struct since this data is
> > >>>>             being allocated at the point used
> > >>>>           - Create a new function in dp_utils to pack the VSC SDP data
> > >>>>             into a buffer
> > >>>>           - Create a new function that packs the SDP header bytes into a
> > >>>>             buffer. This function is made generic so that it can be
> > >>>>             utilized by dp_audio
> > >>>>             header bytes into a buffer
> > >>>>           - Create a new function in dp_utils that takes the packed buffer
> > >>>>             and writes to the DP_GENERIC0_* registers
> > >>>>           - Split the dp_catalog_panel_config_vsc_sdp() function into two
> > >>>>             to disable/enable sending VSC SDP packets
> > >>>>           - Check the DP HW version using the original useage of
> > >>>>             dp_catalog_hw_revision() and correct the version checking
> > >>>>             logic
> > >>>>           - Rename dp_panel_setup_vsc_sdp() to
> > >>>>             dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
> > >>>>             currently VSC SDP is only being set up to support YUV420 modes
> > >>>>
> > >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> > >>>> ---
> > >>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 113 ++++++++++++++++++++++++++++
> > >>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
> > >>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
> > >>>>    drivers/gpu/drm/msm/dp/dp_panel.c   |  55 ++++++++++++++
> > >>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
> > >>>>    drivers/gpu/drm/msm/dp/dp_utils.c   |  48 ++++++++++++
> > >>>>    drivers/gpu/drm/msm/dp/dp_utils.h   |  18 +++++
> > >>>>    7 files changed, 248 insertions(+)
> > >>>>
> > >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>>> index 5d84c089e520a..61d5317efe683 100644
> > >>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > >>>> @@ -901,6 +901,119 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
> > >>>>           return 0;
> > >>>>    }
> > >>>>
> > >>>> +static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog,
> > >>>> +                                         struct msm_dp_sdp_with_parity *msm_dp_sdp)
> > >>>> +{
> > >>>> +       struct dp_catalog_private *catalog;
> > >>>> +       u32 val;
> > >>>> +
> > >>>> +       if (!dp_catalog) {
> > >>>> +               DRM_ERROR("invalid input\n");
> > >>>> +               return;
> > >>>> +       }
> > >>>> +
> > >>>> +       catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
> > >>>> +
> > >>>> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB0) << HEADER_BYTE_0_BIT |
> > >>>> +              (msm_dp_sdp->pb.PB0 << PARITY_BYTE_0_BIT) |
> > >>>> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB1) << HEADER_BYTE_1_BIT |
> > >>>> +              (msm_dp_sdp->pb.PB1 << PARITY_BYTE_1_BIT));
> > >>>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_0, val);
> > >>>> +
> > >>>> +       val = ((msm_dp_sdp->vsc_sdp.sdp_header.HB2) << HEADER_BYTE_2_BIT |
> > >>>> +              (msm_dp_sdp->pb.PB2 << PARITY_BYTE_2_BIT) |
> > >>>> +              (msm_dp_sdp->vsc_sdp.sdp_header.HB3) << HEADER_BYTE_3_BIT |
> > >>>> +              (msm_dp_sdp->pb.PB3 << PARITY_BYTE_3_BIT));
> > >>>> +       dp_write_link(catalog, MMSS_DP_GENERIC0_1, val);
> > >>>
> > >>> I still think that this is not the way to do it. Could you please
> > >>> extract the function that takes struct dp_sdp_header, calculates
> > >>> padding and writes resulting data to the hardware? This way we can
> > >>> reuse it later for all the dp_audio stuff.
> > >>>
> > >>
> > >> hmmm ... dp_utils_pack_sdp_header() does that you are asking for right?
> > >>
> > >> OR are you asking for another function like:
> > >>
> > >> 1) rename dp_utils_pack_sdp_header() to dp_utils_calc_sdp_parity()
> > >> 2) dp_utils_pack_sdp() takes two u32 to pack the header and parity
> > >> together and we move the << HEADER_BYTE_xx | part to it
> > >>
> > >> dp_catalog_panel_send_vsc_sdp() just uses these two u32 to write the
> > >> headers.
> > >
> > > I'm really looking for the following function:
> > >
> > > void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog,
> > > struct dp_sdp *dp_sdp)
> > > {
> > >      dp_write_vsc_header(dp_catalog, MMSS_DP_GENERIC0_0, &dp_sdp->sdp_header);
> > >      dp_write_vsc_packet(dp_catalog, MMSS_DP_GENERIC0_2, dp_sdp);
> > > }
> > >
> > > Then dp_audio functions will be able to fill struct dp_sdp_header and
> > > call dp_write_vsc_header (or whatever other name for that function)
> > > directly.
> > >
> >
> > I think there is some misunderstanding here.
> >
> > Audio does not write or use generic_0 registers. It uses audio infoframe
> > SDP registers. So the catalog function of audio will not change.
>
> Sure, that's why I added the register to the `dp_write_vsc_header` prototype.
>
> E.g.:
>
> void dp_audio_stream_sdp(...)
> {
>     struct dp_sdp_header hdr;
>     hdr.HB0 = 0;
>     hdr.HB1 = 0x2;
>     hdr.HB2 = ...;
>     hdr.HB3 = audio->nchannels - 1;
>     dp_write_vsc_header(dp_catalog, MMSS_DP_AUDIO_STREAM_0, &hdr);
> }
>
>
> >
> > The only part common between audio and vsc sdp is the parity byte
> > calculation and the packing of parity and header bytes into 2 u32s.
> >
> > Thats why I wrote that we will have a common util between audio and vsc
> > sdp only to pack the data but the catalog functions will be different.
> >

After an offline discussion, let's start with the dp_util function
packing struct dp_sdp_header into u32[2], then we can decide on the
fate of the dp_audio stuff later on.


-- 
With best wishes
Dmitry

