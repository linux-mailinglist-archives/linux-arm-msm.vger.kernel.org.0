Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08A1BC854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2019 14:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407303AbfIXM7T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Sep 2019 08:59:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:53293 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406347AbfIXM7T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Sep 2019 08:59:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 05:59:18 -0700
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; 
   d="scan'208";a="179473339"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 05:59:10 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        Eric Engestrom <eric.engestrom@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
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
Subject: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
Date:   Tue, 24 Sep 2019 15:58:56 +0300
Message-Id: <cover.1569329774.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all, v2 of [1], a little refactoring around drm_debug access to
abstract it better. There shouldn't be any functional changes.

I'd appreciate acks for merging the lot via drm-misc. If there are any
objections to that, we'll need to postpone the last patch until
everything has been merged and converted in drm-next.

BR,
Jani.

Cc: Eric Engestrom <eric.engestrom@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David (ChunMing) Zhou <David1.Zhou@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Francisco Jerez <currojerez@riseup.net>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org


[1] http://mid.mail-archive.com/cover.1568375189.git.jani.nikula@intel.com

Jani Nikula (9):
  drm/print: move drm_debug variable to drm_print.[ch]
  drm/print: add drm_debug_enabled()
  drm/etnaviv: use drm_debug_enabled() to check for debug categories
  drm/i2c/sil164: use drm_debug_enabled() to check for debug categories
  drm/i915: use drm_debug_enabled() to check for debug categories
  drm/msm: use drm_debug_enabled() to check for debug categories
  drm/nouveau: use drm_debug_enabled() to check for debug categories
  drm/amdgpu: use drm_debug_enabled() to check for debug categories
  drm/print: rename drm_debug to __drm_debug to discourage use

 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |  4 ++--
 drivers/gpu/drm/drm_atomic_uapi.c            |  2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c        |  6 ++---
 drivers/gpu/drm/drm_drv.c                    | 17 ---------------
 drivers/gpu/drm/drm_edid.c                   |  2 +-
 drivers/gpu/drm/drm_edid_load.c              |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c               |  4 ++--
 drivers/gpu/drm/drm_print.c                  | 23 ++++++++++++++++++--
 drivers/gpu/drm/drm_vblank.c                 |  6 ++---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |  8 +++----
 drivers/gpu/drm/i2c/sil164_drv.c             |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c |  4 ++--
 drivers/gpu/drm/i915/display/intel_dp.c      |  2 +-
 drivers/gpu/drm/i915/i915_drv.c              |  2 +-
 drivers/gpu/drm/i915/i915_gem.h              |  2 +-
 drivers/gpu/drm/i915/i915_utils.c            |  2 +-
 drivers/gpu/drm/i915/intel_pm.c              |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  4 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.h      |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_drv.h        |  4 ++--
 include/drm/drm_drv.h                        |  2 --
 include/drm/drm_print.h                      |  8 +++++++
 22 files changed, 60 insertions(+), 52 deletions(-)

-- 
2.20.1

