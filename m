Return-Path: <linux-arm-msm+bounces-30284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B129667DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D881C21FCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52AC14C585;
	Fri, 30 Aug 2024 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FB6T81i4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B951E15C153
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725038515; cv=none; b=E2/4DjQhalZ3ow3bTdTW1OIIpEoKbTCSLFimPVOTFGIK+fqnYpa/0/B9muBiJsZAumUGBvLx8a5en5KisUgGdrt70FAh3MUUydQY3QHWHlzA4EGj6EH1CYzR1Yp0PNwdRm69GROQX9M6de/Lf2TWPp5I4wv+rGIfVcFxixJiCJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725038515; c=relaxed/simple;
	bh=Ebyri/d1WuwpbcZ+vHwSQuuP5Mkqqzf6gzaPTnv1vwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SA/+NdRiYNV9obp+yl1EgWUCNKOyQMguHtzwti6AAmrcCnw8tSp8YqZPv2GvoBIsJdUqoq4EAJm7V1sglCSvDFuWkT/Zf+yc9aOmxuly14pGwDOBahBep5yO8URe/oS2qi02Q/dSfI4Uf4aBCc2fBPaSmbcTFYz5j6ue4+jrvrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FB6T81i4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53343bf5eddso2636392e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725038512; x=1725643312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKvLUae2xB3S1jTpjyPhws243myNsfzJ9gMn+BzbGFc=;
        b=FB6T81i4PSowJOJXwbOdDcJnI4baEPKkfGD5rmZ5ff8JluA3Y/cNNssPBWtijB2WsK
         gNTwSImeiQK5w5qhHtTYf94dx5cavJyltCJ19zIUlqFiENe5HAo/GBHe5t49Qw2Cq9vz
         506jWlaQUok9SpptEKsL//vn5PkZjHl2+xavzI4uNFClF6wVgZQ/0xK25qu65Ou+cHqQ
         4pMY/b51wdX1rhNBBBMtFTSkjGJR3FJJR6nFTKJTr1E+xv/ZvHco9d9EzZ8JfpEHRK5a
         YYA9H6UTQFaoaKFGWfJ0wikSaiYX7EQefsuEOUXJAvpMNat+N5IeXN6fgfMbUfAazuzO
         ryiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725038512; x=1725643312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKvLUae2xB3S1jTpjyPhws243myNsfzJ9gMn+BzbGFc=;
        b=flOuJ1qhmReVBRGl9WT9FVh6MZVYj/1KFaZT9xdrlnMglIEeoLHo2aaq8xUaIzutWg
         F/+d3zEMH4GSWz3oq0lOlxFi9sUGIsExLhEbwv80k5aczPwtYxWBdNcC9ENF8aboOEbt
         4lDAjT96zYjpak5VmQrlIzURn8aBkAgw14mfc2uWxlPYcZ+Gbb0UxjjWff9oX16uFeSv
         JN+ZFesX2nTsKrU1LC8yE0ChcpuE7PjtMKLfQpsyPbBePE2+rnjuIPW0y5H56hVDdXCT
         JHdfYsVS5A4IT6ysV3VE3ULmwtouuN3wBF1JMBbmp2ak+APUGfiJ/aL2zCUBMln6/ALI
         WmQA==
X-Forwarded-Encrypted: i=1; AJvYcCV4lrTsWxiki7tCDA+q0KXHCwYcUgXlgQY1kepFGQ8L1fntDqOj6UQBN81a2cjSvkYfNeoAr7nw7pJu+kBu@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ+uA3RwKfsQ9IaD/q4NnYlcc0jA4GCBh0bPXLLbE+DcYc8dcJ
	E1Got32LPyKtYruhabsk2zD1KjOUZ5/XcOYpj4gBZNga9zoellWJDxdbe6Xy9aY=
X-Google-Smtp-Source: AGHT+IGQmODpu1GQhb9jQykvQPuBtYL1ZQZyZuIet71ZlcXlfEWqjUwFaVnHI4wGv7pyRo0vvIcGxg==
X-Received: by 2002:a05:6512:2804:b0:52c:d905:9645 with SMTP id 2adb3069b0e04-53546b32d3dmr2187319e87.13.1725038511271;
        Fri, 30 Aug 2024 10:21:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084edb6sm697900e87.283.2024.08.30.10.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 10:21:50 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:21:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 12/21] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <f5xu7qvlkcghu4lxwhwsihljjzvy33rte3dtskcqpo7dl75pk4@gehpioc43lue>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-12-502b16ae2ebb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-12-502b16ae2ebb@quicinc.com>

On Thu, Aug 29, 2024 at 01:48:33PM GMT, Jessica Zhang wrote:
> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> to account for concurrent writeback
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 11 +++++++++--
>  drivers/gpu/drm/msm/msm_drv.h            |  2 ++
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index bebae365c036..1b0cc899e8c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1176,6 +1176,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>  					    &crtc_state->adjusted_mode);
>  
> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> +
>  	/*
>  	 * Datapath topology selection
>  	 *
> @@ -1189,9 +1191,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
>  
> -	if (topology.num_intf == 2)
> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
> -	else if (topology.num_dsc == 2)
> +	else if (topology.num_dsc == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
>  	else if (dpu_kms->catalog->caps->has_3d_merge)
>  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 738e9a081b10..13f84375e15d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -384,8 +384,15 @@ static int _dpu_rm_reserve_ctls(
>  	int i = 0, j, num_ctls;
>  	bool needs_split_display;
>  
> -	/* each hw_intf needs its own hw_ctrl to program its control path */
> -	num_ctls = top->num_intf;
> +	/*
> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> +	 * control path. Since only one CWB session can run at a time, hardcode
> +	 * num_ctls to 1 if CWB is enabled

I don't think that havign one session is relevant here. Just specify
that we need to use a single CTL if CWB is in play.

> +	 */
> +	if (top->cwb_enabled)
> +		num_ctls = 1;
> +	else
> +		num_ctls = top->num_intf;
>  
>  	needs_split_display = _dpu_rm_needs_split_display(top);
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index be016d7b4ef1..315895937832 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -88,6 +89,7 @@ struct msm_display_topology {
>  	u32 num_dspp;
>  	u32 num_dsc;
>  	bool needs_cdm;
> +	bool cwb_enabled;
>  };
>  
>  /* Commit/Event thread specific structure */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

