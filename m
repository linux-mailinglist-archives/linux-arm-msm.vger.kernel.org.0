Return-Path: <linux-arm-msm+bounces-67856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88758B1C113
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 09:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97F397B00A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 07:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B955321C166;
	Wed,  6 Aug 2025 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Azgf74C6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59521ABC8;
	Wed,  6 Aug 2025 07:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754464366; cv=none; b=fPaNDLZ+voIhEPvXVPWBnNuC35FXmgcvoE2nV95EBGV3CYCINVXw1sLZuPKL5SI1Mg0yjhx/RsRcPqaFPqNpN2e57SXKkVBdMvpS8Y4/+t6DSr9c4pFbkQtDJ8sI5jSLE7PJha7071v1BlPt/t/oJx094g1q7vZGN++jxJAQ1LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754464366; c=relaxed/simple;
	bh=sWikO/yA+jCpGRWkJGmchmSFpEgc1QhUUsXI5LYcgAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WMSJhW72p7HrOi7B6CaQLLyXMmg424uw17H0dGWqeNYwdLUAPwU6m4usEW73tsd9jqM+R6kmInkvtryxvoFq7rQw7dRECDVSEd8+ut+1HOBwZZ1aDRjpTS92ewPHx23Aj9mkzrhJ9W1C3liJIo7OdGQz9E7RLQXfQnARplKnkk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Azgf74C6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765kETP025034;
	Wed, 6 Aug 2025 07:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J32qCI4PQUCDfbKJOXvr8lws0JXPDymnUaOhi+/cs4Y=; b=Azgf74C6vWJsC/N0
	RMx9NGLKyfg1rGs0ADuSmJhd6RIILDBJ1r1PSJSRRcREXTo29dScAwWFsa9Ew+f6
	rOwz1HJqpbsTLYCyufWF65lrlqM95oB/cpTzZNjEUeNTKAB+3+6M4HAhSPsgYCR9
	lhpm/gG7ybspuGDlBbFiihs8rnRJMoN19PTkFZ+HNbLqjzDcFnXtzVX4kqMPd5Eo
	PZw43KBEcIg+c8FN0gMhKAOXVm7FyJwxnC5V1ydinWdUn7zVzG0UnYkTRQNftI2d
	gA+YPkMTcSCGi9K+rZ355xfT3KQBD+D/aGT2EFfKpE3+3zWejfS9OfrDNDrPEiGc
	NsQr9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvysvyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 07:12:42 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5767Cex2013586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 07:12:41 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 6 Aug 2025 00:12:38 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 6 Aug 2025 15:12:04 +0800
Subject: [PATCH v5 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250806-dts_qcs8300-v5-2-60c554ec3974@quicinc.com>
References: <20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com>
In-Reply-To: <20250806-dts_qcs8300-v5-0-60c554ec3974@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754464352; l=1716;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=sWikO/yA+jCpGRWkJGmchmSFpEgc1QhUUsXI5LYcgAo=;
 b=clKzlPt0Wp2RyO84TZNgkWRnx54gvgQ9HUr0D+2jz8Xw3N1da5IOVkXVFSY0UVemaNm9Ds1+Y
 BZZOLOc8j3MAQ2d74gQDK6Yx57A1oqMjTIG/uVtkuQ81ALBT9P9P7X4
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C-UtsxNMHMVjXp635SNnGvZ3DZuBg_J8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX99eu+96ZCjAB
 G22h6rr+gH6pulklibyEuOaycOS47TUE+zaKOP2sKi2T9ZXdJKpwJICUmcF+yBQZ6Bpx3y4o8A3
 KS5hHtPvX/0qDr8kk5W3s6BZABU4bfTkPzV90qsbzttCWzT1F9rL15ShEG59QWmwK+mbwJyQbsj
 6cP8k7SMilOjdx2k0gETe4MyYggLcbXOoss4Y5OYxlD6d9b+WzCZw3BOE9xpvaQNImX9uNN0RYi
 cOND5PmAEoJy0RXcHWRB69Fc16kTehsMLj5rgyF40Zi4fPH9PvU+SGuibdsX5GFkJ9GY340uCbb
 GxlUSoDpWFgmvfZ7r626g9XQdbcbSHJaB/iaurcJPFXvGI/jlNjqE61/TJpQxGo+M3a3+WJ8MMj
 TIZzKsM4
X-Proofpoint-ORIG-GUID: C-UtsxNMHMVjXp635SNnGvZ3DZuBg_J8
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=6893006a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=hl7K7QAjLFuWH7Qs_DcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Enable DPTX0 along with their corresponding PHYs for
qcs8300-ride platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 8c166ead912c589c01d2bc7d13fa1b6892f6252b..850e9f4f0ea5cd95d08107b17f3b124d0a74ce35 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -23,6 +23,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
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
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -308,6 +320,30 @@ &iris {
 	status = "okay";
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
@@ -348,6 +384,12 @@ ethernet0_mdio: ethernet0-mdio-pins {
 			bias-pull-up;
 		};
 	};
+
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio94";
+		function = "edp0_hot";
+		bias-disable;
+	};
 };
 
 &uart7 {

-- 
2.34.1


