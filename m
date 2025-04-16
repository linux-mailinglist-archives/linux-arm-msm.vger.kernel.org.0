Return-Path: <linux-arm-msm+bounces-54501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F372A8B88D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E96CE7AE931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB05524DFF9;
	Wed, 16 Apr 2025 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwUNQmN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099623D297
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805367; cv=none; b=Up6JGrxDhGydVV9QSjZsluia6skeUbxkCbcviLrr7Rx/CPy2yPLOGXbjJ1ZQUTQqGmqKKCjIK+JN5+TM6mIOr8F9moURef6Us48gKDvGtj4xjuN/Rwzr46K1yFSpntyxK/oHngyrGzMG9AHFmuFYqIiZVZ1D9dhhIv6WL6REFYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805367; c=relaxed/simple;
	bh=OqhOoI2tcXTG0wlBrE+3lgaB36K07OcLYbZIEAwMF6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fXppx0sDneGdJn53jvZaUmz8bPVz3MUoQPYF4zewbhpJewtI18i+L6IdtgXw1qeOE/kQeHOiiliFUQ8o4tjhaJ4B8vMtetHRss1BcfugUDOtTuhdGUObcrKPJLD31g0HInPzq3g/IJoCa09Z4JmERuGmW11qDpx6i5QvalGqVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwUNQmN/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mGnr020882
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TdDsbHFW7Px
	dDWoRI/tvr0I5QZItG1JmOXgwMLEsLgU=; b=fwUNQmN/gkjj/RgpQCDdiRSCKAd
	jh2aylSxsEl0e+2+b/Y9C6YypGFl+NezGxBhVjVy0MCX456JC+lWaGhkkdqu6lkL
	wcwOpZCK7l0BTZpCUd7x50Kxp2GU/ZD7IxV3oL+Rw26QCHLO8KYL9EjkdQiMY1tf
	MxHKmZaRkmKTaKqkW7pucxc6zfOXX1Uv1g4Dy41SAGr1ZJKUUEjmsD3Xt2ZZyQ1Z
	ccchDuqhwpDd6pC2ky/jTzbQOh+MshGUBawk6G7/7FW4+DZ0nrRuL0UiGgBbc6rA
	zWe9k6vn3PEumk2p2cyg9fabJ3QqSQudmw7Q71keys8/UT0vTvcfUx1npOw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69uewg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:24 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3f99583b44aso5926045b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 05:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805364; x=1745410164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdDsbHFW7PxdDWoRI/tvr0I5QZItG1JmOXgwMLEsLgU=;
        b=qpUiu6Bjqrgl6zc6yWUJsJgVFB6V/5QRv7BRRdQYHCMxSsmlSlnqh0nkohhataZ6QC
         r/NlQyriVoLomV1eXefFl3DhJDVRhzqbwkPcBGoa/oO5dXZ1TJIBm0e9PthlpqmxCMup
         upgmQ2HpH1yty3h7npnInQXkytKVHRyAQveB/M6OPxRSl/i5fZ5W0rNcbjornwOahPZt
         cUtMsbl+8SpLjVT07Za+xPCbQXRzkDxwSlf6BFjP2TILIfxMnSgReq4Kl1CiWmpbF2fK
         Xt9ol/5aTTgLxQ1nWMX/RCsIS5kc/q1YKOec2jjROqXTE3ArLlQeNNW8KrUvUmYu+erz
         +zdg==
X-Gm-Message-State: AOJu0YyWvIOVEQ16Tgz1Yjf+PjJJumf55nWsuGIqXK3IAn/BYvoqXksb
	hI9X0mq+g/jVMOSispyqAakptunQz3ImoRpF4Jy3iIs5/wq/MEtJGuNxCIqDYyoxP6T55wutJc3
	dKs8o1cpo1SS1NfYoluy+zwVDY52YchUsKvwFJ5PT13SdcLOVyl1Lzfx6OcUluSlj
X-Gm-Gg: ASbGncvZrFW4XuDbdWDZIhm8r1E7HompzXwqDgAadUDMpF8aQSBhBt04Ypainp9Cdeo
	8rBNXIJD+2HyVOb7nxPFjaq+YNNvXHq7SQRXcb+2m7adZ6ihdYSSyNWoxpbiuB1YElt4IG4Y7WD
	cGDSC6UL+0ctigPhtzLcGjOaKzolzJrAtBjVj3+793ULQ4cVaZttOO3TPjxhQyMbhvXaTraILtm
	3vu4aNE1Es8TC/W8s7p+FjSvtpD0S9hk4eIXcal/uC8TFVz10V97fDklvyeRZOPhYZO8rTsMww4
	UONzvKG2Uovp0AWrZ9g2+eewXF7n970a/MtoxqExqO7DqKk=
X-Received: by 2002:a05:6808:bd0:b0:3f4:1838:50d with SMTP id 5614622812f47-400b022e76cmr768941b6e.35.1744805363805;
        Wed, 16 Apr 2025 05:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPxwGuY2IT3x38U3lP9QQuKdo27S9+gWmKkyWLAv/MVq8s4YMRehZlhUvSkwnIYyyKJSfNXA==
X-Received: by 2002:a05:6808:bd0:b0:3f4:1838:50d with SMTP id 5614622812f47-400b022e76cmr768915b6e.35.1744805363476;
        Wed, 16 Apr 2025 05:09:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm8328669a12.35.2025.04.16.05.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
Date: Wed, 16 Apr 2025 14:09:08 +0200
Message-Id: <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qQelEd1rHQsK4Wgj1a_d6jC2xx8lmkOY
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67ff9df4 cx=c_pps a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: qQelEd1rHQsK4Wgj1a_d6jC2xx8lmkOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160099

Add node for the QCM2290 camera subsystem.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 93 +++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594..4b81e721e50c 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1579,6 +1579,99 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		camss: camss@5c52000 {
+			compatible = "qcom,qcm2290-camss";
+
+			reg = <0 0x5c6e000 0 0x1000>,
+			      <0 0x5c75000 0 0x1000>,
+			      <0 0x5c52000 0 0x1000>,
+			      <0 0x5c53000 0 0x1000>,
+			      <0 0x5c6f000 0 0x4000>,
+			      <0 0x5c76000 0 0x4000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "vfe0",
+				    "vfe1";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "vfe0",
+					  "vfe1";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
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
+			iommus = <&apps_smmu 0x400 0x0>,
+				 <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ALWAYS_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
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


