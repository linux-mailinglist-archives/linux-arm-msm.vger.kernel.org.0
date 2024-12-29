Return-Path: <linux-arm-msm+bounces-43568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C290E9FDD4D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 05:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 659E2161289
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2024 04:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A970F9E6;
	Sun, 29 Dec 2024 04:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNZlhHp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60E2594B4
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2024 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735447630; cv=none; b=GhafEeJyZItYIE1lUYKirpom4yy4GlXKcu38Jo1Zop/yET+qfqRXRe+7knBdS1FSqQ6gn6GWQ7JRnRyNVbj8fQukoKTCDffhkQgNmRkVx/1htBdIIJDm7b255TLIx/MjBe99uiq0NTJHhS2aHn7pgLP0Ij9jdW1WqnTkJMSwG2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735447630; c=relaxed/simple;
	bh=pqS65vCC4qd8fWFNoxM+0Vco8qOZHvdcT+YBtalgtVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9nmgwljzcFll5OOMFI3g/RFZ88acHm5NUdzNiYru3IhcRqBv0Oxvz6vW0rO2E6wpo9+YDN2U1jQu9QEPOnXc0gW4UUFToLFoEXfGxqphvTYs/j+8IcpeDPmSP41CY9qUCYDYx+zX0SzEDRSI/WiHtLNAQPJc1d4PYU+PFRN+gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bNZlhHp/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so12907916e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2024 20:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735447626; x=1736052426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJc4muwRBkxyMbOj5l9DkGAvgRseaCzl9LeQVP53Y3w=;
        b=bNZlhHp/LRm0kvJt5MEift7Ii7rLvgwjXr66KQyeJ2Eqm1dQMgMmB0WZrCk2/ph5j1
         Mh+LmL3Z4shkNuS3fH4SgRYSkHfrKPw8Myli1Fp5Ieuv79/pVy/P/9sQUGsCD0d3TZG5
         n2yyQZ16Vc8sgvRGMgHOYyFp65v0yxFi9gMruJcsOfsr8kU71u9Kx3RUIFrslCswj17h
         GMSBJi24WAOZy6vuQo6uRxO6+mGy1rpq1xLl8iz/lawQdeDRddgoFhbb3xzv4bNfF8Vn
         l4NZqtHdcrfzOAhB8JxLW/xhcVsUZ8uOUfATkIx3R27uf8hmppZqJhgS8enUaR6pgAr/
         XkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735447626; x=1736052426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJc4muwRBkxyMbOj5l9DkGAvgRseaCzl9LeQVP53Y3w=;
        b=vJA7EQXsVdO3cAwf5loRNV+Cs3Me2ZmqcoEMMgt4KGXBS5nmVMHrHNRwtI/Qw5zByw
         GgyClD6Ipe/R6CQ6E853mfFjMSM7qtlaPfi5mh/K76wA+JNaIDM/5VmInGy7RcN1q/wI
         FzDC5bIUHEb6WHaRl7rfwO35ePPmO4rcaNK6dOs0SRGJbrZjfH3Uexpc8bVEoXvqpIX8
         0vonNMiDl/6GdlWkTh/+Wuj9DW6fPT1LqJZjj8ihZnglnSJKD/rrURfjR8Ejeos6jTeN
         c5puVY8pM8VMPF2WHjt0aX1Dq6EWx7eFK1oEDTSjlbrf53KbraHEdjUVVwz7CtDOW2NI
         Gu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIfLkqGA7ayfpEorxZ6w3qlukBIzF3lYFKXU+GIJSayfa5+zdrNB7ITx/K5B1dnU7s9cOWOPgJexMv6YMz@vger.kernel.org
X-Gm-Message-State: AOJu0YzJGZ+DVpPr5uga68TQwn3F18It/NqxsHfk01SGleYd0Xgz3aOy
	4r1AoZ/2Ebp5Jz9PKAXNta/vnBjyeyB8rGRuukwCoV8xaHfQrs16FXgJ9CLKhiY=
X-Gm-Gg: ASbGncvOZ/eg1UVRn3XKQ/gMoWjPsgZnFdXrNmwzqpbU7NTaqnoJrZ83wLnooWTilOt
	5nY2p1LprA0AqPTV9qoygfspbn3XkWt/iGjvUlLcFyI3lRl+EPGPJ0kR8T81KmrllMyvMlTSSXp
	J6HXy/Euf0NrI90nbfX7GWXb3I2qONtMPrXlqkOQT3CeBGQ5BWSbCiHPKutX1HSqMsJIgynvK57
	nFp1kroWksC7wcWxqdqF2XDWjYcnRCZeF4xbAIk1D0faredfR7KLZMkLEBHL8NOcSsY15qZdQrE
	c8vDo/IDhmyJGbI94r33bQx9190DSYSsL+AH
X-Google-Smtp-Source: AGHT+IHX6aaByf0LSe07w0VxUCbJ8VSAHpvOaEeLYBwJPWsRTvg0+34fCnSQJm57ezrdAK6msyIqQg==
X-Received: by 2002:a05:6512:10d2:b0:53e:39e6:a1c5 with SMTP id 2adb3069b0e04-54229562a91mr11004652e87.41.1735447625891;
        Sat, 28 Dec 2024 20:47:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238214b5sm2804959e87.187.2024.12.28.20.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:47:04 -0800 (PST)
