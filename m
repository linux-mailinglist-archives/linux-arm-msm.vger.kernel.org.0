Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6734238C705
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbhEUMw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:52:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:34150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234707AbhEUMwG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:52:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D82D96128A;
        Fri, 21 May 2021 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621601443;
        bh=L0xwOq04an7+Pz3OpZctKSdmZivqWGnbevwnOTd9LK0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rgn+1H/17yJtWqL3+pUjns/pIN8nRYXCbEAidZfTyTls4BiEtYxRN3zHxlGUIkYvh
         xUDGUNCTWvpryQUIYt9tcc0h1BmO5sExIQQutoEqejKTp/T7I90ysdzSspoNkpYjFC
         QhPeQsRhxJid8PrsCghlHc0LWoaVaqk6bYMIyMIHnBAlYC9kypQmjrhXbXYsaSoz2x
         rbGx1m0p+LWB35bMH7/CBqZxqGVOxb41C5IFnWeO1kVj2SV14yD5VsJw49PNo79u0s
         49+tdz6VlWw6iWm9dzdVq+mdAsFX+ReNIM3O2odR2JSQsrne2zh6LJinex1eQqV63p
         g4XmI13yaZiVg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 07/13] drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
Date:   Fri, 21 May 2021 18:19:39 +0530
Message-Id: <20210521124946.3617862-11-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This add SDM845 DSC blocks into hw_catalog

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b569030a0847..1bf599e8ffe0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -40,6 +40,8 @@
 
 #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
 
+#define DSC_SDM845_MASK BIT(DPU_DSC)
+
 #define PINGPONG_SDM845_SPLIT_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
@@ -751,6 +753,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk),
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk),
 };
+
+/*************************************************************
+ * DSC sub blocks config
+ *************************************************************/
+#define DSC_BLK(_name, _id, _base) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = 0x140, \
+	.features = DSC_SDM845_MASK, \
+	}
+
+static struct dpu_dsc_cfg sdm845_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000),
+	DSC_BLK("dsc_1", DSC_1, 0x80400),
+	DSC_BLK("dsc_2", DSC_2, 0x80800),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00),
+};
+
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -1053,6 +1073,8 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.mixer = sdm845_lm,
 		.pingpong_count = ARRAY_SIZE(sdm845_pp),
 		.pingpong = sdm845_pp,
+		.dsc_count = ARRAY_SIZE(sdm845_dsc),
+		.dsc = sdm845_dsc,
 		.intf_count = ARRAY_SIZE(sdm845_intf),
 		.intf = sdm845_intf,
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.26.3

