Return-Path: <linux-arm-msm+bounces-64471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B28ACB00EF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 00:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CDD51CA80D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 22:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5957C2874E9;
	Thu, 10 Jul 2025 22:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YrAC/bR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC5C2C15B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752187567; cv=none; b=Ibh/++8YDMVU05AFv7/M6UKRk7+9I06cGN4h1fxGpY8ZntmpkSocf/76ijS5Iu5UoRZZ6X0vXtlRY3nsS3VXK/+dLT5ed9fIRgnNrzwDa65ncaxr+zso7/F40tWn2apZyr2jRSrE7u1Ld996p4H8BFpXjixXwAvxKphzuJUzfu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752187567; c=relaxed/simple;
	bh=LTrWIBmHuSPigCg/BnSdxHQ/CMxK6ECk7MJSl7YiYcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V9VCQ/JZWBMuGU1cI+jQTRNmdcXzNqWJmlFkdboa4nMMb2W/ykGCzRk/ep9+QGKNtcLHFLfbff5ZJO98cWMHzfy4w0gzXswCuy2+34PhDGq2t4XiF5f0DsGumQYmUq6e8Gk/EpM/Jvo9vhhOJ+aICaxEN17Mfm38hfie7fZu2tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YrAC/bR3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AJRIGJ027757
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4BowjyUNDu5
	UOuLJtzw9IisX6hUip4xF24PhAzp2Jeg=; b=YrAC/bR3AveJv27MHtzyVWE+WpP
	g22Isi6oVltMh1S6Nb45dFol8LjGva7pVlSHKRuOug5hXPPOwT091/SANgI+54R+
	htIyLb8RAph+r1PInMHaXA7F5rB1w6D1AfBGWWrZ8FLLYh6Cn8KnC7QO7JHe8NoL
	e5StvCziDdv5ZfgtWvulISik3wHT0EBAQe5ie2JCB19uQkS9jhG75triXg7AhWLG
	SddPO7Od7dPpqvNHRijdGadX6IKWLUS2aMSgIiTNcetow3Rviqae1Vvb00oSlYMl
	UAoV1SPTxS4c0UByt82ciCmLqjfY+NxoyNj6dAk2HpHtoZSi+lO872p8UDw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap6kkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 22:46:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23632fd6248so14843895ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752187563; x=1752792363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BowjyUNDu5UOuLJtzw9IisX6hUip4xF24PhAzp2Jeg=;
        b=CG/GWt3/nbNOKdp1L8wg/5fkdwVVuRpOx8f6dBI01jcNo/kknINnKgJFE0tl1P6dGE
         8sMCePmXSgjnSImdsn/FU6ouG85NLG1gZOx7uk/7dBQNTcPasXwswpdeEpBfJniLCN47
         CLgIKuOtWvr6paOixl+JdxH8ao2U4g+ki97alcTlMdLSpJLdZkEIaydoXAXchbvNtNau
         Ht+ltZMK2Z+2fATAABxdJAnQ2OMeKQX0paJWH31ZaLDXXM9wbSoL036SfIqBSyp29Rf7
         YOQVNB7hapwr99uQ4JyNt5ymSiFt+3PjOxomYInJs2CLUqv46/rUXWhLwb4unn048R3G
         npMw==
X-Forwarded-Encrypted: i=1; AJvYcCWnzMs+MWF18hNHShzXodAf+4eG2RI114yDLybxp+coAEn1YmT0BAnSxZFrVKH39g07pyDR1tmun5WmkEJs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2EPsPI+RfKc1Qm9l783rctVB4EsbP2tSwaDAYIhLXc+mc6J/
	DTwmBcwsvHo4lHPGN3KZ3dtWm1CIkmfXOEy7P9ivzLogJ8DfvT8ohU0Qbay9Yi4pkWxwxSYBTwI
	xv/26Fw7cCeYuVm7jHQgnMF0sCiuTti0llM174ktqwM6yxTiDvl0g8uMpuTZIPZNSxDoT
X-Gm-Gg: ASbGncuVOw2CaYn6w/2S2QXd/WUe1mB6qh2/QMGjOowlQhvlrTHaoMQDg1ZBo5/2tlw
	eWm3Y8Eg7xQDTRMWzSMkS99j/NfqOELqMh6+FjyB1abwt2zxTh2O2cLzaM7CtIXyh3IhJQ8S4IU
	UMFYK9q2BqBeIhlXfdk3qgVodTsM7nguaeagDbw3QwkGGkk0frELxIwcN5zOPyF4u3+sX4MoUFc
	mORY4Q0AoroYhdMjnQalYU4yDAwY3VQj21SuUPQPi2JqwY37Sp1D0BZ5LKzmmuMDq/kdTcqVrKv
	wz1U31O1IqXF1yu+CpA99i3Rc34oJLFn6vVaZrU/gMBUNntr7cA/XnNrRJBPLxuMyQ0WWmk50Sm
	HQdbdE7ZIwogZ+ojQihtUk0kec3s=
