Return-Path: <linux-arm-msm+bounces-66381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14AB0FCD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B63841898F9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B7F275AF6;
	Wed, 23 Jul 2025 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNtdTFwv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6962737EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309688; cv=none; b=TpT5jDohsnqUxoCsABNnSw5DdY/496tcXab+9Fv7ljSouzFtii21oBc2TaUAiBZCsMd1g/gJVP1E7pnHrEfGICt6BP5H+YJbulR5RVRuPBbBZ8sZ2qWgW261iW1UKzKGOYe8KkMvaGqUmrwbBMPZecFQQ58uc18Y9BV5VJarp4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309688; c=relaxed/simple;
	bh=5IfQLskS0Jn3UK0ZpUTxI4rJLSCAb3mbM5urHpKXMO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aC2nO0Dn/qQ8CgpwUAzmxOZgJPilbpLC3l68JrVTIa1O91NQgItPXkoyXiTJlMbw5DotSPN4MpqHVNlt8XewteVVQzBngiWT5sWAyhPDAFTY4i5zWCKzyPjuEkYaobw1+Nuzhx6QVoiGz1r2p5OuhXFBlDRWx8wdhGDzeSCApyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNtdTFwv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH6DZN015991
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CAwCyznw1ti
	fR2eCEf/ZZcHhw4uQ6oQLdlE71ilLV/s=; b=jNtdTFwvSCuFuLsavNub4yYP4Eg
	vlfXZwzqkH7owc/Wbf1QxibhWvoB5vYM8/UNkw4qef1DtED7Bz67CQ9krmX2vRMS
	xE7KLy0qdIwkzZG/De/8xVHuylIeElptkIZzFeujpyiohVrrGj3eZI6xVl7HHhCp
	5AwYuqbLvmWHmWHQkA8OYlVW+pq9Tnw8J51+TNuQU/UKpXypjkqx+XwZU/2m9l+a
	mEHwIHpn/xnJj7hR7r4rm/7t1TBMwXuw0j0oNXwLSGvHS2AOSygaB/dQtQOj8jeR
	y70ZHjdSg//o4+hmUdBppxU6QivAGO6b1qd24JC/O2OuGgavKzeRE2SQy2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vd226-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e350915d2aso132158685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309685; x=1753914485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAwCyznw1tifR2eCEf/ZZcHhw4uQ6oQLdlE71ilLV/s=;
        b=KrmtcCfv7lXeutWFFXf/d+SMyJaYP9Ard2hpUHqwyizeUQcyn+8EvgyY5eu1dsp5EJ
         G5L7UCG1sUAdIyawpyii0jHzKC0AXpRSPkuLfAvDPLjAV50qjQxDj0dfy9gKcnyLFSul
         BtrlfbLrQHQ9JPixIJhnsWmIgcm5qb4+LYMBPF/RttR5Z04q3+3nk3T1DNP5JlTwXhGt
         BSVjBt96TpXiXmCpGGvFBLY/eCizHGux+9fvx5b1aQfOEX07iR9bgVhPQFpIoqHYjMig
         +SN9smNCjMn1DAkYxemIRKQQhRSwCa5dvt+IonEE+hSlGi/s//Wd3Pq2fB5vQo2sAuv5
         Ulpw==
X-Forwarded-Encrypted: i=1; AJvYcCWya9e7hRHgPBsU4ZYlQe40dczYmY1j+emF8ltDWP1aOHyn7WudRUaTnkZm7xw/n03ErNln6QSCcRIrLcM1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywon3og12kmCDZkKdp+64eXpjaOIEDFgxfcxmTYvZBHtqvSo7/e
	STe0JzJl+gOsmcWR34RyDfTs8l1p6HYBrc3qgObCjvqMscmf1h2j1Oi9d7dKBYrTopJQFYlf57G
	NrK0Jx1aMsbdZcicEs4sOBo862uIlAaMnIJp0hF7iQbVk8ZbFfDF4KF/imSJ0HWkSsbZO
X-Gm-Gg: ASbGnctW109WoeDhUxYYTlHcA2RLFsKXCxEQfX/Nl9OK45PxklRNykj9O7qSv0RmLDw
	ApgMgA/JG84z5PUed1MEP2oJsJKr46VJFccZTs0K/weCKv/OzTKBYwsB5AtkgV+kHHLsTKXFfAW
	+ptZ22NSrPiIKbSTDK7cyQZB+6Ve0mBFNLhq20DVge2AuMDFbeqyQCMd4VgFL0hOl818oNLu1Xb
	03N1oIcSTXCotKprEAeliqFr3FQuZ/ZhDw9QFKVuPfglTSCRtmdpSxPjZ26Si+s9J79pgOLepwr
	wE6qtdjt8/c97boi7D4vARxCGaNV0ZqCcTR+CnmOB+SI4n3XbyyjIQ==
X-Received: by 2002:a05:620a:890:b0:7e2:fbf7:f2c8 with SMTP id af79cd13be357-7e62a1944cfmr440007985a.52.1753309684609;
        Wed, 23 Jul 2025 15:28:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9cFbe0eoXQC1HtpgCNLwKH7Z8oI9GtOC99caV95IrxYZN7SWj5L1yj2jt7U2yiVdCHkFJOw==
