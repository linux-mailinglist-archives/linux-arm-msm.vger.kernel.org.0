Return-Path: <linux-arm-msm+bounces-52113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F562A6AF19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 21:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9AAB467A2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 20:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D839122A7FA;
	Thu, 20 Mar 2025 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkrbXpeu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D322A7E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742502260; cv=none; b=PsmumLOH/c3rclgyxxB/JageI9SUZuCGI5adyqRvnQsgSUIMFiB5pez5XAPdx6PljdZc0uZdbU3uoVpObq5CJDADoHiB6A85+fhxV+LMShZvcAn0MM8B/ke/cSHXoGBOgV5HMW3cejJxnFRAF92sS1IA04fyKPnxfGSZHlJtDlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742502260; c=relaxed/simple;
	bh=DNXVnMOqwb8fWB/J/SIbMZJRwIg2Q5PHwQoBAEHkhoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPHxyMduf+UAgT7N3A4H820UVVmZgsbFS0Y+ZH7lN/4ihf8vJ6QUt2Asmb8d0/F9ew2lX7RxnH/eAJSXduRjNOckxdrDZ4Hg6IMgiP+AY5tVctjHSzXXdtoHTEfpPKIaAtXRAt2+eqv3Zke2pRpDcRLUMITZ/bYBTyD6qAANnn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkrbXpeu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KEZR77020652
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=egiacthqZDG
	pHiFeoWLEDtn1W1SQg/ufELhmV7ySKG4=; b=IkrbXpeuBHQF59MdyRW5Wu4gFjw
	ii3aId66w7asE94pdj9xS8aBwVe6fCog5kkfMiD/3wiDqzf5e9xAYmebj+xvfT6R
	wGh48RgphuSzfSUL/XjKumaesGV0Ewf3cSgTSb22MQWygZNkwlmpLncguAPlbgW+
	XSrMJEJBmu/r2qj9UMeLD8/i4xC59C1t7IlE9GRo13zZNRhASp/uwO0doOOSy5QC
	8PsWXXBmRtCdjEErUFPgAszw3QHZtrCPb5Io4f3/suKiB5kjVXN9ntqaQpvIiyXe
	QZcKFdid0bCVJkSHmwTMRL7aHun1qQLnLjAvmE07k/fVkvV5f1MyeoyeNkQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g3sf3sjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-225ab228a37so15344125ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 13:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742502257; x=1743107057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egiacthqZDGpHiFeoWLEDtn1W1SQg/ufELhmV7ySKG4=;
        b=lHW7KZXSz8h569xdjiRNI9qz93aoJDgaQV/Z9avp3RvlibI2dcCEccEmJ1A37UuXkf
         FlSGZMIep3dL6Q0vH4y8q1KUamIC35Fn3DrD/1tRKvoJ30TwntMB5YcVZKnw7/z2j+CV
         k3SMahWGbJLai4FbaDfN9S99dZbuz07SdNmXl5SJAVchi3u1P6C6bjQJskJ4UGA+u2/d
         UW+blll/LYxdBmMIR5b2Dwdd0+4Vs7Cvt2JcUd0HaCkwSZQjuh4kQLpNHi8/tazRSvmO
         rKL4EdqPkqIUkcXBYvZGzJjdLKhIpqn10e5Q09eFF558KTvLxb17Y79PgN0c5ccfjbWN
         WEnA==
X-Forwarded-Encrypted: i=1; AJvYcCXzlTN+MEPw+bM/b0XPZFNxBJb6QI39nK1Qgcr6q2g9expUV5giZdO3jy/YOqrzIoEr/FFtNyDWFCa0eAKT@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYwXJb2rePa8tmZuyzrA0sH6jM+4ac2OqszQVubU4wAsjT8d4
	BRat2+JQLQCoLgrD7ZpO7BzWfE8dlEXM83VJ6IGsamWEspbCQHJ1pd5yElxbYfTzS2Jje4kyykc
	f/Li0K8/GPCS15BNE8FWnF9QkQbLKLzax7ZEME07OXFkHDnA8vSiTIOObpr6+g53C
X-Gm-Gg: ASbGncv3DWJ147PNNJy79fwt5eWdtJZQqxuWKleb3dwYmqAvLiVJsuVvOu7rlilDK01
	AHF6GjW6WXKGg/e+KEOZhbmgqvBuP5X0c1UQ8gQvqjAts7tjHUMuVgfQIMLJzGefNSBfX+7ITwv
	Bwc4XvqiW2mSCJhhpJCbqkEIybJR7Sh8/74rRBq1PJJ/U939OqcKzXQAGivf9wu+zEwFXc3XRco
	bVgnEPIyJq2cl7vEv/oc2dPd8vp6JAtOe/oQ3AYP9t7kqSQ8LB4nUVDPBbUHb5+ldNdLxxBHiuz
	08x36reJkisNiPIAa8UxAj+vePMuw78MQ0jEzK7+Q6zgnWUHi+SRCU+f+Ra+w3XEun7gB2C0A0J
	G1oE=
X-Received: by 2002:a05:6a00:928f:b0:736:34ff:be7 with SMTP id d2e1a72fcca58-73905a2762cmr1410695b3a.15.1742502256417;
        Thu, 20 Mar 2025 13:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0JgEhdNyGDOq+wE1L4PhVpZdw5furaqQDaL73WBTBB6Ug6C2GuXYFgOxKakNTxeXNINsJsA==
X-Received: by 2002:a05:6a00:928f:b0:736:34ff:be7 with SMTP id d2e1a72fcca58-73905a2762cmr1410638b3a.15.1742502255805;
        Thu, 20 Mar 2025 13:24:15 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600b9b1sm249308b3a.76.2025.03.20.13.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 13:24:15 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: [PATCH v3 3/5 RESEND] thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp Alarm subtypes
Date: Thu, 20 Mar 2025 13:24:06 -0700
Message-Id: <20250320202408.3940777-4-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-GUID: VIx38Mr-FOd4csOYELzKzQ6elTju8Ft3
X-Proofpoint-ORIG-GUID: VIx38Mr-FOd4csOYELzKzQ6elTju8Ft3
X-Authority-Analysis: v=2.4 cv=R9IDGcRX c=1 sm=1 tr=0 ts=67dc7972 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=7un5503AD7E7R8fKnWkA:9 a=RVmHIydaz68A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_07,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200131

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


