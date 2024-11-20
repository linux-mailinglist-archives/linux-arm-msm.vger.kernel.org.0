Return-Path: <linux-arm-msm+bounces-38478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBD9D39FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14F8280551
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AAA1AA78D;
	Wed, 20 Nov 2024 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRF9cZbY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6DC1A76DA;
	Wed, 20 Nov 2024 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103666; cv=none; b=QP8xtcFOahEvGd3hDJa5sXR6/cMMW6HPlOBL46xkaBjcmMQwM8MH0RrGOo4T+3W7rdjoiVhk63Lnli5hEMZxJ9qM/CpH0bT+VeEE6v/0nKtrzDxMpmq3atXQNurm0SsUd8ttzZufhbgY78iyzemCvjPPOx8orBOxX3xdVFsBBw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103666; c=relaxed/simple;
	bh=PSpAaRrqNzO8wYAkhgHM0W3VM/KrG3ePQN4pLORJcvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XD+M+TTAMKkYOOFfiXT2liqsBd3feCNl1ZsDufdGCI+PvugoOnl4ahpR7YSbuy3hkX52GYuLw9v5e4dUL1n5b2kRdpzkIyfPXHyuuS4MinZ6/R2pWPq+y1a/XoyzRd89XZOsm3Pcq45Y6pV44plHLhHZoSfpDa97Ljsdh+rvFt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRF9cZbY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-211fcadd960so31332465ad.2;
        Wed, 20 Nov 2024 03:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732103664; x=1732708464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3CU4VQWBACqm9PUCaRN7S/RhGe8ctry/AcpamMARb5Y=;
        b=cRF9cZbYlACNCq78ep99seIw5JCw3mg6vo+BFAtipcW2V4IiXfvYFjzCfIooieoZRW
         H5xZ96+ry8BMhMZA49NKrC5rvs8wm+skheuO2Xdaq4tZFJlCFroH75p+EXJPsGELvfrE
         rvgO39lx1uXL0igkwmgXG+HC6aPQV7BftXA8j13kvouH0dBf0W9gKXfbGYcaCOfYCsyH
         4M6x7usaN4cf2/aU1xg/h72QU2S6Ud5dyC3v7dUKuoqCjJc7dJPa3QLY5MZMlJ9fWsco
         l8OQPeBlUvx5nTzZXJXJmH74pIFMnCkbi8FI66L6Otv5GmP5IBOP7FPeUOriwiqBfHQ/
         nLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732103664; x=1732708464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CU4VQWBACqm9PUCaRN7S/RhGe8ctry/AcpamMARb5Y=;
        b=v1hobwollOILWGXBTlXRFC5a83KeUQioIR5TxL/1e1UW3xhj6P+8ow8ghLx4aiIwne
         ZbCagiaFi4xRAg9taWCI9Y6nrYjlAzmc4N+FYiScNjpoOCRVOZ7rItSdHA+O6JVv6QGc
         5hG8RQOV3hWEDCbiOZTmedrREOD6O3gJRZGbm1/dGazn8MBZY00b1qGprURcEqHU4Da9
         STq9JUyfms1jbL0dLlCi0PtwJ0Mxj+/HeoJY5oSZTud1XPua2WJG8l6iAzIEgGMYyQVa
         VmIc14IFajhthbjJ/qOKiBnDJ9zltkTRY2+4ylSNmGTwdbpSq2foBaQdgNAydLYUAzPE
         wvww==
X-Forwarded-Encrypted: i=1; AJvYcCVRtKsE/FT1vbj9XZT1gcidXu1CEKYlMTMHBJ6mLwVT2yvrlbHFPUIR15SorlNniEUe6rlIUTcG+iHQqmxx@vger.kernel.org, AJvYcCW9ixupPCy+dPjl0I+h2LjXxMC7RxW4t6f892u9d2jmYhh7GkxMQ4Z7sBg+Xk9rlOo0fxsX3R0pDPxWeHdM@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWvbnQZwJhn8YMy+l9Duc+503fzhC/yAeCuamIRkSVfg1UwCn
	UxTED3nTaitQl2Q1JUqinfy4fPTKvUW5FY1jHxh4iTNyMYlKTc6Z5ReJRryA
