Return-Path: <linux-arm-msm+bounces-27125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435793DF6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 14:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FDC81C209F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710086F30B;
	Sat, 27 Jul 2024 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nrlcOLIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20BD3A1C9
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722084728; cv=none; b=PZQWcTpZHzeBj8U3FzyrhQZm1UwP8J/CWtt759kSGypfnfWLa51hz+5q55dtE9dZLFydrzMkf1wb32AnM9QTkicQDq30rdkM9hktpN8K/HtnNKr0aJeF3AJRShGwAb4N6SzQNNbFijJi8IN0Z+TPOQW43HvM6/MBrnk8M4upQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722084728; c=relaxed/simple;
	bh=lSWfdgZLpPAyHeO1G2Ngy1BGnQnduvZK/yTk52Mvfgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYbmdVYu9rbfW4D+dYgWhq5pj9CvH3HzphbfaXh3IMl0dkeC5m082cblcvHSBNoOzcnIk9VcZeG3i1hTsdF7egXsGN3PNi0dz3lggX8izYnBNtIpjADuBuCw1huYZrdqquokXlULrudXYOmo/eWNzOa3xFaR2X6DyW9WtqE5LHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nrlcOLIm; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-66a1842b452so3540977b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722084726; x=1722689526; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxwI+BF04Fun71O/+zyaVLE4ENb0bE6poonk4EgAFQ4=;
        b=nrlcOLImciQGPs2GduAXe9vXpk0aGabOIpZrJVnh+bwtT7anY0CaF1CNLpk/HLv4yv
         Rnv8bOB+COOuBkOAmDjd0jacSNaCIR8T81PyJqVyuDV4anBKGQZoK9/1/11LlMQ4A3TA
         xuJT5aLwYw+w/EgMnfUTdHuiK7QWkA18hBWPMyRRLZn8iv08aPSCrYaYL3Bu4WOJUyqJ
         u/b5ak8BEgCxXBlRquI4i4NAori1Woxw6eH+QqnsAveyorl5SwXLNxk5H7qfeXZB23y7
         SgCQsqQsG+j/4btI/MvnVtwAJFgs2R0O4U3JVaGhpwEkSbC4bTaqBbXp2OaAUy4dNU0c
         oNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722084726; x=1722689526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxwI+BF04Fun71O/+zyaVLE4ENb0bE6poonk4EgAFQ4=;
        b=Eu71TYx0Dnfloe/qYBa97mj3JEe6zmvr2xZLyF25UsDecrkOGB9cEy5ERgX+6wI4LV
         2Iwl1SdmR561eBzV6aPBa144NbzRKlDq24IXvDXM16vkHu10kn98NVh5ZXqKPFzooyCC
         yjl35O5oSvPpy0wzTPUd8vqSdGqmUHXNDTUyLO2NC1aMEJiZWp4UnEav3uSylBDpq/e3
         R8lIEG/7KOkOGVvOv3Q7BDOJlfS8v5qkY6fyKkvHRMeSyOjCzV77VaGU33bIBPrQuqtn
         5RGIbdgRDnMFO2CyaSBUeSGCx1gluwhfkOh/QqFQlghjdn01EIwLhT5UJrwuCfNw7PYv
         zYFA==
X-Forwarded-Encrypted: i=1; AJvYcCUg1lBOTOUhNXd8BYXTZhbaIPujIrlpcnUYNNoODnarlTDovlEVvvap5tcMPrW1oRDDErlvID7KCEVJJyxltQ2VPPyV6f3q+51q5QTcfQ==
X-Gm-Message-State: AOJu0YzVAaSiegiltKrmXlDbO6Okb62WFzakkMivOwIxifcUy+C7IJdP
	TuknNlNMzWSsXTkpimVM0H4i9+uN+MEGT6k85nDNUIMZg7AmMLTZ7rwpUYNFNRub1RQbEv4QQC9
	9P+yTi6NHl7ncHTRUdJKKzBz+V2Pt4X5Eph2IIA==
X-Google-Smtp-Source: AGHT+IEDKPNFNODeNrgJWmlfw38zwxZ+Y+DGJZtlBMJO4eyj7EUsw2gsxBSghNaHzBTxF4I0ABOrfpiNWu8XhZZ8WmQ=
X-Received: by 2002:a05:690c:23c1:b0:62c:c62e:e0db with SMTP id
 00721157ae682-67a0a60d465mr33584997b3.44.1722084725792; Sat, 27 Jul 2024
 05:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jul 2024 15:51:54 +0300
Message-ID: <CAA8EJpoYqHnG_=jt6Lo6v7a7h3CdF66bKqRf63RCmvqHWb4kFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <groeck@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, Vara Reddy <quic_varar@quicinc.com>, 
	Stephen Boyd <swboyd@chromium.org>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, abel.vesa@linaro.org, 
	quic_khsieh@quicinc.com, Rob Clark <robdclark@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jul 2024 at 01:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Currently the DP driver hard-codes the max supported bpp to 30.
> This is incorrect because the number of lanes and max data rate
> supported by the lanes need to be taken into account.
>
> Replace the hardcoded limit with the appropriate math which accounts
> for the accurate number of lanes and max data rate.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index a916b5f3b317..56ce5e4008f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -397,6 +397,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>  {
>         struct drm_display_mode *drm_mode;
>         struct dp_panel_private *panel;
> +       u32 max_supported_bpp;
>
>         drm_mode = &dp_panel->dp_mode.drm_mode;
>
> @@ -423,8 +424,10 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>                                 drm_mode->clock);
>         drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
>
> -       dp_panel->dp_mode.bpp = max_t(u32, 18,
> -                               min_t(u32, dp_panel->dp_mode.bpp, 30));
> +       max_supported_bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
> +                                                 dp_panel->dp_mode.drm_mode.clock);
> +       dp_panel->dp_mode.bpp = max_t(u32, 18, max_supported_bpp);

I think that in mode_valid() the driver should filter out modes that
result in BPP being less than 18. Then the max_t can be dropped
completely.

Nevertheless this indeed fixes an issue with the screen corruption,
this is great!

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK

> +
>         drm_dbg_dp(panel->drm_dev, "updated bpp = %d\n",
>                                 dp_panel->dp_mode.bpp);
>
> --
> 2.44.0
>


-- 
With best wishes
Dmitry

