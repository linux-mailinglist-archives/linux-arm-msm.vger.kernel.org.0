Return-Path: <linux-arm-msm+bounces-10555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19C8507FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 07:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C65642866A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 06:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852D23B2A8;
	Sun, 11 Feb 2024 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9P+OLH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E8125CA
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Feb 2024 06:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707634668; cv=none; b=mtzRA/GhBmt5nI9ujQpPS+Bcct0gV8/CEp31ubpPm37zC0TCvyev4F1Srp2rSOuIJpkt+d6XZ9ryNAgxfVnGSeYYPtLE0QFt2KTzTVZh0tBzTr2tvl9TLF6aCZ8lbCK44Z9f0ClsaqvI16ZSSUo97I/5Dww/DlVWLD3K6AJG1wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707634668; c=relaxed/simple;
	bh=ltEwO0rSM2e+8wlq9bbMEhUhULPRmXsE2caxL+D7IkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvBw2JmnKlKcCvY1V8LIkhsvPIpypfdiQLPqc0tfW5OMvZ0hnF9XNbtDqjsFGg8HfgRiHRQilAprLE47i3eqWBWmQkCJP5gKaWtK51GooDyy8+kLsV7eZ6+f3gA4SMrR6x0nXwA0mGNYsRWApk+IwGgTAUiTq8jObzWEjojSf9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L9P+OLH9; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6e08fde11so2375625276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 22:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707634664; x=1708239464; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wsrx1OUTE3+oTmvPi+BQpaJ6B5C/dt8ETuRf2OEwZco=;
        b=L9P+OLH9ONfmW/DqxjQuJx22ycryf1LQhDizQyev+JQGFIjOq+zgZZ+agXQ0gmW1nm
         S4DudEeY0HLOk/j1+DMDGAjtKdG10XQQ9OVT4NCs8MdxZj2vGq9tZA7G75v76M1gRCae
         jT0GYaG1r8gFbP5KluijVJewSQJjMo6suga4zS/TIKAgIdTDrLJY738HrEMNMg8edVQB
         Q04hFNQpn9WrTcwWHS5/MioRe23a1qsArTKLmVsR4L3yi5LoMcJ4M6Z+Tc6mB+HdWVxv
         Sp4RPvSQiolomLlCfg6OVortZMYoOtyXflji6Ytb4dB6VDd2EtRGxtbn9xQBihQpf5t5
         4Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707634664; x=1708239464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wsrx1OUTE3+oTmvPi+BQpaJ6B5C/dt8ETuRf2OEwZco=;
        b=HrWHVWTgzCwPydCcFvx2jZtdsPTzBVH8JAG3WXTG3D3FatoNgylGoZZ9lqXhBwiF65
         ahu3biBOvTznQtkie8dKUSky6jluZ8KcUP35KdkYKZowYDSZ1mIBRoVxP+wHMQyB76cE
         i3fpINoSnzL5pRNC2otp+EB7bhKi188qXRB6xuncOm00dodij8iR/tLgsyckHebIvGTX
         fR6aZMqpaDK6C7GPmzazbXx9KHdy3BXlrDa5OGApwFdnBZGXvtHSe8W3bcFYflJ8ZVn7
         pyw7VzlsYIPsOVJmxPHzNwgstDGrg21J11v6CN6z00jxCqhYbXHQJc8yGmNMUZvZaWR7
         Cfcw==
X-Gm-Message-State: AOJu0YxPrfUbDmnTEAkBQkoEWo0SXKej70Zp1H9kA1XwZaw06tB/tWQf
	K0BQOW0idbcHlEypGrNRptobB8/EN2aV/qU8zFrP8b7XIp8FE/jGRwzRm3Sgh+sCbn4kWn5PEEK
	z0X99i38Q/HnNdM99/AFygHJGykLiM7zqDjTKlA==
