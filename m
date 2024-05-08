Return-Path: <linux-arm-msm+bounces-19488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E78BF8F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 10:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0CFA281454
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 08:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2678D9476;
	Wed,  8 May 2024 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLlvpm0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE8A28FF;
	Wed,  8 May 2024 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715157846; cv=none; b=LA8xNuBcwk08E9Ho+6n+jAmcoKZ1kH/CEfYjbRIeR0cMc0BhaRLWPGWwN17o4/VQstByk0HzeLUM9N5LcMdoevl0MdbG2auehV2YcdtvI7bRL+I8POrTG4GQsyzQ2IoTRkIngAuqumrEP6wEfiRHGOrgdwOrHEJO1zbKEbZjdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715157846; c=relaxed/simple;
	bh=EIWAO/oS2DvpnpR2Kb+vwzKu0pOKwN71qpcxPw4cnbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aOdtBQGRPTlFVXaR+j8RTqTFFwh8a1Mvp0nl9smTZU4JFpYdjSRT38jFVq/R8nR7haQ1/XYdVz6KwvJZG/vMy4WQL2MF60L61rJoruMBvg3IJzNx5JacSKFnEw/EI1imWOL4GbIgpVfYEyI8f5VIVNhcPBodPLdmb9zw5NTegR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLlvpm0q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715157845; x=1746693845;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=EIWAO/oS2DvpnpR2Kb+vwzKu0pOKwN71qpcxPw4cnbQ=;
  b=eLlvpm0qUF4WC5f7Kcuh0MOBi3ZfwIAB5688XFcHKmbD4OsCU+0LMid4
   VOVY3UYSP+p1bLXL1/smgeRifbUHyWv01YvyU5djml7IaRUefiBYAU+ey
   HYvLnc0FvuKTPL+0kku/klf+DL3IO6EP/NB28MIrvvBe6FmSQIc2CHKny
   7BaDPHPZoB10bdLpWrZfS/fK82bAtqNu290dJvMCRbaYCsG17wkQmbRLi
   xtXt1Wl9XlbnAzmglrHHAu4jT1KdRHGcaFRdTsww5W67rv531VGOO/Jta
   SxDX/nJuUsdyJRzlLa7lfgXIIEIpPbest0Chmpd59whQbOWYYk8K4kuPZ
   g==;
X-CSE-ConnectionGUID: HsuiSElYT6uGUXN2FcJCLg==
X-CSE-MsgGUID: uPq76WX8TPKGSzvomrxT0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22157077"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="22157077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:44:04 -0700
X-CSE-ConnectionGUID: BUHs8ofaQuaFaDI+23XuYg==
X-CSE-MsgGUID: lnq/6KdBSl2/VjOScGEihQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="52025594"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO localhost) ([10.245.246.76])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:43:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 swboyd@chromium.org, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
Date: Wed, 08 May 2024 11:43:56 +0300
Message-ID: <87a5l0lmlv.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 07 May 2024, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.

Is it now okay to require Python for the build? Not listed in
Documentation/process/changes.rst.

BR,
Jani.



>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index fc3bfdc991d2..3926485bb197 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -538,7 +538,7 @@ class Parser(object):
>  		self.variants.add(reg.domain)
>  
>  	def do_validate(self, schemafile):
> -		if self.validate == False:
> +		if not self.validate:
>  			return
>  
>  		try:
> @@ -948,7 +948,8 @@ def main():
>  	parser = argparse.ArgumentParser()
>  	parser.add_argument('--rnn', type=str, required=True)
>  	parser.add_argument('--xml', type=str, required=True)
> -	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> +	parser.add_argument('--validate', default=False, action='store_true')
> +	parser.add_argument('--no-validate', dest='validate', action='store_false')
>  
>  	subparsers = parser.add_subparsers()
>  	subparsers.required = True

-- 
Jani Nikula, Intel

