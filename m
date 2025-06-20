Return-Path: <linux-arm-msm+bounces-61845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5AEAE1050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 02:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F56D19E18F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 00:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4F7F9D6;
	Fri, 20 Jun 2025 00:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzxIa6uw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497E079C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378766; cv=none; b=uWL7SaixZgRJCDfY7MitbLZQDwk3LOmj1A1+1pH77C8laZ7Kf5bLefbQzs/bcBZI6caQNKtNUA5mjc+/RVMynkzVe1F9lJETBrvdyoBPH4eDLKBFTdx31qRLgdfr21c0kL6X1znCyh19zEi9s4emv2u2vws1W/A+A0Z3WI4jhk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378766; c=relaxed/simple;
	bh=YP4k9QschG0AjS2rMA7NHJ0jJlIdIYsNCh9n+pPxaKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uRmCEpv/Oe5Yfk8TkpMFXpcTnvVs4cwt1XcSnXCFI3GaO4WiZFuJY4qvT4cYdgmtwnbSCyvhc678jqcC+q3bwTPOAdvTKbAg6TrEqfH0kXfg/Xi5LIWwsZWFcs2oBp+In71BDOkxmgqWkSPsFHOFapDtqwNvBKJ10eH7A0uGedI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzxIa6uw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JG1Zlf008236
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2gXCAwb/YH9
	N04uJhkwajLdTXMd2G9XaQqnRPyOCURk=; b=lzxIa6uwG73N3MlZyUxdWjESkGx
	KXIscMUZKjYj3s7O7gAWEV9LFIVYjeisipIgoo+ElEaEHP17MgOMT1VFsqerugFO
	LKaMqTlCuLQHwp5RBKUtg+7/LzVCwUjB4yxyN0fWmv7qQ8EO6DXTUDo1sxDGAND+
	4xtlWWy9E+OY4/LarId4g+CV2C+Wp3/YB1OOb0y+bG76scOClvtFBaAmP0RTxoaH
	PxD6eHCGDfyy4MRGrNSANvKvQtNS7fn17WtP07ezLRJD5R/QKcbNcDx3VShRT+da
	qFN8WloZZuRRa3aLPye4b89rnb3IfAFkp+uDXWQk7rJWq6UM50ucn25Qkpg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928msds3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31c9a9dcc3so1349058a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 17:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750378763; x=1750983563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gXCAwb/YH9N04uJhkwajLdTXMd2G9XaQqnRPyOCURk=;
        b=QU6LNrThe/IxEoLpAWf+jco0dr7hOYY/0LKDeCSsIPBRO4wnZvL2Hh3GqWKEiIdUEq
         Sw182RfJ2VdmjMdVdEPNItUaQk8aW8SgxYoj7qoYRwVUlPq2STs7LTNa0K/tQHEOPUAU
         t7SYiaH/OZQOSuN9tBMyYZTlp8BMAjewK/dCC5DVCiI8UMMHyQd5JUT7wKkDahZibhde
         LPn6N/Pz2xB/gPuqx1VWCsxKoxar/+dfj/P7EJ1ZckFR0/PYwmlwNAT79twzDQ14CTa2
         MkF6B2w4qmxqH05LhjjmsH6xVAKs8ZWelj+laj6GjpnxMgQZF3wlZ7Fyw3xQH13EUG13
         wUww==
X-Forwarded-Encrypted: i=1; AJvYcCUQPxSCK+Q5ejKfRwx5vCGo144Cr68hGbHju0IsTXvfK2rCKPhbKfgJ9Ee0BSR4LIhzz4hG0IFTgux1QpYl@vger.kernel.org
X-Gm-Message-State: AOJu0YyId3SYGv0eQU2bTOrjRf/+3p9uQRG+oNab3itDF43SF5KUpY8k
	iRaPNitYog8z16C1T3M5fQ3NZWDd/C1IZQvQsl7c5PrsjxfQSTxRJUKsNn3P1DubzFixR81m6/V
	MzUNsJYEWF9b8rlQ+d/JUKM8MIcEUWdABtNDOq8PJoBEEsK9gv7lP8kq6bmY/8VbG53vt
