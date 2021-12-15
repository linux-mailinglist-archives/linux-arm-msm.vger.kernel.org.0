Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1638247574B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 12:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234111AbhLOLEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 06:04:12 -0500
Received: from mga07.intel.com ([134.134.136.100]:54393 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234048AbhLOLEM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 06:04:12 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="302576978"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="302576978"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 03:04:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="465553346"
Received: from adalyx-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.7.70])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 03:04:07 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/5] drm/dp: Move DisplayPort helpers into separate
 helper module
In-Reply-To: <20211215104318.18866-4-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211215104318.18866-1-tzimmermann@suse.de>
 <20211215104318.18866-4-tzimmermann@suse.de>
Date:   Wed, 15 Dec 2021 13:04:00 +0200
Message-ID: <87pmpy3za7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 	* move DP helper code into dp/ (Jani)

I suggested adding the subdirectory, but I'm going to bikeshed the name,
which I didn't suggest.

$ find drivers/gpu/drm -mindepth 1 -maxdepth 1 -type d | wc -l
68

Assuming we move more of the drm modules to subdirectories, how are they
going to stand out from drivers?

I suggested drm_dp, which I understand results in tautology, but hey,
all the filenames under drm/ also have drm_*.[ch]. And I find that very
useful for git greps and other code archeology. With just the dp name,
you'd have to know and list all the drm subdirectories when looking up
stuff that's part of drm but not drivers.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
