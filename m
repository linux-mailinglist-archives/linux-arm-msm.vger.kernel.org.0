Return-Path: <linux-arm-msm+bounces-52115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22547A6AF1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 21:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A1F9843AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 20:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E5E22A7F4;
	Thu, 20 Mar 2025 20:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvT9iuEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ACC22A4FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742502263; cv=none; b=GzAJywDWHtdz/9OcQIAwP7bwXHgXyqH9FFRUnGhUgTMuftQEpdhrPUXTBunjv8OKJ4AdTiGGslCfEUOjHkLAAMFym3t/mZgGQ/DPWBs3ozAxWGcnX6M8KJuuvy47gaufQiNbUpYi4WHeGT65N0pSlTt3Xi5Pq+XbPn1mW69Owr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742502263; c=relaxed/simple;
	bh=TXVz2/T0OBMtfqAXnLHMdu8+NX9jjpGzRajAY7ANRI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B/i8PYSicTXfAB9snnPyxjaTYUhp3EKxcA3riFOXdZYEQdhyVL0Tp6i/YrdI3CI85xK0MWPRKES0f5zyc+xu9xltS9ESyCPfmgczCbpnb/dZOmLd8bWok5MDE4getiV9VoFTF6vxtVSg6yB1iayN8A1jpj7IBIgZU5nD8I9WO0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvT9iuEc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KE6vHW019473
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LIlSavennvF
	SuEJSQHTgSgc2W+NpJOFIMTRCL7znOuc=; b=jvT9iuEcZpzfsvINc4vjXNqvq1t
	KWTlwJtMO9zyBzBNrG99T02xv+dkCjn0Mn/mH/ddlTN9vWBdXa3a2bFDgyMjP/EV
	7pGQMEr0qcBuzU31Yp6u3+XfdT8i1KIYeiYta4i9iMnTCacF9Q3M7gl4DzxFfPrU
	CmUpNl4eer1A+94cgwajLIymuE/FYYAnpyvyLOnA9t5exylAfgObqS+htZivSXe9
	wxWHfkkvQekh36+4XQdfltEJ4dmEb1fNfZIyCfgxCUTmniW8L7Mwor1/kJu3pZnc
	NuDqAFXehE3/kduyfOp/qqCMZeCTs2uEBsHYOV9ThluR+z3ZEEQdTuMP+ew==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf3sjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410053005so30634705ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 13:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742502258; x=1743107058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIlSavennvFSuEJSQHTgSgc2W+NpJOFIMTRCL7znOuc=;
        b=X3cmUz3zPgJGgSj5QmqynPQPKWIoOw798pTcDygE+JDfeySlzZ3M5jfNsMX0gSBH0J
         Y/HHzY2sBHhyuzgh55Z8T+0vxRZyzJ/dYggJQZDGekte5EjEbD/rXK0/Sv+CcDskTksj
         Wv4yJBMgvatB77CPBSbqZXL5URGoCzTBk6DOWg+IHYOy9apcdTS7sjJX7zIPZOAq9XVY
         MrAKSDKa7nAJ0Tp99EQCEdv9VIDpQy6dhMNqfFc01iWDIQ8f2a65BjjF2ULHuq68Sqcs
         kltg+Apie7cSFdz491RD36YxQhmH5wokcbKV446Xg38MTrBCAHtyWpKdZgZy0Ilo+S3Q
         FuHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrQYMXg9H6jvtMlxznTZeLqoD8AketTijAyJUGTL8CRYzBlC+1pMJ4/gOpMqKFKxgNyDxIEi3ZxkRs8N5X@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2SrBcz6WrYHFGgjCDeKwyad00z5MjYFvng2NKgyzaKFMZp63G
	seua3ucBvzS47Xc+h1rWUFJG4owDe4fare3VDZV3Tz5e7YQEC5Q3730oKOLDtNR51LVc689V51N
	2gtKJUERvojchgY0JmlJbjgr3+niyGOv4jvPQF8CpZeRTbz0IrBuWdq40TKJQJpR2
X-Gm-Gg: ASbGncu0br6JQUcqiHU4WcmRTng2VTi0+bwkEIjsd1b93fHAwCMRfPubftxo0ed3Bna
	qzyw9QJOQVv88iJCmZnmv8v0NwndjiXfhrYbTGY1dAYZ9/fqByhmCDEZqF2f5t4QCjoEegJzY9Z
	PnGjvxjYJeb5ou0VqpCB2xykPcwTXKU75ZsW4p+4u7QflU4l1Wq2d5oujSEhGTuDmjq8J8/EzsX
	rPWPCchny8SoDR0prr3ehqmi/Nk24ZNJA4Q/JGPV7XGp6lRXLAjHwtjTT85WhRPqaBsyrvDfBNG
	YXwiBRQnVmzksW07NohhZynI6ZfBC7cOxcR+hj5g4EYmfFfzsaRuSAe+EAzxGciajco5LyNRIAm
	YaBc=
