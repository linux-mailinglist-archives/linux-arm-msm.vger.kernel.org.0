Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEA08E219
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 02:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbfHOAtk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 20:49:40 -0400
Received: from onstation.org ([52.200.56.107]:44344 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728455AbfHOAtQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 20:49:16 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C4EEE3EA18;
        Thu, 15 Aug 2019 00:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565830155;
        bh=DC5vyeikJaV2JnfcQHCSqPpy7s9WUUfxIAq5L9wP3LQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vjNJnlZ8n/UZaPOd7acB6r2zozVALV/w0H9lqBa1P0XLgtR4Q+Zujaw5Hn7jkRNoj
         rUf/jsrnmCF2mU3kjVTQxl3A0854aZ0MRGCX0rhU1DmJPlLfoNHk+vAQZuFDBaXba3
         LXlEaTrh9oHiy/f6XnfwufapRSZ8iT+ztXoC6t2w=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
        sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH RFC 06/11] drm/bridge: analogix-anx78xx: add support for avdd33 regulator
Date:   Wed, 14 Aug 2019 20:48:49 -0400
Message-Id: <20190815004854.19860-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
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
 drivers/gpu/drm/bridge/analogix-anx78xx.c | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index 8daee6b1fa88..48adf010816c 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -48,6 +48,7 @@ static const u8 anx78xx_i2c_addresses[] = {
 
 struct anx78xx_platform_data {
 	struct regulator *dvdd10;
+	struct regulator *avdd33;
 	struct gpio_desc *gpiod_hpd;
 	struct gpio_desc *gpiod_pd;
 	struct gpio_desc *gpiod_reset;
@@ -707,10 +708,42 @@ static int anx78xx_start(struct anx78xx *anx78xx)
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

