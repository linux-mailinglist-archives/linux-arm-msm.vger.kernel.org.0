Return-Path: <linux-arm-msm+bounces-79888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7BC25065
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3127B1A279C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE20534A3CB;
	Fri, 31 Oct 2025 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDIrYjp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZFX+4Z8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178EE3491C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914050; cv=none; b=kTb1cnLsihoV1XIqMAWZa+ti3WkwgMubNPxJra32lpGrM4PB2BT6DMjNwRxXzE8Z4F8cRCElIkrwe5bP14/Z6t+/dnSOnuSjGPiPAh8+fhPN1Hq5aOrBNyQQzoDwUOoAEIzThqoS5pInPpQac7tC5wBGfcR6nMi5f4sBxCH5WZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914050; c=relaxed/simple;
	bh=upFaUwDTtyNvkbghN9e9TjDsqtmURB0UDixiVg6mer0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=muFD9+2geWavCyvl2gX8mvo2ehQZ00jDR6Fm0lvfd1ehJirmsqGbO1JVWID90CUkp0CIfIZMVWreNVMIIVCz+2poHyDVRKkKTB49nZKXmoZ4h9C5i9uy+PG6C57TwZZ4saKlAM27YbS7EXpjIHct533AkYXJaCjqgIe8tVfbbIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDIrYjp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZFX+4Z8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V3IZDU102826
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=flReortGwXK
	vgtxcfk4GLcTVcF36ZuZkgxdI+JXLWuM=; b=LDIrYjp/IFitjRTxmhDeXdDH3pH
	Dn+Vlm46iH/RAR3cQrV4YqbRHiTfRXgY+EZRKZvkDDujnb9qfp3128Gk0a6VI7hq
	OOcvNsruQvz0G9uwe4zoqYbb85TIJ0hYupbwQTm0ULQ0jSg7vmO3NxwFw23twYBW
	q2c+X99VaFddPPAuU2pgb22aiDfJfspBsIzoSQ2dfoEQV3revYp9xtzkf0Y5olqi
	NcSZpJy2Iq7RMFNVSdRKPvqThJimrfzX2WshMx+iL96HumF1DwBwymt2FsoW/yM4
	hMX9xrPN4QPztenRD3bTlU3Hryuzl4fwN1arFC6hHyGdmQs5vRWygi1CU8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdk4wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:34:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-79e43c51e6fso1536280b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761914047; x=1762518847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flReortGwXKvgtxcfk4GLcTVcF36ZuZkgxdI+JXLWuM=;
        b=MZFX+4Z8aZC9dHxzQwk9SXf59js1sTwR/PMcX3I/F48khdbOYxFSq5cSa97sRv5cK8
         wip+S7Y89BFSdaMtwCNi137ma45r7T4JgJf/XNv9EvNzByMGwIQfC7tQ3a5WTww02owp
         iV7Qh+dTDH1uvyycjVrzvqkKFb4rMqWUfLi/rPsQY3DOMSWjx2VDFVcAtsuprfz8uAYD
         k6q3EqJ78sSBI1b5wbZ0ff+TYppleTt/XH+ZhQs4Y3IFg/WmWZu4JY1W6HixqUCkFNlm
         FlwR8vDki3HwSqf9mXJ5uELL1gqsEB4tlIXlHJ4sbzhXsdExtjg2yrnyXM45ggDTJ/FI
         FNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914047; x=1762518847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flReortGwXKvgtxcfk4GLcTVcF36ZuZkgxdI+JXLWuM=;
        b=hwseCHpIP/ZaOZ3zMmK2V3ydXycpoqXxHO+KY4/VCi6YGoWt70WA0fcgbBeX0GIoau
         LPx3ysErSJhk+A6Y2Ks1OLe52k9TVZvGRiX2EooOUyN4OPVydE8q4yZzthiNHz8XZnJz
         C52ZAd1QhJhG+g2ixJmyBZsezaoHOk3M7egM/5+pX4EBQDHno5GOqu//2uzX4fyEKpBC
         yWkA+JAfXK2qSpSw0i9+mcmFZtb5RiLutLXJM/kDoHbG4XmI4wGUfUl0sK3ZHZ4dOMqB
         g+SO5DDvw0jIUxMPwGtcGn312RriJGMCpOPnt7AosMAAeInKRGL44/B3dn8k+QNHi931
         BW7Q==