X-Received: by 2002:a05:6a00:170b:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-73905a3599dmr1226232b3a.21.1742502258219;
        Thu, 20 Mar 2025 13:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgE0enSGH32lM0/bmbQoILyWmukGtAIJ78rW2WC9ZP+ZuRQNv75+CTGAlMDQjKvLzb755TNg==
X-Received: by 2002:a05:6a00:170b:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-73905a3599dmr1226182b3a.21.1742502257634;
        Thu, 20 Mar 2025 13:24:17 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600b9b1sm249308b3a.76.2025.03.20.13.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 13:24:16 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: [PATCH v3 4/5 RESEND] thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC peripherals
Date: Thu, 20 Mar 2025 13:24:07 -0700
Message-Id: <20250320202408.3940777-5-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bwCb_bvc6UeGZ3VwLhpJnz7q887I08Jo
X-Proofpoint-ORIG-GUID: bwCb_bvc6UeGZ3VwLhpJnz7q887I08Jo
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dc7973 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=4OMqYXV_ruVW7JoEK48A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_07,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200131

Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
revision 2.  This revision utilizes individual temp DAC registers
to set the threshold temperature for over-temperature stages 1,
2, and 3 instead of a single register to specify a set of
thresholds.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 136 ++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 514772e94a28..efd2b6534127 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -26,6 +26,11 @@
 #define QPNP_TM_REG_SHUTDOWN_CTRL1	0x40
 #define QPNP_TM_REG_ALARM_CTRL		0x46
 
+/* TEMP_DAC_STGx registers are only present for TEMP_GEN2 v2.0 */
+#define QPNP_TM_REG_TEMP_DAC_STG1	0x47
+#define QPNP_TM_REG_TEMP_DAC_STG2	0x48
+#define QPNP_TM_REG_TEMP_DAC_STG3	0x49
+
 #define QPNP_TM_TYPE			0x09
 #define QPNP_TM_SUBTYPE_GEN1		0x08
 #define QPNP_TM_SUBTYPE_GEN2		0x09
@@ -65,6 +70,25 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
 
 #define TEMP_STAGE_HYSTERESIS		2000
 
+/*
+ * For TEMP_GEN2 v2.0, TEMP_DAC_STG1/2/3 registers are used to set the threshold
+ * for each stage independently.
+ * TEMP_DAC_STG* = 0 --> 80 C
+ * Each 8 step increase in TEMP_DAC_STG* value corresponds to 5 C (5000 mC).
+ */
+#define TEMP_DAC_MIN			80000
+#define TEMP_DAC_SCALE_NUM		8
+#define TEMP_DAC_SCALE_DEN		5000
+
+#define TEMP_DAC_TEMP_TO_REG(temp) \
+	(((temp) - TEMP_DAC_MIN) * TEMP_DAC_SCALE_NUM / TEMP_DAC_SCALE_DEN)
+#define TEMP_DAC_REG_TO_TEMP(reg) \
+	(TEMP_DAC_MIN + (reg) * TEMP_DAC_SCALE_DEN / TEMP_DAC_SCALE_NUM)
+
+static const long temp_dac_max[STAGE_COUNT] = {
+	119375, 159375, 159375
+};
+
 /* Temperature in Milli Celsius reported during stage 0 if no ADC is present */
 #define DEFAULT_TEMP			37000
 
@@ -73,6 +97,7 @@ struct qpnp_tm_chip;
 struct spmi_temp_alarm_data {
 	const struct thermal_zone_device_ops *ops;
 	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
+	int (*setup)(struct qpnp_tm_chip *chip);
 	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
 	int (*configure_trip_temps)(struct qpnp_tm_chip *chip);
 };