X-Gm-Gg: ASbGncs+KbL+b4bS5l4t2WkG4N14RlAnGw1HFO0fDjgZn0tNPRSKiTj823LIs/Uhhob
	gCVEkF209zu0Hhv3CbYmQtLkUBlwFtZKXjvX6/eKjz2xi+vsYO4SrcHcsQClRz5Z2S88ngh9iaH
	syHJPGmPKiOxbESQ/IqIGA/ui/E+q4wZDM5ylct+AIWBwI5Y9uwGj+JEW3aRKl2o4Q8AMdePeQ9
	+C13omYDCP5TR3OkFJvNr5Wt6Y7zlGHilozPS9akIVkCQNhZKRbGJqSOXwPj+yqp4VuZgcPoyO8
	IHjA58iJ4ftzxB6s42F0sjmiW/h+MICamNSKvVYtfQEjKYYQAieJOanABRkwkzZ8AhmJSMVJhQ/
	pEGikStUFCA==
X-Received: by 2002:a05:6a20:6f8d:b0:21f:512c:ba2c with SMTP id adf61e73a8af0-22026f35f0dmr1174291637.34.1750378763210;
        Thu, 19 Jun 2025 17:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhcMCv+o+5Af3IzwCYcGH5yNr+p4GBtvgpFrkdY1m3e6sMiRrCofUScRf5wTP2PrOb3Zjm7w==
X-Received: by 2002:a05:6a20:6f8d:b0:21f:512c:ba2c with SMTP id adf61e73a8af0-22026f35f0dmr1174252637.34.1750378762767;
        Thu, 19 Jun 2025 17:19:22 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258932sm410011a12.64.2025.06.19.17.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:19:22 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v5 2/5] thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW subtype
Date: Thu, 19 Jun 2025 17:19:15 -0700
Message-Id: <20250620001918.4090853-3-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwMCBTYWx0ZWRfX3OviJfx2C7nU
 D5X8YUywTgDYiliZyGTD/8pYw9Wkpgh8ydhwTaUAsasvhJPkeaK2T+X4pY9vRoddDH9KDKbQ6Ti
 8nLAsCZ1P0eej87LHhDrQcyav54U0MrArNOGLejIYBcNzCjhicz/Ldk50WMi21+heprYxjCtPKy
 Ddi/PbNSPe0+2aLIfRuaoZVDfWamg++kx5w4cmOloJaYAmowwkCwvfizrT0SuXtOtTecPYZNzXN
 rgTZf1VHjxiCI4oOfgpC9JHd6gHZefXwbACnIKdRjAEkvej0iPQpYZkHqq/cXra9SVHAB5xTXg4
 D7yiqlB19+1Q6vaBRF1zZa1QKVi+5saLM7pkbpQeRyjYaOyerOi7WutxqOkEvTluuNBFi7N1GTT
 3O14XZRopFGKsOubciNiX+t77UTJuoeJjX1TvHFxuak5eNDkdNKkqF6r2ZbmCAW197SxoxMM
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6854a90c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=P94jSCoFVATTS2qIwVMA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6u0WYGbaDHVzQVHlzzqNLwxYzel8cMqw
X-Proofpoint-ORIG-GUID: 6u0WYGbaDHVzQVHlzzqNLwxYzel8cMqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200000

Currently multiple if/else statements are used in functions to decipher
between SPMI temp alarm Gen 1, Gen 2 and Gen 2 Rev 1 functionality. Instead
refactor the driver so that SPMI temp alarm chips will have reference to a
spmi_temp_alarm_data struct which defines data and function callbacks
based on the HW subtype.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 127 +++++++++++++-------
 1 file changed, 81 insertions(+), 46 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 47248a843591..fdabde39a7e5 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -4,6 +4,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
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
@@ -68,22 +68,29 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
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
 	long				temp;
-	unsigned int			thresh;
 	unsigned int			stage;
 	unsigned int			base;
 	/* protects .thresh, .stage and chip registers */
 	struct mutex			lock;
 	bool				initialized;
 	bool				require_s2_shutdown;
+	long				temp_thresh_map[STAGE_COUNT];
 
 	struct iio_channel		*adc;
