Return-Path: <linux-arm-msm+bounces-66382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB3B0FCD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96AA118980A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEE7274FE8;
	Wed, 23 Jul 2025 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAmR7TyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AC7275105
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309689; cv=none; b=n9X3sf22FyL/pGWWeHkGsV8HCnswd8vJxEkkPfOE9aghi4U2F3cYqRXQfuBuKZ/EzBPvC2aQkipc4cyYTD36hJaiFtkbGrjaNOp5C3oRCqveQ9A/u1glcQilgMu1VvhNWlQQyLVAENlb4oObZGrVoMogOlKcGeUxW2r7+YD3XHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309689; c=relaxed/simple;
	bh=XKUT827Diya9gsdp4NNt9fGXSOQCjAATOLC9Fo6qTZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0t0EnNO8VGX3BpPuXKesQDNcr8N+h7h7VgBwAQysEw1Ry0sp2KXfTHNkR8PbXrzTglJueR7f3peTueqCOqRBHtauOyVUv6MkeSrD+GCqKPPergNybyEUxDF7vCLq34yq8eQvcaBHoZv2B4Qm0zcIR0O8MPgM3X+BsmNyOUY4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAmR7TyI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHqime013172
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CXn962hWIOP
	OoeJqFuEfdqIL0LSAbPGmMjDTrF+m+FI=; b=UAmR7TyI0vIwh+trJlgInwO5DhX
	8ix+eY+usqjaC737KLEPgiSbBYBXdrBe6VnEYZlhv2V84jcYDuS5SOHQvme+frUK
	Cxa3lBbuAEHsCskSyEt9kCXInei4nHJ8yEdV0EMTf5mhXu1C0is7FjZrutBpdDGq
	Kgx1Ca5fchkkLjbCQuH4QtBg/3Z6+uxjLm0upBRErQYQ62GqKmxzOI6AC8ObZAqd
	xoTwEHiMogqo0oaj/V/OmC3vrDaJXfjv3urRhCV0oJHcVlgWaED+tOzNKFzFXy08
	E+UbifJsQfcc6TtBUA8xo51pXn2Eplyks7QiijjgI/UdhMfOElg2MXUd4iw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hvq73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e32df3ace0so32011585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309685; x=1753914485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXn962hWIOPOoeJqFuEfdqIL0LSAbPGmMjDTrF+m+FI=;
        b=cqqAgpmjsf8mb2/TDadzgYZftECAfKifqRxloK5Yhlwha/F1U4DUOAsDBKKk12/rzw
         Bz49MBWOahz6BuRTJVanct9lPJezLokiPnoXQEdmE3TJZ2FMr6zw3RRvsH8sAW0rInps
         BpJG09Ben87wiYRYqvA8TJxFWt3Kpl3vmt3NxGU7n5viwQcklDFXkoiloJ3y9iq6RXGT
         4L8Jf0mbVv8Zs0+nUkzUFjqtRBjH4qaw0bNL8EEJUEVYAmz1vMHtLz54LZQ7U0zXDn9L
         aykZKVKlOlHbXHFMrYYvpHuc1Tdo7/V7u2cgSUPsLu/6AIG/dBujb6Uq3F8vqdrVxdDS
         +LHw==
X-Forwarded-Encrypted: i=1; AJvYcCUukmStBizgxP1fkQH7+Uy8yPmNIGC3Cy1oJ4pxxPZHg4wUmzbiFv8wAtzoeutkUCtwCvSjMGBd+YECmC/I@vger.kernel.org
X-Gm-Message-State: AOJu0YzNj9SCdKRtKNihcFMYDNOdL82vGCZzSUHefRaeD8wwhcLLX9tK
	TUkhhyzUwUTGDgzLAgtHl2JgQ5vE6WuoQFBmQMEMqTQA8cPCfTd85SSvQe20ti90y81rQc/4Y0s
	aXWxiijeI/q1oPdkfFmqMvCuOzGz3u2OXzXErv3t8nKHR2KMYTLeKZ5KOhQNXiYy48e7s
X-Gm-Gg: ASbGncsgOE+6xdNRl3yGIA1U0FsIhR1KVekINuwhdPn/nZp5Vcen/5QCpwPqbmu9L5S
	+IYvS1t0IlE5VewS910BKTLpfgXvs4vsWjjpIfrXFN4DExvN519A01v/gG8SI9kuosNsf+hS7XU
	FIxW2U0wl38+QoPMKdf8vwgoc8vuzSu+p+gxqo5Yy94ZBQ3N9yV01kf3YFJpRrApPcfOD28q0Nw
	C+hRTHGINpJNLpo0jROR8eAWmZs7gqSXXqiyOCcMFfn81E258t+iYu6jy9NAcI5rFBFZrSysRFm
	JbARfvOAV8Sm0e4c0RqfNniYeOoovxS1NU+AeI0vjM/6XVSQzWCtTw==
