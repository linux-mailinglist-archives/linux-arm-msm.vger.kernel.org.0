Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5365115E96
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfLGUgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:36:18 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43942 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLGUgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:36:17 -0500
Received: by mail-pf1-f196.google.com with SMTP id h14so5138317pfe.10;
        Sat, 07 Dec 2019 12:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cVm3fTMGs3Ke7LE9pcHFJZXCh+yS4/KCWiEc/FuKj34=;
        b=OEECddpvOrRkOHKphVcLzjAo5l1LyjDSbYArI7pl794LpAjUmWUCJD5PxVBb/q7Rlw
         Iky1w3tt3+AQH2X/oeWERBrmkT0PiAk1+PuEwMswhVguy0+wReG2xEJ9hqJKMQwMb52r
         tzIfsIeV68azc1QXvzZWhGLG2pv8aD4jX6D5Y84xIfKPNiSkmMgF/VfD53hai+qNQpaj
         9fCpljuMnNZl+sQFx2myqDUk1/fe0GwoM1JlzQBgxLuap2GENkT2BHBDb7KKmGLFmv20
         8xXjGq86IFO8cp2RVkUWlPX/bFS/F7QQJPpP8OBXgOuWGUrEiGe7Rq1lUmNHZqjXr++U
         a+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVm3fTMGs3Ke7LE9pcHFJZXCh+yS4/KCWiEc/FuKj34=;
        b=BivL127VdxBy9yBw1bW924Aa2WYPcq9C8YB5HERdTVzu5Be12WWF57I0Vy7ugh6BCK
         CNh8hXZR25Mn5z96Rh6i2t5DWM1n5K3v7fhtmu4Qazbg0SR1raWCIDsSI2fJLqh4Rxmb
         QRIJIPHhwe4tx+8iSAGR5fKTuJBB3hAHmbPVVoZdp93GRXqM/2KxpPCL29rVNXKFapgX
         kWA22VePg1kSj7+1yP1Er/0YOiRmB4Wn6/x4Ge9ZMic8dBREcRN7GqYkFA2yd4zMyQTX
         e7UKTTL5zEWvnJD6toNMnj8K1PXZ8CSA1iSlJu6MjJmAcugf3ywRscdQ9d/5vJtFVl2z
         6k/A==
X-Gm-Message-State: APjAAAXnmWaNCri7i9SCIRF7uKYrmf3Luqd0J2WYg7i09JkGX2pQ3/9P
        4nVPLwIjhYXfim9cYGt+HDM=
X-Google-Smtp-Source: APXvYqyXkQWGRk0eUOkq9bFetsRJZzyqR9S1EFwc18YoOwHz+LAS2LVd0p0QBem+UVSKxeVb7hixvw==
X-Received: by 2002:a62:5202:: with SMTP id g2mr21373195pfb.43.1575750976236;
        Sat, 07 Dec 2019 12:36:16 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j3sm20479085pfi.8.2019.12.07.12.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:15 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        aarch64-laptops@lists.linaro.org
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] drm/bridge: ti-sn65dsi86: find any enabled endpoint
Date:   Sat,  7 Dec 2019 12:35:52 -0800
Message-Id: <20191207203553.286017-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191207203553.286017-1-robdclark@gmail.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This bridge is used on a number of devices that can have one of multiple
different panels installed.  The firmware will enable the panel driver
node for the panel that is actually installed.  So the bridge should ask
drm_of_find_panel_or_bridge() to find the endpoint for the enabled
panel.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 43abf01ebd4c..62bc98d9d152 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -720,7 +720,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	pdata->dev = &client->dev;
 
-	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
+	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, -1,
 					  &pdata->panel, NULL);
 	if (ret) {
 		DRM_ERROR("could not find any panel node\n");
-- 
2.23.0

