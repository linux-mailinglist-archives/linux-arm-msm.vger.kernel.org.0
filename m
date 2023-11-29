Return-Path: <linux-arm-msm+bounces-2409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB17FD450
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF6ADB20A70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4F91B287;
	Wed, 29 Nov 2023 10:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oNYfRsv3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2291BE1;
	Wed, 29 Nov 2023 02:34:49 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4ughZ024554;
	Wed, 29 Nov 2023 10:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=MnNY4CoDhvtwPywTGbtvWTKu6YgH0g7XYgLZ18TytT8=;
 b=oNYfRsv3eOJK6k1pZ0fr0sitC6DLhakjzAAaS+vdfTCh9C0lh2TkQDP/yuMvpwxUqBck
 Q7DI19nG9Gz611tu5baz/Lt9oRmjBJM1Mp9hmlchC6SBpgpiBukrxUEQF1juXQN0P0H3
 Bu+QY9Iev9QfiSC5kEIvFIkhxX45dOSGZR5FQYXOnWrFRUt5qPNim9Pwx6Xm9FHyBT5d
 qDzeHmPxX6a2S+PaC+bjdZ/+AVXfOUbGJepRtaD6Nv4Yx+Bg19ARmIG9IfncqL+URpwE
 gbUIQjG3n9XhWyk9Fz2g3h9Df0yE0hsPvI0wLHSCLy/RJZjBBBSuudaO6GgFGZgs9swv PA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unjdtjmrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:34:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATAYjll031615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 10:34:45 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 02:34:39 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v7 4/6] arm64: dts: qcom: sm4450-qrd: add QRD4450 uart support
Date: Wed, 29 Nov 2023 18:33:23 +0800
Message-ID: <20231129103325.24854-5-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231129103325.24854-1-quic_tengfan@quicinc.com>
References: <20231129103325.24854-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F9NPFGkQm8QVB7RAry09ov6Wk-4k6Dvt
X-Proofpoint-ORIG-GUID: F9NPFGkQm8QVB7RAry09ov6Wk-4k6Dvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_07,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=767
 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290078

Add uart support for QRD4450 for enable uart console.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm4450-qrd.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4450-qrd.dts b/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
index 00a1c81ca397..bb8c58fb4267 100644
--- a/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm4450-qrd.dts
@@ -10,9 +10,19 @@
 	model = "Qualcomm Technologies, Inc. SM4450 QRD";
 	compatible = "qcom,sm4450-qrd", "qcom,sm4450";
 
-	aliases { };
+	aliases {
+		serial0 = &uart7;
+	};
 
 	chosen {
-		bootargs = "console=hvc0";
+		stdout-path = "serial0:115200n8";
 	};
 };
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
-- 
2.17.1


