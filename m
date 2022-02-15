Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110F24B7863
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242253AbiBORKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 12:10:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242242AbiBORKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 12:10:21 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFF911ADD1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 09:10:08 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k127-20020a1ca185000000b0037bc4be8713so1945806wme.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+0fKnwESxbyMOLhjEzw7OuPxJ00+TW/f1NZ6wRXKcHg=;
        b=y8evBfxxr06DmveFG5bkY5xtuBahVoxKB1Ar7y3r4czWv77FRJknvOBAi0RbRreaSO
         108djHuiaPKrap3/4edZZB9aQjrcaDFVj6edJqC8H+w/TAvJG8HEb0yO19EAKuEog9Rp
         41wlmvjBO2F/MZhBLKVgW+1M9nJIVzEyz3yTocv/T06lHdmW71AyApRvaI0M6M9DFVCB
         yhnwL95De4M7+QS6rfK9qM/gWtVxkpRHy77h7bg05OiRaczjbPTZBnhtP8P7UKtSQU5N
         DtMTN0M/Fl7o86gt5uYI+Bkaksj1F9qVYRNLSy9Q0PXs90Q3ziwLxTKOx7XGj5yHH/u+
         QNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0fKnwESxbyMOLhjEzw7OuPxJ00+TW/f1NZ6wRXKcHg=;
        b=Jzx5HRRHlpUUs9+wTZG9mwS/3HPKzw+38k8AJgwFniL7vuFEwp/V18V9E/YetUDxoj
         +ih9j/YtQPGfyO1dzWVpKGz4x6F1m845YvADv4TjpzUTjDKQmwvgGVm4byNPAXJ+F0qW
         qYMo9SylciseUTjuDaVKzFrsB7yY0bQVXDmpo/SB0PgzBmiVHtGxmaZmMXLgHzUC1O5/
         UHpA8pyPT2QxsjWgdApwa0FwP8M39lvdkllJulmz7rpYc+LcoL2cmHelBivKPXCLHPRh
         /ESvmjxMExAlKvO0hSh7D3rwobn5DJ07xD/zhE10YM+9DUlAtzLFKcPDsOCmu6bEFfy7
         5S3Q==
X-Gm-Message-State: AOAM533U1yKv5IL1u05CFOHgjxfXeT1d/hA9qhzt46ZjyG/D8JvpqkeF
        nxEr/SrgDii/EW5lq3HRV4bthw==
X-Google-Smtp-Source: ABdhPJzl13GtD5wJDsDrbYBEmIF5AwmTP3jk7OQ82XRH6nJJMRjjnSwm1oTlS3duPhw36n1FhuNFdg==
X-Received: by 2002:a1c:29c7:0:b0:37b:b72f:e26 with SMTP id p190-20020a1c29c7000000b0037bb72f0e26mr3922442wmp.23.1644945006962;
        Tue, 15 Feb 2022 09:10:06 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id g5sm15558474wmk.38.2022.02.15.09.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 09:10:06 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v6 2/9] mfd: qcom-spmi-pmic: expose the PMIC revid information to clients
Date:   Tue, 15 Feb 2022 17:09:44 +0000
Message-Id: <20220215170951.1233375-3-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220215170951.1233375-1-caleb.connolly@linaro.org>
References: <20220215170951.1233375-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some PMIC functions such as the RRADC need to be aware of the PMIC
chip revision information to implement errata or otherwise adjust
behaviour, export the PMIC information to enable this.

This is specifically required to enable the RRADC to adjust
coefficients based on which chip fab the PMIC was produced in,
this can vary per unique device and therefore has to be read at
runtime.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/mfd/qcom-spmi-pmic.c      | 176 ++++++++++++++++++++----------
 include/soc/qcom/qcom-spmi-pmic.h |  60 ++++++++++
 2 files changed, 179 insertions(+), 57 deletions(-)
 create mode 100644 include/soc/qcom/qcom-spmi-pmic.h

diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index 1cacc00aa6c9..5e656485cd55 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -3,51 +3,26 @@
  * Copyright (c) 2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gfp.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/math.h>
+#include <linux/slab.h>
 #include <linux/spmi.h>
+#include <linux/types.h>
 #include <linux/regmap.h>
 #include <linux/of_platform.h>
+#include <soc/qcom/qcom-spmi-pmic.h>
 
 #define PMIC_REV2		0x101
 #define PMIC_REV3		0x102
 #define PMIC_REV4		0x103
 #define PMIC_TYPE		0x104
 #define PMIC_SUBTYPE		0x105
-
 #define PMIC_TYPE_VALUE		0x51
 
-#define COMMON_SUBTYPE		0x00
-#define PM8941_SUBTYPE		0x01
-#define PM8841_SUBTYPE		0x02
-#define PM8019_SUBTYPE		0x03
-#define PM8226_SUBTYPE		0x04
-#define PM8110_SUBTYPE		0x05
-#define PMA8084_SUBTYPE		0x06
-#define PMI8962_SUBTYPE		0x07
-#define PMD9635_SUBTYPE		0x08
-#define PM8994_SUBTYPE		0x09
-#define PMI8994_SUBTYPE		0x0a
-#define PM8916_SUBTYPE		0x0b
-#define PM8004_SUBTYPE		0x0c
-#define PM8909_SUBTYPE		0x0d
-#define PM8028_SUBTYPE		0x0e
-#define PM8901_SUBTYPE		0x0f
-#define PM8950_SUBTYPE		0x10
-#define PMI8950_SUBTYPE		0x11
-#define PM8998_SUBTYPE		0x14
-#define PMI8998_SUBTYPE		0x15
-#define PM8005_SUBTYPE		0x18
-#define PM660L_SUBTYPE		0x1A
-#define PM660_SUBTYPE		0x1B
-#define PM8150_SUBTYPE		0x1E
-#define PM8150L_SUBTYPE		0x1f
-#define PM8150B_SUBTYPE		0x20
-#define PMK8002_SUBTYPE		0x21
-#define PM8009_SUBTYPE		0x24
-#define PM8150C_SUBTYPE		0x26
-#define SMB2351_SUBTYPE		0x29
-
 static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,pm660",     .data = (void *)PM660_SUBTYPE },
 	{ .compatible = "qcom,pm660l",    .data = (void *)PM660L_SUBTYPE },
@@ -81,42 +56,118 @@ static const struct of_device_id pmic_spmi_id_table[] = {
 	{ }
 };
 
