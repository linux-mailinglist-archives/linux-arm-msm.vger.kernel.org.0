Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0384AEAEF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 12:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbfJaL37 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 07:29:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38618 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfJaL37 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 07:29:59 -0400
Received: by mail-wm1-f65.google.com with SMTP id z19so1350956wmk.3;
        Thu, 31 Oct 2019 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=085bmSl01OMFBIIZZqeSQwIRLRP5SejXg7Kp0q59UNc=;
        b=cnf2dvm5r/pkKFmA181xCkWtE9edK5RA5p+BltyIBC9F+MbmhBOCbzTX4NLVZtwZsL
         iJ7mPF9A4DrW5k4M2y32pjlDJKEPKkaZK4+BBY4MVmwrjbrATCclW/JnW+iEtClDt8Cf
         gPZC8UnaUz5ZC4Xjh8+Tk5cMV92QBTzWuVpkUoLJC+RKuL7dwUII4EQrJngQ96NsTlz4
         Wm4JIB/IoEdYL+7Wf+uOk5UHfYEYR0Iflvv9tI96qCimYUjfpvXikzwzhLXoBnpybBgE
         SGKDzjCpFwFJluv+KKPHXL/gFPpKgFKBzIybH/NFK0DKuDnFKIoj2rEVw0UKExEVziER
         556w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=085bmSl01OMFBIIZZqeSQwIRLRP5SejXg7Kp0q59UNc=;
        b=N+5jmiYziP7/Wu5WsZEu4k3WdmFgWJ8xDzVnEPcoogPtQ706imoyWBO9zM5ZVCGbBT
         Y7gMwKNpxG0SrllhgviIdlrMt1kHW2Y9Zv7lfcrxfcNVYOm7BigQQMZI4HtR9XSN20Kq
         Q1xV/ExZK40Ey5KJoemfxFY7NlJ1ptOsFBsJB19VVNkbXVC/MX5IOJub3a4UegRPnzBy
         En32Q0E/aT5jByorJIWR0BA9vLIVwOJQebCdA9TXufEA5ttGa0NGE1H6mEr61Z9SH71E
         IPuiC2D2pgrmn/ainaO594cfoWcKu91TubHyq/ltBbcXGOTYXqMEz1wbzHDJSa8VGyOg
         cA+A==
X-Gm-Message-State: APjAAAXJOu5dIRMdJC5pJLzo8yenxOgG2vsiE1iEBSAsgXo0sI5f5S1y
        S3gxqJoiyXweiynRbGbHjgoUAzYclis=
X-Google-Smtp-Source: APXvYqxOT/yPqdzRH5tfxbF0D8sY2C5rJBp+Wg0KnMiykXnHPsy8G8W8nxs+s6s3uKD91XGFxwjk+A==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr4712017wmd.48.1572521395990;
        Thu, 31 Oct 2019 04:29:55 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id r13sm4563586wra.74.2019.10.31.04.29.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 04:29:54 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, bjorn.andersson@linaro.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: smd: Add support for MSM8976 rpm clocks
Date:   Thu, 31 Oct 2019 12:29:50 +0100
Message-Id: <20191031112951.35850-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031112951.35850-1-kholk11@gmail.com>
References: <20191031112951.35850-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add rpm smd clocks, PMIC and bus clocks which are required on MSM8976,
MSM8956 (and APQ variants) for clients to vote on.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fef5e8157061..d8ae38daff63 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -523,6 +523,55 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 	.num_clks = ARRAY_SIZE(msm8974_clks),
 };
 
+
+/* msm8976 */
+DEFINE_CLK_SMD_RPM(msm8976, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8976, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8976, mmssnoc_ahb_clk, mmssnoc_ahb_a_clk,
+		   QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM(msm8976, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8976, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM_QDSS(msm8976, qdss_clk, qdss_a_clk,
+			QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, bb_clk2, bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, rf_clk2, rf_clk2_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8976, div_clk2, div_clk2_a, 12);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8976, bb_clk1_pin, bb_clk1_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8976, bb_clk2_pin, bb_clk2_a_pin, 2);
+
+static struct clk_smd_rpm *msm8976_clks[] = {
+	[RPM_SMD_PCNOC_CLK] = &msm8976_pcnoc_clk,
+	[RPM_SMD_PCNOC_A_CLK] = &msm8976_pcnoc_a_clk,
+	[RPM_SMD_SNOC_CLK] = &msm8976_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &msm8976_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8976_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8976_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &msm8976_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &msm8976_qdss_a_clk,
+	[RPM_SMD_BB_CLK1] = &msm8976_bb_clk1,
+	[RPM_SMD_BB_CLK1_A] = &msm8976_bb_clk1_a,
+	[RPM_SMD_BB_CLK2] = &msm8976_bb_clk2,
+	[RPM_SMD_BB_CLK2_A] = &msm8976_bb_clk2_a,
+	[RPM_SMD_RF_CLK2] = &msm8976_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8976_rf_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN] = &msm8976_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN] = &msm8976_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN] = &msm8976_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN] = &msm8976_bb_clk2_a_pin,
+	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8976_mmssnoc_ahb_clk,
+	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8976_mmssnoc_ahb_a_clk,
+	[RPM_SMD_DIV_CLK2] = &msm8976_div_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8976_div_clk2_a,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
+	.clks = msm8976_clks,
+	.num_clks = ARRAY_SIZE(msm8976_clks),
+};
+
 /* msm8996 */
 DEFINE_CLK_SMD_RPM(msm8996, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8996, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
@@ -712,6 +761,7 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8998 = {
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
+	{ .compatible = "qcom,rpmcc-msm8976", .data = &rpm_clk_msm8976 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
-- 
2.21.0

