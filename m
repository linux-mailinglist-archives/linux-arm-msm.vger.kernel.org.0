Return-Path: <linux-arm-msm+bounces-34572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EF49A0693
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A8BE1F24387
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93E12071F9;
	Wed, 16 Oct 2024 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l93f13vT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0DB206063;
	Wed, 16 Oct 2024 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073159; cv=none; b=ltLnM+67BmPdSnfw9J4cT8bwqrSo+btFZ4P+1CGQnybedNq1LwQ8Ksor2nVPVomir5HB9WlCPf7q0iNYVAqgqhWu6nmYbgbql4hZf0ertzoTJ/EHYrnW1AzEMLnvzq6fDih4rK2POb2oZzhlDjwSIsHXDu6DDmSwLJ+7vvhDLpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073159; c=relaxed/simple;
	bh=j3pSe7FQjMMrX/McvHfRUETk4GsKHPg0yBTaOgDAK1o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YCtT0ZtycxLCCmISjAooUPA0OoMPHxnJ2bXJGt0m2NbUgcjQkynhIgpYG9P5L3byZ6TfY45gwyl+oSjTzaUFpS46+rY6ckB/nuvj1ftlG7rnqvlFyzi+WCdw9eJh9WN7bj/lrocBhfptBozt8ZpHDPHxbSRQbdkdaNGf8lfV+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l93f13vT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8QWYk022182;
	Wed, 16 Oct 2024 10:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ep6G7+6GjTUTsXDJ8R6LRj
	6xleyRRN36AMDyNuVEols=; b=l93f13vTnHWYzf5AMkGYem9xB6KbuwqK1nhyFJ
	oTbH/nbGXdHogIk3P8hmaiDCLi/XWYJxW7ZRDuH7PMotuJLMokSpNjbWj9GLpukP
	DUJxp3w/UPpD1gSP2eW1Azi/lEgCbjCh1GcTCq4nK/kebY/d/t1VY5whnlZ0PoRJ
	Xlg+l9xDrD8YizdZ5pmN1FFKJNf+kJJEeXSRoeevB073ISB/+a6dY+5kLBt4NJOc
	b8lwpaqWb3rAU2wPeGIPqvC0fqJnS+EhWwiKYHt3uQ8hqRsA0M8MJD+k3dEFISxW
	Wed1ETUWf5bvQ8i+r55FVZ7wUNpnrTIpeEo9lhuwHO8wF/Tg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429uapavwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 10:05:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GA5rqi016979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 10:05:53 GMT
Received: from hu-kotarake-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 03:05:49 -0700
From: Rakesh Kota <quic_kotarake@quicinc.com>
To: <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_kamalw@quicinc.com>, <quic_jprakash@quicinc.com>,
        <quic_kotarake@quicinc.com>
Subject: [PATCH V3] arm64: dts: qcom: qcm6490-idp: Allow UFS regulators load/mode setting
Date: Wed, 16 Oct 2024 15:35:11 +0530
Message-ID: <20241016100511.2890983-1-quic_kotarake@quicinc.com>
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
X-Proofpoint-ORIG-GUID: iGvjMm2C9Z_GehUdIWryTEFRFyGeHNp_
X-Proofpoint-GUID: iGvjMm2C9Z_GehUdIWryTEFRFyGeHNp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=599
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160063

The UFS driver expects to be able to set load (and by extension, mode)
on its supply regulators. Add the necessary properties to make that
possible.

Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
---
Changes V3:
 - Somehow after fixing the compilation in last patch, i have missed to
   do git  --amend the change. apology for that, in this change i have
   fixed that compilation issue.
 - Link V2 : https://lore.kernel.org/all/20241015132049.2037500-1-quic_kotarake@quicinc.com/
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


