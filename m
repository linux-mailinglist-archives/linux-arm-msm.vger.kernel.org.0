Return-Path: <linux-arm-msm+bounces-50289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13707A4F124
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 00:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E8EC7AA988
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 23:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1293A27BF81;
	Tue,  4 Mar 2025 23:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEcnjfMt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A163727814F
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 23:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741129513; cv=none; b=MYnYmgGr+YvqjgxBLa1ilsTuNT30+OH8i3GUc97wBFamKM5hexv0nibELYYpXy51ki7g6EOIgFr+9LzWWcU3/r4lsCN0J1p9EeQLSpYD3PpzNXccUNosw+vUHJifYFrRbl3je+bO1K02TEuFwzAvYlBAM9JVQjlNJKp0VVbMpJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741129513; c=relaxed/simple;
	bh=TERzkLtrEdxdj4VDCvTpsUge5vjFH8TR9OIZ4SAHj0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rhcSR1FHUd7hCu/n9VGpqZbwMh+bxFJo86rA5NETEZ66w7nTu7UvcRkl+9CrxG+Qw9ieNEALmBAcxml7iE4AYxIeX9AV68knjImbiDxTmJQ4q79RRBfndmLr94r1xBuee/HGyH6M6TwIYzT/d783Rz/nXqQADJPmbFmw4BNuvXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEcnjfMt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524LL2SW021586
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 23:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oFHi6HPiiob
	VnYa1RpPQaEiVA5GMEQ/6EX2Jo7SAl8M=; b=DEcnjfMtFTWAm4vlDDqBNFeN7L8
	r/HB+bqMTPpDI4B8cTDpQaZ6CfzEtv2vTkFPAcw2tWpr2tpownp7eNuVmOTjV20A
	UGXmMiaxAxlvESO3PEKBsYuCqvu7MeMfGt/Uj/fo4Igh745euVdr1dPs09nVVWVx
	klzRjJIABucF8pPr2Yt1XF4IQshNsB3tqrwjPx1WyCGT752zYm/ZGdXoIF+EJUsp
	vFzalyfVYoBnpHW6Rb7wXvaQbkeBgGz0VSk9vZ+Jd3ISY/GFiveFe9ONe2MxF196
	3HV5QStxdHzsEAQdzUCUzS1xD0i62tzKMOZkvGxi9sSTqt8qChhkG2aYRQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t3fbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 23:05:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2233b154004so114147195ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 15:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741129508; x=1741734308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFHi6HPiiobVnYa1RpPQaEiVA5GMEQ/6EX2Jo7SAl8M=;
        b=RE5E+MyGBzwRXXvs8nseGRyxI586JNB2VvZPr+vriRE9/muIvxYvNNISwIDzLTEJMW
         BrgDrTY1VJX0O2qTppXA0xr63qvSw25ZdKY9P71ovFK1W49UjqKcgQYlpumlJImfsa0R
         R12XEttXvE07YGfT9pI6PRwNzR0/9vvdfGJ/ypwQxnQ+eJXEUTlg7O2qkJ7oAVfAYYbR
         vvyZQ4tED1iV9HRFBcsD5dwprqNlnrKIY8pv+5f167JUAPO0ORradZgVwTK3Fk5HbsjG
         dkfp9jzuZeYVyzHjE9xl8fPbLaboYQTZWiyJX+vXI5pn+Aw/Z8Abrwja8lnP9ENQBtoP
         cKkA==
X-Forwarded-Encrypted: i=1; AJvYcCVcmeEf29CZGijGMerXtsOzchK9CVYa3094S91ZbBsgH7l2XckAVS5hC+ozFuPLH5YP8H4C4ZiLS7RxBoGz@vger.kernel.org
X-Gm-Message-State: AOJu0YzT9tmZoXSupmtlLzUQFk+YB4ZgP6Pq6pI977edmBj/qfQxOcw6
	WOc1rJddSRBUITs45bShk3fQPhNAss6Y6fd+nivCHHqqavapi4MUYhUo4Kdbit0UiilTdQShtbj
	EcCIa0wCSsUpBiRPBAAp+fSgHISShJ2pw7hvdgr33XBlvFf+UtxwTJKLGpuonnaTDT5y5Ws39
X-Gm-Gg: ASbGnct3Bux5+ofRYdZwAdOgIdy+EhUqjdQ/FmdTC5XYPqr5anU2mEJMCMVL1d7srfl
	5jJi52GVZ8jB8GY8TGaHgt8/JwTLo7goK84YjB7zt4m7LSW8QVLnYmhxV7PDYnvk6t9WaSssi9/
	Uh5+N185vXmt0jC1zj+8XmoNIpdsnDtO+Ti7egT5jzRKm7fsandVQYgciDIYJj4Mynp/vykAY7k
	KqcEBxRYP3pmFBsx2ZLN5GC7sDdJSxkOlZelqwAqBnpEp9MpiA9pD1lDxn8Isv3WjHlN5TASSVE
	88xu3UHU+98OKZKZs+NwBs1TTj43ZvoKlPQbPlT1i0J36rIMBQDmWS8Mxy1Cut5i5GKHCt4xF/E
	LUsw=
X-Received: by 2002:a05:6a00:cd5:b0:736:4a5b:7f08 with SMTP id d2e1a72fcca58-73682cda1bamr816103b3a.22.1741129507346;
        Tue, 04 Mar 2025 15:05:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwgkm9DXCZoV0evX7gwK9DP+9yqpt9rFshANzpcaRQlOdkO3Nh3fh9NRKyJNXnsFi6cq5Jww==
X-Received: by 2002:a05:6a00:cd5:b0:736:4a5b:7f08 with SMTP id d2e1a72fcca58-73682cda1bamr816075b3a.22.1741129506908;
        Tue, 04 Mar 2025 15:05:06 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cfd9sm11492793b3a.76.2025.03.04.15.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 15:05:06 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 2/5] thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW subtype
Date: Tue,  4 Mar 2025 15:04:59 -0800
Message-Id: <20250304230502.1470523-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304230502.1470523-1-anjelique.melendez@oss.qualcomm.com>
References: <20250304230502.1470523-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c78725 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KV_uBXLwT3x28NnhTW4A:9 a=RVmHIydaz68A:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lAq_28Cr7uvyZseMku2c7txjrBcx6zAP
X-Proofpoint-ORIG-GUID: lAq_28Cr7uvyZseMku2c7txjrBcx6zAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040183

Currently multiple if/else statements are used in functions to decipher
between SPMI temp alarm Gen 1, Gen 2 and Gen 2 Rev 1 functionality. Instead
refactor the driver so that SPMI temp alarm chips will have reference to a
spmi_temp_alarm_data struct which defines data and function callbacks
based on the HW subtype.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 107 +++++++++++++-------
 1 file changed, 70 insertions(+), 37 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index b2077ff9fe73..1cc9369ca9e1 100644
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
@@ -118,20 +126,19 @@ static int qpnp_tm_write(struct qpnp_tm_chip *chip, u16 addr, u8 data)
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
- * qpnp_tm_get_temp_stage() - return over-temperature stage
+ * qpnp_tm_gen1_get_temp_stage() - return over-temperature stage
  * @chip:		Pointer to the qpnp_tm chip
  *
- * Return: stage (GEN1) or state (GEN2) on success, or errno on failure.
+ * Return: stage on success, or errno on failure.
  */
-static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
+static int qpnp_tm_gen1_get_temp_stage(struct qpnp_tm_chip *chip)
 {
 	int ret;
 	u8 reg = 0;
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
+	.get_temp_stage = qpnp_tm_gen1_get_temp_stage,
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