-static void pmic_spmi_show_revid(struct regmap *map, struct device *dev)
+/**
+ * @brief Get a pointer to the base PMIC device
+ *
+ * @param dev the pmic function device
+ * @return const struct qcom_spmi_pmic*
+ *
+ * A PMIC can be represented by multiple SPMI devices, but
+ * only the base PMIC device will contain a reference to
+ * the revision information.
+ *
+ * This function takes a pointer to a function device and
+ * returns a pointer to the base PMIC device.
+ */
+const struct qcom_spmi_pmic *qcom_pmic_get(struct device *dev)
+{
+	struct spmi_device *sdev;
+	struct device_node *spmi_bus;
+	struct device_node *other_usid;
+	int function_parent_usid, ret;
+	u32 reg[2];
+
+	if (!of_match_device(pmic_spmi_id_table, dev->parent))
+		return ERR_PTR(-EINVAL);
+
+	sdev = to_spmi_device(dev->parent);
+	if (!sdev)
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Quick return if the function device is already in the right
+	 * USID
+	 */
+	if (sdev->usid % 2 == 0)
+		return spmi_device_get_drvdata(sdev);
+
+	function_parent_usid = sdev->usid;
+
+	/*
+	 * Walk through the list of PMICs until we find the sibling USID.
+	 * The goal is the find to previous sibling. Assuming there is no
+	 * PMIC with more than 2 USIDs. We know that function_parent_usid
+	 * is one greater than the base USID.
+	 */
+	spmi_bus = of_get_parent(sdev->dev.parent->of_node);
+	do {
+		other_usid = of_get_next_child(spmi_bus, other_usid);
+		ret = of_property_read_u32_array(other_usid, "reg", reg, 2);
+		if (ret)
+			return ERR_PTR(ret);
+		sdev = spmi_device_from_of(other_usid);
+		if (sdev == NULL) {
+			/*
+			 * If the base USID for this PMIC hasn't probed yet
+			 * but the secondary USID has, then we need to defer
+			 * the function driver so that it will attempt to
+			 * probe again when the base USID is ready.
+			 */
+			if (reg[0] == function_parent_usid - 1)
+				return ERR_PTR(-EPROBE_DEFER);
+
+			continue;
+		}
+
+		if (reg[0] == function_parent_usid - 1)
+			return spmi_device_get_drvdata(sdev);
+	} while (other_usid->sibling);
+
+	return ERR_PTR(-ENODATA);
+}
+EXPORT_SYMBOL(qcom_pmic_get);
+
+static inline void pmic_print_info(struct device *dev, struct qcom_spmi_pmic *pmic)
+{
+	dev_info(dev, "%x: %s v%d.%d\n",
+		pmic->subtype, pmic->name, pmic->major, pmic->minor);
+}
+
+static int pmic_spmi_load_revid(struct regmap *map, struct device *dev,
+				 struct qcom_spmi_pmic *pmic)
 {
-	unsigned int rev2, minor, major, type, subtype;
-	const char *name = "unknown";
 	int ret, i;
 
-	ret = regmap_read(map, PMIC_TYPE, &type);
+	ret = regmap_read(map, PMIC_TYPE, &pmic->type);
 	if (ret < 0)
-		return;
+		return ret;
 
-	if (type != PMIC_TYPE_VALUE)
-		return;
+	if (pmic->type != PMIC_TYPE_VALUE)
+		return ret;
 
-	ret = regmap_read(map, PMIC_SUBTYPE, &subtype);
+	ret = regmap_read(map, PMIC_SUBTYPE, &pmic->subtype);
 	if (ret < 0)
-		return;
+		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(pmic_spmi_id_table); i++) {
-		if (subtype == (unsigned long)pmic_spmi_id_table[i].data)
+		if (pmic->subtype == (unsigned long)pmic_spmi_id_table[i].data)
 			break;
 	}
 
 	if (i != ARRAY_SIZE(pmic_spmi_id_table))
-		name = pmic_spmi_id_table[i].compatible;
+		pmic->name = devm_kstrdup_const(dev, pmic_spmi_id_table[i].compatible, GFP_KERNEL);
 
-	ret = regmap_read(map, PMIC_REV2, &rev2);
+	ret = regmap_read(map, PMIC_REV2, &pmic->rev2);
 	if (ret < 0)
-		return;
+		return ret;
 
-	ret = regmap_read(map, PMIC_REV3, &minor);
+	ret = regmap_read(map, PMIC_REV3, &pmic->minor);
 	if (ret < 0)
-		return;
+		return ret;
 
-	ret = regmap_read(map, PMIC_REV4, &major);
+	ret = regmap_read(map, PMIC_REV4, &pmic->major);
 	if (ret < 0)
-		return;
+		return ret;
 
 	/*
 	 * In early versions of PM8941 and PM8226, the major revision number
@@ -124,14 +175,14 @@ static void pmic_spmi_show_revid(struct regmap *map, struct device *dev)
 	 * Increment the major revision number here if the chip is an early
 	 * version of PM8941 or PM8226.
 	 */
-	if ((subtype == PM8941_SUBTYPE || subtype == PM8226_SUBTYPE) &&
-	    major < 0x02)
-		major++;
+	if ((pmic->subtype == PM8941_SUBTYPE || pmic->subtype == PM8226_SUBTYPE) &&
+	    pmic->major < 0x02)
+		pmic->major++;
 
