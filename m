Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9E4C8A9B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 16:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfJBOLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 10:11:55 -0400
Received: from mga18.intel.com ([134.134.136.126]:28173 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbfJBOLz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 10:11:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 07:11:54 -0700
X-IronPort-AV: E=Sophos;i="5.64,574,1559545200"; 
   d="scan'208";a="366716873"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 07:11:47 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org,
        Eric Engestrom <eric.engestrom@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        nouveau@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francisco Jerez <currojerez@riseup.net>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        etnaviv@lists.freedesktop.org
Subject: Re: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
In-Reply-To: <cover.1569329774.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1569329774.git.jani.nikula@intel.com>
Date:   Wed, 02 Oct 2019 17:11:45 +0300
Message-ID: <87v9t79qzi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Sep 2019, Jani Nikula <jani.nikula@intel.com> wrote:
>   drm/print: move drm_debug variable to drm_print.[ch]
>   drm/print: add drm_debug_enabled()
>   drm/etnaviv: use drm_debug_enabled() to check for debug categories
>   drm/i2c/sil164: use drm_debug_enabled() to check for debug categories
>   drm/msm: use drm_debug_enabled() to check for debug categories

Pushed the above patches to drm-misc-next, thanks for the reviews and
acks!

The below i915 and amdgpu patches conflict on drm-misc-next, and I
haven't received any feedback on nouveau.

>   drm/i915: use drm_debug_enabled() to check for debug categories
>   drm/nouveau: use drm_debug_enabled() to check for debug categories
>   drm/amdgpu: use drm_debug_enabled() to check for debug categories
>   drm/print: rename drm_debug to __drm_debug to discourage use

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
