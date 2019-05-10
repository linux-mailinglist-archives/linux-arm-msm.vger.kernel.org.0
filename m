Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA010197AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 06:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfEJEe4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 00:34:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40484 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbfEJEe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 00:34:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id u17so2500494pfn.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2019 21:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7D9fT9nrITboyJ+SOXix9/gHXfGWOiHJwaPk2qVUU3c=;
        b=YTMOEM9o3me4VlRS+ZfA4B///ON/wFOPFUMHSfZWcslGeKldYyWK8bbE6t9cha00Jv
         5TMhjzu3Y4+hciowkOsucL14c+gFUxPYBx50CA+ZvCqWkYSkfpcnSGhdFx8ld8ZI0PLT
         rGzjFgde4ZnB2nwF9UDUYK4pZfry4RfWgHkTRVqoXWFFVpbiatqDUcpLNKCBeNchyeW9
         u3kRpzwlD5al65AgnOyDxe9IiKb14Hw0vRR3mUejE+G3niYqda3Dxr3dwvJuXK3BO62w
         HPtHTQPseVN9tFLUNWGJ9B7kEUd4hInGRgGgPJnUlU24d5GkbVrpV8PjrHB6cmyLcoEM
         gnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7D9fT9nrITboyJ+SOXix9/gHXfGWOiHJwaPk2qVUU3c=;
        b=LjlBdy97pDs8SKC5gAH3ehQFZsKyfpdpbwVjwstqQGxDIGaSKqgorK16Jv4/TXuD8y
         NRaMAZOVzutvZ8H06g48y1/9KFeCodBZIzJ86fn9WDh34+XzjdMRyYQ7KmKhC6Wpizht
         FHCblRdeVWdYEWZ6n3bjEOk6H9QQZerP3uFs4VmkNcKwb8k2xTqlrlM1Gn8RST6sOPgk
         qEa2b3lfxVD6cl6oQFwJi2csSLo8eqWPLvcljNUp5dwXOp/I1raJ2gg4Ih5iylJLADCQ
         JoGTgMJBPHKugw02lCniCtoMdYEi2wQwLzPoWhlNsNdvt4nQhsg8FbIBtj8VymL+9OGA
         njNg==
X-Gm-Message-State: APjAAAWiaVmys+5EZwtYjqNbT0dwgEiMFLW2yA5meY4Os5h1oqh1irRi
        nlAqofsYlFJzSlH/rfHW3/FI1A==
X-Google-Smtp-Source: APXvYqxIprToIswQFMOzfCd48VF5TpWAoqllvK2FOj2FFIKi9CnO2e1KIMoeH01AgQCujvCKMKg35w==
X-Received: by 2002:a63:4621:: with SMTP id t33mr10954607pga.246.1557462867214;
        Thu, 09 May 2019 21:34:27 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s17sm4785317pfm.149.2019.05.09.21.34.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 21:34:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] remoteproc: qcom: qdsp6-adsp: Add support for QCS404 CDSP
Date:   Thu,  9 May 2019 21:34:15 -0700
Message-Id: <20190510043421.31393-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the clock list to adsp_pil_data, make the pdc_reset optional and
make the driver directly enable the xo, sleep and core clocks.

The three clocks are previously toggled through the clock controller,
but that means the same hardware block needs to be mapped in both
drivers. Making the remoteproc driver enable the clocks is a nop when
using the clock controller, but allow us to remove the clocks from the
clock controller.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 73 ++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 1f3ef9ee493c..e953886b2eb7 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -46,11 +46,9 @@
 #define LPASS_PWR_ON_REG		0x10
 #define LPASS_HALTREQ_REG		0x0
 
