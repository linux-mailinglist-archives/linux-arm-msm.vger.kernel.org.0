Return-Path: <linux-arm-msm+bounces-20145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7688CB3B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429BD28265D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B86149C46;
	Tue, 21 May 2024 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ar/GOIDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A489149007;
	Tue, 21 May 2024 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316848; cv=none; b=OQBNpEk9EzOeaBnoUqyodLMRdELmwW+1o+fr4X5g8gxqFXBXtohz+qZz6T5XFtPhOcOgmIqqBvdpQLsXI3CJPS6PmUrnTJ2YwsPD4w0b8hWdLPi4BTHyvxxfDCRxX4eiPtWaeP7VVszZdxIxLl5cP6lsf+oiUkrBnOPovOUDKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316848; c=relaxed/simple;
	bh=/zNvAkri9bGB0LyQN0umY2WEIdcVy/YBMpd1hWw/MMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=l8Rxzt5YA6mhEiT4kOruNibC6SMm66hEXDud9ciKpiiNO4FNlENgkoASLMKXnT1B6r/6dbGddzFUlTrrRRqW1V8yIDbNvnSVR/ysS5//ZuzcPoxaipQk2rW3fWCMvnrsUAimZn1JlQYvvCdSdX/6UMx4K9u6GDs+xQ3AIS+OR7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ar/GOIDC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LBtqRi008286;
	Tue, 21 May 2024 18:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=RFak83ZSaOcO33zmXVEQI6tnblOmnteiUxHPFFzQUQQ
	=; b=ar/GOIDCM8Sr/6pLo8AbESb1jj34AiqOqpLBrrgc6nG8/Nz7xE8cSy0scKk
	u91V4hS2NrP8lR7Ca3Nk1gON0Z87YBywasx8v9dE1B5lrGuA9wjHpVo+E1U0FMGq
	YVW5C5Ws5c8E7Cuwk3ftzpuXNOjVih9CxgvXkYCNapa26F99GfJe/hBhjMM6VQKZ
	Iw2KfS8r2BrI13RS6XYMc3aR4E08W359FWPdgjSumztnGbiG4Jgwi9MUROgXKe+0
	5KUZlxklU5zh/5/5PRkv+PgrRR89cM+HCSP2ZYdSgnk5HwRwwq4sKYWF8az0sZFe
	/qeHCObkTy2X1irsuaIaPZfGl9w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqapmmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcTb4014870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:29 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:28 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 21 May 2024 11:38:05 -0700
Subject: [PATCH RFC v3 8/9] arm64: boot: dts: qcom: sm8550: Split into
 overlays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-board-ids-v3-8-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
In-Reply-To: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>,
        Peter Griffin
	<peter.griffin@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ElsVSSpLuJT7E_mI2Kgue_DaNc_8N-yN
X-Proofpoint-ORIG-GUID: ElsVSSpLuJT7E_mI2Kgue_DaNc_8N-yN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405210140

Generic sm8550 devicetree is split into a dtsi. Move it into its own DTB
and preserve the boards as overlays.

When not using overlays, 264 KB needed to store the sm8550-mtp.dtb and
sm8550-qrd.dtb. When using overlays, 188 KB is needed to store
sm8550.dtb, sm8550-mtp.dtbo, and sm8550-qrd.dtbo; where the overlays are
~36 KB.

Also add the board-ids for these DTBs.

This change is not intended to be merged, it breaks aliases and I doubt
it boots correct. The intent here is to show how board-id could be used
with a DTB and DTBO.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++++
 .../dts/qcom/{sm8550-mtp.dts => sm8550-mtp.dtso}   | 24 ++++++++++++++++++++--
 .../dts/qcom/{sm8550-qrd.dts => sm8550-qrd.dtso}   | 22 +++++++++++++++++---
 .../boot/dts/qcom/{sm8550.dtsi => sm8550.dts}      |  8 ++++++++
 4 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 39889d5f8e12..7f137f274d8c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -233,6 +233,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx223.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8450-sony-xperia-nagara-pdx224.dtb
+
+sm8550-mtp-dtbs		:= sm8550.dtb sm8550-mtp.dtbo
+sm8550-qrd-dtbs		:= sm8550.dtb sm8550-qrd.dtbo
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dtso
similarity index 98%
rename from arch/arm64/boot/dts/qcom/sm8550-mtp.dts
rename to arch/arm64/boot/dts/qcom/sm8550-mtp.dtso
index c1135ad5fa69..0ee4614719ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dtso
@@ -4,9 +4,12 @@
  */
 
 /dts-v1/;
+/plugin/;
 
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include "sm8550.dtsi"
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
@@ -17,13 +20,30 @@
 #include "pmr735d_a.dtsi"
 #include "pmr735d_b.dtsi"
 
+#define BOARD_ID	qcom,soc = <QCOM_ID_SM8550>; \
+			qcom,platform-type = <QCOM_BOARD_ID_MTP 0>
+
 / {
+	board-id {
+		BOARD_ID;
+	};
+};
+
+&{/} {
 	model = "Qualcomm Technologies, Inc. SM8550 MTP";
 	compatible = "qcom,sm8550-mtp", "qcom,sm8550";
 	chassis-type = "handset";
 
+	/**
+	 * Redefine the overlay in the DTBO so the sm8550-mtp.dtb that Kbuild
+	 * generates has accurate board-id.
+	 */
+	board-id {
+		BOARD_ID;
+	};
+
 	aliases {
-		serial0 = &uart7;
+		// serial0 = &uart7;
 	};
 
 	wcd938x: audio-codec {
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dtso
similarity index 98%
rename from arch/arm64/boot/dts/qcom/sm8550-qrd.dts
rename to arch/arm64/boot/dts/qcom/sm8550-qrd.dtso
index d401d63e5c4d..f756c50a80b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dtso
@@ -4,10 +4,14 @@
  */
 
 /dts-v1/;
+/plugin/;
 
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include "sm8550.dtsi"
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "pm8010.dtsi"
 #include "pm8550.dtsi"
 #include "pm8550b.dtsi"
@@ -19,13 +23,25 @@
 #include "pmr735d_b.dtsi"
 
 / {
+	board-id {
+		qcom,soc = <QCOM_ID_SM8550>;
+		qcom,platform = <QCOM_BOARD_ID_QRD>;
+	};
+};
+
+&{/} {
 	model = "Qualcomm Technologies, Inc. SM8550 QRD";
 	compatible = "qcom,sm8550-qrd", "qcom,sm8550";
 	chassis-type = "handset";
 
+	board-id {
+		qcom,soc = <QCOM_ID_SM8550>;
+		qcom,platform = <QCOM_BOARD_ID_QRD>;
+	};
+
 	aliases {
-		serial0 = &uart7;
-		serial1 = &uart14;
+		// serial0 = &uart7;
+		// serial1 = &uart14;
 	};
 
 	wcd938x: audio-codec {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dts
similarity index 99%
rename from arch/arm64/boot/dts/qcom/sm8550.dtsi
rename to arch/arm64/boot/dts/qcom/sm8550.dts
index c68e08747b6f..3546ea4b96f1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dts
@@ -3,6 +3,9 @@
  * Copyright (c) 2022, Linaro Limited
  */
 
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
 #include <dt-bindings/clock/qcom,sm8550-camcc.h>
@@ -32,6 +35,11 @@ / {
 
 	chosen { };
 
+	board_id: board-id {
+		qcom,soc-version = <QCOM_ID_SM8550 QCOM_SOC_REVISION(1)>,
+				   <QCOM_ID_SM8550 QCOM_SOC_REVISION(2)>;
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";

-- 
2.34.1


