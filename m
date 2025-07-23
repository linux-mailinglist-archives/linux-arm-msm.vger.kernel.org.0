Return-Path: <linux-arm-msm+bounces-66371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E199AB0FCBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1E93AC9F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CCC272E7B;
	Wed, 23 Jul 2025 22:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AT1EWGbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF42586C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309675; cv=none; b=cmm0zLbzPQZwsIxAKF/E1tuB/CO0IaRKe4LESsg/dvCIXYD5Ecx6Yz3iPkCb4r2TV2iWJSzfwoAD/ww+vrlOq74HnfDwgkFhXaUfPfRUaGmu7M32Xi//ZweXzoigtlRM0Mvi9Vrc4CKc7nKCwm8ZPZ9+qfyGN9prqHTlyqlUFvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309675; c=relaxed/simple;
	bh=9f0MWQGMt3kWf5M6K6kO0Cc5wE9p0DRpP3bTC8UxFa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hi/c9+msBDAHyvXb5XoZ2SLI5GN/XAZ3qdJXFxDhScP4vyu/a8SlFx5QBJITeoLx5o0zAUvTtmdUmM/RFfIFN2HnGQce63HkLWj/iS4nivEPFL12Xe0pcg6kCza8JOaNE/9OBMHGBC4ZHnbrwK/jhr3skTM+nidTMAgifyGyRQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AT1EWGbw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHIxNi014861
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lv1gwH4qM/M
	xiyZvly5IYByAhPppt71Gyj/KfZY9Y6w=; b=AT1EWGbwmHUZe82eIpcGumIowaO
	5WUQRfMUyT9qI9KY1UMDzUAUb+b9DVUmG4tSLQ1tvG2BwCy5JxCZHpOtFw9PBsyv
	CCPn9ONlbHapU8Y1jG68afIACvNFAaGM5mb4YiwEj9WWC3g0Zu20O8WcInESEXSA
	D+axwAmhEj873DQh4rWlBHXq294wU2wdr9xt+xzwHC1KVe/YBoCGQQXhn+qa1tJ6
	MoN2bc1FPFsm9RuELVYRNV0CUBBqUwGptQBmy1FZt6R1ExvVvsEGhidbXwjP8Y7y
	mzIkjNezWcRHMf2o4e+uWBKccv6OAZ3N/CnNGAHxuyCVjQyPCI20vpxFY7A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vd214-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:27:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7048088a6fdso6122396d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309671; x=1753914471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lv1gwH4qM/MxiyZvly5IYByAhPppt71Gyj/KfZY9Y6w=;
        b=aMhTrsMsFCJXXGrV0Mk0D728mqkFAjQgODSIQ5iWwYV/LaJcLJKey6UpeXTswpwY/L
         ruRBLw0MNnrzVOMY7ulScd5wstu1C0gEsbnmo1dkwdfTqOBeDhZ/4T+KgxOedtaePsKH
         YwcdKrSC5/uJZk0ycgskP3EyWq4GPQQ6LvKz6n3CLEi+n3JdG3D++1HFr1kWjghfSOnw
         fweWxXPUwXwievq/N+9hq6jMyKm5Hsp/0DvD+NyWp3o2iz/I0kX9oEmvb1VyoVEMc3k4
         iLFYLEFMn41xIkD+ObW+4ErHfKiNQfsrKGNTkTBOImSrVzLLUuFE1fRB90rEcbMvSJzF
         654A==
X-Forwarded-Encrypted: i=1; AJvYcCXFTSK7PIj0IIPv0NXFQPyW8XokP1PaT4v+gt/IZvvrIAAvbMzxhudEU0VZTle8xOw57IoDiJz+ml90bB31@vger.kernel.org
X-Gm-Message-State: AOJu0YwMCt477ctYjFCumHSw5HYhGIpFfuPtx9elDmfMpQVYNRp/Y7t3
	G9QYzdrTuU87BBd1UIkfNMNgpfSvlcjdgYZiyx6mUbS/xDnx4yw8p+Twh6NWjRgDpXfTUAJgo/q
	PhCyL22cRqEwnTYnVRmGfScjfcmrHQSVT1GqhfzkqtSxgbNr+SZuePdgR8SlAm+KNwDpz7a+iHl
	T+
