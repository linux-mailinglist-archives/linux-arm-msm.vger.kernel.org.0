Return-Path: <linux-arm-msm+bounces-49370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4ACA44B38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 20:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 106F0189CC76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F721DF993;
	Tue, 25 Feb 2025 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/2Hb0V5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9581A2567
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511476; cv=none; b=kYJgjvAxpmGbMVr1nxulPHHKuM1EpiPHjLL+5b23LX7N2mE2uZemM+W9Au+AgDGIfuIG6vvMzv/ElpNt36E+2Vkmf3foZz44GfrDxTAy7a78mXzxpPxJR6l6dzn7JB2/FIP53zC1WBvhvLZ4O8e5W06z8G1nSX8Z6tfSg6Ub6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511476; c=relaxed/simple;
	bh=Hm34EcCZY7Nya6IWrGgD3q/+JNM1BPaGd40TDCxo+LM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZMkEFezMf8oqwEq6+ahRDuryu1xA4GcZwMIRgyXNxMUWSsgxiZV/AE9bPKrux9NBXV7jmQ1Ymoon0So3e7TUG/GHZlKz8HD+eEDPleaR3COEbNklIYREVUO9YdHWba19wDe9+96e5XilnLNYswSawJybz4TJYc7uuae7ENFx88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/2Hb0V5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PIDLXL031177
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/E2f4sNa5dJ
	1J/+u/sCAiw4E4qFHfywaLempWlQrqbI=; b=i/2Hb0V5NsEebQw9ycLIHTSSTir
	LYy/B4LQHWWzvwJovdpPH1ZPbJswabPUwwyl+7sxBazO506+GQ7dO5PNQnb8trb8
	sH+JmgkLwJZOqejyMzqXmkuwCPzLZqrHAH1IjvzFFb5/Oqk+qxTNuOXpZUUDc/YY
	sAUgC8cpLJfvutBH/ayM95WhobzZ31hMDo6lyfhYh3sIv4wB6MCW2ts88bwuxpm7
	gYQP79x3PHLRM3/mcnNwI/lhEPs8KNBedQTZ2Hwb5iNPIVggIEt5kUfidNyuDXP5
	kcs0y20/1jScOEKNal3ygbpW2T+iqDTS4CX9jFWsaJ3chKlIA7JM8qOgP6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6nu20y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 19:24:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220c1f88eb4so95405475ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 11:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740511472; x=1741116272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E2f4sNa5dJ1J/+u/sCAiw4E4qFHfywaLempWlQrqbI=;
        b=SrQm8dXxYyH0neU4ap1qwYtC9RmB+UVCuMAeYv6SnOEXvikhMtx8VAKg0+1UO+zPdA
         hY6bzuU/U7u3dd1UKnCihlcrP1MqbNTc7pxk6miQxnPDrfWWxrNvFulHQW3lA4a++72c
         lE6hKHiude3+bneaEDZTVDz2GieuG1gOeiwkjjSbWJtNdMt7SoH6h1vXcOVY5yXa1mPU
         SbQeLrN+fiOHkpb/Z3ZOD6xELYGswfostNOoHtUeYO0qcX7JeCkgE9tOAGnZLBvCjd/h
         5OOAhtskZb6KTyoPopRGvqS/n2SE0fhT031mcUyCNr1VUvpU3AeVsk/rcSfQ+lH4CfSq
         VxxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFGKv9hufQb441S6zrjdC+PxexH8E1NucvqQxGwauvv94pgtbzDxz6Ox5DwGqH5GPuQqzDOQ6YBT2AKXnS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3d5vIO4YqQcNFZCfNwpMmESXyG1bVpDjwh1aRb8xrWE8FboI
	hZ447evCtaCTefm8hSTCag/Sxev2VbMpaRR/IHXQOMLyOqFaH7bEA0f+5TAt5Ly9e3TZLS3QIc/
	eEn2XKiNIloRxS7S/ac0HdgUsUn+c1xWcsEbGy98EJNEB9AW0JUFBeJHuPqosr4yg
X-Gm-Gg: ASbGncsPw2Kqk9fKfBaELPP+SUWFDhZQymEmQTsIrsbN45pRHX5QultwUwDwHogeCpu
	AUOxndbQinNYorQ46HQTqnn+BS86KaTDuzdaiX/R57tGkM2MkbMZ70CsZtIehKn3EXh/RtRxNCt
	0BvBlrWKcjjP3e6WUG6bHbDOUwlmB0mfD85+M/GsgyyemZgAoJ+ieAG7ZXcnC+dxxihcsy6A1k5
	46WeBM62HaFJqabcVJy1oJfWeXY/kFyPl6Ypk1NqxjCcllBUlqyrfkWO+/EFU6Jh06x2X/zTakL
	VCLiqanc+Gxc9Fkrg51vyb76koSL1kmSjCx3n8re1FWCOn/dPgcTMnifXPdekHcRq5hJ0zUGWkl
	T9HQ=
