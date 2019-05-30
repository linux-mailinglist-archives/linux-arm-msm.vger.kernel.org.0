Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9ED2FFC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2019 18:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfE3QAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 12:00:42 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44825 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfE3QAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 12:00:42 -0400
Received: by mail-pl1-f196.google.com with SMTP id c5so2736152pll.11;
        Thu, 30 May 2019 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nFuE48SxjxGD42uWCm67in47wWXCmv1XAERqUz8MYR0=;
        b=NnAw8ZFx9RxpVuQ9/KhIc8M8EEHTxQnD5/6j/xJ2aXuv0QpAy6dUtA82UM3hxcgniX
         QUcDqNHDD+zUkApJfHw7H0ZCONI0dToj6nUo9A+2dQZo0J5MKMRy+frfVBDFVbQ7INfV
         dY71wg646IhT5wgSMxvdRRfVMn84bzCLOEL/eRGsD2T6c62qS1nFq/FjQ2oOeNYcPCoR
         Br7euxPfOFiKg0qZgBnPKgqq9S5g+A6JJsXTrmN+wzuDakO6ke7qs5yxSCCcHbyY/GyQ
         SgVK5ZysV9mGwcLT/OPV9WR+6xc6tVE4lCqvIpQ6QQnpTqeUi9DS8TTVnpDOtWL2VSOH
         ED2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nFuE48SxjxGD42uWCm67in47wWXCmv1XAERqUz8MYR0=;
        b=B9V97TEtXD91+hwp1tX3IpQ1eEglC0ed7QFk3iS6ZZEYoqXxqkamW7dpJc6Rh2oXjf
         JwRSDB9myfbzI56m7mLPVb2N6NOdvXufoxcdw65hVDTtWkB0evy476cu6iUzaG7+e84E
         /JVth2FCGqsLlhq3SI6KOUrsJy/Y/uBXaS6GoqX0a9rVJmKvQk3pV6GlDe30Sms9+HK0
         3GP7WjI8a65gl91ATJZV9xZoZPvSsqFrLmsqogMeXeKe5S0sbYQXy4Luvu8MMf0vUZ5p
         d8T9R4Nu8GwOwmNzyKD8ncp7TC6oUoWyzpd5viR/aMr1/5GP1B/7nU7VPM1tvG1rji/L
         E+rA==
X-Gm-Message-State: APjAAAUMPnTIK3toJLfv1jZ1CQByUcI/SfZLNUx5nE7ybUWqkbYfbRGy
        0ZHnMBN9EDExHI4yBk+4hrc=
X-Google-Smtp-Source: APXvYqwixR7q3Osx9ui3862owtX4fZY1r/HG70N3K2IuvZ685K6K5Bn6WbQSGj8CEqm/zetPpXfNjw==
X-Received: by 2002:a17:902:8d94:: with SMTP id v20mr4034604plo.99.1559232041637;
        Thu, 30 May 2019 09:00:41 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id k36sm3278390pjb.14.2019.05.30.09.00.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 09:00:41 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, sibis@codeaurora.org,
        chandanu@codeaurora.org, abhinavk@codeaurora.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 2/4] drm/msm/dsi: Add support for MSM8998 10nm dsi phy
Date:   Thu, 30 May 2019 09:00:39 -0700
Message-Id: <20190530160039.2824-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM8998 dsi phy is 10nm v3.0.0 like SDM845, however there appear to
be minor differences such as the address space location.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 1760483b247e..fda73749fcc0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -507,6 +507,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
 	  .data = &dsi_phy_10nm_cfgs },
+	{ .compatible = "qcom,dsi-phy-10nm-8998",
+	  .data = &dsi_phy_10nm_8998_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index a24ab80994a3..7161beb23b03 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -49,6 +49,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_pre;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 44959e79ce28..b1e7dbc69fa6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -221,3 +221,21 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 	.io_start = { 0xae94400, 0xae96400 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
+	.type = MSM_DSI_PHY_10NM,
+	.src_pll_truthtable = { {false, false}, {true, false} },
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vdds", 36000, 32},
+		},
+	},
+	.ops = {
+		.enable = dsi_10nm_phy_enable,
+		.disable = dsi_10nm_phy_disable,
+		.init = dsi_10nm_phy_init,
+	},
+	.io_start = { 0xc994400, 0xc996400 },
+	.num_dsi_phy = 2,
+};
-- 
2.17.1

