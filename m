Return-Path: <linux-arm-msm+bounces-66377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFECB0FCC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 672563BB10E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840AA274B4A;
	Wed, 23 Jul 2025 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4FtGK50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3B2749D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309684; cv=none; b=FZ9tiIUo2y5su6P/GBqKc8xPsVj6jinSKuxL6ZbzmuS6CRWQEKxB3x3eNMXNHIqlJNM963Dn+i3BRPycVlyQU7g8yGqtbxIUgPYL2RqQGZ5xKvTf9bKuHOeKlBnXbbyHbt6ihZSkmCUCPGFCl2dwlx8eXLj92P6Z0YOILGaGGDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309684; c=relaxed/simple;
	bh=sR6kzyTuhf6EhARguJqQOQtx9SaauGhKilYXdE8JJmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6TENYy+FVHRLyoA9PrF9l58A8S+5ETniBuT0C/NlOpuIvJL0rkaAyU5I2FF3zFiJDf2+dKHVurMlTeiroAXAlV7J4kUzPlyejLplCq/frXwOEQTvTqeXFDnRTpQwHkChmjGlYY9vh9G6jYw7yoWuMEP3WdNZwWbnonkHEKvu8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4FtGK50; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNfxf019551
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zXHl0/i2Sl3
	JzwrP0dNf7zMcC90T7Kt5lE3HmQz9cMY=; b=R4FtGK50Y24Sl7FbRI1PAjtK16b
	GTYxdaXe5uP9UM2cbs6+XtzYYCpXw9WkFJy8NQKpafuKWKnp1cCnEK12H3IdORty
	tBOwe7z8e2088KP2k0nuWrBlNYqNAAacSqfGHNqslc437s83md0zPJ64I7HcG5nw
	isCqBU2Av61ExoqpvKT8Zhna11Tk45bf8WJjtZQqasXrZjGyFvtKeMQM71FPDuY3
	1oInnzLKMI/sTR+Cxom5ZDL00E+GwznVjTSL5BO/rrdfhMHAyJts2H8uXPDfudTd
	pRFCw2jXTofNopW5KyoN3XWZks4c12rBEpw0w0a5G/hUW6P8Z6MNHNuhCnw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379ru4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-706f10c50ddso6214196d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309680; x=1753914480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXHl0/i2Sl3JzwrP0dNf7zMcC90T7Kt5lE3HmQz9cMY=;
        b=NBx9S5qDsDO8efkW2fDzSGg8kIanXG14NG6+CxzACjQZIYHe7XCHszfzehPLyW1aAg
         hAXhgdVdzakPaCseBf2E8kOX0y5vc+kbhVwALMythYJCeV3xj8N61XWVc4SGqPHQo2up
         Y+bqj8apI7OlTSNn9cYkPe39Dco+eoJidbV8/S6tIOQEnHG9hbcBivYjjrQEQQrB3Y8x
         nYLGrUM0ihfy9H6Tax0UFhdY7bgdpnP2NU/H46l8IHE2UPjrfzwqrBysBsvtoTzh72dy
         7PVE8p4gs225ffZqNqovRTXy00HuIDMsdu/cNq8sPeIKYeYSy/UAgeA4EXMuReAByaN/
         UQug==
X-Forwarded-Encrypted: i=1; AJvYcCWcFRJK5gKvTYpX71xPoeCPcjQFSA8X8wNnSTajdjmplHYsJuyCc4qKZjArFddP0nf5q6OL4L/2G/p0DceK@vger.kernel.org
X-Gm-Message-State: AOJu0YxX7mQD3ODSHs0SS9LiSQXvAQUlftRuY7OhBOI/Q7C4AP2wTf2P
	BDBuBoGQTcZac4TaUsMzumwWzdurcKnYh5zAzrUgwdU/zH+hoNJ9wNYZn6IWPFDunxyPzqZrNxA
	yCFIwYTWiN4xKYsXe2lb/+XQnofTes3URnAcpb9h+a4giq7e6pMymBgWQipYixJIkOkzA
X-Gm-Gg: ASbGncuXYpuCjMPWkEld7K7hSCVOOSURn7kJYJlrPZMBZ6SF8LpnQM0TNSdTkaygqQI
	r6SiImW2Z0gDy9XmgVnUNcHujnoQvAf6pXAkVkeeP2ApPbUxp5ckZ9WpR0ocQd5Oh2Q+pauYPKv
	4dj+L6ey5v1AFXWBL0DcGsydU4i6H6WmsjjVxfa7mpoJ8IQThM4SE6oKM2BwvVXkB5gT57CfZ2X
	eGxALMjQXuC48uuleLfNQ3Y/3NHPEHOwDWLSZ2H6aIPfyaGKq/gNj7cGWH5f/ioIiYj0Nko9Pph
	4PYHufBTK3jE4LwU2FsG46QEO/+AsP27TJ5iivXqnshx1FJ/A2fXrw==
X-Received: by 2002:ad4:5bc8:0:b0:703:54d0:73a0 with SMTP id 6a1803df08f44-707006f05ecmr50973366d6.32.1753309680208;
        Wed, 23 Jul 2025 15:28:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEJKMu1xZLMi299MwK611bs98B1sjWGgQgSFldhjc3zqu9xWvXZlS2op+z5fjK7k7q6/9vvw==
X-Received: by 2002:ad4:5bc8:0:b0:703:54d0:73a0 with SMTP id 6a1803df08f44-707006f05ecmr50973216d6.32.1753309679753;
        Wed, 23 Jul 2025 15:27:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:27:58 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 07/23] arm64: dts: qcom: sm8350: move dsp audio nodes to dedicated dts
