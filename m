Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA2478FEEA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 16:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235436AbjIAOUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 10:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349946AbjIAOUy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 10:20:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FEB10F2
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693578044; x=1725114044;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NcNTJoWBCz4pcOJ5OZrcNHVcXIXMXaCUJdWopodVHnw=;
  b=Ss62a7SPuNVXTo/d0K595r9dlDuKncYWChd8Wtn544GfKf82JYOGKLED
   iDYXIMgbsSP8NLMvdTsroGAf2DNWt/YmJr4kg9pffvHZmwut/vYj3PaK5
   JFn/Ad6OfaJmLvzsoWoUrG7KWgG9MiCCRdpHwfCAc30Jq7ShDRAOmUIrO
   v02arBqnYMZbRmS9SJjJ0vCSuBaVUlwwON7G5hK5CGILV9IBdJtN8eXCF
   L4xYQmhJpGrCrlu0gOv4SwVzei5fGYgPevDCIW6L9xQLzIMZ/S7n3L9wd
   wx8p5L6j0xu+P0E4haV8h+lIOPWmPCnsR1qmiessEzKU8G4M9rfBwg1Sm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442623858"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="442623858"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 07:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883198379"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="883198379"
Received: from epronina-mobl.ccr.corp.intel.com (HELO localhost) ([10.252.34.21])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 07:20:43 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     jani.nikula@intel.com, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dp: skip validity check for DP CTS EDID checksum
Date:   Fri,  1 Sep 2023 17:20:34 +0300
Message-Id: <20230901142034.580802-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DP CTS test for EDID last block checksum expects the checksum for
the last block, invalid or not. Skip the validity check.

For the most part (*), the EDIDs returned by drm_get_edid() will be
valid anyway, and there's the CTS workaround to get the checksum for
completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
correct edid checksum after corrupted edid checksum read").

This lets us remove one user of drm_edid_block_valid() with hopes the
function can be removed altogether in the future.

(*) drm_get_edid() ignores checksum errors on CTA extensions.

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 42d52510ffd4..86a8e06c7a60 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -289,26 +289,9 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
 
 static u8 dp_panel_get_edid_checksum(struct edid *edid)
 {
-	struct edid *last_block;
-	u8 *raw_edid;
-	bool is_edid_corrupt = false;
+	edid += edid->extensions;
 
-	if (!edid) {
-		DRM_ERROR("invalid edid input\n");
-		return 0;
-	}
-
-	raw_edid = (u8 *)edid;
-	raw_edid += (edid->extensions * EDID_LENGTH);
-	last_block = (struct edid *)raw_edid;
-
-	/* block type extension */
-	drm_edid_block_valid(raw_edid, 1, false, &is_edid_corrupt);
-	if (!is_edid_corrupt)
-		return last_block->checksum;
-
-	DRM_ERROR("Invalid block, no checksum\n");
-	return 0;
+	return edid->checksum;
 }
 
 void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
-- 
2.39.2

