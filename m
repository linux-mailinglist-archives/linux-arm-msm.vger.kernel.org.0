Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686ED40799C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 18:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhIKQkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 12:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhIKQkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 12:40:37 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175B5C061574;
        Sat, 11 Sep 2021 09:39:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1C9C81F52D;
        Sat, 11 Sep 2021 18:39:21 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, abhinavk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 1/2] drm/msm/dpu: Add a function to retrieve the current CTL status
Date:   Sat, 11 Sep 2021 18:39:18 +0200
Message-Id: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a function that returns whether the requested CTL is active or not:
this will be used in a later commit to fix command mode panel issues.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 64740ddb983e..3b6fd73eb3a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -91,6 +91,11 @@ static inline void dpu_hw_ctl_trigger_start(struct dpu_hw_ctl *ctx)
 	DPU_REG_WRITE(&ctx->hw, CTL_START, 0x1);
 }
 
+static inline bool dpu_hw_ctl_is_started(struct dpu_hw_ctl *ctx)
+{
+	return !!(DPU_REG_READ(&ctx->hw, CTL_START) & BIT(0));
+}
+
 static inline void dpu_hw_ctl_trigger_pending(struct dpu_hw_ctl *ctx)
 {
 	trace_dpu_hw_ctl_trigger_prepare(ctx->pending_flush_mask,
@@ -579,6 +584,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
 	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
 	ops->trigger_start = dpu_hw_ctl_trigger_start;
+	ops->is_started = dpu_hw_ctl_is_started;
 	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
 	ops->reset = dpu_hw_ctl_reset_control;
 	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 806c171e5df2..ac1544474022 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -61,6 +61,13 @@ struct dpu_hw_ctl_ops {
 	 */
 	void (*trigger_start)(struct dpu_hw_ctl *ctx);
 
+	/**
+	 * check if the ctl is started
+	 * @ctx       : ctl path ctx pointer
+	 * @Return: true if started, false if stopped
+	 */
+	bool (*is_started)(struct dpu_hw_ctl *ctx);
+
 	/**
 	 * kickoff prepare is in progress hw operation for sw
 	 * controlled interfaces: DSI cmd mode and WB interface
-- 
2.32.0

