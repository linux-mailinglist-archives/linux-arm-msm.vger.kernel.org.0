Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65505202461
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgFTOr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgFTOr4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:47:56 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3746C06174E;
        Sat, 20 Jun 2020 07:47:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id p19so951308wmg.1;
        Sat, 20 Jun 2020 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DCG0ql+6iUBjTSaUb3iHAe/NIrTHP1VLdsVQ8Ju6DOs=;
        b=P2+3b3axWG/S/fjGIYsYAaPdVg3QP/NlOTEPRydXd3FNpLSyJUlsAQDBw9s0MW8Brw
         kP1K3DRkrGbhtyEtXDVcLyfKbFQZ+UDCFvTDyAY0KISNkUTX5RxpM1V0MRsOVfO2ELoH
         STuclzSAAhzMp5vXLK7k161vvOnhITnbv0DanYPtG6IeYQQ5+GSYuDY0THjA4h2NWaxj
         3gr9DdoBkbKDa3sIyEV0G5FkkUhng78A2OJaf1L21paviwIQxhHwTDZQ6HjW55OT+Ni4
         Xc0r13sdJ+FV68Y/igICO8OhefNrpu2/YXVvFv22X4aVT7U6LdwkfAheyvAq2h+Gz05p
         bt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DCG0ql+6iUBjTSaUb3iHAe/NIrTHP1VLdsVQ8Ju6DOs=;
        b=EwaAVk0jwBrc1knvKKEAhwprCWmlmIpO4rfsXUnGr2IzTbHP/3Z3t4kDzYXidqOV2y
         /zwDXkdNFyXZCZsRDvyklA7y4VZmh1/psMefxzKbDg5OBb3OJWDrre36Y6kcMZa+hXnd
         qa5Tnz1Li+QNbg1Ufl3qjNr0PNQSSr6tqVoxEjRC7hjNwvUpbuNojxrmUfdd9o4WD7hd
         2KJpJhxayyLpxmxjcTF0ZVjHpQRcaJ0qw28mQDNSVnuZOUCApbFMjN6FN6fXT6yOy2vG
         C88+n5cjIoK0wez1m+rSUFilLNRy5ijSb3lv6JnKk8gzK+9qJV6LuXu7Ng1PgqoSs6s2
         qgiQ==
X-Gm-Message-State: AOAM533bJhn64MxjdER/XZfj2+jpfVB7zfKX6e8O4YUhGdYkq3yNME+5
        SeLXoFxXUsK+h6/2MA+5O5U=
X-Google-Smtp-Source: ABdhPJx8xESk/Dr1cADTllfCQmttACysPX0T/qpnwjIwQaBzpUaYwpf/xHGKXvtU08ISEaaTNDmOCA==
X-Received: by 2002:a1c:4e08:: with SMTP id g8mr2294425wmh.24.1592664474670;
        Sat, 20 Jun 2020 07:47:54 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:47:54 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/21] clk: qcom: smd: Add support for MSM8992/4 rpm clocks
Date:   Sat, 20 Jun 2020 16:46:17 +0200
Message-Id: <20200620144639.335093-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
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
 drivers/clk/qcom/clk-smd-rpm.c                | 172 ++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h        |   4 +
 3 files changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 90a1349bc713..f864ea69a590 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -17,6 +17,8 @@ Required properties :
 			"qcom,rpmcc-msm8976", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
 			"qcom,rpmcc-ipq806x", "qcom,rpmcc"
+                        "qcom,rpmcc-msm8992", "qcom,rpmcc"
+                        "qcom,rpmcc-msm8994", "qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 52f63ad787ba..429517340148 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -574,6 +574,176 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
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
+
 /* msm8996 */
 DEFINE_CLK_SMD_RPM(msm8996, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8996, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -770,6 +940,8 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8976", .data = &rpm_clk_msm8976 },
+	{ .compatible = "qcom,rpmcc-msm8992", .data = &rpm_clk_msm8992 },
+	{ .compatible = "qcom,rpmcc-msm8994", .data = &rpm_clk_msm8994 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index ae74c43c485d..9cbf17027afd 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -133,5 +133,9 @@
 #define RPM_SMD_RF_CLK3_A			87
 #define RPM_SMD_RF_CLK3_PIN			88
 #define RPM_SMD_RF_CLK3_A_PIN			89
+#define RPM_SMD_CE2_CLK             90
+#define RPM_SMD_CE2_A_CLK               91
+#define RPM_SMD_CE3_CLK             92
+#define RPM_SMD_CE3_A_CLK           93
 
 #endif
-- 
2.27.0

