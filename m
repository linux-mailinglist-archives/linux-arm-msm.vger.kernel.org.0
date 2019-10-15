Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4938D72E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbfJOKLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:11:10 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38483 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730158AbfJOKLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:11:09 -0400
Received: by mail-wr1-f68.google.com with SMTP id y18so13650873wrn.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 03:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sejk2YL89CpJ4d32oSXQDgSXo7RkFLMYz8ZMaclYygI=;
        b=B+SgmOVhnzWDeXUA1P8zwLGAoRtUEyIp+HEVXLWOPieJYMxyG1a0Bx70L/QJXyGE9i
         +sETZCc6wUutYHXvZFmjDLgnMlzi5Y68riDfpGJlvnjbQH3BR0k5HiCJF8TNKAT3J/Uc
         MxaCL0nGuYADWtT9RgY4qmxKI++JEqHMUl7HNZpwGh8ROxHAoRO0Xijej2FM5sF7zJg1
         gKIvibt2mIwmsTFKLulHIATbXxF/iKOtd24RYNkJzQ6LxSUqwOzdwS1nBJp7jU61ukbO
         5WMjEIxs3wZtrxAoFebWSmUXfsashy0tUNpOJNfkC40K323my2wModg+yncwM8CE99mu
         2PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sejk2YL89CpJ4d32oSXQDgSXo7RkFLMYz8ZMaclYygI=;
        b=EMcFWBZM76gGOoUelHLdGsFKnJkAjPI4rMK8Gt1SeFpEcUlOFWJVbMrO+LvYubEImH
         H1K1itXTKQROfytP8Wq1sCa58hU5kFHWIEosd1RPM0bqc1zMwcDV/nJEBW2A3tGqa55q
         HG5+OcoZPrGqOkbXWOH8ZAsQChbFOyglXE9QFF+dnyWCcFv1vH34E6mhfWAM1m4H93au
         YbwHC8CPL6DfZCJXcQxVIgeG19FeiAxtdJkmsVebxShwv+aXGCbmHFIx5nikGHObcisb
         UFu4kvElMb1RRNTijn0b0stnUltMZ04puaN95SWzOLs2521kz5uXVZptWJeiRF/EJddo
         Wq4g==
X-Gm-Message-State: APjAAAVLe5nyrKBR5D/K1zNqxwtb3s0nYkYdt34XdsjuHcL6lHsk+u5O
        X7uiRK6WfAweLtbRSD5fP26veHyF9HkdVQ==
X-Google-Smtp-Source: APXvYqzh6ikhkAJIxT1JM2CyTFo8oYKiPl5pxfYWLXs0MtiFztOCEJ9XFRTRIUT8A9Ah3RBu5rJkWg==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr7287863wrm.351.1571134267656;
        Tue, 15 Oct 2019 03:11:07 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:11:07 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/msm/dsi: Add configuration for 8x76
Date:   Tue, 15 Oct 2019 12:10:57 +0200
Message-Id: <20191015101058.37157-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

MSM8976, MSM8976 and APQ variants have DSI version 3:10040002
(DSI 6G V1.4.2), featuring two DSIs.
They need three clocks (mdp_core, iface, bus), one GDSC and
two vregs, VDDA at 1.2V and VDDIO at 1.8V.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index e74dc8cc904b..8364c2dc3f37 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -66,6 +66,26 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.num_dsi = 1,
 };
 
+static const char * const dsi_8976_bus_clk_names[] = {
+	"mdp_core", "iface", "bus",
+};
+
+static const struct msm_dsi_config msm8976_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 3,
+		.regs = {
+			{"gdsc", -1, -1},
+			{"vdda", 100000, 100},	/* 1.2 V */
+			{"vddio", 100000, 100},	/* 1.8 V */
+		},
+	},
+	.bus_clk_names = dsi_8976_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
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
+		&msm8976_dsi_cfg, &msm_dsi_6g_host_ops},
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

