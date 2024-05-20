Return-Path: <linux-arm-msm+bounces-20053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9628C9BD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 13:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED0E28349E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 11:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D10A5337E;
	Mon, 20 May 2024 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIexqk64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E9182DF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716202995; cv=none; b=MBtH3vUcq1SlChJ78wZiVGvt7kZgGaHA+KnZQOlzkh98YlJfbRBdDxGl/LMQMCVJvBAt1zG5jZmUgj0MO3wtL7/oAKWifQD83NosvhiRo8DCaJdmdzvpwBDeQVla/Dusu3EgH076T5mNUq3xFkYQbtIxwhgil7Ai18nSIVeI9Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716202995; c=relaxed/simple;
	bh=bmRX0Du5YIWf6EyefB9p66Yf7FLiWGJlF+AIqUB/FjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpNpgG0R+sDmN+rKM3FdSxD5d13ik7sv8LKmovCUggPjgyq4QnOKL/9w4ChNLvBv6YUDLuFcEhHMvAS2dM2e2uD+5GvSp8gX33EUOPiIRtj1ohS9FamjK4CemmC5G06EWqm/Ntadu+3SPHiZuBssh/JoQZVz/5yTS/9Ctjl+KLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIexqk64; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52388d9ca98so5176653e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716202991; x=1716807791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDt5zL9HqHL0LNTVxzu6RK9k/3ub+zUe1M1krBVr+UI=;
        b=hIexqk643Cqu0SJT2YCRJ1t7MiZFYAeTDN2c4SjzbZdrZjhClFwZVuci8U7zt/RZtC
         iINOQOVe0bgHUEgvYW4rTmngkXAWdlTtnzkW9SrvniVmEGVRhYlhutqYE4BTG5NN8u7M
         JtCxI5zENy6kQTiitE4t4HyDhMln2bO/M2DYmOGV28HW1Ugvo8nEkCJaP4cGe9xk//Fk
         RjTiKCXQ12AvpxN99aAMyzDKWNI9sU65OYjiIg7bqy2Cl6I1T5YOj8Wu8qlS0vdRZcJX
         FkTRLJ1PFeZ4B/JNTog7d3zF+utAKUtDOdAEXhizrVSGzXJA3RibwlF3D6kgky/4aNil
         lvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716202991; x=1716807791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDt5zL9HqHL0LNTVxzu6RK9k/3ub+zUe1M1krBVr+UI=;
        b=DE02IyJ11jQZB333hQEGLc7PRidqs9IshiBuQGKS/44JD1mne5v1Ll89tgNb8irxkP
         OOwxUw4gwsQLUdcvBxgeBYOpKRE/QMKVgd4FwEtOoA9cH4OM1AB/pHLJLqU7C0GKq1ir
         9Hyd1JOKh0Swtp6kHk0BvRKK81HALMFZ9drLI60rRLpZsZ6nAWlsnZc3rpnbeQFuDRnM
         R6PoxVD5GpCeYnZFrCkzbj1H6JvTbtm3FTIRVPBrfSDRpz1PS1lnZmTROX6q2wTL42UW
         Zi3EJuIqp1onV/0FV2ReXoDwAwTz81IUMgm8jcuzuT7iWiSXD5/BidEszjsFz8lhE7Ji
         0gpg==
X-Forwarded-Encrypted: i=1; AJvYcCXVJaSq8DWoWbYHPWoAtud8uLqXDDiqL93zf2yd7IWa/l4MiwfbgWMsj35wcm2Kc7xJOn4L2s+s500j0buaK1tcQ+WuzRgcZcYPBAX+EQ==
X-Gm-Message-State: AOJu0YyUW7Xu79C4gqNhwIAVHH6SYCNwK1u/2cSz7Eyex20+g1yUU8M6
	gcBCB7g976kvPmhjLlxBf6BvYbgV0/rqAZchOd0VkFlxZ1/QlvH44NYdHhJqxQI=
X-Google-Smtp-Source: AGHT+IEACx6wIZ/owZMa9fgLdIORVLGiIVgPJ5CApXgwF8B9qZycal7wPuLLAhEdV381KLhAEa79fg==
X-Received: by 2002:a05:6512:33cf:b0:51d:9291:6945 with SMTP id 2adb3069b0e04-522102785abmr29386158e87.44.1716202991332;
        Mon, 20 May 2024 04:03:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5225132505csm3241339e87.116.2024.05.20.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:03:10 -0700 (PDT)
Date: Mon, 20 May 2024 14:03:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] drm/ci: uprev IGT
Message-ID: <4hnd6bznqsp3ve7dh6uhz3ygs7yyapqcrainnqlhfejomcdbvo@htlnfpqb3jg3>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-5-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-5-vignesh.raman@collabora.com>

On Fri, May 17, 2024 at 02:55:00PM +0530, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds and they are required by drm-ci for testing
> arm32 targets.
> 
> This is fixed in igt-gpu-tools. So uprev IGT to include the
> commit which fixes this issue. Disable building xe driver
> tests for non-intel platforms.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Split IGT uprev to seperate patch.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

