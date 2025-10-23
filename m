Return-Path: <linux-arm-msm+bounces-78436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D455EBFF0D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 32E6534FC62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1AF224B14;
	Thu, 23 Oct 2025 04:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JxCBx21R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3164C2581;
	Thu, 23 Oct 2025 04:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761192168; cv=none; b=jb3TcaDJRa+tlHbnHiOZj60eYBJGBt6LH7JaTe40kqDeiomKAJMV5nQORxc0PJqtAoe5+acGNuNL+xoi1VlvC2qDtJ8hov4w/9aYzKwAHikN+z4lyk2HV+YccZaVCyWKwrVUFlcgqv8HK96PI3tjxhhEUpWfsich6kNbp7amf8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761192168; c=relaxed/simple;
	bh=X8URY0dU2zsFDn+O9LyOSjT8nBl+c7H0QXUDZqaR2Eg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W+QCcsTFKG23Twn1BhHd1MWn56AXXyG2nSRWCWGdkwRS5zvgVZVAkTMwAHnkrS3f5d11hENVf0xdRrTxqA4B7/g6ff2T4C0UwrlDq7HDMlNYjeMdYS7vqXGX7KGzQbAB/zz+K5HGnI6OrvXhirMzDhUKEWWoMi+jhDeu2/KXYVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JxCBx21R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIeoVY022452;
	Thu, 23 Oct 2025 04:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iVzyiWmcMZOsprHe7CK9HH
	QvtGssNtHYcy2C+tws0zs=; b=JxCBx21RqeXhd8pRJSe0QT7lUhZw5WlRI4voV0
	c+DNREhj0xntqiHn7MEjB+VgGXIB3vtUQc1cyMhiMJn3HvPnk6weBNbq1IvvQeYn
	LfWG767FMN6DkWzDqTdTo6eOpJYWys/gtX0QWDSvpjUHDOFqkVH04l1v4jH/oW5j
	HMwR4n+8y60xo9z3eOHRNDDd1oIxv0iFJe6isCzptxHRzZrIHsCM2FP0t/4hBPW3
	rmuk2FzQ7FSZ+kBdVJCC4YBLshZ5ISYamMvR+pF1XL/shjqx94mk7L3faFdXugNR
	C3sf/m5zCRuG2dPerpGjBzkAKI5Fgdjps9veAPoJn2Vhn3zA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w86xdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 04:02:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59N42fIH012700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 04:02:41 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 22 Oct 2025 21:02:37 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: ipq5424: add gpio regulator for cpu power supply
Date: Thu, 23 Oct 2025 09:32:24 +0530
Message-ID: <20251023040224.1485946-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX2NJ8NOWXdjJm
 q6vZy+nT7HWjQeiJlTaDtHpwAE0rxzfkcaAFUiAHfM9+olx5O8tg4SYHM9YWxfpD9UEjBiEAJDF
 ni6rSlyARY/7iJOrIi3B8EyeyfPODqLqM1h65V9BVLH8/knGKVVmzcHN9LLV6Am0cfBOmkQvQk6
 tZ/jvmGcpEwCPN7Chc+eIyT45MPgmb38T8c1mJO9cv09LqzA3TuxqCKd0a6RRwM67QTr9s1nyjt
 PrMvggHAv8hhLNHeQq/IFbmx1Wq3vU+z9M+IKcXzE+VHKtrUJVQfiE25gEuuzAzItw7klW0Vn1g
 pHZfs1Hb78GaG7LhjuOSPWKDy/NjCwemay7nFvqu3sY9v/18UtjphnyAekrWizoUicaOKz3Jldl
 Uo3OannXA4wTYiv7TuRkEIPq64ypzw==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f9a8e2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=GtKErXWXURwwhVTve_EA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: BQdq34mBzQExbIIdGWwxSbs9wO1E2pC4
X-Proofpoint-ORIG-GUID: BQdq34mBzQExbIIdGWwxSbs9wO1E2pC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

Add a GPIO-controlled regulator node for the CPU rail on the
IPQ5424 RDP466 platform. This regulator supports two voltage
levels 850mV and 1000mV.

Update CPU nodes to reference the regulator via the `cpu-supply`
property, and add the required pinctrl configuration for GPIO17.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 24 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 738618551203..6d14eb2fe821 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -46,6 +46,23 @@ led-0 {
 		};
 	};
 
+	vreg_apc: regulator-vreg-apc {
+		compatible = "regulator-gpio";
+		regulator-name = "vreg_apc";
+		regulator-min-microvolt = <850000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-ramp-delay = <250>;
+
+		gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <850000 0>, <1000000 1>;
+
+		pinctrl-0 = <&regulator_gpio_default>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -171,6 +188,13 @@ gpio_leds_default: gpio-leds-default-state {
 		bias-pull-down;
 	};
 
+	regulator_gpio_default: regulator-gpio-default-state {
+		pins = "gpio17";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	spi0_default_state: spi0-default-state {
 		clk-pins {
 			pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index ef2b52f3597d..70702c80c626 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -56,6 +56,7 @@ cpu0: cpu@0 {
 			clocks = <&apss_clk APSS_SILVER_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&vreg_apc>;
 			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
 
 			l2_0: l2-cache {
@@ -81,6 +82,7 @@ cpu1: cpu@100 {
 			clocks = <&apss_clk APSS_SILVER_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&vreg_apc>;
 			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
 
 			l2_100: l2-cache {
@@ -100,6 +102,7 @@ cpu2: cpu@200 {
 			clocks = <&apss_clk APSS_SILVER_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&vreg_apc>;
 			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
 
 			l2_200: l2-cache {
@@ -119,6 +122,7 @@ cpu3: cpu@300 {
 			clocks = <&apss_clk APSS_SILVER_CORE_CLK>;
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&vreg_apc>;
 			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
 
 			l2_300: l2-cache {

base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
-- 
2.34.1


