Return-Path: <linux-arm-msm+bounces-107742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAlGCnrhBmrVogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:03:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDDC54BF59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7F3630BCD45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F57423154;
	Fri, 15 May 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5DhbtqB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A5hcbiYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7524D421F1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835287; cv=none; b=qHXt03jHxWmzYpIDZWjEENu0v63JI+PzDOpe70gc4C5wMQ5JpRJBrN9GQhD+7EAtjTgcZ8+UNNbuiPy/DA1B2c4r3z4np5C5EDw1bdjpS3hiOhqG0+3fCZot2WQbPj38Jd0t3STGpmjxdbwEDIWAGf+8BOBcQYyMlhMc3Y1EZ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835287; c=relaxed/simple;
	bh=xnWPcgQu1kLttBn+oGBJicbPE2oNe1of6Ry9jIX3xXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqTmNuGq9IfzlxIJxkBHwomeW8RwIze6ApSu4vAUnBJwrjmbCijSrZ+rR7lKbe6AZQpaIvNspdfYIYiLsBFMnu36NXR7V/p/U674dOClgxj8fW+flGos4k79N3lCH2ZjaPv7NcaNKIjIOBdlO3g9yBfJRrpSeh0iEzoaezpDI9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5DhbtqB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5hcbiYh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4ht3S3512955
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYgXxgvW6CpB8ehm03L34GMGDIeX5cGDWXSLArzRyVA=; b=a5DhbtqBSSZ2a1Zy
	x1ljwD830m5AaM1kJGgT3w9q5G5KWMeiOYt5sJFLpH7N7RNqnV9UgSfy9ahdqXAI
	/PaO9uxYp0suXuOcqltW9xubliNpbpeHS0VHGcX7W3Z4d8fhCCnBo5CXi1j42TF/
	CoGEN3Yem5hD/uT0i7nzHMYQuAj5T0lAhSnpWmjibg3+dEw1iZM79lqI1g4dLhgu
	58jYsubBQg5h3mFiR0De4S5TgqCM53QjO4gnevZZIxTFLoTKuAQdJz2TrGr+grD4
	2BQXUjjQm9/S1hw+7vxYeYxuL7VH8Era/afnOLWWofIiPJfMFmbqYctgDpWfMbZW
	/fpQRQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vag4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:54:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso4749349b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778835282; x=1779440082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYgXxgvW6CpB8ehm03L34GMGDIeX5cGDWXSLArzRyVA=;
        b=A5hcbiYhDGQUmQGq/+0EbTX0BNejLnqZAfjITICF0yg0/gwePQ/0epyvxi+hLyDBb3
         ISt8J39/KFb7h+/vWdMOkLx4+GGGN2C1rJB5SATgmEsXAaG09n8F877YUoOG3dLjoAJR
         6EIRmoWenQoA19qqh3EeCYESyBhQSjqJly9jTqykCsLfzysgoFg9pKXOV/TOfnfQLI05
         +VldXMuPZ5HYpjcLzjy06FVjkYtT5/ru/3KIKvoXMQZUQ/qutkNi1OlK7z3C69J0gpQq
         IGnZIFaCX3y/LLYu2begNCmJNoDvJECHGyoh2R2VINsyhrCGA5vDNNDmEURFKLKvlE0y
         PbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835282; x=1779440082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYgXxgvW6CpB8ehm03L34GMGDIeX5cGDWXSLArzRyVA=;
        b=Zj6wKmQR7JwyzO4/vcMY+Yej5gTKvgvreF4kyu2Wsamman49k4cYnVHvMEs7+z3AAX
         0KzvGk0tiPTwgSM+IPRcdr3Mi3g9Gv9KXyvIbvuR9rxc8UueQYbMAySHzQMbp/40AAX1
         wEC/ITBrXwV60nJUe7ePr62nshYd1ezXROeNJDwY7CanyrnVrChY63vIdSYHqbIoy+gd
         iCO/pzdVOxuaeSE6m94e8Vl4SeVjfJztcnZnHKce7WhIFsLiGwNzTHwxBl9xHtxL5rJQ
         27tMISvo7iCBD5bU0Ona1IBlUlsWkI7TB70/rRJSJMyP4rIXRAADZaUumSdyPupF0leH
         12AA==
