Return-Path: <linux-arm-msm+bounces-74943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD5B9DA0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4EDF7A1EFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB0E2F0C64;
	Thu, 25 Sep 2025 06:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1YZsxt+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE62EFD89
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781801; cv=none; b=KyVnfGfxIdFKG9ndf7rouv/vjHt9i7GXMF2/MXrdnAACjBK+hk6kx6zo7n1KQq2MF3iyd7wi3FDpBJKSjOXJ7eL75bADeRJngGl6Uv/HmNlj5/Dbs9NPyO16fRoXLl2To3vqF/WuMvULnwZ+UzeK500ojUJZfTqL2uKu+lj3krk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781801; c=relaxed/simple;
	bh=LIbA7RAUkeBIDw/1Wahxnh2wpqWF5ybKUZRSiQHeCus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1XCJOCFzPdfChzdXuxYJOuXDBvxnFyuIDW5mST7BWFjQ5GULR/DLHEaby9KtGKkm4e9s8K3yrojzxhztMXHqdDb1BhGlKhWpQsXra0eT+Cx0J1rLNbmIZS7Wcrg+4mqC+NwV+TITfCQi7H80zZMzMBhaz4qFdZJi+Tj0awq4b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1YZsxt+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0oa3X018615
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Agx2Jlq7unyxwL0kxfDlK4aS3MTgbllLfbRUmVSbLsM=; b=E1YZsxt+MCpOSXyy
	q7LjIjrwOWm1TiUVm2yyuymYo7ivKh3Eg94Yd/yHg4orCD2Ov94f9YDM6hPwboGL
	x1EhnHH+mX8iWOPu2yVyoq/sZBSwa5/08FTek/B/SbJDAC9WAic6YBsk1kTmATRm
	z8/x/qW+v9omX3FnFq2p/aa4muSYF7xGNdz5KSPAN7EkxWlWI2NWQYt9uJbHauKz
	Bm5ZQ4gev51s5fsZV/2rzrMjQYiKiVzWjUt6ykXrp0/K81i43Zgj7u7ZooxjEbRh
	1gPiQQxqc8Y9HR3mRueHlyZicAdrYPvx/guDZOL+8+JkWfahsJgi5f6pp9IxK7HR
	zOo70A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0bsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77ec1f25fedso1063379b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781798; x=1759386598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Agx2Jlq7unyxwL0kxfDlK4aS3MTgbllLfbRUmVSbLsM=;
        b=oE4TrAw2AvKl08Py3worIA5rMgNJzeJ2hlK3OP7pa0h9UGSO546CpUbEoo1Jh74Tg3
         /l2FQ7l1+dlsdzOazEQTWW5wCmcVF1ok3BUw/z5iNYLwvwGNGnKPlGS63hKjTiMFVO5H
         1eFfMsGlCPMPPFdCYN5nTlGmFO3fOlyvCMoc+FKBOONi3E9cof0nnrKqSJGow803kyRe
         x1hwASoW5VwQqXdF1U7F/v+cI3VUc2QyQ+YreSjJeYZiMgSm11XfwRjF96BFFlcO7WWv
         PDUQ7v9VWExF9Rdoqf5Cg8RLJKkd9xf+VMzm87JH8InFf1yRlMpJruFA+JpxbEu5iVzi
         8tKw==
X-Gm-Message-State: AOJu0YylDDHUQXG/otRVDpCWC6WiHNUwbDNO8CMQ0Lw0AFWlwZmK6988
	nlGvEKVUq5bN1uZH8mu8pislk4yAdOsRcdx05NUOPfF+FQ/YFrIEb/IhwpI5ndgTC6zxDhCkONp
	gBe1wiK8jCiLbhNmV7DZHmYLQ6BZlHm1TAZfj17UpdIJPiETD5n4M4Qndm3crG7M8NSzSGDGM/V
	Kq
X-Gm-Gg: ASbGncvRPQvx7VDxJeZKEzZCXC+k+lVe5RLypg4gZwHJY+1EFNMD2xmvlaLMBb3uq4o
	BnwwWx7nm+wBqq1L9JR0zkl2LFvWchEisYQ0p6T3natUsxIHV1MkmF7twkMM9jXmL0L0LHAI9Um
	gn3gnc9za6yvuAAvClDACMahFTU2k0gOGqI8wzHK2cqdUK6xohH8ZCsKg87e7KLerXMBxyeJRIa
	WS1wSmT0O0tYI9iqIFWzbXSfy8yxOwlVGriUrbGSODqhkn6y79S8J0I/92oNoFvUsZ64Thlnbrw
	yFi6Xv5uvU+He0ZFGzA2+9/2ia+9lBI3DdxCLIoGE/yYiO0MzrWWlIKMnsWXoYDqgdMKdXt0HEy
	OAVA4qNbG6PrbSBUwelPtunM+tF4hNqxyzfFn30BJe7jarco0IS1nRH6G61o6
X-Received: by 2002:a05:6a00:a8c:b0:77f:156d:f5b1 with SMTP id d2e1a72fcca58-780fceebcb7mr3196978b3a.26.1758781797822;
        Wed, 24 Sep 2025 23:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMf7cGGRqSjmbbRqiY7ekd1rNvpZSORHmthih2P+/OaEAu41caSdKdx0RS0yxQNdNqVjFQSw==
