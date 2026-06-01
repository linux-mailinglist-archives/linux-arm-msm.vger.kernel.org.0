Return-Path: <linux-arm-msm+bounces-110566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJK2AFZpHWrqaAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:13:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 513A661E26E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A79913032CCF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0310827F18B;
	Mon,  1 Jun 2026 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQhuDmRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikGklR4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7319732ED34
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311703; cv=none; b=cT6Wa50LZ7+Tutsy4g5FnGlHgfLOBXkUB+RQtOyCVrhWz2CcjuoFy4QKHXU8ezL+4CfIiMYxZmffgsK+J/vr9ZLtxJ5lXatSweGPVl+zZYsb5kTx4BvdqsryX6WpwLNj66gtyV0SVgW7efxlT7Z1idoUlcA0KHHy8zn9yFRKtXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311703; c=relaxed/simple;
	bh=rXEZNnUVSRCvaSz7ODIekuNb0fO7Aw6iapXSGDdrqEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwoTH0rRoYEAXR3LKlx6/RJpbgh7b6XLAtfVkcmCmogpmqlS4/72z+IJZH+5TwUrVKpPI6c/2GXnWzd+P7RWavgi1IW2c+A08buN8OaFxxxNbgT12a6S8VlU2iVVY86aqRq54i/4mADsBFjuj3Enxqmi9z4oRmaHW8FEWBv+0Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQhuDmRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikGklR4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eDPY1214152
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wx7PsfCappcFeNrcYJjrCbV9OSLPVpQ+GgBu54EcyFM=; b=OQhuDmRV8J/L0Tkj
	fCn2VXwHOV9oaEvB1J3uilMqKcsD9kyz8rgXZvYh0jcoLOVnnrPMSLabdosjgcCV
	KN1kOkUA7az8FW6PgleTHN8W3hFaUTERhkrKl4MmrJMXQjV6cs8VPqPI6iV6/+AP
	6BUIiFssdX83xLFLAlJDZ6K3Fc5blt4WKZ1Cevq9gTtj0RfNVhyP7ITVRYO5jouD
	f+4AT5wdsr//zU4Q3vQQWTJ/LbRrIRbOMDn2VjD8TUU/QqdRm3HyZj8nxz4z7jy7
	vZd7kOpNKTkETPpfGa2qE+7tdkrAJ2DjBrmznuN+ufvr0XOTOlGnW8QKWkYC49wH
	sSUClg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s98js8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:01:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf281d523eso14883305ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780311701; x=1780916501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wx7PsfCappcFeNrcYJjrCbV9OSLPVpQ+GgBu54EcyFM=;
        b=ikGklR4NUA0l6b662HaHUIQOng0JCxpqnMHQq9qc0MsdB3o/i2BQXctyjoNNKrdalx
         DxquEOfG7BdIx784et0Tf58ca2LOxtw2crgpOJkstATyAYZO72k+QmaiKC4Jyo5NbAZf
         ObQSpKeDgQEeFq1vfQhrJjV9XAZ7Qq5C2CJ/bfU0Vc69AuuLukdVE0Ae3KAzcsjai+vr
         5ScwdU/s8NHpGQQD0hMqjuMBOcBwyXZ4eWqGBOsa9g09vwJLmPh6EBS0/V1x6xQVX9n+
         03OGBLVgtOFKsf0MHGIGGAR8bOtFebvxvA3GM4l3DL5mg9NIHHQ6y18AVXZKs2dQilVc
         vV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780311701; x=1780916501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wx7PsfCappcFeNrcYJjrCbV9OSLPVpQ+GgBu54EcyFM=;
        b=pSoo9sjQVvaMzAWDc5qji6ojTRmbdcd5ZVQC5GsoVZvZe6jStoAVrgEm9QDJtsOipM
         WuS0tTwL/j1qGrBbeNvYCDYW3bJOCW9sNV0aBvfKebLIKEeTXkvjdNUrq8yl6K77G5CY
         IQAtDy1DuCi1sXUrmnhYatoA75PM78McLh9YNsXwl9eZiAswvalcFxJS3U6MOKyA0NXI
         ZhXm/OJZ7tfanylzzikRIYlzylkL3lCrweCm+m+b56IxM9+Kx6KDZUR8A6P+pzn8Cv2p
         rKEkWNu30LYBZRYgQs7J+FMvltdACpVdRr0S6/BtUgdD8HF/H8ps16tO+IgnwWZ8BYf/
         TM0w==
