Return-Path: <linux-arm-msm+bounces-41684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBA29EE1F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 09:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 776C41674AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F025420E014;
	Thu, 12 Dec 2024 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8adq32W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F220E013
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733993644; cv=none; b=Es3STlOkA5g6r+NSuNWrilEEYg54ihVcqXA5BXMryKgZMgCvaUpFvsYE+evVthfMTcZSiB8rwQRJVhX6PNSxNs+o5gWSiHe+MeuchkxOMF4c8v+WKdEIz1avgmVqdrEXksRU8m44Li20Kbq3Bj8KDyJvPICi27KOeSA1KPrBFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733993644; c=relaxed/simple;
	bh=vxG+vIny/Ex4Q4+6KynwFZL0ooo3HUvHYTBHdsZtuFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMC5MbNGxnn/JI66MmJZUHbua/iO1HeeOK8kADePuKHiVPQYCNFfDVH+wTOTIKLOmxiqXls+PFgE7yGa064zzNAPszfcK2uyZLxPA+rC3j5KlR162HrkY44n/9EmkW+yspqxtBD9F+TIWd83LpwQwuso2zSz/C4DuA88okQ2/bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8adq32W; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ef6ffcc2dcso11377717b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733993642; x=1734598442; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5B1z5PnAzxL6smT59ljrPqXpw5NGYGq2kaikYQzEn3g=;
        b=M8adq32WGHb4WPDFb+h6mci4umUVnskcSqiId0WGD2MywSsn+M6UD/yprqiwyWqs/8
         827hzulY5XV/pDgpADr0g2X4cb9tAblWGfyeGBjvj+QFchVOgKqxfn0tjQb/yHPt1h6S
         JEv5Oq0BmlBDH1EDTrsMbFxMKtu2WNjy1Gv+YHlg7Hn6FwT22DaMsRB/fqv4aNpShYVf
         qQuzKbUjqPUItNSkFyOBdgbsmcry7NDrDFkd110/zQZHOhK/4sD0C/oRNgQ1hcO1g+9z
         OtRkN3hkrdKOSb7Yfceug1ggHq5xlafJszlLMJnBHTyEymc6Gh1S4kU2v57i/NhOM5eq
         FONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733993642; x=1734598442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5B1z5PnAzxL6smT59ljrPqXpw5NGYGq2kaikYQzEn3g=;
        b=Ya0rcJLB4X48F8LPoZ6Ic8gcw79B0r7ItP97tS9+fOjVPSVoD8wJvR4ZY1DSmNeccY
         btvkRDsDPhJ9yoRA7f0bPQMpNBwhSqlVHSbNKxZwJYJ+lmYsWnv44JZF5POVGcwrO8bv
         LMXedP8M/rYWwnsUI+TDnLglBns/mB0KXrjCV7sqFtPwsokE5ugcY48qjm/wCC1TdOqB
         tddoy64vcUR+DhSxkiZc2Dn4Ib1FA3T0sUKXw1VYcr1jB9qVxBADopkRH0+2q5pKnvAp
         ycFmwZMRrIXOb9ZuMfdLQOwH7tjsK+Dvp0m/TPYb1vCLUKPAWdTh9NhK2rjzqDSWqIyi
         GI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1FltdQGU92nnLb41uLfIMe1TH3psKjEdOOfnvauGQRU+zsByXqdrj6+Aq76rmzw1pQkQsMp4UI7MQfYzC@vger.kernel.org
X-Gm-Message-State: AOJu0YwBMdIUtbZJJw/cAw1OzgnjI6XclA9900N/ytWvigwQdG0ksJiE
	OKhJ/FeJAXIYQjU0uMvfH8W+U6Anbklcxz4jPoXSZ4+bt2Fkjx4xffl73ZpOLsdHPaN3EQOBxZI
	+YLsocODxy7vt0YGWdr8NJalxssxdX1gtvdtG/g==
X-Gm-Gg: ASbGncu/+bBHhgBhyNSDZgFm+/3hujVHPsWVtYm1RzE/dX5DqbTWi3WA5k8MtJePOic
	9AVdNgE1KaJjq4vpWBpz6RLufteFWbunvd8oWCQ==
X-Google-Smtp-Source: AGHT+IHIjDAY0CeMFb8m9TSevBaBVTCKqRFyfh+kNjImU1zEaK3nbhnQly/UvFHprufd4KmZu0cAQ8h+MllCdzsOhPY=
X-Received: by 2002:a05:690c:6112:b0:6ee:8088:831d with SMTP id
 00721157ae682-6f1b393fba6mr22967987b3.3.1733993642309; Thu, 12 Dec 2024
 00:54:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org> <f8f9d726-0428-42a7-9f8a-db10641550ae@quicinc.com>
In-Reply-To: <f8f9d726-0428-42a7-9f8a-db10641550ae@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:53:52 +0200
Message-ID: <CAA8EJpqxXB6YqajHziENuJMXfR1eg-qgiv_o2Y3-ZrL-Bm_qNw@mail.gmail.com>
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

On Thu, 12 Dec 2024 at 05:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> > to program audio packet data. Use 0 as Packet ID, as it was not
> > programmed earlier.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c | 288 +++++++++-----------------------------
> >   1 file changed, 66 insertions(+), 222 deletions(-)
> >
>
> Please confirm if dp audio was re-tested after this change. I would
> prefer its retested.

Yes

-- 
With best wishes
Dmitry