X-Received: by 2002:a05:620a:890:b0:7e2:fbf7:f2c8 with SMTP id af79cd13be357-7e62a1944cfmr439999785a.52.1753309682774;
        Wed, 23 Jul 2025 15:28:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:02 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 10/23] arm64: dts: qcom: sdm845: use dedicated elite-audio dtsi
Date: Wed, 23 Jul 2025 23:27:24 +0100
Message-ID: <20250723222737.35561-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: atsGEZRy4aiIakynJfcXLJJUGNt9L2Yq
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688161f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZxF_z8GhOwlPRV4PUNAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX6drVF9xfJHT7
 dpwdcAbzzuDnnypYIzHAKgcXgk7GsmYaL5JBWnJbvGSuP81mYBVhDwVkk4GER17+/X+RJN7Jl3g
 Ly6TitgwziaGrzCfrMaZs63a8v8YsvQwufDLpHOQpFsGTW/TUBY4VbpSPV7aiz6GJMJBogVuJGj
 cdiJIvHp/43HWD1VJAbgkv4htpbKAeUq25e03+hekHy0+F8IKSVTb8En9PFG7Qqv/hZqU4+UH6d
 etfzei1n3dgVXwI4t/0CJ0CwEh9OlbA6SRjAk6YVEa5OBHxVwylOT0G4pVFL6DXhJLHx7EoVbeu
 j7aOwYxitMapDvaM/iU8QExx2OAS4zRyqnaqB8xOpCQFMYC0rKwq9RFtZNxK1Xei2WQ/wr0EbCS
 iaCvVRPE5u8KZGPk862dGfNWsSdLMtQTt5k/fEjRLFNcJpCbCyoO3aB/bhe33XX6cZFXOJjC
X-Proofpoint-ORIG-GUID: atsGEZRy4aiIakynJfcXLJJUGNt9L2Yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=984
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-audio.dtsi    |  8 +++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  1 +
 .../arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  1 +
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  1 +
 .../dts/qcom/sdm845-samsung-starqltechn.dts   |  1 +
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    |  1 +
 .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |  1 +
 .../qcom/sdm845-xiaomi-beryllium-common.dtsi  |  1 +
 .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 49 +------------------
 arch/arm64/boot/dts/qcom/sdm850.dtsi          |  1 +
 13 files changed, 20 insertions(+), 48 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sdm845-audio.dtsi b/arch/arm64/boot/dts/qcom/sdm845-audio.dtsi
new file mode 100644
index 000000000000..112da7e4e04a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-audio.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
+&q6asmdai{
+	iommus = <&apps_smmu 0x1821 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index b7e514f81f92..4214210d38d6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 
 /* PMICs depend on spmi_bus label and so must come after SoC */
 #include "pm8005.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index b5c63fa0365d..20dae8a0d0ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 99dafc6716e7..36bcaaa0f5b0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index a98756e8b965..0a06f1a45978 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index b118d666e535..88729fa88f8a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/sound/qcom,q6asm.h>
 
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d686531bf4ea..160066c89fce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -16,6 +16,7 @@
 #include <dt-bindings/sound/qcom,wcd934x.h>
 
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "pm8998.dtsi"
 #include "sdm845-wcd9340.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 2cf7b5e1243c..824947d8f2e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index a3a304e1ac87..20ef0f1e18b5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "pm8005.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 7810b0ce7591..b27d6ded9d35 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 63cf879a7a29..c7d3e68cae39 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -13,6 +13,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 #include "sdm845-wcd9340.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 828b55cb6baf..42638f47e9a1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -25,7 +25,6 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
-#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -928,54 +927,8 @@ glink-edge {
 			qcom,remote-pid = <2>;
 			mboxes = <&apss_shared 8>;
 
-			apr {
-				compatible = "qcom,apr-v2";
+			apr: apr {
 				qcom,glink-channels = "apr_audio_svc";
-				qcom,domain = <APR_DOMAIN_ADSP>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-				qcom,intents = <512 20>;
-
-				service@3 {
-					reg = <APR_SVC_ADSP_CORE>;
-					compatible = "qcom,q6core";
-					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-				};
-
-				q6afe: service@4 {
-					compatible = "qcom,q6afe";
-					reg = <APR_SVC_AFE>;
-					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-					q6afedai: dais {
-						compatible = "qcom,q6afe-dais";
-						#address-cells = <1>;
-						#size-cells = <0>;
-						#sound-dai-cells = <1>;
-					};
-				};
-
-				q6asm: service@7 {
-					compatible = "qcom,q6asm";
-					reg = <APR_SVC_ASM>;
-					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-					q6asmdai: dais {
-						compatible = "qcom,q6asm-dais";
-						#address-cells = <1>;
-						#size-cells = <0>;
-						#sound-dai-cells = <1>;
-						iommus = <&apps_smmu 0x1821 0x0>;
-					};
-				};
-
-				q6adm: service@8 {
-					compatible = "qcom,q6adm";
-					reg = <APR_SVC_ADM>;
-					qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-					q6routing: routing {
-						compatible = "qcom,q6adm-routing";
-						#sound-dai-cells = <0>;
-					};
-				};
 			};
 
 			fastrpc {
diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
index da9f6fbe32f6..65fbcc644de6 100644
--- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include "sdm845.dtsi"
+#include "sdm845-audio.dtsi"
 
 &cpu4_opp_table {
 	cpu4_opp33: opp-2841600000 {
-- 
2.50.0


