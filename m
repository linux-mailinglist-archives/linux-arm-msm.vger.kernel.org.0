Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA0CDB9D62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 12:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407522AbfIUKRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 06:17:51 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34845 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407520AbfIUKRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 06:17:51 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so9163362wrt.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GWUzMPCc6TH1txHPz4Yliy1Owqh9isT2CvyPJKd5a+4=;
        b=meuD/fQ7tJeYz0niIFLX0inYPMXEAf1xTqlZ3jQaBvr5OO2FyIhjjDwHxA+B+b65Wi
         xvv0kJwfP8SIUiXqoLq/oc8FmFPA7DYBUH3+AOhM1uyiXArgSdVR8dgBJk5uF9PJ9MlW
         rwZLcm6qXaV3L7KR+8q5aoPLvx9Pq6utPmiuHLQQSxQQKjj+ilFmGHei/XscAGCUw8Vu
         oGlNnPc+kwxQ49jruxxOWm2oITmHYlBnAjjPJl1m3J1RanVjO4sOYngtxVgXp1iYECGM
         v9s0g1GcAZNRnm07jqTUMRiDBcMcfb7pa/nJCD4NlYWyYTDfO2jV6X8nCLFNeMN2WZIm
         LXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GWUzMPCc6TH1txHPz4Yliy1Owqh9isT2CvyPJKd5a+4=;
        b=E+1y1BTR3CnPrLXpa035uokR4jgMawEcDiLqzr5FzCrww2qSvX6/yJoTt03htEsKIG
         RIEaN69zx8hDKPoEwVULykKpzhXoXMRIJQUDu4U1KrfDfp4qMeymw5E3VtfSPj8xIoLO
         Sdbg+AED6X6qtYk4dt6P3B7qS8EfMWUxYsZ7PHEiPCzyFudsfcdj9CIjTeforNYUecGe
         8R4/H6tKPVlL83f7GYAWGGkorWlbn3izj665+Z6yzsAOKnOHnQOyrVyCt8IgqXsWFjWH
         aLKgPkVEcqqELctgDqqzVNhIQML7A4xPxWmDsmAGC3I0lu7/DUXOTTmdUegSPqS1rf+O
         Lifg==
X-Gm-Message-State: APjAAAU3dfmjKp9uCM8+eu7F6aaDhOanoXcWG1VaKSlSlPPGiWgRX9RI
        v7KSHHJkQCwcF8ZwpRMmHDMuyS4E6gY=
X-Google-Smtp-Source: APXvYqygt9kaR9h3hOUFZcv35G6/xtuL3D5yx2twlQ8I8PorC8+y/7aj9AqBqjrYO6mbEOcVGdbjig==
X-Received: by 2002:a5d:458c:: with SMTP id p12mr2728043wrq.356.1569061068104;
        Sat, 21 Sep 2019 03:17:48 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id s19sm8313020wrb.14.2019.09.21.03.17.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:17:47 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, amit.kucheria@linaro.org
Subject: [PATCH 1/2] thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976
Date:   Sat, 21 Sep 2019 12:17:39 +0200
Message-Id: <20190921101740.430-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921101740.430-1-kholk11@gmail.com>
References: <20190921101740.430-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

Add support for reading calibrated value from thermistors in
MSM8956, MSM8976 and their APQ variants.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 drivers/thermal/qcom/tsens-v1.c | 188 ++++++++++++++++++++++++++++++++
 drivers/thermal/qcom/tsens.c    |   3 +
 drivers/thermal/qcom/tsens.h    |   2 +-
 3 files changed, 192 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 10b595d4f619..42729bc4ad43 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -18,6 +18,68 @@
 #define TM_Sn_STATUS_OFF			0x0044
 #define TM_TRDY_OFF				0x0084
 
