Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CD9452A85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 07:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhKPG0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 01:26:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:58482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230018AbhKPG0f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 01:26:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D0F061C14;
        Tue, 16 Nov 2021 06:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637043818;
        bh=8Tn4eiu65chTlV9GpBsJxq5woJ47j+59RWB1tmI83cE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cOuRuvZtjfsE0It8VEGTpy3Wwp6qZBnwj4yG/IeJsbM0EEIPQcW5h3M92ijROHTIT
         hkSmay/9hCXFPuSj9KrJlsiFo7Z7JQUP6bkd5OYLlOxohDbtsqm7PHV4CkUBMGWf/5
         b8ctW/gxleUF0bA5UtTGHq+KkbPioHP/NKfXCSx+2HGXb+jVGNOn2WrOdOLwDtJlsF
         sWb/X35t2wYSOoVuJeGiHRDyY4sA6vuzgcLqBW9b09zGn98t9K9Er3od3ifYlqeLlD
         8JPkC9EU1isS8S+7BN4buOsm1pI/TGmogMoLQ3uJOYFRlAymoLG+IDYIbbdKmMhaj6
         C7nH1JOJbzT+A==
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
Subject: [PATCH v3 05/13] drm/msm/disp/dpu1: Don't use DSC with mode_3d
Date:   Tue, 16 Nov 2021 11:52:48 +0530
Message-Id: <20211116062256.2417186-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116062256.2417186-1-vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We cannot enable mode_3d when we are using the DSC. So pass
configuration to detect DSC is enabled and not enable mode_3d
when we are using DSC

We add a helper dpu_encoder_helper_get_dsc() to detect dsc
enabled and pass this to .setup_intf_cfg()

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e7270eb6b84b..efb85d595598 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -332,6 +332,17 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 	return BLEND_3D_NONE;
 }
 
+static inline bool dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *drm_enc = phys_enc->parent;
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+
+	if (priv->dsc)
+		return priv->dsc->dsc_mask;
+
+	return 0;
+}
+
 /**
  * dpu_encoder_helper_split_config - split display configuration helper function
  *	This helper function may be used by physical encoders to configure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 34a6940d12c5..f3f00f4d0193 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -70,6 +70,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
+	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
+
 	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 64740ddb983e..36831457a91b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -519,7 +519,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 
 	intf_cfg |= (cfg->intf & 0xF) << 4;
 
-	if (cfg->mode_3d) {
+	/* In DSC we can't set merge, so check for dsc too */
+	if (cfg->mode_3d && !cfg->dsc) {
 		intf_cfg |= BIT(19);
 		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171e5df2..9847c9c46d6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
  * @merge_3d:              3d merge block used
  * @intf_mode_sel:         Interface mode, cmd / vid
  * @stream_sel:            Stream selection for multi-stream interfaces
+ * @dsc:                   DSC BIT masks
  */
 struct dpu_hw_intf_cfg {
 	enum dpu_intf intf;
@@ -47,6 +48,7 @@ struct dpu_hw_intf_cfg {
 	enum dpu_merge_3d merge_3d;
 	enum dpu_ctl_mode_sel intf_mode_sel;
 	int stream_sel;
+	unsigned int dsc;
 };
 
 /**
-- 
2.31.1