X-Forwarded-Encrypted: i=1; AFNElJ9U7wp+IKPZg/BXUcTU23OtLShpQNjZsrqI/BWNcdC4c640OTn3Gs9NBx9DDwynm5uODDfYyUHlid/p6G2I@vger.kernel.org
X-Gm-Message-State: AOJu0YypTbOmpPiuknKXWm3oWhEmRE6LTHjHjcs1oiOyFfR5HlNcRbaO
	6avHiBZuono7ua0VdPB3QN8jix5Nv8iRHBTkRyDjMG5Y0x41KYOhiouA09xCmQwXDOwD1lWAwyz
	qlwlK37OnWI3rolooJb65qsP5urFIcvlaEpnjtPTnO0ZR3TuRGcAjP7w/uTMP53G0GGSg
X-Gm-Gg: Acq92OFJCJJ8/QaogpVASGuvgSS/q7D5521UuBMN87RsdO3Pyv42zOcm9hSswQv5Tap
	gdtTu2ffBt3RyfoqN74/MdzrKdh8Of+v0SV2t9NBFcprrAmXq6IOps/+U0CqJiH5krXXQ6+CV1F
	7N/UvMV/TNB0qeqeXS7n2N0kEcj0Jis5W23PRWQXQrHJwXz747CQajNAU7XwsM37i/0wIHUYi4L
	5jCKKtIUBSGuqGAHPH6BqJoWyp4sk78a4Nn0SLnV5PEFxp9xafM6r/J/Ug8oBPyXxhOF9P1JwxU
	eW1+kTZdUcbqk9si/LrusPEKc+t5/AOSe1IaTfReDMeSR5GvCNpqX3lP3Qfw3oKP3abkU5iT4mc
	Kk2kTUALc4eKc8wsTbW6lheHhQtQayhiAA5zK1rTd
X-Received: by 2002:a05:6a00:429b:b0:82f:d34c:ccc6 with SMTP id d2e1a72fcca58-83f33ab6689mr3609568b3a.10.1778835282044;
        Fri, 15 May 2026 01:54:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:429b:b0:82f:d34c:ccc6 with SMTP id d2e1a72fcca58-83f33ab6689mr3609517b3a.10.1778835281502;
        Fri, 15 May 2026 01:54:41 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm6766426b3a.53.2026.05.15.01.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:54:40 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:23:45 +0530
Subject: [PATCH 2/2] thermal: qcom: add support for PMIC5 Gen3 ADC thermal
 monitoring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-gen3_adc_tm-v1-2-39ba29f9b4ab@oss.qualcomm.com>
References: <20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com>
In-Reply-To: <20260515-gen3_adc_tm-v1-0-39ba29f9b4ab@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778835260; l=15370;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=xnWPcgQu1kLttBn+oGBJicbPE2oNe1of6Ry9jIX3xXI=;
 b=7f7nF0Vwffp5BB/ujp9uhdbonRi/i41oLYryvvZsoMg6v2DMRyIbNqAL4a0ydYqz4OtTHxNZL
 Zswj0Lt2aqpAUv/9/J1cUbvluHsQfzOFchCRb2/Kv1+0L2W24h89Yfy
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA4OSBTYWx0ZWRfX1p6xnJEe4noM
 IIHZrURmw37N8r4xiQC8fTOsNmULl5Gw8S/vldYIe/HvAE27YIneO4kaqkMPGTiIKZU50MqDb8K
 u+HalKwujXRGgmQoKl4zbDAhBgc1VwziBcXD2JCe5nkQg54gh8cNzlRm9MSQYhNwaKs5oekC3NZ
 KwpsHZN620+LEm2GZ0Kd1c/74T33l59rxrZBMFVNwgGrVzYCHYuqPorxapDslLVa+JPu9Gsy58w
 nffT23IsA3Na0OyqgmNFqNrywKumfjbEwAYFjnUDQTjl6FKp2wGoagQuI7IbpyA+oU5uHv9YnPQ
 jQ6kPuvXUkijDF4l5ZBIlpp0jHO5wEO8ba1Pw3cftFjnzqho+O+qWu/mdkOqLIT8YnTYa8qfkdV
 jSdHDh1lC0c7Vxz5coctwFRGdWQgs0Z2ItNsHGcDEwbdqPWbyMC/pAFu7THVy9/kYBPjykXiCE/
 enVQrRn1xnjxN2CIrCA==