+/* eeprom layout data for msm8956/76 (v1) */
+#define MSM8976_BASE0_MASK	0xff
+#define MSM8976_BASE1_MASK	0xff
+#define MSM8976_BASE1_SHIFT	8
+
+#define MSM8976_S0_P1_MASK	0x3f00
+#define MSM8976_S1_P1_MASK	0x3f00000
+#define MSM8976_S2_P1_MASK	0x3f
+#define MSM8976_S3_P1_MASK	0x3f000
+#define MSM8976_S4_P1_MASK	0x3f00
+#define MSM8976_S5_P1_MASK	0x3f00000
+#define MSM8976_S6_P1_MASK	0x3f
+#define MSM8976_S7_P1_MASK	0x3f000
+#define MSM8976_S8_P1_MASK	0x1f8
+#define MSM8976_S9_P1_MASK	0x1f8000
+#define MSM8976_S10_P1_MASK	0xf8000000
+#define MSM8976_S10_P1_MASK_1	0x1
+
+#define MSM8976_S0_P2_MASK	0xfc000
+#define MSM8976_S1_P2_MASK	0xfc000000
+#define MSM8976_S2_P2_MASK	0xfc0
+#define MSM8976_S3_P2_MASK	0xfc0000
+#define MSM8976_S4_P2_MASK	0xfc000
+#define MSM8976_S5_P2_MASK	0xfc000000
+#define MSM8976_S6_P2_MASK	0xfc0
+#define MSM8976_S7_P2_MASK	0xfc0000
+#define MSM8976_S8_P2_MASK	0x7e00
+#define MSM8976_S9_P2_MASK	0x7e00000
+#define MSM8976_S10_P2_MASK	0x7e
+
+#define MSM8976_S0_P1_SHIFT	8
+#define MSM8976_S1_P1_SHIFT	20
+#define MSM8976_S2_P1_SHIFT	0
+#define MSM8976_S3_P1_SHIFT	12
+#define MSM8976_S4_P1_SHIFT	8
+#define MSM8976_S5_P1_SHIFT	20
+#define MSM8976_S6_P1_SHIFT	0
+#define MSM8976_S7_P1_SHIFT	12
+#define MSM8976_S8_P1_SHIFT	3
+#define MSM8976_S9_P1_SHIFT	15
+#define MSM8976_S10_P1_SHIFT	27
+#define MSM8976_S10_P1_SHIFT_1	0
+
+#define MSM8976_S0_P2_SHIFT	14
+#define MSM8976_S1_P2_SHIFT	26
+#define MSM8976_S2_P2_SHIFT	6
+#define MSM8976_S3_P2_SHIFT	18
+#define MSM8976_S4_P2_SHIFT	14
+#define MSM8976_S5_P2_SHIFT	26
+#define MSM8976_S6_P2_SHIFT	6
+#define MSM8976_S7_P2_SHIFT	18
+#define MSM8976_S8_P2_SHIFT	9
+#define MSM8976_S9_P2_SHIFT	21
+#define MSM8976_S10_P2_SHIFT	1
+
+#define MSM8976_CAL_SEL_MASK	0x3
+
+#define MSM8976_CAL_DEGC_PT1	30
+#define MSM8976_CAL_DEGC_PT2	120
+#define MSM8976_SLOPE_FACTOR	1000
+#define MSM8976_SLOPE_DEFAULT	3200
+
 /* eeprom layout data for qcs404/405 (v1) */
 #define BASE0_MASK	0x000007f8
 #define BASE1_MASK	0x0007f800
@@ -77,6 +139,30 @@
 #define CAL_SEL_MASK	7
 #define CAL_SEL_SHIFT	0
 