X-Google-Smtp-Source: AGHT+IHHDnnXDKVKi2XBlNqRkH4jHRXhwS6ifgSEa3KTkDGEvUmcosnE4ikGtq96qxB85TVlCATHZzz2Vb/s4OXkO9E=
X-Received: by 2002:a25:1c1:0:b0:dc7:4910:c014 with SMTP id
 184-20020a2501c1000000b00dc74910c014mr2749504ybb.39.1707634663715; Sat, 10
 Feb 2024 22:57:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-14-quic_parellan@quicinc.com> <CAA8EJpq6EFn6xix2GLej=bB2JCP7btuQ+zugeJTeLBH+mVKdSg@mail.gmail.com>
 <6f4a0a31-e17a-3301-aacf-a88f458db6f3@quicinc.com> <8f728a4d-eb62-add1-1f67-8085eaea3102@quicinc.com>
 <CAA8EJpoct4xTYL38zNOuD=cy9J4_2dStGh+r2YKUdSxRQ8Zhgw@mail.gmail.com> <b1793aab-6fd7-14d9-baec-834bc63dae2d@quicinc.com>
In-Reply-To: <b1793aab-6fd7-14d9-baec-834bc63dae2d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 11 Feb 2024 08:57:32 +0200
Message-ID: <CAA8EJpokVV+ng5Qp5BqFw+JFFOYxazH4bnj3rj3TbTyhCLo0sQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, Helge Deller <deller@gmx.de>, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Feb 2024 at 06:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 1:46 PM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 20:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/10/2024 10:14 AM, Abhinav Kumar wrote:
> >>>
> >>>
> >>> On 2/10/2024 2:09 AM, Dmitry Baryshkov wrote:
> >>>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano
> >>>> <quic_parellan@quicinc.com> wrote:
> >>>>>
> >>>>> Add support to pack and send the VSC SDP packet for DP. This therefore
> >>>>> allows the transmision of format information to the sinks which is
> >>>>> needed for YUV420 support over DP.
> >>>>>
> >>>>> Changes in v2:
> >>>>>           - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
> >>>>>           - Remove dp_sdp from the dp_catalog struct since this data is
> >>>>>             being allocated at the point used
> >>>>>           - Create a new function in dp_utils to pack the VSC SDP data
> >>>>>             into a buffer
> >>>>>           - Create a new function that packs the SDP header bytes into a
> >>>>>             buffer. This function is made generic so that it can be
> >>>>>             utilized by dp_audio
> >>>>>             header bytes into a buffer
> >>>>>           - Create a new function in dp_utils that takes the packed
> >>>>> buffer
> >>>>>             and writes to the DP_GENERIC0_* registers
> >>>>>           - Split the dp_catalog_panel_config_vsc_sdp() function into two
> >>>>>             to disable/enable sending VSC SDP packets
> >>>>>           - Check the DP HW version using the original useage of
> >>>>>             dp_catalog_hw_revision() and correct the version checking
> >>>>>             logic
> >>>>>           - Rename dp_panel_setup_vsc_sdp() to
> >>>>>             dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
> >>>>>             currently VSC SDP is only being set up to support YUV420
> >>>>> modes
> >>>>>
> >>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 105 ++++++++++++++++++++++++++++
> >>>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |   6 ++
> >>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 ++
> >>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   |  59 ++++++++++++++++
> >>>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
> >>>>>    drivers/gpu/drm/msm/dp/dp_utils.c   |  80 +++++++++++++++++++++
> >>>>>    drivers/gpu/drm/msm/dp/dp_utils.h   |   3 +
> >>>>>    7 files changed, 260 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>>> index 5d84c089e520a..0f28a4897b7b7 100644
> >>>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>>> @@ -901,6 +901,111 @@ int dp_catalog_panel_timing_cfg(struct
> >>>>> dp_catalog *dp_catalog)
> >>>>>           return 0;
> >>>>>    }
> >>>>>
>
> <Snip>
>
> >>>>> +static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
> >>>>> +{
> >>>>> +       struct dp_catalog *catalog;
> >>>>> +       struct dp_panel_private *panel;
> >>>>> +       struct dp_display_mode *dp_mode;
> >>>>> +       struct dp_sdp_header sdp_header;
> >>>>> +       struct drm_dp_vsc_sdp vsc_sdp_data;
> >>>>> +       size_t buff_size;
> >>>>> +       u32 gen_buffer[10];
> >>>>> +       int rc = 0;
> >>>>> +
> >>>>> +       if (!dp_panel) {
> >>>>> +               DRM_ERROR("invalid input\n");
> >>>>> +               rc = -EINVAL;
> >>>>> +               return rc;
> >>>>> +       }
> >>>>> +
> >>>>> +       panel = container_of(dp_panel, struct dp_panel_private,
> >>>>> dp_panel);
> >>>>> +       catalog = panel->catalog;
> >>>>> +       dp_mode = &dp_panel->dp_mode;
> >>>>> +       buff_size = sizeof(gen_buffer);
> >>>>> +
> >>>>> +       memset(&sdp_header, 0, sizeof(sdp_header));
> >>>>> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
> >>>>> +
> >>>>> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
> >>>>> +       sdp_header.HB0 = 0x00;
> >>>>> +       sdp_header.HB1 = 0x07;
> >>>>> +       sdp_header.HB2 = 0x05;
> >>>>> +       sdp_header.HB3 = 0x13;
> >>>>
> >>>> This should go to the packing function.
> >>>>
> >>>
> >>> We can .... but ....
> >>>
> >>> the header bytes can change based on the format. These values are
> >>> specific to YUV420. Thats why this part was kept outside of the generic
> >>> vsc sdp packing. Today we support only YUV420 VSC SDP so we can move it
> >>> but this was the reason.
> >
> > These values can be set from the sdp_type, revision and length fields
> > of struct drm_dp_vsc_sdp.
> > The function intel_dp_vsc_sdp_pack() is pretty much close to what I had in mind.
> >
> >>>
> >>>>> +
> >>>>> +       /* VSC SDP Payload for DB16 */
> >>>>
> >>>> Comments are useless more or less. The code fills generic information
> >>>> structure which might or might not be packed to the data buffer.
> >>>>
> >>>>> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> >>>>> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> >>>>> +
> >>>>> +       /* VSC SDP Payload for DB17 */
> >>>>> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> >>>>> +
> >>>>> +       /* VSC SDP Payload for DB18 */
> >>>>> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> >>>>> +
> >>>>> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
> >>>>
> >>>> Consider extracting intel_dp_compute_vsc_colorimetry() and using it.
> >>>>
> >>>
> >>> intel_dp_compute_vsc_colorimetry() uses colorspace property to pick
> >>> YUV420, we do not.
> >
> > Intel function also uses output_format, but it's true, it is full of
> > Intel specifics.
> >
> >>> Right now, its a pure driver decision to use YUV420
> >>> when the mode is supported only in that format.
> >>>
> >>> Also, many params are to be used within this function cached inside
> >>> intel_crtc_state . We will first need to make that API more generic to
> >>> be re-usable by others.
> >>>
> >>> I think overall, if we want to have a generic packing across vendors, it
> >>> needs more work. I think one of us can take that up as a separate effort.
> >
> > Ack, I agree here. I did only a quick glance over
> > intel_dp_compute_vsc_colorimetry function() beforehand.
> >
> >>>
> >>>>> +
> >>>>> +       rc = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &sdp_header,
> >>>>> gen_buffer, buff_size);
> >>>>> +       if (rc) {
> >>>>> +               DRM_ERROR("unable to pack vsc sdp\n");
> >>>>> +               return rc;
> >>>>> +       }
> >>>>> +
> >>>>> +       dp_catalog_panel_enable_vsc_sdp(catalog, gen_buffer);
> >>>>> +
> >>>>> +       return rc;
> >>>>> +}
> >>>>> +
> >>>>>    void dp_panel_dump_regs(struct dp_panel *dp_panel)
> >>>>>    {
> >>>>>           struct dp_catalog *catalog;
> >>>>> @@ -344,6 +399,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
> >>>>>           catalog->dp_active = data;
> >>>>>
> >>>>>           dp_catalog_panel_timing_cfg(catalog);
> >>>>> +
> >>>>> +       if (dp_panel->dp_mode.out_fmt_is_yuv_420)
> >>>>> +               dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
> >>>>> +
> >>>>>           panel->panel_on = true;
> >>>>>
> >>>>>           return 0;
> >>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>>> b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>>> index ea85a691e72b5..2983756c125cd 100644
> >>>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>>> @@ -142,6 +142,7 @@
> >>>>>    #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
> >>>>>    #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
> >>>>>    #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
> >>>>> +#define DP_MISC1_VSC_SDP                       (0x00004000)
> >>>>>
> >>>>>    #define REG_DP_VALID_BOUNDARY                  (0x00000030)
> >>>>>    #define REG_DP_VALID_BOUNDARY_2                        (0x00000034)
> >>>>> @@ -201,9 +202,11 @@
> >>>>>    #define MMSS_DP_AUDIO_CTRL_RESET               (0x00000214)
> >>>>>
> >>>>>    #define MMSS_DP_SDP_CFG                                (0x00000228)
> >>>>> +#define GEN0_SDP_EN                            (0x00020000)
> >>>>>    #define MMSS_DP_SDP_CFG2                       (0x0000022C)
> >>>>>    #define MMSS_DP_AUDIO_TIMESTAMP_0              (0x00000230)
> >>>>>    #define MMSS_DP_AUDIO_TIMESTAMP_1              (0x00000234)
> >>>>> +#define GENERIC0_SDPSIZE_VALID                 (0x00010000)
> >>>>>
> >>>>>    #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
> >>>>>    #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
> >>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>>> b/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>>> index 176d839906cec..05e0133eb50f3 100644
> >>>>> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
> >>>>> @@ -4,6 +4,16 @@
> >>>>>     */
> >>>>>
> >>>>>    #include <linux/types.h>
> >>>>> +#include <drm/display/drm_dp_helper.h>
> >>>>> +#include <drm/drm_print.h>
> >>>>> +
> >>>>> +#include "dp_utils.h"
> >>>>> +
> >>>>> +#define DP_GENERIC0_6_YUV_8_BPC                BIT(0)
> >>>>> +#define DP_GENERIC0_6_YUV_10_BPC       BIT(1)
> >>>>> +
> >>>>> +#define DP_SDP_HEADER_SIZE             8
> >>>>> +#define DP_VSC_SDP_BUFFER_SIZE         40
> >>>>>
> >>>>>    u8 dp_utils_get_g0_value(u8 data)
> >>>>>    {
> >>>>> @@ -69,3 +79,73 @@ u8 dp_utils_calculate_parity(u32 data)
> >>>>>
> >>>>>           return parity_byte;
> >>>>>    }
> >>>>> +
> >>>>> +int dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32
> >>>>> *buffer, size_t buff_size)
> >>>>> +{
> >>>>> +       u32 header, parity;
> >>>>> +
> >>>>> +       if (buff_size < DP_SDP_HEADER_SIZE)
> >>>>> +               return -ENOSPC;
> >>>>> +
> >>>>> +       memset(buffer, 0, sizeof(buffer));
> >>>>> +
> >>>>> +       /* HEADER BYTE 0 */
> >>>>> +       header = sdp_header->HB0;
> >>>>> +       parity = dp_utils_calculate_parity(header);
> >>>>> +       buffer[0]   = ((header << HEADER_BYTE_0_BIT) | (parity <<
> >>>>> PARITY_BYTE_0_BIT));
> >>>>> +
> >>>>> +       /* HEADER BYTE 1 */
> >>>>> +       header = sdp_header->HB1;
> >>>>> +       parity = dp_utils_calculate_parity(header);
> >>>>> +       buffer[0]  |= ((header << HEADER_BYTE_1_BIT) | (parity <<
> >>>>> PARITY_BYTE_1_BIT));
> >>>>> +
> >>>>> +       /* HEADER BYTE 2 */
> >>>>> +       header = sdp_header->HB2;
> >>>>> +       parity = dp_utils_calculate_parity(header);
> >>>>> +       buffer[1]   = ((header << HEADER_BYTE_2_BIT) | (parity <<
> >>>>> PARITY_BYTE_2_BIT));
> >>>>> +
> >>>>> +       /* HEADER BYTE 3 */
> >>>>> +       header = sdp_header->HB3;
> >>>>> +       parity = dp_utils_calculate_parity(header);
> >>>>> +       buffer[1]  |= ((header << HEADER_BYTE_3_BIT) | (parity <<
> >>>>> PARITY_BYTE_3_BIT));
> >>>>> +
> >>>>> +       return 0;
> >>>>> +}
> >>>>> +
> >>>>> +int dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc_sdp_data,
> >>>>> struct dp_sdp_header *sdp_header,
> >>>>> +                         u32 *buffer, size_t buff_size)
> >>>>> +{
> >>>>
> >>>> No. This function should pack data into struct dp_sdp and it should go
> >>>> to drivers/video/hdmi.c
> >>>>
> >>>
> >>> What is the difference between struct drm_dp_vsc_sdp and struct dp_sdp?
> >>>
> >>
> >> I think you were referring to the fact that instead of a custom buffer,
> >> we should use struct dp_sdp to pack elements from struct drm_dp_vsc_sdp.
> >>
> >> If yes, I agree with this part.
> >
> > Yes.
> >
> >>
> >>> It seems like struct drm_dp_vsc_sdp is more appropriate for this.
> >>>
> >>> Regarding hdmi.c, I think the packing needs to be more generic to move
> >>> it there.
> >>>
> >>> I am not seeing parity bytes packing with other vendors. So there will
> >>> have to be some packing there and then some packing here.
> >
> > Yes. Writing the HB + PB seems specific to Qualcomm hardware. At least
> > Intel and AMD seem to write header bytes without parity.
> >
> >>> Also, like you already noticed, to make the VSC SDP packing more generic
> >>> to move to hdmi.c, it needs more work to make it more usable like
> >>> supporting all pixel formats and all colorimetry values.
> >>>
> >>> We do not have that much utility yet for that.
> >
> > I think you are mixing the filling of drm_dp_vsc_sdp and packing of
> > that struct. I suppose intel_dp_vsc_sdp_pack() can be extracted more
> > or less as is.
> > Once somebody needs to support 3D (AMD does), they can extend the function.
> >
>
> Yes once I corrected my understanding of using the function to just pack
> struct dp_sdp instead of the buffer, I understood the intention.
>
> We can try it. I have written up a RFC to move the
> intel_dp_vsc_sdp_pack() to drm_dp_helper as that seems more appropriate
> now for it and not hdmi.c as we already have some vsc sdp utils in
> drm_dp_helper.

Yes, we have. However all structure manipulation functions, even for
DP, are usually a part of the hdmi.c. If I understand correctly, we
can still touch this file from drm-misc (or from other drm trees).

> But before I post, we will do some cleanup and see if things look
> reasonable in this patch too because we will still need to write a
> common utility to pack the parity bytes for the sdp header which we need
> to utilize for audio and vsc sdp in our DP case.
>
> I am thinking of a
>
> struct msm_dp_sdp_pb {
>         u8 PB0;
>         u8 PB1;
>         u8 PB2;
>         u8 PB3;
> } __packed;
>
> struct msm_dp_sdp_with_parity {
>         struct dp_sdp vsc_sdp;
>         struct msm_dp_sdp_pb pb;
> };
>
> intel_dp_vsc_sdp_pack() will pack the struct dp_sdp but we will have to
> do some additional parity byte packing after that. That part will remain
> common for audio and vsc for msm.

I think you can do it in a much easier way:

struct dp_sdp sdp
u32 header[2];

hdmi_dp_vsc_sdp_pack(vsc_sdp, &sdp);
msm_dp_pack_header(&sdp, header);
dp_write_register(catalog, MMSS_DP_FOO_HEADER0, header[0]);
dp_write_register(catalog, MMSS_DP_FOO_HEADER1, header[1]);
// write sdp.db

-- 
With best wishes
Dmitry

