Return-Path: <linux-arm-msm+bounces-32373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95081984EE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C60791C22B3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B746913E043;
	Tue, 24 Sep 2024 23:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bcuwTLJ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A213CABC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220056; cv=none; b=JCDz0Yfe5AftHOj/8zep9g5HcwJtguAxIstOYi2l6SqsxoOCuCJD00Dwy1PSEsUyv55hXxXoOHqF/G5HtZuD4eHZHWnUvPNM5Ol5+eIpAJyre6cQfLH7W/8w5E53GpIZuEAaPzoeaA+jCCp28GL6tdQ9+Wj2fF0wT8BB9DKxLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220056; c=relaxed/simple;
	bh=edZ1v8VAiHC/I+a62X2SikAfYFjh+u8NM2NBwll5p7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5EpMxWGECV+GlRhcwC+AsX9iUjvvh3ZaqHAP0qaABBnnZwNqxG9iIFmYh2pXjg6+TXrzQueVfo52M+uJILVrmbZcP4QV2HbH2g5YXfeG4AUvjdMI80s3pWPjbKApi0Q/FwzKD+kaVSKCzay1DWbkWmSM8W66z8+M2CXeg4FS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bcuwTLJ1; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53568ffc525so7178987e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727220053; x=1727824853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWzfcf6swf5UXV9ORSGTxQB8gm3cbeVNaurYZQU93RQ=;
        b=bcuwTLJ1hbWI8rEUruOr6iIvZc+UoPPOWhcaB2EAr2LEeSKojFHARLrn3R+Ab6juS6
         H9XVAz/j0bhpQ9OlQymTyDHftqQPdq1GOFD+CD//OjJ1ZgWBnancJ4534V0lP42O3Mqe
         HUbb91sBxD+iShd2w2aH0TI+YgY/6U+wcRZ/OrUxq/EXDMCh6t7y6S86axnrgR8km+MJ
         VTP5MaNz4fJm0kUgLpDPQXw/vnGIGOVXHxCF3Rw9zNzeDGberR3mQOxSaeOODEfys+OZ
         a6AD/dBDDOX9eVzZC4hLmz/5i89rNXKy+d3n2Zme19JdSK2S41gkiKMjbyw6FxkzL9vK
         kwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727220053; x=1727824853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWzfcf6swf5UXV9ORSGTxQB8gm3cbeVNaurYZQU93RQ=;
        b=E4BFd+ygR8GIQdeaR5doLBNng5/XmRoPlz4YVT8ZWn244feEg0iG8+5vkK5umCQ0kX
         BYEHIIcVZPQWCxTEvO7CTIsZaX5fPwCcsuqGBy/snAPScMmk7GApcvB2z6nrV1VGVX7r
         +6qcmsFRW53rTa0sFmNhg/LU3El16c19cIXaQSQuAVfYVmX6+zq18gmNSP9woZwIF1lj
         o8fuli6fcFXC8s51TvtdcTr4K7nPhqi9GifnMGAiLujTsLBqB1PwTmBnRdKJBTJbzqeq
         2fND+2pRsdc4Dyy4r841Sgh7BtqcBn2r2iIIwAB68mgJtB2rcKWe2THlxzjICilsvfJC
         k9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXGG6D2o7H2i8twEAHJRRWZROkqtA+BnM0104ScGP8NsKrcW9dGJamd5VTqV+RxJYpvNaw+OyVEsXMnipM5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsr3BieMhR+gDPaJYd9Jc37/zTcWAgMZWm2BmdJowNJJ2KL4rs
	8Bz7yOVQbwwDO3qI2qp62+j2tUUbs3ijnsX93vqP+30VfUSleZhm2Xou4/NKPSE=
X-Google-Smtp-Source: AGHT+IESGsMzP3PiA/3G8ZUYZ/H/NJt4oS6oNv8s7w5wDXiDCuL/i1Jv8EVQQsMqXIZrtQBGpouHtw==
X-Received: by 2002:a05:6512:158d:b0:535:6d34:5cd7 with SMTP id 2adb3069b0e04-5387048b99fmr414470e87.11.1727220052701;
        Tue, 24 Sep 2024 16:20:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8648ba6sm351603e87.209.2024.09.24.16.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:20:52 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:20:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 12/22] drm/msm/dpu: Add RM support for allocating CWB
Message-ID: <rfow6h3s4phb7hukdlpaivxd5ytb2dj2gh5otejwyqghlw5zmd@efediqayw7gp>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-12-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-12-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:28PM GMT, Jessica Zhang wrote:
> Add support for allocating the concurrent writeback mux as part of the
> WB allocation
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>  2 files changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

