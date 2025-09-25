Return-Path: <linux-arm-msm+bounces-74817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15F4B9CD7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACABA4A62FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB8D19C553;
	Thu, 25 Sep 2025 00:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzFpf0jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE04019F40B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759461; cv=none; b=BwIs+cFfUKrbe7hnmbmbyiMM1XGfD5SFicogQmlIUoP0UCo73c8yFtV86ty8zNj/8+eMcjo9JwyIBPAC0P5gLoNIyD/NIa6XeRK/Xn55mm7lA8ibMIp8U679rBkzke9V5unFozZTOnqSbwfdjslk3wOknpNEibJganBzCR/ZmXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759461; c=relaxed/simple;
	bh=btLUTtNG5JoWnxwDPIqHxdM2OEdUq/v1ScItSjsqG9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dC3izppUpzeaBmsXeX+shJJPffmyxipFf2cInxGbGWZ2JA2XtPzHdOGGCnZhQaG/KZzIyfMfRjIZEk176qBokz0YQqoO45MgDKG5Kra9d2vH/cN5+qNfxK13eHVbrdm7KYK5Y8q/pTx6JKP5wSeUPfsOMn8eG/u43+lGW9yvbiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzFpf0jp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0FJol025129
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRuCq7CdXqaEeJXm40QabyRKEPowjtauBb1dauAj29g=; b=GzFpf0jpGpRuEqpu
	2kZsLL5o7q0sI7TOAtxujrZxhgBRLSlgzWuAYR8hxXQmxtQhwRmQFvQFt/T+BCyq
	cnVsyL2HwaNqLGbBXV6dv0TVu2sLBXTx7eMTba3/u5bKWC8Y04FLBSpbWLVnjiJL
	BsDGOAui2O8bT1D4/NPTLlW5BOsnDT0OpIUOwYDlaeu17iSP0CJDxM+0Zdp/EAuH
	rhMb1U+u9FxRgc7JQJnXUcQHgjW7uRm8Zy+OD/1+aJaQLqk0aCs2rib79EwAzfYj
	6DA4sxmY2wWinbUWFoi+1TK4ribt8naVbMVOKco0jvoy8XHDU/LThKC9ePgIo5MW
	DT41vQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv165t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78038ed99d9so554007b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759457; x=1759364257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRuCq7CdXqaEeJXm40QabyRKEPowjtauBb1dauAj29g=;
        b=ofOJmm2ttWXifNyQj0eVvPRrSyZ15WuKwGLzQ8w6/JJF3r4umJ+7OzOUuV8XtTgq59
         haxINowFAez6tCPH1xJxpGFeswutf9SHhJmUHm4Yb8Nace92APr5Ya1agRPzC6XC8m4n
         Ey1zbNECXNHS9sqqN+2Fk49Gqt9R8D6ZfzpxljxoQuesxkrvAYDAHeuRbjcq79BFIFX0
         VFsE62wOGtcTsnGW338TCuZkNoIl3FdcjZInAm0/tg/FIj1ZRkdwOThizJsx2H81bOvR
         P5lMbu3QHo1qZs1kzB60tHPfTUQ/mmG+LnKdDukdx0b+UVO3kmIwRioDDTQIm5ktpeHK
         Epgw==
X-Gm-Message-State: AOJu0YzHPsxK1HQRVDMGxjY7C5/3Y3vsglV4JiBo6IH+MauT95VX49zO
	s7r1DeUI+doyc7K3tbQWRRoRnQz/vfVZhvWwV99TLk8DdQq6kZaDXamPP0fOiddjDcLFao9+8YD
	9Igu3Mog7n5DEY+Y7RpD6epLKAjTFYErQYySI4FiuoTDr8jYv3CktZgC/LV2VUSUOrsQ+
