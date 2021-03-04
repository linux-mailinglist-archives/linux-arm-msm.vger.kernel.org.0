Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D7332CFE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 10:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237805AbhCDJlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 04:41:51 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61791 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237769AbhCDJlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 04:41:40 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 04 Mar 2021 01:41:00 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2021 01:40:58 -0800
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Mar 2021 15:10:31 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id C62D63D38; Thu,  4 Mar 2021 01:40:31 -0800 (PST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        dan.carpenter@oracle.com
Subject: [v1] drm/msm/disp/dpu1: fix warning reported by kernel bot in dpu driver
Date:   Thu,  4 Mar 2021 01:40:29 -0800
Message-Id: <1614850829-31802-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix a warning, pointing to an early deference of a variable before
check. This bug was introduced in the following commit.

commit 4259ff7ae509
("drm/msm/dpu: add support for pcc color block in dpu driver")

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index a7a2453..0f9974c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -26,10 +26,16 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
 
-	u32 base = ctx->cap->sblk->pcc.base;
+	u32 base;
 
-	if (!ctx || !base) {
-		DRM_ERROR("invalid ctx %pK pcc base 0x%x\n", ctx, base);
+	if (!ctx) {
+		DRM_ERROR("invalid dspp ctx %pK\n", ctx);
+		return;
+	}
+
+	base = ctx->cap->sblk->pcc.base;
+	if (!base) {
+		DRM_ERROR("invalid pcc base 0x%x\n", base);
 		return;
 	}
 
-- 
2.7.4

