Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED38316429
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 11:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhBJKp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 05:45:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:50306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230207AbhBJKnv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 05:43:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5222564E32;
        Wed, 10 Feb 2021 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612953790;
        bh=FbKU4ZoekI9wkLHZIUxTbtVl86xog9jbzjfLhHehSHs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nmeo9baHDp31ABsxdSlQRXa311U+wxocGjYhJUoQ1M/15jN27P2QwUDEqWpWzo+lk
         kt1xRb8KG6fy/g7/j88Hyp+nzK4kmDSOJfrieZvH2xPYP74+XflaRojptvRAWcBQVZ
         uAUERNTS1ANWQ347SeRhy/JlJkblIiPKr8a2n90iZTyBDLEs3pdFuiVMO2QeTz/B54
         lo5PTQxkjYxyUo5XNyAnpGsJdpC4/hZ/i8/cO08vABohcCW/DWucSHAwXPa7E+TtiZ
         xL4JrIJM1bVKQ3Sm9m9sDrImmhGqaxkszS2qMvP2Ul4YTX2FF1CuJGbCjZut8HAwWw
         haXmEBw9wCwZA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: rpmhpd: Add SM8350 power domains
Date:   Wed, 10 Feb 2021 16:12:57 +0530
Message-Id: <20210210104257.339462-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210104257.339462-1-vkoul@kernel.org>
References: <20210210104257.339462-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the power domains found in SM8350 SoC.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/rpmhpd.c              | 37 ++++++++++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h | 15 +++++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 7ce06356d24c..1bd191d5824f 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -200,6 +200,42 @@ static const struct rpmhpd_desc sm8250_desc = {
 	.num_pds = ARRAY_SIZE(sm8250_rpmhpds),
 };
 
+/* SM8350 Power domains */
+static struct rpmhpd sm8350_mxc_ao;
+static struct rpmhpd sm8350_mxc = {
+	.pd = { .name = "mxc", },
+	.peer = &sm8150_mmcx_ao,
+	.res_name = "mxc.lvl",
+};
+
+static struct rpmhpd sm8350_mxc_ao = {
+	.pd = { .name = "mxc_ao", },
+	.active_only = true,
+	.peer = &sm8350_mxc,
+	.res_name = "mxc.lvl",
+};
+
+static struct rpmhpd *sm8350_rpmhpds[] = {
+	[SM8350_CX] = &sdm845_cx,
+	[SM8350_CX_AO] = &sdm845_cx_ao,
+	[SM8350_EBI] = &sdm845_ebi,
+	[SM8350_GFX] = &sdm845_gfx,
+	[SM8350_LCX] = &sdm845_lcx,
+	[SM8350_LMX] = &sdm845_lmx,
+	[SM8350_MMCX] = &sm8150_mmcx,
+	[SM8350_MMCX_AO] = &sm8150_mmcx_ao,
+	[SM8350_MX] = &sdm845_mx,
+	[SM8350_MX_AO] = &sdm845_mx_ao,
+	[SM8350_MXC] = &sm8350_mxc,
+	[SM8350_MXC_AO] = &sm8350_mxc_ao,
+	[SM8350_MSS] = &sdm845_mss,
+};
+
+static const struct rpmhpd_desc sm8350_desc = {
+	.rpmhpds = sm8350_rpmhpds,
+	.num_pds = ARRAY_SIZE(sm8350_rpmhpds),
+};
+
 /* SC7180 RPMH powerdomains */
 static struct rpmhpd *sc7180_rpmhpds[] = {
 	[SC7180_CX] = &sdm845_cx,
@@ -223,6 +259,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
 	{ .compatible = "qcom,sm8250-rpmhpd", .data = &sm8250_desc },
+	{ .compatible = "qcom,sm8350-rpmhpd", .data = &sm8350_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpmhpd_match_table);
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 7714487ac76b..64043a2a4411 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -45,6 +45,21 @@
 #define SM8250_MX	8
 #define SM8250_MX_AO	9
 
+/* SM8350 Power Domain Indexes */
+#define SM8350_CX	0
+#define SM8350_CX_AO	1
+#define SM8350_EBI	2
+#define SM8350_GFX	3
+#define SM8350_LCX	4
+#define SM8350_LMX	5
+#define SM8350_MMCX	6
+#define SM8350_MMCX_AO	7
+#define SM8350_MX	8
+#define SM8350_MX_AO	9
+#define SM8350_MXC	10
+#define SM8350_MXC_AO	11
+#define SM8350_MSS	12
+
 /* SC7180 Power Domain Indexes */
 #define SC7180_CX	0
 #define SC7180_CX_AO	1
-- 
2.26.2

