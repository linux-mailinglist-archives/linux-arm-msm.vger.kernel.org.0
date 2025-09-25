Return-Path: <linux-arm-msm+bounces-74815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23734B9CD68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDB133BACFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D071A238F;
	Thu, 25 Sep 2025 00:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vi4zLkGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FDE13BC0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759460; cv=none; b=Sx3Sr/pzdTihsRa7vUxiE59V3DcpuMj+73c5ujGYke491OkhNcYdR17Uuef+/7DcnUswIaO3RH998UqD1fwfwKBE8tVGft6nHT0p9BT7p5AUTyRaPWHusj7xhWXE9YGLdrsH4Y8W2VBR9JcUiOl75xHMSq5JAdYwsIMJ4gGxn+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759460; c=relaxed/simple;
	bh=7ormL0LuZNajy7+OXUp/DpGtny1w51nUfnlJsJF8/74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptMpSWZRTiNGV8tKGI1siq2KGA9HsdJic51H9dcTcKdVMDFaDgFH3HcQFLBeSjPDvP2ufKf9JUDnrYzeGnerbqwrLbmT0qBvTVlWCzOSM4HdYdu150apMPfRFhtdTco+/WKBXydqGqmI5O1HH3XGFpGK5YLdzHmVuC/xxF6HEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vi4zLkGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONaxG0018026
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6G956MGJ+80kTDlnB+OiVUBMqMprWRMmfSRYK/4mMD0=; b=Vi4zLkGA8IopbM+a
	YR5qD1RAIIJutsx1uKWI25GnZJhriGfMqr9JPAwHC/mZ/x1QjZU+Ko7+RWTkEQ2+
	VHcxsOMfvGcUetygdKC9+cTQQYcOQDzEy2UNzARj5LzM27gFhMzLDEiryzQL/DcO
	Jl6coOXKVaXsESwCHKn4NXeDK7nDV07POgVWhjFdOEpoKN0C2yzZlPya8Ucz87UN
	L4n69ORiye25/oE6augD59HrhRHqJBqawCYog1OjlpS2qOECFX0GcwEL0cZCiSIb
	v5QMVabixwrhRqKXMmPU2N5ZS+jISa0y1TYhztDHnCIQAhA7Dl9xn9UtXnB2/xN1
	QlBAlg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka3y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f18d99ebaso290619b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759456; x=1759364256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6G956MGJ+80kTDlnB+OiVUBMqMprWRMmfSRYK/4mMD0=;
        b=Qiv4kW+GW7aK6DqLwTYro949F+zofZ+cesBsb914kTitjAiSIjeQjppQvBvK3+5Sem
         5wLD6vMFpNltkgMQRdMG5RLSZKBn1CAlcoKjwBxeZtPvnc8iVb55MIM0BH2iHsaLyHNs
         qSrdXlnExUeE5OICKqTaaimE4hzzhd2Vka0bimG8HuJQp6i1QDkX55SdRvsbsd3AOx0x
         dSyFa9biN+2Vx44YCqdGY5qu8vcJOavyHGk7bvPhDRLFfV29LNaxAilvT1yBTdZMj8Rs
         rIPN7w/DkcfhnuHnf0XTZgAfFU8hFzXnm5VbBx5AED+WiY8t8auF35MvopGCAyHO2GJE
         u8sQ==
X-Gm-Message-State: AOJu0Yzn/w7o33O0LDcKzXe09wfyGVrEKJ0Za5vq/8zcPZgGYwVTGDm1
	9f/nFZAXvQuQghbHPPWGtKkIHVv/pjdr80lGj7bVqtCIYm2QOKjc7mu6HL9Ija5aRwcIoQaWqFr
	HtmpzPK+3K/6FKUjgsuwR8x3EWbNUeVMRTU66tT6lLirbFlkqjPaywH9e7ajc5IuXL+8j
X-Gm-Gg: ASbGncstocOiW0uNYz0p11WpcI73Kot7Jl0mfGyejFi5KacDLW5Z96G4+3VXaSxbg8t
	Sniox1pUUfeXLneeismbn/U+ueI4MOXK2CF5mpyaj6/Izx+dpz/8Wk4yOd7FynFiilzhFEEHjc8
	Qjc5iRkDu6hwBA2nwCrtRGTaWy/ALDr76LKn4vPWFDosfRs3CCEO6iGbwMxLMj19XvbmClVQavA
	KGJJEWEpl0cvghtXm7hqgNRRGn72LPnsBYEQWJssdtVmkKDIUuO+qTX9xMJFLyZ1AXJ8vTlHg6n
	ncDCcd5DkqzCcrsT1nVOuu8QR0PDkG5DjBSbPvWIEIbd/wM/g8X//ZeDalB2/+hsZ3Va7f6f84y
	qFdmgpbtvNNGgXLo=
X-Received: by 2002:a05:6a00:4fcb:b0:77f:532f:94de with SMTP id d2e1a72fcca58-780fceba4e2mr1868061b3a.26.1758759455844;
        Wed, 24 Sep 2025 17:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtey85IvgKiVy0qGIM3Lf6JscmVRfg0FcCe+8QOKk3KnV2DekatB5SMGyz8IBtwDt/2F5q3Q==
