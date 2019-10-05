Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADC3CC7E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 06:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfJEE0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 00:26:51 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41362 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726511AbfJEE0v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 00:26:51 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0D185F5FF226D5F2FDDE;
        Sat,  5 Oct 2019 12:26:50 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 12:26:39 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <jsanka@codeaurora.org>,
        <jcrouse@codeaurora.org>, <gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 5/6] drm/msm/dpu: Remove set but not used variables 'cmd_enc','priv'
Date:   Sat, 5 Oct 2019 12:33:48 +0800
Message-ID: <1570250029-67639-6-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570250029-67639-1-git-send-email-zhengbin13@huawei.com>
References: <1570250029-67639-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function dpu_encoder_phys_cmd_ctl_start_irq:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:136:31: warning: variable cmd_enc set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function dpu_encoder_phys_cmd_irq_control:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:328:31: warning: variable cmd_enc set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function dpu_encoder_phys_cmd_tearcheck_config:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:367:26: warning: variable priv set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function dpu_encoder_phys_cmd_wait_for_tx_complete:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:662:31: warning: variable cmd_enc set but not used [-Wunused-but-set-variable]

They are not used since commit 25fdd5933e4c ("drm/msm:
Add SDM845 DPU support")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 2923b63..6169c75 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -124,13 +124,11 @@ static void dpu_encoder_phys_cmd_pp_rd_ptr_irq(void *arg, int irq_idx)
 static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
-	struct dpu_encoder_phys_cmd *cmd_enc;

 	if (!phys_enc || !phys_enc->hw_ctl)
 		return;

 	DPU_ATRACE_BEGIN("ctl_start_irq");
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);

 	atomic_add_unless(&phys_enc->pending_ctlstart_cnt, -1, 0);

@@ -316,13 +314,9 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
 		bool enable)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc;
-
 	if (!phys_enc)
 		return;

-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
 	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			enable, atomic_read(&phys_enc->vblank_refcount));
@@ -355,7 +349,6 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	struct drm_display_mode *mode;
 	bool tc_enable = true;
 	u32 vsync_hz;
-	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;

 	if (!phys_enc || !phys_enc->hw_pp) {
@@ -377,7 +370,6 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 		DPU_ERROR("invalid device\n");
 		return;
 	}
-	priv = dpu_kms->dev->dev_private;

 	/*
 	 * TE default: dsi byte clock calculated base on 70 fps;
@@ -650,13 +642,10 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 		struct dpu_encoder_phys *phys_enc)
 {
 	int rc;
-	struct dpu_encoder_phys_cmd *cmd_enc;

 	if (!phys_enc)
 		return -EINVAL;

-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
 	rc = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
 	if (rc) {
 		DRM_ERROR("failed wait_for_idle: id:%u ret:%d intf:%d\n",
--
2.7.4

