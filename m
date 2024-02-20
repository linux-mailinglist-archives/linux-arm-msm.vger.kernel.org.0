Return-Path: <linux-arm-msm+bounces-11908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55B85C362
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 19:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA2F4B2135B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 18:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A60762EC;
	Tue, 20 Feb 2024 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XbOuIy3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4946D1A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708452598; cv=none; b=D4gWtaWTQdoSd05Il4X3yXMtYJeTmdIL9tnWm7BHemFxO4Q3m0+3dE6ql3wYi1GRi7waeR39hIxaIG+s0jYVxUuXnXgfz1dTlAi9386HhM0U2rZfXypoH8IOlxDrBGPqdkWyLAPDNyf+yW5C3jqwCqmLSlXttPf0OaypyEzgxAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708452598; c=relaxed/simple;
	bh=Im7lWu7kmx0P29XDXzMGxI0nfoFveYBq8/x+qCNlyUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nikwQOGlm2DeixC/WlNnMV5gCwjZK4Do0NYr2x3pOs3+ghjDjXWa0+gGFlpYwq6uQ980ErP9knO83hj9or6cotEhlCpjAoV0VZJeWrdIQRL415FAuHwfMi5CqeUx5J/mI2l5S2LMYn4CpRaltVwStLeWzsoCyOaF1mEYOSIO9cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XbOuIy3P; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60869c68926so8870247b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 10:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708452596; x=1709057396; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ0aDR9NVt9XM9NUkLl3BrBKP3ikJ6XdHk6DaL6OOv8=;
        b=XbOuIy3PzQdGq1vuBuXusNZzRQFuk9ekmoAubPtGhYEc2+O0n4HmpFiECuAs3yBaVY
         JroIRNASX2RdrgFM8IQF4lOMH0AszNy1H6ntOiIuAP04okhl+56qqEeM99YFNljSGGZL
         EPh03CBTSEd4405lXYAns4rqN2toZDvwLo1Tk8uACBKIkLKKe241ijXZAyjN6TGayi4e
         2X6GXht+7nXAnd8sAxf7DIvIUklzQFGRKCwu0NvBsgaywnVqzqsNKX2sqleneY531SeF
         fE/hfiJgaGG9/KZI/2RTrfCR48H060cT1iimE7iKSvK02JAXixrGE5ywbe/VDpJCnMwl
         vBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708452596; x=1709057396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJ0aDR9NVt9XM9NUkLl3BrBKP3ikJ6XdHk6DaL6OOv8=;
        b=eA7F2+YiS0ztMB4CpEdzMo7+812xBbThIRo0snhGg/FHgxS7vlnIELXB1c1T6zBAz+
         PzXrM1q+FBKywKLnMRgndu6ohSLd0ZlvtflSu6f41S0acEfGk/sD15NjEjmMO1UoTv/U
         70fk+0suv//e8B+gj0+rJ5IL1Fdiu82525Y2gcI48UEdCM6K5Xp3xv3W0AlgfBD81QeZ
         Qj57Py/+qwgfxEw9lbZaAQfAQNYY4OC8thENfXZEX0g1jx4iwsBuL4x87fqdH28gs+5g
         mnjDTi6toiwgnOri8Ajh/N0epeylH8UAJg/0+tCovS88sompB+zathDnFbecvyi1tL5E
         A4QQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8kFXnJkKM3ZZu1m+AkNG54IhVb8PbZQMxMJxdHAsNfmJS6UShHx5ZBjMtFKsx58LzDYTwMQ1YXolQWKQXWq+E/yZI06D1vKP6I4zssw==
X-Gm-Message-State: AOJu0YyzPoPiUnJfRiXp4YczoS3qUPv13/9Iq+Gy/CI6RyJf94dVgln6
	Y0f+gugxJeznT3/zePoTJ+RnvIXOf+ij+8OKCyY1vGrXgl4fCUJy/4tN+4HuFxiKYQIbvVJz8uE
	i35JJc4mYuwI4Qaq00HbQkPeqheky75oJV6jd+Q==
X-Google-Smtp-Source: AGHT+IFQeiHiIryJtC2om6c9aK4p9MZ4vJ/D8X0QgnxGrJvJytDUmw+oY9eK1dhe5485mH4cpPuSesAGuVShLB9++Qc=
X-Received: by 2002:a81:4f14:0:b0:608:664e:3bfb with SMTP id
 d20-20020a814f14000000b00608664e3bfbmr2360294ywb.40.1708452595734; Tue, 20
 Feb 2024 10:09:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-14-quic_parellan@quicinc.com> <CAA8EJppO4FcJJex8mBbPoDyUbkn4zFvDFR0h3sOY75Qth15Rng@mail.gmail.com>
 <30f383ce-0952-0dc1-a7a1-a7565526f728@quicinc.com>
In-Reply-To: <30f383ce-0952-0dc1-a7a1-a7565526f728@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 20:09:44 +0200
Message-ID: <CAA8EJpr4XKDQELhhnumqmH2Yh4qzh-gypR4tpRQ0eDhSB3U0Sw@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 19:55, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 2/17/2024 12:56 AM, Dmitry Baryshkov wrote:
> > On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:

> >> +       }
> >> +
> >> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> >> +       catalog = panel->catalog;
> >> +       dp_mode = &dp_panel->dp_mode;
> >> +
> >> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
> >> +
> >> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
> >> +       vsc_sdp_data.sdp_type = DP_SDP_VSC;
> >> +       vsc_sdp_data.revision = 0x05;
> >> +       vsc_sdp_data.length = 0x13;
> >> +
> >> +       /* VSC SDP Payload for DB16 */
> >> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
> >> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
> >> +
> >> +       /* VSC SDP Payload for DB17 */
> >> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
> >> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
> >> +
> >> +       /* VSC SDP Payload for DB18 */
> >> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
> >> +
> >> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &vsc_sdp, header);
> >> +       if (len < 0) {
> >> +               DRM_ERROR("unable to pack vsc sdp\n");
> >> +               return len;
> >> +       }
> > So, at this point we have the header data both in vsc_sdp.sdp_header
> > and in the packed header. The relationship between them becomes less
> > obvious. Could you please pack dp_sdp_header into u32[2] just before
> > writing it? It really makes little sense to pass both at the same
> > time.
>
>
> Just want to clear some stuff up. Do you want to call the
> dp_utils_pack_sdp_header() function right before
> dp_catalog_panel_send_vsc_sdp()? The point of putting the
> dp_utils_pack_sdp_header() function inside dp_utils_pack_vsc_sdp() is so
> that all of the packing could be in the same location. Although I agree
> that we are passing the same values twice, I believe that having it the
> way it is currently is better since it shows that the
> drm_dp_vsc_sdp_pack() and dp_utils_pack_sdp_header() are related since
> they're packing the data to the set of GENERIC0 registers.

I'm perfectly fine with dp_utils_pack_sdp_header() being called from
within dp_catalog_panel_send_vsc_sdp(). This way you are not passing
extra data and it is perfectly clear how the SDP header is handled
before being written to the hardware.


-- 
With best wishes
Dmitry

