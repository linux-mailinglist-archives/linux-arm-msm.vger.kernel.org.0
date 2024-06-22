Return-Path: <linux-arm-msm+bounces-23696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FDF91337C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 13:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D360B20B03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 11:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402261509AE;
	Sat, 22 Jun 2024 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEPv2xTn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8127214D6F1
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 11:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719056790; cv=none; b=EvyXfk+d92VCX1a4NLF+ttoujAhI7U2y4Egx7SkobsfYaLf7udV/H3Rw7SowfOpfPppuBHc7qKKH0bnSoD6WaL5KGmBxUVC4w2BdbzhHjnTnCXaLpo1ae4Y7S3Rw14aIVksEAfDxoSYv0tnwK2qdKXrJmZM+JXoDZwK6NYQfsd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719056790; c=relaxed/simple;
	bh=gx4hwvTb8LTWlFqgqnsjT0ORete6hOvb6C5SPh3Q1fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip8rNf6EGgCiIFzYHE5bn2vH/WVFi4qq7/R1dBpU5XYvesbJODSfr/uqJmNiN3wa+mMjHk6aWszGXbd8uM8Kbl1W5Z755Ob/BZr91NvVGX7lJdMLRu3QwQ7czt0soQPyRu5FClu8lkp9scRhsrE4B27fuq8t1VcE4jUJ8B3T/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEPv2xTn; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so419067e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 04:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719056787; x=1719661587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5GoKr5LpL8zxiF4e6rxCxrhmJRtxBtTG1Kl19ZojU+k=;
        b=pEPv2xTnecTjSCRL079862O9Qae9fy9aaplvsgJe6jYHThmswAty50AL+TzWB7UT0v
         H3f85C4+KkhgCxHlnKV0/RbtOkIBWTpSsaIdhvTdlchs0XEH7kPMCAeta+U9MJ+oA8ZP
         OQlVghMbJr/okPER0OTWskO4lauyR8i9fsCMd8ARXDQTBxRIwA5k40U70Bz5bOZ8nLvO
         ZiLrH2JV2XrYGEDpueihGoAETyJEfUX/mLv5jI7tgsXoyzlNjjgT6X9DQHWX9wytRGCa
         SM4pQUYOJdTfi8lEJcz9hfw3dG7SKBrommpnp3UnDvECF+5fKAxIoOrWxvildbORbq2d
         JrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719056787; x=1719661587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GoKr5LpL8zxiF4e6rxCxrhmJRtxBtTG1Kl19ZojU+k=;
        b=im0P+t+VlaPtjivt0/AZ2oopFmCt+kGl+Tzh2trhMYuJOvy9LrqvI4HW2RUaVdJkfR
         QYOqFNsh+DiDaRCNG0wi1HH6chOWMxUDw+4DXhpUPeTvgFRG7ABx2lPj5nCOR4xMSYbo
         +A7UjEyQyiVZ4teUaNQwStOv0AYVbGlSMju9AB2L7o6N/ujjuMHhshIWghuVwrdEPa0K
         N0Uv2HexKQHd7z9LeeKwabqAWH0vYq7nn7THiQzFeQaQ/mYxPoMW6BJqzTdJzpQBccJn
         SRRszFP67Wc6LrOTcfGMQu8k79n870y3tSBcags34YbLOkKb/6p6D963QjXQUUioEZPs
         32ig==
X-Forwarded-Encrypted: i=1; AJvYcCU+Bl4dPLT9MeC2EflOzBC4rHxTsZRbvIRu/YkS97DwVa8Yv9Jr1YiE1uDixEVblOj2rplyXWKsCmTUoKKlzufngz+ecEufvM5ZxjK1Iw==
X-Gm-Message-State: AOJu0Yz2znKRTEc4j5xNtfYB18r11RE0+smoUivnvPx/t3Mhuqb6B0hi
	8K15+rTcVZK7T+R6jO6lWsRxrj+tDjFspc12N4fIMIKDCBOZ446sVxHoyGjD7+E=
X-Google-Smtp-Source: AGHT+IH3hl6/PlsSyEWBouIFziPH6NwxAF7HPfEv0Hgg9JU/r6Jt/4V5LhdGmq3eAU8V3lfRrusSAw==
X-Received: by 2002:a19:8c17:0:b0:52c:dd7d:3fd4 with SMTP id 2adb3069b0e04-52ce061afadmr190528e87.25.1719056786599;
        Sat, 22 Jun 2024 04:46:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce05e8512sm39826e87.254.2024.06.22.04.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:46:26 -0700 (PDT)
Date: Sat, 22 Jun 2024 14:46:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, dan.carpenter@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: drop validity checks for
 clear_pending_flush() ctl op
Message-ID: <3bbazi5xqwe3dvxyb42ghlzanwba5gvhhltnaqgl3tebzbzaxc@cqezq3xx2pzj>
References: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>

On Thu, Jun 20, 2024 at 01:17:30PM GMT, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> changes in v2:
> 	- instead of adding more validity checks just drop the one for clear_pending_flush
> 	- update the documentation for clear_pending_flush() ctl op
> 	- update the commit text reflecting these changes
> 
> changes in v3:
> 	- simplify the documentation of clear_pending_flush
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h          | 3 ++-
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

