Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B33F72B781
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 07:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbjFLFjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 01:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbjFLFjd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 01:39:33 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A47E73
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 22:39:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f624daccd1so4261748e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686548370; x=1689140370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TlZyzRwY/o/e9xVkO7KMsj7n4flvbaCYZ7tv2gefqg=;
        b=H21XnBOKHaVHqsY8z2ryRf0/MFJ1LDTIf0Yrmruye0wvVcQPM8SkLhqbAiChKWF6e0
         9KcH94jX0zlZXEQTP/uccEF2rvDg2Q7c7jZ1wHJqLE01bsQUFw54t9XjAKajGWjiF9G1
         r3rK8D96eU+Y04ZOqiOv/66moueROEutCgdV7mlCalvj/kkbjt26yMdJVyf/kzoy/mRX
         yHh7uXTmjTa8ds7NMLhW4FGyfnWhlWa6r8SbAB0yWPBP2ZNDu3h3PQn2ssvqMNbr3/i0
         4qk+zFz/WbnOW46g73o00+7gTrx01lLtcCngPSKg3aQc/CIBqstN0uiO1Lfj2GkIfPql
         5NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548370; x=1689140370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TlZyzRwY/o/e9xVkO7KMsj7n4flvbaCYZ7tv2gefqg=;
        b=b72ENy4oU0wPtshh1Eh1waUppxNy4kbfSBeh3ve+OqwswwkWLyb8I5ZG510Mhn7O75
         0BkAl0c2PBlv+HpY9Ei0EfkwZYVsN8tAMn4PUuPqSzJazUoC83gYr6I/l7kGqAFTUoHH
         viOWF1R1nrXshrWmfcAXal6Ln5oFOvsjcsB854QO56xIL6QX8FrKMsFwyQF1WgPJWyYZ
         xJhyCtH9A3eNcd1CX6RWaXiVIz1fmqXD38vI0lMHHg4MgEoLGyppA9nW6Vm3jovMOdU4
         01fZACr5RTIexv/RWan/k1E7oVCOI1qrtPxRxpRSn6zgO7OD4/B7hLxY3T385e3Ee2w8
         lkKA==
X-Gm-Message-State: AC+VfDzqSlHdw7qrTzkPCLK33C3U1A+B+5JigsEII/fw16GmWHltNsY/
        epvORYfXEHwT+kvYWiLxZvqbvQ==
X-Google-Smtp-Source: ACHHUZ6Iw2ZktZqzXHMcaz1jO66ChxfM2TSNrLUjN2r41QjXZTdMjJY2VsagodYpSArFVnnc3EoNzw==
X-Received: by 2002:a05:6512:32ad:b0:4f4:b3a6:4140 with SMTP id q13-20020a05651232ad00b004f4b3a64140mr2202507lfe.42.1686548370162;
        Sun, 11 Jun 2023 22:39:30 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b004f38260f196sm1324125lfe.218.2023.06.11.22.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 06/18] clk: qcom: krait-cc: export L2 clock as an interconnect
Date:   Mon, 12 Jun 2023 08:39:10 +0300
Message-Id: <20230612053922.3284394-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While scaling the CPU frequency, L2 frequency should also be scaled
following the CPU frequency. To simplify such scaling, export the L2
clock as an interconnect, to facilitate aggregating CPU votes and
selecting the maximum vote.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/Kconfig    |  1 +
 drivers/clk/qcom/krait-cc.c | 75 +++++++++++++++++++++++++++++--------
 2 files changed, 60 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 97f23f978343..3d56263ce494 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1065,6 +1065,7 @@ config KRAITCC
 	tristate "Krait Clock Controller"
 	depends on ARM
 	select KRAIT_CLOCKS
+	select INTERCONNECT_CLK if INTERCONNECT
 	help
 	  Support for the Krait CPU clocks on Qualcomm devices.
 	  Say Y if you want to support CPU frequency scaling.
diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
index 2ce38024dc0d..f16321fc6dd7 100644
--- a/drivers/clk/qcom/krait-cc.c
+++ b/drivers/clk/qcom/krait-cc.c
@@ -11,19 +11,13 @@
 #include <linux/of_device.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/interconnect-clk.h>
+#include <linux/interconnect-provider.h>
 #include <linux/slab.h>
 
