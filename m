Return-Path: <linux-arm-msm+bounces-47832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F324A3338F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA9316227D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B8C261364;
	Wed, 12 Feb 2025 23:41:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950CB263C84
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739403671; cv=none; b=YvvCnArH4Lby5ikuYHCZ4DpOQP9p9oMWu0+HItzdto1msg51EM8UuseQQehBixX7wbGh2f9Bg8fJ+kxCUsoi/hE3H2VIz27JD6/Lt+JHZxbIk0Xrgs2mL/luxKbA8phxSC/OoaI6RVNuXLk8FOl6pVCADqhg8N28YYatIibEzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739403671; c=relaxed/simple;
	bh=iHEpu6QBdIxhAvvM7e01gP7ViCjNAveuZK9L8FxBjYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnNEHOZC8k2ijtqZLQD1bly6Gz3rOnumPDmAyMpkRxQVUXn38Ur2y4sRUCVmYxeUY03EZcNb/3rkseaNEaSYuPQUZ2bkc5Wjnu4GuzmyVURKDbuSs8dbnu2Pk4rz8xysBZtS0S2ZcOWE/VivGjiSIWi5AMLVhla+8F1sj4WwBVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 82D202015E;
	Thu, 13 Feb 2025 00:41:04 +0100 (CET)
Date: Thu, 13 Feb 2025 00:41:02 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Disable wide bus support for SDM845
Message-ID: <voecekzdacvrxedltgkiq5vwnaomchv2dryi6ukvk2xynw72wp@5nre7uesyvkk>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-1-4954e51458f4@gmail.com>

On 2025-02-12 15:03:46, James A. MacInnes wrote:
> SDM845 DPU hardware is rev 4.0.0 per hardware documents.
> Original patch to enable wide_bus operation did not take into account
> the SDM845 and it got carried over by accident.
> 
> - Incorrect setting caused inoperable DisplayPort.
> - Corrected by separating SDM845 into its own descriptor.

If anything I'd have appreciated to see our conversation in v1 pasted here
verbatim which is of the right verbosity to explain this.  I can't do much with
a list of two items.

I don't have a clearer way of explaining what all I find confusing about this
description, so let me propose what I would have written if this was my patch
instead:

	When widebus was enabled for DisplayPort in commit c7c412202623 ("drm/msm/dp:
	enable widebus on all relevant chipsets") it was clarified that it is only
	supported on DPU 5.0.0 onwards which includes SC7180 on DPU revision 6.2.
	However, this patch missed that the description structure for SC7180 is also
	reused for SDM845 (because of identical io_start address) which is only DPU
	4.0.0, leading to a wrongly enbled widebus feature and corruption on that
	platform.

	Create a separate msm_dp_desc_sdm845 structure for this SoC compatible,
	with the wide_bus_supported flag turned off.

	Note that no other DisplayPort compatibles currently exist for SoCs older
	than DPU 4.0.0 besides SDM845.

Hope I'm not considered being too picky.  I first sketch **how** the original
patch created a problem, then explain how this patch is intending to fix it,
and finally describe that we went a step further and ensured no other SoCs
are suffering from a similar problem.

- Marijn

> 
> Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant chipsets")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index aff51bb973eb..e30cccd63910 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -126,6 +126,11 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{}
>  };
>  
> +static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> +	{}
> +};
> +
>  static const struct msm_dp_desc msm_dp_desc_sc7180[] = {
>  	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{}
> @@ -178,7 +183,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>  	{ .compatible = "qcom,sc8180x-edp", .data = &msm_dp_desc_sc8180x },
>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
> -	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sc7180 },
> +	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
>  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> 
> -- 
> 2.43.0
> 

