Return-Path: <linux-arm-msm+bounces-41871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C99F00C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 01:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D86B6169EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 00:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E82B136E;
	Fri, 13 Dec 2024 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mUHk/AoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F42621
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 00:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734049705; cv=none; b=cyJHqe7Wi8RG8pHBIA1akU7F7982Rlr+GeTLPPnSnFcj+KCD+o2UiIys9/1ljLUPCiROBTfRIDD2pFVvQ97sm5ZZvUEVK5YUkQvaZQvUWqmVTe6zgMJaMkn1t6fghpHLrUkSRvL/ayfOOBsL+ImhVQyY8qJUBVDGktWz+MuOv+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734049705; c=relaxed/simple;
	bh=wvH/ASjzsaJfNK+ELGe3C9GYk3UXJgAmtCwgYXPqxsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUKFBX+JISzhrUagaFqhn//FOI9PwuFMHSgYam1T+Jivx+8Dr2VH+99AyT+8ssELl2pX4NvGFDfMiNorrVqPw/bYPJNaou5JfvWVN+E36/iggkuD5a+hHKQTVfKRRYPCv/WFYhEB82KCL0hLNgDCSG9PHRmkyGbaiwid3950+E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mUHk/AoU; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e38938a55e7so927771276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734049702; x=1734654502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0kEf3pmVjhYgIaUUKMj8/qv2yfYKhGsnNuzTFcwe8d4=;
        b=mUHk/AoUhmxteVib02avrmS3zLceIwe4JtH+w4jyWRZ1gnlLky4/2X/vCujF5RST/Q
         xPnfVt5kUvMHE30aW3l3B+I4dTeDqP51dXFKWv1EWK8RWEZ16BxjJ5ujbuIeO1Hd8WSg
         U/EJk2EP2bGzshO2M0VBEhrlZEQzIvIZqQip/Q2elsRzM1RZxgrkFtM8TXo22fQHP86r
         SzVbJ5A5zM1zpZMAB2mpqSg1C178j7WzlYBduKsPAZMwtwvX4WQWhcAsskHfavlw4MAn
         UoTvsTf0YFOL20GZSynX35avGNXFZay+dZcy/l8N+DgOn8oa1SqioJSLYMZLN1NYXoGW
         nZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049702; x=1734654502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kEf3pmVjhYgIaUUKMj8/qv2yfYKhGsnNuzTFcwe8d4=;
        b=fgTMSaKKnlMgw9PImEmOZXYGdULN0OFmhydXG8na7szO/2riySmgQi6JSOR8Z9AVkE
         WbfUr3y4ss/0UOW+bYstT1CPdFUcrNGRCWpF3VlHpcJhH7M4WzyX7l5mT8KD3kDuDxvz
         leuf0SKBiKzqEV/K5mgWqD5R6Ktqi6iqa2l0XaQfP0cVNyJDeaZMemF/3BFF2jYN/cOC
         n+H04MpgI8hP2E/cCrF4965YVSRmRRVJMc7tFhjpFHOayQW5S3Wv7axB+9UiogpRTq4R
         /Hz/cukH+c624ZUKkeOz5pmXx0wtrigJITR+hlp7Cu2v+L3Ss9wMwmjKT9POugFHqPbh
         6W0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFRiYxhg9K/XjBx7h0/H9baBt4VUSGSzl33QY5nekw90qFS6HKn4GE5yxMmAmkPbWgEclUT3qSZcO48Mem@vger.kernel.org
X-Gm-Message-State: AOJu0YzIo9v6mA87PBFvy/r53qRhydEQzxEBvEnykFw+8ZkyYeAzdWf4
	WouHVE1foVvLqJPVAPo//9KhyKG7fex5If1Si4CclKOW9pZ0ZeB+QpmxLjPoaH5gFNDSM9RqdFb
	CkfrKrNIJV3J23M7hqs2gtl+hpvDc+BUB2yzbuA==
X-Gm-Gg: ASbGncvU+iko5yAZxCZJUuxd4Ie92lZ+X+tU421C4eFOnWuXzco8oBMJjUKJXHG21m2
	CQhTLF38AbGrchv4kdSsvk69q60IeeApHawVWNA==
