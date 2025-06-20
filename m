Return-Path: <linux-arm-msm+bounces-61847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B12AE1056
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 02:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E9AC7ADAB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 00:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4B14C80;
	Fri, 20 Jun 2025 00:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1x418cz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D124A27442
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378770; cv=none; b=R7PvsM0vATcvUJNRxqIigjqUlXLLuVHx3u6S7+QozZl1Q0WxZPBTcMF5ip7ceBy2aGAahNvZDjp+cDK+GvtoxX0TF8XnOPsComnDXc0uk1Hp4XImpnFjLowjkIt3CAHCaFmxoLCv+Z4YtqvSELqsQl7+Ghy/24qVIrrDJsx6m50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378770; c=relaxed/simple;
	bh=pzdo6tQoIHPimPo2tPRlSVpfJ/45dsevy0rACzrOEKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nCpdC4MFWhqpxYLCmHtoauBPThbDcxovLtOLjikmc8eR7V6GiF1hz8Y+qp4/xlRJSy5Zs8QDG86iRtv/kibK+a+7FVJPyFkECuWWGjzPYdVqxuyipz2wF2SvdrUuYFtsWXfywbr8/jRotQXeHLczIo75HPg3frZzsovwRSGg7x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1x418cz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFe2jZ005319
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z6SbEMNz1or
	fQ/MzmtK0pbCD/N4EvDE2FmiULlhYxsU=; b=B1x418czm8QQhQhrghBaqg2T9H2
	SkOZO4KVDHyif8ZHNzRcjfjsufffYhC/sBG5XFmPKHCGbhFFSa0/ePxUVhhFAWP2
	l3Sto44tRX13qcllE/2Xs4RRCZ1Uv5v7ludq3gx4GW6RjQ/F2268SIW+Zy5vUSxL
	5y66Phwsb09kmuzIzTtHBgKzlJCW2wZF9PNgkzO7wKsvOlZru7xhKivg2CEGX6QP
	0O1dR/KtmKQdWnsdMLKU1ktQ1bfddducRzjr5/zHDuf740zdRbrD6zuhpB5fRRQr
	v/G+q3MV0Rmuv6lL2n3RggN5u/4uR96IjSJhWWz5Kr2LVFSVnXrALPVgRwQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag23dg4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7377139d8b1so1052170b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 17:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750378766; x=1750983566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6SbEMNz1orfQ/MzmtK0pbCD/N4EvDE2FmiULlhYxsU=;
        b=mMiZFBU/xqBLgAovMWTBby0taHFF9vjGoorDsyfyJ7WGUA92ZiRtBpR1pjY96QlQtT
         lm4D6K/gtNT0u2QlmOEWiuumqbrerrTWwXS4fBeCsjGxnJIFy0mbgqQU7RgHyZYfsp8F
         +naW6msL++9lr3M2O5fhGNz3Pihsp8F4mfTNG6dOZN8qAIMUKLZAhL57tEvSivVAEMsf
         FX9culSHZWxBXFPEQWxNl1K6ecEMG8k9FaQ20byuI+yM+GLr6ehGofTmGYI1BEWw8exJ
         gWN3F2cWqZKgfgMgyuI/h1s4MIwwi/Ok8qyD8rhjeQ3OFI06zCDJi/7KSzHOn9KBTbqX
         J6JA==
X-Forwarded-Encrypted: i=1; AJvYcCVFwqZwPRciTRnp8KGy7YaMZhJywNUg5fbYSnsPkCxtIL8tl8JuGCtBjwDtSFWVm4Dh8X78f8F3xqk5Cs51@vger.kernel.org
X-Gm-Message-State: AOJu0YxUXvyiEY7ni8K4vEbTv6B0JLfdorRH2CaYgosXMs1kaMCuoBQs
	zRmdU1fYa0T6PEMrcVpH6h84RxCkkTcKCUNN+GdJ4CVcSnC3kgy4GIl8qr2tBjRekjTbFZ4Fcoy
	vhqO1BO7skwg+qu005e3zwqQwtqhDXiDur/E04J4uaiovY5ELHmOW65Qmt48DdlV8tVCd
