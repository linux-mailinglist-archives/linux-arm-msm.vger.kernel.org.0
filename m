Return-Path: <linux-arm-msm+bounces-19577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C878C0E1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 12:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6EB52835FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 10:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D404114B083;
	Thu,  9 May 2024 10:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GTU3r4V5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4050014B06E;
	Thu,  9 May 2024 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715250278; cv=none; b=gsQn/tLYICZEcxcfAbhFIUMEnYuCGvSR/ZaZS+d4i2ha0vTMfrOLny6WcgDB815DVgiwpWGxNodmzWqVEtrPFpo3XkAwRgq8I0ueaRJD9PpY64s08O/So468q17bn/ZJlXt0sy3U4qY0hX2sENbhXvGWdbc9RS5Dz7VfvJtrceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715250278; c=relaxed/simple;
	bh=BekQdQptTQpvGpRyGlUbj2l5mkL6Bnv5K9rBAJ8HL1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AGt1cKg+lqJSfV5huUh+uwNIMpGjg6leLiS1Hxfw5SE3MmiVs7QRKSRbfod0iggcgeA7BPyz+y7g0Qz6YKXhmnUfix9scI8OREV2Ck0rVG0VIfhlRzk+QH5HEMpsLAZSqS3pxUBhcKZvowqovagHHl2PKFns72gsGYE/468TiiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GTU3r4V5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4490t8D4006648;
	Thu, 9 May 2024 10:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=5aovpYcRm3B2nPdzz98yDMi5tfJer7t+Yw3vCW5iLVU
	=; b=GTU3r4V5GLchN9vqZb2G9GP2l/isZ7mUA2yEpGZ8HZHROJg/PGwLFsCSAgM
	S0D9LchE4EMVbNyH8tGolqU/9+a6S19tGmlNORqEUUvsUpj5+uUDZk6230C/hZo/
	6bsreGsWMdz64vD+bFL61hBzqqu/ELxzp0XahKA6UHjTYAMWXmB87fJnzwkgPIW8
	dXb6TjWANLuuQAa+gkVcq6iweoDioryumDU/qjUrPHa94ngIxCD9Ppy7FDI+Uh34
	ZDtI9LC2Cltv8Y/clOimB/hnpF4c05MPBGwlcO9izm5vsVgCi3U0AC3F5REpltaj
	bydceMtbomtgDp8ECRFVsaAHO1w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wftkr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 10:24:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449AOPL6016151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 10:24:25 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 May 2024 03:24:20 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Thu, 9 May 2024 15:54:04 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: sm8150: Add video clock
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240509-videocc-sm8150-dt-node-v4-2-e9617f65e946@quicinc.com>
References: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com>
In-Reply-To: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek
	<jonathan@marek.ca>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.12.4
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RyG4z2hdbsjxu0-PCAlX_nCu4M5Pul3e
X-Proofpoint-ORIG-GUID: RyG4z2hdbsjxu0-PCAlX_nCu4M5Pul3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=928
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405090066

Add device node for video clock controller on Qualcomm
SM8150 platform.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8155p.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8155p.dtsi b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
index ffb7ab695213..9e70effc72e1 100644
--- a/arch/arm64/boot/dts/qcom/sa8155p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
@@ -38,3 +38,7 @@ &rpmhpd {
 	 */
 	compatible = "qcom,sa8155p-rpmhpd";
 };
+
+&videocc {
+	power-domains = <&rpmhpd SA8155P_CX>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a35c0852b5a1..55c9046f4fb9 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/clock/qcom,dispcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
+#include <dt-bindings/clock/qcom,videocc-sm8150.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8150.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -3715,6 +3716,19 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,sm8150-videocc";
+			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bi_tcxo";
+			power-domains = <&rpmhpd SM8150_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		camnoc_virt: interconnect@ac00000 {
 			compatible = "qcom,sm8150-camnoc-virt";
 			reg = <0 0x0ac00000 0 0x1000>;

-- 
2.25.1


