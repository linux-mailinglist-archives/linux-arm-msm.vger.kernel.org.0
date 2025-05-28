Return-Path: <linux-arm-msm+bounces-59755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7094DAC74A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 01:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A924A32B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 23:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053D6269AF3;
	Wed, 28 May 2025 23:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8MaQHN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0F2690C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476236; cv=none; b=qHoAr2ChtoqijORtCygR4Y9SBgq8LqxZns7RPKY28nkZSuI32rzk5KDmseIqWM+s6MvtI8KNLU17QZpq+iR3nLJRQ2lGJz9pf38EQeUlYfatux4Tj+f0WFK4WsgzdnvqJoAFi42ry5p6l0NU2CDoLn2OsdBPZG8jvSCRQumTbiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476236; c=relaxed/simple;
	bh=uWUmQZzfwijv2fQEAMByt5CIG6+qQddTKNUWIV1yedA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ck4T+iga2unOHuzfCq6Tw5wjYVrFqpQ962vYTqdeczY5xfcdhvESGd2jqxcw9slynK2kNSA7dHF9D9c5R0Y2+bthWWUMFLV405rZ0A8a18BpAeWsBbj7ud0sqZFGT840dnqoYYNNfbNHGUHVJIpwPwb+Cu3hVG7kL0ka91rcDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8MaQHN9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SHTTwI022064
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y85TMYCwFNn
	++fwJcWQ509YRv2ZapdZbIhgN4u4WAZA=; b=U8MaQHN95TXp+yeHLGULOt79Ihn
	Wr2EKaVQjvF86l5InaUeC8g5294gDV8BIyLkPZhcBFx2EZUqNjuglm9oW9Ropswv
	ty1C2SP73u442RcwY0kknPRBgwwIFZnfMTWVkqPFMMb+yY/zvOr7BVJaanLjR0Sq
	onhOkP7K3YFpcatQP2QjeEvoBJiw/sh7qBVmddv5yJlLg6wolqkzdQrB0XHB6UVF
	oj6oK1QZh0jjoEygZJFa0t4JJ711unH10Z4K5PMi4WZDvhI+dwS8n4WXUC/Un5VF
	xMbcAUd5NhSF6hxiaoQKpwGYsywmiFTZyk6puR6XI59p2O4Q96IdQgt7xKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x6xc8t4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2343bf73872so2828185ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476233; x=1749081033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y85TMYCwFNn++fwJcWQ509YRv2ZapdZbIhgN4u4WAZA=;
        b=qDh1Rp2PQqWyj9tEuCbltdxue4DfkS9O0L8aK8+rzQD6m3JVi5HoknD9ibNBNaJJTI
         FU06O0yO71IGR2axD4ldG2fNrUl803n5acrddCWFRzp0C9Q06ZQoSAAXz8wrei3YzLAw
         x8I0ZaPwJ39D5/gOR5E5HBusHGbNn2RP2e3LZIdbVqHEAfOmAgRtdBrZ5GPY9/LIMTIJ
         zlS1Wb+pAkIC9SuKRL0bPRrmm12na9RzL4egl09FOtWP7BO/4d7mJl+bTaCFFpDkQOCk
         3shjpM91dFIcTVKqdF2UOdntsq+0oxbZpDdlHpPZrFKlaw7+59SgDWnSmVtOV3nyf8X7
         jIIg==
X-Forwarded-Encrypted: i=1; AJvYcCUCH8eZXRJaQz+3vLb1lVuYn/uegpqxAvtWUgLtQlUHjSSliL7Izwi3OkKHoX+7Nj7R53L4itjd2PJ1QCQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpiM5b7ao1an9NiY3CD2KR+ej4fHpShVIolzWOg7LcPK2heU0
	BCVVcBTKJ6BWm4N8lNzjv2WbmgYYPbQeKYsidd8EFv2qTXVrtix4aC8WND5DhzVkLqxPFaXC9er
	1p/zVd3eNSbIbf2Qg3SbFBI4FuBQoRU5vKXxx7er4AZzzTWBwi+SiOqcYYVO12lpS5OzI
X-Gm-Gg: ASbGnctiuizJEimLl5IqouZKYN00RiiacEk3PSudRwNl+2fBlFlOItb7bHK4XwJEWiD
	c8j8IdeecDQnOGE3CB8lhqnaLUfvGCLosYnKfVBIygg/PvYJ83peQF0zkqOinfDJ20lsXR7usZ1
	xLuc/l5sxinlVNpTvnv7A0lR/Er4rJv4fKoVSDg1U1Nc4sjVGxlMq3KdzM96sYXnfX0uxvt8aqp
	vPdCTVnVrNnlPjwjwwoN2m1h8ssWda/mtfyTrrn8pa90y8mbJIQOwf3vzfNxpYo17v7dv9OdwdI
	kN1N1IAK7ky2ZBWaur+dXMBoIdraKeY87GYxxxK/EzV6rBy8O7kGtBcOS6nk2KjlsLR0UCRdhS5
	V7Wwd5Zyi6Q==
