Return-Path: <linux-arm-msm+bounces-18919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DDB8B6F34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23DD9B206AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2412F129A6B;
	Tue, 30 Apr 2024 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vJ2LtBs9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2C129E6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714471798; cv=none; b=rjVatzcBLUOjoylabgrXP/Qs7b+M5A+Dj21yCixWWbU5jj62vH+uTlMr7g9zZ/IKlf0eucNhTL8VlVZVGypXR0kCx+KfqevDed4k4wO2Elyj2eXQGC/lWOlymDkk/GR2BVOeUeUIzoPj+MejlY7cO2CYikANZDtisiMNhe4MGqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714471798; c=relaxed/simple;
	bh=mNpTAbsh1hHbVBOwdxXS11hKaRI+rocDAKPjlm5GISQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epbaix5JWePRfrJJv34IpItcjJY2nOXSzmmeLyKn85SQfe3a2w9Yc/jCKpD06RzSoOzf7tUemDIls+VsKE2foThf+KRF6UMB9UD2i4fCyTpz8H5NE2irPZ+QJdQj9tXpxv9Q61oLc2VL3+bRxC7PkzMKOGysKESYrwRvGEmGqG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vJ2LtBs9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51dc5c0ffdbso2270605e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714471794; x=1715076594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mbwpFJFih7RIT1NY26n8+loi/ZJwnp9wrw9uANwmIA=;
        b=vJ2LtBs9Ac7rh9MclTw0anqr8q27u8wRxQND8CMMPDI+d8uo0XsnkdR3412fz8INVS
         rIP8vKXEOx26IaPOmCA7/OgUnVs9I5F4Yh68bK9eF3tkJWeUq8kYaSgJIriLmCyvBQwp
         THwSYtUaQvnlcvFLDFo0k2UozcGGGkDAAiy3KgEpV7PNKrt2pQ4aQ7JDt+YYRE3+2rAR
         cGWzCP+sJNQiPJqSFvdfVzbOlyHJabAA9O2M3eF3PHI0qnz3sMIUF2u6NlqtLWRWtRFX
         vEnkTcmVMsXav/rECjxY/OifYoawISSRol6knOOjoe714MnESGF+XOjSnt1/nHI52UT3
         /RPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471794; x=1715076594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mbwpFJFih7RIT1NY26n8+loi/ZJwnp9wrw9uANwmIA=;
        b=MOvNmv622pcK/NYKeiUvY31dHKZ/2/D63WlA+sUPOKWNNOpRgrUrKGoDisfMNxS62/
         pXjb5zeTfzusev5m/wDuUOleSNXMKqAK0e0EIk3kpvZZYAnO6lsgh/RjuwdXNxiJeAVq
         KN96pgtr+ZTzDPU63zZkaWPRFKQPpodhpk4nt2nvG6mvZa/Yno/GjM3jRD3jUFCiRBbq
         Ym02md6QzFvnwxOMm7O13t1ktJpOXzlL+oz2OyRs90w1jn+0M0dFBYeUtwD/4PJ4znAG
         RzxlMzkNun/hQwYS4yanH8/Ew539Ms6ukUsZ+w9P+FoROVF/MeEFiIolKu8bl5Ao5kMd
         /W8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2mKe8wOOLE9Z3Bxs8xQzJW1HTdKVG6SgS6cB2n6LE15brrkXWJa03esmyj5SSIKm6Ae83HX/RrFJzeWFpwxL+txtGz8k+EVC2arm3Cw==
X-Gm-Message-State: AOJu0YyY0RlZ0pb8VGDByylyezZOOzanSSbgu5SsQ7iHLHdCFd7lQQlF
	BciA6TMJf0zDNAlg3MpaOex/Wp9/kPpjpdCQIGhEXjfdd7p7CDLtxP9MgVDkZ3g=
X-Google-Smtp-Source: AGHT+IHLFfBk+3bT5MCPiG0Sy+oXtj7PLWqAxH1nSKl7+nAmTFj46bAxdYE1eFckW76M0RQSsj0nqA==
X-Received: by 2002:ac2:5607:0:b0:51a:f596:9d53 with SMTP id v7-20020ac25607000000b0051af5969d53mr1449277lfd.42.1714471794305;
        Tue, 30 Apr 2024 03:09:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id b30-20020a056512025e00b0051bc39ef08esm2453377lfo.10.2024.04.30.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:09:53 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:09:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/5] drm/ci: skip driver specific tests
Message-ID: <esplx2t6yfrarxflxo5kq2lstx7uiy2atzcxtwf7kugsctnkat@ameojtgtpopj>
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
 <20240430091121.508099-5-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430091121.508099-5-vignesh.raman@collabora.com>

On Tue, Apr 30, 2024 at 02:41:20PM +0530, Vignesh Raman wrote:
> Skip driver specific tests and skip kms tests for
> panfrost driver since it is not a kms driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt   | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt   | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt    | 12 ++++++++++++
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt    | 14 +++++++++++++-
>  .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt | 12 ++++++++++++
>  .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt  | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt | 14 +++++++++++++-


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm skips


>  .../msm-sc7180-trogdor-kingoftown-skips.txt     | 15 +++++++++++++++
>  .../msm-sc7180-trogdor-lazor-limozeen-skips.txt | 15 +++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt  | 15 +++++++++++++++
>  .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt | 17 ++++++++++++++++-
>  .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt | 15 +++++++++++++++
>  .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt | 15 ++++++++++++++-
>  19 files changed, 260 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> 
-- 
With best wishes
Dmitry

