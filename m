Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 444148E222
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 02:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbfHOAtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 20:49:55 -0400
Received: from onstation.org ([52.200.56.107]:44344 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbfHOAtN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 20:49:13 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 1F73C3E9DE;
        Thu, 15 Aug 2019 00:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565830152;
        bh=kd0RcC8EypG7pu0fFFwfrtGaJLMU4ZBdU98OJAZs4wc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zyr/OmmFc1pFqaN7q1uS3WkW7lsWqpU0xv5LyXFy4NGocFyuwV0Cz/JWVi7tQxsAj
         rw+LjB0NmAWn5XnoC4egZzqXVUHMH4ArPs5aOJBFQ0HO65BMLTuxR6o73aNOdzFJZZ
         ZOVLfYqsyC+2nMJ2TosUl5r0beffcAFXtHU58h/E=
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
Subject: [PATCH 02/11] drm/bridge: analogix-anx78xx: add new variants
Date:   Wed, 14 Aug 2019 20:48:45 -0400
Message-Id: <20190815004854.19860-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the 7808 variant. While we're here, the of match table
was missing support for the 7812 and 7818 variants, so add them as well.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/bridge/analogix-anx78xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index 3c7cc5af735c..9acdbedf1245 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -1301,6 +1301,7 @@ static const struct regmap_config anx78xx_regmap_config = {
 };
 
 static const u16 anx78xx_chipid_list[] = {
+	0x7808,
 	0x7812,
 	0x7814,
 	0x7818,
@@ -1463,7 +1464,10 @@ MODULE_DEVICE_TABLE(i2c, anx78xx_id);
 
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id anx78xx_match_table[] = {
+	{ .compatible = "analogix,anx7808", },
+	{ .compatible = "analogix,anx7812", },
 	{ .compatible = "analogix,anx7814", },
+	{ .compatible = "analogix,anx7818", },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, anx78xx_match_table);
-- 
2.21.0

