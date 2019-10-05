Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20E15CC7DE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 06:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfJEE0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 00:26:51 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41288 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726446AbfJEE0v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 00:26:51 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 045CB6B20099FF753DC8;
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
Subject: [PATCH 4/6] drm/msm/dpu: Remove set but not used variables 'dpu_cstate','priv'
Date:   Sat, 5 Oct 2019 12:33:47 +0800
Message-ID: <1570250029-67639-5-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c: In function dpu_core_perf_crtc_release_bw:
drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:248:25: warning: variable dpu_cstate set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c: In function dpu_core_perf_crtc_update:
drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:337:26: warning: variable priv set but not used [-Wunused-but-set-variable]

They are not used since commit 25fdd5933e4c ("drm/msm:
Add SDM845 DPU support")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 09a49b5..65177c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -215,7 +215,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc;
-	struct dpu_crtc_state *dpu_cstate;
 	struct dpu_kms *kms;

 	if (!crtc) {
@@ -230,7 +229,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	}

 	dpu_crtc = to_dpu_crtc(crtc);
-	dpu_cstate = to_dpu_crtc_state(crtc->state);

 	if (atomic_dec_return(&kms->bandwidth_ref) > 0)
 		return;
@@ -287,7 +285,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	u64 clk_rate = 0;
 	struct dpu_crtc *dpu_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	struct msm_drm_private *priv;
 	struct dpu_kms *kms;
 	int ret;

@@ -301,7 +298,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 		DPU_ERROR("invalid kms\n");
 		return -EINVAL;
 	}
-	priv = kms->dev->dev_private;

 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
--
2.7.4

