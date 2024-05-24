Return-Path: <linux-arm-msm+bounces-20385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A84868CE248
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 10:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 347511F21ADF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064DE84A4C;
	Fri, 24 May 2024 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nyfmf4r5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00436AEC;
	Fri, 24 May 2024 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716538999; cv=none; b=NvbfFWOGA2XU7gcWbdvwMirDKze8EtLxC5re471z/mYJPse/8Vp2W7QJjAoxr2hxrXryWrDeThvQMiv9mmCKEhxlrbq0BBByZNPz00Xhh9lBY3cLWoCsxh18+Hh/7hO3pzkjRmd8nVTikY3BosUWyP5pYecXcizAJYXkUf3Ljac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716538999; c=relaxed/simple;
	bh=MolUCV0A+icHOOATMkKEORfKO2NFfWcNgiHdVyLxerc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Loz/yaK9aPtLNURLmAGbprAaYw5Mvz8iqqBB+xFcUOYvp9we2oT5f2A581Eh+SdHm8WIDa/Sydqw6ENAFkE/CN6a5t5COamVAxD2k2ufB3ZzZT5kZQRzs++3644EeNf1HAkb9r+XodTENqulRpy9IKnd39B6euCtBwl/qHcdbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nyfmf4r5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNPtJ7005348;
	Fri, 24 May 2024 08:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5d5oHEebI5TE7KgXAlc0rk
	OpA/Qkd9P4UI0fJA0icy0=; b=nyfmf4r59PLLMc+BgymqomqlrR5D638Q30HGLz
	GwoebZHJWf04soT+GrxbSEytqyT20VoUm5Hwgjc23JdhK3dnRcVAjjUeL0+2Q89+
	Xfdg1827YD2kwYMy5ROmqG07E4HhgWzTp5DlEz/M+AgeNOwypp3I8903OUvMqo0+
	DyCCSFP++40M+4xaTnhXMvUudIC30+/U1KrMg/4xKnenjUA5BjcPeYg6n0mofnxW
	/WDVIcGjG1FEQWi6mQmS3PUN7J9Bz6o2jBPcOOo/M1V2tMqYvkrdbl9eWDx84enW
	bZOk0WuJD0PYNDsQgzWOcFlTAB3Ym8MTUUfWOW5v6tYXnNGQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaabq1mxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 08:23:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O8NCP7017209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 08:23:12 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 01:23:08 -0700
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
Subject: [PATCH v2] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage setting
Date: Fri, 24 May 2024 13:52:36 +0530
Message-ID: <20240524082236.24112-1-quic_kbajaj@quicinc.com>
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
X-Proofpoint-GUID: nGQyoYgCboG2at20B8l-DhTu4ok4rLYZ
X-Proofpoint-ORIG-GUID: nGQyoYgCboG2at20B8l-DhTu4ok4rLYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_02,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=443
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240057

While adding the USB support, it was found that the configuration
for regulator smps5 was incorrectly set. Upon cross verifying for
all the regulators, found that smps4, smps6 and smps8 are also
incorrectly configured. This patch fixes the same.

In particular -
- smps4 is 1.574V min and 2.04V max
- smps5 is 1.2V min and 1.4V max
- smps6 is 0.382V min and 1.12V max
- smps8 is fixed at 0.752V

Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
Changes in v2-
* Updated the commit message as suggested by Krzysztof
* Link to v1: https://lore.kernel.org/linux-arm-msm/20240514131038.28036-1-quic_kbajaj@quicinc.com/
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


