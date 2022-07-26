Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5A958189D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 19:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbiGZRjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 13:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239545AbiGZRjB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 13:39:01 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F76E2B279
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:38:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id p6-20020a17090a680600b001f2267a1c84so16254250pjj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 10:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0kI1Jv+w1hmGLF3xtO2oXTT7wqxRY+foeGCCnL9AjA=;
        b=T8/qC+6srgVHTfRFG2w3KUAoBN6VLIzzpZbAeztmNvkmsXTnA5PKwRmipASZpYED0z
         I87WgNvf/uUqjJuLyM+Mi6E+70SIk7irxOx/e5gblOaorXfDfroYuho817EeBocZzerM
         FWyQb3qO1T4WRRzV5vizZfUXe6VKu9rNnZcv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0kI1Jv+w1hmGLF3xtO2oXTT7wqxRY+foeGCCnL9AjA=;
        b=g4MXlDCUnYiQZ8g56iP47MvOpj/JeQDk044/e+GNKj24jMFtQNDzOqRhSpyOrhl3mO
         JUoy+eLaI743gu1WkW6xVv78FJR56sjO1Qq8xxPShXEgXptivo7e9ov73snte3HvdB+B
         MxwymJUlsMMVcnZWA2DGTr5XbY6mhKUGCwf6i5z0C+vTONY9vKTJPQt7rQDOQQ8LqSBA
         bbin7dz+ilCrgWUMsSPA3YJuXa3w5LMr1hwsxtGanQwOABICqWuWUnLIvnyGAKcQe7mp
         ybHgpVo19zqAeg5aK0Yjsetxg9lVyeRvLkn6qyf00GaEr+oC3dGz42+E+kz5Uz5NRbvg
         at1Q==
X-Gm-Message-State: AJIora/EMMqimieCoaixIaShOMTSYbB2DbyA16OiqvrX127K1Ajk+4OL
        +hZlOkhD9WPCfvXrn9pmqhobXQ==
X-Google-Smtp-Source: AGRyM1ufD662+ThVauOZCyZ7KHWQfXWbOlLf/kR+URMihVCr62EbCNVmkYFQ0+JEW5z1xTuqhR6foA==
X-Received: by 2002:a17:90b:164d:b0:1f0:31c1:9e88 with SMTP id il13-20020a17090b164d00b001f031c19e88mr304501pjb.206.1658857134609;
        Tue, 26 Jul 2022 10:38:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:8693:e9aa:75c0:5134])
        by smtp.gmail.com with ESMTPSA id ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:38:53 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()
Date:   Tue, 26 Jul 2022 10:38:24 -0700
Message-Id: <20220726103631.v2.7.I55a9e65cb1c22221316629e98768ff473f47a067@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the patch ("regulator: core: Allow drivers to define their init
data as const") we no longer need to do copying of regulator bulk data
from initdata to something dynamic. Let's take advantage of that.

In addition to saving some code, this also moves us to using
ARRAY_SIZE() to specify how many regulators we have which is less
error prone.

NOTE: Though I haven't done the math, this is likely an overall
savings in terms of "static const" data. We previously always
allocated space for 8 supplies. Each of these supplies took up 36
bytes of data (32 for name, 4 for an int).

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Take advantage of devm_regulator_bulk_get_const") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 172 ++++++++++++++---------------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c |  27 +----
 3 files changed, 94 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 901d6fd53800..7e97c239ed48 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -9,16 +9,16 @@ static const char * const dsi_v2_bus_clk_names[] = {
 	"core_mmss", "iface", "bus",
 };
 
+static const struct regulator_bulk_data apq8064_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
+	{ .supply = "avdd", .init_load_uA = 10000 },	/* 3.0 V */
+	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
+};
+
 static const struct msm_dsi_config apq8064_dsi_cfg = {
 	.io_offset = 0,
-	.reg_cfg = {
-		.num = 3,
-		.regs = {
-			{"vdda", 100000},	/* 1.2 V */
-			{"avdd", 10000},	/* 3.0 V */
-			{"vddio", 100000},	/* 1.8 V */
-		},
-	},
+	.regulator_data = apq8064_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(apq8064_dsi_regulators),
 	.bus_clk_names = dsi_v2_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
 	.io_start = { 0x4700000, 0x5800000 },
@@ -29,16 +29,16 @@ static const char * const dsi_6g_bus_clk_names[] = {
 	"mdp_core", "iface", "bus", "core_mmss",
 };
 
+static const struct regulator_bulk_data msm8974_apq8084_regulators[] = {
+	{ .supply = "vdd", .init_load_uA = 150000 },	/* 3.0 V */
+	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
+	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
+};
+
 static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 3,
-		.regs = {
-			{"vdd", 150000},	/* 3.0 V */
-			{"vdda", 100000},	/* 1.2 V */
-			{"vddio", 100000},	/* 1.8 V */
-		},
-	},
+	.regulator_data = msm8974_apq8084_regulators,
+	.num_regulators = ARRAY_SIZE(msm8974_apq8084_regulators),
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
 	.io_start = { 0xfd922800, 0xfd922b00 },
