Return-Path: <linux-arm-msm+bounces-49302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC71A43F49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D2A17F772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D682690FF;
	Tue, 25 Feb 2025 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AKXReBFc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832F267B11;
	Tue, 25 Feb 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485936; cv=none; b=ulM5Vg3bYPPdDDTfrGRkjBELTahvID0RRvmN6ke+qByLmFpF/06RPKf0k1hIW+E+ma1qOegaFxUt3g/GASfiGjoXrDqUWBQxYaM10AV90Y+VnCBvnaPnLY4WZVznxuFo944u6DT0BWpV9vGfZiGO0uzGsQdAmzz0b/C9Xls3Zw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485936; c=relaxed/simple;
	bh=hiErty62l/mflWOtrBMcalFac1UUFGZaZxyY3jvCfxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dPhd+qKhIge6kKVGuioNVpc8R5kZQjZUNfloylvjDN3S/iMkooKGwCrRA0dyPNHYk4t+hneb748JLX38HXCY0rGF6qQ2AZjpNAU03OH8/q2VpaoM75y/4nxrUtv8W7JvJfqD+TYPI+y75JIG2Qg3w2eIfMRz6nWof5ANfChSQZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AKXReBFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8g3LR031174;
	Tue, 25 Feb 2025 12:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uTKPevehUGs
	oRklERYGjWPQKY11QWN4YSD7fSDza7FU=; b=AKXReBFc4ufLaIEmGCO10yJkS+z
	tedA2zhCFDlcRPyTzzFkNh/nmY8/7xhBUnLnMYA/BEnFl2dUkx3T6WteRnIcsDBZ
	lFnmZCgx1pQsyvNQ8POPze7e4SOfpWfBN5quvQR30wbYHYXH5g9/gJpFzsUzyfmr
	pv9If5sH0/74VGWCrZJAuif1GIhbIwU918CpReEKRlgTL2nHbNP8hlHOQEl4fsUd
	CF4yu9rrkhuUxkpn5OAgTnBppiUTFprq2vv13diPKAvrcuLqwKIbrcfS+XhXkkxB
	RrpeCfYuW7bX5jscEonVORY/pQaHarf6VfkNMaInhB8bj9cPIDwt2jhiXzQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6nu0u9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCIYYl004546;
	Tue, 25 Feb 2025 12:18:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44y7nkx1ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51PCIY9w004512;
	Tue, 25 Feb 2025 12:18:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 51PCIYXB004500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id A7F8E58E; Tue, 25 Feb 2025 17:48:32 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: [PATCH 08/11] arm64: dts: qcom: sa8775p-ride: enable Display serial interface
Date: Tue, 25 Feb 2025 17:48:21 +0530
Message-Id: <20250225121824.3869719-9-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: sVeXrg3IhnPOu4IASDW7Yu3rh0HCUCRx
X-Proofpoint-GUID: sVeXrg3IhnPOu4IASDW7Yu3rh0HCUCRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250086

Enable both DSI to DP bridge ports on SA8775P Ride plaftrom.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 66 +++++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 151f66512303..02d8a9c2c909 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -128,6 +128,30 @@ dp1_connector_in: endpoint {
 			};
 		};
 	};
+
+	dsi0-connector {
+		compatible = "dp-connector";
+		label = "DSI0";
+		type = "full-size";
+
+		port {
+			dsi0_connector_in: endpoint {
+				remote-endpoint = <&anx7625_1_out>;
+			};
+		};
+	};
+
+	dsi1-connector {
+		compatible = "dp-connector";
+		label = "DSI1";
+		type = "full-size";
+
+		port {
+			dsi1_connector_in: endpoint {
+				remote-endpoint = <&anx7625_2_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -598,7 +622,9 @@ anx7625_1_in: endpoint {
 					dsi2dp_bridge_1_out: port@1 {
 						reg = <1>;
 
-						anx7625_1_out: endpoint { };
+						anx7625_1_out: endpoint {
+							remote-endpoint = <&dsi0_connector_in>;
+						};
 					};
 				};
 			};
@@ -632,7 +658,9 @@ anx7625_2_in: endpoint {
 					dsi2dp_bridge_2_out: port@1 {
 						reg = <1>;
 
-						anx7625_2_out: endpoint { };
+						anx7625_2_out: endpoint {
+							remote-endpoint = <&dsi1_connector_in>;
+						};
 					};
 				};
 			};
@@ -685,6 +713,40 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&anx7625_1_in>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss0_dsi1 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi1_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&anx7625_2_in>;
+};
+
+&mdss0_dsi1_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pmm8654au_0_gpios {
 	gpio-line-names = "DS_EN",
 			  "POFF_COMPLETE",
-- 
2.34.1


