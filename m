Return-Path: <linux-arm-msm+bounces-7500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F7830CD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 19:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64E1D1F267D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 18:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17342374E;
	Wed, 17 Jan 2024 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AgxNDgrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACA021A15
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705516848; cv=none; b=iiyiRm9eoruY7gXK7Z5NVWlNmbkMGbw09rN++rJg06+H4xk6yrNxe0PZmpP+Cyu/P6tykfX+x//ASjrYifDjfc8zPDTAD84tcajHqYZSMirkzxCg9ICLkoRkRyONFiwUCH1woOf4XQ02F1rSVfkXSb5llDDpdy/sLBXZsERdreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705516848; c=relaxed/simple;
	bh=jiZKiB5TQckNN9zKjh3rw9Kof7QFp9LD8N+clmDHUxA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=JhOfD3GFac3XypP0XBT6ReYQ7rImEKKIn3jIJAl6yRjukw1qMn3pNL/me0kgVsgiflJiSwkgZh8vESmFm4JNV7nglRLIm1GD9HnBG3UGGpwoqBHapQW/FlUM0e3vDPNXl/tgzqER3jSF2HW2sXlT8OWl66kjQkCj2Ql/M1pi2RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AgxNDgrP; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc223f3dd5eso2028169276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705516846; x=1706121646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQziOnoabwrvBkO8mFhZ12paFF8gmB+VBE+mmqVmTwc=;
        b=AgxNDgrPygBaoUrb4oK2hyaUCIUSPkSi77l1/LdfpHr5TPdCr9zrxhI2a9Kvj/O0W1
         9gETWkIZJjkBIx5w8ElKD0dOI+X54vZlq+9kUfQrQGX9RGRBWxTK1kRXesJtZwTM/iK7
         Lo+9gqjQlzLEDSnbiI3bbDPDN9fAKwRRUNSWPDFjmYzOnh6DEc9R/5EpImmQMkOeenfC
         QL8eKSwDwtqhNO9tEwjRg+DtkpqjzydKAoYAKEaUjF+CTgrvi6jxEahXzNdEGZEg9guH
         dQTVOUmT5urnyLlCbYDoMv5O3KugTCNsE3MU6hP0ZX5AhrubuSbIMB/HUogc4a8WliRf
         engQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705516846; x=1706121646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQziOnoabwrvBkO8mFhZ12paFF8gmB+VBE+mmqVmTwc=;
        b=pkg56wmCUFctaBwLhLpJeLYD97beHlrHm5dHmzesCgjZSj2TVo0Gm8FYdRnIdnRC6Y
         CCcV7wfAkxA0Hy5cG/lzxiLFWqXwpvGBU9GtSkdQV8siLNdoNRc+8TYnwIN2ngSYuVgw
         1sQc2cD5bfWmc1PIQzOVZF+k/epcFqWWhZsQP4od6LCrVh/wrDq0eC9hpfcUOef4hUxL
         6cN0n/8V4Vt+BMiMq/Md5iPJWr4C6AcJc+z8djGiAgRfUwF2fndqJa/ROwIqBNH+9PDI
         yAjC6EQRbvCK46WYKsV/HgfAZfIC0/CbHpnEYffEHZV7m31qzdkzqBEahQepUXO05xRW
         +5DA==
X-Gm-Message-State: AOJu0Yy+Ji0Ccy6sMnrEsdXQbbin9CRlnCfNrnLksKvlVNCKowydddqg
	oOfA8ByWQ4xjfY/rIPnaJBujDLUivmPZQkEoDGFUQK8sOU+aZg==
X-Google-Smtp-Source: AGHT+IHdq74t1Y+Nl6vyEDwlZFdSgjbmClgj4fr8wHTyhe+8ffAIpbwrakjCzN/0lvZzUMFqIpr02V6uhYWXgkyC61k=
X-Received: by 2002:a5b:788:0:b0:dbd:b205:4078 with SMTP id
 b8-20020a5b0788000000b00dbdb2054078mr5777359ybq.101.1705516845649; Wed, 17
 Jan 2024 10:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1705514068-22394-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqO+SWYcCtH1hOVow18ZTbJ=qh0D68CEP1sGObdd3=ciA@mail.gmail.com> <33f9d97d-f0fb-96d7-eea9-c43c3a5a162e@quicinc.com>
