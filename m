Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D87212FFD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2019 18:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfE3QBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 12:01:02 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34461 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfE3QBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 12:01:02 -0400
Received: by mail-pf1-f194.google.com with SMTP id c14so1830693pfi.1;
        Thu, 30 May 2019 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/AvVj2fkffyKJVVEwFKFUqPeBodRCzKUgwbdD9q/Jf8=;
        b=DwfznHmbKa3vatRv5uW8/u7C8ubKh0JIok9NCDOaOEufKHJNhUScZiMzcR18GcQhc/
         e20r5jT7DNivThJH0fk7HthJ0ozkmkokKsbd/1+9NrWO9Lho9Ev/KBU5johMaDjgQOad
         W3CJFJm/R4NXw3zi1d4AwJ+m1kM+ZX6AWgLc6tCrKYaIVOzt1oAYiFakIk8c8qf/Nrx4
         wEfQhMTtId1QLDVIb09CUYJ4mqiOisNjXRcARyb/n0ZU4QhSbhc+wXIi1bcecnsNj7f8
         Z2dLND+mHm8heNcgiXOJ26jFOsrIWUzqy5N5MeduadtaB2Z+xqZ5AQkxfVXdS6D7jXWn
         62nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/AvVj2fkffyKJVVEwFKFUqPeBodRCzKUgwbdD9q/Jf8=;
        b=rywH8s2k2hZLONeICa6ob/pmbuchj88bt4TZ+VhK3+XEiGR2eaazPbeJJ0GB8Hx6Uq
         ESj7T+6QLAxla/DyHCpl685uwURBiKAEvQt7WGeJx7icM9VJ4nKO/L/YBPv+4tYmiUys
         xW4xK0zzxaJFruZg+EigIhXLLRJV3PpeZzXpcec/czn2rJHrY3HMePYFAzpdfgezX4xo
         VXAVYlxjIQYCtg4g2LThiLjoq+dbIHWa6tLBeLCkB2oEp0ZOkChOcP9okufpPpmPQdol
         zU631sTItxhT71otQRQUeqF0/0vx2nVLxgRaFg0WDdaCfKFS+KNqK03aKVMqMcz7rsZ6
         Rf2w==
X-Gm-Message-State: APjAAAVYR4QNfZ7RS1WyI7PY0qHx4FCmimE9LEEdJkrSlMbnG7s1m3rT
        4i60JKWy/r+CqZrSdLtqmxg=
X-Google-Smtp-Source: APXvYqxqMDv7lJX1pCMepVwjOk3m6ieg82K9QE0L8UaAoy7Qg4IpS/aWoSiApAu6sFckPzAk8O/8Eg==
X-Received: by 2002:a63:1642:: with SMTP id 2mr4282237pgw.230.1559232061116;
        Thu, 30 May 2019 09:01:01 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d20sm3135230pjs.24.2019.05.30.09.00.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 09:01:00 -0700 (PDT)
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
Subject: [PATCH 4/4] drm/msm/dsi: Add support for MSM8998 DSI controller
Date:   Thu, 30 May 2019 09:00:59 -0700
Message-Id: <20190530160059.2929-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI controller on the MSM8998 SoC is a 6G v2.0.0 controller which is
very similar to the v2.0.1 of SDM845.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index dcdfb1bb54f9..7dd17b59c69d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -118,6 +118,25 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.num_dsi = 2,
 };
 
+static const char * const dsi_msm8998_bus_clk_names[] = {
+	"iface", "bus", "core",
+};
+
+static const struct msm_dsi_config msm8998_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 2,
+		.regs = {
+			{"vdd", 367000, 16 },	/* 0.9 V */
+			{"vdda", 62800, 2 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_msm8998_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
+	.io_start = { 0xc994000, 0xc996000 },
+	.num_dsi = 2,
+};
+
 static const char * const dsi_sdm845_bus_clk_names[] = {
 	"iface", "bus",
 };
@@ -186,6 +205,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8916_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_4_1,
 		&msm8996_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_0,
+		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 16c507911110..4f63b57b19dc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -25,6 +25,7 @@
 #define MSM_DSI_6G_VER_MINOR_V1_3	0x10030000
 #define MSM_DSI_6G_VER_MINOR_V1_3_1	0x10030001
 #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
+#define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
-- 
2.17.1

