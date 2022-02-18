Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5634BB637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 11:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbiBRKFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 05:05:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233819AbiBRKFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 05:05:10 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3BA92D3A
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 02:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645178693; x=1676714693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2M52if3Hu+xc+/wHz54aY5c2l4pLze6BBe7uKcQB3io=;
  b=d/2y1lTcBVWF8YZl9fg4J6n+YIVT9dJHMX73tn0xo8TkARKWkjMif+FU
   bv5RNYeunqASaLsGVO4xaa/CwptEydOW2I8PH+CZ0NhW62zkmZ91//Y+F
   9faV85mwuGKx6Wu4O167gDzC6j0n7llZvlwbzd0aUWamfnnW+gDMUsbVn
   gz0rT0q7CRqdMR79XY39HGOx2c4rfApnHadSyrDH0u2YGPY4rKazxj1iP
   mmYE7sxdkOaQ/v5KGQhEFdCY8NR5isb7I8NKxVDkhCoSTK4phHnZwXlPi
   zQfLiySzR0Nbt0QJC6JNbKPi8JxGqBI4ws9oSMNnaMwEOMVfpENqD1tc4
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251296861"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="251296861"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 02:04:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="682442492"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
  by fmsmga001.fm.intel.com with SMTP; 18 Feb 2022 02:04:50 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 18 Feb 2022 12:04:49 +0200
From:   Ville Syrjala <ville.syrjala@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 10/22] drm/msm: Nuke weird on stack mode copy
Date:   Fri, 18 Feb 2022 12:03:51 +0200
Message-Id: <20220218100403.7028-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

This on stack middle man mode looks entirely pointless.
Just duplicate the original mode directly.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d4d360d19eba..09188d02aa1e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -56,7 +56,7 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 	int rc = 0;
 	struct msm_dp *dp;
 	struct dp_display_mode *dp_mode = NULL;
-	struct drm_display_mode *m, drm_mode;
+	struct drm_display_mode *m;
 
 	if (!connector)
 		return 0;
@@ -82,13 +82,11 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 			return rc;
 		}
 		if (dp_mode->drm_mode.clock) { /* valid DP mode */
-			memset(&drm_mode, 0x0, sizeof(drm_mode));
-			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
-			m = drm_mode_duplicate(connector->dev, &drm_mode);
+			m = drm_mode_duplicate(connector->dev, &dp_mode->drm_mode);
 			if (!m) {
 				DRM_ERROR("failed to add mode %ux%u\n",
-				       drm_mode.hdisplay,
-				       drm_mode.vdisplay);
+					  dp_mode->drm_mode.hdisplay,
+					  dp_mode->drm_mode.vdisplay);
 				kfree(dp_mode);
 				return 0;
 			}
-- 
2.34.1

