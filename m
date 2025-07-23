Return-Path: <linux-arm-msm+bounces-66379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 068FDB0FCCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C83C58731C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51199274FF2;
	Wed, 23 Jul 2025 22:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiObdMZw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C9274B51
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753309686; cv=none; b=tj/XU8adjljjw7L4DF/3x+Gm1xWPu45UJnAmYs63LQqeQHN02LdJz+D/xR+YbZOcy/lQZv5bKH3b+DpKfP/Ss/ZOaUlkUJWfYn0tkHjOjVTsmiasrp3UzwRDiL/Lp8QkD7+CYABKebIfFQ95EKsezZ4xHR1WHQDqQ3kyM6PAWAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753309686; c=relaxed/simple;
	bh=u5YnQTCt8dVSb/Fugq9BHu8/dHungUrT8rTY9TBDuw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dl89L9xJ88r6pckXCoi4EeH9PLk6fMQ5+kdXIA4KFle1Yq6EdjBhN0baoJ9/CiDfdP633iUb9eUhDCfh5o27zXg0uO3C4xqlzH6/CoRdfwlVXOdGWfDnAQPNlBww0mqRB1Z73nh2ffwkW4gTKxZvISOdiOQn3HLnIGVjPBARmew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiObdMZw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNf0L019569
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5ftBTXL9LYh
	4w82ALN9D5Q1Okarhm8+FZmAriFPFydI=; b=PiObdMZw8FadvApD7FHOOI1j2G2
	zhqs4ifQv3MGDoymwI1OHMCw/zU9KHjnq/yGY3uRVEuMNa2MjASmMqQYjC+fjZFo
	shYIqZG6J8p+VfHNDC+97vd7tqQz9/mhSqMcgH5PE/Mvg9JZiP89pu3JidhCe09E
	ejXiN0XZ1x4KD7z091hBvEXg5MbAK3XP+0NdOUqHd1DMW7FRAxlqa4l5DsWMDM62
	0Pe0Ym4xtnxDPNZVg183pedT0//7k4ZyXWtfaoczTj/mnfxMuCTTYdghgZp7Uxei
	KAGkpW+fNSMeTcDDNBrT5QUcJrMVzSridCceDsVwuoCK7h2fK7Sm2iPZemQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379ru59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:28:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70708748fbaso5597426d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753309682; x=1753914482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ftBTXL9LYh4w82ALN9D5Q1Okarhm8+FZmAriFPFydI=;
        b=NDXCAHUMRvtQTxp9zMsRNJtWo50+dj6Ir5EyK8kCyQwoMSKZc7QW6vLGkdrIMRbZk4
         Qvbk4DnpWl0/CrCa7RwrmvHDvUnR9M2EXzkloh1G28V+9IrkXOpBKxaabe1XaOYAflxU
         7UgL/0pt1OvKBUnuZZ7weTkI5Ix8+gXDmlS80U5H35WvBcYMhi44DVXwaVysZL/vkqIR
         LeJqr+oZmGPJsIi247ItsWkFi8OP4x+mfHFbk4kY7WCXB6C86SGVHx7tbM4cstcWZG17
         F91e0WJQ0xf7hPn2o5Kchj8cfQWXWaN7YU830P6/q3PM1OYnmo/XeCjfyF45c4WEkVfd
         y/7g==
X-Forwarded-Encrypted: i=1; AJvYcCV8CN2jLJ/vKLecPZ/7WaH6HPoE+TseOH1DXB53JnP9FOhbtS3Cx0PsvBoxo1qX/PZv8SKlNsINn7DzSb1r@vger.kernel.org
X-Gm-Message-State: AOJu0YwKg3uqrEtBZ4qtvRgbQlZbkNZxwrF6qk7MJofRdU13sexJHPMH
	Tpra0tlWZdiSu2OKabq4vVmYUcK28tTK2MKxKktd6l75SHADI4j9S7DInHLciVGuaa3uaLiaGRZ
	5MUJNutZi6K/NnaM+fVVszl4tKiR4Z1TPJfB9AhmmIzkQKMR6pwEoTDmSnisI12OiDqr24jFPKB
	S1
X-Gm-Gg: ASbGnct8QHE/R3GPZrUQfv6INfMhrx0+cXDYrX2F5YiPD555DRfk27pmmFsKHFzaILh
	+NrXygsEZbGfI8EeABEqZWRw1GXdmSfR10ZYtLbzAjWMGsiJ9FjTu8Y0Ax53BGfs4Y+eRrSITHJ
	toy5LqO9kmreKG4+LDqu52MEiZWXYIjGezeLtpi79C5jSc2OU3D7SrpCB1ZJ8xsbcoyleg4dSWD
	/DRz3PJOVKmbFel+SzL3KFITuACho2u4Arz8OZ5JHeyk/a2TUPgiKYSpr2qBxcFzklGgTdHJ2gP
	GsvA/mns/SLJCG0RI4ZHws49bj9tJRE9tYZ0QToQ8Mmcyax50zUFxQ==
