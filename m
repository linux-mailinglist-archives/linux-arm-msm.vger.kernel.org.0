Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C203D20F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 08:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732954AbfJJGsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 02:48:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56656 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfJJGsI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 02:48:08 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 46110802107B28235897;
        Thu, 10 Oct 2019 14:48:07 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 10 Oct 2019
 14:47:56 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <robdclark@chromium.org>, <sean@poorly.run>, <airlied@linux.ie>,
        <bjorn.andersson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 2/4] drm/msm/mdp5: Remove set but not used variable 'hw_cfg' in blend_setup
Date:   Thu, 10 Oct 2019 14:55:04 +0800
Message-ID: <1570690506-83287-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
References: <1570690506-83287-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c: In function blend_setup:
drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:225:28: warning: variable hw_cfg set but not used [-Wunused-but-set-variable]

It is not used since commit 14be3200cd5f ("drm/msm: rename mdp->disp")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index eb0b4b7..05cc04f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -214,7 +214,6 @@ static void blend_setup(struct drm_crtc *crtc)
 	struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct drm_plane *plane;
-	const struct mdp5_cfg_hw *hw_cfg;
 	struct mdp5_plane_state *pstate, *pstates[STAGE_MAX + 1] = {NULL};
 	const struct mdp_format *format;
 	struct mdp5_hw_mixer *mixer = pipeline->mixer;
@@ -232,8 +231,6 @@ static void blend_setup(struct drm_crtc *crtc)
 	u32 val;
 #define blender(stage)	((stage) - STAGE0)

-	hw_cfg = mdp5_cfg_get_hw_config(mdp5_kms->cfg);
-
 	spin_lock_irqsave(&mdp5_crtc->lm_lock, flags);

 	/* ctl could be released already when we are shutting down: */
--
2.7.4

