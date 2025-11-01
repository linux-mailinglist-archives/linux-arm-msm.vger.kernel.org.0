Return-Path: <linux-arm-msm+bounces-80002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BAC28416
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 18:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08C5D4E18AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 17:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753042FB617;
	Sat,  1 Nov 2025 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B55Q9TT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+cUBMbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00FB2FB970
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762019095; cv=none; b=eu0awz/51k6FYAg/MBz4QKDbM+NP9ZOu+B8IAuJ07ZQefKDIn4iPQ1obJ+oLAMUKBKT3MaDLsQPrRJyhOJwQXPyYQLwN5Wse+yg8gjdQ5LEVDCSfXCtqUTopqBDasbXvp+nAJKLnsign4y02iQ/rRBIRwloEHPoIMqb8vTIkbxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762019095; c=relaxed/simple;
	bh=upFaUwDTtyNvkbghN9e9TjDsqtmURB0UDixiVg6mer0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tS3UeNOm+QoibGvftydBtF3zDP/3x+KOB7wuHW5MhcHOT070Ihqf3Om6mPTdgARpFU2CNReAdjHuU32f2DHDbSBzr0iM2pVfirSZpYToA06nPp9wwlS5wmIXLILAHsyy0o79gUeFhgdNcGkJ1F32SSQZpln0xNGvjsoFrLM5LEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B55Q9TT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+cUBMbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A129fMN313874
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 17:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=flReortGwXK
	vgtxcfk4GLcTVcF36ZuZkgxdI+JXLWuM=; b=B55Q9TT1B/d/aZq+sau5oQHjEmc
	mZQbw0hDIJdUlp1s2UI3aXGV8SKAO2xGkHwZ45p/thaH+7nEbC/wtI7pWnD3nlaJ
	q2lhV/r83GTjcJIkaoivZyozAXf5uWLnnPOOMuMQySAdSLe1ZLgXoP0FqZ1XOyFD
	+HVCBA5pztFhrAuy2QR++opxiE0VTRxkT+kttllVCM7VejZ+3vuqXfgsqb00fen7
	vcJA8HCPP8yT6YcLtBHUBR64xgFDQdQmDxt1gWi2yS3kSbTrMtdCAFQtW9BnOBwI
	SmF5X6GHZ0Hqls9/Ic1GJfoxpYHQUvXjw1ROO0MuHi20VEPY0SRnZVBpIEQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a595rs2cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 17:44:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340c07119bfso1303387a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762019092; x=1762623892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flReortGwXKvgtxcfk4GLcTVcF36ZuZkgxdI+JXLWuM=;
        b=F+cUBMbBQjQspzISp3m9ElLyH36aWU5YfsBfUXl1zhlM1/j4RL2pRoBZ2+/QPVIqkB
         VEX7xONO6i6OR8m88MmuRxpQKhpCj1KxdszwXpWvWRgYd87EjXaAM5q5Uu5hgEt5hK+h
         jy2NvdSdRrI3exMfPg/N7AHOZT6HJJP3+4jlmI7po9uIhi1n/Kcx1QIG3AgeyqnJ5vFp
         gWa4Ur1Akf/2V7eo4r3M0x0BxY+WgYxk+GEYzJW/5j+j2xcKxkrqHXVsG2lw9ZgULew8
         m26uJHDuxTI4BN/F0wmBUcI/pgb/6ZnGiLXlYYyQw2AtWdK9PA1Y9DS+MwM4jSrnTquL
         jIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762019092; x=1762623892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flReortGwXKvgtxcfk4GLcTVcF36ZuZkgxdI+JXLWuM=;
        b=dAtoIDHdltFhGz9RGkvz5qc7DDF9lgWN794kNjFObLF6iCgvfGYBzUeliKtTTTJ37O
         nNSzcfWP3+jTuYXjqQwsFBM+urxAuYROi6/VUy9cDv/J6GJPV30pjUUfvVg719bzw72e
         9leDBYzFiMF277yy9RWq8aVGRoVrsRM0cWWp4TfEWOdjV3zbws5jn61taZkQ3xPVKk/Y
         O5+0OrCq41KvBPxx7KkCuMslQMIBBq4MBKJNmztLhrNFPqCNi3dkSBgWghh9V138cOvs
         jTveA3L9Y2L0uGjDKHpusuVnWOici21+n8IUfW4ig9CzxFqViv3RC0EKJ4G6yKoos70J
         myxw==
