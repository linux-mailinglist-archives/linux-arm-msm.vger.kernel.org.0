Return-Path: <linux-arm-msm+bounces-47550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A14A30903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 11:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A603A64E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8511F8918;
	Tue, 11 Feb 2025 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HkAHSF0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0871F7557;
	Tue, 11 Feb 2025 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270690; cv=none; b=UANtvVinDMcCbDsURinQx3kmuFTdsEZvarnGPxDqgSamjVSTO4ZwjQH7c7muUFhL5Ij6sGwk6w9KdyIPxIQLEROQjtzIblpdS57IEwjaQmgXKIvRxOAj3Mo7AegUu9+sFfCeHAri726gS9mC20Miad6trVnK/B3zhhwMeXxho+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270690; c=relaxed/simple;
	bh=fqSfSW3N86wX211OcP2cRDv+OWAKZZ8EZxIEcwBW6HI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ju9Fbp/uu2VqwhesgP1FzkoJLez+CXNMUVg65qtLp9cDlqvDWnGggS8+de1C5fv80bXukxr6yWaaIU8yjTDjY90RTrXOCtltgENQdsRWoJZYevLQTZkQ1l62Vcq/1GFeShzWQ2eF0dphAzldnXhMzy7bL7xga61hoaEJlZ2Vi/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HkAHSF0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAaJ9q028737;
	Tue, 11 Feb 2025 10:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bS4scRVoEBm
	S9TVfVUlmpiKHB60mJBvQ4MS0mSfwu64=; b=HkAHSF0mSbcGcU8Ro324IZz9rHr
	b/uFrn28o0VgdvCkB5sNnFrSSun4qysy6irOdbEuR0SSxyRh16/sy2xKPGhzCQl/
	TlPbQWgEbXC+s6w9PrIbZ8yewZ+zE80PqvduK/zNc9IR7NAG+thXsAjzSd4xQzBS
	aZrvNyj7JTT+zHI8fZAmaX0OtVB39PT6+Jjk0q2j6THanlXu1nxxrcAJigtelqG9
	5n56ldPSYvhZVJ3UqRv0SMXx9p8yp0oJgS8QkCWkCjIL9lf+vkkj/SqQ/KODF91U
	ubWI1JkXK6k9+ML8giyee35imzenOYcT5FTdjnueRL0heLTwX5LU1aEOytw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9h2x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:44:45 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAigwT002171;
	Tue, 11 Feb 2025 10:44:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44p0bkpjtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:44:42 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51BAigQ3002166;
	Tue, 11 Feb 2025 10:44:42 GMT
Received: from chejiang-gv.ap.qualcomm.com (chejiang-gv.qualcomm.com [10.233.43.239])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51BAigbs002159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:44:42 +0000
Received: by chejiang-gv.ap.qualcomm.com (Postfix, from userid 37913)
	id 59A6014F3; Tue, 11 Feb 2025 18:44:41 +0800 (CST)
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com,
        quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: [PATCH v1 1/1] arm64: dts: qcom: qcs8300-ride: enable BT on qcs8300-ride
Date: Tue, 11 Feb 2025 18:44:21 +0800
Message-Id: <20250211104421.1172892-2-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
References: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Uxs3c1a5POdb0kHSVw5-tXQZvzzlL2By
X-Proofpoint-GUID: Uxs3c1a5POdb0kHSVw5-tXQZvzzlL2By
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110067

Enable BT on qcs8300-ride by adding a node for the BT module. Since the
platform uses the QCA6698 Bluetooth chip. While the QCA6698 shares th
same IP core as the WCN6855, it has different RF components and RAM sizes,
requiring new firmware files. Use the firmware-name property to specify
the NVM and rampatch firmware to load.

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index a6991e8e2df6..93458773b72d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -17,6 +17,7 @@ / {
 
 	aliases {
 		serial0 = &uart7;
+		serial1 = &uart2;
 	};
 
 	chosen {
@@ -451,6 +452,13 @@ &serdes0 {
 };
 
 &tlmm {
+	bt_en_state: bt-en-state {
+		pins = "gpio55";
+		function = "normal";
+		output-low;
+		bias-pull-down;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio5";
@@ -544,6 +552,22 @@ wlan_en_state: wlan-en-state {
 	};
 };
 
+&uart2 {
+	status = "okay";
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>;
+		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>; /* BT_EN */
+
+		vddio-supply       = <&vreg_conn_pa>;         /* bt-vdd-ctrl1-supply */
+		vddbtcxmx-supply   = <&vreg_conn_1p8>;        /* bt-vdd-ctrl2-supply */
+		max-speed = <3200000>;
+	};
+};
+
 &uart7 {
 	status = "okay";
 };
-- 
2.34.1


