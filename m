Return-Path: <linux-arm-msm+bounces-17780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 989F38A8F66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 01:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BDBA1F219EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 23:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1D685C7D;
	Wed, 17 Apr 2024 23:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmQQJJfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DB2147C78
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 23:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713396790; cv=none; b=EjamX4lYzryC17IOGW48Oc4Qx+ZA1L6l9So7QA1A4eZI2l7saP2aNg1WX6nBvQf8SwKIS+M/DphdHr89NbNQWVXnUfvWMKuyAhWimrinbly2lnOAe7Wr0nWAlUZui3XsZgj3KGSD6jsV7lCoFeAUhhflKB+pdnftObN4Tw52pOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713396790; c=relaxed/simple;
	bh=F0mBqWZiiOdCg3f4DoGJPTXC8lMSKQdH2gEVKgPiLGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVREKLesExGzBsByM4ch56U2siaLp8qvf9JFXcXyHRqxIfhqrdZVC86Z+htfeSEzzKzL9E/qn60u2i4nOEIcFp3xVrQR6LqF0vTYtPkXL6//8vMIbwkrbqlwDdoz+UadAUIxWRmHiiLHg/3vDk3bL05FsQHAEue4pnfG/mpqDYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmQQJJfv; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-519661ebd59so330803e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713396786; x=1714001586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GytF7V18qJIXql1WNL67e4Efwso8d/2I3bcLgaa+9g4=;
        b=GmQQJJfvx+3SBOD3c5Er7SGomMRhe7dbKTPSUgeAoDGFS5xxtETza4Y2AimRuYVBOS
         9ONaRoHHhaQi4WodlVS2dnX+e8F3FdikApQ5qiZeOW9HhdClIuV4RUkC+EpEaq5oitpe
         gUZuw8Op2Eht+JzzGUi1FBEFeiHGXvC0ulRHLXe5VXGuoPosbnnD2AypMd4t04j5dFHt
         +cGYpGn1OTwdgwd74uy3V1hXvPLyg6gtERLiJwZkbNGDKGlmC1DjVTXwv1nLJipnDdyw
         w5s2GmY6d4Xcjvma3KZ1sbJ97jOZVXcYyyU9ZjI90c+m+NsPQZ4GW8VNOsi1KlrK469Q
         72zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713396786; x=1714001586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GytF7V18qJIXql1WNL67e4Efwso8d/2I3bcLgaa+9g4=;
        b=heeXZnhPy90iOGIQ3Hcl8WCEGjq3n/xmY3OwPVK9vgdzkfkbafWZkTZndmv74ueN1l
         WmcxGU2KnoB8t2ZC1rVAk3lWBH2zLve6C9mP8V1Xx1Zu/tcZ/RZkjEN8dXeLrzOuW7cP
         UiwMPhHsWvUQCbpozWkAxT4hP+kLgAnlgqYq2KtZ53uI0ms9N5WZECMWshqQTKRaqH5a
         1aOQYrO98928IcVztiGNStXnyacEKokFvS8uiaxSD40OnhNYkfWv1zO8tJm2oakyDDmS
         bymzVUVR+mtUz2Qx+CKMfjbzy/b0R+fJ2o+l86p+T2bN/4aBOE1SLa3QAs/f/pEBufJ7
         goWg==
X-Forwarded-Encrypted: i=1; AJvYcCXKYACWF/o6VfND4izZDaU/gYECZwJiK059qVToAL6HQgTGdEVG47hcllF+He4H2i/urEk/4bligOpcczmkShBdN2OMwyHALHrUchxrMQ==
X-Gm-Message-State: AOJu0Yxt5kPHU/VBB/ktdQxdx1I+kKsM6qWADJY3oTtpNeCx0hDjeUja
	fVuJsBW80Wlqqlmi23aV9LdvYuxvSVsn2KmEQJ1iLsBSC1E+bM5Qdz08AUmuRdY=
X-Google-Smtp-Source: AGHT+IHb+xsUm4VWJnMlwMtid9HXu7fUVpDqeCABMYuWcpnukoEv8gokW3GsekdP+AHyE8ovJem9iw==
X-Received: by 2002:a19:914c:0:b0:519:5fb9:832b with SMTP id y12-20020a19914c000000b005195fb9832bmr122358lfj.12.1713396786144;
        Wed, 17 Apr 2024 16:33:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id e4-20020ac25464000000b00515d1c97053sm33367lfn.223.2024.04.17.16.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:33:05 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:33:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
	Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 7/7] drm/msm/dpu: Rename `ctx` parameter to `intf` to
 match other functions
Message-ID: <er2p6zazlvc2okzbbqjkzy4mif3ukjes56nfow6kwybmkjxvtr@4ihyqymqzvit>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-7-78ae3ee9a697@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-7-78ae3ee9a697@somainline.org>

On Wed, Apr 17, 2024 at 01:57:47AM +0200, Marijn Suijten wrote:
> All other functions in dpu_hw_intf name the "self" parameter `intf`,
> except dpu_hw_intf_setup_timing_engine() and the recently added
> dpu_hw_intf_program_intf_cmd_cfg().  Clean that up for consistency.

I really have mixed feelings towards such patches. On one hand it
improves readability, on the other hand, it's just a name, it has no
specific value.

Still:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 965692ef7892..34d0c4e04d27 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -96,11 +96,11 @@
>  #define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
>  
>  
> -static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> +static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>  		const struct dpu_hw_intf_timing_params *p,
>  		const struct dpu_format *fmt)
>  {
> -	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	struct dpu_hw_blk_reg_map *c = &intf->hw;
>  	u32 hsync_period, vsync_period;
>  	u32 display_v_start, display_v_end;
>  	u32 hsync_start_x, hsync_end_x;
> @@ -118,7 +118,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  	/* read interface_cfg */
>  	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
>  
> -	if (ctx->cap->type == INTF_DP)
> +	if (intf->cap->type == INTF_DP)
>  		dp_intf = true;
>  
>  	hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
> @@ -223,7 +223,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>  	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>  	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>  	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> -	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> +	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
>  		/*
>  		 * DATA_HCTL_EN controls data timing which can be different from
>  		 * video timing. It is recommended to enable it for all cases, except
> @@ -518,10 +518,10 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>  
>  }
>  
> -static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
> +static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *intf,
>  					     struct dpu_hw_intf_cmd_mode_cfg *cmd_mode_cfg)
>  {
> -	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
> +	u32 intf_cfg2 = DPU_REG_READ(&intf->hw, INTF_CONFIG2);
>  
>  	if (cmd_mode_cfg->data_compress)
>  		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> @@ -529,7 +529,7 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>  	if (cmd_mode_cfg->wide_bus_en)
>  		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>  
> -	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
> +	DPU_REG_WRITE(&intf->hw, INTF_CONFIG2, intf_cfg2);
>  }
>  
>  struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry

