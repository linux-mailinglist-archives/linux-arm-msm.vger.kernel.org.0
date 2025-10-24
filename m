Return-Path: <linux-arm-msm+bounces-78744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC975C06E75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 17:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BA254F8E00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 15:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D091D3254AE;
	Fri, 24 Oct 2025 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZJVQ3Uu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB2324B2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761318938; cv=none; b=Ki/VUR1G5Wzo3Cb1Z9zh2TuQpVF1IDtR0fc2Q3I1YzqvutT7nfPU9eFQ50IiniD0JwfUJmHv0GIpUSJSEnyjkgQDSsviShc0WWNYT78qSATeBk0ElZEwSeIX4135IExj70+hwcdoE8t2EHyh5Yfo/qvmzGOE5UkcWuSy2pbBOWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761318938; c=relaxed/simple;
	bh=J2aN19o7jwb9SEa8M2TN3bN5HKk5LvGHmCs51xNuMb8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cq+o21BI8Gewb4UX3wprfCKjYMjI6wuVwsXINSlazWh+2A3rewTwpMBPIz5c2xpFeynSEEFs3CF/bnGRYCiA7XqkBZfaz+70kYd4J76k6XwiuP/deudw/byCCvKZmfaZ8lw0DvZ3Ine3eVDrEZKos8SgiEeDSItzJtAz65MgtkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZJVQ3Uu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCQXhT014884
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z+IwzQ3Uq06
	kDFr8PAfKTLmPQXfd7zRBSDC29P3tkg4=; b=XZJVQ3UukcJJNecsp71Lc50Q/2M
	oMfaU4Um9Eru5jw6h0Vu7jqiTPQhnF9qFx21UwfATrn6h/YQDjEfnk7nF2c5oS8H
	Gtf6GleRRNYwLF2LCKPa5/IASe2YT5DTVSnnhilXz/unD+4sVZVUThGOK/lkR/TD
	9YziZ3fzEtP1CzF3A+Pmdqa14kVLuuqXJZJUovBwd83SCp7SveuHawJozSeYHWou
	SsjgQmcOgKs6LngI+q32nCouW6DHjokDehxyzpZlqwkd6rWepyFYG/vMJQOKXyBu
	KnMCxGe53d7Kuxz61BPep3ishkBni8rMB70ApKeMBO3SWx0uqUdL8ho/qjQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pvng3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28eb14e3cafso40668665ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761318935; x=1761923735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+IwzQ3Uq06kDFr8PAfKTLmPQXfd7zRBSDC29P3tkg4=;
        b=RGCjnOsqEy5LMWBx0WtALsnkKKP15p/8MMkYjFpZRDe4Oe5lWKQkzGOHaVVjlKk5nU
         gkG1KLddD5mgp9aBw/bdly4Bcpk/LnvvCTIXkqH6sHaFS58aR0VUuduGXVarPqpChiWP
         KSOQyGLn8dsPFUEUAM1LIyHhhS4bkxcd6ju6Uos8J8OWhMHcEkwsJa4yO0NAswKkh/Ch
         Afr46nvyoh2npM4btHE65S5YHLMbTBU5lHPZaMzolziEJV1ydU4QMKF/bYsYyVOKGpQG
         q5HbuNUr3Tlo5dYvHrTvz5FajxSvHxxZ3SJ/VBtcdxL865YyxNByNrwTgJi+EWdbJP9Z
         5AeQ==
X-Gm-Message-State: AOJu0YxKtotZ0AUqaQeE3oje0jcY5Q3wFSiDyQQ0Pj9S5NnY1CsYhu45
	Obcr3893/aQL/cvB31BDe3nefx6zTBke/c4bF8hQSzdevc5gZLHzEcegCs+zUhHkYKVFwKy+WkN
	3uGt9eOsVClFKCtgo2YKg5y269R2MPhqbXETtQFZUnHK6YB/f1wCXPSU+v8MzIJ9HiLSS
X-Gm-Gg: ASbGncsk68A9VPPE9zQ4YwCtwSep4xT1B0xD1Otp69Htf1lyxOummLxZonYnnfDKI2u
	oYjblLRaIYpxxnm8sU5+5Tp17KAi7SQH5HIFB5oIJtCcHYs5bSR94fPPBBkssEmbnCDRnleTy79
	HLF6Deq/6OLf+NDK3YsxN3W3zYvfxh+SNYph/Jr5PK94o5WnMI1MhLXhHQY32OIHt2ag72xmv3+
	G7HgDO2Jt9jY2Nh6h6wjGNiugom1F4tvrQk/2uEX34fb4uNqoTZmWB8K1ym24nGHY73rM3Xw20f
	XJV561XDn/B0QvzSvGn5echX8lpIKqYrJ8HqYDOWFLSQFyeuqTuRg6e6Gex3vlWzGB6lRjIjW/A
	RMsIDgNGcw3CCA6PwiQmmHJeIMMBG66N5JZ89
X-Received: by 2002:a17:903:228e:b0:290:cd9c:1229 with SMTP id d9443c01a7336-2948b9a0af8mr30987185ad.19.1761318934598;
        Fri, 24 Oct 2025 08:15:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7p2OrYrbtJzyYJ1tFJbtwwhpF8qXBJ1bGHImabXgMOO8QAjkXZsW2FHC4W8nL4RTm8SlWAw==
X-Received: by 2002:a17:903:228e:b0:290:cd9c:1229 with SMTP id d9443c01a7336-2948b9a0af8mr30986745ad.19.1761318933922;
        Fri, 24 Oct 2025 08:15:33 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddddc34sm58758885ad.20.2025.10.24.08.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:15:33 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v9 1/3] arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
Date: Fri, 24 Oct 2025 20:45:19 +0530
Message-Id: <20251024151521.2365845-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX7ZC8aT9vhc98
 sQrU+0XOR9tW++cCZxVLj1cG45+sE8ZsdrdUQl243m5a3lPpZWSM7KwYo3slDWdCzjDSehvlwHW
 Wpk8zGLE90Vgu/PAMMJqgZ2wDdEw3X6wcV3rSfIIMiZbDUhlzVgjzjM7CLZ2FWiaCUZg3CqkB42
 pLfgfBVMBV8jJTGwOXXq0LTc2nfF1tT1X48xaQTdFzi51mHYhGa+RBB+6aJv8EFbfDb9UUVyGEw
 rulWAwH7iFPg1XMgMVfTXIxiGU/7aO20ec6FIr9vWJdOhkzdu+yoq12BwAZlWiCXbkxUTO8j+Dw
 eZKmFou7cn9nXPbLwqs34m4BH5rhDxwXWshcmLFxozMQRruiwoNux/PaP1I8GrsIdla4RKh1Xxz
 jjvNTHvn8l2BxF6189juKyu9N4i7GQ==
X-Proofpoint-GUID: nxqiFN4siJdXTvMudAdK9J8whf3b3HHP
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fb9817 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=n1SQX4eW7R_9Zp26JX0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: nxqiFN4siJdXTvMudAdK9J8whf3b3HHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

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
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 158 +++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index a82d9867c7cb..d933c378bd8d 100644
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
@@ -2581,6 +2582,163 @@ data-pins {
 			};
 		};
 
+		usb_1_hsphy: phy@88e3000 {
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
+						remote-endpoint = <&usb_1_dwc3_ss>;
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
+		usb_1: usb@a600000 {
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
+			phys = <&usb_1_hsphy>,
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
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
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


