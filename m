Return-Path: <linux-arm-msm+bounces-66120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26884B0DF9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5C43A5C25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096E12ED145;
	Tue, 22 Jul 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuXAmJrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D432EBDF5;
	Tue, 22 Jul 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195799; cv=none; b=VCqIoHJqrtqD316lwEioHSAy+ZnuBdbfURGLJ4XN04HHnqy/ApTHB0LbOfrfJ3TMJdd671wNnz/jnJOCkjMT0bub3rwwYq5keA2UzAZCnwsg8e8SFfTV4LsdI0RUHVQ2PVK9t7s+Jt+oJwV/8ulk3BDNOKL9FnbA0QHEU8RDry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195799; c=relaxed/simple;
	bh=qQDujLnlsZiNrsV7Xuybo+TeTdZgi+7Q7HVsn9jPznY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cazzPO98A378MxEFwRPmgJt0QnVye6+K/zWoLnI3oK34ed64gd5MEAAW93rayHGarjKArQZTBXB0YrcqK/tk+KYcc9LD6CDHXCnAFMyQke6z6O7KHkeoKe/C9NdAOgkq8tCbjX1oguKC2bWBk/GnDRhmXazQxD+FcVwAjOfTcGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuXAmJrQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7CMYP015640;
	Tue, 22 Jul 2025 14:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IjrhDKIms9J
	13JDYaWkw7YcMU9ESJ7OQ/sKg1IBYjmU=; b=BuXAmJrQ2pCJXZ5n9Z4IfZZqGkg
	I4RsnTt+RAlGAG8dFWm3zPYwrceGkLNnEg4hDGbj4ZzAG8yVRn/q6zE4NWH7RQwk
	3rKkK6dyF1ssm16CeemQkMD4qY/QRSzgMbFaRNzW8VOh0EhBlTX7Hs2da6jFBB+M
	JFNqO+EjUmfZP6qeY9orOo91huptMb83iQRhJ4/T8jFtuXpcX3F+8l9IPHZTu+aS
	HOadYOYsanu09/PLlwhDwEl5e0bi10gR5ULmnXpOPHc4Sklm5Nz+5sL7xXNJlSWj
	45mhbr/CtxY/W0N/DNf90vJpkPXRQubpg1lRFNGSpDoH+EaKSuSdtEMxaPA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w2ykq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEnn5R023831;
	Tue, 22 Jul 2025 14:49:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4804ekgew0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MEnmRx023811;
	Tue, 22 Jul 2025 14:49:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56MEnmxC023810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:48 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id E5E095E8; Tue, 22 Jul 2025 20:19:45 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH 5/7] arm64: dts: qcom: lemans: Rename boards and clean up unsupported platforms
Date: Tue, 22 Jul 2025 20:19:24 +0530
Message-ID: <20250722144926.995064-6-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687fa510 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iMCHK3kRfTuK784hpEoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfX6R6PnvyJueDj
 r63GqcDVQfTXkvFgG3MSClNhZ3N4qdnwxnTZx7GRI6X5CVtaenGFAVNg+ROF5fMnTeBqzDnssmQ
 KADGr2IJcVAKjbAhEgtWljgJ/Ls2wJJrFJOXhKR6fiOLYJDb6IJdj2eZVJaWQULM/voFyWEEgM7
 /qwoEWwuPdQf5iTgv0gnsIoKm9NOdA+ECFdJGr5tKv8onzjLrAfzeTAwWmxoD++oo6W46BYpayA
 RwP+NRzeEN48oiiyn7F3jrEfb4Z/6FgZH979MviOAbjrGUU/UtEMXlJdTO8eBMrpsUMlfYAp772
 3nvTTstuHufQOZerlRKlXa8J080BVdIIJJPkLMKqwy2u19sUGNFXNlzf1MhTDOMs+a3iCos5lAC
 btUT8pgYbsv4xvPu8pY/wO8YJVHKVnFe76ZHInpc12DS/1OvMFHIEjOf73Z62Pb+eYf+7o9b
X-Proofpoint-ORIG-GUID: ohPevlyKUCNxJeDaNCaE4PgnQY7WPBhs
X-Proofpoint-GUID: ohPevlyKUCNxJeDaNCaE4PgnQY7WPBhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220123

