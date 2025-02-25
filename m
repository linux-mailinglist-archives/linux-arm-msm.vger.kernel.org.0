Return-Path: <linux-arm-msm+bounces-49371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2804A44B40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 20:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5B90189CC67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C8320AF82;
	Tue, 25 Feb 2025 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZLPyKoN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D630A1DD889
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511478; cv=none; b=H+afLuLayVV6ZrxY1ov0J/t1WNgEWT2q+Pnc78cdztdTsdlTt3d80V+zblGViQubisBnpDJQ0Pm3Ov15LvxB2GYAbcYXFAfrvM3IAmEHFljaJshNn1BckPeoIg/nxIaaq3EfLQ5pvuU/IP7dC1T+7fDnQg16U+ohQNyd1N+14n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511478; c=relaxed/simple;
	bh=16cb+1NORKIaQVLKBujy43BYn4/BrzsfyuaV882E/qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BWm28QoTQmKg/xFZI+bDxyilgH/sfng9/Q1HQyCwupI1d/RT1WOxaizBTPpx1vsOEbCqSfABvagxOwSR4os0hJamkouNG5FaefSskudbB3r7YfFSPt7L5wnTALOWcDkoAOPAOBHNONVoP+YokXl2R+TkRziqaHjmx7QrMfWuuDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZLPyKoN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PIBPYN009176
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LcoRWvJbflo
	ytDZRCtlhUjdEvFcCP891bnOPZ84hFdk=; b=PZLPyKoNX9mTllm/s2kCiP5+2lS
	kRTnEkSl7RzUewbHp8DKa4JSD8LWzhtFAv/LWW6zopSO4WbG9KLYMuaB0ax65XBN
	skYEJchG4EhDXa77KlYQdHp5Vy5J18sKi2gRERXDS/OM6JwUKF/WOcpEcdYcRXjQ
	Yzuvhv+LOW77pFiJPZXgDAuJ/27judkgRFjM2o7o3oTR/t4qgzH8rdleafZq0myd
	4BgjN9JpSnbU9wZMva8sxBoF/oS7TW5dRmEzd6G3iwe0GS0m0Tbs1jYQurp462Yk
	cecSyFbANpaZd5v3a1hBXu86yTGyP0iCIBBJJiZ6ePcZ2vp0EcrFxwYyTLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6y6syq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2210305535bso197953415ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740511474; x=1741116274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcoRWvJbfloytDZRCtlhUjdEvFcCP891bnOPZ84hFdk=;
        b=eQRlwZjgpvn1J9BWbJH1BoLZqNNN4nuX9BarJeny6hDaaFtcUYi31gxRFu7KYDiwbQ
         CIWHBlV0YmiL9nK61wxpmC4InOWeR6LUb3rxF49UCz0ZzuhXsnekNR3oliY+oTZbGjfZ
         uQHas1NpcPACkQrH3+hKvc/Kycj6HdXteziDC5HBx5yCRLRD6sUT1uieompr3Ljgo5Pn
         9RfLPJrZNVBSVAJNjGW3ode1Ma0uUR6dMYl4oe7NbHTIiStFt/Hfyi/EnRw2lWFazQ2Y
         V9oOsToR3w6uq7mMXvQeIC7akbLpYxqz/jnQL+Yp+WzVbciGtaqVmguliw9utXhljHKF
         5eHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZHu6eTtaNIV2/SoERT7XKAlj7i8qd/S+bkB67wqcIeuRTBZJqHQOn1ilZFyhk0PGJcHZXGJvDEbCKWSD1@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYDx0I0+fRbW/OGDvCurxzpAuxJmvDsOar2bAga2/NKcAI8xy
	sXIIHAZD2kQ8Gzki/eQ8Awu5wu2J9LkNG551Jme1YGLWx1YOIJv/8Tn/aj/PY8E32uCRt+i2Cmt
	q3OQEbVAK8EE9wAf5vU5UIaxgnBfFivtMS77qE4VL9hoUgCkeOCHmPPqPCErTp8wTPX5fTbqB
X-Gm-Gg: ASbGncs87SVqD2BagMjfwuQFkGDF31sIw8LaSSezFr9FHtOu+3vPhUTH20Mkh7qm8ZM
	Waz8RQGydSWA+UXCLeET55WivbS33VatXji97uA1jJ+zvOdw8r2Vkr5C7c0PQk3UtiTj2q94l94
	/QBnlmULyBl/Rw+RZwOqxyLE8+RpA2JQ/mPITXGax7tIBoSYuoddBljEhsA4d9X+HG2ZoHrvgUQ
	YrAOSv7N2D8y571FCQg5QfbRoc58wdNMqLBTAILFi5UMzONc3/lCujCom1sVq1hXOB+mcV7B/qZ
	TkG3V28xlUy25NjaX0rH/5fZ8HlMlfCeAsoDiaaE/XZbrU8B//QJ2ErD7hdMf1K+qglfwbvqg7c
	EblM=
