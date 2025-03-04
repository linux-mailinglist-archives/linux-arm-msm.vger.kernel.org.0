Return-Path: <linux-arm-msm+bounces-50292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E79BFA4F12F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 00:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C1CF189175E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 23:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9D427CB29;
	Tue,  4 Mar 2025 23:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsqEJAnN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B127CB0D
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741129519; cv=none; b=Szhn4E2Z3ygdRM4FS4g6m4JhTkCBty+UoqemHik3AD93YQueB5m2k+hhPnXaKC3BRw7u7aE1E000SimD3Z6rl1kCXrtivQqaOJ9vzRnsxHhl4WuCbduU74xcLSJP446QIdMXcT/9kfNRJK4doSFgRS6SbFfR3E/Dr9BL1VcwDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741129519; c=relaxed/simple;
	bh=TXVz2/T0OBMtfqAXnLHMdu8+NX9jjpGzRajAY7ANRI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QHOYFbxLjZf2qn9k7T4RPLA+o3RObFrvTofDVNxgdN/Aa8k/cYILU4YNCNACV4TUg7FRFWYFDbOEIPZYxh6+cva+ef8iTGUtQKHng7sEVyqB7CotVo7AlrRrzSMuLKwYqbH2U1jtjqBSGmo9BU9BKuAsMGITqXgA9GISARcqlG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsqEJAnN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524M5JsF021140
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 23:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LIlSavennvF
	SuEJSQHTgSgc2W+NpJOFIMTRCL7znOuc=; b=lsqEJAnNBob8x4xq9eXt2Oj66Vv
	lq/+Yq5B6RsztzDT5F0gXzrLKO6+LWI7uJNYk+YYjdzVDKsyoOVOaYaD3Zk29kxM
	z9JTyC+bIYV+QemnIYNqIM/zwB8T7t3PILXyNdOADlXzwWO8gQBPxhcF4tSjnMGe
	IFqTEgUxRcWfPIuJ9/VZploce935A7kGKhsONcVlQI0nHkdsTrmeP3N69N20j9Ct
	5DzWq0To5Z2XJqpd+vHjgPmB2c+ArmWr92HjmT7vWsgEwnqAd+cE0AOKXQD8SADp
	tfvUr3bXyAyB+e1+MDJHqHq+x84ZTfuFUVYGrhNx+//pidLDOV9zOhFmAwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tudwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 23:05:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22366bcf24bso86395315ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 15:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741129511; x=1741734311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIlSavennvFSuEJSQHTgSgc2W+NpJOFIMTRCL7znOuc=;
        b=NXijDRifwBNmn2By+Si9YZM6h/uPuhr9YYX2N6WmZQ9K5oAxabn367p1L5jDFFtYh2
         kjgrgC4ylHHaqSP4+pk+S5LXtHAi6FZMlFahguBH6DGiWYLKh5ZbJrcW67CHlmB7Ukyk
         vqm9L5usU89HNmlnxvYu0BRuYv7yDltDNlK5ACNTNtYZ1SBIo7nYrjNH45AFdEBwogkr
         dzM34DvpTSgoOoyXHapKp+ceY2Kb7SDblDL1jKtTHSixuocl9HktQ8hQBvZdBuAvGTA8
         0LJ/5eXBgwGxgxbzEbSjTPCqrR49Vli1QVu0j94k6avsNkClzhE79gt9K2wsoLeBLaS8
         cOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCURcFPKQfHH2gFPmMc3t6sdn+9m4MYBC/HJ2WrIpJu/4uo07Idx1BI5bLhi5T4rKPLOTZ1kzn59BF78Ws82@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0icoh+lg0N0/VyojIQq9QXvJiJi5eMqbpkocOkb/sG4n/v28g
	5Bn5njlR34JttwfWm/eFWS4Quq8Hr4KxjC/Ujktnhn6JNFi2ppH0QfEJfNPcT767qKxZHTAABPM
	c/Rno7JoszmSpmSVFs/pnKb3f2sE9yvWeq3S7pht0D6Xt4Au0khISNue2XjjZ0+9E
X-Gm-Gg: ASbGnctQoBt2W7kNIYMNmfo8A5iSzgTfFXtuZx4fAPrUbd0pqKpk3x+jFY4NO16fvqr
	Uw1MLg3sx2ao9tO+rRodQ1ZxqLkTGQG5q46i8Xq8ctDVzI1QJdUzuhiZ0jjjddSbvhJBV3neifM
	1DpS0HLR104gh00GMCPYEzUfUlQgS+tbrM1VNbzPQXAYtBcoFq9kd1kvXPi9tlg00DmrxwkM2gZ
	hM9fCy/eYiPvgHRilxuMMEyUryNu/vHJbAUsPbDHAz+cqTOAi1Azx3an1aDAh8n2t9D3WY+i9nO
	saAJCZ8meN418SsZMHDS/QmW6eBObskN3nYCunWSacKcDrAaw62KUa4p2kbF4wECGebWLglrsuK
	BwBk=
X-Received: by 2002:a05:6a00:1892:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73682cd64efmr1242925b3a.24.1741129510463;
        Tue, 04 Mar 2025 15:05:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFyiNwM0LLDAh8uHfwIAMuMOtub9khmkWrm/Vp0ZSDWCv/dl1Kcb27LmTI7AbMdUpmkg0phA==
X-Received: by 2002:a05:6a00:1892:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73682cd64efmr1242873b3a.24.1741129509967;
        Tue, 04 Mar 2025 15:05:09 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cfd9sm11492793b3a.76.2025.03.04.15.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 15:05:08 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 4/5] thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC peripherals
Date: Tue,  4 Mar 2025 15:05:01 -0800
Message-Id: <20250304230502.1470523-5-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-GUID: F8pLFy6s0MMzaDale5KQWsggpKO-1wEu
X-Proofpoint-ORIG-GUID: F8pLFy6s0MMzaDale5KQWsggpKO-1wEu
X-Authority-Analysis: v=2.4 cv=Sf4NduRu c=1 sm=1 tr=0 ts=67c7872c cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=4OMqYXV_ruVW7JoEK48A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040184

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


