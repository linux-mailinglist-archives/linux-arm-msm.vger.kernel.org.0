Return-Path: <linux-arm-msm+bounces-56073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDD5AA071C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CB6F7ADE4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A3F2BF3EA;
	Tue, 29 Apr 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Frem4vaw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FEC2BE0EB;
	Tue, 29 Apr 2025 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918702; cv=none; b=qn8awb0cQfZrCz/rOy/YDwgzQkjSNQUXPYlzmtklLl7vcrQ+MQCCncVtGohzBQEZJiV/j9drvH9RQIxx6gjn18Vm9Hx4JRI+Vu4OG4pz8zFkztAw+jA49vGiumGl8yqLxqDyNjzaKumGPdDlPEBWMy5gJpNGFE5LYD8Yizg4rQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918702; c=relaxed/simple;
	bh=SHlxwuw9KE1hzB3CwbtQUCQC+2SnIw94/rm25ofzo3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=qdXccOKJVSsjAdd5bcK/TCed6ZEmaQoN1c5vYQEkSFt7gcxyg1FoI8u0OLLL1jZ4hPxsBoGibBle8z2tYNfgL7g1Qq5+RgdGKZLPcJJjGf9fLM4J8Q+LbhS/P14ClFDClTs7i+QIfhl+zNIxf8SCfCdgkusjH+QP6JLpB5UGyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Frem4vaw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqAd6025312;
	Tue, 29 Apr 2025 09:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=YM5XpgZTGS9pWpYyCtzbiOx0APfHqcBEJApXNsowqGg=; b=Fr
	em4vawIrjpt+F1HQP8ka3BQJJQb/MwCtBaD2Rvio1c9w3rFghFHkcSctEHoTHWLx
	BWc/5bwF3BNhbEfNjIQsb+8u9aTG7YONY8EmYc346TFTVYR04qfECRDfMlVBvU8P
	vOa4fkQvO5gg/r4ZG//pEEa0WAD18AMQO1/NlUaZvYj4/ofF79RMe/cJD2VXrMsK
	qvUGEu20lUHLXtLoaLPQSVSiW7meurQFoYg7+m8YYCb/pqoVTO3t+fjtifJfxH2P
	eXwuV7cLH/+W3NH/T6LV/03zNXx9Q+jN3kdLA8MD+8XSCYrZZ612ePWwPV5XdfHX
	N6QUvdrhDg0xhETeCbfw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqm6h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:24:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9OlBM031626;
	Tue, 29 Apr 2025 09:24:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 468rjmhb33-1;
	Tue, 29 Apr 2025 09:24:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T9OlMI031587;
	Tue, 29 Apr 2025 09:24:47 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53T9OlnI031557;
	Tue, 29 Apr 2025 09:24:47 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 943AC604543; Tue, 29 Apr 2025 14:54:46 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
Date: Tue, 29 Apr 2025 14:54:25 +0530
Message-Id: <20250429092430.21477-3-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2OSBTYWx0ZWRfXyvcGMJF/IDH0 Uc+JumHl/K/9PWJvHVBT5WJWfVcOi1m4QiXQ/3nNGB4slqu+r2mT3/NwfODrIXljo7+4aolu8GY hltRRgis7xC7dmNLGjourAJ8mxnaNgFAZh4b2H+4RwKdsXX+5PccDBwoxTuPQxr5/JvVRS9B/qt
 SRYVHAM1b+6LO5WwxUGhr22yIX3fg6SQyFf9PbBZdmOHVVneQJkGFBKn+CUbrIwO35AkaPuGcmq VqJJ+nsX3oUb4u9oBIpU8mEQRuKcaBTpEU4Oj77SqUjT4DskRNhjG/y0vli9xXppaMS/2lgvsK4 ynz+ATyJm7S0HSMCHhwJn85+8V0suSTnw6/s3WITQGWKB5aCbHgmSe4ULin4xNycafR8p1txzF4
 1ITDdx0ERuAK9CC+9dZ1QSOW6kT25kPHTOU2YNlnuPIMQamrmscez7KQT388UHLFrLfNRM6O
X-Proofpoint-GUID: uFPT_fka47YU_MdgSoyp8pI-mlmDBrbB
X-Proofpoint-ORIG-GUID: uFPT_fka47YU_MdgSoyp8pI-mlmDBrbB
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68109ae4 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Hk-fo3U6da086cNuBgYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=944
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290069
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Add WSA LPASS macro Codec along with SoundWire controller.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 68 ++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3453740c0d14..d4aacb97a18c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2601,6 +2601,64 @@
 			status = "disabled";
 		};
 
+		lpass_wsa_macro: codec@3240000 {
+			compatible = "qcom,sc7280-lpass-wsa-macro";
+			reg = <0x0 0x03240000 0x0 0x1000>;
+
+			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+				 <&lpass_va_macro>;
+			clock-names = "mclk", "npl", "fsgen";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&lpass_wsa_swr_clk>, <&lpass_wsa_swr_data>;
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
@@ -2807,6 +2865,16 @@
 				pins = "gpio1", "gpio2", "gpio14";
 				function = "swr_tx_data";
 			};
+
+			lpass_wsa_swr_clk: wsa-swr-clk-state {
+				pins = "gpio10";
+				function = "wsa_swr_clk";
+			};
+
+			lpass_wsa_swr_data: wsa-swr-data-state {
+				pins = "gpio11";
+				function = "wsa_swr_data";
+			};
 		};
 
 		gpu: gpu@3d00000 {
-- 
2.17.1


