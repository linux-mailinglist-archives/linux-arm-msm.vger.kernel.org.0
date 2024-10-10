Return-Path: <linux-arm-msm+bounces-33926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9879991D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 21:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570411C23E65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 19:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671631EF920;
	Thu, 10 Oct 2024 18:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TTnOPtuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83BA1EF0B8;
	Thu, 10 Oct 2024 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586778; cv=none; b=ixPmI6ko7GpiTF6nepj1/Egn/AwK6oJr6YuoB5LfCOUbxKgNHtfDwEfw6QEtCXN5Nw4Y2ptShR5d7QTU63QurUtW268u4uUJW/WO3KXUaegBcS/descmJpUUP/4d/UPHG0j45q1ztJZZLbbJReCMRV1gdiup4GdH0PnNsQbWFtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586778; c=relaxed/simple;
	bh=ENLqW24ckLXuqxHC+yUCkfD4IrKeLdafgIplV8fTDYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sS4w6pQk2UpA6mxG9vPsLnHyMKIz+E0NSaD+71AsQQUHFYWdKLv+k9J5QUo9idAeo5wTSvfaqYmPOVZKZIqWs5ChVUuMAidm9zQEyPtaYrFz2GmNaylfj//pEjLziB3NCbHD1LD47TBvTGpc+8ZolI3ZQFvc0Ozecc2ofp2deJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TTnOPtuF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AHLBAo024403;
	Thu, 10 Oct 2024 18:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbBA8siyMQvU17qRS/jrkoyIm/e3njTbFb7aWbOOSbs=; b=TTnOPtuFvm4WiKcf
	DhI1Tx7ypDT5nT8VZIXLOzUBqEgmzy8kAW6dR1g7WKPC2ym0XrNylJKi2Cywy5/t
	wp85F1V+bwfbmXeWOg+39c0k1AaGpSzhOPIRtmwSKuLEbbJcw4NRT9akSCfHOZAH
	YAzCPEsiHf20GOJ/XCBigiOFiWKZJ4SaOZU7+iIcyfZgGJQg6YKYOI7/+J2GC4p0
	61M/Oddef7lYEtBRCMtq3RPVUdfh/lFPi/Yb2EWFGaZP8Ly36nFJmS41rG5hokUz
	WHnE1VpnCBvAj37u4qKchaGdL1vk3VhrNaohpUkaINoVGuklFdazBICgOtngzYOj
	fK3uBg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426adhhupj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AIxVa6004497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:31 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 11:59:27 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 11 Oct 2024 00:28:38 +0530
Subject: [PATCH v5 8/8] arm64: dts: qcom: Add support for multimedia clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241011-sa8775p-mm-v4-resend-patches-v5-8-4a9f17dc683a@quicinc.com>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
In-Reply-To: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BNrq3wO78Z4ooyDrzBRBfmzezvRletIR
X-Proofpoint-ORIG-GUID: BNrq3wO78Z4ooyDrzBRBfmzezvRletIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=996 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100125

Add support for video, camera, display0 and display1 clock
controllers on SA8775P platform.

Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index e8dbc8d820a64f45c62edebca7ce4583a5c716e0..e56a725128e5ec228133a1b008ac2114a4682bef 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3254,6 +3254,47 @@ llcc: system-cache-controller@9200000 {
 			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sa8775p-videocc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sa8775p-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc0: clock-controller@af00000 {
+			compatible = "qcom,sa8775p-dispcc0";
+			reg = <0x0 0x0af00000 0x0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
@@ -3876,6 +3917,22 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		dispcc1: clock-controller@22100000 {
+			compatible = "qcom,sa8775p-dispcc1";
+			reg = <0x0 0x22100000 0x0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			status = "disabled";
+		};
+
 		ethernet1: ethernet@23000000 {
 			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23000000 0x0 0x10000>,

-- 
2.45.2


