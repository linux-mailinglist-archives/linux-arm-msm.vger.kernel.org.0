Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95CB9435A2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 07:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhJUFJa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 01:09:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:8478 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230434AbhJUFJ3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 01:09:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="227714997"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; 
   d="scan'208";a="227714997"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 22:07:09 -0700
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; 
   d="scan'208";a="484048452"
Received: from gmherteg-mobl2.amr.corp.intel.com (HELO kialmah1-mobl1.amr.corp.intel.com) ([10.251.20.183])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 22:07:08 -0700
From:   Khaled Almahallawy <khaled.almahallawy@intel.com>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Khaled Almahallawy <khaled.almahallawy@intel.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [RFC PATCH 4/4] drm/msm/dp: Use DPCD 248h DP 2.0 new names/definitions
Date:   Wed, 20 Oct 2021 22:07:13 -0700
Message-Id: <20211021050713.836498-5-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021050713.836498-1-khaled.almahallawy@intel.com>
References: <20211021050713.836498-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use DP 2.0 DPCD 248h new name (LINK_QUAL_PATTERN_SELECT) and rename selected phy test patterns to LINK_QUAL_PATTERN_*

Note: TPS4 LT pattern is CP2520 Pattern 3 (refer to DP2.0 spaces Table 3-11, DPCD 00248h
LINK_QUAL_PATTERN_SELECT, and DP PHY 1.4 CTS - Appendix A - Compliance EYE Pattern(CP2520; Normative))
That is why the change from DP_PHY_TEST_PATTERN_SEL_MASK to DP_LINK_QUAL_PATTERN_CP2520_PAT_3
No functional changes

Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 12 ++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 ++++++------
 drivers/gpu/drm/msm/dp/dp_link.c    | 16 ++++++++--------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index cc2bb8295329..2076439ac2a2 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -690,11 +690,11 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 
 	DRM_DEBUG_DP("pattern: %#x\n", pattern);
 	switch (pattern) {
-	case DP_PHY_TEST_PATTERN_D10_2:
+	case DP_LINK_QUAL_PATTERN_D10_2:
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
 		break;
-	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
+	case DP_LINK_QUAL_PATTERN_ERROR_RATE:
 		value &= ~(1 << 16);
 		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 					value);
@@ -706,11 +706,11 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
 					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
 		break;
-	case DP_PHY_TEST_PATTERN_PRBS7:
+	case DP_LINK_QUAL_PATTERN_PRBS7:
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_PRBS7);
 		break;
-	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
+	case DP_LINK_QUAL_PATTERN_80BIT_CUSTOM:
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
 				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
 		/* 00111110000011111000001111100000 */
@@ -723,7 +723,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
 				0x0000F83E);
 		break;
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_LINK_QUAL_PATTERN_CP2520_PAT_1:
 		value = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
 		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
@@ -742,7 +742,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 		value |= DP_MAINLINK_CTRL_ENABLE;
 		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, value);
 		break;
-	case DP_PHY_TEST_PATTERN_SEL_MASK:
+	case DP_LINK_QUAL_PATTERN_CP2520_PAT_3:
 		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
 				DP_MAINLINK_CTRL_ENABLE);
 		dp_write_link(catalog, REG_DP_STATE_CTRL,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 62e75dc8afc6..a97f9dd03a8c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1553,25 +1553,25 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 	switch (pattern_sent) {
 	case MR_LINK_TRAINING1:
 		success = (pattern_requested ==
-				DP_PHY_TEST_PATTERN_D10_2);
+				DP_LINK_QUAL_PATTERN_D10_2);
 		break;
 	case MR_LINK_SYMBOL_ERM:
 		success = ((pattern_requested ==
-			DP_PHY_TEST_PATTERN_ERROR_COUNT) ||
+			DP_LINK_QUAL_PATTERN_ERROR_RATE) ||
 				(pattern_requested ==
-				DP_PHY_TEST_PATTERN_CP2520));
+				DP_LINK_QUAL_PATTERN_CP2520_PAT_1));
 		break;
 	case MR_LINK_PRBS7:
 		success = (pattern_requested ==
-				DP_PHY_TEST_PATTERN_PRBS7);
+				DP_LINK_QUAL_PATTERN_PRBS7);
 		break;
 	case MR_LINK_CUSTOM80:
 		success = (pattern_requested ==
-				DP_PHY_TEST_PATTERN_80BIT_CUSTOM);
+				DP_LINK_QUAL_PATTERN_80BIT_CUSTOM);
 		break;
 	case MR_LINK_TRAINING4:
 		success = (pattern_requested ==
-				DP_PHY_TEST_PATTERN_SEL_MASK);
+				DP_LINK_QUAL_PATTERN_CP2520_PAT_3);
 		break;
 	default:
 		success = false;
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index a5bdfc5029de..d5b56ab3c09d 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -574,7 +574,7 @@ static int dp_link_parse_phy_test_params(struct dp_link_private *link)
 	u8 data;
 	ssize_t rlen;
 
-	rlen = drm_dp_dpcd_readb(link->aux, DP_PHY_TEST_PATTERN,
+	rlen = drm_dp_dpcd_readb(link->aux, DP_LINK_QUAL_PATTERN_SELECT,
 					&data);
 	if (rlen < 0) {
 		DRM_ERROR("failed to read phy link pattern. rlen=%zd\n", rlen);
@@ -586,13 +586,13 @@ static int dp_link_parse_phy_test_params(struct dp_link_private *link)
 	DRM_DEBUG_DP("phy_test_pattern_sel = 0x%x\n", data);
 
 	switch (data) {
-	case DP_PHY_TEST_PATTERN_SEL_MASK:
-	case DP_PHY_TEST_PATTERN_NONE:
-	case DP_PHY_TEST_PATTERN_D10_2:
-	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
-	case DP_PHY_TEST_PATTERN_PRBS7:
-	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-	case DP_PHY_TEST_PATTERN_CP2520:
+	case DP_LINK_QUAL_PATTERN_DISABLE:
+	case DP_LINK_QUAL_PATTERN_D10_2:
+	case DP_LINK_QUAL_PATTERN_ERROR_RATE:
+	case DP_LINK_QUAL_PATTERN_PRBS7:
+	case DP_LINK_QUAL_PATTERN_80BIT_CUSTOM:
+	case DP_LINK_QUAL_PATTERN_CP2520_PAT_1:
+	case DP_LINK_QUAL_PATTERN_CP2520_PAT_3
 		return 0;
 	default:
 		return -EINVAL;
-- 
2.25.1

