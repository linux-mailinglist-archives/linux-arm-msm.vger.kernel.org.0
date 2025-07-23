Return-Path: <linux-arm-msm+bounces-66378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A2B0FCC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C864E1AA5ED4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3960D274FCA;
	Wed, 23 Jul 2025 22:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsF8EWMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987727380A
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309685; cv=none; b=o9Mdrk8f6tFxDmpXvnSQzlT11CcCSjZSQxZZyWjDhK6sAOfOEOM4On7cBee5wUnSrryquqb7hkGvr1OZJsqHihJy1EV68l4LzkZiYy2WMSlF7rOPcHdQHnOYV+XcMW+XzX5QOPB9Bzp/ZPCejW+ofvZd9OeMVwL+EuPpfoRZqlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309685; c=relaxed/simple;
	bh=Cg83Awss9xDJ8pD6V8b280JJheNN/NsF7gBEpQIitPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cU2E0l+xnX/0VKUQiUgpqzSfoTdNeZ61w8zyaT3NmSv6QOR/fRh2vCuqZEWgF1JqM/nssLr+381qxtzc0rA2sClWY9SlUcueEsrEX/L3e79w5u4G3Lo7vj5NPgMQJCltLvimO7uhr5Orv/q/ytcCP4r/AF0BXKTpiMC0BIPYFqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsF8EWMg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNecj019543
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UVdcT72FVIp
	eN7V8jAd3K81D8qxPn0qt4t1IzEdxF/o=; b=HsF8EWMgb6+ou7u78qKCbPsQwfr
	2iMmEFET0YeLF/PwYQi/GF7BRTjQXQs0q7wjClwEh6+DVgJERa4cEbYzUf0S2U1K
	HyY1IyevmD3P95KQBbR8gjLQgOmKqa1Dwm2dfcluxxSnMcDIyG5EqHKMfcrb8vkq
	PDetoaJig8URNTSNlq6cEOuDlzbSQmrlSXOxZsUD3CgHWk/l+NSErYejYErLwcYR
	w0x/+c+H0REOBwAFhTxONxoVyhX4vFq2VcWarNHtu4wc1MM1Tmvs99p3araLl37h
	ggN7v8HkqFRpCHUCvtUDgaoqnUryh56VpWldNO5N2lAt1b2BSx7QeoJwbQg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379ru52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-704b4b61d10so8395016d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309681; x=1753914481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVdcT72FVIpeN7V8jAd3K81D8qxPn0qt4t1IzEdxF/o=;
        b=pDeceo+JwjI35nNzj5r4P8OHdxdd53UVVlRmnpeWNZzEhDhVdFvCj8mbr11VNgOa8A
         z3HxzZ3B6D69wFAgT91DVQ1xhPAOhxAxh4r9bqAoNUpM5WOZc+6KhpGCatBFxUsR2oLq
         TcBHZnXJ3bCVc+fEGxaZo13jq+A8rF4r/AKpNQ0/VsTD9Zeuj9uvw2BtyfG4TRy4ZoAR
         m4F12a3oDM7rzKQL1PZtGLilFi1IxHu475Teq0bvQhIhAiBD/FtC5UAKtIjoacbRxzop
         xkIvqCOE8I7V2pNxhsiCZ0QuIsjenIdBHXMYY3ihctrAbgDNl0Tkdmw161VxSlhR0MrI
         8iMg==
X-Forwarded-Encrypted: i=1; AJvYcCXV92tjsyumzDQQ+3rGwJFqEhRkXD5Pvd0/IGhZBxaKSDmWpQx+pqlh5NHUrkYUa5Ki2o8LGVOjLcparrz4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2rZCiiLOc0Z7672vg5tpqkAtKnzG1ECfDmdN1di6W0/KZXCvf
	+ukarlJ/pU+Ycr1oQtkeATi/TPrMK9CST9JihqSh+V3I0AXVHivEZGTfTx/Gv53WfRwmQ6qlsCJ
	j3KEDomMOpX/JwBt0iF9isKlimwN9rCaCuORaYIdSNCTe0L6zrdMtsLWtVYCU/58EezY0
