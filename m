Return-Path: <linux-arm-msm+bounces-32549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E1986D99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 09:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35370281F8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 07:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA4B18757D;
	Thu, 26 Sep 2024 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVN2gcVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5305F5A7B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 07:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335772; cv=none; b=t3AGu/wMgPwlfoeMACndUwIZT8yZAVF8+faa3fNxfsa3b/GFpMU7n6yQv5GE6g6MZMInjYYfgEA650jYYgrEL9OfvWlmpef8ozqYTx8Z2d4xUPk4Yan4LSyGmBOyBFXWFkWXfYINoGs4P8izO3r7H8kV9FcAB9hxpR8wGaYJyAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335772; c=relaxed/simple;
	bh=hyDng9HIC9qmN1j7LKcCc4cKPYYV5zQUQtv3xfNBaBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUNJcOzKPCLJZDv4uf59k5OZyoqAwag5JAoQccbx4JoCLXaKk7/BmIIMfBjGl3+IjkowiGrmhvtxCUvrkvfbWDQi9WEUG0N/y1vAjWMXBdsFv4+38qqbAUSFuvnxX3np1lYcO94lenF9hkFPAbW6bAxhBup6ePqz/XvGNbK4h7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVN2gcVN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365b6bd901so760712e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 00:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727335768; x=1727940568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDfxbQPwiokVDYdYi9MFG3A73Xy2Dn6HJeQAftMAmZo=;
        b=WVN2gcVNCbX8uFNSb85Kr4sGTnGV6iOXLibQzThzHYED7XADb44Qdj/DN2hXyCf5cX
         WZV5z3y9+bCfZ87YNAgY64y+YqyWkUu7WknAYHd/D5aPaWpFlI+8QDSkYkddpTQqrPtP
         2NzX0SXSUgRCgOA/XyF8HzLpogLG9Yt6771K2QSjDIO0szlDE4xQMPhPpQIBfQje3SaG
         NxH20sLxtazzaqUa14ALRIow07IkRCgnekXDQeGM2NhF8kc50iQkvzlAuUD6b0Lp65V4
         T65/mlQsTgUk3KHBqIxaArPqQc3YLJxSeFOCtqH+BdN8VSQrXEgunquSyZOa6e3wP7wq
         UaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727335768; x=1727940568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDfxbQPwiokVDYdYi9MFG3A73Xy2Dn6HJeQAftMAmZo=;
        b=E/ZdJBheJHklnVUVYcfmGW+tgMoUbBAFVXDiYAh+WR6YSxX/rWoJPACNvqTqkiHphi
         LN1LlEyi51q91r3aE/BO0X1Mw5j773bKT0J2fR3Pi0eiV5NcD55eRoU1BvsfBaekTIDy
         FAXL91MSJE+fKjFYIHBAV4aJkv85W4FlWk+wE8gvdhzmNuj7L2mDmkqQB1fpW+NSZB4P
         WAnG8LbkUeHzqrYJTMwJXHESXdaOFc8WMR8+o3oMackDSH0WKifA6920RFe+XGHZRIbt
         aY62UKg17py6LytjlpY8Yf1vU3jDf8i5CSdHqzIfcBrFM6VyHNwcS0g/I1NAMU76Iybw
         dEsw==
X-Forwarded-Encrypted: i=1; AJvYcCVC8LFXBm78K/ogyKgM4PU5QEKJcAzzeC3I+1ggsoBc6UqDF3iG7WPVp9OxkLheVj+FwP1T8PnurKN+NJHZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0c31epK0Vxm7SVH86SU2xZiS99UyqvuSvlKt+Iiv9vpmI4Vpq
	ZN8toNJFK9uipiUweK4i7svafD6WAw4kJ6qYaymHa9nksEJ3iBcpQCOqpTOpGTM=
X-Google-Smtp-Source: AGHT+IE8t/WEuR6wLLC+FMdDPRvo5sy/HJiTMb2ns4dr6CTbA9nkOna0DOKv3ZWAngvCWp8t9wgrZg==
X-Received: by 2002:a05:6512:2243:b0:52c:8c4d:f8d6 with SMTP id 2adb3069b0e04-5387755ba36mr3075446e87.45.1727335768286;
        Thu, 26 Sep 2024 00:29:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e061dsm737595e87.44.2024.09.26.00.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:29:27 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:29:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	mripard@kernel.org, rodrigo.vivi@intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/gpu: ci: update flake tests requirements
Message-ID: <llzzzcfbb5gpdcldobqsl5yqgac6cpgcs4r5jh7sbbsuwhchua@avub3pj2by4z>
References: <20240926070653.1773597-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926070653.1773597-1-vignesh.raman@collabora.com>

On Thu, Sep 26, 2024 at 12:36:49PM GMT, Vignesh Raman wrote:
> Update the documentation to require linking to a relevant GitLab
> issue for each new flake entry instead of an email report. Added
> specific GitLab issue URLs for i915, xe and other drivers.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
> - Add gitlab issue link for msm driver.
> 
> ---
>  Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..f918fe56f2b0 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific hardware revision are
>  known to behave unreliably. These tests won't cause a job to fail regardless of
>  the result. They will still be run.
>  
> -Each new flake entry must be associated with a link to the email reporting the
> -bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, the IGT version used for tests,
> -and an approximation of the failure rate.
> +Each new flake entry must include a link to the relevant GitLab issue, the board
> +name or Device Tree name, the first kernel version affected, the IGT version used
> +for tests and an approximation of the failure rate.
>  
>  They should be provided under the following format::
>  
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $GITLAB_ISSUE
>    # Board Name: broken-board.dtb
>    # Linux Version: 6.6-rc1
>    # IGT Version: 1.28-gd2af13d9f
>    # Failure Rate: 100
>    flaky-test
>  
> +The GitLab issue must include the logs and the pipeline link. Use the appropriate
> +link below to create an issue.
> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
> +https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver

Ack for the MSM part.

> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers

-- 
With best wishes
Dmitry

