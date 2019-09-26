Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660B5BF071
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 12:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfIZKx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 06:53:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53091 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfIZKx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 06:53:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id r19so2192561wmh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 03:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mt79FACg8KJGTFknyOsP1lh+SJ3rZOsF4QnZInEDNyI=;
        b=Z0Txe1CXgf8CZF9OifOCDKyTXm+6smxlCRq/3A43oGXtHQBazfHKzTGpWGaBae6SMY
         8ch0Ks6vv8mV0UsYhau99w8Ak5MDBD9iLRYe+QitJcjSqSJiymiWO/Uwrmwlwry37XeC
         7/Pd9v2ntYJnWUzb3kixRb+ER8FPn8uppwZFFm5Rce928DKlWJNJT478D6fXjqYWbGeS
         P785kMWl5CYyz+HunvLF+UAtBHj10Hlro3fR8FIX7N1xgbHfP2kH4OcC0wPy7FWwxxbP
         1r6C1JZAPdKDKas3f02/cTTP8o4pruxhL1+gZNNIqlWHZSAyCX6MtVqI7bt0kbosIZER
         l/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mt79FACg8KJGTFknyOsP1lh+SJ3rZOsF4QnZInEDNyI=;
        b=IAsCOBA4fgip5BbyoVqmJXaQtrko8cg+235XLMAC0US3Sbt0lBtAy8gwenv29ayFMC
         I5dQSRJQ56UOdc5AXFEjHF8uMacig6ygZneEDyRAzShP23BFzxh/Qi35vMCqria9Utdy
         nvEA0T4DLRyuwqTw3W7cfITDKbM4mOUFwaEWaUSvbRu07TmaNfiO1aajOudbipy5380a
         UXHT3u9HDcNuMZ/CZ3nhhcyjdy5FfMpZYxGQQuJ3SvPN0uxSF8IIfcf78pXyMjGslesc
         zNS8GHs6KXNBNA9iO4eRQ8jkRRTUk4a4dg08uNKRyGfyZ9VYRq4UvxwqIKYbXy1uwdWW
         PpBw==
X-Gm-Message-State: APjAAAVdbsFUKm3y5PCV+d0Um9KhShtXxBRj65Li6tshRS0TudFVxbF5
        HugtbR1GQvb/RzV5ICVSR1HHiBXPXeE=
X-Google-Smtp-Source: APXvYqynE9Yw48REoXunTGlHGzRSG4TmFdFacSTlp82JMH/IQvefsaQHUUOqxb3p8nNqfbSrE3ELOg==
X-Received: by 2002:a1c:5942:: with SMTP id n63mr2516877wmb.65.1569495204295;
        Thu, 26 Sep 2019 03:53:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 03:53:23 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/msm/dsi: Add configuration for 8x56
Date:   Thu, 26 Sep 2019 12:52:55 +0200
Message-Id: <20190926105256.61412-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926105256.61412-1-kholk11@gmail.com>
References: <20190926105256.61412-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

MSM8956/APQ8056 has DSI version 3:10040002 (DSI 6G V1.4.2), featuring
two DSIs. It needs three clocks (mdp_core, iface, bus), one GDSC and
two vregs, VDDA at 1.2V and VDDIO at 1.8V.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index b7b7c1a9164a..d585ab7acde2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -66,6 +66,26 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.num_dsi = 1,
 };
 
+static const char * const dsi_8956_bus_clk_names[] = {
+	"mdp_core", "iface", "bus",
+};
+
+static const struct msm_dsi_config msm8956_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 3,
+		.regs = {
+			{"gdsc", -1, -1},
+			{"vdda", 100000, 100},	/* 1.2 V */
+			{"vddio", 100000, 100},	/* 1.8 V */
+		},
+	},
+	.bus_clk_names = dsi_8956_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_8956_bus_clk_names),
+	.io_start = { 0x1a94000, 0x1a96000 },
+	.num_dsi = 2,
+};
+
 static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
@@ -197,6 +217,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8916_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_4_1,
 		&msm8996_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_4_2,
+		&msm8956_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_0,
 		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index e2b7a7dfbe49..50a37ceb6a25 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -17,6 +17,7 @@
 #define MSM_DSI_6G_VER_MINOR_V1_3	0x10030000
 #define MSM_DSI_6G_VER_MINOR_V1_3_1	0x10030001
 #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
+#define MSM_DSI_6G_VER_MINOR_V1_4_2	0x10040002
 #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
 
-- 
2.21.0

