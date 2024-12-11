Return-Path: <linux-arm-msm+bounces-41449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 437719EC8B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1AD81886D60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DEC207A3C;
	Wed, 11 Dec 2024 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XygKTfGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BC220409E;
	Wed, 11 Dec 2024 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908631; cv=none; b=Kphc0SRPbwuWU0OXXOY3Ht91nfFK8cactlwqo3q02ZHcIVlKk+NWoZDFAkstdJoUh8DiqgCYCbuTaj+h4nt2t5WnQjRMhKZ1yBQ/acezVuKZlCyPkImQHJejMgJazpfDysGBwNsjh7EpsS9UcYerlihr6JkI6G7Ky+OwG5fnrrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908631; c=relaxed/simple;
	bh=cLClDIMs70WvGvtzo+tHXm+M/BCDnZJu+Z3Kov1rqp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=X+o/e4Yv3feSb03+rBdneqXCn2cEISTP/mm3qK/i2D7yUnMq5L3m4SCJdW48WgDhJkXQTfwmqy9BVdsk11cqH9GiJCHMUJ8tM0pmK/vtIDZcLQKxqH9VEnbfl/H9z686K9KnMCCNb3MNy6S0tk4GbnwmA/H+vqIu+jdUB8CCSHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XygKTfGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB5b3ja003641;
	Wed, 11 Dec 2024 09:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gq0OjpQFpBlu/IZSy2zO4H
	tvw2/5xtg/8eSc4QqrmWg=; b=XygKTfGuY+GwIEg6msFNOLUKquGJVE2jIAl6Z5
	Zf0Gm3l82tjyyeAcZIDgOfsmmepAw/lFm75QchD18NB59AJp17doH9WV6tuABghu
	3rl05lv8Pf0DFwTQgPMSR/ZnB76Cqxf5kaJsRrzYhCBRqOtYLSudDgQHss4VmgNM
	rnW4+SLLWr8snHDDDmcxN/J8PdqwWatrSRiZprvaNfzGu+EEd0w6r8YstMCWkPG0
	IhgXyfZdcEMKr5hi8onXLyLJ5IzC12YZnxrmzJCcQW84JgPLnAPG9HBdHk1FOrRs
	pZXlDOlCRs1K8FCF7/XpXouqyR/M+cgZssKdQ8TRpoAusrNQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw47auq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:17:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB9H4ko028123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:17:04 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 01:16:58 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Wed, 11 Dec 2024 17:16:15 +0800
Subject: [PATCH] arm64: dts: qcom: qcs615-ride: Fixing power issue in LPM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-v1-1-a08d12c415f0@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGBYWWcC/5WPS27DMAxErxJoXRYmJSd2V71HkYVE0QmB+hPJd
 hMEvntV5wRdzgB88/g0WZJKNh+Hp0myatZxKAHfDoavfrgIaCzZUEUOCRHCcoFO73DjfMQakka
 BOGf4nnqYxh9JoDkvAs6JtdzELtpoCm1KUs72pa/zKye5LWVwfpUm+CzAY9/rXAQC+dCga1tqG
 Fk8xZOwtxVHW4dw6qRCV9XW/LGumucxPfYnVtxh//ZdERCo6Vo6upYt+c8ixzrwe1Ey523bfgE
 eQLXYLAEAAA==
X-Change-ID: 20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-44e33c8dfd3d
To: <tingweiz@qti.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <fenglinw@qti.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733908618; l=6422;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=cLClDIMs70WvGvtzo+tHXm+M/BCDnZJu+Z3Kov1rqp8=;
 b=2ATpWHer3ttcMqDFnHJ2FSLko2Vm+AQZ5ViQATNcM0h3IUl1ItjLMSEUHTUgsFvPvDgntT9Wj
 0xNIvDizQG4C3pLyDmfRb/LxdGi8UWyxKT6KbxrdCZHAwsid1A/KPW2
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9mbbhhucb51Nk2DRBL1HdN_uu5uP0PZg
X-Proofpoint-GUID: 9mbbhhucb51Nk2DRBL1HdN_uu5uP0PZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=977
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110070

Change all LPM to HPM for regulators init-mode and disallowed setting
mode. LPM mode provides at most 10/30mA current for consumers such as
UFS,eMMC,PCIe. That caused problems because consumers take much more
than that. At the same time, a lot of drivers didn't set load in code
that makes it impossible for regulator framework to know exaclty when
to switch mode.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
At the beginning, The QCS615-ride device gets some power issues when 
enabling peripherals on the board as well as in the SoC. After figuring 
out the root cause which pointed to that drivers should tell the regula
tor framework the required current the devices need separately, so the 
regulator framework can get to know when to switch modes to satisfy the 
requirment. But a lot of drivers did not set load for peripherals. Some 
did setting and some did not, which sometimes caused problem when LPM 
of regulators is allowed. E.g. LDO12 supplies UFS and USB. UFS sets the 
load of AmA(HPM), while USB PHY does not set any(0mA LPM). In this case, 
USB can encounter insufficient power supply when UFS's going to sleep. 

There is some discussion about this:
https://lore.kernel.org/all/5tbevb5wv2s43pccytv4qol4yhq4s7iw2mmqp23vt3ujqd6xev@hkioqmwoitbd/
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 52 +++++---------------------------
 1 file changed, 8 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index a25928933e2b66241258e418c6e5bc36c306101e..32db107dc660cff9d2ccbf19eceb5c5539c591a9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -71,30 +71,21 @@ vreg_l1a: ldo1 {
 			regulator-name = "vreg_l1a";
 			regulator-min-microvolt = <488000>;
 			regulator-max-microvolt = <852000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
 			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <3100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l3a: ldo3 {
 			regulator-name = "vreg_l3a";
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1248000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l5a: ldo5 {
@@ -102,9 +93,6 @@ vreg_l5a: ldo5 {
 			regulator-min-microvolt = <875000>;
 			regulator-max-microvolt = <975000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7a: ldo7 {
@@ -112,9 +100,6 @@ vreg_l7a: ldo7 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1900000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l8a: ldo8 {
@@ -122,9 +107,6 @@ vreg_l8a: ldo8 {
 			regulator-min-microvolt = <1150000>;
 			regulator-max-microvolt = <1350000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l10a: ldo10 {
@@ -132,59 +114,41 @@ vreg_l10a: ldo10 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <3312000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l11a: ldo11 {
 			regulator-name = "vreg_l11a";
 			regulator-min-microvolt = <1232000>;
 			regulator-max-microvolt = <1260000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l12a: ldo12 {
 			regulator-name = "vreg_l12a";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1890000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l13a: ldo13 {
 			regulator-name = "vreg_l13a";
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3230000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l15a: ldo15 {
 			regulator-name = "vreg_l15a";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l16a: ldo16 {
 			regulator-name = "vreg_l16a";
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3312000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
-			regulator-allow-set-load;
-			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
-						   RPMH_REGULATOR_MODE_HPM>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l17a: ldo17 {

---
base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
change-id: 20241211-bug-fix-qcs615-ride-dts-lpm-power-issue-44e33c8dfd3d

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


