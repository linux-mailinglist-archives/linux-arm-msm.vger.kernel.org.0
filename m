Return-Path: <linux-arm-msm+bounces-36624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C5D9B84F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 22:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84294B26414
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611D61C9DF3;
	Thu, 31 Oct 2024 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cjjzr5jI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177E13A87C;
	Thu, 31 Oct 2024 21:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730408895; cv=none; b=nWD3Tf0TjPKFfSzZ9ZrCBQxE3DX9aIgWemH1DeW01idYV6ZpJUE7Z5V7ecg20YnyQRzbSZ1WxEbNyHbnbLZA6EWbpMEaN+Tg2EBfer7mDjiU7Mye/9R8t3sGbOrSC3FCBdIYXUN3EYNUGYT7aJXukbEF2m9XEn1J8MMfIIHdAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730408895; c=relaxed/simple;
	bh=MskkAwGzR4Xb9GOIMxqvO2yFYtiuGRuTFN0lPBXNzjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnl4di4u0zd9asQipjaT2IZxFkDB55AcpNvq1pa5SiQtSlZ9d73VyC0j7j8fPwABbu7A8K3eyvo4XFPStTKo8iCNFQOSnkCPBvfSJNWFhfAeE65zGnveMCvhww0OTX/dSA4G9ZvIvMvsIv8h0vqOgtEqksK1AmL00OqEWVW1oDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cjjzr5jI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730408890; x=1761944890;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=MskkAwGzR4Xb9GOIMxqvO2yFYtiuGRuTFN0lPBXNzjQ=;
  b=Cjjzr5jI54MEXnWpifc/jIVCBYPSvaisZtkvfNIj3kIaTGr95OKzYxiM
   rtS8/Rk5nQKDQgiDg2iRh55tVoYr/wBO+1CWGZWeicdMCq5P+o1k3GyGi
   LsasBEn1lDzxb7TAmjH7bZR9IRp44jhsKZi3tUMwnAG0o4qKCjYnIhFT1
   mu7Mk8PK2TjbYfRpfDku/Vp050DYvRTdMpbQuUH+t/t82bQZVJrshUbFr
   V4z5lgYu4CEY+2DaPR05tVVN6X3lJgVn1sDz2kbJF/AaOA1ixTPluAPyT
   5zOjQIIJUiniX/RVVlsvqlXsTi7bcVd1DOV/G4QcdGyBSeAh/KAPerpvY
   A==;
X-CSE-ConnectionGUID: lWExcZ/WQ7mQ2BInNLX0bA==
X-CSE-MsgGUID: JN8vEjkIS2Odz87NWAzdAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30359911"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30359911"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 14:08:09 -0700
X-CSE-ConnectionGUID: mIgV1Pw3Rkm58OhClUvVgQ==
X-CSE-MsgGUID: YB04KzZ8SNaqJlGvMCXuNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82880364"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 14:08:02 -0700
Date: Thu, 31 Oct 2024 23:08:35 +0200
From: Imre Deak <imre.deak@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <ZyPx0917iWCeLqVA@ideak-desk.fi.intel.com>
Reply-To: imre.deak@intel.com
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-3-cafbb9855f40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-3-cafbb9855f40@linaro.org>

On Thu, Oct 31, 2024 at 05:12:47PM +0200, Abel Vesa wrote:
> LTTPRs operating modes are defined by the DisplayPort standard and the
> generic framework now provides a helper to switch between them.
> So use the drm generic helper instead as it makes the code a bit cleaner.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Acked-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 397cc4ebae526a416fcda9c74f57a8f9f803ce3b..0038608d29219ff1423a649089a38980e95b87e4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -118,7 +118,7 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
>  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
>  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
>  
> -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> +	if (drm_dp_lttpr_set_transparent_mode(&intel_dp->aux, enable) != 1)
>  		return false;
>  
>  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> 
> -- 
> 2.34.1
> 

