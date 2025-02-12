Return-Path: <linux-arm-msm+bounces-47730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C9A32322
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DADDB7A511A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41732080E4;
	Wed, 12 Feb 2025 10:03:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47294206F3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354633; cv=none; b=mLYIJhor+0YftNdBBtCpk8zSQtmNh/QM6qUT3C+EZu7DqbiRj4pOcf9H0wVUl8hP0xa5Qr2O+JHJcIYrNh6u3RF3EabnxoFctPlxk4faJkWZjhpb/ICoBc4/0fkRLKExfh4NQ48ZKP/tmiMKe88z8V0wIqDP5VBDQTydTPO8Vrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354633; c=relaxed/simple;
	bh=wuj0iG1Z/7DDo1uuo7RxJ1HwxHsqkrQ7nsXo/GxX9OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiEdq9xG2V/qq0kgekt94njrzqOoivQjER/ZbvLLgyu9uaZY1J3OhAj+fD3U55Vsn6HjVUKxYdC+45Ac2SSLx+NdArrwfuYYzKbInfHUN41H3uYN4ONTBoLstisv0urw4iZJ04IZQa1XWPtRArR/IyRDQ9iz8J1Eq+66LwFZ5Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B3D2F3F60B;
	Wed, 12 Feb 2025 11:03:40 +0100 (CET)
Date: Wed, 12 Feb 2025 11:03:39 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, 
	sean@poorly.run, airlied@gmail.com, simona@ffwll.ch
Subject: Re: [PATCH 1/2] drm/msm/dp: Disable wide bus support for SDM845
Message-ID: <vl6cfjpckgndu5nacw3o5wvdfwaijactokby6q2lywcdccicgz@k27my3352m2k>
References: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
 <20250212034225.2565069-2-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212034225.2565069-2-james.a.macinnes@gmail.com>

On 2025-02-11 19:42:24, James A. MacInnes wrote:
> SDM845 DPU hardware is rev 4.0.0 per hardware document.

Just checking: version 4.0.0 is not named in the code that you're changing: are
you mentioning this because the patch you're fixing here [1] says that widebus
is "recommended" on 5.x.x which includes sc7180, yet didn't account for that
sc7180_dp_descs also being used in the SDM845 compatible which is 4.0.0?  That
is something worth mentioning in the patch description.

[1]: https://lore.kernel.org/linux-arm-msm/20240730195012.2595980-1-quic_abhinavk@quicinc.com/

> 
> Incorrect setting caused inop displayport.

Inop doesn't seem to be a common abbreviation, there's enough space to spell
out "inoperative".  And spend some more words on _why_ this is an "incorrect
setting" in the first place  (based on the suggestion above)?

I am trying to remember the details from the original widebus series: we
discussed that the INTF_CFG2_DATABUS_WIDEN flag was available starting with DPU
4.0.0 (IIRC, cannot find the source), yet the DSI host only supports it from
6G v2.5 onwards (SC7280 and up?) [2].  Seems a similar limitation applies to
DP hosts.

[2]: https://lore.kernel.org/linux-arm-msm/20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com/

> Corrected by separating SDM845 to own descriptor.

its own*

> 
> Fixes: c7c412202623 ("drm/msm/dp: enable widebus on all relevant chipsets")
> 

No need for empty lines between trailing tags.

> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index aff51bb973eb..2cbdbf85a85c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -126,6 +126,11 @@ static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>  	{}
>  };
>  
> +static const struct msm_dp_desc msm_dp_desc_sdm845[] = {
> +	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = false },

We can probably drop the assignment, it'll be false/0 by default.

- Marijn

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
> -- 
> 2.43.0
> 

