Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC3402E2E12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Dec 2020 12:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgLZLpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Dec 2020 06:45:23 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9997 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgLZLpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Dec 2020 06:45:23 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D325P69SQzhy0B;
        Sat, 26 Dec 2020 19:43:53 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 19:44:37 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <khsieh@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/msm/dp: remove unneeded semicolon
Date:   Sat, 26 Dec 2020 19:44:40 +0800
Message-ID: <1608983080-53515-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the following warning:
drivers/gpu/drm/msm/dp/dp_ctrl.c:1161:2-3: Unneeded semicolon

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e3462f5..61ed67b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1158,7 +1158,7 @@ static int dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
 	default:
 		ret = -EINVAL;
 		break;
-	};
+	}
 
 	if (!ret)
 		DRM_DEBUG_DP("new rate=0x%x\n", ctrl->link->link_params.rate);
-- 
2.7.4