X-Gm-Message-State: AOJu0Yx5mt8e/TeWu5lK02HyHzO35gUR5QCXtEd2Wa/7fosH4dMZU78V
	/U+wgZll/dYYEBUedPv70rOEiVwC3/e8tUxjRFJ0foUwrILLFdO3IBt4p8HsptpGr1tk3K/mSnD
	t+tomtKshSoOsXtptJXF7nWCHtf6Km49VoEsVyYZEHZ+2mQfg5pd5GAhB5VTdB2efOEWe
X-Gm-Gg: ASbGnct8aLia1r9ihRRFIzyItahOMqip/GKbvQyJcGKGxdnwU70GEcsITtUmosRU5fC
	aVj4A9Rqy63RBHHKk6voysMnOkfqDPv9g6Jp1K+dJUsmRLrp2/ZOoWrQ2fUOIvkoz6hpKLvj94e
	hKd+DAwJYXzqnvrLqn49NlpPux/c80cDHGqnLQWo1xNfVpuBJoihyy58Pt7CNfeS57utD3KJQLN
	V7iMZWkEUIyjOAsqAlsi/r0E3htvr7dXa8eV+YFVD0L91/Coy/uTlE72xitDuw9OFeV1pSaYgBx
	OsR8GhP78QCwlbcNOZx7a566AlMXZ0ZHc+xPwBC1u3tuUIjHO/dT5KuJGlzoDiOJloZ9w/cpaq8
	NsPiHQHg+uFA34EBxuBWaCUbZFCdTIGUUumuP
X-Received: by 2002:a05:6a00:2ea3:b0:7a2:7dab:d51f with SMTP id d2e1a72fcca58-7a7589981ddmr5103098b3a.16.1761914047448;
        Fri, 31 Oct 2025 05:34:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqmgCkFBZYLgYBH7wquaCa+iyKQLEyVbtLP3pTNPnupb0WKHTh4W4WJd+IM0naPG7iJ1MD0Q==
X-Received: by 2002:a05:6a00:2ea3:b0:7a2:7dab:d51f with SMTP id d2e1a72fcca58-7a7589981ddmr5103042b3a.16.1761914046845;
        Fri, 31 Oct 2025 05:34:06 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8982109sm2131277b3a.1.2025.10.31.05.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:34:06 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v10 1/3] arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
Date: Fri, 31 Oct 2025 18:03:52 +0530
Message-Id: <20251031123354.542074-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031123354.542074-1-krishna.kurapati@oss.qualcomm.com>
References: <20251031123354.542074-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDExMyBTYWx0ZWRfX/P9FLEGnfrGd
 rJepZjEF8m017t9FVlTyVkf2osFHan9QkTJpdW5gYjV4vLS8dCVaYmqq5lxBPktHEFkhF/hrweC
 H+3EwtybDauLWaj3pt6peWFT3jyEW2Z9T5TqNVBdZSm2A+jEFmVpzf+D5x9SUmeiCCcRX7Ef8DP
 EArKibz/Qvt9cjB0yQ0KAmbzLWENdScwaYtvlCkYfqt+dFHlA3ZuAReJrmxFa8XITDAVmnULUH2
 25uN4irADhfiAeFNpXbvk84oJdmZEM7JukK/DWjfChK+yjeu1hq6at/wS6hAqC3Tdke4JhuLKBX
 +2vArNc+sFK3qCl9pUsYxrbqDEDA+k75ow7MlHrvlPoBCRzT5uQPx/QWMm5Yz+OvzIvsaepl6T1
 E0TcLzOXzb8H0xApKHhsqt2XAm3U0Q==
X-Proofpoint-GUID: FrFYGHP2XWVSLtri6IO3kqqAslbodoCu
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904acc0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=n1SQX4eW7R_9Zp26JX0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: FrFYGHP2XWVSLtri6IO3kqqAslbodoCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310113

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

SM8750 chipset contains a single DWC3 USB3 controller (rev. 200a), SS
QMP PHY (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is
the transition to using the M31 eUSB2 PHY compared to previous SoCs.

Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[Konrad: Provided diff to flattened USB node]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 161 ++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index a82d9867c7cb..3f0b57f428bb 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
@@ -635,7 +636,7 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>;
+				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -2581,6 +2582,164 @@ data-pins {
 			};
 		};
 
+		usb_hsphy: phy@88e3000 {
+			compatible = "qcom,sm8750-m31-eusb2-phy";
+			reg = <0x0 0x88e3000 0x0 0x29c>;
+
+			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsrcc TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb: usb@a600000 {
+			compatible = "qcom,sm8750-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>,
+					       <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			iommus = <&apps_smmu 0x40 0x0>;
+
+			phys = <&usb_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,usb2-gadget-lpm-disable;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,usb2-lpm-disable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+
+			dma-coherent;
+			usb-role-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
-- 
2.34.1