-	const long			(*temp_map)[THRESH_COUNT][STAGE_COUNT];
 };
 
 /* This array maps from GEN2 alarm state to GEN1 alarm stage */
@@ -117,20 +124,19 @@ static int qpnp_tm_write(struct qpnp_tm_chip *chip, u16 addr, u8 data)
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
@@ -139,12 +145,27 @@ static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
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
@@ -153,23 +174,16 @@ static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
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
@@ -181,7 +195,7 @@ static int qpnp_tm_update_temp_no_adc(struct qpnp_tm_chip *chip)
 				- TEMP_STAGE_HYSTERESIS;
 	}
 
-	chip->stage = stage;
+	chip->stage = stage_new;
 
 	return 0;
 }
@@ -221,10 +235,10 @@ static int qpnp_tm_get_temp(struct thermal_zone_device *tz, int *temp)
 static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 					     int temp)
 {
-	long stage2_threshold_min = (*chip->temp_map)[THRESH_MIN][1];
-	long stage2_threshold_max = (*chip->temp_map)[THRESH_MAX][1];
+	long stage2_threshold_min = (*chip->data->temp_map)[THRESH_MIN][1];
+	long stage2_threshold_max = (*chip->data->temp_map)[THRESH_MAX][1];
 	bool disable_s2_shutdown = false;
-	u8 reg;
+	u8 reg, threshold;
 
 	WARN_ON(!mutex_is_locked(&chip->lock));
 
@@ -236,17 +250,17 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 
 	if (temp == THERMAL_TEMP_INVALID ||
 	    temp < stage2_threshold_min) {
-		chip->thresh = THRESH_MIN;
+		threshold = THRESH_MIN;
 		goto skip;
 	}
 
 	if (temp <= stage2_threshold_max) {
-		chip->thresh = THRESH_MAX -
+		threshold = THRESH_MAX -
 			((stage2_threshold_max - temp) /
 			 TEMP_THRESH_STEP);
 		disable_s2_shutdown = true;
 	} else {
-		chip->thresh = THRESH_MAX;
+		threshold = THRESH_MAX;
 
 		if (chip->adc)
 			disable_s2_shutdown = true;
@@ -257,7 +271,9 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 	}
 
 skip:
-	reg |= chip->thresh;
+	memcpy(chip->temp_thresh_map, chip->data->temp_map[threshold],
+		sizeof(chip->temp_thresh_map));
+	reg |= threshold;
 	if (disable_s2_shutdown && !chip->require_s2_shutdown)
 		reg |= SHUTDOWN_CTRL1_OVERRIDE_S2;
 
@@ -294,6 +310,21 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
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
@@ -301,10 +332,10 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
  */
 static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 {
-	unsigned int stage;
-	int ret;
-	u8 reg = 0;
 	int crit_temp;
+	u8 threshold;
+	u8 reg = 0;
+	int ret;
 
 	mutex_lock(&chip->lock);
 
@@ -312,19 +343,19 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 	if (ret < 0)
 		goto out;
 
-	chip->thresh = reg & SHUTDOWN_CTRL1_THRESHOLD_MASK;
+	threshold = reg & SHUTDOWN_CTRL1_THRESHOLD_MASK;
+	memcpy(chip->temp_thresh_map, chip->data->temp_map[threshold],
+		sizeof(chip->temp_thresh_map));
+
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
 
@@ -419,10 +450,14 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	}
 
 	chip->subtype = subtype;
-	if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
-		chip->temp_map = &temp_map_gen2_v1;
+	if (subtype == QPNP_TM_SUBTYPE_GEN1)
+		chip->data = &spmi_temp_alarm_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
+		chip->data = &spmi_temp_alarm_gen2_rev1_data;
+	else if (subtype == QPNP_TM_SUBTYPE_GEN2)
+		chip->data = &spmi_temp_alarm_gen2_data;
 	else
-		chip->temp_map = &temp_map_gen1;
+		return -ENODEV;
 
 	if (chip->subtype == QPNP_TM_SUBTYPE_GEN2) {
 		dig_revision = (dig_major << 8) | dig_minor;
-- 
2.34.1


