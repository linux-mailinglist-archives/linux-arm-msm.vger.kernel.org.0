Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B3D22ACE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 12:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgGWKpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 06:45:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:42330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726867AbgGWKpk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 06:45:40 -0400
Received: from localhost.localdomain (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8B142064C;
        Thu, 23 Jul 2020 10:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595501139;
        bh=Zz0y3R3pM6WlxKDZI6QF8jEpwkN4nY0Y85iMe50eUTs=;
        h=From:To:Cc:Subject:Date:From;
        b=awq9nOdJyx5nARNbYW9zQRWsxxGgSdyq1yyaldhqyy6eWmc6vW78ioW4XrzSKmEKn
         C2NOqnMX7D9FF27yTmWa4T4noCnZfnzhtnpLcdEbgGbpwm3wqE811O56/uiesRwBdb
         LHAhHo7EZ5DdWifn7yF7itZh7dmoa/4UFf3Xcqy0=
From:   Vinod Koul <vkoul@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Clark <robdclark@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: adv7511: Add missing bridge type
Date:   Thu, 23 Jul 2020 16:15:23 +0530
Message-Id: <20200723104523.1006706-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bridge type as DRM_MODE_CONNECTOR_HDMIA

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---

I found this when testing Dragon-board 410c which uses this bridge
[    6.671913] msm 1a00000.mdss: [drm:msm_dsi_manager_ext_bridge_init [msm]] *ERROR* drm_bridge_connector_init failed: -22
[    6.678879] msm 1a00000.mdss: [drm:msm_dsi_modeset_init [msm]] *ERROR* failed to create dsi connector: -19

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f45cdca9cce5..a0d392c338da 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1283,6 +1283,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			    | DRM_BRIDGE_OP_HPD;
 	adv7511->bridge.of_node = dev->of_node;
+	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
 	drm_bridge_add(&adv7511->bridge);
 
-- 
2.26.2

