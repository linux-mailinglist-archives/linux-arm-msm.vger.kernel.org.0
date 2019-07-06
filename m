Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67D9E6104C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2019 13:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfGFLLw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Jul 2019 07:11:52 -0400
Received: from onstation.org ([52.200.56.107]:43804 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfGFLLv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Jul 2019 07:11:51 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 34FC93EE72;
        Sat,  6 Jul 2019 11:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562411510;
        bh=9cS2ydOA+KgzUTCiP9CODFmbS9Ga+mbp4SRgk17zSTQ=;
        h=From:To:Cc:Subject:Date:From;
        b=XtRF2BQeKmlC7mlP1jE2b+HH2EKT8V8epfArAt0Xr+rEx2WTrCMk6HDBxy6ITdgXE
         8REsIhod/4UHChJjWb1I3fGfUjQmrWi2ebroo0hNR0Ib9p67bwaxmilIw14Nf+o54p
         YPJYX/LbQIsnt+mMpR+6DV6pmvevRKcxmzBzmdzs=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/phy/dsi_phy: silence -EPROBE_DEFER warnings
Date:   Sat,  6 Jul 2019 07:11:38 -0400
Message-Id: <20190706111138.2238-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following errors show up when booting the Nexus 5:

msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR*
 dsi_phy_regulator_init: failed to init regulator, ret=-517
msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR*
 dsi_phy_driver_probe: failed to init regulator

dsi_phy_regulator_init() already logs the error, so no need to log
the same error a second time in dsi_phy_driver_probe(). This patch
also changes dsi_phy_regulator_init() to not log the error if the
error code is -EPROBE_DEFER to reduce noise in dmesg.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4097eca1b3ef..d0e1cc6728dc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -396,8 +396,11 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 
 	ret = devm_regulator_bulk_get(dev, num, s);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "%s: failed to init regulator, ret=%d\n",
-						__func__, ret);
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev,
+				      "%s: failed to init regulator, ret=%d\n",
+				      __func__, ret);
+
 		return ret;
 	}
 
@@ -584,10 +587,8 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	}
 
 	ret = dsi_phy_regulator_init(phy);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: failed to init regulator\n", __func__);
+	if (ret)
 		goto fail;
-	}
 
 	phy->ahb_clk = msm_clk_get(pdev, "iface");
 	if (IS_ERR(phy->ahb_clk)) {
-- 
2.20.1