X-Google-Smtp-Source: AGHT+IHCCQlHXWu+VwXZr0F1OsJVRG8awCPqJtVORBIi12RYKMzGzobiFsxattqW9qkfyCXn+lMg1Q==
X-Received: by 2002:a17:902:e94f:b0:20b:51b0:4b22 with SMTP id d9443c01a7336-2126c9785c1mr31181815ad.47.1732103663931;
        Wed, 20 Nov 2024 03:54:23 -0800 (PST)
Received: from HOME-PC ([223.185.132.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21207f26c61sm62826295ad.160.2024.11.20.03.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:54:23 -0800 (PST)
Date: Wed, 20 Nov 2024 17:24:20 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
	linux-arm-msm@vger.kernel.org, sean@poorly.run,
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
	quic_bjorande@quicinc.com, quic_parellan@quicinc.com,
	quic_khsieh@quicinc.com, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	dianders@chromium.org
Subject: Re: [PATCH drm-next] drm/msm/dp: Fix potential division by zero issue
Message-ID: <Zz3N7IvdN4L8N62p@HOME-PC>
References: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
 <piembwzz7x6plsps3umjg3b3pi2ii44svmeii3wwtydtriceny@uqq7ck2ge5zz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <piembwzz7x6plsps3umjg3b3pi2ii44svmeii3wwtydtriceny@uqq7ck2ge5zz>

On Wed, Nov 20, 2024 at 01:02:32PM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 10:34:51AM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > The variable pixel_div can remain zero due to an invalid rate input,
> 
> No, it can not. Rate is set by the driver, which knowns which rates are
> supported. 
> 
> > leading to a potential division by zero issue. This patch fixes it and
> > the function now logs an error and returns early.
> 
> See Documentation/process/submitting-patches.rst, look for "This patch"
> string.
> 
> > 
> > Additionally, this patch resolves trailing whitespace issues detected
> > by checkpatch.pl in the same file.
> 
> Additionally perform ... => separate commits.
> 
> > 
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > index b4c8856fb25d..e170f70f1d42 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > @@ -225,7 +225,7 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
> >   * This function reset AUX controller
> >   *
> >   * NOTE: reset AUX controller will also clear any pending HPD related interrupts
> > - * 
> > + *
> >   */
> >  void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
> >  {
> > @@ -487,8 +487,10 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
> >  		pixel_div = 2;
> >  	else if (rate == link_rate_hbr2)
> >  		pixel_div = 4;
> > -	else
> > +	else {
> >  		DRM_ERROR("Invalid pixel mux divider\n");
> > +		return;
> > +	}
> >  
> >  	dispcc_input_rate = (rate * 10) / pixel_div;
> >  
> > @@ -579,7 +581,7 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
> >   * This function reset the DP controller
> >   *
> >   * NOTE: reset DP controller will also clear any pending HPD related interrupts
> > - * 
> > + *
> >   */
> >  void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
> >  {
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

Hello Dmitry,

Thank you for the valuable feedback. Will update my commit messages
accordingly. I wanted to seek clarification on the the divide by zero
issue. Would pixel_dev not be zero upon hitting the else case as
indicated below casuing a div by zero?

	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
	
	[..]
	
	if (rate == link_rate_hbr3)
		pixel_div = 6;
	else if (rate == 162000 || rate == 270000)
		pixel_div = 2;
	else if (rate == link_rate_hbr2)
		pixel_div = 4;
	else
		DRM_ERROR("Invalid pixel mux divider\n"); <<-- here

	dispcc_input_rate = (rate * 10) / pixel_div;

-Dheeraj