Rename qcs9100 based ride-r3 board to lemans ride-r3 and use it for all
the IoT ride-r3 boards.
Rename sa8775p based ride/ride-r3 boards to lemans-auto ride/ride-r3,
to allow users to run with old automotive memory-map.

Remove support for qcs9100-ride, as no platform currently uses it.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                    |  7 +++----
 .../{sa8775p-ride-r3.dts => lemans-auto-ride-r3.dts} |  6 +++---
 .../qcom/{sa8775p-ride.dts => lemans-auto-ride.dts}  |  6 +++---
 .../qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi}   |  0
 .../qcom/{qcs9100-ride-r3.dts => lemans-ride-r3.dts} | 12 +++++++++---
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts            | 11 -----------
 6 files changed, 18 insertions(+), 24 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride-r3.dts => lemans-auto-ride-r3.dts} (59%)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dts => lemans-auto-ride.dts} (60%)
 rename arch/arm64/boot/dts/qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi} (100%)
 rename arch/arm64/boot/dts/qcom/{qcs9100-ride-r3.dts => lemans-ride-r3.dts} (36%)
 delete mode 100644 arch/arm64/boot/dts/qcom/qcs9100-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4bfa926b6a08..2a1941c29537 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -29,6 +29,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-auto-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-auto-ride-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
@@ -126,8 +129,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
@@ -140,8 +141,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
 sc7180-acer-aspire1-el2-dtbs	:= sc7180-acer-aspire1.dtb sc7180-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb sc7180-acer-aspire1-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dts
similarity index 59%
rename from arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
rename to arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dts
index 3e19ff5e061f..0e19ec46be3c 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-auto-ride-r3.dts
@@ -7,11 +7,11 @@

 #include "lemans-auto.dtsi"

-#include "sa8775p-pmics.dtsi"
+#include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
 #include "lemans-ride-ethernet-aqr115c.dtsi"

 / {
-	model = "Qualcomm SA8775P Ride Rev3";
-	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
+	model = "Qualcomm Technologies, Inc. Lemans-auto Ride Rev3";
+	compatible = "qcom,lemans-auto-ride-r3", "qcom,sa8775p";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-auto-ride.dts
similarity index 60%
rename from arch/arm64/boot/dts/qcom/sa8775p-ride.dts
rename to arch/arm64/boot/dts/qcom/lemans-auto-ride.dts
index 68a99582b538..6af707263ad7 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-auto-ride.dts
@@ -7,11 +7,11 @@

 #include "lemans-auto.dtsi"

-#include "sa8775p-pmics.dtsi"
+#include "lemans-pmics.dtsi"
 #include "lemans-ride-common.dtsi"
 #include "lemans-ride-ethernet-88ea1512.dtsi"

 / {
-	model = "Qualcomm SA8775P Ride";
-	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
+	model = "Qualcomm Technologies, Inc. Lemans-auto Ride";
+	compatible = "qcom,lemans-auto-ride", "qcom,sa8775p";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
rename to arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/lemans-ride-r3.dts
similarity index 36%
rename from arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
rename to arch/arm64/boot/dts/qcom/lemans-ride-r3.dts
index 759d1ec694b2..310c93f4a275 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-r3.dts
@@ -2,10 +2,16 @@
 /*
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
+
 /dts-v1/;

-#include "sa8775p-ride-r3.dts"
+#include "lemans.dtsi"
+#include "lemans-pmics.dtsi"
+
+#include "lemans-ride-common.dtsi"
+#include "lemans-ride-ethernet-aqr115c.dtsi"
+
 / {
-	model = "Qualcomm QCS9100 Ride Rev3";
-	compatible = "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
+	model = "Qualcomm Technologies, Inc. Lemans Ride Rev3";
+	compatible = "qcom,lemans-ride-r3", "qcom,sa8775p";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
deleted file mode 100644
index 979462dfec30..000000000000
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
- */
-/dts-v1/;
-
-#include "sa8775p-ride.dts"
-/ {
-	model = "Qualcomm QCS9100 Ride";
-	compatible = "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";
-};
--
2.49.0


