Return-Path: <linux-arm-msm+bounces-50514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA401A54B72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 14:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF453B274F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486EA20B80F;
	Thu,  6 Mar 2025 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEAE9Iht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A020C009;
	Thu,  6 Mar 2025 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266303; cv=none; b=dQ9Dr5mXXBevRhpG3Cmwvmws3bsg6dMEpcAOFbJfbu+pfscFhAJWnGOIE8im+SrtmKEhn1WoUHobBWlyg2o3s6vR34AgpYaGD/X5NK0dj0UpQm6CIOcRnplEnumcbOlUj/zpW/AZrl48ZAyZthJnrWtwTG6wkTjYjWGCd6gkkvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266303; c=relaxed/simple;
	bh=YNELi245vPsmcaIKuPOO2R4iHmuof+ZAbfWgXuQSYgQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Av6KxZRvOBj5h2eWTPFch60hOZw4iRxSGV4oUaldFyUGTmTODeACXXeWkXlxtLCswOlitNHsRlTDzDjl61OTzCwnizHuGj7ZaKZXYqXvo8/win1SG3PwxR8908OCbjEBRKRDANPvMlAU7Dy+Y540zZozCC8UXWXeU385DsrzyWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEAE9Iht; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741266301; x=1772802301;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=YNELi245vPsmcaIKuPOO2R4iHmuof+ZAbfWgXuQSYgQ=;
  b=GEAE9IhtIZU912xQwtXBXyqfQU8sHOgu4pcAbwv27XTUMYqSQLUmsw95
   1S1RlscQE1GASv+HtJA510N5DzS3dkXMQy4iFyiR326Zka5CxpZJujtpA
   ftPJvHoyoaqpuoI50T7tPSHv7q0EIUPYwbD9U1sVeg8wKa0ADXjcvyLuU
   crW2mjBIXrF6CXE+XKtC0LMiDaRXjy7P9QZeN8rqTArgL6dQpq85kqGeM
   v7f6XZ7WzSgZiATEcgKNYO+oKkVLBlsSfH9eTRb2FyeisZj506cpe9MWh
   JZJ85l4NfeSL9YjiFE3a5xOwlHOSDRAqU3fDe74y+/tQOdSZxEbCB6Sdr
   Q==;
X-CSE-ConnectionGUID: E5d5eS7gTOGQmua/XHefYQ==
X-CSE-MsgGUID: yv5XPPWES9SRZ7tCpQ7wPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41447285"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="41447285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:05:00 -0800
X-CSE-ConnectionGUID: bwaNFyECQie78jsFcEQlRQ==
X-CSE-MsgGUID: QkNFBrDxQFWlSj1RB07U9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="149800015"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:04:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Lyude Paul
 <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC v2 0/7] drm/display: dp: add new DPCD access functions
In-Reply-To: <87a59ywda3.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
 <87a59ywda3.fsf@intel.com>
Date: Thu, 06 Mar 2025 15:04:50 +0200
Message-ID: <877c52wbrh.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 06 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Sat, 01 Mar 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> Existing DPCD access functions return an error code or the number of
>> bytes being read / write in case of partial access. However a lot of
>> drivers either (incorrectly) ignore partial access or mishandle error
>> codes. In other cases this results in a boilerplate code which compares
>> returned value with the size.
>>
>> As suggested by Jani implement new set of DPCD access helpers, which
>> ignore partial access, always return 0 or an error code. Reimplement
>> existing helpers using the new functions to ensure backwards
>> compatibility.
>
> I think that description is for earlier versions of the series, it's the
> other way round now.
>
> Regardless, glanced through the series quickly, I like it, this is
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

PS. If you need to send another round, please Cc: intel-gfx and intel-xe
to run this through CI for both i915 and xe drivers. Thanks!

>
>
>>
>> This series targets only the DRM helpers code. If the approach is found
>> to be acceptable, each of the drivers should be converted on its own.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Changes in v2:
>> - Reimplemented new helpers using old ones (Lyude)
>> - Reworked the drm_dp_dpcd_read_link_status() patch (Lyude)
>> - Dropped the dp-aux-dev patch (Jani)
>> - Link to v1: https://lore.kernel.org/r/20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org
>>
>> ---
>> Dmitry Baryshkov (7):
>>       drm/display: dp: implement new access helpers
>>       drm/display: dp: change drm_dp_dpcd_read_link_status() return value
>>       drm/display: dp: use new DCPD access helpers
>>       drm/display: dp-aux-dev: use new DCPD access helpers
>>       drm/display: dp-cec: use new DCPD access helpers
>>       drm/display: dp-mst-topology: use new DCPD access helpers
>>       drm/display: dp-tunnel: use new DCPD access helpers
>>
>>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   8 +-
>>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   2 +-
>>  drivers/gpu/drm/display/drm_dp_aux_dev.c           |  12 +-
>>  drivers/gpu/drm/display/drm_dp_cec.c               |  37 ++-
>>  drivers/gpu/drm/display/drm_dp_helper.c            | 307 +++++++++------------
>>  drivers/gpu/drm/display/drm_dp_mst_topology.c      | 105 ++++---
>>  drivers/gpu/drm/display/drm_dp_tunnel.c            |  20 +-
>>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c       |   4 +-
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  24 +-
>>  drivers/gpu/drm/msm/dp/dp_link.c                   |  18 +-
>>  drivers/gpu/drm/radeon/atombios_dp.c               |   8 +-
>>  include/drm/display/drm_dp_helper.h                |  92 +++++-
>>  12 files changed, 322 insertions(+), 315 deletions(-)
>> ---
>> base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1
>> change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613
>>
>> Best regards,

-- 
Jani Nikula, Intel

