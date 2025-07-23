Return-Path: <linux-arm-msm+bounces-66384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE23B0FCD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B10A1C21AC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0642777EA;
	Wed, 23 Jul 2025 22:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYJeT1Mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD280275B0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309692; cv=none; b=IeOG+hfybhdqSF30LsjzrExnEVUzIG76ckVwBxx+EcrOPn6UU/C7tvAgXEk+DEEM/rwBYSj7UPpH/oGJeN4KUWKXr1RBPR2ZNCEVFMB/eEBaet9KUbyMg9jTr974EAXt/8BOnBf4SEEFuqHB8QYAcAr+a36TPQPlk/+0c82kND0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309692; c=relaxed/simple;
	bh=5R0DWRB8pAdMg7zzt0GXuEvR8mZZI1Vjp14kikh/KIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAeNVhGsL8dLesBZouO1/WUTcVBwyR9Q/BtrpGzmZo7IUp6idh+fycSmdyAjrCELLhDgcCKU9aKu5uS1PSswKup4daX486a+OSDIcfzEcWIwOf6pjnudyAyOJmrVFeNka7/TQIpooumMwyf2WhUnjTMbpMPDNYU75ltQQ2Ci9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYJeT1Mh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGq9kd024471
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0jpyAxpI48R
	1msvWfQPpUU9wgV/nArJybOguxXU5++4=; b=eYJeT1MhJJjZJUGjzDWMG5ZR0Nt
	sXoSfu+62XVRID/Cg4fCO2s6nKZp/mEwOcB7GV3eVUFVkpSA7zapIcuB6raOpj7I
	BT6cvksK63rOl2rZi1VQTtLNpoor2D483KewU2QbQS8CZgQqTc3EPEDR7v7lp5CL
	kn49uWuVyrAK068GcFnrX/g9y/tdLXlCQkUrDIbGW5ZwUOZn8+mg7xxzyJx4KTM3
	5nhEy79jMt9Jqz8L3cfg2g20E6UMtsuzqErHkTtArek91I4SFTxd27B0xeQj182N
	6awuQLz6DeM9/u6ml1SrarAj8/Vkj7PZRQtuL0+vG41dULT1JzLLsdj35/w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3esgw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-706ff7f3e4fso6970166d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309687; x=1753914487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jpyAxpI48R1msvWfQPpUU9wgV/nArJybOguxXU5++4=;
        b=F6sJTNYHiMYTEMBAVi83Gx2pGXFoff7hR3yILnP1gxhkc35F9/oDHlGLzNDU1+oG28
         DcopGRtovzgn5TMgNiaZTy7+Glp0H7WEQPjcqgUJav6xvEcMIA3J/WD+oSbkytNINVRH
         s6qpIMC/AtUpw8t0oYQr9CuFsjfsdnpKHx8Im6sG/ySr3FtWu5FWTNjvj6etO8q0BoRU
         pKwSk0N7fx0PbJERgaDKbRnZJaK4g+RhTyt3/TtWR6Uy0Py32fiui3FHidiHWP6myufj
         PwdcR/I78VXfv/kXyvOgTraQIFAEQ2zqF67AbwZ2wycrW73gXYMueMq6t1TAE1W0z/T7
         RaIw==
X-Forwarded-Encrypted: i=1; AJvYcCVysprgw+INI0ci5Ap9b0EsBanJYS399jYGbrsc1x2kqml/PNlyCGMwKYJHmUQ9+wJL66mZ6KSiC6MLTdVo@vger.kernel.org
X-Gm-Message-State: AOJu0YwSJTbo39T14uQsKQdsNOGbHOHmlnjseygVQIZF3arAmfGt6uCX
	MBhtNKaD5pCPHwjmc6Q9E6FHfJim1S6XEIzKypqZZGrn/AN+eZzraXeafQTShmSSrDId3UTkRH6
	bOz7TKvpFZW4XHVRrjiNAa73M0/CQght/J1qMdkeUw4yStgzD88RNicE+xyQW/nUSE/Pp
