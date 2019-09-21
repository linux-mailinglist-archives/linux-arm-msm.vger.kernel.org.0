Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC7AB9D46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 12:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407438AbfIUKEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 06:04:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41599 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407436AbfIUKEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 06:04:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so9097036wrw.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mt79FACg8KJGTFknyOsP1lh+SJ3rZOsF4QnZInEDNyI=;
        b=NNthm7s5rLVws2nbXqiCw7r03SqZToStVPFhw9nmayDOZje2KgAJi+HLDOSpvcLjEW
         XrmOixMVxuhFlsuwfzZUSOpssEs6R0Cq+s5gFmXGmSnZV6mmL8qDugTl6IMnylhcpUzF
         iZS4HpUDfHmNmbk6dsbAkhJI7K9zMskrIXOhz+oz0ODDWws+42Pt2mDwr+8QZfTEPWaX
         5Wz0gNv0VeSU6jzz97A/rGz5iRgTLjnJjbbf/rH3KISU+0g225BrEcbxWtF2oWFpsg0J
         NZ5MNDGsnHwi9Vis91QznLMNL7LhIIaiOX9H0iH1RZzSVdgCae4lkwsIeIAXgJ5rCMYX
         4vNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mt79FACg8KJGTFknyOsP1lh+SJ3rZOsF4QnZInEDNyI=;
        b=O2xEKg4mcw4wUtpeMUheZvq2sdbVkJyaTder2FPNP/jjhWAdbVGuCFbj/dC8CeHnmu
         cxl7uqggIVj93K3q0pIobRFjMz4cZLuaoMCZ2c6z1MGDpeG2pLfmn7cqwUHraiOaWLLU
         7qLiGxXvl1SqD2dqcHd5dPHcngUz2GzG0MwNkj1DTScP+A+Bz+JgLEK8GCjPd46KAz3x
         a0d7Ru6HszSD71q9cr/Ip4vIpeN9HHudIapf5bjVdCJihQ4YPWrffoHosx35LJ0te/cs
         FvCF//aykJXFoCTFdICJORGK+ASDfzFnFh6awiBqEr4VjIE6bNvMZL3jfZIJDiMWXIRs
         IxpA==
X-Gm-Message-State: APjAAAXnZf2lGjwNfYy40WMbIJlFXzWBu6KinI+FzJmMu/cFfp3AJFNN
        yYORu6TS3ixk6zXePDDNx48WppBpiS8=
X-Google-Smtp-Source: APXvYqxAeDiptPxrzYWiT21P8fxvfPilljYUsrDHceQKyfiXE2oOl39mGDu8rncMJUQAOGEBk3+7Tw==
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr10323426wrn.234.1569060287302;
        Sat, 21 Sep 2019 03:04:47 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:04:46 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 4/5] drm/msm/dsi: Add configuration for 8x56
Date:   Sat, 21 Sep 2019 12:04:38 +0200
Message-Id: <20190921100439.64402-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921100439.64402-1-kholk11@gmail.com>
References: <20190921100439.64402-1-kholk11@gmail.com>
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