Date: Sun, 29 Dec 2024 06:47:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 18/25] drm/msm/dpu: Reserve resources for CWB
Message-ID: <jtovhd4zsaumm27gzwlkufqywyr2he36rmo6jjm2vnchkjeugd@fdpws67sjlfx>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-18-fe220297a7f0@quicinc.com>
 <z6pebzm5yxaqqmktu4jjjy4rojkdarrqrwo4ikmv6jzku7foyf@cc325q3dfgif>
 <ddd1db49-39d8-44b6-b658-b30fe8ba4428@quicinc.com>
 <pp2uifxzgqmg3ske3mmlgznzb76eovxvgv6y6kfafk5wvoq3ou@5x7bwdkipius>
 <5f054c0a-8f1f-4b13-bb5d-505ce4dbfb34@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f054c0a-8f1f-4b13-bb5d-505ce4dbfb34@quicinc.com>

On Thu, Dec 26, 2024 at 02:49:28PM -0800, Jessica Zhang wrote:
> 
> 
> On 12/20/2024 5:07 PM, Dmitry Baryshkov wrote:
> > On Fri, Dec 20, 2024 at 04:12:29PM -0800, Jessica Zhang wrote:
> > > 
> > > 
> > > On 12/19/2024 9:52 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Dec 16, 2024 at 04:43:29PM -0800, Jessica Zhang wrote:
> > > > > Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> > > > > 
> > > > > For concurrent writeback, even-indexed CWB muxes must be assigned to
> > > > > even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> > > > > even/odd rule applies for dedicated CWB PINGPONGs.
> > > > > 
> > > > > Track the CWB muxes in the global state and add a CWB-specific helper to
> > > > > reserve the correct CWB muxes and dedicated PINGPONGs following the
> > > > > even/odd rule.
> > > > > 
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 83 +++++++++++++++++++++++++++++
> > > > >    4 files changed, 116 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > index a895d48fe81ccc71d265e089992786e8b6268b1b..a95dc1f0c6a422485c7ba98743e944e1a4f43539 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > @@ -2,7 +2,7 @@
> > > > >    /*
> > > > >     * Copyright (C) 2013 Red Hat
> > > > >     * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> > > > > - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > >     *
> > > > >     * Author: Rob Clark <robdclark@gmail.com>
> > > > >     */
> > > > > @@ -28,6 +28,7 @@
> > > > >    #include "dpu_hw_dsc.h"
> > > > >    #include "dpu_hw_merge3d.h"
> > > > >    #include "dpu_hw_cdm.h"
> > > > > +#include "dpu_hw_cwb.h"
> > > > >    #include "dpu_formats.h"
> > > > >    #include "dpu_encoder_phys.h"
> > > > >    #include "dpu_crtc.h"
> > > > > @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
> > > > >     * @cur_slave:		As above but for the slave encoder.
> > > > >     * @hw_pp:		Handle to the pingpong blocks used for the display. No.
> > > > >     *			pingpong blocks can be different than num_phys_encs.
> > > > > + * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
> > > > > + *			display. Number of CWB muxes can be different than
> > > > > + *			num_phys_encs.
> > > > >     * @hw_dsc:		Handle to the DSC blocks used for the display.
> > > > >     * @dsc_mask:		Bitmask of used DSC blocks.
> > > > >     * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> > > > > @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
> > > > >    	struct dpu_encoder_phys *cur_master;
> > > > >    	struct dpu_encoder_phys *cur_slave;
> > > > >    	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> > > > > +	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
> > > > >    	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > > >    	unsigned int dsc_mask;
> > > > > @@ -1138,7 +1143,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > > >    	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > > > >    	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > > > >    	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > > > +	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
> > > > >    	int num_pp, num_dsc, num_ctl;
> > > > > +	int num_cwb = 0;
> > > > > +	bool is_cwb_encoder;
> > > > >    	unsigned int dsc_mask = 0;
> > > > >    	int i;
> > > > > @@ -1152,6 +1160,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > > >    	priv = drm_enc->dev->dev_private;
> > > > >    	dpu_kms = to_dpu_kms(priv->kms);
> > > > > +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> > > > > +			dpu_enc->disp_info.intf_type == INTF_WB;
> > > > >    	global_state = dpu_kms_get_existing_global_state(dpu_kms);
> > > > >    	if (IS_ERR_OR_NULL(global_state)) {
> > > > > @@ -1162,9 +1172,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > > > >    	trace_dpu_enc_mode_set(DRMID(drm_enc));
> > > > >    	/* Query resource that have been reserved in atomic check step. */
> > > > > -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > > -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > > > > -		ARRAY_SIZE(hw_pp));
> > > > > +	if (is_cwb_encoder) {
> > > > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > > +						       drm_enc->crtc,
> > > > > +						       DPU_HW_BLK_DCWB_PINGPONG,
> > > > > +						       hw_pp, ARRAY_SIZE(hw_pp));
> > > > > +		num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > > +						       drm_enc->crtc,
> > > > > +						       DPU_HW_BLK_CWB,
> > > > > +						       hw_cwb, ARRAY_SIZE(hw_cwb));
> > > > > +	} else {
> > > > > +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > > +						       drm_enc->crtc,
> > > > > +						       DPU_HW_BLK_PINGPONG, hw_pp,
> > > > > +						       ARRAY_SIZE(hw_pp));
> > > > > +	}
> > > > > +
> > > > > +	for (i = 0; i < num_cwb; i++)
> > > > > +		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> > > > > +
> > > > >    	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > > >    			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
> > > > >    	DPU_HW_BLK_LM,
> > > > >    	DPU_HW_BLK_CTL,
> > > > >    	DPU_HW_BLK_PINGPONG,
> > > > > +	DPU_HW_BLK_DCWB_PINGPONG,
> > > > >    	DPU_HW_BLK_INTF,
> > > > >    	DPU_HW_BLK_WB,
> > > > >    	DPU_HW_BLK_DSPP,
> > > > >    	DPU_HW_BLK_MERGE_3D,
> > > > >    	DPU_HW_BLK_DSC,
> > > > >    	DPU_HW_BLK_CDM,
> > > > > +	DPU_HW_BLK_CWB,
> > > > >    	DPU_HW_BLK_MAX,
> > > > >    };
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > index 48d756d8f8c6e4ab94b72bac0418320f7dc8cda8..1fc8abda927fc094b369e0d1efc795b71d6a7fcb 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > > > @@ -128,6 +128,7 @@ struct dpu_global_state {
> > > > >    	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
> > > > >    	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
> > > > >    	uint32_t cdm_to_crtc_id;
> > > > > +	uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
> > > > >    };
> > > > >    struct dpu_global_state
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > index 85adaf256b2c705d2d7df378b6ffc0e578f52bc3..ead24bb0ceb5d8ec4705f0d32330294d0b45b216 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > > > @@ -234,6 +234,55 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
> > > > >    	return -EINVAL;
> > > > >    }
> > > > > +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
> > > > > +						 struct dpu_global_state *global_state,
> > > > > +						 uint32_t crtc_id,
> > > > > +						 struct msm_display_topology *topology)
> > > > > +{
> > > > > +	int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> > > > > +	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
> > > > > +	int cwb_pp_idx[MAX_BLOCKS];
> > > > > +	int cwb_mux_idx[MAX_BLOCKS];
> > > > > +
> > > > > +	/*
> > > > > +	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
> > > > > +	 * mixer
> > > > > +	 *
> > > > > +	 * TODO: add support reserving resources for platforms with no
> > > > > +	 *       PINGPONG_CWB
> > > > 
> > > > What about doing it other way around: allocate CWBs first as required
> > > > (even/odd, proper count, etc). Then for each of CWBs allocate a PP block
> > > > (I think it's enough to simply make CWB blocks have a corresponding PP
> > > > index as a property). This way the driver can handle both legacy and
> > > > current platforms.
> > > 
> > > Hi Dmitry,
> > > 
> > > Sorry if I'm misunderstanding your suggestion, but the main change needed to
> > > support platforms with no dedicated PINGPONG_CWB is where in the
> > > rm->pingpong_blks list to start assigning pingpong blocks for the CWB mux.
> > > I'm not sure how changing the order in which CWBs and the pingpong blocks
> > > are assigned will address that.
> > > 
> > > (FWIW, the only change necessary to add support for non-dedicated
> > > PINGPONG_CWBs platforms for this function should just be changing the
> > > initialization value of cwb_pp_start_idx)
> > 
> > If I remember correctly, we have identified several generations of DPU
> > wrt. CWB handling:
> > - 8.1+ (or 8.0+?), DCWB, dedicated PP blocks
> > - 7.2, dedicated PP_1?
> > - 5.0+, shared PP blocks
> > - older DPUs, special handling of PP
> > 
> > If the driver allocates PP first and then first it has to allocated PP
> > (in a platform-specific way) and then go from PINGPONG to CWB (in a
> > platform-specific way). If CWB is allocated first, then you have only
> > one platform-specific piece of code that gets PINGPONG for the CWB (and
> > as this function is called after the CWB allocation, the major part of
> > the CWB / PP allocation is generic).
> 
> The issue with breaking this into separate helpers/functions is that the CWB
> mux and PPB indices are dependent on each other. But I agree that we can
> reserve CWB mux and the PPBs in 2 separate loops within this helper to
> minimize the special platform-specific handling.

Doesn't it just PPB depend on CWB?


> 
> Also wanted to note that the comment doc on the PPB odd/even rule is
> inaccurate -- technically the odd/even rule applies specifically to the CWB
> mux as odd/even LMs are hardwired to their respective CWB muxes. Will
> correct the comment doc to be more accurate.

Yes, please fix that.

> 
> Thanks,
> 
> Jessica Zhang
> 

-- 
With best wishes
Dmitry