-/* list of clocks required by ADSP PIL */
-static const char * const adsp_clk_id[] = {
-	"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
-	"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core",
-};
+#define QDSP6SS_XO_CBCR		0x38
+#define QDSP6SS_CORE_CBCR	0x20
+#define QDSP6SS_SLEEP_CBCR	0x3c
 
 struct adsp_pil_data {
 	int crash_reason_smem;
@@ -59,6 +57,9 @@ struct adsp_pil_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+
+	const char **clk_ids;
+	int num_clks;
 };
 
 struct qcom_adsp {
@@ -75,7 +76,7 @@ struct qcom_adsp {
 	void __iomem *qdsp6ss_base;
 
 	struct reset_control *pdc_sync_reset;
-	struct reset_control *cc_lpass_restart;
+	struct reset_control *restart;
 
 	struct regmap *halt_map;
 	unsigned int halt_lpass;
@@ -143,7 +144,7 @@ static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
 	/* Assert the LPASS PDC Reset */
 	reset_control_assert(adsp->pdc_sync_reset);
 	/* Place the LPASS processor into reset */
-	reset_control_assert(adsp->cc_lpass_restart);
+	reset_control_assert(adsp->restart);
 	/* wait after asserting subsystem restart from AOSS */
 	usleep_range(200, 300);
 
@@ -153,7 +154,7 @@ static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
 	/* De-assert the LPASS PDC Reset */
 	reset_control_deassert(adsp->pdc_sync_reset);
 	/* Remove the LPASS reset */
-	reset_control_deassert(adsp->cc_lpass_restart);
+	reset_control_deassert(adsp->restart);
 	/* wait after de-asserting subsystem restart from AOSS */
 	usleep_range(200, 300);
 
@@ -192,6 +193,15 @@ static int adsp_start(struct rproc *rproc)
 		goto disable_power_domain;
 	}
 
+	/* Enable the XO clock */
+	writel(1, adsp->qdsp6ss_base + QDSP6SS_XO_CBCR);
+
+	/* Enable the QDSP6SS sleep clock */
+	writel(1, adsp->qdsp6ss_base + QDSP6SS_SLEEP_CBCR);
+
+	/* Enable the QDSP6 core clock */
+	writel(1, adsp->qdsp6ss_base + QDSP6SS_CORE_CBCR);
+
 	/* Program boot address */
 	writel(adsp->mem_phys >> 4, adsp->qdsp6ss_base + RST_EVB_REG);
 
@@ -280,8 +290,9 @@ static const struct rproc_ops adsp_ops = {
 	.load = adsp_load,
 };
 
-static int adsp_init_clock(struct qcom_adsp *adsp)
+static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
 {
+	int num_clks = 0;
 	int i, ret;
 
 	adsp->xo = devm_clk_get(adsp->dev, "xo");
@@ -292,32 +303,39 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
 		return ret;
 	}
 
-	adsp->num_clks = ARRAY_SIZE(adsp_clk_id);
+	for (i = 0; clk_ids[i]; i++)
+		num_clks++;
+
+	adsp->num_clks = num_clks;
 	adsp->clks = devm_kcalloc(adsp->dev, adsp->num_clks,
 				sizeof(*adsp->clks), GFP_KERNEL);
 	if (!adsp->clks)
 		return -ENOMEM;
 
 	for (i = 0; i < adsp->num_clks; i++)
-		adsp->clks[i].id = adsp_clk_id[i];
+		adsp->clks[i].id = clk_ids[i];
 
 	return devm_clk_bulk_get(adsp->dev, adsp->num_clks, adsp->clks);
 }
 
 static int adsp_init_reset(struct qcom_adsp *adsp)
 {
-	adsp->pdc_sync_reset = devm_reset_control_get_exclusive(adsp->dev,
+	adsp->pdc_sync_reset = devm_reset_control_get_optional_exclusive(adsp->dev,
 			"pdc_sync");
 	if (IS_ERR(adsp->pdc_sync_reset)) {
 		dev_err(adsp->dev, "failed to acquire pdc_sync reset\n");
 		return PTR_ERR(adsp->pdc_sync_reset);
 	}
 
-	adsp->cc_lpass_restart = devm_reset_control_get_exclusive(adsp->dev,
-			"cc_lpass");
-	if (IS_ERR(adsp->cc_lpass_restart)) {
-		dev_err(adsp->dev, "failed to acquire cc_lpass restart\n");
-		return PTR_ERR(adsp->cc_lpass_restart);
+	adsp->restart = devm_reset_control_get_optional_exclusive(adsp->dev, "restart");
+
+	/* Fall back to the  old "cc_lpass" if "restart" is absent */
+	if (!adsp->restart)
+		adsp->restart = devm_reset_control_get_exclusive(adsp->dev, "cc_lpass");
+
+	if (IS_ERR(adsp->restart)) {
+		dev_err(adsp->dev, "failed to acquire restart\n");
+		return PTR_ERR(adsp->restart);
 	}
 
 	return 0;
@@ -415,7 +433,7 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = adsp_init_clock(adsp);
+	ret = adsp_init_clock(adsp, desc->clk_ids);
 	if (ret)
 		goto free_rproc;
 
@@ -479,9 +497,28 @@ static const struct adsp_pil_data adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.clk_ids = (const char*[]) {
+		"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
+		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
+	},
+	.num_clks = 7,
+};
+
+static const struct adsp_pil_data cdsp_resource_init = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.clk_ids = (const char*[]) {
+		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave", "q6ss_master",
+		"q6_axim", NULL
+	},
+	.num_clks = 7,
 };
 
 static const struct of_device_id adsp_of_match[] = {
+	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
 	{ },
 };
-- 
2.18.0