X-Gm-Gg: ASbGncs9dnSLBPHj+xWhk5cELsMnFuIXT9kjfL3FCqMTlSfs6nWmRgvaUh+L1Bf53Hn
	1+1nP6d/dZWeZ+T9+VaHj9t8hhgXPdQ8W3l9LRz2bnX93R8VoqvEjEtTNU2o4ICjPtvQyDR8QKD
	HvR/ZIkuBnTj0r2lzmAYHEB4bUKaU6TCNZigFS0AqNq7BKKJ94v44i3IJM98k6PfJDQCiBQU8mi
	09ElYDH9fWeg+W7BVzqhAp+M8VKCoefsYPMHPN4YjF7wsxcLX9al3Buq3xShP5nYcS9tsmhd4eS
	20Da39iYsDcCdPXvwANTY3Ouet777LrN7/0ymaUoPabzI9DtAo8rKQ==
X-Received: by 2002:a05:6214:27c7:b0:704:f952:3d66 with SMTP id 6a1803df08f44-707006a3e74mr56005446d6.47.1753309671041;
        Wed, 23 Jul 2025 15:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk6k7H/DKZ6RoAa/iFffbLEugNjCZjM21SKc3RSw1fAYe9HXKUtDzJ+0og7urmcPaOs6vudg==
X-Received: by 2002:a05:6214:27c7:b0:704:f952:3d66 with SMTP id 6a1803df08f44-707006a3e74mr56005156d6.47.1753309670593;
        Wed, 23 Jul 2025 15:27:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:27:49 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 01/23] arm64: dts: qcom: x1e80100: move dsp audio nodes to dedicated dts
Date: Wed, 23 Jul 2025 23:27:15 +0100
Message-ID: <20250723222737.35561-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: wRwOL8O67bcWPV05a_AgyhEdh3JSd73h
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688161e8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ETe8z7BbGz-F56Y7HIQA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX8f4FscodTi2K
 eKfHvefLnLZJFzcSDUul1fVFsX3ExElSoojs15tTnZ3xpPb1tOgGILRRvA7xLB7GcRovzjVFpN3
 luBAuC3p5OCKtT2uXz6Ljg4wDEQv1zRVl4qcScW6T16eEoyqhXEGPZbbHrEEJSYW7gpWcnuCn1V
 yPf2F2bfT8N3jzUw1yaGGixIWzC/yL3YxKsBoRy0Aq5/5YzQLwmksGAuOraVfho6e+5F6faq/YR
 gCfk5o/iOmMSomvgWtLRdGtwQW0tTPjJE0X26xgvdtBh4cGPd8OA5q/9jc43sILMpyw8K/+MAr1
 JKqRyA2S9NHXuGwGJ3H2u8Qe6PewNG4W+RbQBh738+FRly2wnKBof88MxW4crDIaqAmOlzWcgEx
 66kuiBgdNItxXc9VPosUjqdqVZy5nGtRGKY7MJxjFiFbW6uYcJlhV2uwIfeKznAKOPpCq8GR
X-Proofpoint-ORIG-GUID: wRwOL8O67bcWPV05a_AgyhEdh3JSd73h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

All the device tree nodes for audioreach dsp are duplicated across all
the SoC dtsi files, Move this to a dedicated dtsi file so to remove some
duplication, make it consistent across all device trees and also make it
easy for new SoC's to add audio support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/audioreach-audio.dtsi | 45 +++++++++++++++++++
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  1 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  1 +
 .../dts/qcom/x1e80100-asus-vivobook-s15.dts   |  1 +
 arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi  |  6 +++
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  1 +
 .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  1 +
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  1 +
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 43 ++----------------
 13 files changed, 64 insertions(+), 40 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/audioreach-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/audioreach-audio.dtsi b/arch/arm64/boot/dts/qcom/audioreach-audio.dtsi
