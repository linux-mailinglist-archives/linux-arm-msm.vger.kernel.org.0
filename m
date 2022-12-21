Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98349652B3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 03:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234383AbiLUCFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 21:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234172AbiLUCFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 21:05:30 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789151FCD8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 18:05:29 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id z26so21349278lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 18:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/BQD6ictCOHwYbYSVlKt0RDdfL96pWl64Rc+vqBnZ0=;
        b=SDhBvHxXCZHOnBZwi3r5ApQ4BrL82hXiiHBnb2v9OVkwCic02ReNona3SU9DDgVlUs
         XCVVnvSCdTWDIrsOpQ02braBfRUjidrPXreSKrymbIaxN7NiSIQluPj2zVi0bjHdU88Y
         zls2Xq6IAPS5NFtc0/Q3fI6iXe6Zc4ML5B5X4UaM5XDxCLee79PuZ1dZ8qlQjEBZD6/5
         XI/7ZVnY8UxfKR4zAnXThY4fSuq8sS49HYxdblOABJ2D2ivEInLjfe2awKoOsozbIfIw
         XZ9L+G2tuIRLojb2znPW5A3ppgT5DH+uYKPm4nBfFf1vfrUZwiyQFx34Hg+NCOiT8znu
         10RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/BQD6ictCOHwYbYSVlKt0RDdfL96pWl64Rc+vqBnZ0=;
        b=zEj9vX29Bt6GxTg+d3NvuQcPHLpZO48rGpGxeepxG3iRiQJHPrFFWhI3uNj30CaImz
         mfRnNleDjpDUQr6FD0anNCbTB1xNX0BncvQSN75d+Re+/d4KDSBkmKkOWVkGgM/nXW2j
         3xQrSZacLrWuxgboL4H/M0TG5A5H20enCRf9GxO6HujbtiddEVItnRQr+fHEy2BTMyhW
         28BXmLpYr/Ws4Ue3PxPhQH1sujiNjfj4oFitdDmTSn7Pe7NMg9RTfmZx4IBJi2x0JTDy
         WYP/eL212MyrurLmWWM63d7Y4/0Lig2+iTUAsWy1tGJEML8RNS+A+bUXdXpoIWDXT2wl
         GdJw==
X-Gm-Message-State: AFqh2kp+mZpTvto/4qZ4bhXgcDKZeAr3kZVbgEoeOlX1++FqurRmyMAA
        ph7xPysTaS8N6sZUgmw31NyA8A==
X-Google-Smtp-Source: AMrXdXuWq4+asHwqXIEf9RR1V6cAU+mXYZ2Rue0kNdN7pH9Hxp7AZFEpjORh2tgXNqmWDIQ0QGfI4Q==
X-Received: by 2002:a19:5005:0:b0:4a4:68b8:c2dd with SMTP id e5-20020a195005000000b004a468b8c2ddmr1303434lfb.52.1671588329037;
        Tue, 20 Dec 2022 18:05:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b004b257fef958sm1673048lfr.94.2022.12.20.18.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 18:05:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 09/20] thermal/drivers/tsens: Support using nvmem cells for calibration data
Date:   Wed, 21 Dec 2022 04:05:09 +0200
Message-Id: <20221221020520.1326964-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
References: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a unified function using nvmem cells for parsing the calibration
data rather than parsing the calibration blob manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v0_1.c | 15 ++++++
 drivers/thermal/qcom/tsens-v1.c   | 11 ++++-
 drivers/thermal/qcom/tsens.c      | 76 +++++++++++++++++++++++++++++++
 drivers/thermal/qcom/tsens.h      |  5 ++
 4 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index be173220a939..a6c2b2b76264 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -229,6 +229,11 @@ static int calibrate_8916(struct tsens_priv *priv)
 	u32 p1[5], p2[5];
 	int mode = 0;
 	u32 *qfprom_cdata, *qfprom_csel;
+	int ret;
+
+	ret = tsens_calibrate_nvmem(priv, 3);
+	if (!ret)
+		return 0;
 
 	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
 	if (IS_ERR(qfprom_cdata))
@@ -286,6 +291,11 @@ static int calibrate_8939(struct tsens_priv *priv)
 	int mode = 0;
 	u32 *qfprom_cdata;
 	u32 cdata[6];
+	int ret;
+
+	ret = tsens_calibrate_common(priv);
+	if (!ret)
+		return 0;
 
 	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
 	if (IS_ERR(qfprom_cdata))
@@ -491,6 +501,11 @@ static int calibrate_9607(struct tsens_priv *priv)
 	u32 p1[5], p2[5];
 	int mode = 0;
 	u32 *qfprom_cdata;
+	int ret;
+
+	ret = tsens_calibrate_common(priv);
+	if (!ret)
+		return 0;
 
 	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
 	if (IS_ERR(qfprom_cdata))
diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 83c2853546d0..5bba75a845c5 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -143,7 +143,11 @@ static int calibrate_v1(struct tsens_priv *priv)
 	u32 p1[10], p2[10];
 	u32 mode = 0, lsb = 0, msb = 0;
 	u32 *qfprom_cdata;
-	int i;
+	int i, ret;
+
+	ret = tsens_calibrate_common(priv);
+	if (!ret)
+		return 0;
 
 	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
 	if (IS_ERR(qfprom_cdata))
@@ -209,6 +213,11 @@ static int calibrate_8976(struct tsens_priv *priv)
 	u32 p1[11], p2[11];
 	int mode = 0, tmp = 0;
 	u32 *qfprom_cdata;
+	int ret;
+
+	ret = tsens_calibrate_common(priv);
+	if (!ret)
+		return 0;
 
 	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
 	if (IS_ERR(qfprom_cdata))
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index b191e19df93d..68aef0ed6182 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -70,6 +70,82 @@ char *qfprom_read(struct device *dev, const char *cname)
 	return ret;
 }
 
+int tsens_calibrate_nvmem(struct tsens_priv *priv, int shift)
+{
+	u32 mode;
+	u32 base1, base2;
+	u32 p1[MAX_SENSORS], p2[MAX_SENSORS];
+	char name[] = "sXX_pY"; /* s10_p1 */
+	int i, ret;
+
+	if (priv->num_sensors > MAX_SENSORS)
+		return -EINVAL;
+
+	ret = nvmem_cell_read_variable_le_u32(priv->dev, "mode", &mode);
+	if (ret == -ENOENT)
+		dev_warn(priv->dev, "Please migrate to separate nvmem cells for calibration data\n");
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(priv->dev, "calibration mode is %d\n", mode);
+
+	ret = nvmem_cell_read_variable_le_u32(priv->dev, "base1", &base1);
+	if (ret < 0)
+		return ret;
+
+	ret = nvmem_cell_read_variable_le_u32(priv->dev, "base2", &base2);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < priv->num_sensors; i++) {
+		ret = snprintf(name, sizeof(name), "s%d_p1", i);
+		if (ret < 0)
+			return ret;
+
+		ret = nvmem_cell_read_variable_le_u32(priv->dev, name, &p1[i]);
+		if (ret)
+			return ret;
+
+		ret = snprintf(name, sizeof(name), "s%d_p2", i);
+		if (ret < 0)
+			return ret;
+
+		ret = nvmem_cell_read_variable_le_u32(priv->dev, name, &p2[i]);
+		if (ret)
+			return ret;
+	}
+
+	switch (mode) {
+	case ONE_PT_CALIB:
+		for (i = 0; i < priv->num_sensors; i++)
+			p1[i] = p1[i] + (base1 << shift);
+		break;
+	case TWO_PT_CALIB:
+		for (i = 0; i < priv->num_sensors; i++)
+			p2[i] = (p2[i] + base2) << shift;
+		fallthrough;
+	case ONE_PT_CALIB2:
+		for (i = 0; i < priv->num_sensors; i++)
+			p1[i] = (p1[i] + base1) << shift;
+		break;
+	default:
+		dev_dbg(priv->dev, "calibrationless mode\n");
+		for (i = 0; i < priv->num_sensors; i++) {
+			p1[i] = 500;
+			p2[i] = 780;
+		}
+	}
+
+	compute_intercept_slope(priv, p1, p2, mode);
+
+	return 0;
+}
+
+int tsens_calibrate_common(struct tsens_priv *priv)
+{
+	return tsens_calibrate_nvmem(priv, 2);
+}
+
 /*
  * Use this function on devices where slope and offset calculations
  * depend on calibration data read from qfprom. On others the slope
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 7dd5fc246894..645ae02438fa 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -6,6 +6,7 @@
 #ifndef __QCOM_TSENS_H__
 #define __QCOM_TSENS_H__
 
+#define NO_PT_CALIB		0x0
 #define ONE_PT_CALIB		0x1
 #define ONE_PT_CALIB2		0x2
 #define TWO_PT_CALIB		0x3
@@ -17,6 +18,8 @@
 #define THRESHOLD_MAX_ADC_CODE	0x3ff
 #define THRESHOLD_MIN_ADC_CODE	0x0
 
+#define MAX_SENSORS 16
+
 #include <linux/interrupt.h>
 #include <linux/thermal.h>
 #include <linux/regmap.h>
@@ -582,6 +585,8 @@ struct tsens_priv {
 };
 
 char *qfprom_read(struct device *dev, const char *cname);
+int tsens_calibrate_nvmem(struct tsens_priv *priv, int shift);
+int tsens_calibrate_common(struct tsens_priv *priv);
 void compute_intercept_slope(struct tsens_priv *priv, u32 *pt1, u32 *pt2, u32 mode);
 int init_common(struct tsens_priv *priv);
 int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp);
-- 
2.35.1