X-Received: by 2002:a17:902:d48e:b0:21b:d105:26b8 with SMTP id d9443c01a7336-221a0ec46c1mr260884695ad.7.1740511473821;
        Tue, 25 Feb 2025 11:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjSOvXO38VCPu0/p19WNskPbexVkodRLpQ8MRiXPULLdKrwJIV06xJDSQSgrZ3mwZZX9ITZg==
X-Received: by 2002:a17:902:d48e:b0:21b:d105:26b8 with SMTP id d9443c01a7336-221a0ec46c1mr260884405ad.7.1740511473397;
        Tue, 25 Feb 2025 11:24:33 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a095865sm17915365ad.145.2025.02.25.11.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 11:24:32 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW subtype
Date: Tue, 25 Feb 2025 11:24:26 -0800
Message-Id: <20250225192429.2328092-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com>
References: <20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hRe4reNLYolfu2oQsCUINsJhMiGIoBea
X-Proofpoint-GUID: hRe4reNLYolfu2oQsCUINsJhMiGIoBea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_06,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250120

Currently multiple if/else statements are used in functions to decipher
between SPMI temp alarm Gen 1, Gen 2 and Gen 2 Rev 1 functionality. Instead
refactor the driver so that SPMI temp alarm chips will have reference to a
spmi_temp_alarm_data struct which defines data and function callbacks
based on the HW subtype.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 103 +++++++++++++-------
 1 file changed, 68 insertions(+), 35 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index b2077ff9fe73..64f5db214ed2 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -31,7 +32,6 @@
 
 #define STATUS_GEN1_STAGE_MASK		GENMASK(1, 0)
 #define STATUS_GEN2_STATE_MASK		GENMASK(6, 4)
-#define STATUS_GEN2_STATE_SHIFT		4
 
 #define SHUTDOWN_CTRL1_OVERRIDE_S2	BIT(6)
 #define SHUTDOWN_CTRL1_THRESHOLD_MASK	GENMASK(1, 0)
@@ -68,10 +68,18 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
 /* Temperature in Milli Celsius reported during stage 0 if no ADC is present */
 #define DEFAULT_TEMP			37000
 
+struct qpnp_tm_chip;
+
+struct spmi_temp_alarm_data {
+	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
+	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
+};
+
 struct qpnp_tm_chip {
 	struct regmap			*map;
 	struct device			*dev;
 	struct thermal_zone_device	*tz_dev;
+	const struct spmi_temp_alarm_data *data;
 	unsigned int			subtype;
 	unsigned int			dig_revision;
 	long				temp;
@@ -82,9 +90,9 @@ struct qpnp_tm_chip {
 	struct mutex			lock;
 	bool				initialized;
 	bool				require_s2_shutdown;
+	long				temp_thresh_map[STAGE_COUNT];
 
 	struct iio_channel		*adc;
-	const long			(*temp_map)[THRESH_COUNT][STAGE_COUNT];
 };
 
 /* This array maps from GEN2 alarm state to GEN1 alarm stage */
@@ -118,18 +126,17 @@ static int qpnp_tm_write(struct qpnp_tm_chip *chip, u16 addr, u8 data)
  */
 static long qpnp_tm_decode_temp(struct qpnp_tm_chip *chip, unsigned int stage)
 {
-	if (!chip->temp_map || chip->thresh >= THRESH_COUNT || stage == 0 ||
-	    stage > STAGE_COUNT)
+	if (stage == 0 || stage > STAGE_COUNT)
 		return 0;
 
-	return (*chip->temp_map)[chip->thresh][stage - 1];
+	return chip->temp_thresh_map[stage - 1];
 }
 
 /**
  * qpnp_tm_get_temp_stage() - return over-temperature stage
  * @chip:		Pointer to the qpnp_tm chip
  *
- * Return: stage (GEN1) or state (GEN2) on success, or errno on failure.
+ * Return: stage on success, or errno on failure.
  */
 static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
 {
@@ -140,12 +147,27 @@ static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	if (chip->subtype == QPNP_TM_SUBTYPE_GEN1)
-		ret = reg & STATUS_GEN1_STAGE_MASK;
-	else
-		ret = (reg & STATUS_GEN2_STATE_MASK) >> STATUS_GEN2_STATE_SHIFT;
+	return FIELD_GET(STATUS_GEN1_STAGE_MASK, reg);
+}
 
-	return ret;
+/**
+ * qpnp_tm_gen2_get_temp_stage() - return over-temperature stage
+ * @chip:		Pointer to the qpnp_tm chip
+ *
+ * Return: stage on success, or errno on failure.
+ */
+static int qpnp_tm_gen2_get_temp_stage(struct qpnp_tm_chip *chip)
+{
+	u8 reg = 0;
+	int ret;
+
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_STATUS, &reg);
+	if (ret < 0)
+		return ret;
+
+	ret = FIELD_GET(STATUS_GEN2_STATE_MASK, reg);
+
+	return alarm_state_map[ret];
 }
 
 /*
@@ -154,23 +176,16 @@ static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
  */
 static int qpnp_tm_update_temp_no_adc(struct qpnp_tm_chip *chip)
 {
-	unsigned int stage, stage_new, stage_old;
+	unsigned int stage_new, stage_old;
 	int ret;
 
 	WARN_ON(!mutex_is_locked(&chip->lock));
 
-	ret = qpnp_tm_get_temp_stage(chip);
+	ret = chip->data->get_temp_stage(chip);
 	if (ret < 0)
 		return ret;
-	stage = ret;
-
-	if (chip->subtype == QPNP_TM_SUBTYPE_GEN1) {
-		stage_new = stage;
-		stage_old = chip->stage;
-	} else {
-		stage_new = alarm_state_map[stage];
-		stage_old = alarm_state_map[chip->stage];
-	}
+	stage_new = ret;
+	stage_old = chip->stage;
 
 	if (stage_new > stage_old) {
 		/* increasing stage, use lower bound */
@@ -182,7 +197,7 @@ static int qpnp_tm_update_temp_no_adc(struct qpnp_tm_chip *chip)
 				- TEMP_STAGE_HYSTERESIS;
 	}
 
-	chip->stage = stage;
+	chip->stage = stage_new;
 
 	return 0;
 }
