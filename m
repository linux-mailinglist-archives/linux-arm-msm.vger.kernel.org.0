Return-Path: <linux-arm-msm+bounces-37029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6EA9BC71D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 08:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BF091F21FD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 07:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2610B1DC185;
	Tue,  5 Nov 2024 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kv0QYgNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF63B784;
	Tue,  5 Nov 2024 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730792184; cv=none; b=AvzCMWVWV5DkMt2QcnCOygBofOZ1DHcev2BPmnuqfWpLJHliSRHIMFGIkuovYpoibw6H0qqqAhwloziolt9JM4MP/vDTCVUWaqy5ViYAW+IKjNotacsvGSgraPE854c50z6Gr3PP4vp6sHLMvuGR03OgZr4cj2YlMKqX27rTBmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730792184; c=relaxed/simple;
	bh=6xQJBL2WzwjRXwcRVRayx451AuYGG0sFOP3XBOuCO5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kv7ikPoZ/JmxLrellTJQLCcCEcM7mrUQnnC5eraL+2TkUeBQK3hxy6lKGpBOvNc+Z2TLuMfkdVnWZIX7v9FeokPofngepFC/ZeZorTqcVPTi3qrWoSVf1LepZb1vcJwcOsx3KEZorJyk4lykDx1b+M8/CSRpMtpj3qWkqHVoEAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kv0QYgNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LJ97t021578;
	Tue, 5 Nov 2024 07:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WKe7xo3+9qSIq3Sj7gyk52yUF9NGZ/dIN3N
	sY5wWCGs=; b=kv0QYgNtkKnI3sr9MMFxn9U/gsWBmqdHI0DW/YT//98yONdlKYv
	+ZtoRYRa9prRzgccjOejX6fTAmYF64EFsf1Ia+QUL/c0iyahXrgqMgADtxMoinBp
	gQmbVRQX6djILK+GPdpwTwivPYpyK+u2fav1Za0li0dcw9o8wkihkKhvEa1BIGNv
	+GCzqxNxcl+3iRBJBAjqy0PuZjG1ethjk9SaHfcQM7bzKeZz9j3cm4XpMxz5Q7a1
	YrYFW4WIUPpMJdBZk+N4HZcELGhp1iuc2EsYW0NdZ+FLEkj0KSVhA9JxQA7Ykl1M
	HSfhwVBCW2fx/HVQL7BxiVJr7/KRyCv+6jw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd5cpr59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 07:36:18 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A57QCx4027354;
	Tue, 5 Nov 2024 07:36:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 42nd5mh7bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 07:36:17 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A57YdVh008937;
	Tue, 5 Nov 2024 07:36:17 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-qianyu-lv.qualcomm.com [10.81.25.114])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4A57aGih011243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 07:36:17 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4098150)
	id AA87966C; Mon,  4 Nov 2024 23:36:16 -0800 (PST)
From: Qiang Yu <quic_qianyu@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
        quic_mrana@quicinc.com, quic_qianyu@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v9 1/1] arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100
Date: Mon,  4 Nov 2024 23:36:14 -0800
Message-Id: <20241105073615.3076979-1-quic_qianyu@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: qJWkVX0M_vvPxrsDANXHcEsLMZdknXN8
X-Proofpoint-GUID: qJWkVX0M_vvPxrsDANXHcEsLMZdknXN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050055

Describe PCIe3 controller and PHY. Also add required system resources like
regulators, clocks, interrupts and registers configuration for PCIe3.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
---
v8->v9:
1. Use pcie_north_anoc for PCIe3
2. Remove [PATCH v8 1/5], [PATCH v8 2/5], [PATCH v8 3/5] and [PATCH v8 4/5] as they were applied.
3. Link to v8: https://lore.kernel.org/all/20241101030902.579789-1-quic_qianyu@quicinc.com/

v7->v8:
1. Add Reviewed-by tags
2. Rephrase commit message and remove Fix tags
3. Add Synopsis IP revision and put ops_1_21_0 after ops_1_9_0.
4. Remove  [PATCH v7 1/7] and [PATCH v7 4/7] as they were applied
5. Link to v7: https://lore.kernel.org/all/20241017030412.265000-1-quic_qianyu@quicinc.com/

v6->v7:
1. Add Acked-by and Reviewed-by tags
2. Use 70574511f3f ("PCI: qcom: Add support for SC8280XP") in Fixes tag
3. Keep minItem of interrupt as 8 in buindings
4. Reword commit msg 
5. Remove [PATCH v6 5/8] clk: qcom: gcc-x1e80100: Fix halt_check for
   pipediv2 clocks as it was applied
6. Link to v6: https://lore.kernel.org/linux-pci/20241011104142.1181773-1-quic_qianyu@quicinc.com/

v5->v6:
1. Add Fixes tag
2. Split [PATCH v5 6/7] into two patches
3. Reword commit msg
4. Link to v5: https://lore.kernel.org/linux-pci/20241009091540.1446-1-quic_qianyu@quicinc.com/

v4->v5:
1. Add Reviewed-by tag
2. Expand and clarify usage of txz/rxz in commit message
3. Add comments that txz/rxz must be programmed before tx/rx
4. Change the sort order for phy register tbls
5. Use the order defined in struct qmp_phy_cfg_tbls for phy register tbls
   presented in x1e80100_qmp_gen4x8_pciephy_cfg
6. Add Fixes and CC stable tag
7. Fix ops for SC8280X and X1E80100
8. Document global interrupt in bindings
9. Link to v4: https://lore.kernel.org/all/20240924101444.3933828-1-quic_qianyu@quicinc.com/

