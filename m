Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0D12032B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 11:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgFVJDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 05:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgFVJDM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 05:03:12 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3057C061794;
        Mon, 22 Jun 2020 02:03:11 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so2336071edq.8;
        Mon, 22 Jun 2020 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2hdXSzXuuINYgcxwY7OV52VQ4Z9wZkog/Fb//kF9Ho=;
        b=T3mdIbBqjUUpQBHd1FH3RXBx9VytQp3smKLRnD+g180ol8wXg7aLuEidceO65D9XxC
         Rego3P9Fg1se0AOnEVOO49UiE5aQFMFolUWorloIXtbLOf5kmNYEh8xlDninb8BLL0X1
         MDwvqmgQXHmfkjvKyQugTnvzadbfhWngPIPyzCqtr1KSOy4lD2hC8KJ+9ZbsiReA4hVk
         okoqO56dtG9xy5jm3RFl6thOKBcNq6CD0vkGp9e8FqivC58iCaLXVAD6dxaRA0CE7kMQ
         vklQFAPRNzF+U1hDGYFntJFtkyzBEJ0vkBqUOS1PbFxnPsf+DkhVwN6ZxGPQ87klhTXG
         ru+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2hdXSzXuuINYgcxwY7OV52VQ4Z9wZkog/Fb//kF9Ho=;
        b=gvCRBJBn6ljNM6i6QLlsB/1aQYeu0PZ21G4kjFx8LZ8hSaBg/c5PgKB0XoHbIrRzO8
         v3S+kbpWWMtolTtkkJD5vplWDkuBI5Z9GT1uv2ao0iYABqKf88TZNhbUxqXlX71qN4ja
         wCFBnqfxhsmo86umk+kEzGMt2mpXsyoS2vBQOJOk7sStMsLZJ14786soBomZAR8mEUUB
         tiBBPszZ3+dW29Yal4gUtMI4CuTBHCvvntAAvUmGZi1sgy/WHESBR08J52HrOoG5cxP3
         PS/hMDC8t5I1kyHT3wa6E8oIErot/Ak8yhMu/ymRs3RsXF/NewjWMzQRk+VAViFSzFm4
         bdFA==
X-Gm-Message-State: AOAM532c3LBXdA0XMtTrNHGmSYf6U9RUJoWtAyWKCn//DSbad2o51bLj
        FVwxiHKwSFuZlUo1HgBrzAs=
X-Google-Smtp-Source: ABdhPJxbAXBm1/G9y3DJ0Yp0NBnPPwATa2M1RZXdjxuidmxnhXMAvzPZJMuOSzfdMEGuKkNjGs7DPw==
X-Received: by 2002:aa7:c80c:: with SMTP id a12mr16339227edt.140.1592816590463;
        Mon, 22 Jun 2020 02:03:10 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b18sm5385811ejl.52.2020.06.22.02.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 02:03:10 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] clk: qcom: smd: Add support for SDM660 rpm clocks
Date:   Mon, 22 Jun 2020 11:02:52 +0200
Message-Id: <20200622090252.36568-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rpm smd clocks, PMIC and bus clocks which are required on
SDM630/660 (and APQ variants) for clients to vote on.

changes since v2:
- separate from SDM630 enablement series
- fix indentation in Docs
- sort compatible strings alphabetically
- drop an accidental newline

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 76 +++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h        | 10 +++
 3 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 90a1349bc713..86190acc71bc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -20,6 +20,7 @@ Required properties :
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
+			"qcom,rpmcc-sdm660", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
 
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 52f63ad787ba..643bc355df5c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -766,6 +766,81 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 	.num_clks = ARRAY_SIZE(msm8998_clks),
 };
 
