Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27977164E07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 19:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgBSSxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 13:53:44 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44332 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgBSSxn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 13:53:43 -0500
Received: by mail-wr1-f67.google.com with SMTP id m16so1762245wrx.11;
        Wed, 19 Feb 2020 10:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ghgXYpoQgkOpnQL9griV2O/D69vhRotKDSv69SC7wTw=;
        b=aphIdvxLLQVuRbuh8CtOwlBazoYgwcHZy07FPMUO6+2MqV8kxkfNSAarAeZjvroZDQ
         JvJOUQbS7Scj1xgIuIG2Mv73dBl7xHp6l5/RoDVbYSG/kMhvHRV0CWUfYMzIlacXy/iF
         hR1kWKV++qaMpYS4FtwoEZyc9FnV/wLFRGVJgz1Hm6f3vO7EzQ2FjOxvfm4gVT0ReJxA
         N3/VwuJ2hwshqDLk4Q7II3hrgCu2Pkr7NgZHUOWA0ogNdBQ4/MqEmfrKCTY5OyUEZ/Rn
         eY8FqHf8uL1GxxtvgbwSpql8OiBDM5eQ4YB13CdPMJPpFHqSuj8CF3dNjhV6wgu4ieYN
         hs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ghgXYpoQgkOpnQL9griV2O/D69vhRotKDSv69SC7wTw=;
        b=bPokfOpfIJIwzSloQngBPPpn9VdBoRu+qypxwIHI092QNHDN2ORp40whbnuwjj/hKn
         juWSwoASvUlgEH6FVXiJ+Yq/AEAm4DcmIMklhGqDITrp1wr72Wetl9oykdwRCAqQQkb6
         /URG6ytOEiNjcmh0l0y0dVaN9I5HaSD5BP777XIFPlAc1RAtCxfBJILw/xwI1pbD30oj
         hrw5dTshrHkuuHcYXSeikyQ4lBEZNPmWM1qqRZY+JiUp8BPZKJlUcIhvEBLMwb+m7hrr
         OvPl31pu80B2Cy/pNpyC9iO8FC0roZAu5ONIuOPBbNbQMwdMIt+dRB4Yxa2Kwo+rIuqh
         3G6Q==
X-Gm-Message-State: APjAAAUQn8I3m1F7CzEbONFDZuSNeDkiDZnqpVcPQXtb6VjFFowdEmUO
        clX2RpX1VlfTkcIGsFjkD7Y=
X-Google-Smtp-Source: APXvYqzJBbPpR1y0eUU/KS69tU3ktGU6cgCfyAySvGRWiN2smoZm7JCv//IyN+xeGyLOH2xgXULwqQ==
X-Received: by 2002:adf:df90:: with SMTP id z16mr36589917wrl.273.1582138421671;
        Wed, 19 Feb 2020 10:53:41 -0800 (PST)
Received: from Ansuel-XPS.localdomain ([5.170.105.173])
        by smtp.googlemail.com with ESMTPSA id y131sm981452wmc.13.2020.02.19.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 10:53:40 -0800 (PST)
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
Subject: [PATCH] clk: qcom: clk-rpm: add missing rpm clk for ipq806x
Date:   Wed, 19 Feb 2020 19:52:25 +0100
Message-Id: <20200219185226.1236-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
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
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-rpm.c                    | 35 +++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h        |  4 +++
 3 files changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 944719bd586f..dd0def465c79 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -16,6 +16,7 @@ Required properties :
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
 			"qcom,rpmcc-apq8064", "qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
+			"qcom,rpmcc-ipq806x", "qcom,rpmcc"
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