v3->v4:
1. Reword commit msg of [PATCH v3 5/6]
2. Drop opp-table property from qcom,pcie-sm8450.yaml
3. Add Reviewed-by tag
4. Link to v3: https://lore.kernel.org/all/20240923125713.3411487-1-quic_qianyu@quicinc.com/

v2->v3:
1. Use 'Gen 4 x8' in commit msg
2. Move opp-table property to qcom,pcie-common.yaml
3. Add Reviewed-by tag
4. Add global interrupt and use GIC_SPI for the parent interrupt specifier
5. Use 0x0 in reg property and use pcie@ for pcie3 device node
6. Show different IP version v6.30 in commit msg
7. Add logic in controller driver to have new ops for x1e80100
8. Link to v2: https://lore.kernel.org/all/20240913083724.1217691-1-quic_qianyu@quicinc.com/

v2->v1:
1. Squash [PATCH 1/8], [PATCH 2/8],[PATCH 3/8] into one patch and make the
   indentation consistent.
2. Put dts patch at the end of the patchset.
3. Put dt-binding patch at the first of the patchset.
4. Add a new patch where opp-table is added in dt-binding to avoid dtbs
   checking error.
5. Remove GCC_PCIE_3_AUX_CLK, RPMH_CXO_CLK, put in TCSR_PCIE_8L_CLKREF_EN
   as ref.
6. Remove lane_broadcasting.
7. Add 64 bit bar, Remove GCC_PCIE_3_PIPE_CLK_SRC, 
   GCC_CFG_NOC_PCIE_ANOC_SOUTH_AHB_CLK is changed to
   GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK.
8. Add Reviewed-by tag.
9. Remove [PATCH 7/8], [PATCH 8/8].
10. Link to v1: https://lore.kernel.org/all/20240827063631.3932971-1-quic_qianyu@quicinc.com/

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 204 ++++++++++++++++++++++++-
 1 file changed, 203 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f70a7e00ed50..f044921457d0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -743,7 +743,7 @@ gcc: clock-controller@100000 {
 
 			clocks = <&bi_tcxo_div2>,
 				 <&sleep_clk>,
-				 <0>,
+				 <&pcie3_phy>,
 				 <&pcie4_phy>,
 				 <&pcie5_phy>,
 				 <&pcie6a_phy>,
@@ -2906,6 +2906,208 @@ mmss_noc: interconnect@1780000 {
 			#interconnect-cells = <2>;
 		};
 
+		pcie3: pcie@1bd0000 {
+			device_type = "pci";
+			compatible = "qcom,pcie-x1e80100";
+			reg = <0x0 0x01bd0000 0x0 0x3000>,
+			      <0x0 0x78000000 0x0 0xf1d>,
+			      <0x0 0x78000f40 0x0 0xa8>,
+			      <0x0 0x78001000 0x0 0x1000>,
+			      <0x0 0x78100000 0x0 0x100000>,
+			      <0x0 0x01bd3000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x78200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x78300000 0x0 0x78300000 0x0 0x3d00000>,
+				 <0x03000000 0x7 0x40000000 0x7 0x40000000 0x0 0x40000000>;
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <3>;
+			num-lanes = <8>;
+
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 671 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
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
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_3_AUX_CLK>,
+				 <&gcc GCC_PCIE_3_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_3_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_3_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_3_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK>,
+				 <&gcc GCC_CNOC_PCIE_NORTH_SF_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "noc_aggr",
+				      "cnoc_sf_axi";
+
+			assigned-clocks = <&gcc GCC_PCIE_3_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_north_anoc MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &cnoc_main SLAVE_PCIE_3 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_3_BCR>,
+				 <&gcc GCC_PCIE_3_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc GCC_PCIE_3_GDSC>;
+
+			phys = <&pcie3_phy>;
+			phy-names = "pciephy";
+
+			operating-points-v2 = <&pcie3_opp_table>;
+
+			status = "disabled";
+
+			pcie3_opp_table: opp-table {
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
+				/* GEN 1 x4 and GEN 2 x2 */
+				opp-10000000 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+				};
+
+				/* GEN 1 x8 and GEN 2 x4 */
+				opp-20000000 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <2000000 1>;
+				};
+
+				/* GEN 2 x8 */
+				opp-40000000 {
+					opp-hz = /bits/ 64 <40000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <4000000 1>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <984500 1>;
+				};
+
+				/* GEN 3 x2 and GEN 4 x1 */
+				opp-16000000 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <1969000 1>;
+				};
+
+				/* GEN 3 x4 and GEN 4 x2 */
+				opp-32000000 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3938000 1>;
+				};
+
+				/* GEN 3 x8 and GEN 4 x4 */
+				opp-64000000 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <7876000 1>;
+				};
+
+				/* GEN 4 x8 */
+				opp-128000000 {
+					opp-hz = /bits/ 64 <128000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <15753000 1>;
+				};
+			};
+		};
+
+		pcie3_phy: phy@1be0000 {
+			compatible = "qcom,x1e80100-qmp-gen4x8-pcie-phy";
+			reg = <0 0x01be0000 0 0x10000>;
+
+			clocks = <&gcc GCC_PCIE_3_PHY_AUX_CLK>,
+				 <&gcc GCC_PCIE_3_CFG_AHB_CLK>,
+				 <&tcsr TCSR_PCIE_8L_CLKREF_EN>,
+				 <&gcc GCC_PCIE_3_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_3_PIPE_CLK>,
+				 <&gcc GCC_PCIE_3_PIPEDIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "pipediv2";
+
+			resets = <&gcc GCC_PCIE_3_PHY_BCR>,
+				 <&gcc GCC_PCIE_3_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
+
+			assigned-clocks = <&gcc GCC_PCIE_3_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			power-domains = <&gcc GCC_PCIE_3_PHY_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie3_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		pcie6a: pci@1bf8000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";
-- 
2.34.1