X-Gm-Gg: ASbGncu3OimGdliQy4QFTXH6ofMdcnC03Ib6k+x5So+iqrfGOlR7P4rupDei7YHd2FH
	wCFG8PwYDrVUe5VP632aitAFJ4OjCHaY7yRQ9GkmaUWR+IFgZZmVPfRfqE3FlfIEcfaVTeWtE0r
	J90n+ljoTJyC/ADO2c37w1GUwuQ6fsDrsmDtAUGjZpNZPsg40p+wZr7BB0BN5+pw+cfhW9QVqWe
	b/y7snyOG9aqTNdomr29aRfJQTQV/Bbflmu2ZonErYr/OBuqfs1cZ6hdmUS671LyjG5z2pOgfGY
	69LEpw1D+YHRLgmHMqKxDc9GQV20ZWybVGxOdyG7GC+gmBG/9yJ76Q==
X-Received: by 2002:ad4:596c:0:b0:6fa:ce27:5975 with SMTP id 6a1803df08f44-707005abd62mr63187066d6.22.1753309687181;
        Wed, 23 Jul 2025 15:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKZFM4C8iOyGySk3dCMx6hMc5W3tZ8t8wQVtWNw+VZbHduFJCRuN0EyrjNNEO3yDfmvZ1pUA==
X-Received: by 2002:ad4:596c:0:b0:6fa:ce27:5975 with SMTP id 6a1803df08f44-707005abd62mr63186816d6.22.1753309686732;
        Wed, 23 Jul 2025 15:28:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:06 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 14/23] arm64: dts: qcom: sm8750: use dedicated audioreach dtsi
Date: Wed, 23 Jul 2025 23:27:28 +0100
Message-ID: <20250723222737.35561-15-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: wEtZN0vV8N7SQDyGlhWpIWLF_Pr_XO_d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MyBTYWx0ZWRfX/2S6zuv2yOZN
 QBMKzP0ZN5F3Gyo1zPpUaMLtZ4g08tlleW8O4RsvvNF+Ys8kEQnT9l/KUYLqb4OXgJi2YSTg9St
 sRjKALlwvhljZPlkWbIUO1wIeKB6IFBjYUQYsYpM5PSvpCMN2BXWJcufZL60LPHOvOtJiyXPkFq
 yDFwrmJdkUFJrVeiZxkg1PbjyO1mMBiOaQpwkhfAQd3RUfCKw8kloqIk3WjFWWd9YdW4i7a7dmB
 LYp88lIdQKgpTGQMgpPVYvROJ1fAIeQNTQJYMgvafJEoM+7m0wGfQw6lggG4C/nc7iYBM/iHDdj
 N/NMMg9qgHmbP/KSZE+SoX3fg5KziijX0kQWOfJYZFZaZ7GwMJ7g7WC5i6/RLvoboubplGr6Tm6
 ZIJApOwrTy+efsMWVYD49qwYj0xRNfPY4Rd2iiOjkR6i9QvkK39jnSOnDihoMK7+Q5TS0lOZ
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=688161f8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kZFr1r1NR6a6C5-aafMA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: wEtZN0vV8N7SQDyGlhWpIWLF_Pr_XO_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=586 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230193

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of audioreach-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-audio.dtsi | 10 ++++++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts    |  1 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts    |  1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi       | 41 +---------------------
 4 files changed, 13 insertions(+), 40 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm8750-audio.dtsi b/arch/arm64/boot/dts/qcom/sm8750-audio.dtsi
new file mode 100644
index 000000000000..54eab4f5e029
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-audio.dtsi
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "audioreach-audio.dtsi"
+
+&q6apmdai{
+	iommus = <&apps_smmu 0x1001 0x80>,
+		 <&apps_smmu 0x1041 0x20>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 75cfbb510be5..eeca98dc6204 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8750.dtsi"
+#include "sm8750-audio.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #define PMK8550VE_SID 8
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..83cb53b64f0c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8750.dtsi"
+#include "sm8750-audio.dtsi"
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #define PMK8550VE_SID 8
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 79ca262f5811..952f6cfcdccf 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -14,7 +14,6 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
-#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
@@ -2194,45 +2193,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 				qcom,remote-pid = <2>;
 				label = "lpass";
-
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
-								 <&apps_smmu 0x1041 0x20>;
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
+				gpr: gpr {
 				};
 			};
 		};
-- 
2.50.0


