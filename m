Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD4C452AAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 07:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhKPG16 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 01:27:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:59040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230294AbhKPG0z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 01:26:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 757936115B;
        Tue, 16 Nov 2021 06:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637043838;
        bh=fElGn9Ik84lBDayR/MYhHLK/K1CaX6s6acUo7on5lyw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cFIOEsciCj+AUKKqzriLHLyGfIPSxeL/7QNt3hsTKwo436Ph1+7GPW6PV01mNwq4+
         mXwZypyzDDl46bi5FMoghMWaVOwmH5Sf2+oWJ1UXCAk05dinaT5xxUHJpVfnHqJPyW
         DuCbaBudv4Tm1u1W+41chBifIyPxw+KAzhdKmvR1AXNf51flw1Ld4VaQFXslsjINLP
         US/o3fIvzOFo6Lb55d7d8pliXyG46H8Noc+XvVCrf/BqGY9p+U18sibWtOoBmQzyao
         p2aJ0J6ZBaExdFAQiWUk7YKrs54LR3BHwW50dHY+ZI9AJwtc0XjHQeFQlUoDBpLMQX
         5zrSc5K8sA0Mw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 09/13] drm/msm/disp/dpu1: Add support for DSC in topology
Date:   Tue, 16 Nov 2021 11:52:52 +0530
Message-Id: <20211116062256.2417186-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116062256.2417186-1-vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For DSC to work we typically need a 2,2,1 configuration. This should
suffice for resolutions up to 4k. For more resolutions like 8k this won't
work.

Also, it is better to use 2 LMs and DSC instances as half width results
in lesser power consumption as compared to single LM, DSC at full width.

The panel has been tested only with 2,2,1 configuration, so for
now we blindly create 2,2,1 topology when DSC is enabled

Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f2ff8a504918..12f58de88ac7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -533,6 +533,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+	struct msm_drm_private *priv;
 	int i, intf_count = 0;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
@@ -567,8 +569,24 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
 
+	drm_enc = &dpu_enc->base;
+	priv = drm_enc->dev->dev_private;
+	if (priv && priv->dsc) {
+		/* In case of Display Stream Compression DSC, we would use
+		 * 2 encoders, 2 line mixers and 1 interface
+		 * this is power optimal and can drive up to (including) 4k
+		 * screens
+		 */
+		topology.num_enc = 2;
+		topology.num_dsc = 2;
+		topology.num_intf = 1;
+		topology.num_lm = 2;
+		priv->dsc->dsc_mask = BIT(0) | BIT(1);
+	}
+
 	return topology;
 }
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c4a588ad226e..d6b25d77700e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -103,12 +103,14 @@ enum msm_event_wait {
  * @num_enc:      number of compression encoder blocks used
  * @num_intf:     number of interfaces the panel is mounted on
  * @num_dspp:     number of dspp blocks used
+ * @num_dsc:      number of Display Stream Compression (DSC) blocks used
  */
 struct msm_display_topology {
 	u32 num_lm;
 	u32 num_enc;
 	u32 num_intf;
 	u32 num_dspp;
+	u32 num_dsc;
 };
 
 /**
-- 
2.31.1

