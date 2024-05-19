Return-Path: <linux-arm-msm+bounces-20028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4EC8C9423
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 11:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 680611C2093D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 09:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93AC18C1A;
	Sun, 19 May 2024 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xIIfSwr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451DA4C8E
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716109267; cv=none; b=B45Xn04GR9kg+E5TG0K5ug/Q3CuHRTlM/lK7DH9rRBdbC4vXs+SA8kWOAkNChlFpByQwPDjjnsDv1L6GO2rMYO9rW3X4c5ZVJlJ1X9eY7KscwjCPCTgQAeoBDyvfUV7+Kq+rbuFT3wiq9RH9mvQI7dxntqBObbM5AJXFBtPX9D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716109267; c=relaxed/simple;
	bh=z1M5q6lbSAnjJDYuho0rxM9+49LwUh9yraPJOt14y+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPjzCjZmIWWUCIQAkA5BvilR8bP1pXr73bT77AVLZSDyKQi1KmD21c07ZoiNTcmb7zV4Z1CYVLTTXtatVoO5vK66h9bnUygxUGSPwaqqyxQYnfzryu87LdEcHaUI69R5+TC7IW5rCFRM+yJe58jQbRy+FiWHnglx/aVX9O/r8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xIIfSwr+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5238b7d0494so2466971e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716109263; x=1716714063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHiS5pE1L03XOoKJQJkG4h1GFh7GAgccKA8QwbdjkRw=;
        b=xIIfSwr++9pwxzgOtsq0q32UUObcbSCMjuVu29zaOJtW/zf9B2uk8Qql927OgkbdHK
         rlR2M5JkgcDJfXV/4NSJ+eebgtP3lviJn5hsLCWLeVmVzLuJEBAYfe0xSJLTX/Nrkcee
         9wiZHqiP4PAnh6drjRcU6x5R8bsiFG/YfpI/FIqg0uzbMrWhibPC6FT4dHy5IqyDT+xM
         S4zpYGQxeMP30YKr4+decT/NX1fY/05I9b1XS1rjKEv9yJqJu6A8hQMOMb+gG6nB+sVE
         pApXrnii6rW4Bg4ec3lTQTkv/x1KlRLgG0V4hIL7CbYGof6nf2eQj99D+ayKzICA5zGt
         cojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716109263; x=1716714063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHiS5pE1L03XOoKJQJkG4h1GFh7GAgccKA8QwbdjkRw=;
        b=nvnonY9HP/WQx4H+jkYu1eeJT+qBSa0dytIWhRBPJ6dZv9+8+/1yZOx1eKxbQGzpuT
         hpC/jqvxZPcxCkle4S9XAscQI9eFUgKwp/lUT0KQPCXXPSjscU0+6ptejKUOakd4flEZ
         OkKo8RzizvxiQ8FVLq25IYsRxC5Lzggq71MOeWcO2xMPjR8ZBbk4qWMNSddSw01F5tzl
         9pwefAy7m2SLXZIsuySIlIllZdgsoRX2JLHya5Vt5JCYpimvsIgBUQnZs7yjocqdbA4g
         Mn6uj1aAWYDTs2qYuMwIIBSMYdnxFf6GB00aWOI8hTeqfOdoHV7Qjou6r4NjYUDr4iKg
         s0cw==
X-Forwarded-Encrypted: i=1; AJvYcCWNRnW209Gv5dFsMCNzzDntbyZgDrlzEQstvsAWcRpWLaQjvkFRujIbUd0MDTujGqc0X3VcCiTF0n6rSvofSilycD8IJ8lNXOTuRl2WoQ==
X-Gm-Message-State: AOJu0YzjtpNFMJq905oe9yA2OL0DMRy+SScmydJ2nZbmP5HPqm/9mcIe
	y2T++Fg8K03moC4OiJ9s7cBrkFgS1tUU8BvaUc9rHDgat6q9LRDFtzx1o2kbefP9R6riH2Rcg8i
	r
X-Google-Smtp-Source: AGHT+IHcmU+ZC0Xb7OmSscvhRIHDI6QsjQ4mi4VtABxNNxSrLgAKtpjQJSmCpF9XzOuCOpVaraRjdw==
X-Received: by 2002:ac2:4108:0:b0:51d:1d42:3eef with SMTP id 2adb3069b0e04-5220fd7b8b9mr21929054e87.29.1716109263261;
        Sun, 19 May 2024 02:01:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d90b2sm3883215e87.242.2024.05.19.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 02:01:02 -0700 (PDT)
Date: Sun, 19 May 2024 12:01:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>, 
	Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
Message-ID: <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>

On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Simplify the flow by updating the EDID property when the EDID is read
> instead of at .get_modes.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---

The patch looks good to me, I'd like to hear an opinion from Doug (added
to CC).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

What is the merge strategy for the series? Do you plan to pick up all
the patches to drm-misc or should we pick up individual patches into
driver trees?


> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 47 +++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
>  3 files changed, 20 insertions(+), 40 deletions(-)

[skipped]

> @@ -249,10 +228,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
>  	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>  
>  	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> +		/* FIXME: get rid of drm_edid_raw() */

The code here can get use of something like drm_edid_smth_checksum().
'Something', because I could not come up with the word that would make
it clear that it is the declared checksum instead of the actual /
computed one.

> +		const struct edid *edid = drm_edid_raw(dp_panel->drm_edid);
>  		u8 checksum;
>  
> -		if (dp_panel->edid)
> -			checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +		if (edid)
> +			checksum = dp_panel_get_edid_checksum(edid);
>  		else
>  			checksum = dp_panel->connector->real_edid_checksum;
>  

-- 
With best wishes
Dmitry

