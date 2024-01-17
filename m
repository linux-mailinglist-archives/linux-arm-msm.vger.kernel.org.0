Return-Path: <linux-arm-msm+bounces-7496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1983830C7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 19:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237CD1F23387
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 18:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A7422EFC;
	Wed, 17 Jan 2024 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRO51As9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635C22EE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705515161; cv=none; b=uwjLDYr5cKxeksBtKlcSIBN5h1bpJ42s+GT139Wl6JYK4YHTh/V6UR6DJifmthEHCNKormLXX7A+uJyeow63MALDfzmEG0Fjtb60VYQyRmt+tinZdxpPrjdtSIQRMF8cdI8RSdHHTlaMzs/yReFDUtpJuOc/cvxg7uI+sWERTq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705515161; c=relaxed/simple;
	bh=Fd/c6fJ7aFOX++ciY1b9gKkkQk9F17oGqhjYtNROr5w=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type; b=QfjqsB84SKKIJY7yRI4cPAshvNZ/iWGhBScYAN35Nu+WLk3Njxf7gcQz9GDb1P6BsOxnvOvY2cffSLhJEuaY/k9Wes/XtjpDTVsJLiyOdd77DHPVKdKpaD3qD95idDadlJ07QwE8gf/E5kpckRSR+q9XEobfE/JlLoSvkTcnfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRO51As9; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5ec7a5a4b34so119669737b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 10:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705515159; x=1706119959; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ9iGp7KbU9YOI2Xiw/kWOiOOP5HwW765+PQKI9u1WY=;
        b=RRO51As9CG2KtU7mqEflX4x5EJNc2BpBeBtJOtAFOKhKnhMoeseSYbfgSrkepSaaYb
         qevvSYbCetAs/dWz4uK5mKznxFOwhTw0KU3R0PbnidKPfD+44/U7ooLBREibR8pXPELI
         k6i4Y/+rWTgT8M3b6Bsb7jqEhr2HP12joYgx5o3tAVv3H6zuXnE36SRe32t4ckXFEa5x
         yYa14sNhQE8ldWCjG+HVHR7wqIoTz6NLUXo0VhvsFbS1cddhirmhbybTXboPVsqZXsP6
         UGY26Jje+4zDTSI6t/CsbgoPvAw7s6OEMyd9mYj/vXO0Bg/WgboHnQ/mmewAjt/5cqhb
         sLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705515159; x=1706119959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ9iGp7KbU9YOI2Xiw/kWOiOOP5HwW765+PQKI9u1WY=;
        b=Eek4Z4G2hJC3e8yFhvsPD3htqfIs4xfIO1XmFFuNFM4oGGOFUksOyasowS5NNAuWBg
         XZ3KRSy8mj691rH7rmahpC8t73dMjlw0LqaEroKZD8iUNclE9VgCUaGCeWdyQOvCkv9g
         tSYzozJa3xWT1W262gjABS1UTtT9FisJFS8XQDj1O4ywnsLN1IWeg6b9xw5kWYjmMOta
         CxNA47IWIcwQXt69FG0Cmbs4qRpqlqicxCoKOffkj2bOwdoIM2LXiyNmpGl4gcq9tdyX
         nO6yKIraj9cn+hXGgLeHLEmWUjrRIgLJ6GXkGHHdQSBOMgREyMowZ4x/Wnvbd6JjhXBr
         +9kw==
X-Gm-Message-State: AOJu0Ywksp1hhYn9GlCHOwlFx0pTw+4Sl20MmAg/apEgVrTrII7FEKKG
	nXA14HXxTfq2uJUMeFs46snRomQmBHC7aaqMKJdSAbRMGQsYLA==
X-Google-Smtp-Source: AGHT+IFkh7uNNJqFCQZmQOQJTDWfRSauz7es7f6BhnoY9dO+BCxZs4hu5/U9+DmfwNxH1z70lQy1YBaP6HpodK4efr4=
X-Received: by 2002:a81:99c3:0:b0:5ea:1eb8:c37 with SMTP id
 q186-20020a8199c3000000b005ea1eb80c37mr6327524ywg.24.1705515159162; Wed, 17
 Jan 2024 10:12:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1705514068-22394-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1705514068-22394-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 20:12:28 +0200
Message-ID: <CAA8EJpqO+SWYcCtH1hOVow18ZTbJ=qh0D68CEP1sGObdd3=ciA@mail.gmail.com>
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

On Wed, 17 Jan 2024 at 19:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At
> current implementation, at DP_TEST_DYNAMIC_RANGE_CEA case the

In the current implementation, in the ... case

> Colorimetry Indicator Field is mistakenly left shifted one extra
> bit.

This doesn't make sense. You say that the value is mistakenly shifted,
but the shift is still in place in dp_catalog_ctrl_config_misc().

> This patch return correct value of colorimetry at
> dp_link_get_colorimetry_config() to fix this problem.

See Documentation/process/submitting-patches.rst#_describe_changes

>
> Changes in V2:
> -- drop retrieving colorimetry from colorspace
> -- drop dr = link->dp_link.test_video.test_dyn_range assignment
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 11 ++++++-----
>  drivers/gpu/drm/msm/dp/dp_link.h |  3 +++
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 98427d4..2e1bdaf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1082,7 +1082,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>
>  int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>  {
> -       u32 cc;
> +       u32 cc = DP_MISC0_LEGACY_RGB;
>         struct dp_link_private *link;
>
>         if (!dp_link) {
> @@ -1096,10 +1096,11 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>          * Unless a video pattern CTS test is ongoing, use RGB_VESA
>          * Only RGB_VESA and RGB_CEA supported for now
>          */
> -       if (dp_link_is_video_pattern_requested(link))
> -               cc = link->dp_link.test_video.test_dyn_range;
> -       else
> -               cc = DP_TEST_DYNAMIC_RANGE_VESA;
> +       if (dp_link_is_video_pattern_requested(link)) {
> +               if (link->dp_link.test_video.test_dyn_range &
> +                                       DP_TEST_DYNAMIC_RANGE_CEA)
> +                       cc = DP_MISC0_CEA_RGB;
> +       }
>
>         return cc;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
> index 9dd4dd9..fe8f716 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> @@ -12,6 +12,9 @@
>  #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
>  #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
>
> +#define DP_MISC0_LEGACY_RGB            0
> +#define DP_MISC0_CEA_RGB               0x04

These should go to dp_reg.h and should start with DP_MISC0_COLORIMETRY_CFG

> +
>  struct dp_link_info {
>         unsigned char revision;
>         unsigned int rate;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

