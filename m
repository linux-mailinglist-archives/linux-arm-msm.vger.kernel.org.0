Return-Path: <linux-arm-msm+bounces-38488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC79D3AA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22630B282A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1273C1A071C;
	Wed, 20 Nov 2024 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXFWHLiN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F12A1A4F01
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732104977; cv=none; b=AHkA74CRHXdYjxfMlwy8svBKSY5q+WnIlcD9TpC/JWEICPNbSZUQgZL8GsJ+yp0oLAe27SbkclnFdlB0RpjzN3Rl0jnjLYEE1BF9oN1ZsTbUod6YN3ucgdgCBuviXCsCcqGUl4fCqP2aKPdtP4kHutRnUMb3p2WSTkB1nsvsutQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732104977; c=relaxed/simple;
	bh=r9BGWtiuF0mfz6RBtnoPJ158IEaZpOtLb28KEG6nOwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfXB1wHzFFTdVcmtSg0PtUhghBCUA2MS8joqutI5MP+rW7NqsA4yMNcI8vSzxNCxSVpnM7A2CoAmMKmOha7iGQPdETZ5QZt+CH2flYgU867rvMFzoiJVkPG6RNrgcAkRE/9UOBUuv8lNpQRvwr00sqWxMAoQ2zSUnj/kgNk6VG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXFWHLiN; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb599aac99so44220531fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 04:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732104973; x=1732709773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIsUKn523ItPFhw9PoQgspXzNPwI8eBe9tACkVcqoFg=;
        b=kXFWHLiN85+mdNa675J3x2MOayJj7HH2PlOGP1OD8SjYAk38Y1/S1eC50D80pJH34+
         Ydpo+HjuaXMekXnMOuDD8H7H85C2E1W9Sb53RGI5nyOmlyJQ1BMkVujGg7AWSzjS/WJl
         R2klshASlUisFvauR62JHYJ6pPqjw0Ib7GAOY0qCNxhHnwsIj68mzB1wA08vlr/MQgD5
         JcD2lCAuW7M2ISIVeouwsEDYiwBZHgNrYzSupaVRhTezUPte8lC/0f1NM7xQ4KNiypIW
         JPk8862jln+7RIfLNf8MrL162irtKQSpSR4SA/2XANID9HH5SoTdysYAvjMAmgP5hzdD
         dk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732104973; x=1732709773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIsUKn523ItPFhw9PoQgspXzNPwI8eBe9tACkVcqoFg=;
        b=aA28iRuHazpyA69tVYOCC50tdzda3yogbzLe01RkX1eipVwLGnfaV7clsFYP2NFbkA
         eANEfeDP11xbGGJ61kE89by9I1nENjZcPntW3yE6V0qcr+2doxrktteRJmj1qHdHGTST
         HKdlVh6xMUBJsYwHCe8DsBLEMiVEkG5Kdp6VrH0PRHrO5qMZTSXBHLDDJYD/qY3XQf3U
         zsnQqMBlopoNfXpqWaedZT/KOgAuObNJJwe/2kUVu21vuyMq9hynS2wfTy8C+9TVQC8L
         ge+hEFHEGhUZdQumOYuiTjY/YFma/vwOS4CyLwUJb4x2pdBzdNhU9Zvtpa7sJSXnOgxr
         Rtcg==
X-Forwarded-Encrypted: i=1; AJvYcCU5JV0VDT8BTMKPQjwYueIRjNtXeEno5C+7GIOfbpQ3zD2uaFfYrQBi51YOQYs+ekHWCRiwb8Az/vx1J733@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGm6xhawrwN3hEdX7TOGjtBod0TCxRSPwPDmMQ5dS/cXIGVt+
	GhrdAze8FuXheE89YrOqDcs0CuH4HOCCNteQ4ClzI59MVNcR4XzNvlOI3SfCJTQ=
