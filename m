Return-Path: <linux-arm-msm+bounces-40157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E901D9E2FFC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 00:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C071C1620FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 23:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D13F205E1C;
	Tue,  3 Dec 2024 23:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEpoBOFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD7204F6C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 23:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733269296; cv=none; b=JnBFXGZLe4+PI3IT5erA20nbXXO7MJltmjm2GiQadhw23C3Fn8u6lcgeLqw1xWPEGl6+f/xlMDT2AFMCM8wWd54iEbckelMtv2B4o3aWBISkn36J01AoavG566PKiAWzQP+Pjr06s2UkOf17ituZt3nbCCv4VZYy03iSPB0nBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733269296; c=relaxed/simple;
	bh=IAZbSEl7axZpnA0Rp9RrVKGXmVc6T23ttnL5W5XppM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVxAPjKuuU4ncfb2ufEIWSceYzYuyn7cMpd79iDIXEHiaMvbf13lh8thK0WZjgWTrUNzZ0eopYBbCC7otHmPfX8CzC+hwRmj2tdvuMIU+cs7vafMQuXvrR+ZJdiC7TNychp8LfB6fikR3buMdf2+2r83wuiHYLZha2Tb1wD7Wo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEpoBOFN; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de035ea13so6285829e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 15:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733269292; x=1733874092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8VaC+AymHtSt0FKShOF4pPudg6QHjxqRoyWJzcS7cQs=;
        b=yEpoBOFNMztwSrI7gT4n5qVnfN1CR/oXSF5dGrouXKMqmZU8NFooOvGXgVPhSphNBF
         O5i2MV9cYgAv/NlsCX0lTukNGcJAd8/vGYnA69ms3nIaeD2AmuyFW7XwmoVHWBqQMmCo
         pQ8iECET8wSkbRONKIQoD1l7jy/ftUsgaxwc7SPO1rp1Trr8UqO1NTpX867bDSG1LkFt
         PYljy6ujHVwMrIaJgi+wd1Rm/D9rnY9eIqRHRtqF2d6nUASu0dO/cP8F47guizciS0Db
         JzqljQwvXEAq49dE/3ciauwP6j9zuTzP9Qi4ktlyMaShd9IpEyjZP9w8ezNIQRn8isX5
         XZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733269292; x=1733874092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VaC+AymHtSt0FKShOF4pPudg6QHjxqRoyWJzcS7cQs=;
        b=DKKDlHmvekVeIdpl5v5JJiGXo/wHpqX1iEsvS09n21PBqT8O16HQhNanlmF3nX+pAf
         T/zYKA5ahmrddqqOaPkf86ttCXtXginCZQ859tV5TxJmn+wmDv3CwALHhNIVU9ZHg3rZ
         nTj1+qw6KW+VUSwsRxcRQ0hMxwOLWSaj0rCaUSOP9O8NZSmUS7G5dCX/DRwZUBiA31eY
         lGiJ3+XVfpCXUrTZlpe2ygpadyMHtw0CkhV/9oDa7K0Rb8B46hbNIBhStwwp3kv0cXBe
         fH1RdDXhpA6H12NHaoDuxAHmeML/pJmGeN3qO1+I/DqAacDcEFZEBgZtjkKxhgG57dRg
         LnfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEyS8eWJM0woTrR4G5LwIu6RpNMaj7vNQoL0FZMGmIaeI4SZ1+jfMvzW/t/zPBoJ9O0yZhPt0GRzLjhhYS@vger.kernel.org
X-Gm-Message-State: AOJu0YyqqpVjCTUjirK6o9k3r2EAIH1DJmRwAruhc9m72AaY/njnLgAf
	BK7l7cHgKkI7qVIXvYfxvxh1gkaM1l+AhKDZ/lukl32Lz06ryCN0KpLV3bky1C4=
X-Gm-Gg: ASbGnct0g5RSnKe4mnMJWiHAYDtHFFsFHCW3KZ+DwGcBDO66n22udUGU4jryD/IN+Cv
	C2Hs4EiqfX1/MqSS1CVJUp8uZ8ysKEOxNGUSx0wyvtFRzw0sZn+GsTpCJKxVpRHJ8XJrwkgIpi5
	A/AIlFE+l1JABtvUUmt7Dp4mbpNHVPBJVp5kzs72Vlj1NAowsMJw2DLheTW5MPumqsBVLRz3HX3
	VNoB0iYIrovCDCOY3Fsd9WOAKfqdsUSRCa3C9BEHoSUNG3+7YxFQ2HEpoKf/jKW2x2QlS+OoIv2
	fnFu28o0zy1G0tA09uB0tIMOyrRkyQ==
X-Google-Smtp-Source: AGHT+IHKVny7lfTjFjv8vQ1LYIothrll+JFM6c9K9LYC/aAoAQoTnV/eiGZCUxd2b4XbU8ATpvpJTA==
X-Received: by 2002:a05:6512:239a:b0:53e:1364:f982 with SMTP id 2adb3069b0e04-53e1364fa93mr2296539e87.17.1733269292308;
        Tue, 03 Dec 2024 15:41:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1356906esm371633e87.15.2024.12.03.15.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 15:41:30 -0800 (PST)
Date: Wed, 4 Dec 2024 01:41:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danylo Piliaiev <danylo.piliaiev@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/msm: Expose uche trap base via uapi
Message-ID: <owl2yqfvo3riismpltxu2puytquy63hrx375mxedntfjxq3wve@yhofuagrozeh>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203174011.731980-1-dpiliaiev@igalia.com>
 <20241203174011.731980-2-dpiliaiev@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203174011.731980-2-dpiliaiev@igalia.com>

On Tue, Dec 03, 2024 at 06:40:11PM +0100, Danylo Piliaiev wrote:
> On at least a6xx+, shader could read 64b ALWAYSON counter
> from UCHE_TRAP_BASE+0 address. In Mesa it will be used
> to implement VK_KHR_shader_clock and GL_ARB_shader_clock.
> These extensions provide shader functions to query a real-time or
> monotonically incrementing counter at the subgroup level or
> across the device level.
> 
> On a4xx and a5xx it was not tested what is at UCHE_TRAP_BASE
> address, there uche trap base is exposed just for completeness.
> 
> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> ---
> Changes in v2:
> - Rebased on top of https://patchwork.freedesktop.org/series/141667/
>   in order to return error via UERR when there is no uche trap base.
> - Updated commit message to explain why we need to expose the value.
> 
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>  include/uapi/drm/msm_drm.h              |  1 +
>  6 files changed, 25 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: in future please don't send new versions of the patch as a reply to
the previous version. Please start a new thread for each new revision.

-- 
With best wishes
Dmitry

