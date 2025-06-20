Return-Path: <linux-arm-msm+bounces-61844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7958AAE104D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 02:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1489A3BF97D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 00:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40081A95C;
	Fri, 20 Jun 2025 00:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="id3n1GHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557B523A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750378766; cv=none; b=Ywul2mTeN7euE1rqML0nhEdV/kW/eUlGI0q+Klae0XRmvPSSo4cJh/VlXNimQCNx+gy+WJudeTkKpPU9qEt13dH/rPTlvU8RXBLySbhFUFXBqXiH6dEJiYol8P3FRi6y8GUSNi3HH7IFFsrOSxpPF0p3huhSXOSxdLH9VnmtA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750378766; c=relaxed/simple;
	bh=5CPyfvzDaJpcwVacU8qqUyuSNCIguXVwmFtDEuuVP6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c5XsJr+vY1Wl3Om3gMwX+hkJbFMOXTJMHe/noINJ3OSWoN+2o52dzFqyiRiCZCIyyMfhJRSw366mAj3ZTsmIQy/34WAoUBp24OuvhIq96z7AMsASsZI+xCKpgoTuIbcnt6zum8Rfi+gDeRrbwLkntFlh6pO/vsfVxuPG8p9ATIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=id3n1GHI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JAgQ5h010949
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=76OYDegfiux
	sYYakcQ1hn1ucR5+j5q4iTlRVv5GuZVY=; b=id3n1GHIkoityWcUwWBNDRc71Dz
	4tSqH5Eu/tZ/SrmgjeviONaVzKzFbqUVqbcb6lCqXo7/kaeuN4sx0/S5sXr6OJbb
	fXUtIXu1UuRGMOcxlkYJ3Mtcoym2TL3CZjm/eeShok1KMGnF8/HWslp6G3LJYW3c
	O7s12R3YR8f7Hz10I6PGgx2DwfVNRp7ZWBkP8Qg9quP6bAIvzVieLhEHg5Kpe3eb
	aYGQz1Fmdew4+4t/QIPcUIRCO+IHCElJReaWDGx9UM8QCmO3NIAqWZmzeZ+IFKoS
	Zrmi0PX7EdeQ96vvdPa6Nd7tMPJZptP5Pbgx2FqT+EbNtQtOvIUTnG7HwvQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791cs19wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 00:19:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31c8104e84so860168a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 17:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750378762; x=1750983562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76OYDegfiuxsYYakcQ1hn1ucR5+j5q4iTlRVv5GuZVY=;
        b=D+GOxP8JnOdFsbfj/o7FEqkJkRk5/5i3hzIA04BQ4FoCt+lAZYM2hjSZHLZir7xQlr
         MdtR56cNTwkFtmITG1jXNTgJFOzOyWPDaZDzbpjVBfSrhXBQ+WxV3ZtZcoFSR8X5kXbt
         zmCfv+5QKOkl63mWfE8lLQk1zUHvPYuy0tNu6ND2+et7bSOHvI9bQk4r1tT4L6zXWT1F
         k/LBEHq6xKMdea/WnVp0lnHaNn5pnX2pu3aqXh/YQogPG0z/clFCDf66P8Qnq063Fqmx
         zbuhfR9JxoRAAbY52o+4C0rPjDRNlZr0RNhM2z4lfxVHNXdtumg2YMbzlNMC9nxB+OfQ
         8xVA==
X-Forwarded-Encrypted: i=1; AJvYcCUjyyTwHib6f9Zccd8D0M5ryRzdXBAk3gr1PNFw2ru8Cqqu9KtO5pnW14JmmUhNeKqvTiMg4vH1yeBCPmFx@vger.kernel.org
X-Gm-Message-State: AOJu0YwlhPZedNY37mzPKLWp/lNBJIp7sX0/Y5DuYiRNWFXtftZLD6hq
	h10P1Bd9cfB4DlWDW89RGELRYSCnZf4wSb3LzgKb9c30vF2XwEKjdZSpnqCruVSPm3T8dZaT1iZ
	r7VE67yb025GpKyq69P6DsYAWto0DCjlhmEt9pSKJfG0YB+XUqo0iyhgex+CW/HQOrS22
X-Gm-Gg: ASbGncuy3JNsIdeo7nyd5mbYWKPax8lXCbMX8GELarJ6quvDtUuTSwUs3Qq34ZE/6Nq
	VZBxzjhJljQEH8g9/jO3YqonWKgkdu+W2bDolOc8HLwqSFaxJjxOvbqTZE8vbzkEHEYuieQ1GP/
	FlZsR2KHgeXW4UliCb87MgKeaU89g8jr3c7uEtRtou2BZUplKeYBES/J/jaz1q+/qSQqhJt+rQP
	lbPCF1Z/xWzhpgWg+dMB/eb4dB3PYUB0F/vNgn5wJOsORfyEV9GaDSXzHBWyF0X5BlpGeltjwCO
	9n1I8n5AfDogz2XLs9baM20E/U/fsMOLtFENdOA1W/6/DN1YLq2l1/q6MsX1BBoGReIFfOgwu7Z
	Rn7/+Jgjr5A==
