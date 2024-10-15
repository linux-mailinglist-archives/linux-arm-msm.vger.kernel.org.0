Return-Path: <linux-arm-msm+bounces-34442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CBA99ED2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 15:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E22FD286DA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35701EB9F1;
	Tue, 15 Oct 2024 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IpezfYj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156AF1FC7EF;
	Tue, 15 Oct 2024 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998473; cv=none; b=Lvp8O4hUugs9QNyK0LvVIRlkapvOHuNaZh9ObiWaw1Wu5pOcoJruVSuMJD1PFrWR07vdkr6yMB2NBP3rzD1uyBby4pYzM5ENcdNhtKpzct2j6ucEZKA1xhRtevsuhC0tFINoa0Gp8+Pu7vzKRpTG/7raPKH+wE0H9MMExWIYH7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998473; c=relaxed/simple;
	bh=CMw/3KzLHwM0hcPipccWgf3XPBaTYU7bKTrJRV1RlBw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tr65T7BeL0E1cCZMn9sCwENHVIYGdDoT5j6BKjbHR/Cfv44QaqeF6wyQyQl5B+p7Fscohz82tepSQQx7TlbYMjMXRj7U7qS4WWwkfa3y23QFU12oXuSqjJUR2OaYQzZU4EXv81KnZYvlHW9fXYQjIeIBtUWEoKYoCblCDdwi0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IpezfYj/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FBDQxO028544;
	Tue, 15 Oct 2024 13:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q0fbcOtY8v19KKgTblM7Yu
	JbUoVgeLttVGx3W4hCnfs=; b=IpezfYj/MU26BV6/zQq4nXY4KMWm0RNJqUwLaU
	U6xB9umcrDxgaVEOk9nX0D18DE/6HamDd7w8Ltgr7+OdY3Sso0AgU39mLFxfF8mc
	OQNFFag2i8QZcIQNxoHyUoBYVOSe9zH0EK0JzrYlUYXyhEMmhQ/Z7x285nGBmVZP
	cKnpJ4g3JMz6JWMAa1OSTIYEmaiXmDlvYNKnI8PT3+DoFnnh64IoqsNzKVQ5CCQy
	WPaiURb+wYhvfVODzLj4p3T8kyABTLQ7oW/ksgb2SV0EAkG8+snL1opgWW84pIV6
	Kv9idopKXfhl5JEuov11DiTDLsTLcQQE4rwGaUCLEO/UzHwQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4292evkcg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 13:21:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FDL7WR030926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 13:21:07 GMT
Received: from hu-kotarake-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 06:21:03 -0700
From: Rakesh Kota <quic_kotarake@quicinc.com>
To: <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_kamalw@quicinc.com>, <quic_jprakash@quicinc.com>,
        <quic_kotarake@quicinc.com>
Subject: [PATCH V2] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators load/mode setting
Date: Tue, 15 Oct 2024 18:50:49 +0530
Message-ID: <20241015132049.2037500-1-quic_kotarake@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N2nbzc-A4sXKmPcvO-KribtwDwvPHdDZ
X-Proofpoint-ORIG-GUID: N2nbzc-A4sXKmPcvO-KribtwDwvPHdDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=609 lowpriorityscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410150091

The UFS driver expects to be able to set load (and by extension, mode)
on its supply regulators. Add the necessary properties to make that
possible.

Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
---
Changes V2:
 - Dropped the removing Min and Max Voltage change as suggusted by the Dmitry
 - Link to v1: https://lore.kernel.org/all/20241004080110.4150476-1-quic_kotarake@quicinc.com
--- 
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 5f3d4807ac43..a000bf9115cc 100644
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
+			regulator-allow-set-load
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


