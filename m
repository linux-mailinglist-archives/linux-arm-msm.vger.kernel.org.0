Return-Path: <linux-arm-msm+bounces-76757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F33FBCB8EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 05:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7C403A91CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 03:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE42626981E;
	Fri, 10 Oct 2025 03:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUsyVB7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F70220C023;
	Fri, 10 Oct 2025 03:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760067469; cv=none; b=s+qo/YJbJ8nzC+KIg3vXjFo1rOHWmmrmg3ear3nxexWR3/dcLLKM13yXDSLRm7INsC+yGVYZe6Wj9FS2Gm8r8M8WWJZ6QSQF8/jcrZq6T1oLptjZmGCNKXDqDQ1BHJZLkMWy8qcXzvMa5QO4y82Jsz+WXmjgY0LnmV8ySymazgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760067469; c=relaxed/simple;
	bh=jAFjB+LSyLd0uwQSk533JNzasoXU54YfZO2ivbGyKHY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=i7kxbjsHaCxewRhesN/hlJzIFhkBubN3ZTgqxeLwTCgHhWR+lZQYkwJYvLTskQHkH4IcikD/BK0LbrlION7ioT5cd1x8kVtxIYD4bIq4IWXOGBjI3xyg6+oQQ0dbVzfXyITXZvQu9ZF+lbKLw5hakcXNkzEgVzKDeISYhJ4kGOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUsyVB7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599F0AwL022299;
	Fri, 10 Oct 2025 03:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KeBoOCd69T5grc/m/FPb58
	gljrf765XIfL3PD2UhSh4=; b=VUsyVB7fEgC6zBRK+9VHg8GEWq4hUNVySidjLe
	/3UHbTAHxzrKGfUMtCWDOb6eZhaQ2D/un5AK79t0NX+M8lCeXCtsDf9M8TVWg5ge
	tPB9UpakhBgOZnRGC2rJDjwb4Byl6+viGDShs/HJun4GEOw/Cq/ElHwSYehUr2dw
	DB+5tZxuFkDvGDOP6TlK8qk4o0n/kE+9ND3JmGABqV3SWwx31FzBoXuoHYlsHrz1
	KsfzYUHIVtpNrrBRQCYmGneZ7eYnk2dX8XFjK3PHv/t6tLCDGkK86ebTTvNyQxvK
	P+1qhTGz7bxJkK2NDn2Ozd+8Xx6Db2Pkfk3GpA3U628RBvag==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sn096-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 03:37:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59A3bdR0013333;
	Fri, 10 Oct 2025 03:37:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 49jvnn4s6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 03:37:39 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59A3bd06013328;
	Fri, 10 Oct 2025 03:37:39 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (cse-cd01-lnx.qualcomm.com [10.64.75.209])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 59A3bdxH013325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 03:37:39 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 14B37221ED; Fri, 10 Oct 2025 11:37:38 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: Fix 4-speaker playback support
Date: Fri, 10 Oct 2025 11:37:28 +0800
Message-Id: <20251010033728.1808133-1-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JOXdVv_34kjKr3JRz8_MXs1oiywZne5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXz8eZjBCZ3Iao
 hGsx3dxUHi88w/7I63vaDLDBtunPxjPM2MP9854/x3VWJ3XljrxqUxwia7qWPMh0FMl5ZiwrvJz
 BBLHI4PP6gzu5pWhn4eE0CQa7aUVR9PbbT24pRHFT/aMfNueGg2VkXABxq9iRaGmpmzsSeCuGA5
 U3CAfS+wa/l7mNwg+zYhhdJJb0ImXyhOdJWq3hzyRSfxMGpV/cegk0PAvdBjtx8UR/kphO3PJoZ
 wfjPhRxEebyOgY0ofow8sR28GD/tya+CTWbH8VgoXZFKAsg9S4Tw6pEaSyqz0DlS+fp6+qQtOFC
 o4SDSOgfP0luZcgu8lkqjJt/60nmMUfi7rDupkflHB/yAGRTdqTQrd+K6KA8XaO9q1upqzyBUu1
 z0DBGLq49/Jou1zoyFbfI1QT59DeEw==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e87f87 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=eOVVwEV3zLrTfS32KukA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: JOXdVv_34kjKr3JRz8_MXs1oiywZne5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On the HAMOA-IOT-EVK board only 2 out of 4 speakers were functional.
Unlike the CRD, which shares a single GPIO reset line for WSA1/2,
this board provides a dedicated GPIO reset for each WSA, resulting
in 4 separate reset lines.

Update the device tree accordingly so that all 4 speakers can
playback audio as expected.

Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
Changes in v2:
- Removed `output-` properties in favor of explicit `gpiod_*` API calls
  in the driver, to avoid unintended reset assertion during OF node parsing.
- Split pinctrl entries so that GPIO configs for speaker amps are
  associated with each individual device, instead of the soundwire host.
- Renamed speaker pinctrl labels for consistency:
  spkr0_* → spkr_0_* (e.g. spkr_0_sd_n_active: spkr-0-sd-n-active-state)
  spkr1_* → spkr_1_* (e.g. spkr_1_sd_n_active: spkr-1-sd-n-active-state)
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 38 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index df8d6e5c1f45..36dd6599402b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -743,20 +743,32 @@ retimer_ss1_con_sbu_out: endpoint {
 };
 
 &lpass_tlmm {
-	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
 		pins = "gpio12";
 		function = "gpio";
 		drive-strength = <16>;
 		bias-disable;
-		output-low;
 	};
 
-	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		pins = "gpio13";
 		function = "gpio";
 		drive-strength = <16>;
 		bias-disable;
-		output-low;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio17";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_3_sd_n_active: spkr-3-sd-n-active-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
 	};
 };
 
@@ -908,12 +920,14 @@ &smb2360_2_eusb2_repeater {
 &swr0 {
 	status = "okay";
 
-	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-0 = <&wsa_swr_active>;
 	pinctrl-names = "default";
 
 	/* WSA8845, Left Woofer */
 	left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
+		pinctrl-0 = <&spkr_0_sd_n_active>;
+		pinctrl-names = "default";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
@@ -926,8 +940,10 @@ left_woofer: speaker@0,0 {
 	/* WSA8845, Left Tweeter */
 	left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
 		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
@@ -961,14 +977,16 @@ wcd_tx: codec@0,3 {
 &swr3 {
 	status = "okay";
 
-	pinctrl-0 = <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
+	pinctrl-0 = <&wsa2_swr_active>;
 	pinctrl-names = "default";
 
 	/* WSA8845, Right Woofer */
 	right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
 		reg = <0 0>;
-		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 17 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
@@ -979,8 +997,10 @@ right_woofer: speaker@0,0 {
 	/* WSA8845, Right Tweeter */
 	right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
+		pinctrl-0 = <&spkr_3_sd_n_active>;
+		pinctrl-names = "default";
 		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_LOW>;
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
-- 
2.34.1


