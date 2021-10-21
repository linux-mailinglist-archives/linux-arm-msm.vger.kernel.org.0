Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE2A435A2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 07:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhJUFJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 01:09:31 -0400
Received: from mga04.intel.com ([192.55.52.120]:8476 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230385AbhJUFJ1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 01:09:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="227714994"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; 
   d="scan'208";a="227714994"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 22:07:08 -0700
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; 
   d="scan'208";a="484048442"
Received: from gmherteg-mobl2.amr.corp.intel.com (HELO kialmah1-mobl1.amr.corp.intel.com) ([10.251.20.183])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 22:07:08 -0700
From:   Khaled Almahallawy <khaled.almahallawy@intel.com>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Khaled Almahallawy <khaled.almahallawy@intel.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 3/4] drm/amd/dc: Use DPCD 248h DP 2.0 new name
Date:   Wed, 20 Oct 2021 22:07:12 -0700
Message-Id: <20211021050713.836498-4-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021050713.836498-1-khaled.almahallawy@intel.com>
References: <20211021050713.836498-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the new definition of DPCD 248h (DP_LINK_QUAL_PATTERN_SELECT)
No functional changes.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 54662d74c65a..d34187bb42dd 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -3604,7 +3604,7 @@ static void dp_test_send_phy_test_pattern(struct dc_link *link)
 	/* get phy test pattern and pattern parameters from DP receiver */
 	core_link_read_dpcd(
 			link,
-			DP_PHY_TEST_PATTERN,
+			DP_LINK_QUAL_PATTERN_SELECT,
 			&dpcd_test_pattern.raw,
 			sizeof(dpcd_test_pattern));
 	core_link_read_dpcd(
-- 
2.25.1

