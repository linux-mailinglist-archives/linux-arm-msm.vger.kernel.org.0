Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D297D3FAE1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 21:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbhH2Thd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 15:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233681AbhH2Th3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 15:37:29 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC35FC061796;
        Sun, 29 Aug 2021 12:36:36 -0700 (PDT)
Received: from localhost.localdomain (83.6.166.149.neoplus.adsl.tpnet.pl [83.6.166.149])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 8976C3E859;
        Sun, 29 Aug 2021 21:36:34 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 9/9] clk: qcom: gcc-msm8994: Add a quirk for a different SDCC configuration
Date:   Sun, 29 Aug 2021 21:36:16 +0200
Message-Id: <20210829193617.4105-9-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829193617.4105-1-konrad.dybcio@somainline.org>
References: <20210829193617.4105-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some devices come with a different SDCC clock configuration,
account for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../bindings/clock/qcom,gcc-msm8994.yaml         |  4 ++++
 drivers/clk/qcom/gcc-msm8994.c                   | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
index b44a844d894c..4ba2f72d3cad 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
@@ -49,6 +49,10 @@ properties:
     description:
       Protected clock specifier list as per common clock binding.
 
+  qcom,sdcc2-clk-src-40mhz:
+    description: SDCC2_APPS clock source runs at 40MHz.
+    type: boolean
+
 required:
   - compatible
   - reg
diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 72038e4c04df..55c0fd069640 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -1012,6 +1012,19 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_sdcc2_40mhz_apps_clk_src[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0, 15, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(40000000, P_GPLL0, 15, 0, 0),
+	F(50000000, P_GPLL0, 12, 0, 0),
+	F(80000000, P_GPLL0, 7.5, 0, 0),
+	F(100000000, P_GPLL0, 6, 0, 0),
+	F(200000000, P_GPLL0, 3, 0, 0),
+	{ }
+};
+
 static struct freq_tbl ftbl_sdcc2_4_apps_clk_src[] = {
 	F(144000, P_XO, 16, 3, 25),
 	F(400000, P_XO, 12, 1, 4),
@@ -2788,6 +2801,9 @@ static int gcc_msm8994_probe(struct platform_device *pdev)
 		gcc_msm8994_desc.clks[GCC_SYS_NOC_UFS_AXI_CLK] = NULL;
 	}
 
+	if (of_find_property(dev->of_node, "qcom,sdcc2-clk-src-40mhz", NULL))
+		sdcc2_apps_clk_src.freq_tbl = ftbl_sdcc2_40mhz_apps_clk_src;
+
 	return qcom_cc_probe(pdev, &gcc_msm8994_desc);
 }
 
-- 
2.33.0

