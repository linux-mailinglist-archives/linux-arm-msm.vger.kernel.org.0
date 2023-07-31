Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5645176A116
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 21:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjGaTVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 15:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjGaTVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 15:21:46 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BD719BD
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 12:21:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso7882995e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 12:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690831299; x=1691436099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PH18c6fQCGlXIcWcVtPWcBFP7H4EemWa9GS7wznpGb8=;
        b=UXRqATWltySUPqaR1HiGQaOLF9a471W0U00WWaBgT7YrHR8eNU9tpiGnEFCxZrChh1
         9WGmsAGMbvHA62gNGcpEGQTo51vfgNHa9ofsSskkmnN0vFt/OindKHQ2F+txl9AvhUfc
         1ih4ReqvagvwRDz49/AkMzYG5G/WmGHFkAArJaQyCXYNMmpzOUbfxbTQvqyI2T4SJqlb
         uxE0wLBQyctkO5ylRyPYIt4euNiMj/IJMsrwfKYFu0+p7xn3uJz0pDotltqZ6UHG5Lv3
         sRChh/ME3Vb3x1zTK+TutY95x4Vz0pXaFOPyoEIL9c1OhpV1xSoB3YW9L3MAHA5NWEkf
         XHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690831299; x=1691436099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PH18c6fQCGlXIcWcVtPWcBFP7H4EemWa9GS7wznpGb8=;
        b=YAx0mw4TxHZgeYTQ+zCmETT8CL4o/DjwSe45ty9jhb9VuuFn4Sm+svyEZLPsPB2G4G
         2KPgeBLQizPxfZoFu00yo+OpCYKfdr+tHkWeA1m6xmsokOYDicVYvsdfXJoCSqIdS194
         xFghvVDBswg/Icmoo0YUah2bavhI556G0xQ5e852EObg9kuBbJqa/Le/J1fqXRAIfPM1
         40UieT3q5beqXV9yvmT/TdEWryuqexOlHm41jVIxMPun9q32TYyBPTQiHnamijunZXPZ
         T3B5dOeuf7wY/lkdQI/68+9pnD+fYS27G4Y3BkqBp2CWtQq0ZD1MNNFLQGr706y6l9AD
         EXrQ==
X-Gm-Message-State: ABy/qLb9fNmib81Rg8mVexfv1thJKNhIe91yPRuvETO9FUzvrStqzYtE
        gGPcNlyCBOGIaD7Wj+OYijKpxhaZM5egd+UlnVY1DQ==
X-Google-Smtp-Source: APBJJlG6VXtLarcsIVyYIR1fVvdn+qR2nYOLYfz3zVMaRj/0h6A3heIh/jX8GFK6xJuti9UDU42Vpg==
X-Received: by 2002:a05:6512:1591:b0:4f8:752f:df48 with SMTP id bp17-20020a056512159100b004f8752fdf48mr653255lfb.29.1690831299247;
        Mon, 31 Jul 2023 12:21:39 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id ep28-20020a056512485c00b004fe1bac4080sm2024882lfb.222.2023.07.31.12.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 12:21:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 31 Jul 2023 21:21:33 +0200
Subject: [PATCH v2 2/2] clk: qcom: videocc-sm8350: Add SC8280XP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8280_videocc-v2-2-c88269806269@linaro.org>
References: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
In-Reply-To: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690831295; l=3984;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=o5bVSx2gpTMciO9+T8/74+UVoyE1JD3fP/a+IZWVKbg=;
 b=ZGbEbtkrYDpuq6H+9Oj/I0FpRhjvMeWlMmYt6iYbz989Pu2/4tIBrqVbdfNoqgOrlcN3n0E5R
 GpYndhxqGTAAsstEIWon11A/mBN5nw3FnYGKP6gRbJRfDik2GABlMFM
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC8280XP, being a partial derivative of SM8350, shares almost the exact
same videocc block. Extend the 8350 driver to support the bigger brother.

The only notable changes are higher possible frequencies on some clocks
and some switcheroo within the XO/sleep registers (probably due to some
different board crystal configuration).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8350.c | 42 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index b148877fc73d..7246f3c99492 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -41,6 +41,10 @@ static const struct pll_vco lucid_5lpe_vco[] = {
 	{ 249600000, 1750000000, 0 },
 };
 
+static const struct pll_vco lucid_5lpe_vco_8280xp[] = {
+	{ 249600000, 1800000000, 0 },
+};
+
 static const struct alpha_pll_config video_pll0_config = {
 	.l = 0x25,
 	.alpha = 0x8000,
@@ -159,6 +163,16 @@ static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_8280xp[] = {
+	F(720000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1599000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1680000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 video_cc_mvs0_clk_src = {
 	.cmd_rcgr = 0xb94,
 	.mnd_width = 0,
@@ -181,6 +195,15 @@ static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_8280xp[] = {
+	F(840000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1800000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 video_cc_mvs1_clk_src = {
 	.cmd_rcgr = 0xbb4,
 	.mnd_width = 0,
@@ -499,6 +522,7 @@ static struct qcom_cc_desc video_cc_sm8350_desc = {
 
 static int video_cc_sm8350_probe(struct platform_device *pdev)
 {
+	u32 video_cc_xo_clk_cbcr = 0xeec;
 	struct regmap *regmap;
 	int ret;
 
@@ -510,6 +534,21 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc8280xp-videocc")) {
+		video_cc_sleep_clk_src.cmd_rcgr = 0xf38;
+		video_cc_sleep_clk.halt_reg = 0xf58;
+		video_cc_sleep_clk.clkr.enable_reg = 0xf58;
+		video_cc_xo_clk_src.cmd_rcgr = 0xf14;
+		video_cc_xo_clk_cbcr = 0xf34;
+
+		video_pll0.vco_table = video_pll1.vco_table = lucid_5lpe_vco_8280xp;
+		/* No change, but assign it for completeness */
+		video_pll0.num_vco = video_pll1.num_vco = ARRAY_SIZE(lucid_5lpe_vco_8280xp);
+
+		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_8280xp;
+		video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_8280xp;
+	}
+
 	regmap = qcom_cc_map(pdev, &video_cc_sm8350_desc);
 	if (IS_ERR(regmap)) {
 		pm_runtime_put(&pdev->dev);
@@ -525,7 +564,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 	 *      video_cc_xo_clk
 	 */
 	regmap_update_bits(regmap, 0xe58, BIT(0), BIT(0));
-	regmap_update_bits(regmap, 0xeec, BIT(0), BIT(0));
+	regmap_update_bits(regmap, video_cc_xo_clk_cbcr, BIT(0), BIT(0));
 
 	ret = qcom_cc_really_probe(pdev, &video_cc_sm8350_desc, regmap);
 	pm_runtime_put(&pdev->dev);
@@ -534,6 +573,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id video_cc_sm8350_match_table[] = {
+	{ .compatible = "qcom,sc8280xp-videocc" },
 	{ .compatible = "qcom,sm8350-videocc" },
 	{ }
 };

-- 
2.41.0

