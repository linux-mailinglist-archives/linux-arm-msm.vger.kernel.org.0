Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A671170ACB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 22:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbgBZVs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 16:48:28 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44047 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbgBZVs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 16:48:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id m16so641265wrx.11;
        Wed, 26 Feb 2020 13:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TjTCBST6cpMsAppV8JBTTv+T9QV8G6JLefGJ8DTMePs=;
        b=Gh+8mxxPRmBz5ItD/2Qpd2lmEFDJ6+UlANHisqcl1s46QRxFpBDscYtDqguT1fQo9f
         bA3GBmdW+rgBSETWdnjzdCP10x3AkIeyT6Ks99zd+RQ1yqo5KrLNC8xMbHrgiBSR1l8g
         e67fXMSsOsCRHiuMho9fcOYFJ0eUMDZ7A/CY7UkH3zZBjuKfsVUAMhuW2fp22FR0iHSY
         9wUzotZczhrrPKW0rWhLpx9OPg7QTFQhdomvo5GYWO31AZViCiIaIMO14bNL1XhUV5FG
         8qdLIigVf06b1l75aRmulDCPA8Mzn5KKvGsP+Z3vo/L/uCG1aUO4ojtmkmfCQxXP8d3K
         EIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TjTCBST6cpMsAppV8JBTTv+T9QV8G6JLefGJ8DTMePs=;
        b=tqqhFZt9Ip6KutsmKh/RNMVJstlM29PtuWDHNwQoifvkEQBXW4OoLOmKjQLmnnKWwx
         QeeTYQHA/gXqg68jijtqXIm6MxnvBwj+oIBVTC6LKQbxPT5cWEBodwsLTs4QHTHYfIaL
         qyUoCAYrx2lXtP4YDTwsSIga7Ht0WEIG16TfqasZq9Ds9/h9kz2tDVjI4R6FwVIa/PNV
         moHv03um2wD0Fub7AkWeABv2cG4XL36gOE5Bb6DIW1bg6L+2CR180JcGV0KHGF43vPvl
         TP5AFI4WtGjr742Aaqk0ySDFsRshXfSqdI7Ez/klgyGF74AS5D/+oE3ot/INV/vH/gsL
         MUMw==
X-Gm-Message-State: APjAAAU4NhExX4Pe5vRTo1fV9uf11dDb9Z1m5oHwojtQ8wjjTOYmZamG
        vOCu+TgbAlKUtWkLVGAeMr0=
X-Google-Smtp-Source: APXvYqxsvbKla5iG6TBDnuXgehZINgcnbX8qokIuJnhf3kEFjluM7zyxhNtIpVVPpKQcT4yMIBK9+w==
X-Received: by 2002:adf:90ee:: with SMTP id i101mr643052wri.417.1582753704877;
        Wed, 26 Feb 2020 13:48:24 -0800 (PST)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.googlemail.com with ESMTPSA id b10sm4878846wrw.61.2020.02.26.13.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 13:48:24 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        John Crispin <john@phrozen.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: clk-rpm: add missing rpm clk for ipq806x
Date:   Wed, 26 Feb 2020 22:48:12 +0100
Message-Id: <20200226214812.390-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <robh@kernel.org>
References: <robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing definition of rpm clk for ipq806x soc

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
Acked-by: John Crispin <john@phrozen.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-rpm.c                    | 35 +++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h        |  4 +++
 3 files changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 944719bd586f..4bb2cbeff2b4 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -15,6 +15,7 @@ Required properties :
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
+			"qcom,rpmcc-ipq806x", "qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index 9e3110a71f12..f71d228fd6bd 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -543,10 +543,45 @@ static const struct rpm_clk_desc rpm_clk_apq8064 = {
 	.num_clks = ARRAY_SIZE(apq8064_clks),
 };
 
+/* ipq806x */
+DEFINE_CLK_RPM(ipq806x, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
+DEFINE_CLK_RPM(ipq806x, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
+DEFINE_CLK_RPM(ipq806x, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
+DEFINE_CLK_RPM(ipq806x, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
+DEFINE_CLK_RPM(ipq806x, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
+DEFINE_CLK_RPM(ipq806x, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
+DEFINE_CLK_RPM(ipq806x, nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
+DEFINE_CLK_RPM(ipq806x, nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
+
+static struct clk_rpm *ipq806x_clks[] = {
+	[RPM_APPS_FABRIC_CLK] = &ipq806x_afab_clk,
+	[RPM_APPS_FABRIC_A_CLK] = &ipq806x_afab_a_clk,
+	[RPM_CFPB_CLK] = &ipq806x_cfpb_clk,
+	[RPM_CFPB_A_CLK] = &ipq806x_cfpb_a_clk,
+	[RPM_DAYTONA_FABRIC_CLK] = &ipq806x_daytona_clk,
+	[RPM_DAYTONA_FABRIC_A_CLK] = &ipq806x_daytona_a_clk,
+	[RPM_EBI1_CLK] = &ipq806x_ebi1_clk,
+	[RPM_EBI1_A_CLK] = &ipq806x_ebi1_a_clk,
+	[RPM_SYS_FABRIC_CLK] = &ipq806x_sfab_clk,
+	[RPM_SYS_FABRIC_A_CLK] = &ipq806x_sfab_a_clk,
+	[RPM_SFPB_CLK] = &ipq806x_sfpb_clk,
+	[RPM_SFPB_A_CLK] = &ipq806x_sfpb_a_clk,
+	[RPM_NSS_FABRIC_0_CLK] = &ipq806x_nss_fabric_0_clk,
+	[RPM_NSS_FABRIC_0_A_CLK] = &ipq806x_nss_fabric_0_a_clk,
+	[RPM_NSS_FABRIC_1_CLK] = &ipq806x_nss_fabric_1_clk,
+	[RPM_NSS_FABRIC_1_A_CLK] = &ipq806x_nss_fabric_1_a_clk,
+};
+
+static const struct rpm_clk_desc rpm_clk_ipq806x = {
+	.clks = ipq806x_clks,
+	.num_clks = ARRAY_SIZE(ipq806x_clks),
+};
+
 static const struct of_device_id rpm_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8660", .data = &rpm_clk_msm8660 },
 	{ .compatible = "qcom,rpmcc-apq8060", .data = &rpm_clk_msm8660 },
 	{ .compatible = "qcom,rpmcc-apq8064", .data = &rpm_clk_apq8064 },
+	{ .compatible = "qcom,rpmcc-ipq806x", .data = &rpm_clk_ipq806x },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_clk_match_table);
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 8e3095720552..ae74c43c485d 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -37,6 +37,10 @@
 #define RPM_XO_A0				27
 #define RPM_XO_A1				28
 #define RPM_XO_A2				29
+#define RPM_NSS_FABRIC_0_CLK			30
+#define RPM_NSS_FABRIC_0_A_CLK			31
+#define RPM_NSS_FABRIC_1_CLK			32
+#define RPM_NSS_FABRIC_1_A_CLK			33
 
 /* SMD RPM clocks */
 #define RPM_SMD_XO_CLK_SRC				0
-- 
2.25.0

