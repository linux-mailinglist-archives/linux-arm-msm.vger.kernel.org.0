Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBEEA3926BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 07:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhE0FKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 01:10:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17888 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhE0FJ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 01:09:59 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 May 2021 22:08:25 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 May 2021 22:08:23 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 May 2021 10:37:58 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id BB93820E58; Thu, 27 May 2021 10:37:57 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, kalyan_t@codeaurora.org,
        swboyd@chromium.org, dianders@chromium.org
Subject: [v1] drm/msm/disp/dpu1: avoid perf update in frame done event
Date:   Thu, 27 May 2021 10:37:56 +0530
Message-Id: <1622092076-5100-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Crtc perf update from frame event work can result in
wrong bandwidth and clock update from dpu if the work
is scheduled after the swap state has happened.

Avoid such issues by moving perf update to complete
commit once the frame is accepted by the hardware.

Fixes: a29c8c024165 ("drm/msm/disp/dpu1: fix display underruns during modeset")
Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 18bc76b..4523d6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -407,9 +407,6 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
 								fevent->event);
 		}
 
-		if (fevent->event & DPU_ENCODER_FRAME_EVENT_DONE)
-			dpu_core_perf_crtc_update(crtc, 0, false);
-
 		if (fevent->event & (DPU_ENCODER_FRAME_EVENT_DONE
 					| DPU_ENCODER_FRAME_EVENT_ERROR))
 			frame_done = true;
@@ -477,6 +474,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 {
 	trace_dpu_crtc_complete_commit(DRMID(crtc));
+	dpu_core_perf_crtc_update(crtc, 0, false);
 	_dpu_crtc_complete_flip(crtc);
 }
 
-- 
2.7.4

