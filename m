Return-Path: <linux-arm-msm+bounces-38635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76D9D49AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9901F2182D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC521CBA01;
	Thu, 21 Nov 2024 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pRpEz+hK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3464206E;
	Thu, 21 Nov 2024 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180451; cv=none; b=buit03yvHq3sriVdg2/wWuBuh4Ud7SL5z+hzpwsFJpATCDh7KzGwZsDrh1zDOSbkrBjvarJY8BZJIlxYltTH4iPRYSgV8HWBAQxVVgBvQyuLIrxJebY5HVZh8Tcp897zz+Kh77Uzu+cqvojTtwNsePxpvZ1p/6AsrkWYWe8FqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180451; c=relaxed/simple;
	bh=KfG74JQyOCfVgqMGtJuBmgLAopV5I88+l8j2Xk2H3Og=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=G7c2vr3c1+BrthnrCFEOK+11PlbdDvLZrbbooh0/b6WaXWJ1M45oDAZ+noorAwteBGA4J4wxHvtHIytl4BxtCTnzJxe8QsyPKPam/5qk2xkRyhGj3NCFC4Hey7XIbJOr54VInaWdHZixbqsE8DnYsRB23Uf3/eK7ZN6O6TMzriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pRpEz+hK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0Cn8j026219;
	Thu, 21 Nov 2024 09:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=a4RK+u81L+OhH7N7XBGm2T/Ds8A4xfc/86FBSw72qco=; b=pR
	pEz+hK6y64T0VVFiB9k2E7oKDx69XgKZtBKcVk0HPvNAoK1GZxNb3jKX30HRf1LV
	hzcOWPQ6+Mtn9FbNdwRpgWXBK3J7hpWPDHbTyt/lMzk7SyKFE2lqT8eNVNj4FgIx
	HINALhCvb7zv5e74dnbXzXYQQP62nk9WOmRcSkiMyc3I6dffLy/3Bc+w2nZyNqU5
	DIILeSnw0dLfP+kTqhBoc5kBFpzLJKx7WMTCQVUB2MN5RvefSkAMJAnYL6JA728j
	bIEW3WL9PArYiu/nBzNmKFyj3deqgRM16cyZ6sXcQr49r87rBfi78QuNx1Snmb3E
	wVoWSkGhM4vQavN7HWFw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ebyb62h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:14:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL9E4FC024157;
	Thu, 21 Nov 2024 09:14:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 42xmfmn76h-1;
	Thu, 21 Nov 2024 09:14:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AL9E4ff024139;
	Thu, 21 Nov 2024 09:14:04 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4AL9E3Lf024133;
	Thu, 21 Nov 2024 09:14:04 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id 0BE135009F5; Thu, 21 Nov 2024 14:44:03 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: [PATCH v5 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display Port
Date: Thu, 21 Nov 2024 14:44:01 +0530
Message-Id: <20241121091401.20584-3-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241121091401.20584-1-quic_mukhopad@quicinc.com>
References: <20241121091401.20584-1-quic_mukhopad@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S42ISiq-cPISblxCxcRIs4SKt3-cR9nO
X-Proofpoint-ORIG-GUID: S42ISiq-cPISblxCxcRIs4SKt3-cR9nO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210071
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
for each mdss. edp0 and edp1 correspond to the DP controllers of
mdss0, whereas edp2 and edp3 correspond to the DP controllers of
mdss1. This change enables only the DP controllers, DPTX0 and DPTX1
alongside their corresponding PHYs of mdss0, which have been
validated.

Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index adb71aeff339..f4f6a78e94c7 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -27,6 +27,30 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1-connector {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -421,6 +445,50 @@
 	status = "okay";
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+
+	pinctrl-0 = <&dp0_hot_plug_det>;
+	pinctrl-names = "default";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
+&mdss0_dp1 {
+	status = "okay";
+
+	pinctrl-0 = <&dp1_hot_plug_det>;
+	pinctrl-names = "default";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+};
+
 &pmm8654au_0_gpios {
 	gpio-line-names = "DS_EN",
 			  "POFF_COMPLETE",
@@ -527,6 +595,18 @@
 };
 
 &tlmm {
+	dp0_hot_plug_det: dp0-hot-plug-det-state {
+		pins = "gpio101";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
+	dp1_hot_plug_det: dp1-hot-plug-det-state {
+		pins = "gpio102";
+		function = "edp1_hot";
+		bias-disable;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio8";
-- 
2.17.1


