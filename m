Return-Path: <linux-arm-msm+bounces-76555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E94BC7BBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 09:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF8CD3AD8AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 07:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B53F18DB35;
	Thu,  9 Oct 2025 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am1NuR+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E4B3FF1;
	Thu,  9 Oct 2025 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759995413; cv=none; b=EDzQ8Usq3o5YNv7NiZp94IO6SqY/k7qMhkoe05JgodP0itZYj25XnB434GT9vyErvHyrBvw5R7aLwfuRJGZEWtBAmLMpmwUn5ISOBv6+821xQxfDxJYGQY0yInfxYWZN/zXqer7TrJXjEfvecooCtVma3uNYlAe40G+sF/n8R4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759995413; c=relaxed/simple;
	bh=0/bWicUk/BVaia51IikBaZhokqlPL3FIkBIaSanm3jM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=taoMEZh+VFDBSx7kocyI2Q32Ly1/WyVdyZ7vsTK34c2x4rJE4QiMG6YBtnRAcqJnGxXgAc/vdGP7nnkBVSQOLhN+sFOVbSFXM2+jcjEl5g9qR3kMxUiS2dRMt3outj2PE0f7aZutPg5jW+6lPNIfGEs6rGdpoDNYsaHEurADzFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am1NuR+2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EWY4022397;
	Thu, 9 Oct 2025 07:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w1VyO5jtQ/h9Miug+6qUpSOcUSFktKY7E2S
	shDdmG/Y=; b=am1NuR+2DkpT+P0EF3JvP5Pz9pvwvmpXSMwbRD5hTs8aKVOna7a
	T6w64mmywqueHMS26wnbqsvI282XjDRvrDJgPuc7fVM7XDpY50rsTpn/+cmEHFz1
	jecUamHmrjoxWHOZ7QfEJwCdj/wu3/IL0F+18QaZCEVnqQyYCeU/zr/HmbVAGLeI
	6PeJmxKNipZtRiQUYvnYs5Z5DtvSJWhlvYYWuyIJTJPME/uWJmvhRz4se9+AJKPC
	5XXS0sIZ5rxSJ5nls5tsi9Y7WRM4w5y/AJhK2iLIcUPSBb+5jSgV3E9Hickr+mUc
	J5lhr9pdk9lWktIFPUtK81tK55WlBlS3/ag==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4shw93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 07:36:47 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5997aiUg018181;
	Thu, 9 Oct 2025 07:36:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 49jvnmxja2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 07:36:44 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5997aiVF018176;
	Thu, 9 Oct 2025 07:36:44 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5997ahMu018173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 07:36:44 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 933DA21014; Thu,  9 Oct 2025 15:26:36 +0800 (CST)
From: leqi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        leqi <le.qi@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: Fix 4-speaker playback support
Date: Thu,  9 Oct 2025 15:26:30 +0800
Message-Id: <20251009072630.460387-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SloV3XHDG07T1lqQMuTsMpdQ28QcJBng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX//7pXtwxL9ey
 TjylyU9LfqWLusl86jpCZRec3HXGITrG2yPnnMBhtSnBA3gEtYM690sTWSqLjHUfR9P/7TYEJPD
 +wbfSxRFobQAPIWeQh3nHFJyNvyAXehC3bjN04GC6PQAdE+jZMYG0Vm2xjKjZu3ha9f3Zf9rXoW
 KTvtxpmP3SzzgJzCZlvtH+WMrc46xUwsjbXkhwLB6VUg9LbIlaA7IlBxeLoXR53aKdTevhh0u7s
 4xE0uJ2vSFk8NC4f6TY/xytiGh82e/c1hyyDZiTHkPINnDGbr82GR6hKNm8Rgxx3QCgbVmvx77y
 36Fb10nWpqm0NKNatl4eCSEUY3xxLzrm3M4hn3bYYFvjnSAZdJWWjXA0AK5VbBEff5VAQPpi9zq
 +3AYqCH6oU0j2GGsUxcnkeGbo5HQZQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e76610 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=eOVVwEV3zLrTfS32KukA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: SloV3XHDG07T1lqQMuTsMpdQ28QcJBng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On the HAMOA-IOT-EVK board only 2 out of 4 speakers were functional.
Unlike the CRD, which shares a single GPIO reset line for WSA1/2,
this board provides a dedicated GPIO reset for each WSA, resulting
in 4 separate reset lines.

Update the device tree accordingly so that all 4 speakers can
playback audio as expected.

Signed-off-by: leqi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index df8d6e5c1f45..de9af19be6e8 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -743,7 +743,7 @@ retimer_ss1_con_sbu_out: endpoint {
 };
 
 &lpass_tlmm {
-	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+	spkr0_sd_n_active: spkr0-sd-n-active-state {
 		pins = "gpio12";
 		function = "gpio";
 		drive-strength = <16>;
@@ -751,13 +751,29 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		output-low;
 	};
 
-	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
+	spkr1_sd_n_active: spkr1-sd-n-active-state {
 		pins = "gpio13";
 		function = "gpio";
 		drive-strength = <16>;
 		bias-disable;
 		output-low;
 	};
+
+	spkr2_sd_n_active: spkr2-sd-n-active-state {
+		pins = "gpio17";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr3_sd_n_active: spkr3-sd-n-active-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &lpass_vamacro {
@@ -908,7 +924,7 @@ &smb2360_2_eusb2_repeater {
 &swr0 {
 	status = "okay";
 
-	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-0 = <&wsa_swr_active>, <&spkr0_sd_n_active>, <&spkr1_sd_n_active>;
 	pinctrl-names = "default";
 
 	/* WSA8845, Left Woofer */
@@ -927,7 +943,7 @@ left_woofer: speaker@0,0 {
 	left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
@@ -961,14 +977,14 @@ wcd_tx: codec@0,3 {
 &swr3 {
 	status = "okay";
 
-	pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
+	pinctrl-0 = <&wsa2_swr_active>, <&spkr2_sd_n_active>, <&spkr3_sd_n_active>;
 	pinctrl-names = "default";
 
 	/* WSA8845, Right Woofer */
 	right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
-		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 17 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
@@ -980,7 +996,7 @@ right_woofer: speaker@0,0 {
 	right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
-- 
2.34.1


