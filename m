Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA23641AEC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 06:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbiLDF7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 00:59:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbiLDF7S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 00:59:18 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CFE1A38D
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 21:59:17 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id r8so9946307ljn.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 21:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OwssKtXg3EJqooC2cqfgJUJeGY1anV9YAhBRxkY5qI=;
        b=tp+Hpy6abrFbtE6XkhutzDxh2eHpnzOU4svi0G4WsbMQ5/ffhnPFfSWMOdf/8BKHXm
         3JfBxoEZ0r1EB/DzaP9MDBsijgPAtdSgA1TkLvumiFauKp1Vg28+3l+DBvMCyAuxpXPI
         Dem2DIBAmQJgfIxtGZ13wpUc2QQ8gKJK1j+/lmKnpfTP1SsoRfXuk3ICHkH4UHsNhv2B
         J4eYLFigQRSO3ldw18IoNvADvCNMYVsGch6rH1sl78V846efuaY/mLmXZvDNrxZFLEKE
         +DjYooOC5hNcBeIoo+asyeTGQN3SMwyhmOLeiL3o+/98akAzWs9sEACLUqBWxezUg4xs
         e/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OwssKtXg3EJqooC2cqfgJUJeGY1anV9YAhBRxkY5qI=;
        b=knjPHtFSUNRVPM+Ay5/iBTjnSMthzIcgtz4XFHGUMbxE8LFYEdVbqUD31qkDTsMNix
         JJq7dJekEpK1w3PbaIzyF1jyh+jvGJbHzNRpH5D5Ij8c51wuxnY239e0c+lWvTg7DwdM
         UEq8bH9nnU6qwt4xul0svBFER7LOAp56B+q3SBYrkTdix+CPQOh2KaYL/ERK8t4KYwp1
         wDPwfuQooTtm8rSGE8ViKX+ifNBGuLkM0vlvkm4zLnntM1AhFkgdlVHQZJkOo8WTgUq8
         08f/6Ex4Kkk9CoswT+/bhhrJ0Ux1vpJKVegChYBedupav7XBiot2b3Ka20k7gj95v5kK
         Se4Q==
X-Gm-Message-State: ANoB5pl56Rn9cT0RmuJacI8IIHPZV4pXni9LQCeNql5YIA1zVfBV+xyL
        UdxDwdYFFkAG2lzTCR48S0+oHA==
X-Google-Smtp-Source: AA0mqf5ioRD8Rp3a4DFBc+9ha/YTMlFmINhkBBAsYBYwy3ftwJ7f02WlsXMZj3e0Hm5OZ5wE1KWh0w==
X-Received: by 2002:a2e:8887:0:b0:279:f19b:2192 with SMTP id k7-20020a2e8887000000b00279f19b2192mr931872lji.471.1670133556578;
        Sat, 03 Dec 2022 21:59:16 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004917a30c82bsm1650028lfo.153.2022.12.03.21.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 21:59:16 -0800 (PST)
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
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 07/15] thermal/drivers/tsens: Support using nvmem cells for calibration data
Date:   Sun,  4 Dec 2022 07:59:01 +0200
Message-Id: <20221204055909.1351895-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
References: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
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
 drivers/thermal/qcom/tsens-v1.c   |  6 ++-
 drivers/thermal/qcom/tsens.c      | 76 +++++++++++++++++++++++++++++++
 drivers/thermal/qcom/tsens.h      |  5 ++
 4 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 94bb185c5aae..56c4e47db0c0 100644
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
index 119b619e72c2..2684c4a0941a 100644
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
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 252c5ffdd1b6..9f1f9ca7963d 100644
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
index 4f969dd7dc47..8d1b83acdb95 100644
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
@@ -576,6 +579,8 @@ struct tsens_priv {
 };
 
 char *qfprom_read(struct device *dev, const char *cname);
+int tsens_calibrate_nvmem(struct tsens_priv *priv, int shift);
+int tsens_calibrate_common(struct tsens_priv *priv);
 void compute_intercept_slope(struct tsens_priv *priv, u32 *pt1, u32 *pt2, u32 mode);
 int init_common(struct tsens_priv *priv);
 int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp);
-- 
2.35.1