-	if (subtype == PM8110_SUBTYPE)
-		minor = rev2;
+	if (pmic->subtype == PM8110_SUBTYPE)
+		pmic->minor = pmic->rev2;
 
-	dev_dbg(dev, "%x: %s v%d.%d\n", subtype, name, major, minor);
+	return 0;
 }
 
 static const struct regmap_config spmi_regmap_config = {
@@ -144,14 +195,25 @@ static const struct regmap_config spmi_regmap_config = {
 static int pmic_spmi_probe(struct spmi_device *sdev)
 {
 	struct regmap *regmap;
+	struct qcom_spmi_pmic *pmic;
+	int ret;
 
 	regmap = devm_regmap_init_spmi_ext(sdev, &spmi_regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	pmic = devm_kzalloc(&sdev->dev, sizeof(*pmic), GFP_KERNEL);
+	if (!pmic)
+		return -ENOMEM;
+
 	/* Only the first slave id for a PMIC contains this information */
-	if (sdev->usid % 2 == 0)
-		pmic_spmi_show_revid(regmap, &sdev->dev);
+	if (sdev->usid % 2 == 0) {
+		ret = pmic_spmi_load_revid(regmap, &sdev->dev, pmic);
+		if (ret < 0)
+			return ret;
+		spmi_device_set_drvdata(sdev, pmic);
+		pmic_print_info(&sdev->dev, pmic);
+	}
 
 	return devm_of_platform_populate(&sdev->dev);
 }
diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
new file mode 100644
index 000000000000..a8a77be22cfc
--- /dev/null
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2021 Linaro. All rights reserved.
+ * Copyright (c) 2021 Caleb Connolly <caleb.connolly@linaro.org>
+ */
+
+#ifndef __QCOM_PMIC_H__
+#define __QCOM_PMIC_H__
+
+#define COMMON_SUBTYPE		0x00
+#define PM8941_SUBTYPE		0x01
+#define PM8841_SUBTYPE		0x02
+#define PM8019_SUBTYPE		0x03
+#define PM8226_SUBTYPE		0x04
+#define PM8110_SUBTYPE		0x05
+#define PMA8084_SUBTYPE		0x06
+#define PMI8962_SUBTYPE		0x07
+#define PMD9635_SUBTYPE		0x08
+#define PM8994_SUBTYPE		0x09
+#define PMI8994_SUBTYPE		0x0a
+#define PM8916_SUBTYPE		0x0b
+#define PM8004_SUBTYPE		0x0c
+#define PM8909_SUBTYPE		0x0d
+#define PM8028_SUBTYPE		0x0e
+#define PM8901_SUBTYPE		0x0f
+#define PM8950_SUBTYPE		0x10
+#define PMI8950_SUBTYPE		0x11
+#define PM8998_SUBTYPE		0x14
+#define PMI8998_SUBTYPE		0x15
+#define PM8005_SUBTYPE		0x18
+#define PM660L_SUBTYPE		0x1A
+#define PM660_SUBTYPE		0x1B
+#define PM8150_SUBTYPE		0x1E
+#define PM8150L_SUBTYPE		0x1f
+#define PM8150B_SUBTYPE		0x20
+#define PMK8002_SUBTYPE		0x21
+#define PM8009_SUBTYPE		0x24
+#define PM8150C_SUBTYPE		0x26
+#define SMB2351_SUBTYPE		0x29
+
+#define PMI8998_FAB_ID_SMIC	0x11
+#define PMI8998_FAB_ID_GF	0x30
+
+#define PM660_FAB_ID_GF		0x0
+#define PM660_FAB_ID_TSMC	0x2
+#define PM660_FAB_ID_MX		0x3
+
+struct qcom_spmi_pmic {
+	unsigned int type;
+	unsigned int subtype;
+	unsigned int major;
+	unsigned int minor;
+	unsigned int rev2;
+	const char *name;
+};
+
+struct device;
+
+const struct qcom_spmi_pmic *qcom_pmic_get(struct device *dev);
+
+#endif /* __QCOM_PMIC_H__ */
-- 
2.35.1