@@ -88,6 +113,7 @@ struct qpnp_tm_chip {
 	unsigned int			thresh;
 	unsigned int			stage;
 	unsigned int			base;
+	unsigned int			ntrips;
 	/* protects .thresh, .stage and chip registers */
 	struct mutex			lock;
 	bool				initialized;
@@ -305,6 +331,52 @@ static const struct thermal_zone_device_ops qpnp_tm_sensor_ops = {
 	.set_trip_temp = qpnp_tm_set_trip_temp,
 };
 
+static int qpnp_tm_gen2_rev2_set_temp_thresh(struct qpnp_tm_chip *chip, int trip, int temp)
+{
+	int ret, temp_cfg;
+	u8 reg;
+
+	if (trip < 0 || trip >= STAGE_COUNT) {
+		dev_err(chip->dev, "invalid TEMP_DAC trip = %d\n", trip);
+		return -EINVAL;
+	} else if (temp < TEMP_DAC_MIN || temp > temp_dac_max[trip]) {
+		dev_err(chip->dev, "invalid TEMP_DAC temp = %d\n", temp);
+		return -EINVAL;
+	}
+
+	reg = TEMP_DAC_TEMP_TO_REG(temp);
+	temp_cfg = TEMP_DAC_REG_TO_TEMP(reg);
+
+	ret = qpnp_tm_write(chip, QPNP_TM_REG_TEMP_DAC_STG1 + trip, reg);
+	if (ret < 0) {
+		dev_err(chip->dev, "TEMP_DAC_STG write failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	chip->temp_thresh_map[trip] = temp_cfg;
+
+	return 0;
+}
+
+static int qpnp_tm_gen2_rev2_set_trip_temp(struct thermal_zone_device *tz,
+					   const struct thermal_trip *trip, int temp)
+{
+	unsigned int trip_index = THERMAL_TRIP_PRIV_TO_INT(trip->priv);
+	struct qpnp_tm_chip *chip = thermal_zone_device_priv(tz);
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, trip_index, temp);
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static const struct thermal_zone_device_ops qpnp_tm_gen2_rev2_sensor_ops = {
+	.get_temp = qpnp_tm_get_temp,
+	.set_trip_temp = qpnp_tm_gen2_rev2_set_trip_temp,
+};
+
 static irqreturn_t qpnp_tm_isr(int irq, void *data)
 {
 	struct qpnp_tm_chip *chip = data;
@@ -329,6 +401,58 @@ static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
 	return qpnp_tm_update_critical_trip_temp(chip, crit_temp);
 }
 
+/* Configure TEMP_DAC registers based on DT thermal_zone trips */
+static int qpnp_tm_gen2_rev2_configure_trip_temps_cb(struct thermal_trip *trip, void *data)
+{
+	struct qpnp_tm_chip *chip = data;
+	int ret;
+
+	trip->priv = THERMAL_INT_TO_TRIP_PRIV(chip->ntrips);
+	ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, chip->ntrips, trip->temperature);
+	chip->ntrips++;
+
+	return ret;
+}
+
+static int qpnp_tm_gen2_rev2_configure_trip_temps(struct qpnp_tm_chip *chip)
+{
+	int ret, i;
+
+	ret = thermal_zone_for_each_trip(chip->tz_dev,
+					 qpnp_tm_gen2_rev2_configure_trip_temps_cb, chip);
+	if (ret < 0)
+		return ret;
+
+	/* Verify that trips are strictly increasing. */
+	for (i = 1; i < STAGE_COUNT; i++) {
+		if (chip->temp_thresh_map[i] <= chip->temp_thresh_map[i - 1]) {
+			dev_err(chip->dev, "Threshold %d=%ld <= threshold %d=%ld\n",
+				i, chip->temp_thresh_map[i], i - 1,
+				chip->temp_thresh_map[i - 1]);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/* Read the hardware default TEMP_DAC stage threshold temperatures */
+static int qpnp_tm_gen2_rev2_setup(struct qpnp_tm_chip *chip)
+{
+	int ret, i;
+	u8 reg = 0;
+
+	for (i = 0; i < STAGE_COUNT; i++) {
+		ret = qpnp_tm_read(chip, QPNP_TM_REG_TEMP_DAC_STG1 + i, &reg);
+		if (ret < 0)
+			return ret;
+
+		chip->temp_thresh_map[i] = TEMP_DAC_REG_TO_TEMP(reg);
+	}
+
+	return 0;
+}
+
 static const struct spmi_temp_alarm_data spmi_temp_alarm_data = {
 	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen1,
@@ -350,6 +474,13 @@ static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
 	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
 };
 
+static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev2_data = {
+	.ops = &qpnp_tm_gen2_rev2_sensor_ops,
+	.setup = qpnp_tm_gen2_rev2_setup,
+	.configure_trip_temps = qpnp_tm_gen2_rev2_configure_trip_temps,
+	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
+};
+
 /*
  * This function initializes the internal temp value based on only the
  * current thermal stage and threshold. Setup threshold control and
@@ -484,6 +615,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 
 	if (subtype == QPNP_TM_SUBTYPE_GEN1)
 		chip->data = &spmi_temp_alarm_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 2)
+		chip->data = &spmi_temp_alarm_gen2_rev2_data;
 	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
 		chip->data = &spmi_temp_alarm_gen2_rev1_data;
 	else if (subtype == QPNP_TM_SUBTYPE_GEN2)
@@ -491,6 +624,9 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	else
 		return -ENODEV;
 
+	if (chip->data->setup)
+		chip->data->setup(chip);
+
 	/*
 	 * Register the sensor before initializing the hardware to be able to
 	 * read the trip points. get_temp() returns the default temperature
-- 
2.34.1


