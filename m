Return-Path: <linux-arm-msm+bounces-17659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9BA8A7E08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 10:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FB871F21875
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 08:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAE980626;
	Wed, 17 Apr 2024 08:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y1RmVZYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F007D3F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341953; cv=none; b=o6V2BjJPcEDPnHMeIzWOD3FZiDhlxivHwRZl0bK82oX8vOUr16CIUQ/ttot4dzfA9IVzo/o5SxmEwklSKoa2y7GZ92vshPke/W5geQR63Q40T2zTpaII2LHEz0Y35cL73OSqahQV12zKEPSofNDljt6r6kfy0otKtz1N7gj78xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341953; c=relaxed/simple;
	bh=lDaoE5I35Sw8X4gTfjGCdgl4sZqMgly1ov1PL+Jq3Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+OVa+HSP8jq7ZYUct2GDdL5c6v5oJ5/a4FBS+nYBshWgPYWkha1tpRRFCWOASy1jD4jH3kAACCzBusjAyDbuZISWfwrl7j8euDMecXHi1Irc0UoPJRQjTmizo+epBgKlKZ7Ve3pjhPmN/SrBxV1RbKoZf3RU5CFX+WQxMaqUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y1RmVZYp; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-617d25b2bc4so58361597b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713341950; x=1713946750; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3LRcCO7G0BAlsPsSHwaDpD7NJg45TvAyn9+yoAIm8Y8=;
        b=y1RmVZYpbukWu0GnYfSD9kz0+CsF1ty3mbs6pqJJpqMqFuQVySjdt9bHm4323SwDm/
         uR9NNaLFWYxNuVP+jtgeXt0RR0TIsZIWXPHiTRFilNIcNLtepzFjp1aogA0ifXjwRRtP
         6j7PCEnJ7r8tFzRB1h9jbAHCXieJhzfSEvucOOceRGnP9MXcPnP2X6Wbdt710VD4uO7q
         7i3lWEUoSNh197YHlzBAfqR8op1ndiUn9a1eiiJzWBX3jebkkWZo35Z0DpzJEywNXueJ
         RDTK0JzWAPZD8SBMW5lU+qsx+Ar3cpvCvL+wF2G/W+asVraJhcH/hdiNJKPqN4jDDlGt
         Q0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713341950; x=1713946750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LRcCO7G0BAlsPsSHwaDpD7NJg45TvAyn9+yoAIm8Y8=;
        b=P7QpK0tmUut7PfTSREIUznPH7ixQLWr9T0ouMR2PIw+EOkUXwbOyRWULmljOeh7/oQ
         bjzt7ETbZ1HrQr4TrcmUgcZkVBTmQpl8fh7birfAUNC08m4DcyDj/j4awk+QPyd4hMIi
         HwJASWODISyy5b3nSejY/fR3BFdTmuoRX/st5T28txqSodfONKe+5mR/XY1kNpL0Uirk
         wJBcgABHvcmzb/8QmlME+wC6Irdr0lTcLinMFC5xoP5Oh/vsD6eA8zAQCCmERt6/rF9U
         J1DcbkPqcZKH7CRTN1lFo4ugtWhzgS680yQrWmWI+bR4r0aHPeO9xc6+DctvWAZ8oeVz
         DG9w==
X-Forwarded-Encrypted: i=1; AJvYcCVFA+0YYvRSTh6DdPV4rXecxbO2smzhk5LJftujI1Ait1jD3Nm1X/lfFR9uX9Ys0q2IYEwehkHSRR45VcFepybOCZM5tCeqm2YArKvftA==
X-Gm-Message-State: AOJu0Yznghizq63HETTgHC2sGgt+0M2J8T3iTD/lQBaS9IRr2P0onDTL
	B57xMYfhtz3DzdV7eqBqv0qOGT9PglctkMaer6uwYTf3v3fO9KAZHNeG7nPJQi/hui+/e3dbIoZ
	qAnFZTmEm6psYcdnUlBC3ViFRV4ASHY+9VWhHOA==
X-Google-Smtp-Source: AGHT+IE2lKg2BSkdW3aFZxTMV4gr/x3dbq3U7YbGvWBPNOlVvmP5HPCh/lfty+hy19RjhqRJv46ueaHdDZUJSm/+bS0=
X-Received: by 2002:a81:430f:0:b0:615:1e99:bd6e with SMTP id
 q15-20020a81430f000000b006151e99bd6emr14355086ywa.35.1713341949713; Wed, 17
 Apr 2024 01:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-6-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-6-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 11:18:58 +0300
Message-ID: <CAA8EJpry5Gct7Q2sAwFBVYV163X9BOcuKu9So47FEJaeXcdSaQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/msm/dsi: Set PHY usescase before registering DSI host
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Archit Taneja <architt@codeaurora.org>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Ordering issues here cause an uninitalized (default STANDALONE)
> usecase to be programmed (which appears to be a MUX) in some cases
> when msm_dsi_host_register() is called, leading to the slave PLL in
> bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
>
> This should seemingly not be a problem as the actual dispcc clocks from
> DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> bit still seems to have an effect on them somehow and causes the right
> side of the panel controlled by DSI1 to not function.
>
> In an ideal world this code is refactored to no longer have such
> error-prone calls "across subsystems", and instead model the "PLL src"
> register field as a regular mux so that changing the clock parents
> programmatically or in DTS via `assigned-clock-parents` has the
> desired effect.
> But for the avid reader, the clocks that we *are* muxing into DSI0's
> tree are way further down, so if this bit turns out to be a simple mux
> between dsiXvco and out_div, that shouldn't have any effect as this
> whole tree is off anyway.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index af2a287cb3bd..17f43b3c0494 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -85,6 +85,17 @@ static int dsi_mgr_setup_components(int id)
>                                                         msm_dsi : other_dsi;
>                 struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
>                                                         other_dsi : msm_dsi;
> +
> +               /* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode.
> +                *
> +                * Set the usecase before calling msm_dsi_host_register() to prevent it from
> +                * enabling and configuring the usecase (which is just a mux bit) first.
> +                */
> +               msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> +                                       MSM_DSI_PHY_MASTER);
> +               msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> +                                       MSM_DSI_PHY_SLAVE);
> +
>                 /* Register slave host first, so that slave DSI device
>                  * has a chance to probe, and do not block the master
>                  * DSI device's probe.
> @@ -100,10 +111,6 @@ static int dsi_mgr_setup_components(int id)
>                         return ret;
>
>                 /* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> -               msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> -                                       MSM_DSI_PHY_MASTER);
> -               msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> -                                       MSM_DSI_PHY_SLAVE);
>                 msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>                 msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);

Please move msm_dsi_host_set_phy_mode() calls too. Also please update
the non-bonded case.

>         }
>
> --
> 2.44.0
>


-- 
With best wishes
Dmitry

