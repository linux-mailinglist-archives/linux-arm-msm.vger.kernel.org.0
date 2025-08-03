Return-Path: <linux-arm-msm+bounces-67581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C952AB193A3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A3407AAFB6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2749D26059F;
	Sun,  3 Aug 2025 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i168RPfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A02205E3E;
	Sun,  3 Aug 2025 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218897; cv=none; b=jRuRBW/5z5QXnNqfcum8RRysK9pyuttGdGmUsHUojp/cLZDN/6osAoZm7om3tTq+vlEhqIenqHyvNi+lnrCCpmuKjCzSIte6pAgT170my4Tvo7RSCZ5mnBwZhfMnvnXdtuDQ9yHbyZdiANVzvbzZLpTsZXsmDBxvNaoLg0xRNhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218897; c=relaxed/simple;
	bh=LlsyNLK41dXvvZsvwSf+2Ff+jW7AaneVPQYck123eq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmLQLOi4XM/M3ULG3MpICueD7/OTlrVEhrkwWTouunXBeEgAoPfRhPKYSrXEkhrb8VxKS8Q5/B66F27NLpl79a6zMKPFqaRzDNp7o8rgngBIVE4pKjXv+TO2iY4HjLtCl3tzcRxfjImxLAsDc0wJeREhqr7yJiyqU/U3ATJQvh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i168RPfG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5739MPON000477;
	Sun, 3 Aug 2025 11:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pc6bZ3cz9Uc
	Ge0ZXfxVG+h7GSoMG+0n8qCmc4ByZqVU=; b=i168RPfG0OWhkubl52TRitmfsda
	kIpJAibzgy7PvYlXFaEj0zOOFhAq7yb0CF9y0EtvD6z15amq2tbD4c8bHqJwdKRy
	aTfcVOflBSkTmp0giOsKCo0j7A4qMRkn3PQGYxqwm8gpDYmMDy5eokM8dKj/Zeht
	ziNe7B8jcxAyyVlzHPTY/X3L8YI6R/zCIMKmNVxc7jz8Ih2jmbNdqzyjyBac6wZM
	ODiA9pIenr/eaHfYJmI/B/dxF5SCndP6f6l9O9cgVmu0TOWqlRDh0ZEpdWQ5kyxU
	ebNkVCrJkr046U2yMQabI8LFssJdpI8ILJ2uncPc8PRRlnfhqBbL56od1Ig==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m27r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1KTn015302;
	Sun, 3 Aug 2025 11:01:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke03r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1J4c015276;
	Sun, 3 Aug 2025 11:01:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1JwZ015270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 7F0105DE; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/8] arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on daughter cards
Date: Sun,  3 Aug 2025 16:31:08 +0530
Message-ID: <20250803110113.401927-5-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=688f4183 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UF5zYO1LgcZHhtOM9ZUA:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Tt-pDnTPOz60viplMqr5-zoIRbSbAofW
X-Proofpoint-ORIG-GUID: Tt-pDnTPOz60viplMqr5-zoIRbSbAofW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfX06bFrrPNZ4CJ
 VKQKjTWY6F20VvBs0IwPEEshhRGqI1gtp2YpPE/26VJ0kueiQQnojH3iuPwI8StYxc595fjQUbN
 2aRUo2emCEB5wQ/mFj/AlTqC4yiO2FplbnurE7mN1kiQFx3uxAMJ/ym4ZyAXFzfyg+iPWg53J4I
 F+5ti2vPQwToCL/QQClbLDJDTYalVcXJCFIQa/RKq/mfiqZtFkJGyoGDXPrdOLo5a9sB9GjMoDw
 bZfaFd4qH7L/u49FEExogOTjPGQxMfs/a8wZVGNc4RWEz1/umKbIaNkJ2FUsAXgRzAUg6Nz1ZOj
 HnPKLRgtgOO9M7OOxFswq9TNFs6qFYyQ40eeWcCmTK50GrNC2f51NjBjifHpW1JTX9WDnymXm6V
 iTquJ0arCFp+ylyl6v8JjdBXrsa71YFFEcocPPvHyX/QerMp4MBn9F7OhR/1sO+//Iuea4St
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030073

Ride/Ride-r3 boards used with lemans and derivatives:
  - Are composed of multiple daughter cards (SoC-card, display, camera,
    ethernet, pcie, sensor, front & backplane, WLAN & BT).
  - Across lemans & its derivatives, SoM is changing.
  - Across Ride & Ride-r3 board, ethernet card is changing.

Excluding the differences all other cards i.e SoC-card, display,
camera, PCIe, sensor, front & backplane are same across Ride/Ride-r3
boards used with lemans and derivatives.

Describe all the common cards in lemans-ride-common so that it can be
reused for all the variants of ride & ride-r3 platforms in lemans and
derivatives.

Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 .../dts/qcom/{sa8775p-ride.dtsi => lemans-ride-common.dtsi}  | 5 -----
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts                 | 5 ++++-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts                    | 5 ++++-
 3 files changed, 8 insertions(+), 7 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dtsi => lemans-ride-common.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
similarity index 99%
rename from arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
rename to arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index f512363f6222..25e756c14160 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -3,14 +3,9 @@
  * Copyright (c) 2023, Linaro Limited
  */

-/dts-v1/;
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

-#include "lemans-auto.dtsi"
-#include "sa8775p-pmics.dtsi"
-
 / {
 	aliases {
 		i2c11 = &i2c11;
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index a7f377dc4733..3e19ff5e061f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -5,7 +5,10 @@

 /dts-v1/;

-#include "sa8775p-ride.dtsi"
+#include "lemans-auto.dtsi"
+
+#include "sa8775p-pmics.dtsi"
+#include "lemans-ride-common.dtsi"
 #include "lemans-ride-ethernet-aqr115c.dtsi"

 / {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index b765794f7e54..68a99582b538 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -5,7 +5,10 @@

 /dts-v1/;

-#include "sa8775p-ride.dtsi"
+#include "lemans-auto.dtsi"
+
+#include "sa8775p-pmics.dtsi"
+#include "lemans-ride-common.dtsi"
 #include "lemans-ride-ethernet-88ea1512.dtsi"

 / {
--
2.50.1


