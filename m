Return-Path: <linux-arm-msm+bounces-54654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B12A9209A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 16:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE22119E81F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADFC253F02;
	Thu, 17 Apr 2025 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhnexUgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A27253B67
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901919; cv=none; b=Ip/So9jrhGv55VDRJ7dkcXI7gA+T9+aCThe4DVJQCP26VubWG2wWarm6V2NBuGlFefUhMV5JKh+4OfDnAxiXZn5YXxGYrXnjgg/Boev23MmavwbQDt2y6avB7nUnugeHUjQhoXxQQ3AzTkLSztNytdZCBqV62sFi8f/6S19APEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901919; c=relaxed/simple;
	bh=Eu20DIUB17YA5cywL+qoXmmFQoWk+ZkjXj7+0uv0r3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b0QipSUIfLDaYnoqN/AHNo5NIQ9rpMls31lM7fBaf0DXZm8dUhs+noukHqLh2VAS1Q0TXbCrtyjN4FWf24g+rHbR5VBVDG4lKcmt7rOOckVP3CfgC2umNGgux2nTR5AZ5Ayxwb8x5dP07e5exkxBzE0uYklrdMHTpg84AF+r8fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhnexUgW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClL1C011916
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+3IngJOEAw3
	623HU6ko0Q/ihsVQ2h+g+6nJB2OaFR7Q=; b=QhnexUgW0AfiQHc6nxIRpPNKoPY
	A3N/mpIahSsqo4QS3YJd8pRcgdjvuzip8TtVE0F1YDZYBVnfTKNQ1dYIw9NOxqX4
	NIs0phtRYfqk6hsVH2jUi7fFO8vdS/C2QsnTvW4UdqBO6xr3cVsbuw6P+sQnZtDw
	INmnoU0lwZx4XLyFSxXspZr6jVa1RXh/OcLZyLQ+XO4UN0uNFG9huoNq9WdfS/z3
	fI3pMYPdrmFd8vsWcLZlmgIjsgQq0UvXkWBpzBJkaLEHAq/wgHJHJfX+tcpaJGkM
	9sQ0R6cebuVLBZmlW7msfjBFtPM/flavxtbCELbxnZB+1EkkN9NYsN3+psQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vqerk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 14:58:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2b4ab462cso7266466d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 07:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901916; x=1745506716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3IngJOEAw3623HU6ko0Q/ihsVQ2h+g+6nJB2OaFR7Q=;
        b=aip9by1VCPH9wMx2Ei0Dhh6aGDg7eU0/T4dp3EJ/UIrvMyswMYCZ1yDYDC5nMGKBQp
         vW6ukBiEePt8aIMcAZzHnuKVnt4+ip72EE7SwR+caFIoaNOBHt8xiHM9nK23UYaaY7Jg
         bLxNBiE/P3y1RmtK/6FWeQ+yJgjqubVjtt3eUUv4vbVR9JXjiUqLIzV9caH4HP8P30sh
         wkNOXuM9eHRLZLIxK+GyWI7DA0MgvLhkWH9twgV6oDZeggose2ox+Cj5KQa55ma6U03H
         1uhZk+gAo+0+NbQtdCkEgCB6Kq72DOqXmkvafjxx7JuXHKE768FPR/zh/FScc5zqfo6x
         MVxA==
X-Gm-Message-State: AOJu0YwOYj0hpUXN2e0fnYsSE8Vi/Qsrn/Uvb3yXF5y/PXEnK+Ouzb4Z
	1Q/y7ET30GsNBzLTqai+cJhJi2kaeJdijX/13eRjUJ3O+RyjLgOmhigUKKy5qpPiXE4nDazfoRf
	RIxs5f849zL+9kE4gv7/gfXxi/ExBiHz/xKxAr0ckz6fwtq50lJ9dnAc8nBy+3TE6
X-Gm-Gg: ASbGncuEXeLRnz2/FY0Y7Uw1i4lfwumgTGSm1k5JZfhvNiB1q/dPbrxvTBKZnUVqYSJ
	HbvhQyvcpV3Qg+pmOdPJM8GQfp/IWzj4/BL5GEoc6ZBzIRe2ryK6cLWM4j0eWDEWOX5SLOaWJwE
	vWidP3h5ok7jtJkCjfDyZwHmYZSqucnBWsfJjxBNxKJRYTS5NYJyTnlbMXcEiZxxz1Dd0nPbf1h
	3qgk3r/Goou6OLRxytdhMf03JTo2KtJGvH5eu2xibA1SVcnzEhPc8EgLODGMnDTRu9r4YrPz0Z2
	OWKWnFPr4t/EEt3DfM+xdijIX3ojKwlX7hJ79DDfLV4r2qM=
X-Received: by 2002:a0c:ec0e:0:b0:6f2:ba27:61f5 with SMTP id 6a1803df08f44-6f2ba2764f5mr39856956d6.35.1744901915795;
        Thu, 17 Apr 2025 07:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYEzC+4imV+ZZP89XGwx6XHE6bOBb0IBCJBMc6Wjmq/hnyGgzJNCju2FzMu8AOziBu4I/xYw==
X-Received: by 2002:a0c:ec0e:0:b0:6f2:ba27:61f5 with SMTP id 6a1803df08f44-6f2ba2764f5mr39856686d6.35.1744901915471;
        Thu, 17 Apr 2025 07:58:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm3966166b.148.2025.04.17.07.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:58:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
Date: Thu, 17 Apr 2025 16:58:19 +0200
Message-Id: <20250417145819.626733-7-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OXMiAw9fhHzVuK6uHXJpB5FU7RrtkhmT
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=6801171d cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: OXMiAw9fhHzVuK6uHXJpB5FU7RrtkhmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170112

Add node for the QCM2290 camera subsystem.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..36c569718da9 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1579,6 +1579,109 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		camss: camss@5c6e000 {
+			compatible = "qcom,qcm2290-camss";
+
+			reg = <0 0x5c6e000 0 0x1000>,
+			      <0 0x5c75000 0 0x1000>,
+			      <0 0x5c52000 0 0x1000>,
+			      <0 0x5c53000 0 0x1000>,
+			      <0 0x5c6f000 0 0x4000>,
+			      <0 0x5c76000 0 0x4000>,
+			      <0 0x5c66000 0 0x400>,
+			      <0 0x5c68000 0 0x400>,
+			      <0 0x5c11000 0 0x1000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "vfe0",
+				    "vfe1",
+				    "tpg0",
+				    "tpg1",
+				    "top";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "top_ahb",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy1",
+				      "csiphy0_timer",
+				      "csiphy1_timer",
+				      "vfe0",
+				      "vfe1",
+				      "vfe0_cphy_rx",
+				      "vfe1_cphy_rx",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "vfe0",
+					  "vfe1",
+					  "tpg0",
+					  "tpg1";
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>,
+				 <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


