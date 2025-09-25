Return-Path: <linux-arm-msm+bounces-74968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C72B9DB22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACCC47B1F60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E012B2FB613;
	Thu, 25 Sep 2025 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyL8gUtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F9F2FB0B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782064; cv=none; b=VHrIrejkfS/Er0KE3jfycOTBCZP15vDYXdK597xpA19yv24sOhxGmCQ/V2AaMxxQDzDcS1Jjyl1erKQlLSgGVlgqmvxujxw5VqlwNE0YhF1cvD6Gd9woqm63MMCHjb4YYd/x8j3mUS2SXKly5NPKyZXuiLcVJaw0FDkxaDEunmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782064; c=relaxed/simple;
	bh=LIbA7RAUkeBIDw/1Wahxnh2wpqWF5ybKUZRSiQHeCus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arOLSByhiNWffGW/tjHmW05jwJuuDH7q8rtIVvKHX1WrcR62yNbCP95T+AliQMQlPDNT4Hd1sr+EOf3HDIuu0JzVWJQ1Es0F83K6w4y4wHFSp9z2nODDERUa1HqnVO4gfZ/4iJ9lhOdKoq5t8Uim8zDbf/74ZBGLNdueAWrsUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyL8gUtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0XWer025358
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Agx2Jlq7unyxwL0kxfDlK4aS3MTgbllLfbRUmVSbLsM=; b=YyL8gUtq5peZcacr
	WsBCEK70ZXDi/BuoBRpEPReGvmAUl/yXTDauD7Ha0GdGAjpA4cXLrG0Sqq6q3ktu
	pISm2KmmGei8U9+MEuqoxXRYQKgWdjo6FRLTPVbvQ9nNxitJATiIkhoxgop49Dwa
	CHMTm+EPcD1loMrCGQPR/GIEYUWM39i32rDH5GDp0TTaJUFb0MoYNacYvl6oQzkA
	jV3odhbZO6n+KsiGYbh7kl0n0eLjJVTWuDq/fIvTemrC3+7O6ejvQH/JpFRUn2pu
	eceAijsYtSfW4EpmEb4FJP9zZLBriTFEPoZcd86ueB1BxLQqy+5KPJyOe7BXr9MS
	PLN79w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeyc1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2697c4e7354so16553425ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782062; x=1759386862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Agx2Jlq7unyxwL0kxfDlK4aS3MTgbllLfbRUmVSbLsM=;
        b=obfPNXo/WyJQ8H2ZzD0FT0q1xYWacG+0TQxvr3hmNEqNNvBbq/R59aFU89bjBuW5Hp
         9zz7bgcKrQoXF1LZN7Rw61d8CYpKL6SCKWwxPe71UxJbqrpignpAIbnmdLLaqzj2Hl5c
         YDhlCKj0DeSGEl5pL5ti4DAtH+6G3E1koqnJTSixZKS1dxHlkvn02nCQlyNAPZCymdR1
         XwiC3Ok2HAYLfNUPSaxLnWAcABvi/vfaCEIX1RhBSDYgzvZCIJBRwg4sbeDtNPbcAQGX
         sL9xjKUSxbe+kyCxaaiDVnXFRqgr3hRBT8c+T3Te+CUBv1x2bBaot4fbxLB9A7UndwTH
         lsbA==
X-Gm-Message-State: AOJu0YwZO22Te5O7CYtpwZq/lW1M3ZXrmlTVAo2B1KJvCyjsi/5+SAPp
	lKN6QxSVtlUzeq8dZ4su/1RlI/Dj+sfC1Nc+DgmPmk0Me2YGEAY7Fg7BexUhYvU+94CFUSYW/d6
	ZDDHXXjCwiphg/dLbuZrcdGA8D4i1SdeJBEWbq0tYpMpw+TIom2z/96hZfksWF71ydlmh
X-Gm-Gg: ASbGncu+sL5AMthLPMtoBQWuEU9FgHxXSwDFEpXdvGJrXg1m9XKTB9DxwA0FClWIiBl
	jj0Td0W1MYOg5wPO3vPoTDtXUOfbKGhsaHkMqsQF4YqDNWIO/CWsXLklA4NXYiwl/sNAZrUjdvf
	GMjxo7NhxSbvn1m9RVDpYsK5JmfaZL4TNbmj5lcKF6z9hGqC3p4bTWpPNkDH6pV9DXOb5eichq9
	I5pfaRs+xRvVO8w0Euu9GoFD/MhuukYSBSz0CFN0AHSsLzNthMxcFLfPAWf11usVAUQfr872i5H
	9Vy5UnCxJjhEBQW46YIfH25EPPoLbBR6DLjJxISLHiEE6ohy/PliBKeVWkHVjtXfpHbOabFrSvm
	RJ+tZ3Az2KM8XdoKhyON6ZTruJ4pCr0rpoYpKrH6s7aLlOrw3/EZ9glXBVu4h
X-Received: by 2002:a17:903:234b:b0:269:b2e5:900d with SMTP id d9443c01a7336-27ed6ac9420mr18065955ad.5.1758782061505;
        Wed, 24 Sep 2025 23:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9hXFeGhx9lwr0WTXqzekeuC/e6EoA5JvdWt8Jolx2Jf8qbsZ1xPKnVVw4g1NhSpq5ZI5hiw==
X-Received: by 2002:a17:903:234b:b0:269:b2e5:900d with SMTP id d9443c01a7336-27ed6ac9420mr18065265ad.5.1758782060485;
        Wed, 24 Sep 2025 23:34:20 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:20 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:27 +0530
Subject: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
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
X-Proofpoint-GUID: l8iIrw-DVe-QMi5bHLtlMP7cA5NOlBaG
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d4e26e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=CvXMyPvPR3rqxJw2tBEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXyITby4QCK0kT
 5fmWGrq+Xx5nyloeHus672C3Nyoc2AYZLFVGhxo6R19SdfWB7347llH645yH7IRMiCGqEzsH7lZ
 Rgj74hhAumVuqShhYyaT102do96fgKbwHkUdxn8q383hqgAcS3ycm7aISXn3zR7WMzA7b0vikAB
 3DcXwdNi9iwcD5ZiVmv8IfXQ4w4EzvuDUh3yP0I3orDlcd9VGsNsnDPQ/yeWyCUfxEbv6aqPorO
 Znuu1NUOlxVEd8OLcBUt8EzqwGWqOhU5aOhKkd2s1eMe4gOuyGcGNzrDXnjN9KbzeiK3PqFmkAr
 R9YgTCmTnRPJc3slQoYdY+9lSgvI6NklAeWwOnbl26yGQQwVDTyuMu5zWnv/jnr8Vi16cnNhlDg
 sLXkVvx2
X-Proofpoint-ORIG-GUID: l8iIrw-DVe-QMi5bHLtlMP7cA5NOlBaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

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