@@ -222,8 +237,8 @@ static int qpnp_tm_get_temp(struct thermal_zone_device *tz, int *temp)
 static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 					     int temp)
 {
-	long stage2_threshold_min = (*chip->temp_map)[THRESH_MIN][1];
-	long stage2_threshold_max = (*chip->temp_map)[THRESH_MAX][1];
+	long stage2_threshold_min = (*chip->data->temp_map)[THRESH_MIN][1];
+	long stage2_threshold_max = (*chip->data->temp_map)[THRESH_MAX][1];
 	bool disable_s2_shutdown = false;
 	u8 reg;
 
@@ -258,6 +273,8 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 	}
 
 skip:
+	memcpy(chip->temp_thresh_map, chip->data->temp_map[chip->thresh],
+		sizeof(chip->temp_thresh_map));
 	reg |= chip->thresh;
 	if (disable_s2_shutdown && !chip->require_s2_shutdown)
 		reg |= SHUTDOWN_CTRL1_OVERRIDE_S2;
@@ -295,6 +312,21 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct spmi_temp_alarm_data spmi_temp_alarm_data = {
+	.temp_map = &temp_map_gen1,
+	.get_temp_stage = qpnp_tm_get_temp_stage,
+};
+
+static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_data = {
+	.temp_map = &temp_map_gen1,
+	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
+};
+
+static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
+	.temp_map = &temp_map_gen2_v1,
+	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
+};
+
 /*
  * This function initializes the internal temp value based on only the
  * current thermal stage and threshold. Setup threshold control and
@@ -302,7 +334,6 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
  */
 static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 {
-	unsigned int stage;
 	int ret;
 	u8 reg = 0;
 	int crit_temp;
@@ -316,16 +347,13 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 	chip->thresh = reg & SHUTDOWN_CTRL1_THRESHOLD_MASK;
 	chip->temp = DEFAULT_TEMP;
 
-	ret = qpnp_tm_get_temp_stage(chip);
+	ret = chip->data->get_temp_stage(chip);
 	if (ret < 0)
 		goto out;
 	chip->stage = ret;
 
-	stage = chip->subtype == QPNP_TM_SUBTYPE_GEN1
-		? chip->stage : alarm_state_map[chip->stage];
-
-	if (stage)
-		chip->temp = qpnp_tm_decode_temp(chip, stage);
+	if (chip->stage)
+		chip->temp = qpnp_tm_decode_temp(chip, chip->stage);
 
 	mutex_unlock(&chip->lock);
 
@@ -439,10 +467,15 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	}
 
 	chip->subtype = subtype;
-	if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
-		chip->temp_map = &temp_map_gen2_v1;
+
+	if (subtype == QPNP_TM_SUBTYPE_GEN1)
+		chip->data = &spmi_temp_alarm_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
+		chip->data = &spmi_temp_alarm_gen2_rev1_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2)
+		chip->data = &spmi_temp_alarm_gen2_data;
 	else
-		chip->temp_map = &temp_map_gen1;
+		return -ENODEV;
 
 	/*
 	 * Register the sensor before initializing the hardware to be able to
-- 
2.34.1


