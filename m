Return-Path: <linux-arm-msm+bounces-32178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EC397E618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 08:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D67281056
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 06:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E18917C79;
	Mon, 23 Sep 2024 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEiZNK9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CD112E4D;
	Mon, 23 Sep 2024 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727073497; cv=none; b=iXfnBocEHTkDIIokq6t8NPHMeGASb8D7KmD4YnroI/+pXRfMfdA73T2YoHlgD/o56211p6Fd3HO/Su1YLy7YlSlxnzGbox3bibQWkFS4P67STECZdLrhzUpU3df+froowTNYmUS+YZ0nfQrGOL6kOAs7Zb89IiVD8YLrlHfwLB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727073497; c=relaxed/simple;
	bh=adkwsWEFcrcrhBa6//oKeGXzJBAGOjoocn+XTlCL0qs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aIDrPAxWRwGjReOaCKwIOOSoSpP1G8Ci1S/gyr9p2JZPgzI4lvO7Dx+ErjWBeu6aRRxvcm4A37x9INWhRgX6VtWpJweUz6Ff1s27LcZz8/xJbjMF//mcX0nGu+f7uj9YIAYhshLeZmOJAzDyw/Np62Ky2poaCoEPKBW/K3Ikzhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEiZNK9l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727073495; x=1758609495;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=adkwsWEFcrcrhBa6//oKeGXzJBAGOjoocn+XTlCL0qs=;
  b=mEiZNK9lzeJv19r0KYrzHcoU+vqtKK4GAL6P1+BZzsc2YfF1uheFdMwp
   GDwbqHfJIJdru94uljINK0Z40d31thDaQM3kWFOeaIoZXTuGiaHcFlu/+
   6YoqchovZqjO7keNUlp9HXgJp0eT9AYc94IyhRKVah59FszGCac75Kqkt
   kdo5z735RZAEutTzt17iTI3ixMFppyGVFFnTANMlhkhOSD7uLe1HVJWdr
   LpleF1nbPJ8C1AygTDcGyLOBFWullHNxaanMpdXcyPz3FfV0L35AjTdAQ
   e3oN9mQVO7ehAwl5YxYYTAc17P8MUtjMs1p6GrmoUeuFlPztdacePPQ+s
   A==;
X-CSE-ConnectionGUID: eyEHiveUTu+wYahxOzE21g==
X-CSE-MsgGUID: DGnmQyJ3TmGyqW3OMVP6lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29793281"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="29793281"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 23:38:15 -0700
X-CSE-ConnectionGUID: Ci5p0AlmR9KtN2G+m8XrqQ==
X-CSE-MsgGUID: DGqgHnh+SPeowsoxjCJocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75525517"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.65])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 23:38:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
In-Reply-To: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Date: Mon, 23 Sep 2024 09:38:05 +0300
Message-ID: <874j6698oi.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 22 Sep 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The pll_cmp_to_fdata() was never used by the working code. Drop it to
> prevent warnings with W=1 and clang.
>
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> index 0e3a2b16a2ce..e6ffaf92d26d 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> @@ -153,15 +153,6 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>  	return dividend - 1;
>  }
>  
> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
> -{
> -	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
> -
> -	do_div(fdata, HDMI_PLL_CMP_CNT);
> -
> -	return fdata;
> -}
> -
>  #define HDMI_REF_CLOCK_HZ ((u64)19200000)
>  #define HDMI_MHZ_TO_HZ ((u64)1000000)
>  static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
>
> ---
> base-commit: 32ffa5373540a8d1c06619f52d019c6cdc948bb4
> change-id: 20240922-msm-drop-unused-func-b9e76ad8e0ea
>
> Best regards,

-- 
Jani Nikula, Intel

