Return-Path: <linux-arm-msm+bounces-59753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E8AC749E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 01:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1092D3ABB6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 23:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09537268FE4;
	Wed, 28 May 2025 23:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzsLzZvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F911267AEC
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476234; cv=none; b=bpt0Daa+xo9FX9KQHqy6v5SUCGHeUCqOYmQ6K9TTiUeOZ2cZC3igyWD8AO3lPoneOd6r+gu7V8tEUHoyVnNd9DilBXwF0p8axU+N66z11Y9qxSWMnU3LPRNpMkCwAyHij5VZGNBmU8KyUvBaM/l0D0MePNCgIArt7JBdpyvX8Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476234; c=relaxed/simple;
	bh=PAVEaTNuIFwn6uxuzqc4IGyQxSym92XjfRwGxkI5LBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QLzPFgFb0NTjLnygy3MjjFbxpMlq2tT1ifI6w0whhcAY8uyNpFP/44MpvsZXm0EDrjPXMxjR1CZNk77D/wo/VmzwtgXjyAxkHAGcx7IN2D1U1QNKJNKxRQCG7a2K4Ga8HbVbqceKIpA1B2XaGzpgGn8aQ6fDJzDyA85IG8r3Hos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzsLzZvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SJvQ4v023955
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=76OYDegfiux
	sYYakcQ1hn1ucR5+j5q4iTlRVv5GuZVY=; b=UzsLzZvcrIsuw8FAUyBEIrXvUDV
	IoaHdTGLYJablVBla/GFTbmcidMnV2HYfZOsREuJ+KD8SONG1Qgk9iFAmy67+fZo
	DFjaWtZXg/YWt1xpbxDn56lt57leXTXE/LVXpy+kfv0BDO8HRFVvNm8ayahfa8BJ
	lyhc1Tx7HqBj1ml+pfjb/Sd4f/y4qcfwOF2TngYspDxDVtEsbiYu6qzAuu3i2O8i
	qb4JINtoJfoW2piBLZp6sb4Zl+Qf9d11rIgLMCvn+3F74hIy/SoiyGNHw7ASLSjm
	Rby4DrhLMOrrAjFIOgcDW+c8onFBxlcA8hQa9A5zX4hQRzSbReguPYfay1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek3qq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 23:50:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2326a6d667eso3327615ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476230; x=1749081030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76OYDegfiuxsYYakcQ1hn1ucR5+j5q4iTlRVv5GuZVY=;
        b=sCj7P4mRMsOsVJQtiasAXJ5WdMrJencudvNNnr842/KxElbnDGdtTCQfIIIkrWPo0u
         LWS3bfmT434Be43AlUuPKv5vSgINM+/wJVH5VJF61l89IAtXTYGmuJkPwHtLqTCUNsA8
         5ldiwu6fglsr24qej3i+pGnz9IvGIN+HV/dGMTOqsFMW2/o8I+k95YyIPC/GwmlF07ac
         vOWCL37S3AKnUA13GUMCe+iaZBHMlAUy57or3DWV7u1jfjY0z9SLi168nQsfSJqbuCl+
         4DHg16J0jdbJBEtA1JbiCBElijG+xf0NvmvwgfkmFgM+LH1/o8tEJ5TLkrMmrZPC4WZl
         a5zw==
X-Forwarded-Encrypted: i=1; AJvYcCWB3bZQk5aONENfUydZEywKgq1koC4lsnCHHx78Sa1dZybMm+m9s0MOxrfoRjzdwWKFNHBDuhvAQRnt06a5@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmaXPYONHSBGs8+mbOMEaNW5+ipME0aAedBwcijylmA2ur6s1
	yuVaHnodTcX8dWoicCX4y5vwBYCreD9bT4gCtfAEkJU3Vmsb1X55Pd+GqsmddIV2yNJ5Wl+EOcE
	g93bFhCVRj58BxPvjy1SdnCQEMuEs2HfH2pW7TzCfEBISsCdF+TdoUTb69Nu7wRWY2grq
X-Gm-Gg: ASbGncvM5p/hgm/geJa2wJV1CrnIcwOIYN6DeMONApu5oEjZ8g0mjCj+2o5v3j3lY4j
	+5E7JDodAd1rFCortVEGOTvII7nzsW5t19pCk1rdQGMwcoXhQsmlh/kaPIL85uhVmhWn2Ufjq+y
	24YBn9lANP5MoHBz9JiBEiAs2KVGmBfvq1/LCnBBIa0uciWWNTQjCdfDfMqwQCgb/798e7t5/I/
	8qp0Dp1S8ItonHetMR1HPiS2jNShM6FrkYn3h3klJsOinyK/YwYvuSHbloNdp/Hny8xhx/tsLdM
	mDingV26wWjjTao6uN6nkoGrh9Ou04UEvSoSbdxdIRVMkefMzDJIcEb6qUVbbQog5idAAotLMNc
	=
X-Received: by 2002:a17:903:3ba3:b0:234:986c:66bf with SMTP id d9443c01a7336-23507fda8e1mr687025ad.11.1748476230562;
        Wed, 28 May 2025 16:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXJ2CH253RcCjsEbKAglqaviACnPHSjcPxqaSjGqZk/+EVCV8EtG5Q2YOsePh+6HsjQ9HZIQ==
X-Received: by 2002:a17:903:3ba3:b0:234:986c:66bf with SMTP id d9443c01a7336-23507fda8e1mr686765ad.11.1748476230187;
        Wed, 28 May 2025 16:50:30 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm1403445ad.156.2025.05.28.16.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:50:29 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required
Date: Wed, 28 May 2025 16:50:22 -0700
Message-Id: <20250528235026.4171109-2-anjelique.melendez@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6837a147 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=e8SBnR8fKgZMydxn7aMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: R7F9mYWavGyaJkyfAS1i2cnJ-NqPcL-N
X-Proofpoint-GUID: R7F9mYWavGyaJkyfAS1i2cnJ-NqPcL-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDIwOSBTYWx0ZWRfXxai6MD7szc4K
 jlXVK5d0tIrQ892SKIXHuJEGsHF3rKMjYSohY2wzQsaS8D38UQepqsa+bsTRx9eP91SPXK6BNZ3
 T6veJwaM7iRxHxtlJWZHAoLwJLKQi+Je0gRYK2f36cGwTqjZ5wBpxMMiA8ljVp76FilrPnscGoN
 bLLP193NC25lCOkjaj/9PMfsPeFYhrzw3xQG5KC4W9mXoDwPESPkSHolDtvxmfktmby7Vfuvv2D
 VWT2NFSGOF9tLmnHH6zpRlW2Bk9GRN5MOGOH8hY9UBx8tyxxCvrBlk7RUrNU5n1GeRDEscGVI/Q
 EwSLTVFEe9c/1eeuyxoJMIGYmE44BnbuuGmq3Dn+1b6KV4w23qwJcMNGhsx11Wqt3gkrLe8wOi9
 yLAsPNq1fcf2SmQLuIz0Yr71C7a+D8nHuleIIxFvRy3PXwqL9ZBrerUd3k5GtM8Ofuv/gxOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280209

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


