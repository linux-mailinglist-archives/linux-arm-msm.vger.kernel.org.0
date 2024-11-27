Return-Path: <linux-arm-msm+bounces-39296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBFC9DA617
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 531A7B21E26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 10:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF97119924E;
	Wed, 27 Nov 2024 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B8eyyl7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E261991AE;
	Wed, 27 Nov 2024 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732704479; cv=none; b=p8wBUoPNpHkFFFyqNKLUlweUqdzDsyME9LKYJ68Tp8H0eYLMfptADcOfEJSImeT8XGDxmHEOvE5nSPfpd9lnYraCAu8in39a7t9gqeKGvVmP8vTdwVuO2eZvbjnHrIMqM99xPNKunipDnAazXFkDD0JWxJOcAGlM/I7l/CiZ/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732704479; c=relaxed/simple;
	bh=OrqqrFMlcGD/ss+m8ZxbVOLkm6Y9njMMUeLCyz8NHDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ABLtZ1JvusXSWehLNtYl2rm2Y6eNn8KrlVnHe+qS6QNEqssfWC2QWCZLZ+nWTsrgkPhthGSwxdwtjrvVydxa3vPhKcO8kv0gmhU5+crMUt7H6nYZ2fTRyzP0Tv7ydwAhwTXB3QKMPwMxjgfCVC5vhoo1xMIefaxAin1n/pFeVho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B8eyyl7/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR8BhMt013811;
	Wed, 27 Nov 2024 10:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BoYilusV9HXbNzno8pgOWdbU4iV0kSvweqMqkkLPGk=; b=B8eyyl7/2FxqGrjE
	fXH2r7bQSstmMegYh8hqLxIaaTN0ftwMNNH31PcKgYTF8JqGnaoOMeB06QqaO6lt
	543j+U8L28CPT6ImzlHh/uPMtXG6SiU4WsqPzPeZiuWXEBHyzZ5Cum8XDOz1sgD9
	7QOg6iVyjFJ9LsW4bBbbPa2hvBP1uYjCPwuanrgOLhRikx9AGw/wTyKa1LW3LjNR
	ZQqPkwGHfrlWN30rgzwjHHMGBdyX4EothQTMkVwvURzkL+FiToDpVmewOV7NGAyq
	4Jv4k08+apg8hvptS7AOp2fJTxbZ7fv9kN7/8cU8DEdPdoomkRl9hGU3dCKleyLq
	79xZyg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435epqb7dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:47:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARAltwC028127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:47:55 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 02:47:51 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 27 Nov 2024 18:45:14 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241127-dp_dts_qcs8300-v1-2-e3d13dec4233@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
In-Reply-To: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732704466; l=1647;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=OrqqrFMlcGD/ss+m8ZxbVOLkm6Y9njMMUeLCyz8NHDk=;
 b=YRSpDDkUm9BnobcOCw4g8kvNVqjILUmTm9HUC7rZ/o1OlIKld95KfYDiaVXKkwUwotjRZcLFu
 BYx6r4eymt2Al0gxKwoWniea2Am4c71siOdGl7WYXk2jmlWyjEk1DeG
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b3kOfshToO_88apG06EsGu-JWA10QIj5
X-Proofpoint-ORIG-GUID: b3kOfshToO_88apG06EsGu-JWA10QIj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270089

Enable DPTX0 along with their corresponding PHYs for
qcs8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 7eed19a694c39dbe791afb6a991db65acb37e597..5dc855d6a22c38d97a3071d3a3d88ec551eebd1b 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -35,6 +35,18 @@ sleep_clk: sleep-clk {
 			clock-frequency = <32000>;
 		};
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
@@ -223,6 +235,30 @@ &gcc {
 		 <0>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss_dp0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -247,6 +283,14 @@ &rpmhcc {
 	clock-names = "xo";
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