@@ -49,15 +49,15 @@ static const char * const dsi_8916_bus_clk_names[] = {
 	"mdp_core", "iface", "bus",
 };
 
+static const struct regulator_bulk_data msm8916_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
+	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
+};
+
 static const struct msm_dsi_config msm8916_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 2,
-		.regs = {
-			{"vdda", 100000},	/* 1.2 V */
-			{"vddio", 100000},	/* 1.8 V */
-		},
-	},
+	.regulator_data = msm8916_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
 	.bus_clk_names = dsi_8916_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
 	.io_start = { 0x1a98000 },
@@ -68,34 +68,34 @@ static const char * const dsi_8976_bus_clk_names[] = {
 	"mdp_core", "iface", "bus",
 };
 
+static const struct regulator_bulk_data msm8976_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
+	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
+};
+
 static const struct msm_dsi_config msm8976_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 2,
-		.regs = {
-			{"vdda", 100000},	/* 1.2 V */
-			{"vddio", 100000},	/* 1.8 V */
-		},
-	},
+	.regulator_data = msm8976_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
 	.bus_clk_names = dsi_8976_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
 	.io_start = { 0x1a94000, 0x1a96000 },
 	.num_dsi = 2,
 };
 
+static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.25 V */
+	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
+	{ .supply = "vcca", .init_load_uA = 10000 },	/* 1.0 V */
+	{ .supply = "vdd", .init_load_uA = 100000 },	/* 1.8 V */
+	{ .supply = "lab_reg", .init_load_uA = -1 },
+	{ .supply = "ibb_reg", .init_load_uA = -1 },
+};
+
 static const struct msm_dsi_config msm8994_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 6,
-		.regs = {
-			{"vdda", 100000},	/* 1.25 V */
-			{"vddio", 100000},	/* 1.8 V */
-			{"vcca", 10000},	/* 1.0 V */
-			{"vdd", 100000},	/* 1.8 V */
-			{"lab_reg", -1},
-			{"ibb_reg", -1},
-		},
-	},
+	.regulator_data = msm8994_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(msm8994_dsi_regulators),
 	.bus_clk_names = dsi_6g_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
 	.io_start = { 0xfd998000, 0xfd9a0000 },
@@ -106,16 +106,16 @@ static const char * const dsi_8996_bus_clk_names[] = {
 	"mdp_core", "iface", "bus", "core_mmss",
 };
 
+static const struct regulator_bulk_data msm8996_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 18160 },	/* 1.25 V */
+	{ .supply = "vcca", .init_load_uA = 17000 },	/* 0.925 V */
+	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
+};
+
 static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 3,
-		.regs = {
-			{"vdda", 18160},	/* 1.25 V */
-			{"vcca", 17000},	/* 0.925 V */
-			{"vddio", 100000},/* 1.8 V */
-		},
-	},
+	.regulator_data = msm8996_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
 	.bus_clk_names = dsi_8996_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
 	.io_start = { 0x994000, 0x996000 },
@@ -126,15 +126,15 @@ static const char * const dsi_msm8998_bus_clk_names[] = {
 	"iface", "bus", "core",
 };
 
+static const struct regulator_bulk_data msm8998_dsi_regulators[] = {
+	{ .supply = "vdd", .init_load_uA = 367000 },	/* 0.9 V */
+	{ .supply = "vdda", .init_load_uA = 62800 },	/* 1.2 V */
+};
+
 static const struct msm_dsi_config msm8998_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 2,
-		.regs = {
-			{"vdd", 367000},	/* 0.9 V */
-			{"vdda", 62800},	/* 1.2 V */
-		},
-	},
+	.regulator_data = msm8998_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(msm8998_dsi_regulators),
 	.bus_clk_names = dsi_msm8998_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
 	.io_start = { 0xc994000, 0xc996000 },
@@ -145,14 +145,14 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
 	"iface", "bus", "core", "core_mmss",
 };
 
+static const struct regulator_bulk_data sdm660_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 12560 },	/* 1.2 V */
+};
+
 static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 1,
-		.regs = {
-			{"vdda", 12560},	/* 1.2 V */
-		},
-	},
+	.regulator_data = sdm660_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sdm660_dsi_regulators),
 	.bus_clk_names = dsi_sdm660_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
 	.io_start = { 0xc994000, 0xc996000 },
@@ -167,28 +167,28 @@ static const char * const dsi_sc7180_bus_clk_names[] = {
 	"iface", "bus",
 };
 
+static const struct regulator_bulk_data sdm845_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
+};
+
 static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 1,
-		.regs = {
-			{"vdda", 21800},	/* 1.2 V */
-		},
-	},
+	.regulator_data = sdm845_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
 	.bus_clk_names = dsi_sdm845_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
 	.io_start = { 0xae94000, 0xae96000 },
 	.num_dsi = 2,
 };
 
+static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
+};
+
 static const struct msm_dsi_config sc7180_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 1,
-		.regs = {
-			{"vdda", 21800},	/* 1.2 V */
-		},
-	},
+	.regulator_data = sc7180_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
 	.bus_clk_names = dsi_sc7180_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
 	.io_start = { 0xae94000 },
@@ -199,14 +199,14 @@ static const char * const dsi_sc7280_bus_clk_names[] = {
 	"iface", "bus",
 };
 
+static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
+};
+
 static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 1,
-		.regs = {
-			{"vdda", 8350},	/* 1.2 V */
-		},
-	},
+	.regulator_data = sc7280_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
 	.io_start = { 0xae94000 },
@@ -217,14 +217,14 @@ static const char * const dsi_qcm2290_bus_clk_names[] = {
 	"iface", "bus",
 };
 
+static const struct regulator_bulk_data qcm2290_dsi_cfg_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
+};
+
 static const struct msm_dsi_config qcm2290_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
-	.reg_cfg = {
-		.num = 1,
-		.regs = {
-			{"vdda", 21800},	/* 1.2 V */
-		},
-	},
+	.regulator_data = qcm2290_dsi_cfg_regulators,
+	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
 	.bus_clk_names = dsi_qcm2290_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
 	.io_start = { 0x5e94000 },
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index fe54a999968b..8f04e685a74e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -32,7 +32,8 @@
 
 struct msm_dsi_config {
 	u32 io_offset;
-	struct dsi_reg_config reg_cfg;
+	const struct regulator_bulk_data *regulator_data;
+	int num_regulators;
 	const char * const *bus_clk_names;
 	const int num_bus_clks;
 	const resource_size_t io_start[DSI_MAX];
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index dec7a94cf819..e159f2006158 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -106,7 +106,7 @@ struct msm_dsi_host {
 
 	void __iomem *ctrl_base;
 	phys_addr_t ctrl_size;
-	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
+	struct regulator_bulk_data *supplies;
 
 	int num_bus_clks;
 	struct clk_bulk_data bus_clks[DSI_BUS_CLK_MAX];
@@ -259,7 +259,7 @@ static inline struct msm_dsi_host *to_msm_dsi_host(struct mipi_dsi_host *host)
 static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
 {
 	struct regulator_bulk_data *s = msm_host->supplies;
-	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
+	int num = msm_host->cfg_hnd->cfg->num_regulators;
 
 	regulator_bulk_disable(num, s);
 }
@@ -267,31 +267,16 @@ static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
 static int dsi_host_regulator_enable(struct msm_dsi_host *msm_host)
 {
 	struct regulator_bulk_data *s = msm_host->supplies;
-	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
+	int num = msm_host->cfg_hnd->cfg->num_regulators;
 
 	return regulator_bulk_enable(num, s);
 }
 
 static int dsi_regulator_init(struct msm_dsi_host *msm_host)
 {
-	struct regulator_bulk_data *s = msm_host->supplies;
-	const struct dsi_reg_entry *regs = msm_host->cfg_hnd->cfg->reg_cfg.regs;
-	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
-	int i, ret;
-
-	for (i = 0; i < num; i++) {
-		s[i].supply = regs[i].name;
-		s[i].init_load_uA = regs[i].enable_load;
-	}
-
-	ret = devm_regulator_bulk_get(&msm_host->pdev->dev, num, s);
-	if (ret < 0) {
-		pr_err("%s: failed to init regulator, ret=%d\n",
-						__func__, ret);
-		return ret;
-	}
-
-	return 0;
+	return devm_regulator_bulk_get_const(
+		&msm_host->pdev->dev, msm_host->cfg_hnd->cfg->num_regulators,
+		msm_host->cfg_hnd->cfg->regulator_data, &msm_host->supplies);
 }
 
 int dsi_clk_init_v2(struct msm_dsi_host *msm_host)
-- 
2.37.1.359.gd136c6c3e2-goog

