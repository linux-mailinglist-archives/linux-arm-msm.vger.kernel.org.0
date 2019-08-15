Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8498A8E20A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 02:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbfHOAtP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 20:49:15 -0400
Received: from onstation.org ([52.200.56.107]:44344 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbfHOAtO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 20:49:14 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 70E1D3EA0B;
        Thu, 15 Aug 2019 00:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565830154;
        bh=W1RhsccQye1UHlHsDlLQw0ZtaFOCOLeutTy9qm6UT1g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ljOjdnDfnnO2M7fWsgp2VIsd/s4cfZhi8GnD7ImjQsf55GctyEVH8TzpHZ8SwEnj1
         piyfyWPRBQc1ONqs1OLJW5qnMgQpws6bAUpZoNDjhkkurHtZT38o0szI4uBi6mLZot
         vCbWhMGGKK0OEEe6YtmwXnHvWIQUdgoHluIGXRso=
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
Subject: [PATCH 04/11] drm/bridge: analogix-anx78xx: convert to i2c_new_dummy_device
Date:   Wed, 14 Aug 2019 20:48:47 -0400
Message-Id: <20190815004854.19860-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The i2c_new_dummy() function is deprecated since it returns NULL on
error. Change this to use the recommended replacement
i2c_new_dummy_device() that returns an error code that can be read with
PTR_ERR() and friends.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/bridge/analogix-anx78xx.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index 62dfced91384..8daee6b1fa88 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -1355,15 +1355,18 @@ static int anx78xx_i2c_probe(struct i2c_client *client,
 
 	/* Map slave addresses of ANX7814 */
 	for (i = 0; i < I2C_NUM_ADDRESSES; i++) {
-		anx78xx->i2c_dummy[i] = i2c_new_dummy(client->adapter,
-						anx78xx_i2c_addresses[i] >> 1);
-		if (!anx78xx->i2c_dummy[i]) {
-			err = -ENOMEM;
-			DRM_ERROR("Failed to reserve I2C bus %02x\n",
-				  anx78xx_i2c_addresses[i]);
+		struct i2c_client *i2c_dummy;
+
+		i2c_dummy = i2c_new_dummy_device(client->adapter,
+						 anx78xx_i2c_addresses[i] >> 1);
+		if (IS_ERR(i2c_dummy)) {
+			err = PTR_ERR(i2c_dummy);
+			DRM_ERROR("Failed to reserve I2C bus %02x: %d\n",
+				  anx78xx_i2c_addresses[i], err);
 			goto err_unregister_i2c;
 		}
 
+		anx78xx->i2c_dummy[i] = i2c_dummy;
 		anx78xx->map[i] = devm_regmap_init_i2c(anx78xx->i2c_dummy[i],
 						       &anx78xx_regmap_config);
 		if (IS_ERR(anx78xx->map[i])) {
-- 
2.21.0