+/* sdm660 */
+DEFINE_CLK_SMD_RPM_BRANCH(sdm660, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC_CLK, 0,
+								19200000);
+DEFINE_CLK_SMD_RPM(sdm660, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(sdm660, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(sdm660, cnoc_periph_clk, cnoc_periph_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, mmssnoc_axi_clk, mmssnoc_axi_a_clk,
+						   QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(sdm660, aggre2_noc_clk, aggre2_noc_a_clk,
+						QCOM_SMD_RPM_AGGR_CLK, 2);
+DEFINE_CLK_SMD_RPM_QDSS(sdm660, qdss_clk, qdss_a_clk,
+						QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, div_clk1, div_clk1_a, 11);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk1, ln_bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk2, ln_bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sdm660, ln_bb_clk3, ln_bb_clk3_a, 3);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk1_pin,
+							ln_bb_clk1_pin_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk2_pin,
+							ln_bb_clk2_pin_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sdm660, ln_bb_clk3_pin,
+							ln_bb_clk3_pin_a, 3);
+static struct clk_smd_rpm *sdm660_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &sdm660_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sdm660_snoc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &sdm660_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sdm660_cnoc_a_clk,
+	[RPM_SMD_CNOC_PERIPH_CLK] = &sdm660_cnoc_periph_clk,
+	[RPM_SMD_CNOC_PERIPH_A_CLK] = &sdm660_cnoc_periph_a_clk,
+	[RPM_SMD_BIMC_CLK] = &sdm660_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &sdm660_bimc_a_clk,
+	[RPM_SMD_MMSSNOC_AXI_CLK] = &sdm660_mmssnoc_axi_clk,
+	[RPM_SMD_MMSSNOC_AXI_CLK_A] = &sdm660_mmssnoc_axi_a_clk,
+	[RPM_SMD_IPA_CLK] = &sdm660_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &sdm660_ipa_a_clk,
+	[RPM_SMD_CE1_CLK] = &sdm660_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &sdm660_ce1_a_clk,
+	[RPM_SMD_AGGR2_NOC_CLK] = &sdm660_aggre2_noc_clk,
+	[RPM_SMD_AGGR2_NOC_A_CLK] = &sdm660_aggre2_noc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sdm660_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sdm660_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &sdm660_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &sdm660_rf_clk1_a,
+	[RPM_SMD_DIV_CLK1] = &sdm660_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &sdm660_div_clk1_a,
+	[RPM_SMD_LN_BB_CLK] = &sdm660_ln_bb_clk1,
+	[RPM_SMD_LN_BB_A_CLK] = &sdm660_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &sdm660_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &sdm660_ln_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK3] = &sdm660_ln_bb_clk3,
+	[RPM_SMD_LN_BB_CLK3_A] = &sdm660_ln_bb_clk3_a,
+	[RPM_SMD_RF_CLK1_PIN] = &sdm660_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &sdm660_rf_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &sdm660_ln_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &sdm660_ln_bb_clk1_pin_a,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &sdm660_ln_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &sdm660_ln_bb_clk2_pin_a,
+	[RPM_SMD_LN_BB_CLK3_PIN] = &sdm660_ln_bb_clk3_pin,
+	[RPM_SMD_LN_BB_CLK3_A_PIN] = &sdm660_ln_bb_clk3_pin_a,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
+	.clks = sdm660_clks,
+	.num_clks = ARRAY_SIZE(sdm660_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
@@ -773,6 +848,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
+	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index ae74c43c485d..d1afa634b58d 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -133,5 +133,15 @@
 #define RPM_SMD_RF_CLK3_A			87
 #define RPM_SMD_RF_CLK3_PIN			88
 #define RPM_SMD_RF_CLK3_A_PIN			89
+#define RPM_SMD_MMSSNOC_AXI_CLK			90
+#define RPM_SMD_MMSSNOC_AXI_CLK_A		91
+#define RPM_SMD_CNOC_PERIPH_CLK			92
+#define RPM_SMD_CNOC_PERIPH_A_CLK		93
+#define RPM_SMD_LN_BB_CLK3			94
+#define RPM_SMD_LN_BB_CLK3_A			95
+#define RPM_SMD_LN_BB_CLK1_PIN			96
+#define RPM_SMD_LN_BB_CLK1_A_PIN		97
+#define RPM_SMD_LN_BB_CLK2_PIN			98
+#define RPM_SMD_LN_BB_CLK2_A_PIN		99
 
 #endif
-- 
2.27.0