X-Received: by 2002:a05:620a:a801:b0:7c5:a463:397b with SMTP id af79cd13be357-7e62a0bae6fmr556282785a.20.1753309685251;
        Wed, 23 Jul 2025 15:28:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBaYYgjplFfHrigZf+gmGdcu9OSOBsDXBghP3CWb5gaq5AFlONgypaFZYC7TwPZRdruuNSEA==
X-Received: by 2002:a05:620a:a801:b0:7c5:a463:397b with SMTP id af79cd13be357-7e62a0bae6fmr556280285a.20.1753309684769;
        Wed, 23 Jul 2025 15:28:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:04 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 12/23] arm64: dts: qcom: sc7280: use dedicated elite-audio dtsi
Date: Wed, 23 Jul 2025 23:27:26 +0100
Message-ID: <20250723222737.35561-13-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=688161f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZVUBih3ntuRNDiIcMoMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfXxKrufselpRYs
 hdq/vdHo7qT6jaFKxgZEdlh47RDriOMQIzSfrKkndH5KwnZQ8r5H0e4koDEuowAhDYaTbDICgRH
 iyDJGeREkuwF2GL7NesM+d3clsLfru2RM68PveapXVOMZzaD6IaCMZIGRiFpRhaJknl30yZpuk4
 73stfsxWuXR/imc89WxuD7o82RWLMH9mgqldGFiaTCLL/5rcLfAjRpXp9epuAmcNS8WdSpFkHKq
 otqahLm3shzJ95UNOHAfAPvQHM4tQlFifuo+T4p27vq6rUFVy5Ol0VCoxRE95AbBdiIcmU3jBnz
 gzBYkREu96EK/cyDUVauOMQAjr8Lj6hd5JaUuyYC1tJLfU/LEBHJ3cb1XFknfzIpvvrgePab6N+
 UbNowORVgFMo3DD+TvPxLvh8bc/tpDJXeBi7xqzTjgf/KZAlypdTS04GmYY3LFTm7bC58693
X-Proofpoint-GUID: 2bELS49Zw_CF4gW3q-CNYzIbUrFqtyZJ
X-Proofpoint-ORIG-GUID: 2bELS49Zw_CF4gW3q-CNYzIbUrFqtyZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      |  1 +
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  1 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  1 +
 arch/arm64/boot/dts/qcom/sc7280-audio.dtsi    |  8 +++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |  1 +
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    |  1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 68 +------------------
 arch/arm64/boot/dts/qcom/sm7325.dtsi          |  1 +
 9 files changed, 16 insertions(+), 67 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b29..ce578c1fe3d7 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -17,6 +17,7 @@
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sc7280.dtsi"
+#include "sc7280-audio.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi" /* PM7350C */
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 7a155ef6492e..6932ca1c831d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -14,6 +14,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sc7280.dtsi"
+#include "sc7280-audio.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index b9a0f7ac4d9c..92a0bf46cc5f 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -15,6 +15,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sc7280.dtsi"
+#include "sc7280-audio.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi" /* PM7350C */
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d..8b4717ba0be5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -15,6 +15,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sc7280.dtsi"
+#include "sc7280-audio.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sc7280-audio.dtsi b/arch/arm64/boot/dts/qcom/sc7280-audio.dtsi
new file mode 100644
index 000000000000..4ff49550460a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-audio.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
+&q6asmdai{
+	iommus = <&apps_smmu 0x1801 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 90e5b9ab5b84..ac39fd8fec87 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include "sc7280.dtsi"
+#include "sc7280-audio.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index 7d1d5bbbbbd9..c9618ae5b219 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc7280.dtsi"
+#include "sc7280-audio.dtsi"
 
 /* PMICs depend on spmi_bus label and so must come after SoC */
 #include "pm7325.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd30100..428832e918e6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -25,7 +25,6 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
-#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -3833,73 +3832,8 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
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
diff --git a/arch/arm64/boot/dts/qcom/sm7325.dtsi b/arch/arm64/boot/dts/qcom/sm7325.dtsi
index 85d34b53e5e9..b4226183cb44 100644
--- a/arch/arm64/boot/dts/qcom/sm7325.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include "sc7280.dtsi"
+#include "sc7280-audio.dtsi"
 
 /* SM7325 uses Kryo 670 */
 &cpu0 { compatible = "qcom,kryo670"; };
-- 
2.50.0


