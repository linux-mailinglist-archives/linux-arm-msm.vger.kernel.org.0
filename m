Return-Path: <linux-arm-msm+bounces-63998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7643AAFC5C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE393A7373
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4532BE03D;
	Tue,  8 Jul 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYRhXqmR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860142BE022
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963564; cv=none; b=P2uhutc21sy6d/v2SQKh4pGEeX0DfxC3pQFp3XTga0oMp1DpHpoXsvcr8Rv0bLhXRbL/37BckmJPEUmgDvovH9KjVc/kmtQHfWVe1zs1eJtmTkchFcAdrTNOCggjcvy15BtgrEQXKMB/j58qK1K/1fvaX4TXhjJZk6Kl9PI+xYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963564; c=relaxed/simple;
	bh=qec7WQ0nRrWh3diBjhh0sXqyofo+2eU24USSC2XNtXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jTOszPfsFN+Q0BtMAsKKQ67VTGFQtaydx9OGt3w1Oc0sWwwr7mjuQiIDyA3D9f16Soq/XijjzgfMG2URL5rw7ih0iPqWFuYy9RNuh9IhBjo8FPob782lKWwe+8QCh03KTTc5msl9mKvEHtz+9Zcc2hAwSHB1VjqaV6BcIYPnr6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYRhXqmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5687Annv025600
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 08:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9uktFifMviJ
	JC68UphCtN78iNLvndREyI0IZ+30nxEY=; b=cYRhXqmRwAzu7XsYpnIfVR08dNB
	t6J3WRC5TbReBWttSH3MZko9jd6ZlBtAO+EkL1SFPg+VsSl7HEEeuu5fEqM0smWe
	KsT1/sOP8bZ5AHZEEE9+PYPSKi6cxASW44iQvugB6yKKEpwREQVSctUP1O/+FJ8j
	e/cABOwpNz7BWm6sU9DCP7eklv+hFmIuD6jqKEhjtIkps5bqgnExzYEIOiAaZx4k
	EcIlibOFMCk8BPJYu2G88u4q/m7XXaZ4jkEcsdlY4oaLNrhr0gFPRhimy5jXdk58
	3/N9YynuuLU6fJ9ZMmFMJCjSOofPTlzXpzNoAF6tLdG0aOSz1lEKNj2gXwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qka56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 08:32:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d880e0cc9bso281882785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 01:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963561; x=1752568361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uktFifMviJJC68UphCtN78iNLvndREyI0IZ+30nxEY=;
        b=HHg1C65jT9Vc+RJ9ckwF9Y5FutaG+BsNxVBZnMRzYs8RWmFwGcfbd8MpzbgIfSP6XY
         CSqCsqihD4EP03o8kGnjVscaLpnjukMI+IyMaSYJg5wGDmcJUM6zfBbCoMsWwQW/78lO
         rvRWkvWgXvfp1kgVgQDCuiepPuHG+vrPTwtnn6aJJEIqaDePgzGO78aC1J/c/QbBxxrv
         F8PXqbqZ+/ZXdiWN64WrVGdHPPq9v2PC87zqDD80N3r0k83H0IE0MTDad1Yd29t5nWPW
         qHbNrK7FGqRkgjYNENcOPR9ks1fIxT3sRKII+FWHz9BOnpYsZySWw4ZAvcNxPpCuaUBm
         Bafg==
X-Gm-Message-State: AOJu0Ywh4S+uIKJ22fLdkgRWa6srFYch1alQo99gd6U78r1eZ+KlGw9w
	3zaGfuH/7lIzBGTyiSBM3ACVY4kAlMl04XQe8gGZT4YB3+c6eKFF458RG+r9Zl9B93G20IqCSJ8
	M57NlbOrTtPxE4I0vHi6a6BNERFBvNfoMbB65o/Zb8Q/2C84WFiIv4HCLniEjXFYIEkYH
X-Gm-Gg: ASbGncufvtR2MHEih2bAMavovA0Gk1f69PVGki1bka5cSRI3V7PNJrIkCk5PIdaAoOI
	4ZlPn2uTKrz0V10QY+a/8+JenL1AMWRby02hBcr6tq+UYWzF2lCryJ1hcVkNrwWLvNNbz9R7bsw
	ydW6YzjWfek6vCD0NIlnY5tHgxszqm8+cc/vDij2psZqbGx4k/kH48kp2CoOtLwAAPWj3cwUNbs
	XzAeR6EE4Otgv8yu0KXKk86NjvABIMp1snwmllIuxKQEfphmX9r9QVSkRacFxlnDFp6gAb3rIVJ
	l7AZpjZn3pthkRNH2GunBOZvUyrRHhzbZbY17Kvdjgi4gMEP7d/I2wsuSg==
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5dcd0a63cmr2146625785a.45.1751963561098;
        Tue, 08 Jul 2025 01:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExwqZLIM59U4XHMTIb/gBt9Jq/PpTvZ1b/ZlUZwDxG6w2Fkn2/DrET0EmQMR+gO8kF1vqjIw==
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5dcd0a63cmr2146621785a.45.1751963560434;
        Tue, 08 Jul 2025 01:32:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
Date: Tue,  8 Jul 2025 10:32:22 +0200
Message-Id: <20250708083222.1020-7-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
References: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfX6myeRIqnsLbb
 5vPGyMeyvBLOLF996QlxI9ZaROFPRMKJkc4fRFgXLsy0NmnSzgee6wlwQ2YM9TsdZyssVD50Atu
 gofSxba09WMM4/sJPxho5cFb9sFj/dmNPsztiXqABAtuqy2Lotz/vuc8tcoiaTwkAxTjCMsijOu
 DKTQ1LK5KCW6k90yq1OLqa3XH9rCVV/0lCzyqUber/IBIlIj8NGqwXV5PqjydxdIq8zhADFlAS5
 +Wr8pI+MC8MMc7zzASVkU0rWTaxepnLfzkEC8VUqL+ps1vW8ngflml1I6vJL3H+Bdwk5yYl3dFT
 QOLH+4FbD11P8BX/1c1LunAKI+t78TYOLpCElPVtxAn8NQhNqwFJFLuPgt9xb57QKzQteUSZwZa
 4eIuOPz8EJSCaEnfyyTlErdccYt98fKjk60aG1Zs21gCVSzD6tZ0NCZyc1PYKFbYEYDsBZuC
X-Proofpoint-GUID: bJ9aXGzifD5DhklXJAJg3tdkmOQLFrxt
X-Proofpoint-ORIG-GUID: bJ9aXGzifD5DhklXJAJg3tdkmOQLFrxt
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686cd7aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=0Y5dpRjIoD8_tdedxaUA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080068

Add node for the QCM2290 camera subsystem.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 103 ++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..54046c069959 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,109 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,qcm2290-camss";
+
+			reg = <0x0 0x5c11000 0x0 0x1000>,
+			      <0x0 0x5c6e000 0x0 0x1000>,
+			      <0x0 0x5c75000 0x0 0x1000>,
+			      <0x0 0x5c52000 0x0 0x1000>,
+			      <0x0 0x5c53000 0x0 0x1000>,
+			      <0x0 0x5c66000 0x0 0x400>,
+			      <0x0 0x5c68000 0x0 0x400>,
+			      <0x0 0x5c6f000 0x0 0x4000>,
+			      <0x0 0x5c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
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


