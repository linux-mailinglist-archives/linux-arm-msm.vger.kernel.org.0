Return-Path: <linux-arm-msm+bounces-55075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC33A98080
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD8307AEBF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DB6263C8C;
	Wed, 23 Apr 2025 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABawEz/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB64D26868C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392869; cv=none; b=WViQ48liYDXBwSu2YBjo+u+KJolrnrjpC45fcafz8tNXcMpd6EsHRgxk9QJUMmE0Uo5kDpn1KLE6KIGlyO5eMgy/all82RYmbwT2tN9Es11r++yZf3cWWf3IWVlwRNI4ZZfv5cQC78T07CZHRCBaNOKJ1wDhrFSo0k59+zdZIBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392869; c=relaxed/simple;
	bh=1Zd3cytCKlXoV3voZ/Z7Aj3t392WLrLgaxbnoqan7mI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TykqlODTU2P3d425OAS207lTXFIfYGs/uzdfeccwweZMnovOE/GmJxkfSrXc0C5CR0NYdDv7yCf8QjMbAyZQ3jeR+zT9L4glaybNLtDtkBQ8R6/L0UyGvIAe6+DDBvWlKhRcnidfocgteoRuAp1HmluOoQh48D0nEtTDYP2oBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABawEz/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i9Th022454
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B683B+9/R8J
	0Vz6Lz9+auTHlZvFsEtlwtzftkgtEyFY=; b=ABawEz/nCKXLAIFxNIlljSenwqi
	3U1lie7TKJkhIRInpKlGM/bonhGovDR8k+QQ59V5732tQWR+oqrLqA7mwTe/zz15
	6Axq3BlHJSdlds1kvCGbiCkRXzbfzYDvypOdyoxio0OSfnhQWk+iPKCwO0L1YeAd
	WU72c2I2nr7IhGi10/2r36fm27y0Jw8fNdfIghkBoRzipJokYgW4jHxd+tTjQHdw
	5vH4rJpb/CZHvvPTescZJ8cUlGUjuN0DILjF91HGK/Z2kweJHbGNMni4mTA9KZnB
	1yiBBYy8k8YVm7ELeJB6VOaah5F4lmBJJ9oh3TWv/r9knDfKjdHn8177/Vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh297qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 07:21:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so585274885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 00:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392865; x=1745997665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B683B+9/R8J0Vz6Lz9+auTHlZvFsEtlwtzftkgtEyFY=;
        b=HjZRd38mvMUcDOY3idY0xCw6A8wTGdMy8t9dBw9QorHYzWhV/JbZVMdJOF+v/GKRLS
         0FR+5CcOptDtUA7ZX+t3U0octgdYajaFG11C42asJ9UcW3cL1Q7CywPYDTfyuszBQINJ
         s5GNFTWojWXkagVT7tH84qnRE9VTxcOatVJIQk/nuYojpvpBM9q5XLAB1xEDR7TA2SYc
         zQagcKZuX7m9UfqjrXJyaeunAlY63ySuOMHSxqgydmMFUSMg/XDPywDo8zieR+VRPI8L
         9UFmErWJGTnNBmjjggWnRS1/r4QEshSlRbabCTMIqGeti7hLSIf88pbpf7iZ0lPtXjNf
         Mk6w==
X-Gm-Message-State: AOJu0Yy9z/0iNnoqJymYxd29V92oEU9GXG5YZyRYodnEaIcqkplAz6vp
	+6EyETnlEe4dvT4byHFpmcatdbPHHS4J2cH1sxuxlz957soH0WAEvFM2UuzHjKAmZUsECmXsryc
	58eHLSRZFuNW60y/2/tdOOuT4CKLlM7DJS99/UTcnnwLigYjsuv5eWZ85oWSNiSOS
X-Gm-Gg: ASbGncvwx2ugJdb86hLbsvY1KXu1EftTwXvBwrdipK6DdE8X32xM5Kt7DaaxItxcqHE
	8gNsdlfLcmF+6W82SoFHfytwTJn7y0Q0PXj+QtSWQfNR5k8uNZxfwgCRygTSmAUHE6Rd3vkhgp6
	qsi+UrJPf/QHLZ0r3vR8CGVd53J3OKAqACnj7c6/o62U0fCl0+jXcppIzJjLdqRf1ndKLTckSk+
	EmMnacUiJV1/sXDHBFLNJUq+6hOgoI6S2r1TpAB//I2HeUotq64wNL2/A4WrbJGntAmq7y/qqpi
	CD+/yFFPCbGBvk3IIt6mdjzY8cNjLnaQJGGVj0GyHt16x/M=
X-Received: by 2002:a05:620a:17a3:b0:7c5:4949:23f1 with SMTP id af79cd13be357-7c928018f4bmr3185902685a.40.1745392865617;
        Wed, 23 Apr 2025 00:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECt3GX1jujYZOuYeyCML0aAD6UdbPw9WeBOejlwFn8+sdFqhMMJoUnxJtiQzipVzSrLzOy0A==
X-Received: by 2002:a05:620a:17a3:b0:7c5:4949:23f1 with SMTP id af79cd13be357-7c928018f4bmr3185898685a.40.1745392865332;
        Wed, 23 Apr 2025 00:21:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm757138366b.43.2025.04.23.00.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:21:04 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
Date: Wed, 23 Apr 2025 09:20:44 +0200
Message-Id: <20250423072044.234024-7-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2OKHKzwpVKOiCKixu2Mf1ayJBL_1Mi4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0OSBTYWx0ZWRfX0m6B6jSqH5vG NlVjE0Z24RMf0gaM3AkYdCdv8V2fUFxR7HeqRJ5GH5GWQsPWYfr/VDacnzhV2PEPEvhGZf3m29w GVv5iGXEBu/VwpJa3d1ohiGhVwDhvcBuGC2NEkH7RVZpjUD2gjdLGv0o4/xNRm+2qnVMFxlOP3i
 ZgtxeKMfS5LLL9/5t5mux62thClxb8CmqYnBJFEDrYF9AYB7ndU5j/BldzMP5YmUv/3XS4bbh2Q NjwYiT1RIRfbetlSJcVdwP45NgugybsBb0dIgqjz3ew0xfX5psVrk6xPq+zWw4igL5DCLNACUFE MaR/uGmzqZ3NQTuPUgfPDIF9HP6UTiksod+AEdCHF3WoKMHak7SxWJh3iXNcpv5sUh0vhDs3/3C
 FdFSqE1um8yMCiyLcG87FIRPmHqp7DzmgCYmnSIG0xS2gyhWX4Di4pW2Lt2OP+/iZ40FGPhZ
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680894e2 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2OKHKzwpVKOiCKixu2Mf1ayJBL_1Mi4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230049

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


