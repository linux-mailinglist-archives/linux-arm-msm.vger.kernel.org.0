Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC7A60AB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 18:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfGEQ57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 12:57:59 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35900 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfGEQ57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 12:57:59 -0400
Received: by mail-pl1-f195.google.com with SMTP id k8so4873810plt.3;
        Fri, 05 Jul 2019 09:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EMo2sIUAdM2t9ksGkmQROdMoH8vxWbe9ivlhPSrt+vI=;
        b=Aw4Wd9tthSW64a6ZKiLJjfEyAgaABmJFwgwEaEPTYJ1oi5N5NDzZA4uN1W7SDD/90V
         EduPRk2IxoI5sh+fxq3m4w5W6VNLwk2Ac9sIzFMqjSq0dZJ+fiyiZ4+IB/rRD1zQxDfu
         CBReQV8eos0//ZG67acEWFCt0CUKcJ95wH5rbZ0vhdjR5Nu01kLxGyIA6fPcW2s46GIO
         zpBfoM/vzT9/PL/9pcyPwd6RxWZpvRqFBEpqICQ3rf1ju9IUBV2YQBzQBIZUlQlmwHrv
         qbM1X09V/v9auDId/vPRk/jadLEnpCvpEJDXLhTQq0sLx3H7Hxt9OP+D6siiEiKCVNlB
         OsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EMo2sIUAdM2t9ksGkmQROdMoH8vxWbe9ivlhPSrt+vI=;
        b=ZDZkD1tBQlEeit04qdXLm6xeNqo9IHIKc6PY0+PKCZ1I2fUoKN8fORigf76bK6cNXf
         gjm9EARBUMaE6cbn5wvqPtdQQm7pZCZ88ZgI3xvCGxVhBfDjwFHYoWuuQMJiX4Jj3M+S
         CoabgqmRQ4Cuw1it3iAdJAK1EGZrsrEt+Yo+oo/geL6RAnQXA0NPm2lfzeJgBFE6FsOm
         +Cqg4/aCLHWai7GbBW0NBXauP9ptTrorCuNT13j7wQFkV/nRYHZPyAuacOAyAtCy7vV+
         siRp01UhJS/L4eSGxBF2qQZQIcpYKm8F7st183VFzeUDBbOd0F0ExIEZsDobbTrDbGyO
         DHlA==
X-Gm-Message-State: APjAAAWJJsaUeV4vWZY2DQ6QxWi9hMcahwLQ0YsXq3OchEOuMYLuGWMI
        8Jk8oA94/hS4WUCjjgfBYKQ=
X-Google-Smtp-Source: APXvYqy9E9YbthMyh/f84RHQz3Zq3bHJdWGugD0F0kOJ1Anu5XKQEHANzKBajC0m2agogW1KYP4lMg==
X-Received: by 2002:a17:902:f301:: with SMTP id gb1mr6663381plb.292.1562345878574;
        Fri, 05 Jul 2019 09:57:58 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 125sm11573309pfg.23.2019.07.05.09.57.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 09:57:58 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/2] drm/panel: simple: Add support for Sharp LD-D5116Z01B panel
Date:   Fri,  5 Jul 2019 09:57:55 -0700
Message-Id: <20190705165755.515-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5a93c4edf1e4..e6f578667324 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2354,6 +2354,29 @@ static const struct panel_desc samsung_ltn140at29_301 = {
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
+};
+
 static const struct drm_display_mode sharp_lq035q7db03_mode = {
 	.clock = 5500,
 	.hdisplay = 240,
@@ -3002,6 +3025,9 @@ static const struct of_device_id platform_of_match[] = {
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