X-Received: by 2002:a17:903:944:b0:237:f7f8:7453 with SMTP id d9443c01a7336-23dee0dff73mr13953185ad.51.1752187562678;
        Thu, 10 Jul 2025 15:46:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsToXwVRifnNntKFg0y25mkyPcXWWREZRxNC6sUDzHSHUhCziAj4udao5hth8gDYMUngSZyw==
X-Received: by 2002:a17:903:944:b0:237:f7f8:7453 with SMTP id d9443c01a7336-23dee0dff73mr13952835ad.51.1752187562271;
        Thu, 10 Jul 2025 15:46:02 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm30479615ad.189.2025.07.10.15.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 15:46:01 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 4/5] thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC peripherals
Date: Thu, 10 Jul 2025 15:45:54 -0700
Message-Id: <20250710224555.3047790-5-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710224555.3047790-1-anjelique.melendez@oss.qualcomm.com>
References: <20250710224555.3047790-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=687042ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=N9IR0GguogMVy2wE49AA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ckMHyc3RoEAvT2HYXQPo01_2y7uqx54c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE5MSBTYWx0ZWRfXxeiOuLsljgc5
 fdz0taqL7VkQFf0maONmIVv256uUZHLPCA7qkGyMOI3+0SOcLI2wsbiowhqQtyljJz0lCUJfhfa
 DO6KNt5DmdP4hZ7nEFfqYq53Gi5O5zjEvtS3+cfIxts6nrpEro7ghmOtaWkkO0pa4Al9zRegqd5
 jKt7fOhJS/nkHFMNasO1MKtHdiMEweX1lY7tdBskCVkzJZJP97z8gsjKKLqv0XdE/Tud7NNlEq0
 4m8sfG3z3/7vTDUqJZ+YnaOy0c+1ta3NcWZ0IYJKGC2IP0NJfYzcTLztTFR6cThrWjnNrlzqi3k
 H8sIkwmVzBj3tom8TaCJ6BOen1EUXepEubyop6ujR2Ib8LhdcLCe6b262oCVXhPOP9DumEAHALy
 u8ZAErvDDRPyIsgl9UP8E+YXwJNwMb/aQIjX7MNkanGi4mbEtIVF1uzn1w1E9jTl7oTmjwhq
X-Proofpoint-GUID: ckMHyc3RoEAvT2HYXQPo01_2y7uqx54c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100191

Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
revision 2.  This revision utilizes individual temp DAC registers
to set the threshold temperature for over-temperature stages 1 (warning),
2 (system shutdown), and 3 (emergency shutdown) instead of a single
register to specify a set of thresholds.

Co-developed-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 138 +++++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index c8e4db585d2b..9fbfd192017d 100644
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
@@ -71,6 +76,25 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
 
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
 
@@ -93,6 +117,7 @@ struct qpnp_tm_chip {
 	long				temp;
 	unsigned int			stage;
 	unsigned int			base;
+	unsigned int			ntrips;
 	/* protects .thresh, .stage and chip registers */
 	struct mutex			lock;
 	bool				initialized;
@@ -310,6 +335,54 @@ static const struct thermal_zone_device_ops qpnp_tm_sensor_ops = {
 	.set_trip_temp = qpnp_tm_set_trip_temp,
 };
 
+static int qpnp_tm_gen2_rev2_set_temp_thresh(struct qpnp_tm_chip *chip, unsigned int trip, int temp)
+{
+	int ret, temp_cfg;
+	u8 reg;
+
+	WARN_ON(!mutex_is_locked(&chip->lock));
+
+	if (trip >= STAGE_COUNT) {
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
@@ -351,6 +424,60 @@ static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
 	return ret;
 }
 
+/* Configure TEMP_DAC registers based on DT thermal_zone trips */
+static int qpnp_tm_gen2_rev2_configure_trip_temps_cb(struct thermal_trip *trip, void *data)
+{
+	struct qpnp_tm_chip *chip = data;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	trip->priv = THERMAL_INT_TO_TRIP_PRIV(chip->ntrips);
+	ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, chip->ntrips, trip->temperature);
+	chip->ntrips++;
+	mutex_unlock(&chip->lock);
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
+static int qpnp_tm_gen2_rev2_sync_thresholds(struct qpnp_tm_chip *chip)
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
@@ -375,6 +502,13 @@ static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
 	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
 };
 
+static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev2_data = {
+	.ops = &qpnp_tm_gen2_rev2_sensor_ops,
+	.sync_thresholds = qpnp_tm_gen2_rev2_sync_thresholds,
+	.configure_trip_temps = qpnp_tm_gen2_rev2_configure_trip_temps,
+	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
+};
+
 /*
  * This function initializes the internal temp value based on only the
  * current thermal stage and threshold.
@@ -491,8 +625,10 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 		chip->data = &spmi_temp_alarm_data;
 	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major == 0)
 		chip->data = &spmi_temp_alarm_gen2_data;
-	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major == 1)
 		chip->data = &spmi_temp_alarm_gen2_rev1_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 2)
+		chip->data = &spmi_temp_alarm_gen2_rev2_data;
 	else
 		return -ENODEV;
 
-- 
2.34.1


