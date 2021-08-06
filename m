Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300F73E26FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 11:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244175AbhHFJPg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 05:15:36 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:29661 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244093AbhHFJPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 05:15:35 -0400
Received: from localhost.localdomain ([217.128.214.245])
        by mwinf5d28 with ME
        id e9FH2500C5JEng9039FH0u; Fri, 06 Aug 2021 11:15:19 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Aug 2021 11:15:19 +0200
X-ME-IP: 217.128.214.245
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
        abhinavk@codeaurora.org, hali@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/msm/dsi: Fix some reference counted resource leaks
Date:   Fri,  6 Aug 2021 11:15:13 +0200
Message-Id: <f15bc57648a00e7c99f943903468a04639d50596.1628241097.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'of_find_device_by_node()' takes a reference that must be released when
not needed anymore.
This is expected to be done in 'dsi_destroy()'.

However, there are 2 issues in 'dsi_get_phy()'.

First, if 'of_find_device_by_node()' succeeds but 'platform_get_drvdata()'
returns NULL, 'msm_dsi->phy_dev' will still be NULL, and the reference
won't be released in 'dsi_destroy()'.

Secondly, as 'of_find_device_by_node()' already takes a reference, there is
no need for an additional 'get_device()'.

Move the assignment to 'msm_dsi->phy_dev' a few lines above and remove the
unneeded 'get_device()' to solve both issues.

Fixes: ec31abf6684e ("drm/msm/dsi: Separate PHY to another platform device")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Review carefully, management of reference counted resources is sometimes
tricky.
---
 drivers/gpu/drm/msm/dsi/dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 75afc12a7b25..29d11f1cb79b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -26,8 +26,10 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
 	}
 
 	phy_pdev = of_find_device_by_node(phy_node);
-	if (phy_pdev)
+	if (phy_pdev) {
 		msm_dsi->phy = platform_get_drvdata(phy_pdev);
+		msm_dsi->phy_dev = &phy_pdev->dev;
+	}
 
 	of_node_put(phy_node);
 
@@ -36,8 +38,6 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
 		return -EPROBE_DEFER;
 	}
 
-	msm_dsi->phy_dev = get_device(&phy_pdev->dev);
-
 	return 0;
 }
 
-- 
2.30.2

