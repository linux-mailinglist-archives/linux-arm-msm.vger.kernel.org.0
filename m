Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2094AB1C9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 13:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729373AbfIMLwi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 07:52:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:35121 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727540AbfIMLwi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 07:52:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 04:52:37 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="187796064"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 04:52:33 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 6/9] drm/msm: use drm_debug_enabled() to check for debug categories
Date:   Fri, 13 Sep 2019 14:51:43 +0300
Message-Id: <85a41fccdfca75ef47c9704761c959b5d53c0504.1568375189.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568375189.git.jani.nikula@intel.com>
References: <cover.1568375189.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow better abstraction of the drm_debug global variable in the
future. No functional changes.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 9e40f559c51f..00e3353f9aad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -29,7 +29,7 @@
  */
 #define DPU_DEBUG(fmt, ...)                                                \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_KMS))                      \
+		if (unlikely(drm_debug_enabled(DRM_UT_KMS)))               \
 			DRM_DEBUG(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
@@ -41,7 +41,7 @@
  */
 #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
 	do {                                                               \
-		if (unlikely(drm_debug & DRM_UT_DRIVER))                   \
+		if (unlikely(drm_debug_enabled(DRM_UT_DRIVER)))            \
 			DRM_ERROR(fmt, ##__VA_ARGS__); \
 		else                                                       \
 			pr_debug(fmt, ##__VA_ARGS__);                      \
-- 
2.20.1

