Return-Path: <linux-arm-msm+bounces-22636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68550907B0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 20:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BB171F222DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5C714A623;
	Thu, 13 Jun 2024 18:19:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429414A617;
	Thu, 13 Jun 2024 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718302765; cv=none; b=Ex8gWuupp2+trmfUgLRSGael0r1s9BX7QZyzBUqr/izDQCPT8vte1uHGqAPo1bMqQBHq54Q9UUAxS9thRmKbQTcBjOf10HSmnCO0keBuVyyApGY9eZdOOuTe/XtarnI/35jVGuC+/GPs/K79c1eFM9wC6q3Lhit7xcdnkMOHF+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718302765; c=relaxed/simple;
	bh=UFpVz14rCRBeMcW1vR8/OE6SZAoYVD0BbIZpbpKepe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOJurEQTwEwTnlh02erNuepR7C+djyqkyrZmLohJjq6eFlAsG/bhClpm4MGntr2Un9mM/WMl1wkzmUlD2Q6d7+mWY7t5J12u29fWvb/uK4LFvWIo8fdxrOd8YOxr1BnOVER4yFB33e6vzN85jQPdqCASTANDbaahCWXZpXvNmEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EC4943EA95;
	Thu, 13 Jun 2024 20:19:21 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:19:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: pull the is_cmd_mode out of
 _dpu_encoder_update_vsync_source()
Message-ID: <fcq5ik2gomsnzzmc6rtbotzakjtsfhdppzbirdgc7gx3bk6a2n@76oqtcqsfthb>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-4-67a0116b5366@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-4-67a0116b5366@linaro.org>

On 2024-06-13 20:05:07, Dmitry Baryshkov wrote:
> Setting vsync source makes sense only for DSI CMD panels. Pull the
> is_cmd_mode condition out of the function into the calling code, so that
> it becomes more explicit.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 4988a1029431..bd37a56b4d03 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -736,8 +736,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		return;
>  	}
>  
> -	if (hw_mdptop->ops.setup_vsync_source &&
> -			disp_info->is_cmd_mode) {
> +	if (hw_mdptop->ops.setup_vsync_source) {
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++)
>  			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
>  
> @@ -1226,7 +1225,8 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>  		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
>  			dpu_enc->cur_master->hw_mdptop);
>  
> -	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
> +	if (dpu_enc->disp_info.is_cmd_mode)
> +		_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>  
>  	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
>  			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
> 
> -- 
> 2.39.2
> 

