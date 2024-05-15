Return-Path: <linux-arm-msm+bounces-19881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C438C6627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D96B1B20E83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 12:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D0578C66;
	Wed, 15 May 2024 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b1gkyyaw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A44C77F12;
	Wed, 15 May 2024 12:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775044; cv=none; b=S4BC11hNwqq47jzpdpgKBV3jyJoT913/fkcfMkvDiVtyEcmkDYdm9q24yF/nOSLNklue0LCqGikOkhH6Y6hy+c5ZXcRpGcQ5xOw0SkNT7t30B1nshFMmDslsnchu3B573kpfumIsZ5oq28xUfGJivxU52kEy4ROqWmwWqWy+zAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775044; c=relaxed/simple;
	bh=3cQ+ZP03L3Ewj/2E83b0v6ndkQW3CbKOn+lA3ECeCFI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+BRseNjbGSBQ9/j3x2EnwIMe3uAXGOWNbUD/5rnKlwZAdtLmkfGHFygIXQgbSjvu8/DV+l5kr7WMJCAq+I+sP3Wb9YdHnjx3ML9eVzHhxmD7K5vaG46BxFcDTk/MwzYEAZaVu5uN3xfOV1atxanrDej685wZ3fc9nA7vceCNjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b1gkyyaw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90ZcK024010;
	Wed, 15 May 2024 12:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=HHPZ5g+1VZuZsnFAIT/5
	ILcrrW5JiZeNoh33uTPN0AI=; b=b1gkyyaw16T8cYvplYqhiEW4d1bvkeEfe+9M
	esMQM/iihl85UJfippn542htZdVM8x0KEpPabs+uXgiuy0TmlyPvDyqIlEXNfg56
	MbGX1pJvHGLc4bj/TtpLxj5CRzxMirv6laaUvA8TZLPcIO0XjvTkZVS3aBVDoOyp
	75LWEQ19Sl6ws39GM/idPH3qr4OQSU02Mc2LhjkQygl31rK91dFh0ZJEkcxK+fFi
	GRXzrR8bPooollUoBH6EmAp96jo7trTBNai2B58zz7OUcvfELfDIPJjpGJm05iIi
	qmTkbIxOEY9q9Mv1fLOTwXNaspp9qCIIYKN2DbmjaiAUeieXHA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49ft2d3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:10:33 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FCAWfY032106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:10:32 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 05:10:29 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Naina Mehta
	<quic_nainmeht@quicinc.com>
Subject: [PATCH 2/3] arm64: dts: qcom: sdx75: Add SDHCI node
Date: Wed, 15 May 2024 17:39:57 +0530
Message-ID: <20240515120958.32032-3-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
References: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ulGoJMvRpztT0dNBLUYddKcuJWIQaGvZ
X-Proofpoint-GUID: ulGoJMvRpztT0dNBLUYddKcuJWIQaGvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_06,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150084

Add sdhc node for SDX75 SoC to support SD card.
Also add pins required for SDHCI.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index da1704061d58..9723b716f02e 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -8,6 +8,7 @@

 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sdx75-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sdx75.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -538,6 +539,54 @@
 			#hwlock-cells = <1>;
 		};

+		sdhc: mmc@8804000 {
+			compatible = "qcom,sdx75-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x08804000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+			iommus = <&apps_smmu 0x00a0 0x0>;
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+
+			interconnects = <&system_noc MASTER_SDCC_1 &mc_virt SLAVE_EBI1>,
+					<&gem_noc MASTER_APPSS_PROC &system_noc SLAVE_SDCC_1>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+			bus-width = <4>;
+			dma-coherent;
+
+			/* Forbid SDR104/SDR50 - broken hw! */
+			sdhci-caps-mask = <0x3 0>;
+
+			status = "disabled";
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb: usb@a6f8800 {
 			compatible = "qcom,sdx75-dwc3", "qcom,dwc3";
 			reg = <0x0 0x0a6f8800 0x0 0x400>;
@@ -683,6 +732,46 @@
 				drive-strength = <2>;
 				bias-pull-down;
 			};
+
+			sdc1_default: sdc1-default-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc1_sleep: sdc1-sleep-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};

 		apps_smmu: iommu@15000000 {
--
2.17.1


