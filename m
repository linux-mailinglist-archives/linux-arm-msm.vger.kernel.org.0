Return-Path: <linux-arm-msm+bounces-36618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A579B8495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ACA41F214E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12B41A76D5;
	Thu, 31 Oct 2024 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdMogtKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BA31411EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730407650; cv=none; b=mg3wks4AFFUzLckKgs2LMeAE1Ex+SvqAHftdR9slz2BUG3uMOgyHA9p6QyXUC6Pqlv+X/btDfnAkdz/ioybXZffs7kxlCl4Vw3CtWciozlsntYSZyjPNsfFrNjPpW6WeOY9N0nU3XXpn5xeQAIWIjq6klMl21iEV1OYFTbnw8pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730407650; c=relaxed/simple;
	bh=2ymDuLHrHKOZIPEp/lcgflCSWmXraKrwxJnAV43fOzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F458dX/MWKMKMwTTCtFIsuMN80w5bzwIxQmvZ2pn3Qhh4bmXUPO9/b230rN7CE4Atc4OIY8mAe4u3HBV158CHxdTw+JlYFdmn8Sz/X9JXD9KrifZaMfThp9axmsaZLQs6YOkOM3NI3RpbgETDcyATQoBOWax0WoIIr4nJb33xaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdMogtKY; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539d9fffea1so1387277e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730407643; x=1731012443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgPmCiNggr8Eodac2WJsUSL23THVr2DjeTdd/A/XD6A=;
        b=YdMogtKY28UVlL+yngg941fPcPiO5cPbwYottDY6FZHgnxjOPCsTSEWeNs/U9EKzxH
         InYFrs6+OFbV45tIbXFNhRffowi3s5WHw9am6OkIBafSzoNyHydVI9wqs4B9KH1i9l2C
         Nh+AW/w2imivuc+LhLrFtG41lP9imLmBx0EV0tAVC7WK86E/iaPtjYoOGXKTL1MEyEqW
         8wyz5aC+LYgrMN50Rd3P8XulCwBSYdzKkWe+WqHQjAqUirxhnm/s7hqfelgDWtqICxaz
         3pNY1eJ+bnJGqvxWMaUErN1nj/maxLqB3Y5l0Es0fF+CFByILzw1kgyjR6NTgIK74Acz
         NaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730407643; x=1731012443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgPmCiNggr8Eodac2WJsUSL23THVr2DjeTdd/A/XD6A=;
        b=TIQDgtICAOAtTST/ChYWoJsXZqkVYYkm7wKHPcwqptovkjiH3z7hhPXRk0TX5/ozK9
         0ucF4hocFXzv/blYVt/Au4eGO7XVez2cmQoVKVtEQl6jhgIXs+RfgSeQMyq9MkBbpmgT
         nntOIIQ39KuLjwv8v3KVFNUEpr9Zj6UogO4Q0wfjhPzs1e/K4QBJVYsqruIfMhXSPlyJ
         KeASfPdm+EVd3ucH2Y2WelgzbSUlu2L8uqg/ey85PdrF2v/qmOBYJGnucx9ZX2e7DWOO
         Pv5tAKAsI5c4MISbC+kxUwQENxdr3swgJNCLv4a9UDoV7GL0w3RZEb/HYPqDU6OQZWPW
         srow==
X-Forwarded-Encrypted: i=1; AJvYcCXSyUJTp38P5uVuq0JN51J+aJH1B2Obtl/r+3NZVSxBZ4PfypNeqocFEDica5naDrAazPy31/UJW7IWO0HK@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBoCOe7h0yNN/PT7VjY5iC//kPxwLN2d7TpNqcTjs3UWjMbI3
	nlumiAN68hde4SmfZNEHxTM6FpyPgkuz697iMQpCqXpqu7Mabs4YyzdOVEeeVoI=
X-Google-Smtp-Source: AGHT+IFAR1erl04uTQLkmDRo3rHixZEn9QHV9hdNp48+CB7xxjvrtCViOjmu2yETWU9yo4NgP1yaoQ==
X-Received: by 2002:a05:6512:3b08:b0:539:e97c:cb10 with SMTP id 2adb3069b0e04-53b34c5f73fmr12025275e87.40.1730407642941;
        Thu, 31 Oct 2024 13:47:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde0ab4sm321225e87.258.2024.10.31.13.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:47:21 -0700 (PDT)
Date: Thu, 31 Oct 2024 22:47:19 +0200
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
Subject: Re: [PATCH v3 05/23] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <4rxvkk2ky2rwgr6bpeezbr5oy4c55ntioequu5uwpcgwddjbrf@ogp5b5bs4dsr>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
 <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-concurrent-wb-v3-5-a33cf9b93835@quicinc.com>

On Wed, Oct 16, 2024 at 06:21:11PM -0700, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
>  3 files changed, 183 insertions(+), 123 deletions(-)
> 

I tried applying the seamingly ready part of the series (patches 3-12),
but this one fails with too many rejects because of the 3ae133b0192b
("drm/msm/dpu: move CRTC resource assignment to
dpu_encoder_virt_atomic_check"), which we picked through msm-fixes.
Unfortunately I can not pick those without a preliminary rebase and
cross-check of this patch and the next one.

-- 
With best wishes
Dmitry

