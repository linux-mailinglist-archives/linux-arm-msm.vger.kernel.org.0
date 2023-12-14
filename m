Return-Path: <linux-arm-msm+bounces-4836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741A813CAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 22:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 310451F2150B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 21:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A4F5F1E2;
	Thu, 14 Dec 2023 21:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1rDkWw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B7282E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 21:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702589758; x=1734125758;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NqfYZN78B3hVHP2Dit/8JqwIzCyrej/6W8WjTK/vVLc=;
  b=R1rDkWw5fAhysaQHjgR6ZhuPYPM4zm8qlXpyc3n23QrmHhcJG9UqVyM0
   Y+hCNiB2R7WGKqbXapXaq1/x+6RC/LY8d7PSulumcFoIKVNU6HeopV0K/
   8NNaThLnkwj4+CAUuTZYqCAV6w0IPckDNPvDaaOd68eP66AZn9wBCWmmE
   bYPgYOHLlDzQqT+o52BYecGTGAf19+ZL86YKVGtATS2cclzwXFk/O3JYd
   2YTmbwy6uOKykAtB7uKO7+Kvk/B74GBDDsjwzWO89Arilk+uPBOoBaeng
   92alJsxULUWO6BoveWZ2O7bQiD3AoNegUVsTDGqmwmfc9fTTJMwKB/+Fa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2010158"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="2010158"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 13:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="808730983"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="808730983"
Received: from kialmah1-desk5.jf.intel.com ([10.23.15.170])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2023 13:35:56 -0800
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org,
	Khaled Almahallawy <khaled.almahallawy@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/display/dp: Update the name of bit#4 of DPCD TEST_REQUEST
Date: Thu, 14 Dec 2023 13:35:55 -0800
Message-Id: <20231214213555.3643327-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DP_TEST_LINK_FAUX_PATTERN is deprecated since DP1.3 Spec.
Update to the latest definition in DP2.1 spec to reflect its true
usage in the code.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
 include/drm/display/drm_dp.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 98427d45e9a7..b7d16c1afb5a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -664,7 +664,7 @@ static int dp_link_parse_request(struct dp_link_private *link)
 		return rlen;
 	}
 
-	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
+	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
 		drm_dbg_dp(link->drm_dev, "link 0x%x not supported\n", data);
 		goto end;
 	}
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 3731828825bd..3ccbc9eb9289 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -807,7 +807,7 @@
 # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
 # define DP_TEST_LINK_EDID_READ		    (1 << 2)
 # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >= 1.1 */
-# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >= 1.2 */
+# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)
 # define DP_TEST_LINK_AUDIO_PATTERN         (1 << 5) /* DPCD >= 1.2 */
 # define DP_TEST_LINK_AUDIO_DISABLED_VIDEO  (1 << 6) /* DPCD >= 1.2 */
 
-- 
2.34.1


