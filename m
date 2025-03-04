Return-Path: <linux-arm-msm+bounces-50290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39047A4F123
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 00:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53E7A172DE7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 23:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B3B27BF8D;
	Tue,  4 Mar 2025 23:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvqL0/GC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B40A27817F
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 23:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741129513; cv=none; b=meDy85Ra9eDgFa9lFPRuscySFRwwkfWnGWhWNqcssjod6QhPzcfzIUj0w+IC9OyqGlcwUkdCjLNiimW+PdIt9OtCHENVvILO6JNiKik8tSmOaoj679n4YtMqpv3UoZDw/w1ewzZwHgZcpsAfPELRr62gPnu2FfgZv4krNYU1tuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741129513; c=relaxed/simple;
	bh=DNXVnMOqwb8fWB/J/SIbMZJRwIg2Q5PHwQoBAEHkhoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bTqyEc2LXm4qyehTMV0MP7KiekfPD7pl5RAbPrCHIzMvEtGiAbzSHltA9ca0vu1lqUTcjRvYvaXrOJCk3w+9Qg6ne7+1WoCUFtVoBtZpwjya7HtQsch2jFqXTKHgB8u0y6f4/cqB746IeRWgc+oL9mejz5MWCAdd2a0hbLzYpkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvqL0/GC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524MCpcS025679
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 23:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=egiacthqZDG
	pHiFeoWLEDtn1W1SQg/ufELhmV7ySKG4=; b=GvqL0/GCEbnD1s1N7XYco/JqZoU
	QtVb3tqbwiSRkA6EYFqAkTtbIfzAy3f+4GjRbXajqp9L3NCDt8JgC5E46bwK2mAi
	bTk1TnVoIO1iJHIdWgpAvKSPQ7E9TBfYXzhWqnL772uUXjxZo+2ZMzaSOpHWd2z/
	m4yWSqW6puiAK0Edil0kYWZFpgpuWN/QGko3/688yC5RDptIV+/zI4pdDt2Yjeb+
	q8Qh4GpCrLNmPp/NkoZ8NDBnd11dzaSOmAFguA4AIsuqnmy1POET2XkXVleXWdKz
	h15eRtOhRbex8kBu5/YftX9w1vU19qgNpGJL707Wh4UxAhUkOc86xMT524w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vbcxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 23:05:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22328fb6cbfso109777755ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 15:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741129509; x=1741734309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egiacthqZDGpHiFeoWLEDtn1W1SQg/ufELhmV7ySKG4=;
        b=AcKaH4oiCxy/NLZoeWKZMYoApZCU2m1vn85akjW1LI18K4axYbk3prZhSmesBeGnjv
         Nu2jG0CyfGMbFW+uAKwAoYNAkTeGkCRGlNiuISI7ECyKOe8LoUesFhBgg+fWAsf6e5we
         pcJ2JiNjuRgGtvlJPUJQJknEfu7qTC9TDMM6x1n1XEmgrY6DKtHLZFimFKVmc+CFwdWk
         SsDwUBQVRPWDEoFeRt+Mnpfna7AgzXHKf3NUEbFz0dNAZxS+4Zejtc3zBs8LSEAH+WRa
         /3D7NurA9nVDeIUh6k7mSEpAYHeqwnSgCIWBQGBI6W7a1dlbg2ePKdzzaCswBsvKQjbq
         Q4pg==
X-Forwarded-Encrypted: i=1; AJvYcCXDiIt8a6KMkMpHFNVqxHFfnPdpqjTtnXnd76ZB54ZayzN5O4QiEjL4xYH7d3H5c42HZRR6Yn6Oejrsjlpp@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBwGzRdoCEpMKfIYsYbV4s02GPmIBR5iD5OZ/f5cmtB3EK2dd
	1ubU1vS466BmN49r8Sl9Gy7gr+UjKVRmvD2vePTSq7zpOY+mwnJXfIB1fbFzaqdwG80b0Rii+rv
	XCF+HJMuqqGRKrBWetD87j4YmNfREnpuxODNTH0Z3IuEkORgcB4aOZ7QbAm8tEONs
X-Gm-Gg: ASbGncvCjkwtiHlIx9pMu4Pp4NFSzLGQ/kLaKgcSt05mR2CRTjhJafdsuBthiWHC+N4
	hjqboh2d9kaNzCvFCKoVaAK9XPVJ8LlrB4BAe9TrfG/tDTy/+JqowGJ5Ub/fhnDIw+2jiF/Fstv
	326JP+zvSMooQIq7OL5PyzXFfBPv8/sxHPN8lXUgHA+4nLxHOcLqN4qwsodnVVhBvk4RwySgGbi
	n574jVsKps5XG/uoqO4qMtQvv3S2l6EfmZdx3t+13G4c3yLLFhaaE6WvwWzKXamuX9XmzCSMFWt
	+w07+J8IlOTArQCdgOMqX2LORG+s9ypoKM+Y9UQ7IqDw+P5g77zRgwwZYAncRwkc1M/TLJ1P9lH
	Q+hQ=
