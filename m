Return-Path: <linux-arm-msm+bounces-54757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF1A93868
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 16:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A9158A001E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 14:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31F218C33B;
	Fri, 18 Apr 2025 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDT0fZXp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D0E165F13
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985531; cv=none; b=X7ypvhq24ucfKAKcI3ddhTemg5yqj49ABArbNdOB5AmLqcxc9XHAoR2JBLEDKVjRTf0ciRxvAmiOeO7BHSzuDO7rMqwi//NBQgdJwb2HS9ll73wEUoWr8o6ikYbbu75AlBDFYeIKZe/LRiKR+RnVh9biMBd4n80bITYaDE+OP30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985531; c=relaxed/simple;
	bh=1Zd3cytCKlXoV3voZ/Z7Aj3t392WLrLgaxbnoqan7mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PB2r2sNJ4ZSXa61LxImNd9K+RyG7h3GKA5o0nqiTrYO32AnjXnDDaz+B4bZmYgtt+a7t0IAXf/Ql/YGgrVRlgaI3jGmFbe0uN8BJkX0KYFDvPHmaPxJfqJ4pSZf0p4/xk6MtqVgwxN+hCgmfJWnfUhQRlTLALf/i5uadx7HFq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDT0fZXp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1f3Ju001224
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 14:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B683B+9/R8J
	0Vz6Lz9+auTHlZvFsEtlwtzftkgtEyFY=; b=KDT0fZXpHXkJjFvu+G8c0tFDQuT
	uZPeRSqm0eMld1EiU5Hndz15Iaf6qd+7rzF7HfEWcckllF+Bs7R6NESOWvqr+qUG
	p17CjuWI45PXBmrqf6WW2WTFpnF7u8GTVY9ds9MB+skc29Vbxq11R4TaBEhfRYlz
	8ZwRN3Drn7UlphfxFaHcpvWbggtYpbZErT41Va90cyxpNqWMEZ0R/FFsflQU3puY
	ZdzvLVhCi12tmidLeaqvZQctD7GaJtB6RNgh2PvhvovLYAulklY5+Lb83yMtSk/3
	zz9qa/8R8ptrV8Io51l+KOrMhWef3gMTcklyjVHYRIsdHlDFSJeFK8XHKfw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjjdaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 14:12:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so316316585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985528; x=1745590328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B683B+9/R8J0Vz6Lz9+auTHlZvFsEtlwtzftkgtEyFY=;
        b=w2rsdN/O17KCDoEeZ6qXzfUTsfVerDfFupNs+zAwygnlsAw1mE758k9TGb6vgUo/Qz
         tJnkqKNRHGOXjSEQfUvkfrdNp77qJgFwqeMutqJES86uLQihZOhY+QwEA1oOHynij02X
         lnGZ7D9dOPnB6n7AlFYEgHsLkxpFlom/MKVturjMo1iSyFUbZp6aDkB1UayBO39lWUn8
         gky6SPCJ7fMeuDwIl2iih/yoqGPAHPpTj+vvhrzO+56HN/RdtCICoTbCUpwO2Lm7+Qcm
         wdELgyKQIIXDZWbSZEFrOnFyddohKFSkIrcJcqgh3cbeUQiFyjjy304fwFyhcYGmqlLL
         fuMw==
X-Gm-Message-State: AOJu0YxyvjcXwpqKUrXXQIfIB761aZbvA69gX6eu/+LGU3KeKRWHrtQE
	FO8ZCA/zwAMgoqp8a0+IfG+KcPxfRxEhkaDB5/Y/Ewtdokm45h+ijxW4qcuNwc+Yg8JhrSWczFB
	J6e9R1C41YsrlXNZnVqbc5jpoZ3O50M12StrkllSaW/MFzvY2uFn1dE7p4gOz+lh3TH/x9bMM
X-Gm-Gg: ASbGncs+j9A8Enl0xBkPJvImYAr7HW2Tt8YsZE6jAkiCbi9qJr3Hprl4SEjY/vVwbwF
	8SNgJGgMl78zyrqMbkNgsKqundrZqItSNI7AdJFyjc8JDx8rrsPrTYxnkuHyjQKwLHgollKgZ5g
	PeVZ/fZrgS5dy7QMLL6N92YELYivKbjjsmAIrQ7dnVQsHr50m6GxwwnsmL+6pB7YaSWQ08GExdF
	tNp2HoWeItKZJpknhQJx9Ykl1LiaKOScq59Z7pDmCyUiLfXsq/3eqqtqawre/tzq2SctCUhqkfG
	1x1Ait9b5WI/AHX4vtuRUBnn07zrnVFnSl63EXPg8n7g4AU=
X-Received: by 2002:a05:620a:1790:b0:7c5:467f:d130 with SMTP id af79cd13be357-7c9280185damr492206585a.36.1744985528069;
        Fri, 18 Apr 2025 07:12:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo9LENO3ZrrNDuu9Wk7c8grYSrQvAJ66BdYsnzylxsqoJFtkFIGM8fL6BkeEucgNUIZqDhUw==
X-Received: by 2002:a05:620a:1790:b0:7c5:467f:d130 with SMTP id af79cd13be357-7c9280185damr492201085a.36.1744985527642;
        Fri, 18 Apr 2025 07:12:07 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:2dd5:219d:5008:1bec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm81172835e9.1.2025.04.18.07.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:12:06 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
Date: Fri, 18 Apr 2025 16:11:47 +0200
Message-Id: <20250418141147.205179-7-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
References: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=68025db9 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: k77EZ4WT_5Gaxfbq_plaj4KUPjs6JF2B
X-Proofpoint-ORIG-GUID: k77EZ4WT_5Gaxfbq_plaj4KUPjs6JF2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180105

Add node for the QCM2290 camera subsystem.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..e2fefa79b8ac 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1579,6 +1579,109 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		camss: camss@5c6e000 {
+			compatible = "qcom,qcm2290-camss";
+
+			reg = <0x0 0x5c6e000 0x0 0x1000>,
+			      <0x0 0x5c75000 0x0 0x1000>,
+			      <0x0 0x5c52000 0x0 0x1000>,
+			      <0x0 0x5c53000 0x0 0x1000>,
+			      <0x0 0x5c66000 0x0 0x400>,
+			      <0x0 0x5c68000 0x0 0x400>,
+			      <0x0 0x5c11000 0x0 0x1000>,
+			      <0x0 0x5c6f000 0x0 0x4000>,
+			      <0x0 0x5c76000 0x0 0x4000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "top",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK> ;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
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


