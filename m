Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2F84A7D4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 02:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348781AbiBCBJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 20:09:18 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48961 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbiBCBJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 20:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1643850558; x=1675386558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IR8y+ltA032z2Ta+zqPCPjXqBvA3dVQdBE1fpD2WrvM=;
  b=I9W62FQcNczXPvlPZrt0+nryom48xUwiPDdY7TD7EHpXnIAv963k1n+j
   oLWHvOz4ZyVfV1E1mXoUL1HTbK5HVEJ1Ix5GLKblkFw90I0fYWsH0tcWT
   iEyEBAC17Z8S1AbaTTnPMLGcr/TErVh7tQmMefR50prLYWnqpT1KsZFKs
   w=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 02 Feb 2022 17:09:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 17:09:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 2 Feb 2022 17:09:16 -0800
Received: from hu-amelende-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 2 Feb 2022 17:09:16 -0800
From:   Anjelique Melendez <quic_amelende@quicinc.com>
To:     <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <collinsd@codeaurora.org>,
        <bjorn.andersson@linaro.org>, <swboyd@chromium.org>,
        <skakit@codeaurora.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>
Subject: [PATCH v3 2/4] input: misc: pm8941-pwrkey: add support for PON GEN3 base addresses
Date:   Wed, 2 Feb 2022 17:08:05 -0800
Message-ID: <20220203010804.20883-3-quic_amelende@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203010804.20883-2-quic_amelende@quicinc.com>
References: <20220203010804.20883-2-quic_amelende@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, PON address is read from the "reg" property. For PON GEN3,
which starts with PMK8350, the "reg" property will have both the PON
HLOS and PON PBS addesses defined. Add support so that all PON
generations can be configured.

Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
---
 drivers/input/misc/pm8941-pwrkey.c | 31 +++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index e0240db12d4f..2a42a676b021 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -12,6 +12,7 @@
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
@@ -44,6 +45,7 @@ struct pm8941_data {
 	unsigned int	status_bit;
 	bool		supports_ps_hold_poff_config;
 	bool		supports_debounce_config;
+	bool		has_pon_pbs;
 	const char	*name;
 	const char	*phys;
 };
@@ -52,6 +54,7 @@ struct pm8941_pwrkey {
 	struct device *dev;
 	int irq;
 	u32 baseaddr;
+	u32 pon_pbs_baseaddr;
 	struct regmap *regmap;
 	struct input_dev *input;
 
@@ -167,6 +170,8 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 	struct pm8941_pwrkey *pwrkey;
 	bool pull_up;
 	struct device *parent;
+	struct device_node *regmap_node;
+	const __be32 *addr;
 	u32 req_delay;
 	int error;
 
@@ -188,8 +193,10 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 	pwrkey->data = of_device_get_match_data(&pdev->dev);
 
 	parent = pdev->dev.parent;
+	regmap_node = pdev->dev.of_node;
 	pwrkey->regmap = dev_get_regmap(parent, NULL);
 	if (!pwrkey->regmap) {
+		regmap_node = parent->of_node;
 		/*
 		 * We failed to get regmap for parent. Let's see if we are
 		 * a child of pon node and read regmap and reg from its
@@ -200,15 +207,21 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to locate regmap\n");
 			return -ENODEV;
 		}
+	}
 
-		error = of_property_read_u32(parent->of_node,
-					     "reg", &pwrkey->baseaddr);
-	} else {
-		error = of_property_read_u32(pdev->dev.of_node, "reg",
-					     &pwrkey->baseaddr);
+	addr = of_get_address(regmap_node, 0, NULL, NULL);
+	if (!addr) {
+		dev_err(&pdev->dev, "reg property missing\n");
+		return -EINVAL;
+	}
+	pwrkey->baseaddr = be32_to_cpup(*addr);
+
+	if (pwrkey->data->has_pon_pbs) {
+		/* PON_PBS base address is optional */
+		addr = of_get_address(regmap_node, 1, NULL, NULL);
+		if (addr)
+			pwrkey->pon_pbs_baseaddr = be32_to_cpup(*addr);
 	}
-	if (error)
-		return error;
 
 	pwrkey->irq = platform_get_irq(pdev, 0);
 	if (pwrkey->irq < 0)
@@ -316,6 +329,7 @@ static const struct pm8941_data pwrkey_data = {
 	.phys = "pm8941_pwrkey/input0",
 	.supports_ps_hold_poff_config = true,
 	.supports_debounce_config = true,
+	.has_pon_pbs = false,
 };
 
 static const struct pm8941_data resin_data = {
@@ -325,6 +339,7 @@ static const struct pm8941_data resin_data = {
 	.phys = "pm8941_resin/input0",
 	.supports_ps_hold_poff_config = true,
 	.supports_debounce_config = true,
+	.has_pon_pbs = false,
 };
 
 static const struct pm8941_data pon_gen3_pwrkey_data = {
@@ -333,6 +348,7 @@ static const struct pm8941_data pon_gen3_pwrkey_data = {
 	.phys = "pmic_pwrkey/input0",
 	.supports_ps_hold_poff_config = false,
 	.supports_debounce_config = false,
+	.has_pon_pbs = true,
 };
 
 static const struct pm8941_data pon_gen3_resin_data = {
@@ -341,6 +357,7 @@ static const struct pm8941_data pon_gen3_resin_data = {
 	.phys = "pmic_resin/input0",
 	.supports_ps_hold_poff_config = false,
 	.supports_debounce_config = false,
+	.has_pon_pbs = true,
 };
 
 static const struct of_device_id pm8941_pwr_key_id_table[] = {
-- 
2.34.1

