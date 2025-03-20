Return-Path: <linux-arm-msm+bounces-52114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECBEA6AF1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 21:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92D294685A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 20:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713B722ACFB;
	Thu, 20 Mar 2025 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdGX+dfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76AF22836C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742502262; cv=none; b=c+tGZ3VU7iJef88KvEKqjghkZjOJ8lZABdeVxcLS30zCLPka9RpzuhmXWyzVy7HzQoI9gH3jBoKfbxPMHaWz6brXbPCpAhoS2svCIsAAhXnTYi3etMNOpzAP2GwuMqEkNGcPNHp4q/WoGv6jrMeU1qQ6yAgZpilLveemPQ/RJz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742502262; c=relaxed/simple;
	bh=Hm34EcCZY7Nya6IWrGgD3q/+JNM1BPaGd40TDCxo+LM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EHCip3fHedaMaoUCZLtncFc4/cdwmByCcqRxXFmC6o3XnlcyvaeWFo1GpxjQSkxcjUZKQJW4mVry2a4qKV7/jRhFeywNGCjcPBbKdmyivrzBL7B97k7R+xAXHBjUS887cnv/gHnIILQFdlTzhy+U7tImmfAuboD0NMIxU7RWSbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdGX+dfu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KEJPwu014468
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/E2f4sNa5dJ
	1J/+u/sCAiw4E4qFHfywaLempWlQrqbI=; b=CdGX+dfu1or4up/kVTceuigYPa+
	PjYTNf1Iodo3P87R2IF7TigyISDQMViNKvOtS3swqAEjAiimVvZk02OPArmZ6aFS
	5yV55tekQfWD3mH47JfH6LZ4UC3YPIO3gLShgXzKHjofMbgxPxhBPSMKS9caxOvF
	yhtU4hj2JnSQq9STT+bqSW6ejDehg4GbyTL54We8YX6k9hxyX+KstjXLmoI5gsUD
	o/IePWHHD5fBf6FOJhuckrPxcJDeXDcE74C/r7XH2orqIsMGjPGNJi/Ju3eLNXfL
	giTqTNm3oWnB8/gyGgbGt6H0reE6/LMtCdYkVjo2PiGw4H7PfIs9PegD9FA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwttgsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 20:24:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so1730420a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 13:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742502253; x=1743107053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E2f4sNa5dJ1J/+u/sCAiw4E4qFHfywaLempWlQrqbI=;
        b=J/xLSoC2C4qU1osMV9qAbosrbFBId9gv0jMBiXfshptBhOEzj/+yvd62aKktNvA96b
         8MJ+68YDc/ngvhfG/opR9ts6qDI6DJtxwJG8Bx800qQOxnk+XFvwNG9/FZiftyKikI9t
         2HnqEqpgUK8nrFXY+HiFt2Gxe3R1zIpc1BeAVMQkH6VsLGLSxXxN64lGIh62c4PAIobp
         /G1r/n820mB67R/4fKuDOi5AgKwvsF9bjaR71cXQbsQWJx91bC9qC/TsztcvyuHHJGJZ
         P6ql75K/A19iPXgnyHyoeSMcnJ8XDirF5zt7LaXBnqpVdPGNW22vjyyW9Yo/CdIZ0vfm
         m3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCV+QbCd01QEl/2xqUw3WRGR3K4tq+3an6oxy7khE8pCz0bEV8D0CisoNN5jb+4b7PtOl2Gf1+MWqx2qM/+G@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs6XcUBdWCN6Lt3AIX5D95k3/EmnguOsFien0nXh/F128Sr2I1
	KIopuV2A9bqYNr2tKb8JA5452NKZL81cEFmTU8TRu5G2Acn8rLe5YOGp5TXwZfcjDP5DfCn34Kk
	ZthndxP9Q6FgDO1XltUJi7av8AawCVAysCayAPr/kUp/UlZ4DSyy58cb7UUlEER5d
X-Gm-Gg: ASbGnctl2743kIHlt+agfZASOz5rrYPE13pqlzHN2D2seujP8wPtGomcNe1L2txkuQL
	/scW/a2Y9NfnImcDT/3P69ps8+kBWNHR9GuVtSVe+rd0FQVqnJheOKJEqebbN/0TKizUkvg+3yX
	v88kGlvmQu3Ip7q46yV5jFGVfVsV8mkPpibu97Mz4SYJpJobiOYPKn1Qnbt6wAY9L/kHY8SIaJd
	0F1SXUdQ/DIBEiwR+YOCjj5JTzTTg65a73lo0w5beUU9hbJhPWsgoNE3v/mGLPlc44NTPauTkAP
	/ql3InHPTMZ5zbbQVTQwkoaxb7eVdddjYtT69T1qspSxsLB2C+LINdk6feZ/fs33STQmkx34bd7
	E2kA=
X-Received: by 2002:a05:6a00:2d88:b0:736:a7e3:d4ab with SMTP id d2e1a72fcca58-739059457b8mr1274953b3a.5.1742502252901;
        Thu, 20 Mar 2025 13:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcujCC6dIUgoBwEfsAlF9R5NoEtjy+9Vi+GLQJ5dHhBKP3SMyOMLn0UaHxXsQSLcRFSA/W8w==
X-Received: by 2002:a05:6a00:2d88:b0:736:a7e3:d4ab with SMTP id d2e1a72fcca58-739059457b8mr1274889b3a.5.1742502252290;
        Thu, 20 Mar 2025 13:24:12 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600b9b1sm249308b3a.76.2025.03.20.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 13:24:10 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: [PATCH v3 1/5 RESEND] thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required
Date: Thu, 20 Mar 2025 13:24:04 -0700
Message-Id: <20250320202408.3940777-2-anjelique.melendez@oss.qualcomm.com>
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
X-Proofpoint-GUID: rqfSMSZLNFnOgstnjuxEpgmO3D-sn1_f
X-Proofpoint-ORIG-GUID: rqfSMSZLNFnOgstnjuxEpgmO3D-sn1_f
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dc796e cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=q_MlTjK-hrb8HEj9cREA:9 a=RVmHIydaz68A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_07,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200131

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