X-Google-Smtp-Source: AGHT+IG+JbXwf7DnQ9184clVxgyLKaSqR5SrvWGXCF34hbjR2SJgwz1JS9pJIQewA46R8bEOMRQG1Q==
X-Received: by 2002:a2e:bc20:0:b0:2ff:78be:e02d with SMTP id 38308e7fff4ca-2ff8dbcb795mr14542921fa.11.1732104973210;
        Wed, 20 Nov 2024 04:16:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69ae80c5sm15094771fa.80.2024.11.20.04.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 04:16:11 -0800 (PST)
Date: Wed, 20 Nov 2024 14:16:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, 
	linux-arm-msm@vger.kernel.org, sean@poorly.run, marijn.suijten@somainline.org, 
	airlied@gmail.com, simona@ffwll.ch, quic_bjorande@quicinc.com, 
	quic_parellan@quicinc.com, quic_khsieh@quicinc.com, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH drm-next] drm/msm/dp: Fix potential division by zero issue
Message-ID: <pwwukfhijwywhz7tailrfamxdyz6jabo5ref64xr6upnkzcpel@flzvrcr3m3h5>
References: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
 <piembwzz7x6plsps3umjg3b3pi2ii44svmeii3wwtydtriceny@uqq7ck2ge5zz>
 <Zz3N7IvdN4L8N62p@HOME-PC>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zz3N7IvdN4L8N62p@HOME-PC>

On Wed, Nov 20, 2024 at 05:24:20PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> On Wed, Nov 20, 2024 at 01:02:32PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Nov 20, 2024 at 10:34:51AM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > > The variable pixel_div can remain zero due to an invalid rate input,
> > 
> > No, it can not. Rate is set by the driver, which knowns which rates are
> > supported. 
> > 
> > > leading to a potential division by zero issue. This patch fixes it and
> > > the function now logs an error and returns early.
> > 
> > See Documentation/process/submitting-patches.rst, look for "This patch"
> > string.
> > 
> > > 
> > > Additionally, this patch resolves trailing whitespace issues detected
> > > by checkpatch.pl in the same file.
> > 
> > Additionally perform ... => separate commits.
> > 
> > > 
> > > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > index b4c8856fb25d..e170f70f1d42 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > @@ -225,7 +225,7 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
> > >   * This function reset AUX controller
> > >   *
> > >   * NOTE: reset AUX controller will also clear any pending HPD related interrupts
> > > - * 
> > > + *
> > >   */
> > >  void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
> > >  {
> > > @@ -487,8 +487,10 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
> > >  		pixel_div = 2;
> > >  	else if (rate == link_rate_hbr2)
> > >  		pixel_div = 4;
> > > -	else
> > > +	else {
> > >  		DRM_ERROR("Invalid pixel mux divider\n");
> > > +		return;
> > > +	}
> > >  
> > >  	dispcc_input_rate = (rate * 10) / pixel_div;
> > >  
> > > @@ -579,7 +581,7 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
> > >   * This function reset the DP controller
> > >   *
> > >   * NOTE: reset DP controller will also clear any pending HPD related interrupts
> > > - * 
> > > + *
> > >   */
> > >  void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
> > >  {
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> Hello Dmitry,
> 
> Thank you for the valuable feedback. Will update my commit messages
> accordingly. I wanted to seek clarification on the the divide by zero
> issue. Would pixel_dev not be zero upon hitting the else case as
> indicated below casuing a div by zero?
> 
> 	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
> 	
> 	[..]
> 	
> 	if (rate == link_rate_hbr3)
> 		pixel_div = 6;
> 	else if (rate == 162000 || rate == 270000)
> 		pixel_div = 2;
> 	else if (rate == link_rate_hbr2)
> 		pixel_div = 4;
> 	else
> 		DRM_ERROR("Invalid pixel mux divider\n"); <<-- here

The 'rate' itself also comes from the driver and the calling functions
ensure that the value is correct.

> 
> 	dispcc_input_rate = (rate * 10) / pixel_div;
> 
> -Dheeraj

-- 
With best wishes
Dmitry

