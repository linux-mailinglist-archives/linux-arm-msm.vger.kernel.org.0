Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B7130BE3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 13:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhBBMdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 07:33:17 -0500
Received: from mail-m17640.qiye.163.com ([59.111.176.40]:59844 "EHLO
        mail-m17640.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbhBBMdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 07:33:15 -0500
Received: from ubuntu.localdomain (unknown [157.0.31.124])
        by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 66E035401D8;
        Tue,  2 Feb 2021 20:32:25 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Bernard Zhao <bernard@vivo.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com
Subject: [PATCH] drm/msm: remove unneeded variable: "rc"
Date:   Tue,  2 Feb 2021 04:32:03 -0800
Message-Id: <20210202123214.15787-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZHUJLTk4aTh1JGElKVkpNSklJTUJKT05MSElVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46CCo4Fj8cFzY6Ii9NLCEQ
        DwEKFDVVSlVKTUpJSU1CSk9NS0JMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU9ZV1kIAVlBSU9ISzcG
X-HM-Tid: 0a7762bace45d995kuws66e035401d8
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

remove unneeded variable: "rc".

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d1780bcac8cc..9cc816663668 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -409,7 +409,6 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 
 int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 {
-	int rc = 0;
 	struct drm_display_mode *drm_mode;
 
 	drm_mode = &dp_panel->dp_mode.drm_mode;
@@ -436,7 +435,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 					min_t(u32, dp_panel->dp_mode.bpp, 30));
 	DRM_DEBUG_DP("updated bpp = %d\n", dp_panel->dp_mode.bpp);
 
-	return rc;
+	return 0;
 }
 
 struct dp_panel *dp_panel_get(struct dp_panel_in *in)
-- 
2.29.0