X-Gm-Gg: ASbGncvubrJFfkwZGscKlJnO7N4UUcC73blxLFh3STvhUl2YHf9Cwh9k7N6TuZUrMlf
	KdAmGiao1TsI12pMy05HEaBnaIJNqx+4Eif8lT+teQ/Hc3Tc+csDncbWVaYVq+KJd8CsdoYgmnc
	AkeuNGioONok0lBFBEzuIIn3PlETL71qv6l5bqMDes45vNgvRPR3cPYRihdSWOisbDPz/PwwC/x
	V8efOkQ63muPoY7Ri0jOaXJ1aBAvw6SiuECPB7PhD7SYRx05HGB2AbLZs8p1bq8TfQ9IWUVNeta
	4IsMwHZkHx7J4TrRJkaiJgqHlUODt5tdUcvdi06i7sWBaz/vF/6jRhfeXT6EKA/HBzffmtk4inE
	aAYtqruiTmA==
X-Received: by 2002:a05:6a21:7a82:b0:21f:ff2d:aa03 with SMTP id adf61e73a8af0-22026ef77a8mr1040014637.33.1750378766241;
        Thu, 19 Jun 2025 17:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfUUVjcJunIMPoNK0f+0az63DmOL1dGnN+uT5q0XzPCZjt5cp5a+9gyAuS+rD66equPP0egg==
X-Received: by 2002:a05:6a21:7a82:b0:21f:ff2d:aa03 with SMTP id adf61e73a8af0-22026ef77a8mr1039970637.33.1750378765779;
        Thu, 19 Jun 2025 17:19:25 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258932sm410011a12.64.2025.06.19.17.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:19:25 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v5 4/5] thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC peripherals
Date: Thu, 19 Jun 2025 17:19:17 -0700
Message-Id: <20250620001918.4090853-5-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Yl7AAm0njDM-VIZr-_62bEgnHdPal3y1
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6854a90f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=N9IR0GguogMVy2wE49AA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwMCBTYWx0ZWRfX6n0PrStlLJ0v
 5wizQM3bkTu4kidrZjQmH9kvfPwcz2SApl4X5+EsmmZT0KpaI5lzwENydCzxpJMwanxebpFge9A
 hANK4r32a8H9LtRpjRN/bi2ojgTmnJfoQa+A9PlPWdnbMNTUkt9T6971Af5NfZ7Xi6N5V+VNlHx
 EKWNn/R6WDsRS1w8rs6t4SUGbefVOGBSLkjCpnIRlNkicxfQrDbNQ6ZK/OADBhHBvpV/l5fzMqC
 QOaZ/cqiYq0QwWiA8JZSx0+cU3Qy6EPl9efKDZjOZlvIdwxVw07QzLdwyOo7sBvCtzqvJ8z3A6S
 cCewUD2VXMkjJTi+wBqMoninirdLhmSs0LDeQ9hCWW3xUTHpE//MAo+xH1xTUWcwNcPIcF/XM0m
 F4V2e9bI5M+x9eBp8Mv3kj5Tg89cVJfYxDlcrsjJ7nR6j/QonIJKjBbldwWfwnwslN6k6x8m
X-Proofpoint-GUID: Yl7AAm0njDM-VIZr-_62bEgnHdPal3y1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200000

Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
revision 2.  This revision utilizes individual temp DAC registers
to set the threshold temperature for over-temperature stages 1 (warning),
2 (system shutdown), and 3 (emergency shutdown) instead of a single
register to specify a set of thresholds.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 136 ++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 5991067d3484..0e0b0a8b2367 100644
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
 
@@ -87,6 +111,7 @@ struct qpnp_tm_chip {
 	long				temp;
 	unsigned int			stage;
 	unsigned int			base;
+	unsigned int			ntrips;
 	/* protects .thresh, .stage and chip registers */
 	struct mutex			lock;
 	bool				initialized;
@@ -304,6 +329,54 @@ static const struct thermal_zone_device_ops qpnp_tm_sensor_ops = {
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
@@ -345,6 +418,60 @@ static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
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
@@ -369,6 +496,13 @@ static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
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
  * This function intializes the internal temp value based on only the
  * current thermal stage and threshold.
@@ -486,6 +620,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	chip->subtype = subtype;
 	if (subtype == QPNP_TM_SUBTYPE_GEN1)
 		chip->data = &spmi_temp_alarm_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 2)
+		chip->data = &spmi_temp_alarm_gen2_rev2_data;
 	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
 		chip->data = &spmi_temp_alarm_gen2_rev1_data;
 	else if (subtype == QPNP_TM_SUBTYPE_GEN2)
-- 
2.34.1


