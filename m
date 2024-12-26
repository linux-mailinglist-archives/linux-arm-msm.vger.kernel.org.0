Return-Path: <linux-arm-msm+bounces-43360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8D9FCA60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 11:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5581E188305B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 10:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4FF1D619F;
	Thu, 26 Dec 2024 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QdmYzbuS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3680B1D5CEE;
	Thu, 26 Dec 2024 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735209952; cv=none; b=LJEXMuL/SO0NkIA1qaSDm4yQOZDCNRDnPkAG0Ksrg3UltNtEz6No3aRmgePoliGVlwvdJly6p4A3NYXFaNYs1I5jBJx7QTqxkhTcvqXNFjRJanzRof5aBl8cGNvAjjvVKq2IB+5lbiZ1vShy59KgGP+eNyUqloOKbV8mgATvkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735209952; c=relaxed/simple;
	bh=uPLgApOSctICKPTBn2vBriLDw202NGwQ9L7Nasdcw9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BGNAGD5ffQbKBe2BUdzqsnzwYIt/0DeoNixNPAG/d9g+qFTEJa9j7kGGGvtPTtxjTgbmxCDxAEXjMxiLOMfUT7XxBwUzd+s5UH94cnd6O13GbCPcVS//8sqdpgZU5rNPmGZ4wjIglvdpZG+ATNqzlLkxf/LPff4Bq830prGt25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QdmYzbuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ5Yerx004160;
	Thu, 26 Dec 2024 10:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eFmRwWKL4xtB8HOVdOrQ1ZJYRrIevRPw2A+LTEhWSc=; b=QdmYzbuSnS24fXDJ
	4w9Juea6UgTcKRO5HT7QIC7VUrNZegD5yjmkAel825oJlEIV+dhewH76qL0I1/WV
	w1tqjAw32w5khEAZ4TgmHqWsJWVsC333tT//wc/kFGH/FlR0tq6AioM4chW85pY3
	N4XH+HP1JzRYYYQFJpNllDJjcFDldVCLQj97yySSGmr21pnzoWOtm27RTwC6tgeh
	JDu5Nrcjvmc+9cWqP+KRgMmV10HfrNMPNnBQxG1lXXfZaPD3SorpLxyULGbOWKlT
	Rp0gTROOEETMQRwuis8Z2KIOeLaVAU6wxbXV53S8GHJV5MPf9Oud2bZXxpIoNNdn
	/6PDKA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s14b234r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 10:45:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQAjk50030909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 10:45:46 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Dec 2024 02:45:44 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Thu, 26 Dec 2024 18:43:53 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241226-dts_qcs8300-v2-2-ec8d4fb65cba@quicinc.com>
References: <20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com>
In-Reply-To: <20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735209938; l=1658;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=uPLgApOSctICKPTBn2vBriLDw202NGwQ9L7Nasdcw9w=;
 b=iJPOMq4iFigY+IW21Xi3s+ju+zdW24VBXUUz5fTAXiUN2Rr94Y49T3MpbtFMur6eMltDBNLU2
 DgHIoHhXW6XD43an3jRIWHCbjfRboOw4jq8GvyayaIBivkSf6aHAF2v
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jeRTbmFI4vALmAVFomu_rZEYn-oQlavh
X-Proofpoint-ORIG-GUID: jeRTbmFI4vALmAVFomu_rZEYn-oQlavh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=942
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260095

Enable DPTX0 along with their corresponding PHYs for
qcs8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 85b84778e85ae712473eee78a8e090c49dfc3721..a41881ad7f85931688b06f20924cc1e744de8ff7 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -21,6 +21,18 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -196,6 +208,30 @@ vreg_l9c: ldo9 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss_dp0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -215,6 +251,14 @@ &remoteproc_gpdsp {
 	status = "okay";
 };
 
+&tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio94";
+		function = "edp0_hot";
+		bias-disable;
+	};
+};
+
 &uart7 {
 	status = "okay";
 };

-- 
2.34.1


