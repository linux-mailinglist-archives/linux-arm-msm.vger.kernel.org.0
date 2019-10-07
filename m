Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E541CDA47
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 03:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfJGBpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Oct 2019 21:45:32 -0400
Received: from onstation.org ([52.200.56.107]:33016 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbfJGBpW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Oct 2019 21:45:22 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id D60943F230;
        Mon,  7 Oct 2019 01:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570412722;
        bh=eRhUOSJT70X+Sx4VC7+xmjW4CgqLv3ArFwLDB0ZPKsU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bhYAtfG+PVYsR5Zyv24EW+FNMDahNcIB7R4WgdlnsbSY1BIhljjmT9rM605Msch2n
         /SSQtVlMqZosCTOlz6OM8kpLmcy5G81gzF+QWUn6eG59PYPjwel1R5WSkX6qND3r74
         c9LlZmBsiZORXbtzvlTVRalr1HyMfK9yvz27NlMU=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     bjorn.andersson@linaro.org, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca
Subject: [PATCH RFC v2 1/5] drm/bridge: analogix-anx78xx: add support for avdd33 regulator
Date:   Sun,  6 Oct 2019 21:45:05 -0400
Message-Id: <20191007014509.25180-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007014509.25180-1-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the avdd33 regulator to the analogix-anx78xx driver.
Note that the regulator is currently enabled during driver probe and
disabled when the driver is removed. This is currently how the
downstream MSM kernel sources do this.

Let's not merge this upstream for the mean time until I get the external
display fully working on the Nexus 5 and then I can submit proper
support then that powers down this regulator in the power off function.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v1:
- None

 drivers/gpu/drm/bridge/analogix-anx78xx.c | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index dec3f7e66aa0..e25fae36dbe1 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -56,6 +56,7 @@ static const u8 anx781x_i2c_addresses[] = {
 
 struct anx78xx_platform_data {
 	struct regulator *dvdd10;
+	struct regulator *avdd33;
 	struct gpio_desc *gpiod_hpd;
 	struct gpio_desc *gpiod_pd;
 	struct gpio_desc *gpiod_reset;
@@ -715,10 +716,42 @@ static int anx78xx_start(struct anx78xx *anx78xx)
 	return err;
 }
 
+static void anx78xx_disable_regulator_action(void *_data)
+{
+	struct anx78xx_platform_data *pdata = _data;
+
+	regulator_disable(pdata->avdd33);
+}
+
 static int anx78xx_init_pdata(struct anx78xx *anx78xx)
 {
 	struct anx78xx_platform_data *pdata = &anx78xx->pdata;
 	struct device *dev = &anx78xx->client->dev;
+	int err;
+
+	/* 3.3V digital core power regulator  */
+	pdata->avdd33 = devm_regulator_get(dev, "avdd33");
+	if (IS_ERR(pdata->avdd33)) {
+		err = PTR_ERR(pdata->avdd33);
+		if (err != -EPROBE_DEFER)
+			DRM_ERROR("avdd33 regulator not found\n");
+
+		return err;
+	}
+
+	err = regulator_enable(pdata->avdd33);
+	if (err) {
+		DRM_ERROR("Failed to enable avdd33 regulator: %d\n", err);
+		return err;
+	}
+
+	err = devm_add_action(dev, anx78xx_disable_regulator_action,
+			      pdata);
+	if (err < 0) {
+		dev_err(dev, "Failed to setup regulator cleanup action %d\n",
+			err);
+		return err;
+	}
 
 	/* 1.0V digital core power regulator  */
 	pdata->dvdd10 = devm_regulator_get(dev, "dvdd10");
-- 
2.21.0