X-Gm-Message-State: AOJu0YwQiQGP3so5nebdwb37VN5ObaKZ9RfTKdJWmXU/l6t+M+OP9aDL
	fhzHIb/oqn9sHnE1nJQwunCbKYg0XvEFO+Pb02sjUgkaRTGV9o9Pgq+BaFV378FLKGr+0FlnNHJ
	U0Y7atANZxUjwHBbb0+YRE5Ib/vTtMow48h/EKUNeiGqsSDdFU/F9QrsHatg3URzHyX4R
X-Gm-Gg: ASbGncsnqKlAt+NaEEV1APrw9/UJHkT9yZ4n+ILDagk5z/zpSPjciSGg6kcu6xkpeDq
	vl1Jk15mvWSwF2G3yzCjdlT0j/hy/HBTzOY+q9+ibONMzGzhi963JfRSDloWuyk7sTxj57Jk2Qx
	J4zHbgmnr70/yHATma26N5Q2SkdTyZk8EbjYs6/Gb9r5kYWgadpQd/Rb50bvJ+IYu32fVefjle8
	Tlor0wwpwT/t599Kud+TsBRXtnYWFTlf4o9MvJsGpmlnhWrBrd2jqoBUrLcm65BtEQvrntuJzVm
	Enn2cz1tBmDGz+D321E03zIyoOatGUjRT3cpdxi1jFMAnNvm9ss36noJXa7ATXUzI8FotXgOiUQ
	YZ/y/bh6VhbXUa4IFIYV+CytKVVR8ceZG8Ulw
X-Received: by 2002:a17:90b:5150:b0:340:48f2:5e2d with SMTP id 98e67ed59e1d1-34082fc655dmr9248064a91.9.1762019092246;
        Sat, 01 Nov 2025 10:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjibohnZjJwiNb8EoGk6Ar/ducwMbn9DCVAyX1PwnELamKYMlWEG/QuYOwOo1p/YwS812fA==
X-Received: by 2002:a17:90b:5150:b0:340:48f2:5e2d with SMTP id 98e67ed59e1d1-34082fc655dmr9248045a91.9.1762019091689;
        Sat, 01 Nov 2025 10:44:51 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407f24ee93sm2793393a91.9.2025.11.01.10.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 10:44:51 -0700 (PDT)
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
Subject: [PATCH v11 1/3] arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
Date: Sat,  1 Nov 2025 23:14:35 +0530
Message-Id: <20251101174437.1267998-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101174437.1267998-1-krishna.kurapati@oss.qualcomm.com>
References: <20251101174437.1267998-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Bj2Rzib1sxEX2IxcHe0Ybt7R5ETNAEyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDE1MiBTYWx0ZWRfX+K3PaSxx5VuX
 vFr4aj2wTBYi8gAalinxcXF//22OQLsVLjDygf17imDvwaIlQgXwrXpDykLKsR2Oh72eJHqrdQi
 mHbzP3HE02yf2N5ZBCk8cYlucbaOEhBP9sjHT5Xq/AEM30MGcsiDmhwjA3Ha1pK4ZndwAibXtK4
 Rs2QgMUdtVIgZ04ZH8RAFbem9KomYFzEwvdLmOvtE8Tv/3Zzn4Iu7ngvAyXn3mf+puVCITdKJDD
 Z6HlzycldPBr9jxIxkuPaQ9UxtOkUxn8oDweTTyzl9gct4DRDoOH80z1V7VDHLX9qu3OB9zrN6l
 y0xr+dCBWbvUeFoUDQP3wL3Ga7oY/fxlSVWZdJGlPcQvW51aDRnf9v0fmiKUJbtG1Q+foGgnlcy
 yjwkHF6G8WGryHFP02gIKeP43acMiQ==
X-Proofpoint-ORIG-GUID: Bj2Rzib1sxEX2IxcHe0Ybt7R5ETNAEyp
X-Authority-Analysis: v=2.4 cv=XYeEDY55 c=1 sm=1 tr=0 ts=69064715 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=n1SQX4eW7R_9Zp26JX0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010152

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