X-Gm-Gg: ASbGncv8m0htN2h4UWQUf4Ddi1SXSpkcz7TzVB+o1qRIv9IJz7zd3BKwJGzB6P7ZxUz
	aCaINC9KcYToPAhhAhK6Q57vOh2u3tfrDviWgMviGG776I8Mco6zodoSSgZRzBubTcmtqM2AD5s
	ioeO/63PmFSG5U6oo2o49yr+8WQXvKOoDOKzp08QfaXiUJVt6jhqJLeVuyVKj06TYHHAmnWuCCp
	1jShuHUoSww6J7NFwqIl7xu+n0DTEMGn0BGugZGiK8YdlRi+7RC5DMGTUZmxQ6nWYlU40lWLjv8
	3e4puO548auLfm5/JuxmzjLmAt5B1RH3rhWDMox8H3wrAlmT9OYrJA==
X-Received: by 2002:a05:6214:e66:b0:702:da1d:7b6 with SMTP id 6a1803df08f44-7070065dddcmr75000896d6.39.1753309681179;
        Wed, 23 Jul 2025 15:28:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR3Y70iRxurvn67ZH8uU8lWluwQrFXrLFgiTwqmBUbTtJeR6aH4EXz7NfsamMhwO5FbuMS8A==
X-Received: by 2002:a05:6214:e66:b0:702:da1d:7b6 with SMTP id 6a1803df08f44-7070065dddcmr75000536d6.39.1753309680763;
        Wed, 23 Jul 2025 15:28:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:00 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 08/23] arm64: dts: qcom: sm8250: use dedicated elite dtsi
Date: Wed, 23 Jul 2025 23:27:22 +0100
Message-ID: <20250723222737.35561-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: YX299rY99IbVCRRfXYKY7ZNl25xuEWyA
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688161f2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=He3Dqnl9yZ_pUDwKbX0A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MiBTYWx0ZWRfXzy+2CDRIz1Ik
 HO15XsYBYvaT1Kvea9fBtcyBtD9u7he/rmitXrYmhlgC++EeyiBWs90EaIH+LOi2vV84kyyvYro
 HpxgHJdM2kM7iGSaNUsz/1OWa74EOsmO6+NbSXBaXf1cbPqaZ3yE++K3oSgF2Oq8DOV7Cvi2w49
 7PWslGV/8r9L5drOUrhB77ljJO2K84JmoWUfZ9AAMF5f/PTAte0UmiArG3Xd5WapuRIR76qM+tL
 7m5etBIFROL/30YsV79LU888LTTQKVeLVEPpURMrYfUBETfNYBvh0ECndbFHTKvvS0DFpGT5k9P
 uIhnvFocGQwOpDCEJwNGp2mppcGV8E5n6p+hYwAvzXkx43HFwjEKKT5ExFjaM73fl0dsOj3tcUx
 zDxK63LSk++lvoZ5VGNT4Nbf/FqVNV1/z1lvLPmUbWK0hx4rk6Zfoa+LBLrY4mJa8fZPcNxV
X-Proofpoint-ORIG-GUID: YX299rY99IbVCRRfXYKY7ZNl25xuEWyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=724 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230192

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  1 +
 arch/arm64/boot/dts/qcom/sm8250-audio.dtsi    |  8 +++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts       |  1 +
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts       |  1 +
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi |  1 +
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  1 +
 .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      |  1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 53 +------------------
 8 files changed, 15 insertions(+), 52 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 33ecbc81997c..71f0fb36a96e 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
+#include "sm8250-audio.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
 #include "pm8150l.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8250-audio.dtsi b/arch/arm64/boot/dts/qcom/sm8250-audio.dtsi
new file mode 100644
index 000000000000..4ff49550460a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-audio.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
+&q6asmdai{
+	iommus = <&apps_smmu 0x1801 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index f5c193c6c5f9..3499ea6576ed 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
+#include "sm8250-audio.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
 #include "pm8150l.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 7f592bd30248..277a89261a79 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include "sm8250.dtsi"
+#include "sm8250-audio.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
 #include "pm8150l.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index d8289b2698f3..6570946fd9ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
+#include "sm8250-audio.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
 #include "pm8150l.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 465fd6e954a3..b239732b09d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
+#include "sm8250-audio.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
 #include "pm8150l.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index 668078ea4f04..d6688616fb4a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
+#include "sm8250-audio.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
 #include "pm8150l.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index b0197602c677..74ea5e2d8279 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -17,7 +17,6 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
-#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -5999,58 +5998,8 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
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
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-							iommus = <&apps_smmu 0x1801 0x0>;
-						};
-					};
-
-					q6adm: service@8 {
-						compatible = "qcom,q6adm";
-						reg = <APR_SVC_ADM>;
-						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
 
 				fastrpc {
-- 
2.50.0


