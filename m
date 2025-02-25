Return-Path: <linux-arm-msm+bounces-49276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A995FA43DB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7022719C6452
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FCB207A11;
	Tue, 25 Feb 2025 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ9kvOky"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355DB19259E;
	Tue, 25 Feb 2025 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740482975; cv=none; b=gcccb7Gb99/0YBOaLwqyBoFrG2oqZBfQI8nF8E+7Q1POq3IXxmj05Y7itXm9MtIhrp7Q9wt2Hrybh8KLL9V7j7xA6AsplcpATs5gOKTvz4l1NK3OsWhmBH4y0f9yBycINHXtLD4JsI01BUTugthlbraIeSWawhFUj+4HvRWtwG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740482975; c=relaxed/simple;
	bh=NKedsfUkieXfxiUN7z3yWpWCUJzwcsbZVYDJyCoU/r4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tMss/DrggfFaF+3XdxwBNgKPfTzFwlx/NHDtxZ45ID7MqXcjeiexiVnsana/5VCwzLsSrmGdIOYwBZg7o9apQsZ4LWi1STbBg4IpLRM0cU1H0689W4F3fajCHkLb55l0CWo42WbweAXMAfAeBh79wxxuw/Zfk8PSi/BDhehE8Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ9kvOky; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740482973; x=1772018973;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=NKedsfUkieXfxiUN7z3yWpWCUJzwcsbZVYDJyCoU/r4=;
  b=aJ9kvOkya8DhuPu6V5i0XokyNv6Eh1SSrJ1Qfj/UKSPd6cMPP1MTk+C3
   I5v6tP07wVR1CDihLGE23DcIa7ZNb5YAYbTaCoPxTXwkoLpHpB278UHqM
   9xCm6uaKxpk6GXZNTAJcp8CaHElGeQyBAPDxaslHWD1DiTZDJbGNm9vXp
   BAd5ruAWAys0FRPw13CrPdYz/06KF6rfKvdqpLQ8PDe2SgbEZbx4qJhQC
   jvILuvitbJtmVnSiObGFFOK8lYsMt63sZOlYIzf3v2js+glITqLg8BHpd
   Md9eyWz9iOJggEZl3jtkKKCl3sK2M547+ScNig6ig7UHOSAp9yuaudvBD
   Q==;
X-CSE-ConnectionGUID: yNkY8SyuSguEtGvlh96iug==
X-CSE-MsgGUID: 5TzVwhHwQeC/zET2s3a0YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41198780"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41198780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:29:32 -0800
X-CSE-ConnectionGUID: /fXmTyiFQkG/6ivPziotjA==
X-CSE-MsgGUID: i7XrO8h1R2mz9UkjF/+iig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121615259"
Received: from monicael-mobl3 (HELO localhost) ([10.245.246.246])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:29:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling
 and add support to msm driver
In-Reply-To: <frsbcvxcvtp45mh45cld3rzbgl52gomzmzs73crv53pwbc4fns@sygnt6z2avht>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
 <frsbcvxcvtp45mh45cld3rzbgl52gomzmzs73crv53pwbc4fns@sygnt6z2avht>
Date: Tue, 25 Feb 2025 13:29:20 +0200
Message-ID: <87o6yq5kkv.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 21 Feb 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Mon, Feb 03, 2025 at 12:57:55PM +0200, Abel Vesa wrote:
>> Looking at both i915 and nouveau DP drivers, both are setting the first
>> LTTPR (if found) in transparent mode first and then in non-transparent
>> mode, just like the DP v2.0 specification mentions in section 3.6.6.1.
>> 
>> Being part of the standard, setting the LTTPR in a specific operation mode
>> can be easily moved in the generic framework. So do that by adding a new
>> helper.
>> 
>> Then, the msm DP driver is lacking any kind of support for LTTPR handling,
>> so add it by reading the LTTPR caps for figuring out the number of LTTPRs
>> found on plug detect and then do exactly what the i915 and nouveau drivers
>> do with respect to toggling through operating modes, just like the
>> up-mentioned section from DP spec describes.
>> 
>> At some point, link training per sub-segment will probably be needed, but
>> for now, toggling the operating modes seems to be enough at least for the
>> X Elite-based platforms that this patchset has been tested on.
>> 
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>
> [...]
>> 
>> ---
>> Abel Vesa (4):
>>       drm/dp: Add helper to set LTTPRs in transparent mode
>>       drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
>>       drm/i915/dp: Use the generic helper to control LTTPR transparent mode
>
> Lyude, Jani, what would be your preferred way of merging these patches?
> Would you ack merging of those through drm-misc or would you prefer for
> the first patch only to be landed to drm-misc, which you can then pull
> into nouveau and i915 trees.

Either way is fine with me, up to you. But please try to ensure these
get into drm-misc-next pull request by this cycle, so we can backmerge
and catch up sooner rather than later.

Acked-by: Jani Nikula <jani.nikula@intel.com>



>
>>       drm/msm/dp: Add support for LTTPR handling
>> 
>>  drivers/gpu/drm/display/drm_dp_helper.c            | 61 ++++++++++++++++++++++
>>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
>>  drivers/gpu/drm/msm/dp/dp_display.c                | 15 ++++++
>>  drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
>>  include/drm/display/drm_dp_helper.h                |  2 +
>>  5 files changed, 85 insertions(+), 34 deletions(-)
>> ---
>> base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
>> change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
>> 
>> Best regards,
>> -- 
>> Abel Vesa <abel.vesa@linaro.org>
>> 

-- 
Jani Nikula, Intel

