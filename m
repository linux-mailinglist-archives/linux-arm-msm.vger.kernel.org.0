Return-Path: <linux-arm-msm+bounces-54912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9DDA95FAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 09:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD2BB188C19F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 07:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CE11EB1AA;
	Tue, 22 Apr 2025 07:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZMevcdKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27DD524C;
	Tue, 22 Apr 2025 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307679; cv=none; b=dIRm3agA3kmWXyGkz/psSBg8P1bc+hDueaAx2iiHci6tKOmAhYvsbsIgBUAlDdroUiTB7cqQ+u0B5Tcy8dgcfPpPB331vAfenjK54216jH9jXIdbDmhc4uzonthH6cb5ruQ4DPp7nWlbR+kbyEK7M2HqVaPKo5Qxun05ONn9XHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307679; c=relaxed/simple;
	bh=MssVCiqVxYKVe+2VsYfw38Hcx5DEN4Ftbbc3n2ktrTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=tgghNPv++2VK0pcN3dVCAImwc1dU09H2CBM5hWJVG0Ty11l8J76t897fUcQmK+n4bBRDexVMzEZiBhFrgmqcM2ZOl03OoOWHfTjPyFyLzr3718NxeEljCN3qXGwVyPEZH3R9+8aKh7nim5fUErx/7WLOGDYrDaFtCcO/VwrCltU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZMevcdKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4P0b5011611;
	Tue, 22 Apr 2025 07:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G6hZ6ApnRi6XuWlKJClmIK
	YDy9RsG27nPvbmfsOp1MA=; b=ZMevcdKHvwm2yz0fpjJuxogiwxFpz5znnn+LkJ
	oZ7QmxlPCe/xInIQXHobwYV/lCdDrGZJyDo9FUhk99TZDmQ3/BaNHZyo+4qLM1si
	9Ka9L+GwCEKdPoID8SUPVQOxxR4hpzJVsYDKo+er4M4yjSPTh4AyVFmkbSEjOSyh
	E5aH/NMJp+LbjgZFs1fFjmTT2/5HclgBKTI36sdSuDB6d0yVx+lTp2bYsS2EnN9H
	o+lkkeusG2zgaRxrQmzu7OVYAZS67boBiXsUH/3SI5OQlDnQ6G1fz8g8sq9B4Y18
	Qoigw8QDoEKSyWHAdGxNmx8PI2zjBoSd/NTqvVshOaLEVsOw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450peeag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 07:41:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53M7fDnE029037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 07:41:13 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 00:40:10 -0700
From: Song Xue <quic_songxue@quicinc.com>
Date: Tue, 22 Apr 2025 15:39:54 +0800
Subject: [PATCH] arm64: dts: qcom: qcs615-ride: Add PSCI SYSTEM_RESET2
 types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250422-add_psci_sys_reset2_modes_for_qcs615-v1-1-7faaf877366e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMpHB2gC/x3NwQrCMAyA4VcZOVtoMzvEVxEJo0k1B9eZiChj7
 27x+F3+fwMXU3E4DxuYvNW1LR3pMEC5z8tNgnI3YMQcxzGGmZlWL0r+dTJxeSE9GotTbUbP4lP
 K4ShV0gmRU56gp1aTqp//5nLd9x8LYOR/dgAAAA==
X-Change-ID: 20250330-add_psci_sys_reset2_modes_for_qcs615-4efe1822d156
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Song Xue
	<quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745307610; l=1643;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=MssVCiqVxYKVe+2VsYfw38Hcx5DEN4Ftbbc3n2ktrTs=;
 b=OpYX2+03nu0djG4RcgASUmq7flkmxbp8Ko+g5jbZ27t3ePbHPacuYCblB0/0Uu+l4AjJwhVfl
 4KWvl01vm7sAmutRS7j/qwQPcAn+LvwKFdTU7R/X+VD9PUZOAzWSJn1
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6807481a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nkDiZCTAP52MG6eO84oA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nO7UhOxAJtwTGYAxUF7dSeXbRE31NaYA
X-Proofpoint-ORIG-GUID: nO7UhOxAJtwTGYAxUF7dSeXbRE31NaYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=967 phishscore=0 clxscore=1011 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220058

Add properties to support Bootloader and Edl mode for PSCI system
reset2 reboot modes. The cookie and magic values set will be used
by SYSTEM_RESET2 call.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
Dependencies:
Link to bindings and driver changes:
https://lore.kernel.org/all/20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..7dec44de8143939e52899c4bed9f57a417688b76 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -236,6 +236,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reset-types {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index edfb796d8dd38f5d65fd4327308fb5ac52d2b95e..48f7b975b6205a659e5c7ecd296e59b0d3ee50f4 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -352,7 +352,7 @@ opp-128000000 {
 		};
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

---
base-commit: e21edb1638e82460f126a6e49bcdd958d452929c
change-id: 20250330-add_psci_sys_reset2_modes_for_qcs615-4efe1822d156

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


