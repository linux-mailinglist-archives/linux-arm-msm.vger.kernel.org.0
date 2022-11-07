Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373BF61FE93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 20:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbiKGT0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 14:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbiKGT0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 14:26:04 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FE42AE3A
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667849160; x=1699385160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CaREa9/pD5lD48Lzd2B7bjrPLIU9+e08QxMO2B4kapk=;
  b=bRyfTCltc0Wnzjmft7i8dyy7+kPrMUSrLlHXGyS4iUABfM123/59gFme
   ao2Lx9au/7D1WcJNYJykYQd+oUW5x6Q/Q/cRT67X776tNGR+9dXbhjHPy
   J7FHE7JJpk/GABtcK1Z/8ugV5zEtvdCSfjFuQmSLfEnWoZmJU3XY/0fqP
   E696nupC7l+vC8OXVRKPsHc2oz/hjrugBvS+Xdf69ifhwI8V4a35uSHFi
   hxUUrgicOWs8VfT2SHv8JcGLxl9DKwYZWvvkT4a4TOgt+Ep4cpY+9eAip
   HRZSuL8Tbb4YoQmhoyRP/ZX8LBAnlfxk/jen1SGAFAfYwch89amU01u84
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="372642935"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372642935"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 11:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705009773"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="705009773"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
  by fmsmga004.fm.intel.com with SMTP; 07 Nov 2022 11:25:57 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 07 Nov 2022 21:25:56 +0200
From:   Ville Syrjala <ville.syrjala@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 3/7] drm/msm: Use drm_mode_init() for on-stack modes
Date:   Mon,  7 Nov 2022 21:25:41 +0200
Message-Id: <20221107192545.9896-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2c14646661b7..0f71e8fe7be7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -237,12 +237,13 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
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
@@ -634,7 +635,9 @@ static int dpu_encoder_phys_vid_get_frame_count(
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
2.37.4