Date: Wed, 23 Jul 2025 23:27:21 +0100
Message-ID: <20250723222737.35561-8-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: gXkH2cSv1FH-J5r2nHX1nND8xbO-onGj
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688161f1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=sC-n5_SLUXhAJjBL1AgA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MiBTYWx0ZWRfX8k1urUC62dRj
 NrR0cJTYtloRwbr44RoqPOmhSxMO7Ye2lFHCT7iJs7cd7XW+wdnqRd32sQnbzwu3FgXjj2e/ng/
 GcXYE3FhQ3j09tnsn+yAweSrg3yuYQr+/PuXQiyIX11KjZtvathnN4aRS8WgCGylQ8XS4LJ2lB8
 FuNhF6c3YKWcyHHn2wKyd81dIJKgGGfqrGViIGMBEeKUN3fXSAAmZdCNYhwgokOyM/B/+Cc/8VD
 EUdWBzB0/3HcuyHUAk1ud7yQwFv8qkyWvPBilkyRv6d4YxOMmlPXR4X6FYb8FWoMutQw/PWT1Ub
 Xy/AJ5P34Sr5MXVDx1wGzWn0DEOTxE5E6g5Q5BN+2G4JLrVIt4yve57JHDU3BpP2oIgDdxYbju+
 4fVkettnyi/H/BWHVlWmK7YDxoDVOOgHllN0nmdcMjmN537ErAei8lqAVsP/HMs9d+M9vI26
X-Proofpoint-ORIG-GUID: gXkH2cSv1FH-J5r2nHX1nND8xbO-onGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=996 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230192

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All the device tree nodes for elite dsp are duplicated across all
the SoC dtsi files, Move this to a dedicated dtsi file so to remove some
duplication, make it consistent across all device trees and also make it
easy for new SoC's to add audio support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/elite-audio.dtsi     | 86 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350-audio.dtsi    |  8 ++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |  1 +
 .../qcom/sm8350-microsoft-surface-duo2.dts    |  1 +
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts       |  1 +
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |  1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 67 +--------------
 7 files changed, 99 insertions(+), 66 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/elite-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8350-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/elite-audio.dtsi b/arch/arm64/boot/dts/qcom/elite-audio.dtsi
new file mode 100644
index 000000000000..924ec9cc1d85
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/elite-audio.dtsi
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&apr {
+	compatible = "qcom,apr-v2";
+	qcom,domain = <APR_DOMAIN_ADSP>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	q6core: service@3 {
+		compatible = "qcom,q6core";
+		reg = <APR_SVC_ADSP_CORE>;
+	};
+
+	q6afe: service@4 {
+		compatible = "qcom,q6afe";
+		reg = <APR_SVC_AFE>;
+		qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+		q6afedai: dais {
+			compatible = "qcom,q6afe-dais";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+		};
+
+		q6afecc: clock-controller {
+			compatible = "qcom,q6afe-clocks";
+			#clock-cells = <2>;
+		};
+
+	};
+
+	q6asm: service@7 {
+		compatible = "qcom,q6asm";
+		reg = <APR_SVC_ASM>;
+		qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+		q6asmdai: dais {
+			compatible = "qcom,q6asm-dais";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			dai@0 {
+				reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+
+			dai@1 {
+				reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+
+			dai@2 {
+				reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+
+			dai@3 {
+				reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+
+			dai@5 {
+				reg = <MSM_FRONTEND_DAI_MULTIMEDIA5>;
+			};
+
+			dai@6 {
+				reg = <MSM_FRONTEND_DAI_MULTIMEDIA6>;
+			};
+		};
+	};
+
+	q6adm: service@8 {
+		compatible = "qcom,q6adm";
+		reg = <APR_SVC_ADM>;
+		qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+		q6routing: routing {
+			compatible = "qcom,q6adm-routing";
+			#sound-dai-cells = <0>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8350-audio.dtsi b/arch/arm64/boot/dts/qcom/sm8350-audio.dtsi
new file mode 100644
index 000000000000..4ff49550460a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8350-audio.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
+&q6asmdai{
+	iommus = <&apps_smmu 0x1801 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index f9de0e49fa24..eace0ada77d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
+#include "sm8350-audio.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350b.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
index 3bd5e57cbcda..7bb41f199de0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
+#include "sm8350-audio.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350b.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 8bee57f3b25a..1b17b4287f44 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
+#include "sm8350-audio.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350b.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 7ae1eb0a7cce..43d8bbfdbbaa 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
+#include "sm8350-audio.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350b.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 9a4207ead615..9c990e12094e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1918,73 +1918,8 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
-				apr {
-					compatible = "qcom,apr-v2";
+				apr: apr {
 					qcom,glink-channels = "apr_audio_svc";
-					qcom,domain = <APR_DOMAIN_ADSP>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					service@3 {
-						reg = <APR_SVC_ADSP_CORE>;
-						compatible = "qcom,q6core";
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-					};
-
-					q6afe: service@4 {
-						compatible = "qcom,q6afe";
-						reg = <APR_SVC_AFE>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6afedai: dais {
-							compatible = "qcom,q6afe-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-						};
-
-						q6afecc: clock-controller {
-							compatible = "qcom,q6afe-clocks";
-							#clock-cells = <2>;
-						};
-					};
-
-					q6asm: service@7 {
-						compatible = "qcom,q6asm";
-						reg = <APR_SVC_ASM>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-							iommus = <&apps_smmu 0x1801 0x0>;
-
-							dai@0 {
-								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
-							};
-
-							dai@1 {
-								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
-							};
-
-							dai@2 {
-								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
-							};
-						};
-					};
-
-					q6adm: service@8 {
-						compatible = "qcom,q6adm";
-						reg = <APR_SVC_ADM>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
 
 				fastrpc {
-- 
2.50.0


