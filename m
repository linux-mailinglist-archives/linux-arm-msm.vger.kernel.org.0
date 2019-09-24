Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1EEBC865
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2019 15:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408035AbfIXNAH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Sep 2019 09:00:07 -0400
Received: from mga11.intel.com ([192.55.52.93]:57775 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408015AbfIXNAH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Sep 2019 09:00:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 06:00:06 -0700
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; 
   d="scan'208";a="340073708"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 06:00:01 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/msm: use drm_debug_enabled() to check for debug categories
Date:   Tue, 24 Sep 2019 15:59:02 +0300
Message-Id: <c7142cdebb5f6fed527272b333cd6c43c0aa68ec.1569329774.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569329774.git.jani.nikula@intel.com>
References: <cover.1569329774.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow better abstraction of the drm_debug global variable in the
future. No functional changes.

v2: Move unlikely() to drm_debug_enabled()

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 4c889aabdaf9..959d03e007fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -31,7 +31,7 @@
  */
 #define DPU_DEBUG(fmt, ...)                                                \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_KMS))                      \
+		if (drm_debug_enabled(DRM_UT_KMS))                         \
 			DRM_DEBUG(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
@@ -43,7 +43,7 @@
  */
 #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_DRIVER))                   \
+		if (drm_debug_enabled(DRM_UT_DRIVER))                      \
 			DRM_ERROR(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
-- 
2.20.1