X-Received: by 2002:a05:6214:4115:b0:704:b906:eaa4 with SMTP id 6a1803df08f44-70700736c73mr71555196d6.37.1753309682230;
        Wed, 23 Jul 2025 15:28:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNLAHZ8fpDxJ7lJK4dFDOw2FUpqvS5WNssMuZLaUDjr+J/WR6798RpyyA4BQnkgiXAuhAs8w==
X-Received: by 2002:a05:6214:4115:b0:704:b906:eaa4 with SMTP id 6a1803df08f44-70700736c73mr71554856d6.37.1753309681719;
        Wed, 23 Jul 2025 15:28:01 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcad23bsm248520f8f.44.2025.07.23.15.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:28:01 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 09/23] arm64: dts: qcom: sm6115: use dedicated elite dtsi
Date: Wed, 23 Jul 2025 23:27:23 +0100
Message-ID: <20250723222737.35561-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: u9Q7G5vBKWJNuUqLKOtVzddZYMQCFTcu
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688161f3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=h0svG2ZG1csubjrOInMA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MiBTYWx0ZWRfX99hgSLgzoTV1
 QWRj4N7d9YPiZU8EpIXyiH3Zj6myzDnXSuc+QjSPALrwwEaqXfU0uhnGRsFnTWuh2lkEwCsW6Qw
 z4zu3eeWZ9935sTYajn4PL7PVZ3sYwatZpBCVQtwT+eD7mB+uHIFiE0gutKgY8MlOR4W+c/Ih/f
 QaBTZzHcSYu9qpEgTcb7XPXCXVlWS2VLRZXzkJGzAvNQHN62GSHC2pWhYtuqnGT67a7fg3x5N1b
 RZPq+6+zoiAykImTRKyDw0vgbuYTcsbkVlwxpYk5AvoU5gQg2/rWAVPy9GdhmSOr6wg8Zne4jJL
 IiZoOSdzuwAVat2ZqSLOodnC8Y9wqa2O4fr+YMYzineK8LJaMmX73KiQVtfHRiAZ2gsSYJUF1ni
 3E+XH9HFg9cvIgis3Q0dFMc1E54aO0uOjPfXoR/KdUYM/DfV5GAxt/VpUQfrKpEagImZ/XmX
X-Proofpoint-ORIG-GUID: u9Q7G5vBKWJNuUqLKOtVzddZYMQCFTcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=744 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230192

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
This move removes duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/sm6115-audio.dtsi    |  8 +++
 .../boot/dts/qcom/sm6115-fxtec-pro1x.dts      |  1 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 69 +------------------
 .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  1 +
 5 files changed, 12 insertions(+), 68 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-audio.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index cd8c8e59976e..64ff6f2f1c23 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "sm6115.dtsi"
+#include "sm6115-audio.dtsi"
 
 &cpu0 {
 	compatible = "qcom,kryo240";
diff --git a/arch/arm64/boot/dts/qcom/sm6115-audio.dtsi b/arch/arm64/boot/dts/qcom/sm6115-audio.dtsi
new file mode 100644
index 000000000000..d8f32f533609
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-audio.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include "elite-audio.dtsi"
+&q6asmdai{
+	iommus = <&apps_smmu 0x1c1 0x0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index ad347ccd1975..e74423bd8913 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sm6115.dtsi"
+#include "sm6115-audio.dtsi"
 #include "pm6125.dtsi"
 #include "pmi632.dtsi"
 #include <dt-bindings/arm/qcom,ids.h>
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 91fc36b59abf..b0ff09aca6d5 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -15,7 +15,6 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
-#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -2729,74 +2728,8 @@ glink-edge {
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
 
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
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-					};
-
-					q6afe: service@4 {
-						compatible = "qcom,q6afe";
-						reg = <APR_SVC_AFE>;
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
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
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-						q6asmdai: dais {
-							compatible = "qcom,q6asm-dais";
-							#address-cells = <1>;
-							#size-cells = <0>;
-							#sound-dai-cells = <1>;
-							iommus = <&apps_smmu 0x1c1 0x0>;
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
-						qcom,protection-domain = "avs/audio",
-									 "msm/adsp/audio_pd";
-						q6routing: routing {
-							compatible = "qcom,q6adm-routing";
-							#sound-dai-cells = <0>;
-						};
-					};
 				};
 
 				fastrpc {
diff --git a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
index c17545111f49..b461a09781d5 100644
--- a/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sm6115.dtsi"
+#include "sm6115-audio.dtsi"
 #include "pm6125.dtsi"
 
 / {
-- 
2.50.0