X-Received: by 2002:a17:902:da48:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-235082e1cb9mr168645ad.37.1748476233357;
        Wed, 28 May 2025 16:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFER6i3y0ujrO9TqIp4SDaBIQHx4Hv3IdZSVeEKTqE8c088lrZ6/nh8NZLuDppFB4ND5sFNhg==
X-Received: by 2002:a17:902:da48:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-235082e1cb9mr168305ad.37.1748476232989;
        Wed, 28 May 2025 16:50:32 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm1403445ad.156.2025.05.28.16.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:50:32 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 3/5] thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp Alarm subtypes
Date: Wed, 28 May 2025 16:50:24 -0700
Message-Id: <20250528235026.4171109-4-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDIxMCBTYWx0ZWRfX0kuN/egHS6gb
 XC8eEDURrwYXqbCtrTA++EUnGgzPLjypBsrxLcbu4pAXNSYGqqem0USEu9esSF9pyow+3IhCbSQ
 YmvopcbKpXJRTYUGxs94T0C74GZ31gu3PsNTiVdoy1yPLC+okaS9GVJIPpXr5Pp5pLd6StWlWlP
 Wv2VF5UknjgBfZn3y8ltWQ4nFL32RJnnXciJ1TIIuNd722Xy5QLuUhVqVdZRvLHMbvhCaQrIy+T
 ZGpzpjIdiAuxbkeamNpyAcRX2IPiJLcC3yCWbTssXFwryWyk1vI3AVrA6VO3qWR1HeZ1cOvm233
 KiHCiA32rudv3UmcT2bYfN3B9UtM5dn97c3PP+Lf4drbrezrwg23FiEMfAGXRhW0/Ldg8q8jdCu
 vsb+gNjNo0EzZuvFnv9TqrFyX2Sc4RxrNUHwtnfpdaUS2rnUYPedhKAv48xwsv8nX6I9o2zw
X-Proofpoint-GUID: VOlhJze50h6CpiGfbMw6t42w9-3KZqqJ
X-Proofpoint-ORIG-GUID: VOlhJze50h6CpiGfbMw6t42w9-3KZqqJ
X-Authority-Analysis: v=2.4 cv=bupMBFai c=1 sm=1 tr=0 ts=6837a14a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=QmBY4OO-GzUMAyIBBcsA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280210

In preparation to support newer temp alarm subtypes, add the "ops" and
"configure_trip_temps" references to spmi_temp_alarm_data. This will
allow for each Temp Alarm subtype to define its own
thermal_zone_device_ops and properly configure thermal trip temperature.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 36 +++++++++++++++------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 0d8bbc5b7af6..59a25f02a278 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -71,8 +71,10 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
 struct qpnp_tm_chip;
 
 struct spmi_temp_alarm_data {
+	const struct thermal_zone_device_ops *ops;
 	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
 	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
+	int (*configure_trip_temps)(struct qpnp_tm_chip *chip);
 };
 
 struct qpnp_tm_chip {
@@ -311,18 +313,39 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
+{
+	int crit_temp, ret;
+
+	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
+	if (ret)
+		crit_temp = THERMAL_TEMP_INVALID;
+
+	mutex_lock(&chip->lock);
+	ret = qpnp_tm_update_critical_trip_temp(chip, crit_temp);
+	mutex_unlock(&chip->lock);
+
+	return ret;
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
 
@@ -335,7 +358,6 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 {
 	int ret;
 	u8 reg = 0;
-	int crit_temp;
 
 	mutex_lock(&chip->lock);
 
@@ -356,16 +378,12 @@ static int qpnp_tm_init(struct qpnp_tm_chip *chip)
 
 	mutex_unlock(&chip->lock);
 
-	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
-	if (ret)
-		crit_temp = THERMAL_TEMP_INVALID;
+	ret = chip->data->configure_trip_temps(chip);
+	if (ret < 0)
+		return ret;
 
 	mutex_lock(&chip->lock);
 
-	ret = qpnp_tm_update_critical_trip_temp(chip, crit_temp);
-	if (ret < 0)
-		goto out;
-
 	/* Enable the thermal alarm PMIC module in always-on mode. */
 	reg = ALARM_CTRL_FORCE_ENABLE;
 	ret = qpnp_tm_write(chip, QPNP_TM_REG_ALARM_CTRL, reg);
@@ -479,7 +497,7 @@ static int qpnp_tm_probe(struct platform_device *pdev)
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