X-Gm-Message-State: AOJu0Yw9Gaom5f5L0uQyvVbkVIhJ0PHCU47ey4Bw61oThNbfGYbOia+b
	CWMgCjjp4d7Ka4TN0tNBTGjht1mNB+ouMqVaepM0tqhIh71hZ4C7SJ7BPK3c2YA2x9Wv+1+ML+f
	YuiIuZ5KgHoR75RUTZscLlq6EvOCryIwCkKBjW9ONMJVJzbY0e301qdRYb8qred+eRK68Nz5LCC
	RG
X-Gm-Gg: Acq92OGxcIfPlZBhCDkM1LpNBZns3AGVTayuNEXxG3UgZarUFbt1A1B4v/Dq4A0su9F
	hjWg81aPIzZtG8HAHgHFFMwgxvZCEQnTTOcjhoX1R1chB25gWJoXqPK6ywWMZWAt0SBYhFnHg4k
	+pIJK/yvNtvQALLWu7vrPU3eq+Wk69n52tIETnIBMAMQNSWzuj9sNb7B3oGRj+ru45CvRWaLDFL
	x3wMJ8a3byf3IHUuQAAGj+8o2k7JaaUyloGN8ZEiMEATzTR9HSHLqSK2nK849g9hkPDMVjCnVG2
	r4YiO4gR51Rz8zt3ECNjbSJfJpE+oia0MQMjAxeUGpAR/YBkCNhjrBAnbihriUxP/F3QLguieAf
	gg8z+v18AEDuywfZlhE3QtqAKRAVrlUd68HfIbGO5BfqHb5TTxOYKzBMsjGeV2dRe
X-Received: by 2002:a17:902:da8d:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2bf3683bf5dmr118659435ad.25.1780311700670;
        Mon, 01 Jun 2026 04:01:40 -0700 (PDT)
X-Received: by 2002:a17:902:da8d:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2bf3683bf5dmr118658745ad.25.1780311700025;
        Mon, 01 Jun 2026 04:01:40 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd6edsm126239185ad.18.2026.06.01.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:01:39 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 16:31:19 +0530
Subject: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
In-Reply-To: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: SjWcLV-CZsbt0jKVl9piwpBvJoE6WFxm
X-Proofpoint-GUID: SjWcLV-CZsbt0jKVl9piwpBvJoE6WFxm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExMSBTYWx0ZWRfX7MJQUsIZ0Aog
 soFhhHLKr+8igmpzbcZV5U4SKOxrgEGqVl8thgppx+s0XYNTnIvf3MW/5DsFuoG8QvefNMYLtT7
 xcMIzBoJtLDiCHWM4bF2Zi3cZjjEhNv2CJLPW/wihn+ZgAgPRGPXJGrZaJdkNeb5SumKwnSztXk
 YkyeVazQ/3n0Ln/Fe9iShxL9Sw9MrerLiOLUB96RfT+A6JfvdUqOH8jQskN4TV7LCFPIJlXt9Jg
 pO3XlbavtueJqKXoGQLomGbl6lOw+anjIzKSqiXyLS4Vi0DDGJW/29T1F85JYWykLdT5ToJ+aAn
 of7bwzaR+E50JlSL5PsFrzlKLD8rihwNn5BJsfZAjdWcWRPT0bG9gh4taq/UC4BFjt4wMx6qkJw
 S8nW7hvR/emuLxNGlRuL0KniP1rJWso2e8+yBP1m0DeMnChh81/zEg1rxJsWME3P9zUL2f32NLD
 ZE6GehR0ofJQgShimYg==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d6695 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LIlL8iqg20j2UnsMqcUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110566-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 513A661E26E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Add driver for the Qualcomm MBG thermal monitoring device. It monitors
the die temperature, and when there is a level 1 upper threshold
violation, it receives an interrupt over spmi. The driver reads
the fault status register and notifies thermal accordingly.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 drivers/thermal/qcom/Kconfig            |  11 ++
 drivers/thermal/qcom/Makefile           |   1 +
 drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 254 ++++++++++++++++++++++++++++++++
 3 files changed, 266 insertions(+)

diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
index a6bb01082ec6..f2fc24a3096f 100644
--- a/drivers/thermal/qcom/Kconfig
+++ b/drivers/thermal/qcom/Kconfig
@@ -21,6 +21,17 @@ config QCOM_SPMI_ADC_TM5
 	  Thermal client sets threshold temperature for both warm and cool and
 	  gets updated when a threshold is reached.
 
