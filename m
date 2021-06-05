Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFFE39C82E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 14:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFEMmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 08:42:50 -0400
Received: from mail-m17639.qiye.163.com ([59.111.176.39]:56314 "EHLO
        mail-m17639.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhFEMmu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 08:42:50 -0400
X-Greylist: delayed 315 seconds by postgrey-1.27 at vger.kernel.org; Sat, 05 Jun 2021 08:42:50 EDT
Received: from ubuntu.localdomain (unknown [36.152.145.181])
        by mail-m17639.qiye.163.com (Hmail) with ESMTPA id 321F4380146;
        Sat,  5 Jun 2021 20:35:45 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bernard Zhao <bernard@vivo.com>,
        Guenter Roeck <groeck@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: remove no need local variable
Date:   Sat,  5 Jun 2021 05:35:20 -0700
Message-Id: <20210605123543.8986-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQkgdGFZJGB1OHx5DSk5OGENVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OUk6Dhw5Hz8XGQkaCx4KDhkt
        MB8wCy9VSlVKTUlJQ0JNTk9NSk5NVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
        TklVSk9OVUpDSllXWQgBWUFJSE5INwY+
X-HM-Tid: 0a79dc2c0f02d994kuws321f4380146
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unneeded variable: "ret". Return "0" on line 880

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 9cc816663668..8cb3d016101c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -351,7 +351,6 @@ void dp_panel_dump_regs(struct dp_panel *dp_panel)
 
 int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 {
-	int rc = 0;
 	u32 data, total_ver, total_hor;
 	struct dp_catalog *catalog;
 	struct dp_panel_private *panel;
@@ -404,7 +403,7 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	dp_catalog_panel_timing_cfg(catalog);
 	panel->panel_on = true;
 
-	return rc;
+	return 0;
 }
 
 int dp_panel_init_panel_info(struct dp_panel *dp_panel)
-- 
2.31.0

