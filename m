Return-Path: <linux-arm-msm+bounces-51109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF2FA5D908
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 10:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A461618944B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 09:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C89E23875D;
	Wed, 12 Mar 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jmBGBK3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73122FF2E;
	Wed, 12 Mar 2025 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741770882; cv=none; b=NUZqsUZfMXUPj3RF7YJQgaSyY1J0ub0oshcjH/7MTSwQUc9gxVa8dwOBHFxpa4gBoL1UErsBrpR6XDF8D8DH+P3O46jA0gkGepSWmDssOwslUx1kDpcTlbkmsR9v3Fv2fzFhNqv7WkYgJR0NvN4IeeYa79wrFHMFhUslbzYSNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741770882; c=relaxed/simple;
	bh=cEKd2zeZ03W0AvZfiQXuQHDW6ARtsp1IdpFeReEbqHs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aQ52WR3bfmdDyDuwUy2BgBKDd2h1QBkMxzRHd50eE7iKiTXlG/SBda2cKbWpxqVcyY5s8Mv4zZsRdKGNJ1dj7G14ucfRziedqtI+yOmMEmi4KR+aEnCYn+Qeb6lrcwROjj13CUYxeLlVTtACgfkEGI1jYRNNsv+f5iB1PzbNlNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jmBGBK3C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHGuj017778;
	Wed, 12 Mar 2025 09:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8TmtBO5q52/HEosJi2z3Sf
	AuxsDFYLPd1Yxz9r4Z7hk=; b=jmBGBK3Cl3eWB18rwgyQ02r+XokLvPrvEwH85p
	3zZVboE7i2QcBOBmFjiYJtsng+DkUrEkfjINCUz7YA0r94MJ8AoifM/XTeroXzTA
	pV/j/5ev5mq8c3J5BEOrJpIdS1tdXO5da5L9N9VyxDq/jd99aakbCc94tXhEN35p
	dHI7MYFe2MU93iNaRpm/PKjPqqP/Xab/CCer31vrXucIy38o/vTPunEqZQEFSOly
	W+jb2HadV2C5C8h8cV5pJ/bh4ybfU9X0/HszqkiVwcSR0+q/1zGQscd9/Rk6yqcK
	gq7W46t7XH6hE/2i65e9ybN+ypNvEKaDGMMcY0rO8LbMd/Kg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au509t7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 09:14:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C9EZwF002387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 09:14:35 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Mar 2025 02:14:31 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: ipq5424: fix and relocate uart1 gpio configurations
Date: Wed, 12 Mar 2025 14:44:18 +0530
Message-ID: <20250312091418.3265352-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: 2qaKB0eA9gO_rc_KZ4Nx7rP-PJUIuHkW
X-Proofpoint-ORIG-GUID: 2qaKB0eA9gO_rc_KZ4Nx7rP-PJUIuHkW
X-Authority-Analysis: v=2.4 cv=a4ow9VSF c=1 sm=1 tr=0 ts=67d1507c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=jqHd-jEL5zBjBWWoCB0A:9 a=3EaL8tvSfWgu6Hm8GeNu:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=671
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120062

Update the bias configuration for UART1 TX and RX pins to ensure correct
settings for RDP466.

Additionally, move the UART1 GPIO configurations from the common .dtsi
file to the RDP-specific .dts files to account for differing bias
configurations across RDPs of IPQ5424.

Fixes: 1a91d2a6021e ("arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support")
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 16 +++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  7 -------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index b6e4bb3328b3..7b85aaa11ee8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -147,10 +147,24 @@ data-pins {
 			bias-pull-up;
 		};
 	};
+
+	uart1_tx_state: uart1-tx-state {
+		pins = "gpio44";
+		function = "uart1";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	uart1_rx_state: uart1-rx-state {
+		pins = "gpio43";
+		function = "uart1";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart1 {
-	pinctrl-0 = <&uart1_pins>;
+	pinctrl-0 = <&uart1_tx_state>, <&uart1_rx_state>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 7a7ad700a382..e190c43c1b11 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -262,13 +262,6 @@ tlmm: pinctrl@1000000 {
 			gpio-ranges = <&tlmm 0 0 50>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-
-			uart1_pins: uart1-state {
-				pins = "gpio43", "gpio44";
-				function = "uart1";
-				drive-strength = <8>;
-				bias-pull-up;
-			};
 		};
 
 		gcc: clock-controller@1800000 {

base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
-- 
2.34.1


