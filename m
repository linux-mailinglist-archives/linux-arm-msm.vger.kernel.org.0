Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3CC2E6F49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 10:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgL2JSN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 04:18:13 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10373 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgL2JSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 04:18:12 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D4phB0DPjz7M5V;
        Tue, 29 Dec 2020 17:16:42 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 29 Dec 2020 17:17:26 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/msm/dp: Delete unused local parameters
Date:   Tue, 29 Dec 2020 17:17:27 +0800
Message-ID: <1609233447-61380-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes coccicheck warnings:
drivers/gpu/drm/msm/dp/dp_link.c:848:5-8: Unneeded variable: "ret".
Return "0" on line 880

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index be986da..0c9a79f 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -845,8 +845,6 @@ bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
 
 static int dp_link_parse_vx_px(struct dp_link_private *link)
 {
-	int ret = 0;
-
 	DRM_DEBUG_DP("vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
 		drm_dp_get_adjust_request_voltage(link->link_status, 0),
 		drm_dp_get_adjust_request_voltage(link->link_status, 1),
@@ -877,7 +875,7 @@ static int dp_link_parse_vx_px(struct dp_link_private *link)
 			link->dp_link.phy_params.v_level,
 			link->dp_link.phy_params.p_level);
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.7.4