new file mode 100644
index 000000000000..fce722579155
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/audioreach-audio.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&gpr {
+	compatible = "qcom,gpr";
+	qcom,glink-channels = "adsp_apps";
+	qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+	qcom,intents = <512 20>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	q6apm: service@1 {
+		compatible = "qcom,q6apm";
+		reg = <GPR_APM_MODULE_IID>;
+		#sound-dai-cells = <0>;
+		qcom,protection-domain = "avs/audio",
+					 "msm/adsp/audio_pd";
+
+		q6apmbedai: bedais {
+			compatible = "qcom,q6apm-lpass-dais";
+			#sound-dai-cells = <1>;
+		};
+
+		q6apmdai: dais {
+			compatible = "qcom,q6apm-dais";
+		};
+	};
+
+	q6prm: service@2 {
+		compatible = "qcom,q6prm";
+		reg = <GPR_PRM_MODULE_IID>;
+		qcom,protection-domain = "avs/audio",
+					 "msm/adsp/audio_pd";
+
+		q6prmcc: clock-controller {
+			compatible = "qcom,q6prm-lpass-clocks";
+			#clock-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index c771fd1d8029..1d8a75fba301 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
+#include "x1e80100-audio.dtsi"
 #include "x1e80100-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c9f0d5052670..19b993fdd17f 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
+#include "x1e80100-audio.dtsi"
 #include "x1e80100-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 2d9627e6c798..6df3ee553bc7 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -10,6 +10,7 @@
 
 #include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
+#include "x1e80100-audio.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. X1E001DE Snapdragon Devkit for Windows";
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da3..cf2cf3e520fa 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
+#include "x1e80100-audio.dtsi"
 #include "x1e80100-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 71b2cc6c392f..82b08350da17 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -13,6 +13,7 @@
 
 #include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
+#include "x1e80100-audio.dtsi"
 
 / {
 	model = "ASUS Vivobook S 15";
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
new file mode 100644
index 000000000000..e03441bb2a79
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
@@ -0,0 +1,6 @@
+#include "audioreach-audio.dtsi"
+
+&q6apmdai{
+	iommus = <&apps_smmu 0x1001 0x80>,
+		 <&apps_smmu 0x1061 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index fd00d1bf12e1..fb98fdc53594 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -14,6 +14,7 @@
 
 #include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
+#include "x1e80100-audio.dtsi"
 
 / {
 	model = "Dell XPS 13 9345";
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 8d2a9b7f4730..8206b6f2cf30 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -14,6 +14,7 @@
 
 #include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
+#include "x1e80100-audio.dtsi"
 
 / {
 	model = "HP Omnibook X 14";
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index d02f8d4f7baf..aed5554c6646 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -11,6 +11,7 @@
 
 #include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
+#include "x1e80100-audio.dtsi"
 
 / {
 	model = "Lenovo Yoga Slim 7x";
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 0fd8516580b2..669b95dc1666 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -11,6 +11,7 @@
 
 #include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
+#include "x1e80100-audio.dtsi"
 
 / {
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 4dfba835af6a..9e464d001343 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -10,6 +10,7 @@
 
 #include "x1e80100.dtsi"
 #include "x1e80100-pmics.dtsi"
+#include "x1e80100-audio.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 QCP";
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5e9a8fa3cf96..f3216a84137e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -17,7 +17,6 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
-#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -4041,6 +4040,9 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				gpr: gpr {
+				};
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
@@ -4090,45 +4092,6 @@ compute-cb@7 {
 					};
 				};
 
-				gpr {
-					compatible = "qcom,gpr";
-					qcom,glink-channels = "adsp_apps";
-					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
-					qcom,intents = <512 20>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					q6apm: service@1 {
-						compatible = "qcom,q6apm";
-						reg = <GPR_APM_MODULE_IID>;
-						#sound-dai-cells = <0>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6apmbedai: bedais {
-							compatible = "qcom,q6apm-lpass-dais";
-							#sound-dai-cells = <1>;
-						};
-
-						q6apmdai: dais {
-							compatible = "qcom,q6apm-dais";
-							iommus = <&apps_smmu 0x1001 0x80>,
-								 <&apps_smmu 0x1061 0x0>;
-						};
-					};
-
-					q6prm: service@2 {
-						compatible = "qcom,q6prm";
-						reg = <GPR_PRM_MODULE_IID>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-
-						q6prmcc: clock-controller {
-							compatible = "qcom,q6prm-lpass-clocks";
-							#clock-cells = <2>;
-						};
-					};
-				};
 			};
 		};
 
-- 
2.50.0