In-Reply-To: <33f9d97d-f0fb-96d7-eea9-c43c3a5a162e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 20:40:34 +0200
Message-ID: <CAA8EJppWuUrjzmssh79JT3B4uDcc_WnKGhJoCNiG8NTw9xD6wg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: correct configure Colorimetry Indicator
 Field at MISC0
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jan 2024 at 20:29, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/17/2024 10:12 AM, Dmitry Baryshkov wrote:
> > On Wed, 17 Jan 2024 at 19:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At
> >> current implementation, at DP_TEST_DYNAMIC_RANGE_CEA case the
> > In the current implementation, in the ... case
> >
> >> Colorimetry Indicator Field is mistakenly left shifted one extra
> >> bit.
> > This doesn't make sense. You say that the value is mistakenly shifted,
> > but the shift is still in place in dp_catalog_ctrl_config_misc().
>
> The problem is at
>
>   link->dp_link.test_video.test_dyn_range =   (bp &
> DP_TEST_DYNAMIC_RANGE_CEA);   <== this from reading dpcd directly where
> ==> DP_TEST_DYNAMIC_RANGE_CEA  is   (1 << 3)
>
> within dp_catalog_ctrl_config_misc(), cc will be left shift one more bit.
> so that cc is totally is left shifted 4 bits (bit 4).
>
> at misc0, it should be bit 3 set only for CEA_RGB.

Yes. But your patch doesn't fix the shift (which is correct). You
patch fixes the value being written to that field.

>
> >
> >> This patch return correct value of colorimetry at
> >> dp_link_get_colorimetry_config() to fix this problem.
> > See Documentation/process/submitting-patches.rst#_describe_changes
> >
> >> Changes in V2:
> >> -- drop retrieving colorimetry from colorspace
> >> -- drop dr = link->dp_link.test_video.test_dyn_range assignment
> >>
> >> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_link.c | 11 ++++++-----
> >>   drivers/gpu/drm/msm/dp/dp_link.h |  3 +++
> >>   2 files changed, 9 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> >> index 98427d4..2e1bdaf 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> >> @@ -1082,7 +1082,7 @@ int dp_link_process_request(struct dp_link *dp_link)
> >>
> >>   int dp_link_get_colorimetry_config(struct dp_link *dp_link)
> >>   {
> >> -       u32 cc;
> >> +       u32 cc = DP_MISC0_LEGACY_RGB;
> >>          struct dp_link_private *link;
> >>
> >>          if (!dp_link) {
> >> @@ -1096,10 +1096,11 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
> >>           * Unless a video pattern CTS test is ongoing, use RGB_VESA
> >>           * Only RGB_VESA and RGB_CEA supported for now
> >>           */
> >> -       if (dp_link_is_video_pattern_requested(link))
> >> -               cc = link->dp_link.test_video.test_dyn_range;
> >> -       else
> >> -               cc = DP_TEST_DYNAMIC_RANGE_VESA;
> >> +       if (dp_link_is_video_pattern_requested(link)) {
> >> +               if (link->dp_link.test_video.test_dyn_range &
> >> +                                       DP_TEST_DYNAMIC_RANGE_CEA)
> >> +                       cc = DP_MISC0_CEA_RGB;
> >> +       }
> >>
> >>          return cc;
> >>   }
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
> >> index 9dd4dd9..fe8f716 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> >> @@ -12,6 +12,9 @@
> >>   #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
> >>   #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
> >>
> >> +#define DP_MISC0_LEGACY_RGB            0
> >> +#define DP_MISC0_CEA_RGB               0x04
> > These should go to dp_reg.h and should start with DP_MISC0_COLORIMETRY_CFG
> >
> >> +
> >>   struct dp_link_info {
> >>          unsigned char revision;
> >>          unsigned int rate;
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry

