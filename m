Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D6858A77A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 09:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240319AbiHEHuP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 03:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240091AbiHEHuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 03:50:13 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409D962F4
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 00:50:09 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id w14so1962451plp.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6shUobG0mUHt8plNau/DLr0D/jTsA6xW6lO9UB121Jo=;
        b=eTDAyR4Z66EIKJwrVRQYZVE8S8yRg6WXiDYK3xJ8PmJg+tYlXz3x3i296zocrOO3Q1
         yrGu0+noGM30Q4z9WRKtmak23ZtzodqksT+BgwDLNSjWS9R6BVqYPPE4GJM5AQ6vWfgu
         AYVGzSsAZIUeeEq5sUFM3SUwDAgUgz46y6DMOhM/Ep7mf9hZf94zCxstL9LiEIueX71Z
         UKaK4mE6qRqMYOTYz+ChXhUd+yvGFHMuxnlUF44MP9f1puM2tfZpJjcQQ19yxNnCUII5
         ywCxXkR8sa/GbH8eoZU5aAzVF8Mlvpzga11Vk1B/1Avrg3NxtzAWz/V2ltdYi05H+FRD
         YWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6shUobG0mUHt8plNau/DLr0D/jTsA6xW6lO9UB121Jo=;
        b=WPBJaSOZPtSLSwDyfX2wyvgyuFcSzoyotpMT4cx/0lKmJtmVFMWCkNbuUVUbIeVb60
         bX9n11QwF8bL92yxigBLWxyoVQQBEQe9pxOLrZuBl70z9t13OjKT6mrMYFhgfEh3Y+m/
         heksB09s/LOa9Va9GHKt+VF7ppCnsiQexuFyaRaarpNVqzBn1C0j6HyQCEBH7u/APfJn
         MbrHRIAxlMHlqGAe7eEyoY4Si3AxWdLB/jeTMa0uAY9Jwb87G+2IFJm9pJxeajLf1Qjo
         ui5XH4eq7jmRXNec9taS4TFlY0y21TWp3+Li2xDofyw/IjNn5DqoyUIP8jHJdsIE2RB1
         r23A==
X-Gm-Message-State: ACgBeo2g8Q5uIM5NXpGNPQGutreGP7vrblwpeRaVggO9kph/w0mPalOP
        LoU1z68j+myY3UL8yAndEiBFug==
X-Google-Smtp-Source: AA6agR6Pl4lW/hjdaRP2Yf//SNfwxK5PBlvxTDa9OT2Q85KFNEDnivuHNQUbYkbT9EgzFCL8FqOGsg==
X-Received: by 2002:a17:902:cf06:b0:16b:cc33:5bce with SMTP id i6-20020a170902cf0600b0016bcc335bcemr5682860plg.152.1659685808881;
        Fri, 05 Aug 2022 00:50:08 -0700 (PDT)
Received: from localhost.localdomain ([45.8.68.134])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709027e8a00b0016ecda71e26sm2309372pla.39.2022.08.05.00.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 00:50:08 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, shawn.guo@linaro.org,
        bryan.odonoghue@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 4/4] clk: qcom: gcc-msm8916: Add power domain data
Date:   Fri,  5 Aug 2022 15:49:35 +0800
Message-Id: <20220805074935.1158098-5-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805074935.1158098-1-jun.nie@linaro.org>
References: <20220805074935.1158098-1-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add power domain performance state and ceiling freq mapping table
so that optimal performance point can be voted by clks within
clock controller. This is not related to the clks consumer devices.

Run this command to check genpd perf state:
cat /sys/kernel/debug/pm_genpd/vddcx/perf_state

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 182 +++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 17e4a5a2a9fd..b42e39688a28 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -13,8 +13,10 @@
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/mutex.h>
 
 #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
 
 #include "common.h"
@@ -25,6 +27,20 @@
 #include "reset.h"
 #include "gdsc.h"
 
+static struct device	*genpd_dev;
+static struct mutex	genpd_lock;
+static struct list_head	genpd_head;
+
+#define POWER_PDOPP(table)					\
+	.power_magic = CLK_POWER_MAGIC,				\
+	.power = &(struct clk_power_data) {			\
+		.genpd_head = &genpd_head,			\
+		.genpd_lock = &genpd_lock,			\
+		.genpdopp_table = table,			\
+		.genpdopp_num = ARRAY_SIZE(table),		\
+		.genpd_dev = &genpd_dev,			\
+	}
+
 enum {
 	P_XO,
 	P_GPLL0,
@@ -394,6 +410,11 @@ static const struct freq_tbl ftbl_gcc_camss_ahb_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table camss_ahb_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 40000000},
+	{RPM_SMD_CORNER_NORMAL, 80000000},
+};
+
 static struct clk_rcg2 camss_ahb_clk_src = {
 	.cmd_rcgr = 0x5a000,
 	.mnd_width = 8,
@@ -405,6 +426,7 @@ static struct clk_rcg2 camss_ahb_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(camss_ahb_genpdopp),
 	},
 };
 
@@ -435,6 +457,11 @@ static const struct freq_tbl ftbl_gcc_camss_csi0_1_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table camss_csi0_1_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 100000000},
+	{RPM_SMD_CORNER_NORMAL, 200000000},
+};
+
 static struct clk_rcg2 csi0_clk_src = {
 	.cmd_rcgr = 0x4e020,
 	.hid_width = 5,
@@ -445,6 +472,7 @@ static struct clk_rcg2 csi0_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(camss_csi0_1_genpdopp),
 	},
 };
 
@@ -458,6 +486,7 @@ static struct clk_rcg2 csi1_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(camss_csi0_1_genpdopp),
 	},
 };
 
@@ -476,6 +505,12 @@ static const struct freq_tbl ftbl_gcc_oxili_gfx3d_clk[] = {
 	{ }
 };
 
+
+static const struct genpdopp_table gfx3d_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 200000000},
+	{RPM_SMD_CORNER_NORMAL, 310000000},
+	{RPM_SMD_CORNER_SUPER_TURBO, 400000000},
+};
 static struct clk_rcg2 gfx3d_clk_src = {
 	.cmd_rcgr = 0x59000,
 	.hid_width = 5,
@@ -486,6 +521,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 		.parent_names = gcc_xo_gpll0a_gpll1_gpll2a,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(gfx3d_genpdopp),
 	},
 };
 
@@ -503,6 +539,12 @@ static const struct freq_tbl ftbl_gcc_camss_vfe0_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table vfe0_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 160000000},
+	{RPM_SMD_CORNER_NORMAL, 320000000},
+	{RPM_SMD_CORNER_SUPER_TURBO, 465000000},
+};
+
 static struct clk_rcg2 vfe0_clk_src = {
 	.cmd_rcgr = 0x58000,
 	.hid_width = 5,
@@ -513,6 +555,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll2,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(vfe0_genpdopp),
 	},
 };
 
@@ -522,6 +565,10 @@ static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_i2c_apps_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table qup1_6_i2c_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 50000000},
+};
+
 static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.cmd_rcgr = 0x0200c,
 	.hid_width = 5,
@@ -532,6 +579,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_i2c_genpdopp),
 	},
 };
 
@@ -550,6 +598,11 @@ static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_spi_apps_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table qup1_6_spi_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 25000000},
+	{RPM_SMD_CORNER_NORMAL, 50000000},
+};
+
 static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.cmd_rcgr = 0x02024,
 	.mnd_width = 8,
@@ -561,6 +614,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_spi_genpdopp),
 	},
 };
 
@@ -574,6 +628,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_i2c_genpdopp),
 	},
 };
 
@@ -588,6 +643,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_spi_genpdopp),
 	},
 };
 
@@ -601,6 +657,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_i2c_genpdopp),
 	},
 };
 
@@ -615,6 +672,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_spi_genpdopp),
 	},
 };
 
@@ -628,6 +686,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_i2c_genpdopp),
 	},
 };
 
@@ -642,6 +701,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_spi_genpdopp),
 	},
 };
 
@@ -655,6 +715,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_i2c_genpdopp),
 	},
 };
 
@@ -669,6 +730,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_spi_genpdopp),
 	},
 };
 
@@ -682,6 +744,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_i2c_genpdopp),
 	},
 };
 
@@ -696,6 +759,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(qup1_6_spi_genpdopp),
 	},
 };
 
@@ -718,6 +782,11 @@ static const struct freq_tbl ftbl_gcc_blsp1_uart1_6_apps_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table uart1_2_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 32000000},
+	{RPM_SMD_CORNER_NORMAL, 64000000},
+};
+
 static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.cmd_rcgr = 0x02044,
 	.mnd_width = 16,
@@ -729,6 +798,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(uart1_2_genpdopp),
 	},
 };
 
@@ -743,6 +813,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(uart1_2_genpdopp),
 	},
 };
 
@@ -751,6 +822,10 @@ static const struct freq_tbl ftbl_gcc_camss_cci_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table cci_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 19200000},
+};
+
 static struct clk_rcg2 cci_clk_src = {
 	.cmd_rcgr = 0x51000,
 	.mnd_width = 8,
@@ -762,6 +837,7 @@ static struct clk_rcg2 cci_clk_src = {
 		.parent_names = gcc_xo_gpll0a,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(cci_genpdopp),
 	},
 };
 
@@ -771,6 +847,11 @@ static const struct freq_tbl ftbl_gcc_camss_gp0_1_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table gp0_1_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 100000000},
+	{RPM_SMD_CORNER_NORMAL, 200000000},
+};
+
 static struct clk_rcg2 camss_gp0_clk_src = {
 	.cmd_rcgr = 0x54000,
 	.mnd_width = 8,
@@ -782,6 +863,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(gp0_1_genpdopp),
 	},
 };
 
@@ -796,6 +878,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(gp0_1_genpdopp),
 	},
 };
 
@@ -806,6 +889,12 @@ static const struct freq_tbl ftbl_gcc_camss_jpeg0_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table jpeg0_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 133330000},
+	{RPM_SMD_CORNER_NORMAL, 266670000},
+	{RPM_SMD_CORNER_SUPER_TURBO, 320000000},
+};
+
 static struct clk_rcg2 jpeg0_clk_src = {
 	.cmd_rcgr = 0x57000,
 	.hid_width = 5,
@@ -816,6 +905,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(jpeg0_genpdopp),
 	},
 };
 
@@ -826,6 +916,11 @@ static const struct freq_tbl ftbl_gcc_camss_mclk0_1_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table mclk0_1_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 24000000},
+	{RPM_SMD_CORNER_NORMAL, 66670000},
+};
+
 static struct clk_rcg2 mclk0_clk_src = {
 	.cmd_rcgr = 0x52000,
 	.mnd_width = 8,
@@ -837,6 +932,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(mclk0_1_genpdopp),
 	},
 };
 
@@ -851,6 +947,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(mclk0_1_genpdopp),
 	},
 };
 
@@ -873,6 +970,11 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	},
 };
 
+static const struct genpdopp_table csi1phytimer_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 100000000},
+	{RPM_SMD_CORNER_NORMAL, 200000000},
+};
+
 static struct clk_rcg2 csi1phytimer_clk_src = {
 	.cmd_rcgr = 0x4f000,
 	.hid_width = 5,
@@ -883,6 +985,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll1a,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(csi1phytimer_genpdopp),
 	},
 };
 
@@ -893,6 +996,12 @@ static const struct freq_tbl ftbl_gcc_camss_cpp_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table cpp_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 160000000},
+	{RPM_SMD_CORNER_NORMAL, 320000000},
+	{RPM_SMD_CORNER_SUPER_TURBO, 465000000},
+};
+
 static struct clk_rcg2 cpp_clk_src = {
 	.cmd_rcgr = 0x58018,
 	.hid_width = 5,
@@ -903,6 +1012,7 @@ static struct clk_rcg2 cpp_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll2,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(cpp_genpdopp),
 	},
 };
 
@@ -914,6 +1024,11 @@ static const struct freq_tbl ftbl_gcc_crypto_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table crypto_genpdopp[] = {
+		{RPM_SMD_CORNER_SVS_SOC, 80000000},
+		{RPM_SMD_CORNER_NORMAL, 160000000},
+};
+
 static struct clk_rcg2 crypto_clk_src = {
 	.cmd_rcgr = 0x16004,
 	.hid_width = 5,
@@ -924,6 +1039,7 @@ static struct clk_rcg2 crypto_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(crypto_genpdopp),
 	},
 };
 
@@ -932,6 +1048,11 @@ static const struct freq_tbl ftbl_gcc_gp1_3_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table gp1_3_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 100000000},
+	{RPM_SMD_CORNER_NORMAL, 200000000},
+};
+
 static struct clk_rcg2 gp1_clk_src = {
 	.cmd_rcgr = 0x08004,
 	.mnd_width = 8,
@@ -943,6 +1064,7 @@ static struct clk_rcg2 gp1_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(gp1_3_genpdopp),
 	},
 };
 
@@ -957,6 +1079,7 @@ static struct clk_rcg2 gp2_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(gp1_3_genpdopp),
 	},
 };
 
@@ -971,9 +1094,15 @@ static struct clk_rcg2 gp3_clk_src = {
 		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(gp1_3_genpdopp),
 	},
 };
 
+static const struct genpdopp_table byte0_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 94400000},
+	{RPM_SMD_CORNER_NORMAL, 188500000},
+};
+
 static struct clk_rcg2 byte0_clk_src = {
 	.cmd_rcgr = 0x4d044,
 	.hid_width = 5,
@@ -984,6 +1113,7 @@ static struct clk_rcg2 byte0_clk_src = {
 		.num_parents = 3,
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
+		POWER_PDOPP(byte0_genpdopp),
 	},
 };
 
@@ -992,6 +1122,10 @@ static const struct freq_tbl ftbl_gcc_mdss_esc0_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table esc0_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 19200000},
+};
+
 static struct clk_rcg2 esc0_clk_src = {
 	.cmd_rcgr = 0x4d05c,
 	.hid_width = 5,
@@ -1002,6 +1136,7 @@ static struct clk_rcg2 esc0_clk_src = {
 		.parent_names = gcc_xo_dsibyte,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(esc0_genpdopp),
 	},
 };
 
@@ -1017,6 +1152,12 @@ static const struct freq_tbl ftbl_gcc_mdss_mdp_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table mdp_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 160000000},
+	{RPM_SMD_CORNER_NORMAL, 266670000},
+	{RPM_SMD_CORNER_SUPER_TURBO, 320000000},
+};
+
 static struct clk_rcg2 mdp_clk_src = {
 	.cmd_rcgr = 0x4d014,
 	.hid_width = 5,
@@ -1027,9 +1168,15 @@ static struct clk_rcg2 mdp_clk_src = {
 		.parent_names = gcc_xo_gpll0_dsiphy,
 		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(mdp_genpdopp),
 	},
 };
 
+static const struct genpdopp_table pclk0_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 150000000},
+	{RPM_SMD_CORNER_NORMAL, 250000000},
+};
+
 static struct clk_rcg2 pclk0_clk_src = {
 	.cmd_rcgr = 0x4d000,
 	.mnd_width = 8,
@@ -1041,6 +1188,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 		.num_parents = 3,
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
+		POWER_PDOPP(pclk0_genpdopp),
 	},
 };
 
@@ -1049,6 +1197,10 @@ static const struct freq_tbl ftbl_gcc_mdss_vsync_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table vsync_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 19200000},
+};
+
 static struct clk_rcg2 vsync_clk_src = {
 	.cmd_rcgr = 0x4d02c,
 	.hid_width = 5,
@@ -1059,6 +1211,7 @@ static struct clk_rcg2 vsync_clk_src = {
 		.parent_names = gcc_xo_gpll0a,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(vsync_genpdopp),
 	},
 };
 
@@ -1067,6 +1220,10 @@ static const struct freq_tbl ftbl_gcc_pdm2_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table pdm2_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 64000000},
+};
+
 static struct clk_rcg2 pdm2_clk_src = {
 	.cmd_rcgr = 0x44010,
 	.hid_width = 5,
@@ -1077,6 +1234,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(pdm2_genpdopp),
 	},
 };
 
@@ -1091,6 +1249,11 @@ static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table sdcc1_2_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 50000000},
+	{RPM_SMD_CORNER_NORMAL, 200000000},
+};
+
 static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.cmd_rcgr = 0x42004,
 	.mnd_width = 8,
@@ -1102,6 +1265,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
+		POWER_PDOPP(sdcc1_2_genpdopp),
 	},
 };
 
@@ -1127,6 +1291,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_floor_ops,
+		POWER_PDOPP(sdcc1_2_genpdopp),
 	},
 };
 
@@ -1179,6 +1344,11 @@ static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table usb_hs_system_genpdopp[] = {
+	{RPM_SMD_CORNER_SVS_SOC, 57140000},
+	{RPM_SMD_CORNER_NORMAL, 80000000},
+};
+
 static struct clk_rcg2 usb_hs_system_clk_src = {
 	.cmd_rcgr = 0x41010,
 	.hid_width = 5,
@@ -1189,6 +1359,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(usb_hs_system_genpdopp),
 	},
 };
 
@@ -1506,6 +1677,12 @@ static const struct freq_tbl ftbl_gcc_venus0_vcodec0_clk[] = {
 	{ }
 };
 
+static const struct genpdopp_table vcodec0_genpdopp[] = {
+		{RPM_SMD_CORNER_SVS_SOC, 100000000},
+		{RPM_SMD_CORNER_NORMAL, 160000000},
+		{RPM_SMD_CORNER_SUPER_TURBO, 228570000},
+};
+
 static struct clk_rcg2 vcodec0_clk_src = {
 	.cmd_rcgr = 0x4C000,
 	.mnd_width = 8,
@@ -1517,6 +1694,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 		.parent_names = gcc_xo_gpll0,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
+		POWER_PDOPP(vcodec0_genpdopp),
 	},
 };
 
@@ -3389,6 +3567,10 @@ static int gcc_msm8916_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	genpd_dev = dev;
+	mutex_init(&genpd_lock);
+	INIT_LIST_HEAD(&genpd_head);
+
 	return qcom_cc_probe(pdev, &gcc_msm8916_desc);
 }
 
-- 
2.25.1

