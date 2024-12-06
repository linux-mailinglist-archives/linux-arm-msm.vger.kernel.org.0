Return-Path: <linux-arm-msm+bounces-40733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE79E69DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09CEB18830D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA6C1B412D;
	Fri,  6 Dec 2024 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZodUlpF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727E1E1041
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733476465; cv=none; b=eEDAPnBgIMo64tsXjFtyHHMf68Pb28sp9s3gTolk6CfrfJ/yJjZnacVkae3F2kQ6OHIbRXPpl0nkDPuSOFojmC/wMtyh3LduLMrwd+Z28sfdMi3EmBvpA0rqCfaN/re2Rr675ahHba857Jz+nXWdaTiGJDG2jGCrH3Y6scUQfkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733476465; c=relaxed/simple;
	bh=+76EGiJeWs6t+QU/vQpduD+P6yD8IWzccXu/rvCpnpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQEf6QhzMBQ0v4xa4OJ1WFoESYT4lHiXpmmmTsNv2Ks0Shy39up7eo28NVqROFt78pkiGpiKU/sipSxN7EBDAJz7P4cSiXtj0LrYfrS5iFDkExlINLj3iRmSzq2rkPm1a58WdMIPBk7HSbY90LwIndVARmATeN30f1t5XehlgW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZodUlpF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffc7a2c5d5so18751341fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733476462; x=1734081262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nntj0vr3sSuMkDDvLjAvt9OkCo7KS9A001W3Zyy1XKs=;
        b=SZodUlpFtFLz+kaTjRjPNcugndstSIxV1fdRP9Fm2PAoIlpiwr5IzlIIDlliZ19LKq
         +FGzXqih1iHUcLSMW42X/fuDfMIXKzL0bGqIx0ZaG+egdaFllkNy3APj7S2SPdOnMscA
         BRplilCS/TVLBNMFgkfl31BxIpcIevhMKR7WSZjdOvclWttZmz/dKrF7bfjf+JVU1WD2
         BW0qikUBVNmt4pIIkWBvwC8gAOe2MGDY3b95shij+NuT6h7oZLv5zK/yyvxEEZsuRedE
         YeWLmHWDchN5u12Hr793wbxvJ1nF+QOPo+N7AnYED01VagCyjb9JfuekkQI8m1V5sGS3
         4Ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733476462; x=1734081262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nntj0vr3sSuMkDDvLjAvt9OkCo7KS9A001W3Zyy1XKs=;
        b=tH7RZHwKdV5iYnhXyYJg9Qcsw9zuJ7pni3ZeWuc0PlO/wY8ed6GgrSellboFtu+ZZ5
         VYQIdzrdu/H57cUXGVb8t3wfMPGwTqqbDQZMpOYbFX/gJ17Ep9GnNAm30D555z7j7vqE
         QFYm2HYH6WO5Q0N5xZsD0WxP9ug7Eixkj/Uily8BL0PP3Z6b/w7AlRRm6UHwie2lczdf
         bzWPORnB53PQx7lMZ8QH5qvyuM1r1o12xV+pk1LEayK5Uqajbm02B2LccSYU/SIqTXR6
         cI+WITSlHks5f6X1W5WM1Q5dQ6IeX7NqtrQlNoutHJW6aIdi4xe3zqlyxEOyEoMaWIfk
         2ZyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXonYL675OKhjsn/iEdhf/Kht0jmtnmlw7zF/hGdtAaY5UCdTpzRLQ8x4OA4ynyBcygJ58ageLHnc2RycrT@vger.kernel.org
X-Gm-Message-State: AOJu0YwWi/ijOX/ZpcsoH5BLqg2CXjfLwPD3IqD0JTa+y/nApQOTrSfp
	cZe5Arwcoc2HPF6eAf1omCxlu/TRNpxvBkvUsh2gRvbO0s7X5x5W6P+a5+2Ok0M=