+static void compute_intercept_slope_8976(struct tsens_priv *priv,
+			      u32 *p1, u32 *p2, u32 mode)
+{
+	int i;
+
+	priv->sensor[0].slope = 3313;
+	priv->sensor[1].slope = 3275;
+	priv->sensor[2].slope = 3320;
+	priv->sensor[3].slope = 3246;
+	priv->sensor[4].slope = 3279;
+	priv->sensor[5].slope = 3257;
+	priv->sensor[6].slope = 3234;
+	priv->sensor[7].slope = 3269;
+	priv->sensor[8].slope = 3255;
+	priv->sensor[9].slope = 3239;
+	priv->sensor[10].slope = 3286;
+
+	for (i = 0; i < priv->num_sensors; i++) {
+		priv->sensor[i].offset = (p1[i] * MSM8976_SLOPE_FACTOR) -
+				(MSM8976_CAL_DEGC_PT1 *
+				priv->sensor[i].slope);
+	}
+}
+
 static int calibrate_v1(struct tsens_priv *priv)
 {
 	u32 base0 = 0, base1 = 0;
@@ -142,6 +228,94 @@ static int calibrate_v1(struct tsens_priv *priv)
 	return 0;
 }
 
+static int calibrate_8976(struct tsens_priv *priv)
+{
+	int base0 = 0, base1 = 0, i;
+	u32 p1[11], p2[11];
+	int mode = 0, tmp = 0;
+	u32 *qfprom_cdata;
+
+	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
+	if (IS_ERR(qfprom_cdata))
+		return PTR_ERR(qfprom_cdata);
+
+	mode = (qfprom_cdata[4] & MSM8976_CAL_SEL_MASK);
+	dev_dbg(priv->dev, "calibration mode is %d\n", mode);
+
+	switch (mode) {
+	case TWO_PT_CALIB:
+		base1 = qfprom_cdata[2] & MSM8976_BASE1_MASK;
+		base1 = base1 >> MSM8976_BASE1_SHIFT;
+		p2[0] = qfprom_cdata[0] & MSM8976_S0_P2_MASK;
+		p2[0] = p2[0] >> MSM8976_S0_P2_SHIFT;
+		p2[1] = qfprom_cdata[0] & MSM8976_S1_P2_MASK;
+		p2[1] = p2[1] >> MSM8976_S1_P2_SHIFT;
+		p2[2] = qfprom_cdata[1] & MSM8976_S2_P2_MASK;
+		p2[2] = p2[2] >> MSM8976_S2_P2_SHIFT;
+		p2[3] = qfprom_cdata[1] & MSM8976_S3_P2_MASK;
+		p2[3] = p2[3] >> MSM8976_S3_P2_SHIFT;
+		p2[4] = qfprom_cdata[2] & MSM8976_S4_P2_MASK;
+		p2[4] = p2[4] >> MSM8976_S4_P2_SHIFT;
+		p2[5] = qfprom_cdata[2] & MSM8976_S5_P2_MASK;
+		p2[5] = p2[5] >> MSM8976_S5_P2_SHIFT;
+		p2[6] = qfprom_cdata[3] & MSM8976_S6_P2_MASK;
+		p2[6] = p2[6] >> MSM8976_S6_P2_SHIFT;
+		p2[7] = qfprom_cdata[3] & MSM8976_S7_P2_MASK;
+		p2[7] = p2[7] >> MSM8976_S7_P2_SHIFT;
+		p2[8] = qfprom_cdata[4] & MSM8976_S8_P2_MASK;
+		p2[8] = p2[8] >> MSM8976_S8_P2_SHIFT;
+		p2[9] = qfprom_cdata[4] & MSM8976_S9_P2_MASK;
+		p2[9] = p2[9] >> MSM8976_S9_P2_SHIFT;
+		p2[10] = qfprom_cdata[5] & MSM8976_S10_P2_MASK;
+		p2[10] = p2[10] >> MSM8976_S10_P2_SHIFT;
+
+		for (i = 0; i < priv->num_sensors; i++)
+			p2[i] = ((base1 + p2[i]) << 2);
+		/* Fall through */
+	case ONE_PT_CALIB2:
+		base0 = qfprom_cdata[0] & MSM8976_BASE0_MASK;
+		p1[0] = qfprom_cdata[0] & MSM8976_S0_P1_MASK;
+		p1[0] = p1[0] >> MSM8976_S0_P1_SHIFT;
+		p1[1] = qfprom_cdata[0] & MSM8976_S1_P1_MASK;
+		p1[1] = p1[1] >> MSM8976_S1_P1_SHIFT;
+		p1[2] = qfprom_cdata[1] & MSM8976_S2_P1_MASK;
+		p1[2] = p1[2] >> MSM8976_S2_P1_SHIFT;
+		p1[3] = qfprom_cdata[1] & MSM8976_S3_P1_MASK;
+		p1[3] = p1[3] >> MSM8976_S3_P1_SHIFT;
+		p1[4] = qfprom_cdata[2] & MSM8976_S4_P1_MASK;
+		p1[4] = p1[4] >> MSM8976_S4_P1_SHIFT;
+		p1[5] = qfprom_cdata[2] & MSM8976_S5_P1_MASK;
+		p1[5] = p1[5] >> MSM8976_S5_P1_SHIFT;
+		p1[6] = qfprom_cdata[3] & MSM8976_S6_P1_MASK;
+		p1[6] = p1[6] >> MSM8976_S6_P1_SHIFT;
+		p1[7] = qfprom_cdata[3] & MSM8976_S7_P1_MASK;
+		p1[7] = p1[7] >> MSM8976_S7_P1_SHIFT;
+		p1[8] = qfprom_cdata[4] & MSM8976_S8_P1_MASK;
+		p1[8] = p1[8] >> MSM8976_S8_P1_SHIFT;
+		p1[9] = qfprom_cdata[4] & MSM8976_S9_P1_MASK;
+		p1[9] = p1[9] >> MSM8976_S9_P1_SHIFT;
+		p1[10] = qfprom_cdata[4] & MSM8976_S10_P1_MASK;
+		p1[10] = p1[10] >> MSM8976_S10_P1_SHIFT;
+		tmp = qfprom_cdata[5] & MSM8976_S10_P1_MASK_1;
+		tmp = tmp << MSM8976_S10_P1_SHIFT_1;
+		p1[10] |= tmp;
+
+		for (i = 0; i < priv->num_sensors; i++)
+			p1[i] = (((base0) + p1[i]) << 2);
+		break;
+	default:
+		for (i = 0; i < priv->num_sensors; i++) {
+			p1[i] = 500;
+			p2[i] = 780;
+		}
+		break;
+	}
+
+	compute_intercept_slope_8976(priv, p1, p2, mode);
+
+	return 0;
+}
+
 /* v1.x: qcs404,405 */
 
 static const struct tsens_features tsens_v1_feat = {
@@ -191,3 +365,17 @@ const struct tsens_plat_data data_tsens_v1 = {
 	.feat		= &tsens_v1_feat,
 	.fields	= tsens_v1_regfields,
 };
+
+static const struct tsens_ops ops_8976 = {
+	.init		= init_common,
+	.calibrate	= calibrate_8976,
+	.get_temp	= get_temp_tsens_valid,
+};
+
+const struct tsens_plat_data data_8976 = {
+	.num_sensors	= 11,
+	.ops		= &ops_8976,
+	.hw_ids		= (unsigned int[]){0, 1, 2, 4, 5, 6, 7, 8, 9, 10},
+	.feat		= &tsens_v1_feat,
+	.fields		= tsens_v1_regfields,
+};
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 0627d8615c30..24bb05e0eaf8 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -60,6 +60,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,msm8974-tsens",
 		.data = &data_8974,
+	}, {
+		.compatible = "qcom,msm8976-tsens",
+		.data = &data_8976,
 	}, {
 		.compatible = "qcom,msm8996-tsens",
 		.data = &data_8996,
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2fd94997245b..8efec747bfcb 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -323,7 +323,7 @@ extern const struct tsens_plat_data data_8960;
 extern const struct tsens_plat_data data_8916, data_8974;
 
 /* TSENS v1 targets */
-extern const struct tsens_plat_data data_tsens_v1;
+extern const struct tsens_plat_data data_tsens_v1, data_8976;
 
 /* TSENS v2 targets */
 extern const struct tsens_plat_data data_8996, data_tsens_v2;
-- 
2.21.0