X-Proofpoint-GUID: S4xvRDEJLw35JtCecG-il8G_WWMYtD_q
X-Proofpoint-ORIG-GUID: S4xvRDEJLw35JtCecG-il8G_WWMYtD_q
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06df53 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YHkA5PA7XmDVxWZIdzsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150089
X-Rspamd-Queue-Id: 8BDDC54BF59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107742-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for ADC_TM part of PMIC5 Gen3.

This is an auxiliary driver under the Gen3 ADC driver, which implements the
threshold setting and interrupt generating functionalities of QCOM ADC_TM
drivers, used to support thermal trip points.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/thermal/qcom/Kconfig                  |   9 +
 drivers/thermal/qcom/Makefile                 |   1 +
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 437 ++++++++++++++++++++++++++
 3 files changed, 447 insertions(+)

diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
index a6bb01082ec6..1acb11e4ac80 100644
--- a/drivers/thermal/qcom/Kconfig
+++ b/drivers/thermal/qcom/Kconfig
@@ -21,6 +21,15 @@ config QCOM_SPMI_ADC_TM5
 	  Thermal client sets threshold temperature for both warm and cool and
 	  gets updated when a threshold is reached.
 
+config QCOM_SPMI_ADC_TM5_GEN3
+	tristate "Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen3"
+	depends on QCOM_SPMI_ADC5_GEN3
+	help
+	  This enables the auxiliary thermal driver for the ADC5 Gen3 thermal
+	  monitoring device. It shows up as a thermal zone with multiple trip points.
+	  Thermal client sets threshold temperature for both warm and cool and
+	  gets updated when a threshold is reached.
+
 config QCOM_SPMI_TEMP_ALARM
 	tristate "Qualcomm SPMI PMIC Temperature Alarm"
 	depends on OF && SPMI && IIO
diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/Makefile
index 0fa2512042e7..828d9e7bc797 100644
--- a/drivers/thermal/qcom/Makefile
+++ b/drivers/thermal/qcom/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_QCOM_TSENS)	+= qcom_tsens.o
 qcom_tsens-y			+= tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
 				   tsens-8960.o
 obj-$(CONFIG_QCOM_SPMI_ADC_TM5)	+= qcom-spmi-adc-tm5.o
