Return-Path: <linux-arm-msm+bounces-45787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2863A18EDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7E6716B90B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FCC1F76B5;
	Wed, 22 Jan 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nmatiDBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8170B13213E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539624; cv=none; b=caoaE+vsJg/1OHTMbM651H5J3H36uXloZqtW5OOJbGlZVWx0iUIUAPs5TUWBfPzowEMq4u41Lf4TBc7Nsgt3rWE3HBEp3QuaEiVk0dpuh4D8s7MptiK6OkjQs8tRTy8tWpoo/xasZJRvdBArYLKnNWc0o7Fu1fxivVnu2Yyrd14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539624; c=relaxed/simple;
	bh=otEwY9PZ8xf7EHllsGtAYinVSKR0ZmARdbeEi6W1k4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLNHCGoUW5TF2VCErs4WYxvXPjw52ZZgILUtcxPu4xxeCbnyWjTYnPS33XEhOEo6Ec3SVYOMzovnHwZx7ZGPA4lm2MJ0FfJU4CPMJAPytTE83q1xr3zM7jHwICLTLQfLOcwa3Db/H6xXt3GwNYBNrKTti64JDkibnjwxbnKC8ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nmatiDBr; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-306007227d3so67424921fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 01:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737539619; x=1738144419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRgf+4Gq7ci+Ro2VkxNsjuyLNd/CJ4xAOCwqSJx115Q=;
        b=nmatiDBrh5Xs90ostgyRYlROsuOvy8IWJorwDtILcNb7FMdaBQ4NFtQFXOJPDmNS5x
         rul7ncxN0fEH+FgHEl3Qol7YZYnELrhr8n2XmVX81/512Lg8n8RvsrIGcJ4t/i7crzHp
         ernpvNLpQnzOiWP0mfmfYHKtA46UY15qtVRlLIONm3i/tpqu0qKu7rjRlmuoH2p+Gdo+
         qK3HdRKvQnHUnbbg5IWWVFxqMAk+SOzQI8JYIapWgvnicj6CwpsFVyyp4y8sTO+tAH5Z
         UJGvW50wpLiKoFNR7wLwa2MlkUGyHeG4aVfS1BR91SHpvETrtx7u9hIqOfDg47xNGbxd
         Llhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539619; x=1738144419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRgf+4Gq7ci+Ro2VkxNsjuyLNd/CJ4xAOCwqSJx115Q=;
        b=hJA1RSh/0c9xFC17SDPl7GeNTjxZQ8FRSgC4ZzLmYikv8XXo0djlEf1PAdsa4BUsPQ
         IPaplWwoPRvIMOX33oUgLPXpWKvAjw2jP8uvyqqs0woAkJx7twSLFBHwrcNDLzcMd4lp
         CpNp7uNFyzyVlpdNSGNwofepNBc0SgK/gRbe+otkJIchbggBWpLHE/uMEP0thO8U/T0D
         1Tg2JuAmBY2lk8XuGPuNRLQ3i8badqaJ0/rIfHSiuz33EuIw8oKR9d8zmTFM/FnyJmMk
         4T+8nzNXdggurr23JOn+B3Qes4O/ydx1kPjKhKdLY2PCGjuTSvGsBVfubIOJk/mXn9Mv
         TJ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVJaPoIR4Xq2+g2musfXDBAL8tV9FaO3Q8w5pQ8tX//DtaxkM4miy8KrmmW3DuYWiSv0iHTEIbsUkj6gTOk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nj+cdxaCiBPzIwsL+hAumOWzOS0syNtNGi0u/iZhxqo1JtDr
	b3s2nXhyRi3llvLWHq8Cg9xZ/CMRndkm9KQM2tRgUfp58eXfQmRtwCl7tOJiZ1k=
X-Gm-Gg: ASbGncs0tE3Fiqv9u61YOSIvvrWXkQRQvl6PlnAavRSx1A1bgQ7IpDZx6emVI3x/4Mk
	miOu4iAUqJ/R1mjLexq/93/I2nxd4Nru7iSqiJy8xVHao0O85W19ky0t0cC+J8auwHXCp6snzWq
	VpcFWsFFOxMVz7Y9RDm7rhgWCMW/Y2Vkm3acZQeFPjySCBsdfLBv5y9AqyLY8BwHImeVBwYSY0c
	qIDa+vsAxyLIFZBsgjeY452Gf+ylNPcvhQqEIM679vmVGMzH0/laPSpep3FEMkIJp1coOIV/Pj0
	jTW46nkLl2YJp7OGCD58ii+0/p8L8eIQrQbb6rZa7pzxXfCh/w==
X-Google-Smtp-Source: AGHT+IHLb2Jy8LJxpPjgGgMRTl/2bf+lFr1P6PyDavfCYaMiwjULwOKsJk+FZolKdDj43k4KykRThw==
X-Received: by 2002:a05:651c:e1b:b0:307:46f3:4e92 with SMTP id 38308e7fff4ca-30746f34f8cmr32037541fa.32.1737539619493;
        Wed, 22 Jan 2025 01:53:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330180sm25104611fa.23.2025.01.22.01.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:53:38 -0800 (PST)
Date: Wed, 22 Jan 2025 11:53:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/35] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Message-ID: <obrwhv2a4ubg4updrimszy7b7dwjsixuwzf5gutjahgdim6nxh@pin7heiwmco7>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-11-988f0662cb7e@linaro.org>
 <9d86517e-b05c-4cd6-925e-11c859fcb91d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d86517e-b05c-4cd6-925e-11c859fcb91d@quicinc.com>

On Tue, Jan 21, 2025 at 04:58:03PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> > Continue migration to the MDSS-revision based checks and replace
> > DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 8 ++------
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
> >   15 files changed, 13 insertions(+), 50 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index e9bbccc44dad8b391cd51daf902307105b2598fc..e16b0a0c57da4a1aa77064ca2214e37cd9ee4baa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -66,7 +66,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   	/* setup which pp blk will connect to this intf */
> > -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> >   		phys_enc->hw_intf->ops.bind_pingpong_blk(
> >   				phys_enc->hw_intf,
> >   				phys_enc->hw_pp->idx);
> 
> Was it intentional to drop the DPU_CTL_ACTIVE_CFG here but not replace it
> with core_major_rev >= 5?

The bind_pingpong_blk is only defined for 5.x+ platforms, so the check
is useless.

> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 5f9cd09589bb403746d48af6f8555cd224bf3195..59d25916d2d412113768d71a76a6aed4c879299a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -716,7 +716,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
> >   	c->caps = cfg;
> >   	c->mdss_ver = mdss_ver;
> > -	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
> > +	if (mdss_ver->core_major_ver >= 5) {
> >   		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
> >   		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
> >   		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> > 
> 
> DPU ver 5 introduced active_cfg, so this part is correct. Hence overall
> change is fine.

-- 
With best wishes
Dmitry

