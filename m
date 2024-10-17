Return-Path: <linux-arm-msm+bounces-34736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1166C9A2232
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 14:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27B411C21B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 12:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7331DB522;
	Thu, 17 Oct 2024 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LMOomhnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD741C695;
	Thu, 17 Oct 2024 12:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168176; cv=none; b=p2lxLkiYkeXmzMHq+Xn5hepeF3BAV3V12Brf38fO3mF8BongJ++RFN7HMnZpF+Ci2BIgobgwNBOPLaSmXst3HLTa017HDYb/yLsCR9O9eAONsof1J3CY9P6dlkuudhGj9Df6ljOOy64CeYbVogKHxKjwPIDxO2RgVC5qouc/2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168176; c=relaxed/simple;
	bh=+k83qPUbyJCPSGHPQBNhAA5WKwDMMKi8PYHk1Xwxqm4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=abSThAGbHQcSVqf6yLHluIwJJeeDl1iDW+upgWkFESIjH85Qz4WUlo8dlE5jqrapiPZnPW4YrPwwegZdAYptKlnwYOLcnjr9SUU8iVPfDcGb2jUNwUbQ60xCr8ClyeVLfFvfvNVsk3NQZDiesE0nhtv0IT/M0W56nLTWJ5razrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LMOomhnj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HAMgPA019917;
	Thu, 17 Oct 2024 12:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n/RT/oAHsNJlvxs8gasJVn
	qxHhtxzhHBmr9kZN4MBV8=; b=LMOomhnj1CB8xd/gcQJ+rqwgbXXoUvqBZeZ7UC
	rE6xdNydXg9EA5ch161nOdOl4y7U9TJ2ffs44913fHo2yW747RrGiAiU5md9o4zo
	uYmU9AyOb9IsW4Cjgcys3w0LB09E02bMEpF2HnOppCQmUF57E7mDvcMItoySp5qH
	SgocyVQs9gTwpGp4PVpLFogjugNT2wTAEO5it2cLvzRda0ML6lntjg01+rhHSWe5
	VLvvPud7mW1zpGzzD1swPRKm6BvtJSoK1z8XAm8+teUjXCFM8qYUY0lFcwb3g+Q+
	nuFZVRsqh2iQ6rUqgD75qa9cUOZrUPXXKy2Ox0+jGpkU2AAw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx0bd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 12:29:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HCTRP4016053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 12:29:27 GMT
Received: from hu-kotarake-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 05:29:23 -0700
From: Rakesh Kota <quic_kotarake@quicinc.com>
To: <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_kamalw@quicinc.com>, <quic_jprakash@quicinc.com>,
        <quic_kotarake@quicinc.com>
Subject: [PATCH V4] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators load/mode setting
Date: Thu, 17 Oct 2024 17:58:58 +0530
Message-ID: <20241017122858.3664474-1-quic_kotarake@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6lxtUuy_BtcP1z3hbqt7hobHyRK9ZcS-
X-Proofpoint-ORIG-GUID: 6lxtUuy_BtcP1z3hbqt7hobHyRK9ZcS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=579 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170085

The UFS driver expects to be able to set load (and by extension, mode)
on its supply regulators. Add the necessary properties to make that
possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
---
Changes from V3:
 - Add missing change history for V1 and V2.
 - Add missing Reviewed-by tag.
Changes from V2:
 - Add missing semicolon (;) after regulator-allow-set-load prop for
   ldo9 regulator.
Changes from V1:
 - Dropped the removing Min and Max Voltage change as suggested by
   Dmitry.
 - Link to V1: https://lore.kernel.org/all/20241004080110.4150476-1-quic_kotarake@quicinc.com
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 5f3d4807ac43..bfb1cdc238cc 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -258,6 +258,8 @@ vreg_l6b_1p2: ldo6 {
 			regulator-name = "vreg_l6b_1p2";
 			regulator-min-microvolt = <1140000>;
 			regulator-max-microvolt = <1260000>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -265,6 +267,8 @@ vreg_l7b_2p952: ldo7 {
 			regulator-name = "vreg_l7b_2p952";
 			regulator-min-microvolt = <2400000>;
 			regulator-max-microvolt = <3544000>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -279,6 +283,8 @@ vreg_l9b_1p2: ldo9 {
 			regulator-name = "vreg_l9b_1p2";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1304000>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -467,6 +473,8 @@ vreg_l10c_0p88: ldo10 {
 			regulator-name = "vreg_l10c_0p88";
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <1050000>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.34.1


