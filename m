Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC7F2067C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387606AbgFWXAs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387981AbgFWXAq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:00:46 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D15ACC061573;
        Tue, 23 Jun 2020 16:00:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so251819wrs.11;
        Tue, 23 Jun 2020 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LSoysgS0ZqNm2t/wMcmaskJvGECE8Iozs0Wrs6B0Rm0=;
        b=Ha86oRVfo+8iPYCrVfqIoegBMdsgHmq9/jgDu5GmftV+qfJEYWmNFGRsVY34jWhV6+
         aQgVPKBHm5RvTPiDGXvTu5G+a1S7Id8mvDOUMKe0uGpZxwcpGN8ZpRXIHKZB7bqpPaV0
         Ve0KVsyCsozppdEUjE4BwUlfzT7yXc4mRfvqY/sFF7Cb3mJjbcdkdZTeCjq0wrdmTgw/
         kLaixNqyiIKuvhUJcHtjKYWo1ZAoxDdLo4K+XbM6OC50kP46KqvW5jIXYBPQ6w/0NraW
         ppYElJ1jWICIq0piGnxImJNKbfG5tX2qxU2i7J8oOUEllHSLCkSr+mHp+aLEcBqyJuzc
         JA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LSoysgS0ZqNm2t/wMcmaskJvGECE8Iozs0Wrs6B0Rm0=;
        b=SqognJCbRi4FPjZWZLmiI43PesTVwBXpjUrOcaAxtDzdE05+1nuUhQ8EOloig+TPIn
         jhbwnJfiOW0AH86mTSopwokrZDjclcKPdeWI0OE1V1bCsQO6Itz+TMuifA6HL2/GEAYA
         zZzM76mOZLltMWm8tcKz1/PcoNHJsXCGiT7fNHPaO4z4XxJp8Beg0xbBkp+pHYibu2JY
         HQ8wpNpT+/PKlXkUW1y88qPJ0pYfku+++0fKeIP4jP+1xI81gmVaX9ybdWmS4nYnb5gq
         uEpNJ/ak21DUCEamExH9yerOuw181pLuiyTTlvvi0VPnhXuGJ37ap26qp481M6Ad2K1i
         4FWA==
X-Gm-Message-State: AOAM532dgEo/qFteMNyfnd51R83aiUHa/3px1x0Y8hITi2TC1+cjtsC9
        gDriavKWXYUctvySr3NPlRiLFLOBQgU=
X-Google-Smtp-Source: ABdhPJyfTWt/CmbZ7420CrK3TLQs8YVGnLLtpjh+aE0xhutMGz80LUJLGUM6Hn4gyMf/HpGG5OYgXw==
X-Received: by 2002:adf:f452:: with SMTP id f18mr27285785wrp.389.1592953243520;
        Tue, 23 Jun 2020 16:00:43 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id c20sm20072498wrb.65.2020.06.23.16.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:00:42 -0700 (PDT)
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
Subject: [PATCH 1/1] clk: qcom: smd: Add support for MSM8992/4 rpm clocks
Date:   Wed, 24 Jun 2020 01:00:18 +0200
Message-Id: <20200623230018.303776-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rpm smd clocks, PMIC and bus clocks which are required on MSM8992,
MSM8994 (and APQ variants) for clients to vote on.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |   2 +
 drivers/clk/qcom/clk-smd-rpm.c                | 171 ++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h        |   4 +
 3 files changed, 177 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 86190acc71bc..50fb814237bb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -17,6 +17,8 @@ Required properties :
 			"qcom,rpmcc-msm8976", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
 			"qcom,rpmcc-ipq806x", "qcom,rpmcc"
+			"qcom,rpmcc-msm8992",·"qcom,rpmcc"
+			"qcom,rpmcc-msm8994",·"qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 643bc355df5c..a00f84a85bb2 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -574,6 +574,175 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 	.num_clks = ARRAY_SIZE(msm8976_clks),
 };
 
