Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D4E2EFFF5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 14:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbhAINiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 08:38:23 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:43631 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAINiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 08:38:23 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C6AD53EF1C;
        Sat,  9 Jan 2021 14:37:40 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 8/9] drm/msm/dpu: Add a function to retrieve the current CTL status
Date:   Sat,  9 Jan 2021 14:37:35 +0100
Message-Id: <20210109133736.143469-9-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
References: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
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
index 758c355b4fd8..626fd41379fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -82,6 +82,11 @@ static inline void dpu_hw_ctl_trigger_start(struct dpu_hw_ctl *ctx)
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
@@ -550,6 +555,7 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
 	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
 	ops->trigger_start = dpu_hw_ctl_trigger_start;
+	ops->is_started = dpu_hw_ctl_is_started;
 	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
 	ops->reset = dpu_hw_ctl_reset_control;
 	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index ec579b470a80..c376b5ae7803 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -59,6 +59,13 @@ struct dpu_hw_ctl_ops {
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
2.29.2