X-Gm-Gg: ASbGnctk/wMHZoDsfnWL58wUaLyIXQysPbgigZAaT8o60Jr+oXKKhXNQmGVYroNsD5d
	+lXXPEUU3mZweDkl3MC0AlbmTAs+rLEBD90iGTBlqrtd9T5R1v+0Dx2ABBPsrgP7QoF3Pa8AKS+
	A+kYZCZ8Sen8bv8ZOl0l/ExzQ8EmmyioLh/8IO5NmGSE6nNXQcoArSWL8WJikBW2EiRlFCEMK8l
	2kdFWefTPDFiOiiH/3m7R4xEauJ/eHZvC2UKO9FhFoe3H1Q0hzIMJsh+cx5CmWfr0l5mlnO8RIp
	eMGW0ra1YRCHqCviDGrE/VI6OXWqJlNjFr4QxVCFqU9sa2dMW8a+deIN+e/i8mjUAmxh8HCSOFg
	xJFxwI0dmuY5wLms=
X-Received: by 2002:a05:6a00:3d48:b0:780:fb24:e93d with SMTP id d2e1a72fcca58-780fcc82816mr1725802b3a.0.1758759457174;
        Wed, 24 Sep 2025 17:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BrJiiix5rqTO2Ug1qclnDWToeSTBA29x3FvK/pXHK4VeLpOAgYcuJIt4G8xosrLa1nr40A==
X-Received: by 2002:a05:6a00:3d48:b0:780:fb24:e93d with SMTP id d2e1a72fcca58-780fcc82816mr1725773b3a.0.1758759456685;
        Wed, 24 Sep 2025 17:17:36 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:22 -0700
Subject: [PATCH 05/20] arm64: dts: qcom: kaanapali: Add SDC2 nodes for
 Kaanapali soc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-5-3fdbc4b9e1b1@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Manish Pandey <manish.pandey@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=3406;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=4fVfjSvZcQS+KYeJCPCrX//HlUCKShoKtHj8bXIt8/Y=;
 b=NKNUkggaCyyf4BVa3kCocTCJVkjwc9ShvOu1RjkXvOX+lESG+4zWO+JSOczuhMZgxPJd9XyE+
 zo9Imp+mxgzAmPJupZ1Ovv0vrWemAMj6CygDgdWN3IfmtViHo1PdkR5
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 3WDmt2DyFiifB8xZ9uf56K5UBpbHinSg
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d48a22 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gnUYCYxEF1sk4gvoTOwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX+xiFXWjMqrIC
 Ermvewb0vidmzGyQAAjTrAIN6g2lICuGP45JxjOlwXRym/N7WINJffWS2AutC5LK6lfkvPeYRs5
 Fo+jJWA6qMzYpEGfOaJ4nVL27RKyLYu/0ILolxR5pjPKUQVXB/EyICqe8kqwV0QQlwkqM6ZjTQ5
 MHDq8Db4sweQiSqYOuvBppC/dFPpfYlJvVgWjPO9xIeVIrm2rnsrQPEZXzr/3k7PdiINyc+ljQp
 jLoK+JsUdv6waO8Hpr8di47MQRirzOGXz5pUTFIqbwDVyDeXoIe+hbQqv2K7PcQJ6zKKS7+24aw
 AVT+jy8TaMkhM/fibc3c7axlQvGPdyL2U4BgRS1glqNldijfmxSGWJ3mU8UyKwKwYotj6fcq31K
 Bcd9XxB4
X-Proofpoint-ORIG-GUID: 3WDmt2DyFiifB8xZ9uf56K5UBpbHinSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

From: Manish Pandey <manish.pandey@oss.qualcomm.com>

Add SD Card host controller for kaanapali soc.

Signed-off-by: Manish Pandey <manish.pandey@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 104 ++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 07dc112065d1..ae1721cfbffc 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -908,6 +908,56 @@ lpass_ag_noc: interconnect@7f40000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,kaanapali-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "core", "xo";
+
+			interconnects = <&aggre_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x540 0x0>;
+			dma-coherent;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <160000 100000>;
+					opp-avg-kBps = <50000 0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					opp-peak-kBps = <200000 120000>;
+					opp-avg-kBps = <104000 0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,kaanapali-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>,
@@ -974,6 +1024,60 @@ qup_uart7_default: qup-uart7-state {
 				 drive-strength = <2>;
 				 bias-disable;
 			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				card-detect-pins {
+					pins = "gpio55";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				card-detect-pins {
+					pins = "gpio55";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		sram@14680000 {

-- 
2.25.1