+/* msm8992 */
+DEFINE_CLK_SMD_RPM(msm8992, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8992, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8992, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8992, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8992, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8992, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8992, bb_clk1_pin, bb_clk1_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, bb_clk2, bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8992, bb_clk2_pin, bb_clk2_a_pin, 2);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk1, div_clk1_a, 11);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk2, div_clk2_a, 12);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13);
+DEFINE_CLK_SMD_RPM(msm8992, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8);
+DEFINE_CLK_SMD_RPM(msm8992, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk,
+		   QCOM_SMD_RPM_BUS_CLK, 3);
+DEFINE_CLK_SMD_RPM_QDSS(msm8992, qdss_clk, qdss_a_clk,
+			QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, rf_clk2, rf_clk2_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8992, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8992, rf_clk2_pin, rf_clk2_a_pin, 5);
+
+DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
+
+static struct clk_smd_rpm *msm8992_clks[] = {
+	[RPM_SMD_PNOC_CLK] = &msm8992_pnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &msm8992_pnoc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK] = &msm8992_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK] = &msm8992_ocmemgx_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8992_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8992_bimc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8992_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8992_cnoc_a_clk,
+	[RPM_SMD_GFX3D_CLK_SRC] = &msm8992_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8992_gfx3d_a_clk_src,
+	[RPM_SMD_SNOC_CLK] = &msm8992_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8992_snoc_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8992_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8992_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8992_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8992_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2] = &msm8992_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8992_bb_clk2_a,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8992_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8992_bb_clk2_a_pin,
+	[RPM_SMD_DIV_CLK1] = &msm8992_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8992_div_clk1_a,
+	[RPM_SMD_DIV_CLK2] = &msm8992_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8992_div_clk2_a,
+	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
+	[RPM_SMD_IPA_CLK] = &msm8992_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8992_ipa_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8992_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8992_mmssnoc_ahb_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8992_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8992_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8992_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8992_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &msm8992_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8992_rf_clk2_a,
+	[RPM_SMD_RF_CLK1_PIN] = &msm8992_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &msm8992_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8992_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8992_rf_clk2_a_pin,
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
+	[RPM_SMD_CE2_CLK] = &msm8992_ce2_clk,
+	[RPM_SMD_CE2_A_CLK] = &msm8992_ce2_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8992 = {
+	.clks = msm8992_clks,
+	.num_clks = ARRAY_SIZE(msm8992_clks),
+};
+
+/* msm8994 */
+DEFINE_CLK_SMD_RPM(msm8994, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8994, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8994, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8994, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8994, gfx3d_clk_src, gfx3d_a_clk_src, QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8994, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8994, bb_clk1_pin, bb_clk1_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, bb_clk2, bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8994, bb_clk2_pin, bb_clk2_a_pin, 2);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, div_clk1, div_clk1_a, 11);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, div_clk2, div_clk2_a, 12);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, div_clk3, div_clk3_a, 13);
+DEFINE_CLK_SMD_RPM(msm8994, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, ln_bb_clk, ln_bb_a_clk, 8);
+DEFINE_CLK_SMD_RPM(msm8994, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk,
+		   QCOM_SMD_RPM_BUS_CLK, 3);
+DEFINE_CLK_SMD_RPM_QDSS(msm8994, qdss_clk, qdss_a_clk,
+			QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8994, rf_clk2, rf_clk2_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8994, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8994, rf_clk2_pin, rf_clk2_a_pin, 5);
+
+DEFINE_CLK_SMD_RPM(msm8994, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8994, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8994, ce3_clk, ce3_a_clk, QCOM_SMD_RPM_CE_CLK, 2);
+
+static struct clk_smd_rpm *msm8994_clks[] = {
+	[RPM_SMD_PNOC_CLK] = &msm8994_pnoc_clk,
+	[RPM_SMD_PNOC_A_CLK] = &msm8994_pnoc_a_clk,
+	[RPM_SMD_OCMEMGX_CLK] = &msm8994_ocmemgx_clk,
+	[RPM_SMD_OCMEMGX_A_CLK] = &msm8994_ocmemgx_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8994_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8994_bimc_a_clk,
+	[RPM_SMD_CNOC_CLK] = &msm8994_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &msm8994_cnoc_a_clk,
+	[RPM_SMD_GFX3D_CLK_SRC] = &msm8994_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC] = &msm8994_gfx3d_a_clk_src,
+	[RPM_SMD_SNOC_CLK] = &msm8994_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8994_snoc_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8994_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8994_bb_clk1_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8994_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8994_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2] = &msm8994_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8994_bb_clk2_a,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8994_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8994_bb_clk2_a_pin,
+	[RPM_SMD_DIV_CLK1] = &msm8994_div_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8994_div_clk1_a,
+	[RPM_SMD_DIV_CLK2] = &msm8994_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8994_div_clk2_a,
+	[RPM_SMD_DIV_CLK3] = &msm8994_div_clk3,
+	[RPM_SMD_DIV_A_CLK3] = &msm8994_div_clk3_a,
+	[RPM_SMD_IPA_CLK] = &msm8994_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8994_ipa_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &msm8994_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8994_ln_bb_a_clk,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8994_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8994_mmssnoc_ahb_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8994_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8994_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8994_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8994_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &msm8994_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8994_rf_clk2_a,
+	[RPM_SMD_RF_CLK1_PIN] = &msm8994_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &msm8994_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8994_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8994_rf_clk2_a_pin,
+	[RPM_SMD_CE1_CLK] = &msm8994_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8994_ce1_a_clk,
+	[RPM_SMD_CE2_CLK] = &msm8994_ce2_clk,
+	[RPM_SMD_CE2_A_CLK] = &msm8994_ce2_a_clk,
+	[RPM_SMD_CE3_CLK] = &msm8994_ce3_clk,
+	[RPM_SMD_CE3_A_CLK] = &msm8994_ce3_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8994 = {
+	.clks = msm8994_clks,
+	.num_clks = ARRAY_SIZE(msm8994_clks),
+};
+
 /* msm8996 */
 DEFINE_CLK_SMD_RPM(msm8996, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8996, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -845,6 +1014,8 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8976", .data = &rpm_clk_msm8976 },
+	{ .compatible = "qcom,rpmcc-msm8992", .data = &rpm_clk_msm8992 },
+	{ .compatible = "qcom,rpmcc-msm8994", .data = &rpm_clk_msm8994 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index d1afa634b58d..c12b3b7835ed 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -143,5 +143,9 @@
 #define RPM_SMD_LN_BB_CLK1_A_PIN		97
 #define RPM_SMD_LN_BB_CLK2_PIN			98
 #define RPM_SMD_LN_BB_CLK2_A_PIN		99
+#define RPM_SMD_CE2_CLK				100
+#define RPM_SMD_CE2_A_CLK			101
+#define RPM_SMD_CE3_CLK				102
+#define RPM_SMD_CE3_A_CLK			103
 
 #endif
-- 
2.27.0