-#include "clk-krait.h"
-
-enum {
-	cpu0_mux = 0,
-	cpu1_mux,
-	cpu2_mux,
-	cpu3_mux,
-	l2_mux,
+#include <dt-bindings/clock/qcom,krait-cc.h>
 
-	clks_max,
-};
+#include "clk-krait.h"
 
 static unsigned int sec_mux_map[] = {
 	2,
@@ -365,11 +359,54 @@ static int krait_clk_reinit(struct clk_hw *hw, int cpu)
 	return 0;
 }
 
+#ifdef CONFIG_INTERCONNECT
+
+/* Random ID that doesn't clash with main qnoc and OSM */
+#define L2_MASTER_NODE 2000
+
+static int krait_cc_icc_register(struct platform_device *pdev, struct clk_hw *l2_hw)
+{
+	struct device *dev = &pdev->dev;
+	struct clk *clk = devm_clk_hw_get_clk(dev, l2_hw, "l2");
+	const struct icc_clk_data data[] = {
+		{ .clk = clk, .name = "l2", },
+	};
+	struct icc_provider *provider;
+
+	provider = icc_clk_register(dev, L2_MASTER_NODE, ARRAY_SIZE(data), data);
+	if (IS_ERR(provider))
+		return PTR_ERR(provider);
+
+	platform_set_drvdata(pdev, provider);
+
+	return 0;
+}
+
+static int krait_cc_icc_remove(struct platform_device *pdev)
+{
+	struct icc_provider *provider = platform_get_drvdata(pdev);
+
+	icc_clk_unregister(provider);
+
+	return 0;
+}
+#define krait_cc_icc_sync_state icc_sync_state
+#else
+static int krait_cc_icc_register(struct platform_device *pdev,  struct clk_hw *l2_hw)
+{
+	dev_warn(&pdev->dev, "CONFIG_INTERCONNECT is disabled, L2 clock is fixed\n");
+
+	return 0;
+}
+#define krait_cc_icc_remove(pdev) (0)
+#define krait_cc_icc_sync_state NULL
+#endif
+
 static int krait_cc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *id;
-	int cpu;
+	int cpu, ret;
 	struct clk_hw *clk;
 	struct clk_hw_onecell_data *clks;
 
@@ -389,11 +426,11 @@ static int krait_cc_probe(struct platform_device *pdev)
 	}
 
 	/* Krait configurations have at most 4 CPUs and one L2 */
-	clks = devm_kzalloc(dev, struct_size(clks, hws, clks_max), GFP_KERNEL);
+	clks = devm_kzalloc(dev, struct_size(clks, hws, KRAIT_NUM_CLOCKS), GFP_KERNEL);
 	if (!clks)
 		return -ENOMEM;
 
-	clks->num = clks_max;
+	clks->num = KRAIT_NUM_CLOCKS;
 
 	for_each_possible_cpu(cpu) {
 		clk = krait_add_clks(dev, cpu, id->data);
@@ -405,7 +442,7 @@ static int krait_cc_probe(struct platform_device *pdev)
 	clk = krait_add_clks(dev, -1, id->data);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
-	clks->hws[l2_mux] = clk;
+	clks->hws[KRAIT_L2] = clk;
 
 	/*
 	 * Force reinit of HFPLLs and muxes to overwrite any potential
@@ -418,18 +455,24 @@ static int krait_cc_probe(struct platform_device *pdev)
 	 * two different rates to force a HFPLL reinit under all
 	 * circumstances.
 	 */
-	krait_clk_reinit(clks->hws[l2_mux], -1);
+	krait_clk_reinit(clks->hws[KRAIT_L2], -1);
 	for_each_possible_cpu(cpu)
 		krait_clk_reinit(clks->hws[cpu], cpu);
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clks);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clks);
+	if (ret)
+		return ret;
+
+	return krait_cc_icc_register(pdev, clks->hws[KRAIT_L2]);
 }
 
 static struct platform_driver krait_cc_driver = {
 	.probe = krait_cc_probe,
+	.remove = krait_cc_icc_remove,
 	.driver = {
 		.name = "krait-cc",
 		.of_match_table = krait_cc_match_table,
+		.sync_state = krait_cc_icc_sync_state,
 	},
 };
 module_platform_driver(krait_cc_driver);
-- 
2.39.2

