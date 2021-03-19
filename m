Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8FA341D79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 13:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhCSMzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 08:55:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62386 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhCSMye (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 08:54:34 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 19 Mar 2021 05:54:34 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 19 Mar 2021 05:54:32 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 Mar 2021 18:24:09 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 879904309; Fri, 19 Mar 2021 05:54:08 -0700 (PDT)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org
Subject: [v1] drm/msm/disp/dpu1: fix display underruns during modeset.
Date:   Fri, 19 Mar 2021 05:54:06 -0700
Message-Id: <1616158446-19290-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During crtc disable, display perf structures are reset to 0
which includes state varibles which are immutable. On crtc
enable, we use the same structures and they don't refelect
the actual values

1) Fix is to avoid updating the state structures during disable.
2) Reset the perf structures during atomic check when there is no
modeset enable.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 37c8270..b4cd479 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -382,7 +382,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	} else {
 		DPU_DEBUG("crtc=%d disable\n", crtc->base.id);
 		memset(old, 0, sizeof(*old));
-		memset(new, 0, sizeof(*new));
 		update_bus = true;
 		update_clk = true;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9a80981..a821e2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -912,6 +912,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (!state->enable || !state->active) {
 		DPU_DEBUG("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, state->enable, state->active);
+		memset(&cstate->new_perf, 0, sizeof(cstate->new_perf));
 		goto end;
 	}
 
-- 
2.7.4

