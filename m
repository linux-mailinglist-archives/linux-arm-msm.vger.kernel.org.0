Return-Path: <linux-arm-msm+bounces-38281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E09D2092
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 08:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 851371F226E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 07:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64EF14EC62;
	Tue, 19 Nov 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o1pMp34B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552E35280;
	Tue, 19 Nov 2024 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732000118; cv=none; b=KDOgod1CTYkg3sEDEyDkCZcX8kh5IABBE8aUCD4xAhPdZNVoRBkOMln+a3a1mVwS/AapN7RZWMD5X64CqL1L146ZsDyVBAkdGpu3xbEBVoVFEX6M2RXhLRH1o5ESaEV1oxNh6IbVwNkRLmt+qxTqah6xUVy+4+yDqVMAES+Nzgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732000118; c=relaxed/simple;
	bh=YUeg2pLg8nBjvJVWgTi5JOw9MyJhmwnYL/amWcwgThI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WtkBsubk2uomP5/HBt08Oj44loBPKpeScdry7lhTyGmHPd8TNL6F2lYd3qDOzU5ORuCigcAJBLSosgEZLNNO/bi80QYX5jWueGxjlINwNWuATwBOaW21O0+etvv4Y8TJNiOpEQ/7kWmdolqF4LmARZFf+wCuV56cosu+NgG7QF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o1pMp34B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGLhRs010987;
	Tue, 19 Nov 2024 07:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9UkVjL8dwwmVoDBwtVopDO
	JGiyQj1gMcygbD3tzPWCM=; b=o1pMp34BqwBd2kqRZNTgmKV2+J1UQ4FkVT25RL
	8N843iYzHFkRzBIREbbzDW4vFx9ItlX0px0zPurGQqlw0tdIcgh4BZarVXwytzyf
	+kowR2bP32Z7GIBz4mCn3Mrmvjsfe/LqE4uZzA7v2jWh/lDdW4Q74lpXGD2Sk2us
	6KAm7LFMYrbL5bD0tAra4Kv1iSVFMO1e/xPW91zXcwAwipIivgPtZRQYNsLtelFt
	jy+U1JsgBwzMy0vjy+vp/6NltV8rzxx5pAA1yrfD89F9sXMp3urZw/5zphkFrL71
	EZQTj9/judA9K4DbK1xUAt4xIIiY2qBJSsQxwi/FSjOeEJtA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43091m9qh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 07:08:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ78W5t001681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 07:08:32 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 23:08:28 -0800
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v3] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage setting
Date: Tue, 19 Nov 2024 12:38:11 +0530
Message-ID: <20241119070812.16079-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DkCrgXr7RPG3D0spo5ETNK3Ks06fPrcu
X-Proofpoint-GUID: DkCrgXr7RPG3D0spo5ETNK3Ks06fPrcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 mlxlogscore=449 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190052

While adding the USB support, it was found that the configuration
for regulator smps5 was incorrectly set. Upon cross verifying for
all the regulators, found that smps4, smps6 and smps8 are also
incorrectly configured. The patch corrects these configurations.

In particular -
- smps4 is 1.574V min and 2.04V max
- smps5 is 1.2V min and 1.4V max
- smps6 is 0.382V min and 1.12V max
- smps8 is fixed at 0.752V

Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
Changes in v3 -
* Minor nit pick in commit message
* Link to v2: https://lore.kernel.org/all/20240524082236.24112-1-quic_kbajaj@quicinc.com/

Changes in v2-
* Updated the commit message as suggested by Krzysztof
* Link to v1: https://lore.kernel.org/linux-arm-msm/20240514131038.28036-1-quic_kbajaj@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/qru1000-idp.dts | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
index e65305f8136c..6e8f9007068b 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
@@ -96,20 +96,20 @@ vreg_s3a_1p05: smps3 {

 		vreg_s4a_1p8: smps4 {
 			regulator-name = "vreg_s4a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
+			regulator-min-microvolt = <1574000>;
+			regulator-max-microvolt = <2040000>;
 		};

 		vreg_s5a_2p0: smps5 {
 			regulator-name = "vreg_s5a_2p0";
-			regulator-min-microvolt = <1904000>;
-			regulator-max-microvolt = <2000000>;
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1400000>;
 		};

 		vreg_s6a_0p9: smps6 {
 			regulator-name = "vreg_s6a_0p9";
-			regulator-min-microvolt = <920000>;
-			regulator-max-microvolt = <1128000>;
+			regulator-min-microvolt = <382000>;
+			regulator-max-microvolt = <1120000>;
 		};

 		vreg_s7a_1p2: smps7 {
@@ -120,8 +120,8 @@ vreg_s7a_1p2: smps7 {

 		vreg_s8a_1p3: smps8 {
 			regulator-name = "vreg_s8a_1p3";
-			regulator-min-microvolt = <1352000>;
-			regulator-max-microvolt = <1352000>;
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
 		};

 		vreg_l1a_0p91: ldo1 {
diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
index 1c781d9e24cf..8b0ddc187ca0 100644
--- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
@@ -96,20 +96,20 @@ vreg_s3a_1p05: smps3 {

 		vreg_s4a_1p8: smps4 {
 			regulator-name = "vreg_s4a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
+			regulator-min-microvolt = <1574000>;
+			regulator-max-microvolt = <2040000>;
 		};

 		vreg_s5a_2p0: smps5 {
 			regulator-name = "vreg_s5a_2p0";
-			regulator-min-microvolt = <1904000>;
-			regulator-max-microvolt = <2000000>;
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1400000>;
 		};

 		vreg_s6a_0p9: smps6 {
 			regulator-name = "vreg_s6a_0p9";
-			regulator-min-microvolt = <920000>;
-			regulator-max-microvolt = <1128000>;
+			regulator-min-microvolt = <382000>;
+			regulator-max-microvolt = <1120000>;
 		};

 		vreg_s7a_1p2: smps7 {
@@ -120,8 +120,8 @@ vreg_s7a_1p2: smps7 {

 		vreg_s8a_1p3: smps8 {
 			regulator-name = "vreg_s8a_1p3";
-			regulator-min-microvolt = <1352000>;
-			regulator-max-microvolt = <1352000>;
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
 		};

 		vreg_l1a_0p91: ldo1 {
--
2.46.0