X-Received: by 2002:a05:6a20:394a:b0:21e:eb3a:dc04 with SMTP id adf61e73a8af0-22026e603a1mr1258205637.3.1750378761822;
        Thu, 19 Jun 2025 17:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmSLS3HvBIl5p+5bxb85rZ5sLgXcnodT6WFnTVFSa8rKH1nuyLCxXtVkWK9fust89zHfqCAQ==
X-Received: by 2002:a05:6a20:394a:b0:21e:eb3a:dc04 with SMTP id adf61e73a8af0-22026e603a1mr1258164637.3.1750378761411;
        Thu, 19 Jun 2025 17:19:21 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f1258932sm410011a12.64.2025.06.19.17.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:19:20 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v5 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required
Date: Thu, 19 Jun 2025 17:19:14 -0700
Message-Id: <20250620001918.4090853-2-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: fFXaOzXBAxTK6Mojt3YqEif1Je_ZSzD4
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6854a90b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=e8SBnR8fKgZMydxn7aMA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: fFXaOzXBAxTK6Mojt3YqEif1Je_ZSzD4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE5OCBTYWx0ZWRfXxk0wpkK27y9i
 OSXP6pe/s/xcgiG84U1v0Li8ZM4Z/e/y4AoQ8tt9T0RMWs+DwdeeTcJEyMroUdamqo9dg1Lx7qO
 s7xe9kjou0TK11vAfmvIrKe4JabOxsqtJ/GO4HO3TBxgWXmTKKplYqx/7rP51EIm+jLBX0JLm5v
 C/6rzywylQTcuCS6DRBvXH9xEHLtYVA1E+CPMMZru8dyDuTOJ8UnWHfo7E//tubec2qvnEehr23
 BNaoNxCD22QPB+4K4x9n7hA7Gjd7g+e/8uL/JamWzKFduACMYQ6rFwLaklHYsgmEVdwm5+uCH22
 9e8JuNUri4QW9nhgLycQApKXqAQg+TV1fNeqqj017pE6tjBic/POdFbFJzzCz8+4kvRC077FckX
 BN2T3BaCxx2dz6L1kxAgYeL1GbSHyyKeTLP8W3NppZsQU3L1xhHEIk9FGi0kpc6SMjPD26v0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190198

From: David Collins <david.collins@oss.qualcomm.com>

Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
stage 2 automatic PMIC partial shutdown to be enabled in order to
avoid repeated faults in the event of reaching over-temperature
stage 3. Modify the stage 2 shutdown control logic to ensure that
stage 2 shutdown is enabled on all affected PMICs. Read the
digital major and minor revision registers to identify these
PMICs.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 32 +++++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index a81e7d6e865f..47248a843591 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/bitops.h>
@@ -16,6 +17,7 @@
 
 #include "../thermal_hwmon.h"
 
+#define QPNP_TM_REG_DIG_MINOR		0x00
 #define QPNP_TM_REG_DIG_MAJOR		0x01
 #define QPNP_TM_REG_TYPE		0x04
 #define QPNP_TM_REG_SUBTYPE		0x05
@@ -78,6 +80,7 @@ struct qpnp_tm_chip {
 	/* protects .thresh, .stage and chip registers */
 	struct mutex			lock;
 	bool				initialized;
+	bool				require_s2_shutdown;
 
 	struct iio_channel		*adc;
 	const long			(*temp_map)[THRESH_COUNT][STAGE_COUNT];
@@ -255,7 +258,7 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 
 skip:
 	reg |= chip->thresh;
-	if (disable_s2_shutdown)
+	if (disable_s2_shutdown && !chip->require_s2_shutdown)
 		reg |= SHUTDOWN_CTRL1_OVERRIDE_S2;
 
 	return qpnp_tm_write(chip, QPNP_TM_REG_SHUTDOWN_CTRL1, reg);
@@ -350,8 +353,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 {
 	struct qpnp_tm_chip *chip;
 	struct device_node *node;
-	u8 type, subtype, dig_major;
-	u32 res;
+	u8 type, subtype, dig_major, dig_minor;
+	u32 res, dig_revision;
 	int ret, irq;
 
 	node = pdev->dev.of_node;
@@ -402,6 +405,12 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "could not read dig_major\n");
 
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_DIG_MINOR, &dig_minor);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "could not read dig_minor\n");
+		return ret;
+	}
+
 	if (type != QPNP_TM_TYPE || (subtype != QPNP_TM_SUBTYPE_GEN1
 				     && subtype != QPNP_TM_SUBTYPE_GEN2)) {
 		dev_err(&pdev->dev, "invalid type 0x%02x or subtype 0x%02x\n",
@@ -415,6 +424,23 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 	else
 		chip->temp_map = &temp_map_gen1;
 
+	if (chip->subtype == QPNP_TM_SUBTYPE_GEN2) {
+		dig_revision = (dig_major << 8) | dig_minor;
+		/*
+		 * Check if stage 2 automatic partial shutdown must remain
+		 * enabled to avoid potential repeated faults upon reaching
+		 * over-temperature stage 3.
+		 */
+		switch (dig_revision) {
+		case 0x0001:
+		case 0x0002:
+		case 0x0100:
+		case 0x0101:
+			chip->require_s2_shutdown = true;
+			break;
+		}
+	}
+
 	/*
 	 * Register the sensor before initializing the hardware to be able to
 	 * read the trip points. get_temp() returns the default temperature
-- 
2.34.1