X-Received: by 2002:a05:6a00:4fcb:b0:77f:532f:94de with SMTP id d2e1a72fcca58-780fceba4e2mr1868028b3a.26.1758759455361;
        Wed, 24 Sep 2025 17:17:35 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:21 -0700
Subject: [PATCH 04/20] arm64: dts: qcom: kaanapali: Add support for PCIe0
 on Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-4-3fdbc4b9e1b1@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=6097;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Fe+PVfwLGjDmXrXePpfobS5nH5KwCiqvr36m+lEZ4yY=;
 b=e6D898LOH+hv3CjJqPu6+hh6StByQUTlCW3ZwlpBJgp8dGfVNS/UFyFWITcVeFIMTME+gFWk4
 qXVQWFqWdIOADKUjTqNhqiMmxgZwzhKaHKHnUKpI3l6X4odn+rNFjry
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 7DwMPp0lUxJlh7jYuUmyt0X4pzjqkpXS
X-Proofpoint-ORIG-GUID: 7DwMPp0lUxJlh7jYuUmyt0X4pzjqkpXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXzSvMdqJ/5ln+
 hI/2KSJ8WZTC/HgcXY7eWY1/GXNzjaRfLR4Q6h9W2daFU5R+8eBt5OpEAdkkFOuxeP+vjK8WiA8
 r9CNgjRc26Sp6VOC3jFNOMHxp7B/muwpfb0EpeaAbN9cxzt8/YcnhZ8xssSdTcgcsaKWQ006qVZ
 ADHEqVybwHqZW042sD9lKuXpcie7K228YphRhQE7mNfy4NeL4s4GmHufTMSkvyNAO23bnRjwLhe
 FFpV2cOQGRUfZ9wLjm6n3Rx/aFmmk5vLdM4EWNx7d2NQoqdzLFn46JHuFOZPuRC24okMO/cnwff
 ntdVZffLBR283X5szRnbwUoZmZfaBl50C19rr2HmkhkEy0DAMXtEVbUTR9V9wKRwzrmpWyXd6sC
 eWxMRTcW
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d48a21 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8ZHTqrLIFuk328nbHdQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

Describe PCIe0 controller and PHY. Also add required system resources like
regulators, clocks, interrupts and registers configuration for PCIe0.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 182 +++++++++++++++++++++++++++++++-
 1 file changed, 181 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index b385b4642883..07dc112065d1 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -452,7 +452,7 @@ gcc: clock-controller@100000 {
 			clocks = <&bi_tcxo_div2>,
 				 <0>,
 				 <&sleep_clk>,
-				 <0>,
+				 <&pcie0_phy>,
 				 <0>,
 				 <0>,
 				 <0>,
@@ -561,6 +561,186 @@ mmss_noc: interconnect@1780000 {
 			#interconnect-cells = <2>;
 		};
 
+		pcie0: pcie@1c00000 {
+			device_type = "pci";
+			compatible = "qcom,kaanapali-pcie", "qcom,pcie-sm8550";
+			reg = <0 0x01c00000 0 0x3000>,
+			      <0 0x40000000 0 0xf1d>,
+			      <0 0x40000f20 0 0xa8>,
+			      <0 0x40001000 0 0x1000>,
+			      <0 0x40100000 0 0x100000>,
+			      <0 0x01c03000 0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
+				 <0x02000000 0 0x40300000 0 0x40300000 0 0x23d00000>;
+
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
+				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ddrss_sf_tbu",
+				      "noc_aggr",
+				      "cnoc_sf_axi";
+
+			resets = <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			power-domains = <&gcc GCC_PCIE_0_GDSC>;
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
+
+			operating-points-v2 = <&pcie0_opp_table>;
+
+			iommu-map = <0 &apps_smmu 0x1400 0x1>,
+				    <0x100 &apps_smmu 0x1401 0x1>;
+
+			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			#interrupt-cells = <1>;
+
+			msi-map = <0x0 &gic_its 0x1400 0x1>,
+				  <0x100 &gic_its 0x1401 0x1>;
+			msi-map-mask = <0xff00>;
+			max-link-speed = <3>;
+			linux,pci-domain = <0>;
+			num-lanes = <2>;
+			bus-range = <0 0xff>;
+
+			dma-coherent;
+
+			status = "disabled";
+
+			pcie0_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+				};
+
+				/* GEN 1 x2 and GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+				};
+
+				/* GEN 2 x2 */
+				opp-10000000 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <984500 1>;
+				};
+
+				/* GEN 3 x2 */
+				opp-16000000 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+				};
+			};
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				phys = <&pcie0_phy>;
+			};
+		};
+
+		pcie0_phy: phy@1c06000 {
+			compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy";
+			reg = <0 0x01c06000 0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE_0_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&tcsrcc TCSR_PCIE_0_CLKREF_EN>,
+				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_0_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>,
+				 <&gcc GCC_PCIE_0_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
+
+			power-domains = <&gcc GCC_PCIE_0_PHY_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		ufs_mem_phy: phy@1d80000 {
 			compatible = "qcom,kaanapali-qmp-ufs-phy", "qcom,sm8750-qmp-ufs-phy";
 			reg = <0x0 0x01d80000 0x0 0x2000>;

-- 
2.25.1