+obj-$(CONFIG_QCOM_SPMI_ADC_TM5_GEN3)	+= qcom-spmi-adc-tm5-gen3.o
 obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)	+= qcom-spmi-temp-alarm.o
 obj-$(CONFIG_QCOM_LMH)		+= lmh.o
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
new file mode 100644
index 000000000000..633008f173a8
--- /dev/null
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device/devres.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/iio/adc/qcom-adc5-gen3-common.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/thermal.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "../thermal_hwmon.h"
+
+#define ADC_TM5_GEN3_CONFIG_REGS 12
+
+struct device;
+struct adc_tm5_gen3_chip;
+
+/**
+ * struct adc_tm5_gen3_channel_props - ADC_TM channel structure
+ * @timer: time period of recurring TM measurement.
+ * @tm_chan_index: TM channel number used (ranging from 1-7).
+ * @sdam_index: SDAM on which this TM channel lies.
+ * @common_props: structure with common  ADC channel properties.
+ * @high_thr_en: TM high threshold crossing detection enabled.
+ * @low_thr_en: TM low threshold crossing detection enabled.
+ * @chip: ADC TM device.
+ * @tzd: pointer to thermal device corresponding to TM channel.
+ */
+struct adc_tm5_gen3_channel_props {
+	unsigned int timer;
+	unsigned int tm_chan_index;
+	unsigned int sdam_index;
+	struct adc5_channel_common_prop common_props;
+	bool high_thr_en;
+	bool low_thr_en;
+	struct adc_tm5_gen3_chip *chip;
+	struct thermal_zone_device *tzd;
+};
+
+/**
+ * struct adc_tm5_gen3_chip - ADC Thermal Monitoring device structure
+ * @dev_data: Top-level ADC device data.
+ * @chan_props: Array of ADC_TM channel structures.
+ * @nchannels: number of TM channels allocated
+ * @dev: SPMI ADC5 Gen3 device.
+ */
+struct adc_tm5_gen3_chip {
+	struct adc5_device_data *dev_data;
+	struct adc_tm5_gen3_channel_props *chan_props;
+	unsigned int nchannels;
+	struct device *dev;
+};
+
+DEFINE_GUARD(adc5_gen3, struct adc_tm5_gen3_chip *, adc5_gen3_mutex_lock(_T->dev),
+	     adc5_gen3_mutex_unlock(_T->dev))
+
+static int get_sdam_from_irq(struct adc_tm5_gen3_chip *adc_tm5, int irq)
+{
+	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
+		if (adc_tm5->dev_data->base[i].irq == irq)
+			return i;
+	}
+	return -ENOENT;
+}
+
+static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
+	int ret, sdam_num;
+	u8 tm_status[2];
+	u8 status, val;
+
+	sdam_num = get_sdam_from_irq(adc_tm5, irq);
+	if (sdam_num < 0)
+		return IRQ_NONE;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
+			     &status, sizeof(status));
+	if (ret)
+		return IRQ_NONE;
+
+	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
+		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
+		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
+				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
+		return IRQ_HANDLED;
+	}
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
+			     tm_status, sizeof(tm_status));
+	if (ret)
+		return IRQ_NONE;
+
+	if (tm_status[0] || tm_status[1])
+		return IRQ_WAKE_THREAD;
+
+	return IRQ_NONE;
+}
+
+static int adc5_gen3_tm_status_check(struct adc_tm5_gen3_chip *adc_tm5,
+				     int sdam_index, u8 *tm_status, u8 *buf)
+{
+	int ret;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
+			     tm_status, 2);
+	if (ret)
+		return ret;
+
+	ret = adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS_CLR,
+				     tm_status, 2);
+	if (ret)
+		return ret;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_CH_DATA0(0),
+			     buf, 16);
+	return ret;
+}
+
+static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
+	int sdam_index = -1;
+	u8 tm_status[2] = { };
+	u8 buf[16] = { };
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		struct adc_tm5_gen3_channel_props *chan_prop = &adc_tm5->chan_props[i];
+		int offset = chan_prop->tm_chan_index;
+		bool upper_set, lower_set;
+		int ret;
+
+		scoped_guard(adc5_gen3, adc_tm5) {
+			if (chan_prop->sdam_index != sdam_index) {
+				sdam_index = chan_prop->sdam_index;
+				ret = adc5_gen3_tm_status_check(adc_tm5, sdam_index,
+								tm_status, buf);
+				if (ret)
+					return IRQ_NONE;
+			}
+
+			upper_set = ((tm_status[0] & BIT(offset)) && chan_prop->high_thr_en);
+			lower_set = ((tm_status[1] & BIT(offset)) && chan_prop->low_thr_en);
+		}
+
+		if (!(upper_set || lower_set))
+			continue;
+
+		thermal_zone_device_update(chan_prop->tzd, THERMAL_TRIP_VIOLATED);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int adc_tm5_gen3_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct adc_tm5_gen3_channel_props *prop = thermal_zone_device_priv(tz);
+	struct adc_tm5_gen3_chip *adc_tm5;
+
+	if (!prop || !prop->chip)
+		return -EINVAL;
+
+	adc_tm5 = prop->chip;
+
+	return adc5_gen3_get_scaled_reading(adc_tm5->dev, &prop->common_props,
+					    temp);
+}
+
+static int adc_tm5_gen3_disable_channel(struct adc_tm5_gen3_channel_props *prop)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
+	int ret;
+	u8 val;
+
+	prop->high_thr_en = false;
+	prop->low_thr_en = false;
+
+	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
+	if (ret)
+		return ret;
+
+	val = BIT(prop->tm_chan_index);
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TM_HIGH_STS_CLR, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TM_LOW_STS_CLR, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	val = MEAS_INT_DISABLE;
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TIMER_SEL, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	/* To indicate there is an actual conversion request */
+	val = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_PERPH_CH, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	val = ADC5_GEN3_CONV_REQ_REQ;
+	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			       ADC5_GEN3_CONV_REQ, &val, sizeof(val));
+}
+
+static int adc_tm5_gen3_configure(struct adc_tm5_gen3_channel_props *prop,
+				  int low_temp, int high_temp)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
+	u8 buf[ADC_TM5_GEN3_CONFIG_REGS];
+	u8 conv_req;
+	u16 adc_code;
+	int ret;
+
+	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
+	if (ret < 0)
+		return ret;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, prop->sdam_index,
+			     ADC5_GEN3_SID, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	/* Write SID */
+	buf[0] = FIELD_PREP(ADC5_GEN3_SID_MASK, prop->common_props.sid);
+
+	/* Select TM channel and indicate there is an actual conversion request */
+	buf[1] = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
+
+	buf[2] = prop->timer;
+
+	/* Digital param selection */
+	adc5_gen3_update_dig_param(&prop->common_props, &buf[3]);
+
+	/* Update fast average sample value */
+	buf[4] &= ~ADC5_GEN3_FAST_AVG_CTL_SAMPLES_MASK;
+	buf[4] |= prop->common_props.avg_samples | ADC5_GEN3_FAST_AVG_CTL_EN;
+
+	/* Select ADC channel */
+	buf[5] = prop->common_props.channel;
+
+	/* Select HW settle delay for channel */
+	buf[6] = FIELD_PREP(ADC5_GEN3_HW_SETTLE_DELAY_MASK,
+			    prop->common_props.hw_settle_time_us);
+
+	/* High temperature corresponds to low voltage threshold */
+	prop->low_thr_en = (high_temp != INT_MAX);
+	if (prop->low_thr_en) {
+		adc_code = qcom_adc_tm5_gen2_temp_res_scale(high_temp);
+		put_unaligned_le16(adc_code, &buf[8]);
+	}
+
+	/* Low temperature corresponds to high voltage threshold */
+	prop->high_thr_en = (low_temp != -INT_MAX);
+	if (prop->high_thr_en) {
+		adc_code = qcom_adc_tm5_gen2_temp_res_scale(low_temp);
+		put_unaligned_le16(adc_code, &buf[10]);
+	}
+
+	buf[7] = 0;
+	if (prop->high_thr_en)
+		buf[7] |= ADC5_GEN3_HIGH_THR_INT_EN;
+	if (prop->low_thr_en)
+		buf[7] |= ADC5_GEN3_LOW_THR_INT_EN;
+
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index, ADC5_GEN3_SID,
+			      buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	conv_req = ADC5_GEN3_CONV_REQ_REQ;
+	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			       ADC5_GEN3_CONV_REQ, &conv_req, sizeof(conv_req));
+}
+
+static int adc_tm5_gen3_set_trip_temp(struct thermal_zone_device *tz,
+				      int low_temp, int high_temp)
+{
+	struct adc_tm5_gen3_channel_props *prop = thermal_zone_device_priv(tz);
+	struct adc_tm5_gen3_chip *adc_tm5;
+
+	if (!prop || !prop->chip)
+		return -EINVAL;
+
+	adc_tm5 = prop->chip;
+
+	dev_dbg(adc_tm5->dev, "channel:%s, low_temp(mdegC):%d, high_temp(mdegC):%d\n",
+		prop->common_props.label, low_temp, high_temp);
+
+	guard(adc5_gen3)(adc_tm5);
+
+	return adc_tm5_gen3_configure(prop, low_temp, high_temp);
+}
+
+static const struct thermal_zone_device_ops adc_tm_ops = {
+	.get_temp = adc_tm5_gen3_get_temp,
+	.set_trips = adc_tm5_gen3_set_trip_temp,
+};
+
+static int adc_tm5_register_tzd(struct adc_tm5_gen3_chip *adc_tm5)
+{
+	struct thermal_zone_device *tzd;
+	unsigned int channel;
+	int ret;
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		channel = ADC5_GEN3_V_CHAN(adc_tm5->chan_props[i].common_props);
+		tzd = devm_thermal_of_zone_register(adc_tm5->dev, channel,
+						    &adc_tm5->chan_props[i],
+						    &adc_tm_ops);
+		if (IS_ERR(tzd)) {
+			if (PTR_ERR(tzd) == -ENODEV) {
+				dev_info(adc_tm5->dev,
+					 "thermal sensor on channel %d is not used\n",
+					 channel);
+				continue;
+			}
+			return dev_err_probe(adc_tm5->dev, PTR_ERR(tzd),
+					     "Error registering TZ zone:%ld for channel:%d\n",
+					     PTR_ERR(tzd), channel);
+		}
+		adc_tm5->chan_props[i].tzd = tzd;
+		ret = devm_thermal_add_hwmon_sysfs(adc_tm5->dev, tzd);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static void adc5_gen3_disable(void *data)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = data;
+
+	guard(adc5_gen3)(adc_tm5);
+	/* Disable all available TM channels */
+	for (int i = 0; i < adc_tm5->nchannels; i++)
+		adc_tm5_gen3_disable_channel(&adc_tm5->chan_props[i]);
+}
+
+static int adc_tm5_probe(struct auxiliary_device *aux_dev,
+			 const struct auxiliary_device_id *id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5;
+	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
+	struct device *dev = &aux_dev->dev;
+	int ret;
+
+	adc_tm5 = devm_kzalloc(dev, sizeof(*adc_tm5), GFP_KERNEL);
+	if (!adc_tm5)
+		return -ENOMEM;
+
+	aux_dev_wrapper = container_of(aux_dev, struct tm5_aux_dev_wrapper,
+				       aux_dev);
+
+	adc_tm5->dev = dev;
+	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
+	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
+	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
+					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
+	if (!adc_tm5->chan_props)
+		return -ENOMEM;
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
+		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
+		adc_tm5->chan_props[i].sdam_index = (i + 1) / 8;
+		adc_tm5->chan_props[i].tm_chan_index = (i + 1) % 8;
+		adc_tm5->chan_props[i].chip = adc_tm5;
+	}
+
+	/* This is to disable all ADC_TM channels in case of probe failure. */
+	ret = devm_add_action(dev, adc5_gen3_disable, adc_tm5);
+	if (ret)
+		return ret;
+
+	/*
+	 * First SDAM's interrupt is shared between main ADC driver
+	 * and auxiliary TM driver, so its flags must include
+	 * IRQF_SHARED. This is not needed for other SDAMs as they
+	 * will be used only for TM functionality.
+	 */
+
+	ret = devm_request_threaded_irq(dev,
+					adc_tm5->dev_data->base[0].irq,
+					adctm5_gen3_isr, adctm5_gen3_isr_thread,
+					IRQF_ONESHOT | IRQF_SHARED,
+					adc_tm5->dev_data->base[0].irq_name,
+					adc_tm5);
+	if (ret < 0)
+		return ret;
+
+	for (int i = 1; i < adc_tm5->dev_data->num_sdams; i++) {
+		ret = devm_request_threaded_irq(dev,
+						adc_tm5->dev_data->base[i].irq,
+						adctm5_gen3_isr, adctm5_gen3_isr_thread,
+						IRQF_ONESHOT, adc_tm5->dev_data->base[i].irq_name,
+						adc_tm5);
+		if (ret < 0)
+			return ret;
+	}
+
+	return adc_tm5_register_tzd(adc_tm5);
+}
+
+static const struct auxiliary_device_id adctm5_auxiliary_id_table[] = {
+	{ .name = "qcom_spmi_adc5_gen3.adc5_tm_gen3", },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(auxiliary, adctm5_auxiliary_id_table);
+
+static struct auxiliary_driver adctm5gen3_auxiliary_driver = {
+	.id_table = adctm5_auxiliary_id_table,
+	.probe = adc_tm5_probe,
+};
+
+module_auxiliary_driver(adctm5gen3_auxiliary_driver);
+
+MODULE_DESCRIPTION("SPMI PMIC Thermal Monitor ADC driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("QCOM_SPMI_ADC5_GEN3");

-- 
2.43.0


