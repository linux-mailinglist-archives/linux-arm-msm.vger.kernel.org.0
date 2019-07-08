Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEF0626BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 18:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390524AbfGHQ6R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 12:58:17 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44005 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387616AbfGHQ6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 12:58:16 -0400
Received: by mail-pl1-f194.google.com with SMTP id cl9so8555213plb.10;
        Mon, 08 Jul 2019 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T1w86HYowDLmCMH8t5cBhr+6c2jCirc20RP6wN4si70=;
        b=WRYTWK7F5Ug23w8882zblyMsDIYjkcH4ACBYvdFKP4HL+HoJF1SflMX5UPfAE18J9s
         HOCDZ+7FN/A8VyoDiR58OWig3Sbj4SSt6eO+ZgLGUnQlHF1VlI0ye9BaFZ9w3O9mNoDd
         V8D64/xzPpIE0ptFL9EASiMiMRdaXsOXqu3JeLfO6kTmqz128xjw4FWNo1nnm3UWV1Wr
         6hm6o3QWjC+zTUMjI5GtOmVAFivpp6vN/fh8mcTxXOFDwzAzgHovj/Zr4Jhp1+RVNM/I
         8vdtJYAdy18AzDQOw4OpGLMLqr4FMX78KI5jjJHg9k39D4D5HVsKIOxogpqEwR/B3v30
         K27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T1w86HYowDLmCMH8t5cBhr+6c2jCirc20RP6wN4si70=;
        b=WN696e4q1QzcyVLCW1QQYTvw+zX24ZQRa6o17J5Qvuno8bYr34smCmEdn7O+asUeJm
         mOPGpqrO+xTaYNNhnbwOXyYiiwKjGlha5qfKDry9zWlI90OEjzhqfSnuzNA4jQOljoaY
         MfDuZfECw2shb8N/lao2Pdu1kW2syXQUZRQQWMc8pXEuWlKyTwkqtK4IBnwLndqhnXnP
         fdGA39G2W7VmNW6lN2nlcx2unYbKMBbCA1BmDruF6x3EcAV6PqX7sehuiYKSXgn+e0gL
         LyBacVNOMyTbL9IBqSSElJH0LxwHkEud1d1RQqG3/JPQCPxG8kgMjRQr+IYUPtNFeLll
         yVJA==
X-Gm-Message-State: APjAAAWkji+loa/s2PuKCNqG/VrtcxDiRfg743hxy1eePb46JdV1IZzv
        n1tRsHuCpzOP3opyZsH7JBE=
X-Google-Smtp-Source: APXvYqyFG3Gc3x/EWlA+SYYdLs8gzBuzL0sMqRKNFy/azUlajXonAhGrBaf2rrvEJ6mwe/wrQGrUCg==
X-Received: by 2002:a17:902:f089:: with SMTP id go9mr26326216plb.81.1562605096151;
        Mon, 08 Jul 2019 09:58:16 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id z13sm66698pjn.32.2019.07.08.09.58.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 09:58:15 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 2/2] drm/panel: simple: Add support for Sharp LD-D5116Z01B panel
Date:   Mon,  8 Jul 2019 09:58:11 -0700
Message-Id: <20190708165811.46370-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5a93c4edf1e4..a8808b13c370 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2354,6 +2354,32 @@ static const struct panel_desc samsung_ltn140at29_301 = {
 	},
 };
 
+static const struct drm_display_mode sharp_ld_d5116z01b_mode = {
+	.clock = 168480,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 80,
+	.vdisplay = 1280,
+	.vsync_start = 1280 + 3,
+	.vsync_end = 1280 + 3 + 10,
+	.vtotal = 1280 + 3 + 10 + 57,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc sharp_ld_d5116z01b = {
+	.modes = &sharp_ld_d5116z01b_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 260,
+		.height = 120,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DATA_MSB_TO_LSB,
+};
+
 static const struct drm_display_mode sharp_lq035q7db03_mode = {
 	.clock = 5500,
 	.hdisplay = 240,
@@ -3002,6 +3028,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "samsung,ltn140at29-301",
 		.data = &samsung_ltn140at29_301,
+	}, {
+		.compatible = "sharp,ld-d5116z01b",
+		.data = &sharp_ld_d5116z01b,
 	}, {
 		.compatible = "sharp,lq035q7db03",
 		.data = &sharp_lq035q7db03,
-- 
2.17.1

