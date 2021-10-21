Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF41435E83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 12:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhJUKDa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 06:03:30 -0400
Received: from mga11.intel.com ([192.55.52.93]:1936 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231334AbhJUKD3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 06:03:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="226452457"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; 
   d="scan'208";a="226452457"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 03:00:46 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; 
   d="scan'208";a="495058903"
Received: from ssuryana-mobl.ger.corp.intel.com (HELO localhost) ([10.249.45.34])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 03:00:43 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Khaled Almahallawy <khaled.almahallawy@intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Khaled Almahallawy <khaled.almahallawy@intel.com>
Subject: Re: [RFC PATCH 0/4] drm/dp: Use DP2.0 DPCD 248h updated register/field names for DP PHY CTS
In-Reply-To: <20211021050713.836498-1-khaled.almahallawy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211021050713.836498-1-khaled.almahallawy@intel.com>
Date:   Thu, 21 Oct 2021 13:00:39 +0300
Message-ID: <8735ouofy0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 20 Oct 2021, Khaled Almahallawy <khaled.almahallawy@intel.com> wrote:
> This series updates DPCD 248h register name and PHY test patterns names to follow DP 2.0 Specs.
> Also updates the DP PHY CTS codes of the affected drivers (i915, amd, msm)
> No functional changes expected.
>  
> Reference: “DPCD 248h/10Bh/10Ch/10Dh/10Eh Name/Description Consistency”
> https://groups.vesa.org/wg/AllMem/documentComment/2738

You can't do renames like this piece by piece. Every commit must build.

Incidentally, this is one of the reasons we often don't bother with
renames to follow spec changes, but rather stick to the original names.

However, in this case you could switch all drivers to the different test
pattern macros piece by piece, as they're already there.


BR,
Jani.


>
> Khaled Almahallawy (4):
>   drm/dp: Rename DPCD 248h according to DP 2.0 specs
>   drm/i915/dp: Use DP 2.0 LINK_QUAL_PATTERN_* Phy test pattern
>     definitions
>   drm/amd/dc: Use DPCD 248h DP 2.0 new name
>   drm/msm/dp: Use DPCD 248h DP 2.0 new names/definitions
>
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c |  2 +-
>  drivers/gpu/drm/drm_dp_helper.c                  |  6 +++---
>  drivers/gpu/drm/i915/display/intel_dp.c          | 12 ++++++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c              | 12 ++++++------
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                 | 12 ++++++------
>  drivers/gpu/drm/msm/dp/dp_link.c                 | 16 ++++++++--------
>  include/drm/drm_dp_helper.h                      | 13 +++----------
>  7 files changed, 33 insertions(+), 40 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