X-Received: by 2002:a05:6a21:8dc2:b0:1ee:e701:1fab with SMTP id adf61e73a8af0-1f3495bea3amr1756316637.36.1741129508707;
        Tue, 04 Mar 2025 15:05:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbz+RyBjUh8IVTJNjwpudpriztlUQAAl7x7PmY8XHiOVBwrL7q4emwJnolK8CS8pXOyDaBXQ==
X-Received: by 2002:a05:6a21:8dc2:b0:1ee:e701:1fab with SMTP id adf61e73a8af0-1f3495bea3amr1756264637.36.1741129508261;
        Tue, 04 Mar 2025 15:05:08 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cfd9sm11492793b3a.76.2025.03.04.15.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 15:05:07 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 3/5] thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp Alarm subtypes
Date: Tue,  4 Mar 2025 15:05:00 -0800
Message-Id: <20250304230502.1470523-4-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vPlTaiBAmRMDUuOgee6h_yxOYCeDpZE-
X-Authority-Analysis: v=2.4 cv=bPnsIO+Z c=1 sm=1 tr=0 ts=67c78726 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=7un5503AD7E7R8fKnWkA:9 a=RVmHIydaz68A:10 a=2kiUGkeb1pZ_ou3T1mbW:22
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vPlTaiBAmRMDUuOgee6h_yxOYCeDpZE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040184

In preparation to support newer temp alarm subtypes, add the "ops" and
"configure_trip_temps" references to spmi_temp_alarm_data. This will
allow for each Temp Alarm subtype to define its own
thermal_zone_device_ops and properly configure thermal trip temperature.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 38 ++++++++++++++-------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 1cc9369ca9e1..514772e94a28 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
- * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -71,8 +71,10 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
 struct qpnp_tm_chip;
 
 struct spmi_temp_alarm_data {
+	const struct thermal_zone_device_ops *ops;
 	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
 	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
+	int (*configure_trip_temps)(struct qpnp_tm_chip *chip);
 };
 
 struct qpnp_tm_chip {
@@ -312,18 +314,39 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
+{
+	int crit_temp, ret;
+
+	mutex_unlock(&chip->lock);
+
+	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
+	if (ret)
+		crit_temp = THERMAL_TEMP_INVALID;
+
+	mutex_lock(&chip->lock);
+
+	return qpnp_tm_update_critical_trip_temp(chip, crit_temp);
+}
+
 static const struct spmi_temp_alarm_data spmi_temp_alarm_data = {
+	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen1,
+	.configure_trip_temps = qpnp_tm_configure_trip_temp,
 	.get_temp_stage = qpnp_tm_gen1_get_temp_stage,
 };
 
 static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_data = {
+	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen1,
+	.configure_trip_temps = qpnp_tm_configure_trip_temp,
 	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
 };
 
 static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
+	.ops = &qpnp_tm_sensor_ops,
 	.temp_map = &temp_map_gen2_v1,
+	.configure_trip_temps = qpnp_tm_configure_trip_temp,
 	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
 };
 
@@ -336,7 +359,6 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 {
 	int ret;
 	u8 reg = 0;
-	int crit_temp;
 
 	mutex_lock(&chip->lock);
 
@@ -355,15 +377,7 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 	if (chip->stage)
 		chip->temp = qpnp_tm_decode_temp(chip, chip->stage);
 
-	mutex_unlock(&chip->lock);
-
-	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
-	if (ret)
-		crit_temp = THERMAL_TEMP_INVALID;
-
-	mutex_lock(&chip->lock);
-
-	ret = qpnp_tm_update_critical_trip_temp(chip, crit_temp);
+	ret = chip->data->configure_trip_temps(chip);
 	if (ret < 0)
 		goto out;
 
@@ -483,7 +497,7 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	 * before the hardware initialization is completed.
 	 */
 	chip->tz_dev = devm_thermal_of_zone_register(
-		&pdev->dev, 0, chip, &qpnp_tm_sensor_ops);
+		&pdev->dev, 0, chip, chip->data->ops);
 	if (IS_ERR(chip->tz_dev))
 		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
 				     "failed to register sensor\n");
-- 
2.34.1