X-Gm-Gg: ASbGnct+9zyJS7xHSmZALHR00ZW1L+XA+ZiiAnYCgcES7jsY+qbks3M4ORhgA0uh/97
	gSsp012hs0mLcNZTAXTbHg4YH+zXIiY0R7kcZJhVfQ3pbrqtBiQhL/geeb8cLDxIKjJaLoXBsZL
	C8M06QcWFZVkSir2SgpVI9CeCLinCkLN5/itlRjRKfC78W316+qx6gziVh8sLN96ipTjw+usv40
	C3u6j8lU7pAGGvB9YasfioJeRCehlQXvD5Msa+Y/cstcCzMaPOM1SUgUghsgKdc8XGb1HZLTIKi
	xI5fz+NnWv6YP93PznLqs3wQvJIbcw==
X-Google-Smtp-Source: AGHT+IGeULY30Ge8vUZIm0lr+henqDGul8jwzbkSBs8yjUR7FgUITuGkZXPcAseJRkhVj5nlhBQZqQ==
X-Received: by 2002:a2e:9a0e:0:b0:2ff:d0c4:5ffe with SMTP id 38308e7fff4ca-3002f8c4d83mr7019641fa.16.1733476461886;
        Fri, 06 Dec 2024 01:14:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e20581sm4050831fa.77.2024.12.06.01.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:14:20 -0800 (PST)
Date: Fri, 6 Dec 2024 11:14:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 11/45] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Message-ID: <iplgkmgma3li3jirsxlwr6mrbaepcfhqg2kuz44utvm56vwgpb@4ayjjqehmgw2>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-11-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-11-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:42PM -0800, Abhinav Kumar wrote:
> Split dp_ctrl_off() into stream and link parts so that for MST
> cases we can control the link and pixel parts separately.

Please start by describing the problem.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++--------------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
>  3 files changed, 7 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 118f5ed83e464f9f27f813eb39624f9c3189f5ac..485339eb998cc6c8c1e8ab0a88b5c5d6ef300a1f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1739,7 +1739,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	 * running. Add the global reset just before disabling the
>  	 * link clocks and core clocks.
>  	 */
> -	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
> +	msm_dp_ctrl_stream_clk_off(&ctrl->msm_dp_ctrl);
> +	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);

Huh? What happened with the rest of the msm_dp_ctrl_off() code sequence?
It got dropped, but the commit message tells nothing about it.

>  
>  	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
>  	if (ret) {
> @@ -2042,7 +2043,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	return ret;
>  }
>  
> -static void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  
> @@ -2110,30 +2111,6 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  		phy, phy->init_count, phy->power_count);
>  }
>  
> -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
> -{
> -	struct msm_dp_ctrl_private *ctrl;
> -	struct phy *phy;
> -
> -	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> -	phy = ctrl->phy;
> -
> -	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> -
> -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> -
> -	msm_dp_catalog_ctrl_reset(ctrl->catalog);
> -
> -	msm_dp_ctrl_stream_clk_off(msm_dp_ctrl);
> -
> -	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> -
> -	phy_power_off(phy);
> -	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
> -			phy, phy->init_count, phy->power_count);
> -}
> -
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 547155ffa50fbe2f3a1f2c2e1ee17420daf0f3da..887cf5a866f07cb9038887a0634d3e1a0375879c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c059f749c1f204deac9dfb0c56f537f5545d9acb..b0458bbc89e934ca33ed5af3f2a8ebca30b50824 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -911,7 +911,9 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (dp->link->sink_count == 0)
>  		msm_dp_ctrl_psm_config(dp->ctrl);
>  
> -	msm_dp_ctrl_off(dp->ctrl);
> +	msm_dp_ctrl_stream_clk_off(dp->ctrl);
> +
> +	msm_dp_ctrl_off_link(dp->ctrl);
>  
>  	/* re-init the PHY so that we can listen to Dongle disconnect */
>  	if (dp->link->sink_count == 0)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

