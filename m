Return-Path: <linux-arm-msm+bounces-57067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC97AAD66E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3B00463589
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157BB2153D0;
	Wed,  7 May 2025 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gnejsMBk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DBA211A11;
	Wed,  7 May 2025 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600695; cv=none; b=vCCHU2neBJ5K8xS8FSmYjeN077PVkDim3oBatQhGI6ylIaQf15n+g8tyjNn0MYgu9B66eRAzeBYDu+hIgvxB9SR4/8kg+foqsk3Q1LL0/Ypa5eioqL8X3z1UzX9p6JfhY05g4zOI06iH0fXqFy7lxS4+8+xrcK8Ns4VMj+wTe8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600695; c=relaxed/simple;
	bh=++GMZXjUIUq2C5is+O+QvYYeBmHLv/hZAofVXxany90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FuX3agN/LoklGjg7GNWuv3FrAt6nxW0N4Sqs2BTXEhXOwf9LRaTYxDLNNw11onfSOEjUg2dC5Dy5WziJgIrNJr17TDoAIItTV53kNKdSnOoy9dQFFIKcZ3Z+AEYPJ1EgZD1apv1sZUUX9xpq5MRt8xoWrc2aqfLn3Q/7ZwBaT6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gnejsMBk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471Gqkk003295;
	Wed, 7 May 2025 06:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2phAWdzKpL0
	yAk4YZGS6tPVstkkLmVnsmFjG+GPJnJg=; b=gnejsMBkbEsh3xnQsGMi5v1UVSn
	bCZF4CUcRtHLzCfAjB+DfE5uOfNnDkixikvAfjE957VMqdlEvZCfoZW8pu6Ds6Ge
	ppeYeOLOQECxd4+0gI4cRVT77mtYmb3swfWSASudcFF6+Fl9HzAVAM2cN6/tltUW
	bTW0o+32Bj1iCr3avpeypYebToKIwZ90gojcTTmupkrHHh2uK7xnNAh67UfenyzO
	cI+zTiTRHflLB0iokbjg7BmdbQKuZJUysINIRi+95eMvbBiF1bAkq7U2CEm2GZ8W
	/IXbDYZ/6rkYZWS/rTHZVsy1jsTrU44j4ULU4wR4UuwhL/oQHGlqNxjyiNA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv4t7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476pP8V009495;
	Wed, 7 May 2025 06:51:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pO7G009458;
	Wed, 7 May 2025 06:51:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pOq6009450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:24 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 3EC945B4; Wed,  7 May 2025 12:21:23 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 4/8] arm64: dts: qcom: sa8775p: Create ride common file
Date: Wed,  7 May 2025 12:21:12 +0530
Message-ID: <20250507065116.353114-5-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507065116.353114-1-quic_wasimn@quicinc.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dzwkeQGaFEvGExvpUhzbRHkqZjwh9dy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MiBTYWx0ZWRfX1JuagrWORDPd
 MSJQu8S0xgBxPv914P/zEKmnYau3HPG4CnMdJNDsb4DS2zKEHr5Ejz1oIWvu16Q63KETwimU+eR
 pzwJdJriTh1cjXAFsAoXqaR5LWEycKlYQRGVNvEWylqyKOGfb6r7Fi7DOWwK1fKZzipbVcnAmKp
 Xa9J95PzykyfekW7JS7symVBpK29DqmL+zwd8iuUZaWdqv08nJE3eT6gembkiVLC6jMl4sM90l+
 YTO20KgfUcjSkZtOAkeqGJccd6OLxYTtjR7mxh5SDEC+3svMHw9qFSsRlle5EiA5GJZ/MB+uLN4
 q9ronRcK+rjHmSv9u53SBLp07YHnJr1VHeFX8LBEDkPCFzeVbpvSnsrTnmdpb7aVIOB6niXAzOL
 jM1KZPHdO+ZURYyZwQcKHa/usDgaT65L/d5nMetL4y+h6l7H83sJ3J4q048ZeODNv0nlnMg9
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681b02f1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=bg-rgiwkkVb7CIF9ZbUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dzwkeQGaFEvGExvpUhzbRHkqZjwh9dy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070062

Ride/Ride-r3 board used with sa8775p & its derivative SOCs:
  - Is based on multiple daughter cards (SOC-card, display, camera,
    ethernet, pcie, sensor, front & backplain, etc.).
  - Across sa8775p & its derivative SOCs, SOM is changing.
  - Across Ride & Ride-r3 board, ethernet card is changing.

Excluding the differences all other cards i.e SOC-card, display, camera,
PCIe, sensor, front & backplain are same across Ride/Ride-r3 boards
used with sa8775p & its derivative SOCs and are refactored to ride-common.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 .../qcom/{sa8775p-ride.dtsi => sa8775p-ride-common.dtsi}    | 6 +-----
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts                | 5 ++++-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts                   | 5 ++++-
 3 files changed, 9 insertions(+), 7 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dtsi => sa8775p-ride-common.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride-common.dtsi
similarity index 99%
rename from arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
rename to arch/arm64/boot/dts/qcom/sa8775p-ride-common.dtsi
index 04f02572a96b..e44f220ae75a 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-common.dtsi
@@ -1,16 +1,12 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
  * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */

-/dts-v1/;
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

-#include "sa8775p.dtsi"
-#include "sa8775p-pmics.dtsi"
-
 / {
 	aliases {
 		i2c11 = &i2c11;
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index 3e2aa34763ee..a9014095daba 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -6,7 +6,10 @@

 /dts-v1/;

-#include "sa8775p-ride.dtsi"
+#include "sa8775p.dtsi"
+#include "sa8775p-pmics.dtsi"
+
+#include "sa8775p-ride-common.dtsi"
 #include "sa8775p-ride-ethernet-aqr115c.dtsi"

 / {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 4e77178cf66b..e98554f825d5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -6,7 +6,10 @@

 /dts-v1/;

-#include "sa8775p-ride.dtsi"
+#include "sa8775p.dtsi"
+#include "sa8775p-pmics.dtsi"
+
+#include "sa8775p-ride-common.dtsi"
 #include "sa8775p-ride-ethernet-88ea1512.dtsi"

 / {
--
2.49.0


