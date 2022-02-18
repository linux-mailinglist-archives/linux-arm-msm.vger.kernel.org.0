Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1144BB655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 11:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbiBRKFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 05:05:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233420AbiBRKFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 05:05:15 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BCF369C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 02:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645178698; x=1676714698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OpIVq1wuA3HRWuulSvFXyy3QhdFsBNiPeTSse+q1RqY=;
  b=MvLzALQXSroLQKGUKonF4e2/TerR/IHxye3a2rILlC/z0t2t1nOYxl1N
   THE8o82Mk+roMx26NiQ0DAWHwzKm/82MTx62DoOqNy+SMiVNXhzDDHPC6
   1043jbf7Kn4X43uwOmj4ksCUKJIUrS8oEK6v+COtwMyeOoPGAF7uURzjX
   CgCGZgfy89wq+ARwKfVIMXnzenLzrteecXC8FXV255szUcaSFwe0mzX+e
   SfOYLUoHMUoj6GzrhW4Vncrnpm9FA6PkoI7tLeAeoohdz04QQ5dsUzPdi
   pPOChBOXaWM0p/J/PAr3P6QSuiYl46HEcAiuAPmIBAGLveeCtGyFZ7E35
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337541410"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="337541410"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 02:04:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="546219495"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
  by orsmga008.jf.intel.com with SMTP; 18 Feb 2022 02:04:54 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 18 Feb 2022 12:04:53 +0200
From:   Ville Syrjala <ville.syrjala@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 11/22] drm/msm: Use drm_mode_init() for on-stack modes
Date:   Fri, 18 Feb 2022 12:03:52 +0200
Message-Id: <20220218100403.7028-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialize on-stack modes with drm_mode_init() to guarantee
no stack garbage in the list head, or that we aren't copying
over another mode's list head.

Based on the following cocci script, with manual fixups:
@decl@
identifier M;
expression E;
@@
- struct drm_display_mode M = E;
+ struct drm_display_mode M;

@@
identifier decl.M;
expression decl.E;
statement S, S1;
@@
struct drm_display_mode M;
... when != S
+ drm_mode_init(&M, &E);
+
S1

@@
expression decl.E;
@@
- &*E
+ E

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ddd9d89cd456..e7813c6f7bd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -248,12 +248,13 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	unsigned long lock_flags;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
 
+	drm_mode_init(&mode, &phys_enc->cached_mode);
+
 	if (!phys_enc->hw_ctl->ops.setup_intf_cfg) {
 		DPU_ERROR("invalid encoder %d\n", phys_enc != NULL);
 		return;
 	}
 
-	mode = phys_enc->cached_mode;
 	if (!phys_enc->hw_intf->ops.setup_timing_gen) {
 		DPU_ERROR("timing engine setup is not supported\n");
 		return;
@@ -652,7 +653,9 @@ static int dpu_encoder_phys_vid_get_frame_count(
 {
 	struct intf_status s = {0};
 	u32 fetch_start = 0;
-	struct drm_display_mode mode = phys_enc->cached_mode;
+	struct drm_display_mode mode;
+
+	drm_mode_init(&mode, &phys_enc->cached_mode);
 
 	if (!dpu_encoder_phys_vid_is_master(phys_enc))
 		return -EINVAL;
-- 
2.34.1