X-Google-Smtp-Source: AGHT+IEYPVyTc8vD6d/ItX+UznJeKgYnrfB/BFGVU0tIN+SAmCWvJ/BvkdZEmbX6bM9NlANsTaRFmznQ2EKZ2PHSVm0=
X-Received: by 2002:a05:6902:2e0f:b0:e30:e39b:9d72 with SMTP id
 3f1490d57ef6-e434a541645mr606573276.16.1734049702044; Thu, 12 Dec 2024
 16:28:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org> <070dea1a-c300-4968-ba24-011625e4c133@quicinc.com>
 <CAA8EJpqO=AjVGEnZHNbM5+Mnu2gMN96kABBLM5XHh3NMMGFtjw@mail.gmail.com> <9a9ff3a5-5c01-45fd-a89a-b8305baac5bd@quicinc.com>
In-Reply-To: <9a9ff3a5-5c01-45fd-a89a-b8305baac5bd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 02:28:11 +0200
Message-ID: <CAA8EJpoF1B4mARmSmEhq9qUfMFxCF-+W1AVDnOLniM6F67=yvw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Dec 2024 at 01:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/12/2024 2:28 PM, Dmitry Baryshkov wrote:
> > On Thu, 12 Dec 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> >>> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> >>> to program audio packet data. Use 0 as Packet ID, as it was not
> >>> programmed earlier.
> >>>
> >>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/dp/dp_audio.c | 288 +++++++++-----------------------------
> >>>    1 file changed, 66 insertions(+), 222 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..1aa52d5cc08684a49102e45ed6e40ac2b13497c7 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> @@ -14,6 +14,7 @@
> >>>    #include "dp_catalog.h"
> >>>    #include "dp_audio.h"
> >>>    #include "dp_panel.h"
> >>> +#include "dp_reg.h"
> >>>    #include "dp_display.h"
> >>>    #include "dp_utils.h"
> >>>
> >>> @@ -28,251 +29,94 @@ struct msm_dp_audio_private {
> >>>        struct msm_dp_audio msm_dp_audio;
> >>>    };
> >>>
> >>> -static u32 msm_dp_audio_get_header(struct msm_dp_catalog *catalog,
> >>> -             enum msm_dp_catalog_audio_sdp_type sdp,
> >>> -             enum msm_dp_catalog_audio_header_type header)
> >>> -{
> >>> -     return msm_dp_catalog_audio_get_header(catalog, sdp, header);
> >>> -}
> >>> -
> >>> -static void msm_dp_audio_set_header(struct msm_dp_catalog *catalog,
> >>> -             u32 data,
> >>> -             enum msm_dp_catalog_audio_sdp_type sdp,
> >>> -             enum msm_dp_catalog_audio_header_type header)
> >>> -{
> >>> -     msm_dp_catalog_audio_set_header(catalog, sdp, header, data);
> >>> -}
> >>> -
> >>>    static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x02;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
> >>> -     new_value = value;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     /* Config header and parity byte 3 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
> >>> -
> >>> -     new_value = audio->channels - 1;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> >>> -             value, parity_byte);
> >>> -
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x02,
> >>> +             .HB2 = 0x00,
> >>> +             .HB3 = audio->channels - 1,
> >>> +     };
> >>> +     u32 header[2];
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
> >>>    }
> >>
> >> This patch is changing the programming behavior.
> >>
> >> Earlier it was using a read/modify/write on each register. Now, its just
> >>    a write. I checked a few chipsets, the reset value of registers was 0,
> >> so that part is okay.
> >
> > Except that it was not a correct RMW, it was read, OR new data without
> > clearing the bitfield, write. So it has been working mostly by a
> > miracle,
> >
> >>
> >> But, for the MMSS_DP_AUDIO_STREAM_0 register, earlier we were writing
> >> only the upper nibble, that is bits 15:0 of DP_AUDIO_SDP_HEADER_0 was
> >> kept as-it-is, but now this patch is changing that to 0. What was the
> >> reason for that change?
> >
> > It is described in the commit message: "Use 0 as Packet ID, as it was not
> > programmed earlier."
> >
>
> The part of using 0 as Packet ID is but not the behavior of changing the
> RMW which is also pretty significant. That was all happening under the hood.

No. It is explicitly mentioned in the commit message. It's not under the hood.

>
> >>
> >> This is true for all the APIs being touched in this file.
> >>
> >> I guess the whole point of having that audio map in the catalog was to
> >> preserve the read values of these registers. I have to check what was
> >> the reason behind that as once again this was before I worked on this
> >> driver as well.
> >>
> >> So technically there are two parts to this change:
> >>
> >> 1) dropping read for each header and directly just writing it
> >> 2) Writing the registers directly instead of going through catalog
> >>
> >> It seems like (1) and (2) are independent. I hope (1) was not the reason
> >> to have started this whole rework.
> >
> > Yes, the driver spends a lot of effort to preserve the data that will
> > be rewritten when the function is called to write the next header
> > byte. So it is useless. Only HB0 has been preserved, PacketID. If for
> > some reason we are generating a stream with the non-zero ID, it should
> > be explicit, not implicitly 'preserved'.
> >
>
> I am trying to understand why this was being preserved. Audio
> programming is half in DP driver and half in ADSP. I dont know if the
> expectation was that packet ID will be programmed elsewhere and not in
> HLOS code hence it was preserved.
>
> > So, the reasons were:
> > - fix the RMW cycles to drop old values from the registers
> > - use new msm_dp_utils_pack_sdp_header()
> > - get rid of the useless indirection through the catalog and enum
> > msm_dp_catalog_audio_header_type
> > - write registers in an efficient way.
> > - if we ever have a set of functions to handle DP infoframes (like we
> > do for HDMI), make the MSM DP driver ready to be converted to such
> > functions.
>
>
> The only reason the current driver needed to go through the catalog map
> was that it was trying to write one header at a time. And in the
> registers, 2 headers are mapped to one register. So a map was needed. I
> do not know the reason for breaking up the writes into one header at a
> time like I already mentioned so I am trying to gather that info.
> Without knowing the reason it might seem useless but its my duty to make
> sure nothing was overlooked.

Sure!

>
>
>
> >
> >>
> >>>
> >>>    static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x1;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     new_value = 0x17;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     /* Config header and parity byte 3 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> >>> -
> >>> -     new_value = (0x0 | (0x11 << 2));
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x01,
> >>> +             .HB2 = 0x17,
> >>> +             .HB3 = 0x0 | (0x11 << 2),
> >>> +     };
> >>> +     u32 header[2];
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
> >>>    }
> >>>
> >>>    static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x84;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     new_value = 0x1b;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     /* Config header and parity byte 3 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> >>> -
> >>> -     new_value = (0x0 | (0x11 << 2));
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     new_value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x84,
> >>> +             .HB2 = 0x1b,
> >>> +             .HB3 = 0x0 | (0x11 << 2),
> >>> +     };
> >>> +     u32 header[2];
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
> >>>    }
> >>>
> >>>    static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x05;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     new_value = 0x0F;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     /* Config header and parity byte 3 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> >>> -
> >>> -     new_value = 0x0;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_3_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_3_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x05,
> >>> +             .HB2 = 0x0f,
> >>> +             .HB3 = 0x00,
> >>> +     };
> >>> +     u32 header[2];
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
> >>>    }
> >>>
> >>>    static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
> >>>    {
> >>>        struct msm_dp_catalog *catalog = audio->catalog;
> >>> -     u32 value, new_value;
> >>> -     u8 parity_byte;
> >>> -
> >>> -     /* Config header and parity byte 1 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     new_value = 0x06;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_1_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_1_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> >>> -
> >>> -     /* Config header and parity byte 2 */
> >>> -     value = msm_dp_audio_get_header(catalog,
> >>> -                     DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> >>> -
> >>> -     new_value = 0x0F;
> >>> -     parity_byte = msm_dp_utils_calculate_parity(new_value);
> >>> -     value |= ((new_value << HEADER_BYTE_2_BIT)
> >>> -                     | (parity_byte << PARITY_BYTE_2_BIT));
> >>> -     drm_dbg_dp(audio->drm_dev,
> >>> -                     "Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> >>> -                     value, parity_byte);
> >>> -     msm_dp_audio_set_header(catalog, value,
> >>> -             DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> >>> +     struct dp_sdp_header sdp_hdr = {
> >>> +             .HB0 = 0x00,
> >>> +             .HB1 = 0x06,
> >>> +             .HB2 = 0x0f,
> >>> +             .HB3 = 0x00,
> >>> +     };
> >>> +     u32 header[2];
> >>> +     u32 reg;
> >>> +
> >>> +     /* XXX: is it necessary to preserve this field? */
> >>> +     reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
> >>> +     sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
> >>> +
> >>> +     msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> >>> +
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
> >>> +     msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
> >>>    }
> >>>
> >>>    static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

