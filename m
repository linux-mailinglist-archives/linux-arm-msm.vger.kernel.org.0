Return-Path: <linux-arm-msm+bounces-20890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 850FC8D2DAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 08:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C052844B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 06:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF0638DE8;
	Wed, 29 May 2024 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3ROgSR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68436DDC3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 06:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965771; cv=none; b=cmkVtLvdZuXX9G4rYL/ArYe4eyHcFdBMP/8jNi5cK6hbSCxoQdjisNDo/1YoC10096E292+FSDaCgg0xO9bb0HKp758DtspzDBeBTgc7llfgjgc9tqncgJJRCyn6xwpgFWqQ30vntvJEliMzAFVayX3+/ecamU4OFyEc4Cfy3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965771; c=relaxed/simple;
	bh=VN1Kq0JprgKgiY84Fl4GWOkl9GMDYn0hDtl9lNW63Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS5n2M3i/EWA1hbm2KPVD88pENifprSxqiD3YjS24tZNipgi2vO1cl6t1D5wnPZpth11R8RJFJq+tCQCdlkCIwKVQZTvoC2eyfwPr46cXT3hEG/JaHKI0EVS0smm3c/+xb8wQIj4jhSC7fX9AYuoQkGy5abaV0oP1N2tUXofAcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r3ROgSR3; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e73359b979so16753031fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716965767; x=1717570567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8XM/FgEx6d8NuTgtXrGUs5+LoMJwxG6LNXhNDqRvo0=;
        b=r3ROgSR3qYgtnDATBsLE7jiYgXoure9c8tC5+PCxUTHf5emzH9WMgQ9MQQlEIKI4FQ
         tbJQNcI0SSkk+ZEuM0tj+dl2hj+A3C6QbKAZaRJf6qAYr5SaWcQOm9PboR+1XfiJtLf/
         Z9R1hV0KWnj74p9Ki4jD7fA4TqdYjLITgONjbxX5q2E7GprD21V3L2MHPkcQH27uGpbT
         ASYmfuGL5jlaLcZp1qXI9+0t8OSDrBF23oGR3hHfnxu+xF9UA/jXNXmN8SCky6lo+5A3
         KsqmYjTYuLTpssi0AssvRP/dBUEhe1NluCQvaSByixdppreGk9xuI6Pl6rn0JsWWx8X3
         tFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716965767; x=1717570567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8XM/FgEx6d8NuTgtXrGUs5+LoMJwxG6LNXhNDqRvo0=;
        b=XghD5VLHpk8ombwZZd2uXSUlHZO4LUNEY6uL9cpAKvjZj5buIVTAx4cco/63z41gh7
         4hT0Jn4nXIhQII6KdRa3Pl4DpAMXzoIlz6isifiFJQ7jJVsLusAyD8S/S+0YZTJrKpAY
         RZIUKIRkORh2wytHTaeBjUNI+FqZUAUmo138UIbfpcIxxjBfHdgND2VYIO3LK5RvYaF1
         DFU1ePLl8yr50gLRhWl4DBtObUB6IZ/cpFEp+qRjNhwrt2Uz7a13zn/WYmF8qjdFiYKs
         dxzyAG60vVwS3uWQEDHkGY7GkHYVRLRCeQfY7VtBvDzyheL9i7Dd0FqyCM4T1pVXfqSe
         ZDag==
X-Forwarded-Encrypted: i=1; AJvYcCXMnql8ErZ/mcGO/esDM2Qmk3imNhvk6ruEEKhokfEfAqQrVO7trwB0WJC4yhI2ar4Pym3jcQYwU3w729vczfWcXGY9cCtT4MvW9fsBXw==
X-Gm-Message-State: AOJu0YxN9+BGihmxZoMtswBkaH3JDl7dSXRGB8hlnJxw5KoL4awjTyBZ
	QGoRI4u2izcWfMCkUVe5lSAXFHSebgrb62Cs4rFM85eSoLYi19EyRjcMtF3sMK8=
X-Google-Smtp-Source: AGHT+IE8Vr6rfevCpWjYYJnFoMwyjAbgft8519qmMf8AdXmrOTwD8aPPvmWsyWzNiVDX4RqJ44Re8w==
X-Received: by 2002:a05:6512:902:b0:51d:4af6:bb86 with SMTP id 2adb3069b0e04-529612c529amr9109860e87.0.1716965767480;
        Tue, 28 May 2024 23:56:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52aff3f65d8sm88039e87.181.2024.05.28.23.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 23:56:07 -0700 (PDT)
Date: Wed, 29 May 2024 09:56:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] drm/ci: uprev mesa version
Message-ID: <jzb7oa2qtbavelujxwzk5vmcchazvva4aynxo2ceoigthgth2f@j3kjkj6okmwz>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-2-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-2-vignesh.raman@collabora.com>

On Wed, May 29, 2024 at 08:10:44AM +0530, Vignesh Raman wrote:
> zlib.net is not allowing tarball download anymore and results
> in below error in kernel+rootfs_arm32 container build,
> urllib.error.HTTPError: HTTP Error 403: Forbidden
> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
> 
> Uprev mesa to latest version which includes a fix for this issue.
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
> 
> Use id_tokens for JWT authentication. Since s3 bucket is migrated to
> mesa-rootfs, update the variables accordingly. Also copy helper scripts
> to install, so that the ci jobs can use these scripts for logging.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Uprev to recent version and use id_tokens for JWT authentication
> 
> v3:
>   - Move adding farm variable and updating device type variable to seperate commit
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>  drivers/gpu/drm/ci/build.sh       |  6 +++--
>  drivers/gpu/drm/ci/container.yml  | 12 +++------
>  drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>  drivers/gpu/drm/ci/image-tags.yml |  2 +-
>  drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>  6 files changed, 42 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

