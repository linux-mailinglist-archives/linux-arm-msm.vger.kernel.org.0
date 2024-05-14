Return-Path: <linux-arm-msm+bounces-19834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB478C56A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 15:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E31B1C21D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 13:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482F31411D0;
	Tue, 14 May 2024 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ibvi81Gw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2F714036F;
	Tue, 14 May 2024 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715692273; cv=none; b=aoOlAJrk2xIOn9JGfJpQSjqVH6k7+Otz3V2uGlX3XoVmXqUygwjNMxzjC0xq2iWwQh7jeSSUs4We8pIWH85U558jwp0Ymzi6K4Jb6f5T+ZEaM7dLKzM82X7h8jN+ZNSelMRg1HCNcGjHs/X0LnbvJPljvULkndTGxcuT0bvl5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715692273; c=relaxed/simple;
	bh=XEaOsdnwY0vCrlmEAlDtw9snDXediHSG2/z+a5o7Osg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uo5blS8dMwHI+waFRRm5YqvT8hGQE+DaAtzGgmlflOsgLDANZLYPKFYT0DrD4hl9cmRBmwha0RZPQLl37q5VneFChLchfglZyoxDzr7w/Ev5OHsPhfKlnJYL1inr7o5O6awbgXyHhAyFlYicCOEdNuhA8t4rUd42kIowpDbabuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ibvi81Gw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E8UVTW025820;
	Tue, 14 May 2024 13:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=t7+DNYi
	nlRbmPItKv/asPORCPqUW6C/oU8CcoQWe3Xw=; b=Ibvi81GwZU3QYbaYWT6Y6la
	+KsXsA3rFcY2TQaKG4CQLH7xhqbyoyYwcEDQbq+443mk8QZhTmS9Kaeg9BqYp74T
	oN/MXmASkXVXggOp6tugziLL+rO4733a5RgmLSjWZhD7+G2PgThC9lEFwwZvd8x6
	ws5UwXIJTXJQ+4eSh/+UA8nTd6o5aEXfUyHQ6gHXM33DZ+llc75M7tycI+e5rm4j
	8Yn7nJGAEn+1UhPzulTbXnCW31orUTG9yUZ3LU5e1axUWyjatfONiMcsJihmZOSI
	JeIpsYWiIBEUuW0jKgRSGKMDl/cSW5x60t0Kg1z1d5SGnTlat5QyDf/AJAfP56w=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125ebk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:11:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EDB182025238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:11:01 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 May 2024 06:10:58 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Melody Olvera <quic_molvera@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Komal Bajaj
	<quic_kbajaj@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage setting
Date: Tue, 14 May 2024 18:40:38 +0530
Message-ID: <20240514131038.28036-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: COxtjKqUDfHRAb5xMjN7bGDOgoEi7iT-
X-Proofpoint-ORIG-GUID: COxtjKqUDfHRAb5xMjN7bGDOgoEi7iT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_06,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=384 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140093

Fixing the regulator voltages for qdu/qru1000 idp boards.
In particular -
- smps4 is 1.574V min and 2.04V max
- smps5 is 1.2V min and 1.4V max
- smps6 is 0.382V min and 1.12V max
- smps8 is fixed at 0.752V

Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/qru1000-idp.dts | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
index 6e129dc123ed..89b84fb0f70a 100644
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
index 2a862c83309e..258483af065b 100644
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
2.42.0


