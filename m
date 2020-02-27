Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B49C31712A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 09:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgB0Ije (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 03:39:34 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:62996 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728526AbgB0Ije (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 03:39:34 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Feb 2020 14:08:53 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 27 Feb 2020 14:08:34 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id AF85B2210; Thu, 27 Feb 2020 14:08:33 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v2 2/2] drm/msm/dpu: fix reservation cleanup during modeset
Date:   Thu, 27 Feb 2020 14:08:31 +0530
Message-Id: <1582792711-26935-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582792711-26935-1-git-send-email-mkrishn@codeaurora.org>
References: <1582792711-26935-1-git-send-email-mkrishn@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Missing return statement will cause the reservations to
get released prematurely, thus messing up the allocation
for any next successive datapath reservation.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v2:
	- Change in commit message
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 136e4d0..0052212 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1084,6 +1084,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	dpu_enc->mode_set_complete = true;
 
+	return;
+
 error:
 	dpu_rm_release(&dpu_kms->rm, drm_enc);
 }
-- 
1.9.1