+config QCOM_SPMI_MBG_TM
+	tristate "Qualcomm SPMI PMIC MBG Temperature monitor"
+	depends on QCOM_SPMI_ADC5_GEN3
+	select REGMAP_SPMI
+	help
+	  This enables a thermal driver for the MBG thermal monitoring device.
+	  It shows up in sysfs as a thermal sensor with single trip point.
+	  It notifies the thermal framework when this trip is violated. The
+	  temperature reported by the thermal sensor reflects the real
+	  time die temperature through ADC channel.
+
 config QCOM_SPMI_TEMP_ALARM
 	tristate "Qualcomm SPMI PMIC Temperature Alarm"
 	depends on OF && SPMI && IIO
diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
index 0fa2512042e7..1bec2746b98d 100644
--- a/drivers/thermal/qcom/Makefile
+++ b/drivers/thermal/qcom/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_QCOM_TSENS)	+= qcom_tsens.o
 qcom_tsens-y			+= tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
 				   tsens-8960.o
 obj-$(CONFIG_QCOM_SPMI_ADC_TM5)	+= qcom-spmi-adc-tm5.o
+obj-$(CONFIG_QCOM_SPMI_MBG_TM) += qcom-spmi-mbg-tm.o
 obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)	+= qcom-spmi-temp-alarm.o
 obj-$(CONFIG_QCOM_LMH)		+= lmh.o
diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
new file mode 100644
index 000000000000..60190b341fc7
--- /dev/null
+++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/thermal.h>
+#include <linux/iio/consumer.h>
+
+#define MBG_TEMP_MON2_FAULT_STATUS	0x50
+
+#define MON_FAULT_STATUS_MASK		GENMASK(7, 4)
+#define MON_FAULT_LVL1_UPR		0x5
+
+#define MON2_LVL1_UP_THRESH		0x59
+
+#define MBG_TEMP_MON2_MISC_CFG		0x5f
+#define MON2_UP_THRESH_EN		BIT(1)
+
+#define MBG_TEMP_STEP_MV		8
+#define MBG_TEMP_DEFAULT_TEMP_MV	600
+#define MBG_TEMP_CONSTANT		1000
+#define MBG_MIN_TRIP_TEMP		25000
+#define MBG_MAX_SUPPORTED_TEMP		160000
+
+/**
+ * struct mbg_tm_chip - MBG thermal monitor device data.
+ * @map: regmap for accessing MBG thermal registers.
+ * @dev: mbg_tm_chip device.
+ * @tz_dev: thermal zone device registered with the thermal framework.
+ * @lock: mbg_tm_chip lock for set trip temperature.
+ * @base: base register offset for this MBG instance
+ * @irq: interrupt line used to signal threshold events
+ * @last_temp: last measured temperature.
+ * @last_thres_crossed: indicates whether the last interrupt crossed a threshold
+ * @adc: IIO ADC channel used for temperature sensing
+ */
+struct mbg_tm_chip {
+	struct regmap			*map;
+	struct device			*dev;
+	struct thermal_zone_device	*tz_dev;
+	struct mutex                    lock;
+	unsigned int			base;
+	int				irq;
+	int				last_temp;
+	bool				last_thres_crossed;
+	struct iio_channel		*adc;
+};
+
+/**
+ * struct mbg_map_table - temperature to voltage mapping entry
+ * @min_temp: minimum temperature supported by this mapping entry
+ * @vtemp0: reference voltage or ADC code corresponding to the temperature
+ * @tc: temperature coefficient used for conversion calculations
+ */
+struct mbg_map_table {
+	int min_temp;
+	int vtemp0;
+	int tc;
+};
+
+static const struct mbg_map_table map_table[] = {
+	/* minT	vtemp0	tc */
+	{ -60000, 4337, 1967 },
+	{ -40000, 4731, 1964 },
+	{ -20000, 5124, 1957 },
+	{ 0,      5515, 1949 },
+	{ 20000,  5905, 1940 },
+	{ 40000,  6293, 1930 },
+	{ 60000,  6679, 1921 },
+	{ 80000,  7064, 1910 },
+	{ 100000, 7446, 1896 },
+	{ 120000, 7825, 1878 },
+	{ 140000, 8201, 1859 },
+};
+
+static int mbg_tm_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
+	int ret, milli_celsius;
+
+	if (chip->last_thres_crossed) {
+		dev_dbg(chip->dev, "last_temp: %d\n", chip->last_temp);
+		chip->last_thres_crossed = false;
+		*temp = chip->last_temp;
+		return 0;
+	}
+
+	ret = iio_read_channel_processed(chip->adc, &milli_celsius);
+	if (ret < 0) {
+		dev_err(chip->dev, "Failed to read iio channel with %d\n", ret);
+		return ret;
+	}
+
+	*temp = milli_celsius;
+
+	return 0;
+}
+
+static int temp_to_vtemp_mv(int temp)
+{
+	int idx, vtemp, tc = 0, t0 = 0, vtemp0 = 0;
+
+	for (idx = 0; idx < ARRAY_SIZE(map_table); idx++)
+		if (temp >= map_table[idx].min_temp &&
+		    temp < (map_table[idx].min_temp + 20000)) {
+			tc = map_table[idx].tc;
+			t0 = map_table[idx].min_temp;
+			vtemp0 = map_table[idx].vtemp0;
+			break;
+		}
+
+	/*
+	 * Formula to calculate vtemp(mV) from a given temp
+	 * vtemp = (temp - minT) * tc + vtemp0
+	 * tc, t0 and vtemp0 values are mentioned in the map_table array.
+	 */
+	vtemp = ((temp - t0) * tc + vtemp0 * 100000) / 1000000;
+
+	/* step size is 8mV */
+	return abs(vtemp - MBG_TEMP_DEFAULT_TEMP_MV) / MBG_TEMP_STEP_MV;
+}
+
+static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_temp,
+				int temp)
+{
+	struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
+	int ret = 0;
+
+	guard(mutex)(&chip->lock);
+
+	/* The HW has a limitation that the trip set must be above 25C */
+	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
+		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
+				      MON2_UP_THRESH_EN);
+		if (ret < 0)
+			return ret;
+
+		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
+				   temp_to_vtemp_mv(temp));
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(chip->dev, "Set trip b/w 25C and 160C\n");
+		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
+					MON2_UP_THRESH_EN);
+		return ret;
+	}
+
+	/*
+	 * Configure the last_temp one degree higher, to ensure the
+	 * violated temp is returned to thermal framework when it reads
+	 * temperature for the first time after the violation happens.
+	 * This is needed to account for the inaccuracy in the conversion
+	 * formula used which leads to the thermal framework setting back
+	 * the same thresholds in case the temperature it reads does not
+	 * show violation.
+	 */
+	chip->last_temp = temp + MBG_TEMP_CONSTANT;
+
+	return ret;
+}
+
+static const struct thermal_zone_device_ops mbg_tm_ops = {
+	.get_temp = mbg_tm_get_temp,
+	.set_trips = mbg_tm_set_trip_temp,
+};
+
+static irqreturn_t mbg_tm_isr(int irq, void *data)
+{
+	struct mbg_tm_chip *chip = data;
+	int ret, val;
+
+	scoped_guard(mutex, &chip->lock) {
+		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
+		if (ret < 0)
+			return IRQ_HANDLED;
+	}
+
+	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) & MON_FAULT_LVL1_UPR) {
+		chip->last_thres_crossed = true;
+		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
+		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
+	} else {
+		dev_dbg(chip->dev, "Lvl1 upper threshold not violated, ignoring interrupt\n");
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int mbg_tm_probe(struct platform_device *pdev)
+{
+	struct mbg_tm_chip *chip;
+	struct device_node *node = pdev->dev.of_node;
+	u32 res;
+	int ret;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &pdev->dev;
+
+	mutex_init(&chip->lock);
+
+	chip->map = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!chip->map)
+		return -ENXIO;
+
+	ret = device_property_read_u32(chip->dev, "reg", &res);
+	if (ret < 0)
+		return dev_err_probe(chip->dev, ret, "Couldn't read reg property\n");
+
+	chip->base = res;
+
+	chip->irq = platform_get_irq(pdev, 0);
+	if (chip->irq < 0)
+		return dev_err_probe(chip->dev, chip->irq, "Failed to get irq\n");
+
+	chip->adc = devm_iio_channel_get(&pdev->dev, "thermal");
+	if (IS_ERR(chip->adc))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->adc), "Failed to get adc channel\n");
+
+	chip->tz_dev = devm_thermal_of_zone_register(chip->dev, 0, chip, &mbg_tm_ops);
+	if (IS_ERR(chip->tz_dev))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->tz_dev),
+				     "Failed to register sensor\n");
+
+	return devm_request_threaded_irq(&pdev->dev, chip->irq, NULL, mbg_tm_isr, IRQF_ONESHOT,
+					 node->name, chip);
+}
+
+static const struct of_device_id mbg_tm_match_table[] = {
+	{ .compatible = "qcom,pm8775-mbg-tm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mbg_tm_match_table);
+
+static struct platform_driver mbg_tm_driver = {
+	.driver = {
+		.name = "qcom-spmi-mbg-tm",
+		.of_match_table = mbg_tm_match_table,
+	},
+	.probe = mbg_tm_probe,
+};
+module_platform_driver(mbg_tm_driver);
+
+MODULE_DESCRIPTION("PMIC MBG Temperature monitor driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