X-Received: by 2002:a17:902:dac5:b0:21f:8453:7484 with SMTP id d9443c01a7336-223200b52d7mr8785245ad.30.1740511472426;
        Tue, 25 Feb 2025 11:24:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEwO0S/qaA8GgdupCwxJV5nNfNSkXN4bBXv7CbFQ0sqjA3BJOLCmca6dKdj/Eghvry9gvymw==
X-Received: by 2002:a17:902:dac5:b0:21f:8453:7484 with SMTP id d9443c01a7336-223200b52d7mr8784895ad.30.1740511472007;
        Tue, 25 Feb 2025 11:24:32 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a095865sm17915365ad.145.2025.02.25.11.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 11:24:31 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required
Date: Tue, 25 Feb 2025 11:24:25 -0800
Message-Id: <20250225192429.2328092-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com>
References: <20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5qzkAvsMnZ_m-_EZLJsL6bPS5ePmXS3Y
X-Proofpoint-GUID: 5qzkAvsMnZ_m-_EZLJsL6bPS5ePmXS3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_06,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250120

From: David Collins <david.collins@oss.qualcomm.com>

Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
stage 2 automatic PMIC partial shutdown to be enabled in order to
avoid repeated faults in the event of reaching over-temperature
stage 3.  Modify the stage 2 shutdown control logic to ensure that
stage 2 shutdown is enabled on all affected PMICs.  Read the
digital major and minor revision registers to identify these
PMICs.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 32 +++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index c2d59cbfaea9..b2077ff9fe73 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/bitops.h>
@@ -16,6 +17,7 @@
 
 #include "../thermal_hwmon.h"
 
+#define QPNP_TM_REG_DIG_MINOR		0x00
 #define QPNP_TM_REG_DIG_MAJOR		0x01
 #define QPNP_TM_REG_TYPE		0x04
 #define QPNP_TM_REG_SUBTYPE		0x05
@@ -71,6 +73,7 @@ struct qpnp_tm_chip {
 	struct device			*dev;
 	struct thermal_zone_device	*tz_dev;
 	unsigned int			subtype;
+	unsigned int			dig_revision;
 	long				temp;
 	unsigned int			thresh;
 	unsigned int			stage;
@@ -78,6 +81,7 @@ struct qpnp_tm_chip {
 	/* protects .thresh, .stage and chip registers */
 	struct mutex			lock;
 	bool				initialized;
+	bool				require_s2_shutdown;
 
 	struct iio_channel		*adc;
 	const long			(*temp_map)[THRESH_COUNT][STAGE_COUNT];
@@ -255,7 +259,7 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
 
 skip:
 	reg |= chip->thresh;
-	if (disable_s2_shutdown)
+	if (disable_s2_shutdown && !chip->require_s2_shutdown)
 		reg |= SHUTDOWN_CTRL1_OVERRIDE_S2;
 
 	return qpnp_tm_write(chip, QPNP_TM_REG_SHUTDOWN_CTRL1, reg);
@@ -350,7 +354,7 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 {
 	struct qpnp_tm_chip *chip;
 	struct device_node *node;
-	u8 type, subtype, dig_major;
+	u8 type, subtype, dig_major, dig_minor;
 	u32 res;
 	int ret, irq;
 
@@ -403,6 +407,30 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "could not read dig_major\n");
 
+	ret = qpnp_tm_read(chip, QPNP_TM_REG_DIG_MINOR, &dig_minor);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "could not read dig_minor\n");
+		return ret;
+	}
+
+	chip->dig_revision = (dig_major << 8) | dig_minor;
+
+	if (chip->subtype == QPNP_TM_SUBTYPE_GEN2) {
+		/*
+		 * Check if stage 2 automatic partial shutdown must remain
+		 * enabled to avoid potential repeated faults upon reaching
+		 * over-temperature stage 3.
+		 */
+		switch (chip->dig_revision) {
+		case 0x0001:
+		case 0x0002:
+		case 0x0100:
+		case 0x0101:
+			chip->require_s2_shutdown = true;
+			break;
+		}
+	}
+
 	if (type != QPNP_TM_TYPE || (subtype != QPNP_TM_SUBTYPE_GEN1
 				     && subtype != QPNP_TM_SUBTYPE_GEN2)) {
 		dev_err(&pdev->dev, "invalid type 0x%02x or subtype 0x%02x\n",
-- 
2.34.1