X-Received: by 2002:a05:6a00:a8c:b0:77f:156d:f5b1 with SMTP id d2e1a72fcca58-780fceebcb7mr3196941b3a.26.1758781797346;
        Wed, 24 Sep 2025 23:29:57 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:56 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:25 +0530
Subject: [PATCH v2 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-19-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: rX85tleFc_elNmnFNWIg1ix8Acfvptsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXyH58HCVTZC/M
 Y5oJFhoY4f4YXPdEjThsmMOOSWtEHcDyEMuvunCSN/jxv8iQ4VUlCANxuQrC72BhOemdxSzm9pK
 ygndoig6ddtO0LQNhaGgdga/VSABYOTe3Y0nv3J6xj9atOjSZYS019NJ89Ymyh0k86nR2xkOV+h
 LiD7UYymC/xhLr/yybd7T6PbQXj5gXyd442l+nX7AUqYt9ca5fdb28ahrvc0/41rJBs31qYavM2
 X0nbFEPw2fDCSRay3UVYSwZRAYOi5NspyPRSM9HBT71JW5HWj1T7yUuqiM8iXXMbM2sGJ+0bSvS
 /f7Nidup1cCxM0ZPYtSOHaO9CZEDwG7LE/tPBYzng5aQupV2aPyxCsdMnqVlQh904iPxyLPpQXn
 eOpgsx63
X-Proofpoint-GUID: rX85tleFc_elNmnFNWIg1ix8Acfvptsr
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e166 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=CvXMyPvPR3rqxJw2tBEA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

Describe PCIe5 controller and PHY. Also add required system resources like
regulators, clocks, interrupts and registers configuration for PCIe5.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 208 ++++++++++++++++++++++++++++++++++-
 1 file changed, 207 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e6e001485747785fd29c606773cba7793bbd2a5c..17a07d33b9396dba00e61a3b4260fa1a535600f2 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -951,7 +951,7 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>;
+				 <&pcie5_phy>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2511,6 +2511,212 @@ pcie_west_slv_noc: interconnect@1920000 {
 			#interconnect-cells = <2>;
 		};
 
+		pcie5: pci@1b40000 {
+			device_type = "pci";
+			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
+			reg = <0x0 0x01b40000 0x0 0x3000>,
+			      <0x7 0xa0000000 0x0 0xf20>,
+			      <0x7 0xa0000f40 0x0 0xa8>,
+			      <0x7 0xb0000000 0x0 0x4000>,
+			      <0x7 0xa0100000 0x0 0x100000>,
+			      <0x0 0x01b43000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x02000000 0 0x7a000000 0 0x7a000000 0 0x4000000>;
+			bus-range = <0 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <5>;
+			num-lanes = <4>;
+			max-link-speed = <5>;
+
+			operating-points-v2 = <&pcie5_opp_table>;
+
+			msi-map = <0x0 &gic_its 0xd0000 0x10000>;
+
+			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 945 IRQ_TYPE_LEVEL_HIGH>;
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
+			interrupt-map = <0 0 0 1 &intc 0 0 0 526 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 428 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 429 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
+				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_5_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_5_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_5_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_5_EAST_SF_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "noc_aggr";
+
+			assigned-clocks = <&gcc GCC_PCIE_5_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_east_anoc MASTER_PCIE_5 QCOM_ICC_TAG_ALWAYS
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					&pcie_east_slv_noc SLAVE_PCIE_5 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_5_BCR>,
+				 <&gcc GCC_PCIE_5_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc GCC_PCIE_5_GDSC>;
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+			eq-presets-32gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
+
+			status = "disabled";
+
+			pcie5_opp_table: opp-table {
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
+				/* GEN 2 x4 */
+				opp-20000000 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <2000000 1>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <984500 1>;
+				};
+
+				/* GEN 3 x2 and GEN 4 x1 */
+				opp-16000000 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+				};
+
+				/* GEN 3 x4, GEN 4 x2 and GEN5 x1*/
+				opp-32000000 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <3938000 1>;
+				};
+
+				/* GEN 4 x4 and GEN 5 x2 */
+				opp-64000000 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <7876000 1>;
+				};
+
+				/* GEN 5 x4 */
+				opp-128000000 {
+					opp-hz = /bits/ 64 <128000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <15753000 1>;
+				};
+			};
+
+			pcie5port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				phys = <&pcie5_phy>;
+			};
+		};
+
+		pcie5_phy: phy@1b50000 {
+			compatible = "qcom,glymur-qmp-gen5x4-pcie-phy";
+			reg = <0x0 0x01b50000 0x0 0x10000>;
+
+			clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+				 <&tcsrcc TCSR_PCIE_1_CLKREF_EN>,
+				 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_5_PIPE_CLK>,
+				 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+			clock-names = "aux",
+					"cfg_ahb",
+					"ref",
+					"rchng",
+					"pipe",
+					"pipediv2";
+
+			resets = <&gcc GCC_PCIE_5_PHY_BCR>,
+				 <&gcc GCC_PCIE_5_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
+
+			assigned-clocks = <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			power-domains = <&gcc GCC_PCIE_5_PHY_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie5_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1


