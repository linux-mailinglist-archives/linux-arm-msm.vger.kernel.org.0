Return-Path: <linux-arm-msm+bounces-58604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D66ABCF41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01C971699AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 06:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C04125D54A;
	Tue, 20 May 2025 06:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gZJQJIaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A8B25D1E9;
	Tue, 20 May 2025 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747722430; cv=none; b=peSaC5nJU/xidqKi3n4NZYz5qyr/xPuz8yKtdji7tDCQePJQwtWtrN2717LdSpZI3vk2CbuVyAp7ii/iTrCYIIUx5ACsavFvdjYP6md/JkQkrRsuO99F46tHUZsnYUfURI/4+yNiIp7wyB+mPRAoekDTVXyjeoPNnvhL5sa1gAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747722430; c=relaxed/simple;
	bh=Sfm0x1deS93sylFOQ1IcD2WJwBeunb/Aine2t2EnEc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MIdFIyFXII6qF7bwCOSsCdxCjyqCoC4XNxILNEUBdhmERy9Qf3dIZLfr5bzMtOdr72JNnw83s7Fe137+p0gakXu4f8jEDc6tn9mIITpj8JgZrjJ49dh5xhQ5mnEWP7PpxdvNupge9n+KYyNxAXqWDtNX2PVgi1LzrXbOg5TnuDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gZJQJIaq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JL2UjG003157;
	Tue, 20 May 2025 06:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AM/1HaELA+L
	7yVOOWD9YCQNuBS3XE3W0rWTBJq8Qzcw=; b=gZJQJIaqm/7KmXsIgseuk8BS8bO
	sK7wrg3MmTFpDl6wsU+FSDVHu0UEBJKqjn6QvX3uJKM1XbAouxsStuP/0KWQ66sx
	rh3wGl5ZADmtVNhH7ZQWIl/3Yll+dXmFqDv7P1smvRBthtm7WEJMyNxY8ZuG6TWh
	+Wro1ionGGAB8/tGB/7JP7Shzknw8HbzPDqRtC1zg3bF4h0QVRpRgh09Omebz7wm
	h2EqwGK+6H64GFKY6r5yI3N0gWu+8VaDRFf4uR1CWXFvpRFMAtg52tRLvvPcZhse
	SCNkO1bUxNnltdejIuZy6FUmn7DbxoBWCbR5B3iXuiN5msFG0wWsg2KU7DA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4pmfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6R0re011140;
	Tue, 20 May 2025 06:27:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhm5t4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:00 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54K6R0dE011101;
	Tue, 20 May 2025 06:27:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54K6QxqV011096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 06:27:00 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id E9AA45C2; Tue, 20 May 2025 11:56:58 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
Date: Tue, 20 May 2025 11:56:13 +0530
Message-Id: <20250520062618.2765109-3-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jJhwhtD1QlefMBmchRmxr5XT_ocLAPL3
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682c20b8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Hk-fo3U6da086cNuBgYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jJhwhtD1QlefMBmchRmxr5XT_ocLAPL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1MCBTYWx0ZWRfX2xHcEeqd+nnx
 7xnRzHvdo6opTkIAfO4lIPlAPFECh21SVKETv9w5uoN16ytOLqin9A+K0OpDA7uLbxenVT7kx/Z
 baeQMzRv7dlqUbLtpac2FvzeJsje0GkepHzB+ywRLfmiM8hRb0UvG1PDl9Jo3Ga6E6HmNumFCi/
 uk8k7zv1GiWiGxpBlNOiqyEIGoKiNJc3QfB+cHFWEC3FhpCfqzM3UJTB0ytxI22HY0TJ+DJIgtV
 IsOqcEZI6aS10JBhDJ1sL5X2oLSe5omhO88bsMKwZnx2TbthbOnzrnllyBVqc/fder9kboTRNKN
 6DeDviOo8eHb6/mFK7r0e5ajMuRl94GY37l1S5SbYEKzpD4M9lAN3j+ZGQjIe2Cd8tUbvnVaDDG
 bxP2v7ysMuyurKF3WmEmGhJU/F5PXKl4BzFILGdqk9qXwjJgF6NZMKikzgYfJvy6OjZ/K9EF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200050

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add WSA LPASS macro Codec along with SoundWire controller.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index cb857f0728bf..1db886795b74 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2636,6 +2636,66 @@ swr1: soundwire@3230000 {
 			status = "disabled";
 		};
 
+		lpass_wsa_macro: codec@3240000 {
+			compatible = "qcom,sc7280-lpass-wsa-macro";
+			reg = <0x0 0x03240000 0x0 0x1000>;
+
+			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+				 <&lpass_va_macro>;
+			clock-names = "mclk",
+				      "npl",
+				      "fsgen";
+
+			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;
+			pinctrl-names = "default";
+
+			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
+					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+			power-domain-names = "macro", "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr2: soundwire@3250000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x03250000 0x0 0x2000>;
+
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa_macro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
+			reset-names = "swr_audio_cgcr";
+
+			qcom,din-ports = <2>;
+			qcom,dout-ports = <6>;
+
+			qcom,ports-sinterval-low = /bits/ 8 <0x07 0x1f 0x3f 0x07
+								0x1f 0x3f 0x0f 0x0f>;
+			qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0c 0x06 0x12 0x0d 0x07 0x0a>;
+			qcom,ports-offset2 = /bits/ 8 <0xff 0x00 0x1f 0xff 0x00 0x1f 0x00 0x00>;
+			qcom,ports-hstart = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode = /bits/ 8 <0xff 0xff 0x01 0xff 0xff 0x01
+							       0xff 0xff>;
+			qcom,ports-block-group-count = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+								0xff 0xff>;
+			qcom,ports-lane-control = /bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+							    0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
 		lpass_audiocc: clock-controller@3300000 {
 			compatible = "qcom,sc7280-lpassaudiocc";
 			reg = <0 0x03300000 0 0x30000>,
@@ -2839,6 +2899,22 @@ lpass_tx_swr_data: tx-swr-data-state {
 				pins = "gpio1", "gpio2", "gpio14";
 				function = "swr_tx_data";
 			};
+
+			lpass_wsa_swr_clk: wsa-swr-clk-state {
+				pins = "gpio10";
+				function = "wsa_swr_clk";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-disable;
+			};
+
+			lpass_wsa_swr_data: wsa-swr-data-state {
+				pins = "gpio11";
+				function = "wsa_swr_data";
+				drive-strength = <2>;
+				slew-rate = <1>;
+				bias-bus-hold;
+			};
 		};
 
 		gpu: gpu@3d00000 {
-- 
2.34.1


