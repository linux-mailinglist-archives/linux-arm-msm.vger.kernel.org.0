Return-Path: <linux-arm-msm+bounces-33079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C198FE5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 10:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB3501C23287
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 08:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD2612C7F9;
	Fri,  4 Oct 2024 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oni3TVM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D57F7CA;
	Fri,  4 Oct 2024 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028892; cv=none; b=XMguftFUYWl8H6GWw2sDRqkGqL97B6Q44/XGkI62YkhFaligtl2nNgecw1S5dknSRoHjGfZjSf0qZF/dEMkkhvLACA3R7ZcZfHCwzMK+X//ZXmM5vgUpJLf2cqbfMByOzAHWP84UvUp3z717/3Ngl2pbUegK1NJxN6rOZsc6kgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028892; c=relaxed/simple;
	bh=Z1MZHTwqsR/zsDZe7dRQTbdA+xQApyzQ7Mb392IMJeI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pz8ZIQIXmmEiU5Dl2K8Mqc+NFnITrC2UqUhR0bEg9ndHjphvhcFxbYZhkRMCy2tQaScCAa5ZTQOaWtV69mt7zik6/sFfiCiqf1o42uzsP00ctpQHwobkwb0ue33JumqiUrlHYHSgIWoC6LFuCFQCRNaBBl33StkSEnP4kquyvQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oni3TVM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I06GF022651;
	Fri, 4 Oct 2024 08:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=upSQf6E22BgCRjd3hgjDhJ
	Od9x+WEIScWQj5WesuK94=; b=Oni3TVM5ZBQNlcMMRYAB5ehZxFmO/Q4F0snIPR
	8Rfx1WdkwkDfPA7OWNjuJXUTd3lohmoz69cLWYXu24IvdhPiWhpmW10JTycOboEt
	Owg+TWlxzvuvWyY0PhDQN/x/DUGXQpSaCJ7wnk4GuDPRwT4o+NlRSlpn2uR+7ete
	Y6Zsgs8bXivjrQxcCGCrz1WciKEeqMb0FtY4k68ElABS3RoieBNGYp9Qsx/D53M6
	nDyDyb8DrTNSeQ7iId6XDVBEKypySfgUJA4Llo8sHl0dH8gFtRHFtMsf5MUuSVLC
	XPpLrRryFIyrj5MScMW/vbDmJV0kaVGdcaM//MWjYDgBvpwQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kse41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 08:01:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49481Q0U030835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 08:01:26 GMT
Received: from hu-kotarake-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 01:01:22 -0700
From: Rakesh Kota <quic_kotarake@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_kamalw@quicinc.com>, <quic_jprakash@quicinc.com>,
        <quic_kotarake@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: qcm6490: Allow UFS regulators load/mode setting
Date: Fri, 4 Oct 2024 13:31:10 +0530
Message-ID: <20241004080110.4150476-1-quic_kotarake@quicinc.com>
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
X-Proofpoint-GUID: xTA9aKiXay_hhXqzgSO1fbGCeIF27htz
X-Proofpoint-ORIG-GUID: xTA9aKiXay_hhXqzgSO1fbGCeIF27htz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=624 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040057

The UFS driver expects to be able to set load (and by extension, mode)
on its supply regulators. Add the necessary properties to make that
possible.

While at it, UFS rails have different voltage requirement for UFS2.x
v/s UFS3.x. Bootloader sets the proper voltage based on UFS type.
There can be case where the voltage set by bootloader is overridden
by HLOS client.

To prevent above issue, add change to remove voltage voting support
for dedicated UFS rails.

Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 84c45419cb8d..8a4df9c2a946 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -258,13 +258,15 @@ vreg_l6b_1p2: ldo6 {
 			regulator-name = "vreg_l6b_1p2";
 			regulator-min-microvolt = <1140000>;
 			regulator-max-microvolt = <1260000>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7b_2p952: ldo7 {
 			regulator-name = "vreg_l7b_2p952";
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <3544000>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -277,8 +279,8 @@ vreg_l8b_0p904: ldo8 {
 
 		vreg_l9b_1p2: ldo9 {
 			regulator-name = "vreg_l9b_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1304000>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -467,6 +469,8 @@ vreg_l10c_0p88: ldo10 {
 			regulator-name = "vreg_l10c_0p88";
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <1050000>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.34.1


