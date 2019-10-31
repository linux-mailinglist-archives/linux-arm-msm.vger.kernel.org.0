Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8BCEADBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 11:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfJaKoQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 06:44:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38077 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727265AbfJaKoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 06:44:16 -0400
Received: by mail-wr1-f68.google.com with SMTP id v9so5673742wrq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e5McPQ27o3b2k3AkmZCezEVbDePR7P5Jqw8CpztVvKw=;
        b=niL3U2vKEJO7RBQ+ImKWRyuR/qZTGddCZAOuKbd+7egeMdBsdMTBwuQlx7yyB9vdub
         zHP28MUtdZySPVBUMQlltnjMQIaIHfJg7kvSXSh/LEsaWfbtNZVI2PjepUT4rc3hlJgY
         NEYWjuxyhElnGrH4tvf7k9Db9AXf11PmBHswr6zHcpACLKg/z1rusGlUcoxHvySltgM0
         kZDyq64WVEj9dHTt1qs07LKKlWP9rrtApchBjaOj+NefQBFoR1FcoV8lCcl/lCpv4/ER
         GpwwUkDlOMo2tiZpCOoiiCBCusb31YN9BHlYm5EGwIUO+PkftqlDbWIKzTQdGtr7RKLK
         tCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e5McPQ27o3b2k3AkmZCezEVbDePR7P5Jqw8CpztVvKw=;
        b=lVQoeP+LzYIrzEoNXm7ZCxNMN/v9nvPddXVHOW2jgaP38qyPtT36Uh41gf9kK6GDJc
         3Ru5BRD3mjFEe01pZzNjTilfwb5ZeC++Ab9xkimtesQYM24QbPjSAyild0NDmbme2tE4
         DqcxI15ggoTHy/FcJIFRVUDdLSvE0e3B1lNp6Od2svSjrdHzvjyTfQmU1SZRw6EekCYb
         S57J+31bszcfqvwKs+krM/sgDlsbriyOrh460GEYNAQm/NXpx9dj+ufVr60pzEYOb3Dy
         xiETIXaaiZ1C7AjuljzZa8OkelWte/fJXKI6zPmzN6NI2kJvcNUItKBeb+NpFigRUDSW
         g8VA==
X-Gm-Message-State: APjAAAWgKN6G0amtA3hooyImlf8yQfxKCZ5wD0SUMX28gz2tQ4h9ka0X
        Kw+xw4rDg99SV//Qt8x2CbccmmWLxeI=
X-Google-Smtp-Source: APXvYqzNAMGJgqUeP+OuGJei/BXUJvxFdtY3GYAf5ZvYMfZ2dVnow3NFPqGhq06eUZsP4LzuqAGayA==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr5127533wrr.114.1572518654866;
        Thu, 31 Oct 2019 03:44:14 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:44:14 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 6/7] drm/msm/dsi: Add configuration for 8x76
Date:   Thu, 31 Oct 2019 11:44:01 +0100
Message-Id: <20191031104402.31813-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
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
index e74dc8cc904b..86ad3fdf207d 100644
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

