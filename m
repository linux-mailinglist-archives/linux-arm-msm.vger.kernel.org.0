Return-Path: <linux-arm-msm+bounces-28376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA39504EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 677DF1C220CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8406B1993B0;
	Tue, 13 Aug 2024 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTUa+Vgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEA51607B9;
	Tue, 13 Aug 2024 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723552240; cv=none; b=s0qT9lfUnIzKweUf0y1VKY+RLHa6APLdaCyVnvAU9Ji7z0JiSHD0q8FWKwSFwIudzCglZyYYXuXJYEIEygFVfCvpQB/Oh5SLeuYg46UlQ982xLEBQSkrn/Pi0VkqCl89z+qBBfYu8LKGGfV+psmLMNPh22a5CvoRj4T39aahjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723552240; c=relaxed/simple;
	bh=Bf03kCzunxvLWSpf5AoDKMwIkfakEX5Ko3m/LNWbTWo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hQHkEU1CJ+BK/I3h5T0MnZou0bjhrkNLKWKOdaQvsvuvt6XxWm3wDpq6GevN/wB1syzSrv5yNl1ZUpbzAOUawo2MP/64FyfyQM/pymBxkmIiLVnw/RhVkpx5rgREp+mqJiCDgsCOcxuBHCjatAS1uzCI16DcSOnPxbaJ6+BPDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTUa+Vgz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723552239; x=1755088239;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Bf03kCzunxvLWSpf5AoDKMwIkfakEX5Ko3m/LNWbTWo=;
  b=DTUa+VgzRLQUqS/80v+vTvVfoD26PhSiRegpzttkwWl0OUJUU0L+iSVx
   wEAsthyghlPGRVGBGZbVjFflvDjI10BPKMRoEr4P9KxpU1C3Md9CzbsZQ
   lGtIhyu/HMgG8YJDw1J+fBP53icy3Oq01wekfP6fhicS8xo0vL00RMORj
   jzG8NtfxWcfiG4xj+DBe6O2j6Dprv4JOU/B4I2bCPrb+Dua9cT5W5Jiyr
   FE67qDRRhWv/bEvlQEOcnQZwbqrBRC46PfC38UcGESdxRFJ7C3j1Vo2P/
   C5Mkm7lvV46e4Aka7Cya7UjdCm8gO02VTDnwtAX/gpjFvmCTZktcLw+78
   w==;
X-CSE-ConnectionGUID: c34zK2I3Q+GSS8WSc0mdKw==
X-CSE-MsgGUID: 1ryWYeNXRiSpd4djqS8E2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39221326"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="39221326"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:30:38 -0700
X-CSE-ConnectionGUID: qtWjaBwERFa10eHsS3v7EQ==
X-CSE-MsgGUID: fPfimmAFQNCwxlU9l7N0XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63598538"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.169]) ([10.245.244.169])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:30:35 -0700
Message-ID: <45b355b96bab31ac1c28a24c82d3edabf081ada7.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/msm: clean up fault injection usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, akinobu.mita@gmail.com, 
 akpm@linux-foundation.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com,  robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org
Date: Tue, 13 Aug 2024 14:30:32 +0200
In-Reply-To: <20240813121237.2382534-2-jani.nikula@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
	 <20240813121237.2382534-2-jani.nikula@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-08-13 at 15:12 +0300, Jani Nikula wrote:
> With the proper stubs in place in linux/fault-inject.h, we can remove
> a
> bunch of conditional compilation for CONFIG_FAULT_INJECTION=3Dn.
>=20
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/msm/msm_debugfs.c | 2 --
> =C2=A0drivers/gpu/drm/msm/msm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 --
> =C2=A0drivers/gpu/drm/msm/msm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ----
> =C2=A03 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c
> b/drivers/gpu/drm/msm/msm_debugfs.c
> index 4494f6d1c7cb..7ab607252d18 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -357,12 +357,10 @@ void msm_debugfs_init(struct drm_minor *minor)
> =C2=A0	if (priv->kms && priv->kms->funcs->debugfs_init)
> =C2=A0		priv->kms->funcs->debugfs_init(priv->kms, minor);
> =C2=A0
> -#ifdef CONFIG_FAULT_INJECTION
> =C2=A0	fault_create_debugfs_attr("fail_gem_alloc", minor-
> >debugfs_root,
> =C2=A0				=C2=A0 &fail_gem_alloc);
> =C2=A0	fault_create_debugfs_attr("fail_gem_iova", minor-
> >debugfs_root,
> =C2=A0				=C2=A0 &fail_gem_iova);
> -#endif
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> diff --git a/drivers/gpu/drm/msm/msm_drv.c
> b/drivers/gpu/drm/msm/msm_drv.c
> index 9c33f4e3f822..6938410f4fc7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -58,10 +58,8 @@ static bool modeset =3D true;
> =C2=A0MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don
> (default), 0=3Ddisable)");
> =C2=A0module_param(modeset, bool, 0600);
> =C2=A0
> -#ifdef CONFIG_FAULT_INJECTION
> =C2=A0DECLARE_FAULT_ATTR(fail_gem_alloc);
> =C2=A0DECLARE_FAULT_ATTR(fail_gem_iova);
> -#endif
> =C2=A0
> =C2=A0static int msm_drm_uninit(struct device *dev)
> =C2=A0{
> diff --git a/drivers/gpu/drm/msm/msm_drv.h
> b/drivers/gpu/drm/msm/msm_drv.h
> index be016d7b4ef1..9b953860131b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -33,12 +33,8 @@
> =C2=A0#include <drm/msm_drm.h>
> =C2=A0#include <drm/drm_gem.h>
> =C2=A0
> -#ifdef CONFIG_FAULT_INJECTION
> =C2=A0extern struct fault_attr fail_gem_alloc;
> =C2=A0extern struct fault_attr fail_gem_iova;
> -#else
> -#=C2=A0 define should_fail(attr, size) 0
> -#endif
> =C2=A0
> =C2=A0struct msm_kms;
> =C2=A0struct msm_gpu;


