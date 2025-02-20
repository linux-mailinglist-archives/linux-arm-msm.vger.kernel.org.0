Return-Path: <linux-arm-msm+bounces-48772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 113FDA3E895
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 00:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6E271891C45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 23:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9577B2638BC;
	Thu, 20 Feb 2025 23:34:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BEC2B9AA;
	Thu, 20 Feb 2025 23:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094479; cv=none; b=XHRxM83Qj30faeGgtoYLGfYvMszbrBXo3jILy+NH/vsmvzjM9KYyW33lNjJwF2ByZ9XM3g/skQ1Mr9LeBX4AdZO6ebyBQScDkiMbNahXqmpvynYrAojcPfqE5XD8pBTEtbjs/OPFQy2mSzschRZ1mI2xFmTAHa90xNVy5UJtyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094479; c=relaxed/simple;
	bh=RmTL664+E9b101DYy82GAYgyxzqzh4EGQLznka+womc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7ooUGV3mR7o7hUcLxh3SV/YbBrvFZUrmxlQCrkS9/SdupAwd8E/0HF+c4qScfXvXTzl8hBoLfvKguHPPW7hCOGQWzTeXS3AP880sveLWAHdO4XsWoCwkuvZx1I6CpDMil6xe/E4DF6nbYQyucdZQsUuQup5PL/UcSGF7uYc6t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 3664C1FBA0;
	Fri, 21 Feb 2025 00:34:35 +0100 (CET)
Date: Fri, 21 Feb 2025 00:34:33 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drm/msm/dpu: use single CTL if it is the only CTL
 returned by RM
Message-ID: <vkd5jhiqbp2rtts537jcxe54upm7xut53dixlsuhooqeaw4shi@bkkwknapc6qq>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-4-71ca67a564f8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dpu-active-ctl-v1-4-71ca67a564f8@linaro.org>

On 2025-02-20 12:26:21, Dmitry Baryshkov wrote:
> On DPU >= 5.0 CTL blocks were reworked in order to support using a
> single CTL for all outputs. In preparation of reworking the RM code to
> return single CTL make sure that dpu_encoder can cope with that.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..666a755dc74b41b79fa1bb2878339592478e4333 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1283,7 +1283,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  			return;
>  		}
>  
> -		phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
> +		/* Use first (and only) CTL if active CTLs are supported */
> +		if (num_ctl == 1)
> +			phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[0]);
> +		else
> +			phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
>  		if (!phys->hw_ctl) {
>  			DPU_ERROR_ENC(dpu_enc,
>  				"no ctl block assigned at idx: %d\n", i);
> 
> -- 
> 2.39.5
> 

