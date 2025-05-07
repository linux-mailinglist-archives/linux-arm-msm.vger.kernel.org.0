Return-Path: <linux-arm-msm+bounces-57139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1BAADC83
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8FC41C0802A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA0E233159;
	Wed,  7 May 2025 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YIddYjp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9699423313E;
	Wed,  7 May 2025 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613638; cv=none; b=IsaOOdUM+Afv2fNBE8ceIM0iuzOJREQO8BJWMZzL4MvWsbeLpcGlXPvmlz3i3/PMmaY56QGIHnEWL8PK3x2TlQvUdF1ywZDjAwsdRc6yC8JF+lqWWh/A7rGQMlfAR+5c7rFRkN/Fe4e4OqN/SSEFINawUNVB1x/3NUP7vvUEm7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613638; c=relaxed/simple;
	bh=S8R7OSy04CRYYPzMWetWItqtW8JouTs/drPCGU1b0Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HV/CGEcKoxXZ9FFT22mai+DwUtuxIwjEksdh8imd6KYtCVCwLgxQapzZgzLNEFHHziZ80Ti+dxLRof0t/N9pPDgtap0Tpm3iGkV38OUZlD4tKTyMgs0Hzc5BO34W2PMLl9nRtKamvgNQPdMU6EXzj34RF4LTTtQSjIK1C2Pa5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YIddYjp+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GulA018182;
	Wed, 7 May 2025 10:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbNqliw36PpAgMlGyJJhxGrLINrwtK8wresrvPESxKg=; b=YIddYjp+qWSGFyS3
	avfZFYEF8JT/sH7BzR7f1aNVRGlqg+iKGXG/2QTrlXwgHOnplQSywfYWoil/XA1F
	PXGjuzP2hfqigAtP//fyL27K6SHcEOyVMW2HxKfN9mgRFSoDXJJmKe8g7WUL7Y1K
	WQXtEWqdnLGhloWgaRvvIy3OvJiKFxCGfC3uZFgYWv1i9h5TP75V4Dd7hy0Kllxe
	wCGf6KHQk4G3RIQLv4GeR1dPKGvI3G98CumpjbIlccw7IEXd3SR7hVYYSk4Kw/UJ
	VEbN/VhogWwnJ4h13SGWC3J3ldCvJGN2hxGAXaYzh6oycuGmI0bJsqoGYo1HSBCC
	qlY0AQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbdbeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 10:27:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547ARBlX013372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 10:27:11 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 03:27:05 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 7 May 2025 18:26:15 +0800
Subject: [PATCH v2 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-add_qcs615_remoteproc_support-v2-5-52ac6cb43a39@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746613605; l=3316;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=S8R7OSy04CRYYPzMWetWItqtW8JouTs/drPCGU1b0Nc=;
 b=/hqjFM8ELgstaBFBVdMR01PW7+oj/fe04tdZSGeGLYYcWKZiembMIh9i17g68kSH+P6/cH5Ty
 AERCkpfM49vAw/r/k1E7jo4emHUeieJihti8Yml+MMVUNGnYVeqQRPU
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wKsR9c__jGUOXpowcEEevZVcfQHyHry5
X-Proofpoint-GUID: wKsR9c__jGUOXpowcEEevZVcfQHyHry5
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681b3580 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=GkrJffXkLMCu9anYvR4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA5NyBTYWx0ZWRfX29cMlo3e2GsC
 JFt2ckPdibmGR7Z48MLw10oTXwZx/Ijpt+aypHZTZZYzCZMVziA2DjwiWgFhlTpBFtsi9ZVv6QU
 j15XNH/+Y8FzGTeHubIi9NFEzz5y2YiNy8hPbHCdp43K2DwKUgDwnJ99vko/YGFgV2h+PGfvV9x
 nKYKMlr6zwnrypJocFbEYSJt/GAPjDBnJ+ouLJfTL1yhctrC1zMSTEjDUuMZs19PoHXxsIpJkFC
 Z+aQvL6K6SZAnlBeBPt2BkQ8RGsJezMjGGbrvunhIvOQCWWbmibzjBJz3tlaptS0kB68uBxjzzB
 s4pnLJBmjbmkqBqC+J7h/lYYzg3yNPymjAtYfsutzFR8zNsou+bd3UHlW8zlzRuCgwEdgz95EIg
 M7Mwr4vN7ISxDBwnW8JPA649Vh/iqQjoOmNTEUJxzBgltrATqIxBoHbXZ3w+vjppc+KmS6fK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=253 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070097

Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
remoteproc functionality.

Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index fefdb0fd66f7..5e4565137396 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -472,6 +472,16 @@ smem_region: smem@86000000 {
 			no-map;
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		rproc_cdsp_mem: rproc-cdsp@93b00000 {
+			reg = <0x0 0x93b00000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		rproc_adsp_mem: rproc-adsp@95900000 {
+			reg = <0x0 0x95900000 0x0 0x1e00000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -3093,6 +3103,44 @@ cti@7900000 {
 			clock-names = "apb_pclk";
 		};
 
+		remoteproc_cdsp: remoteproc@8300000 {
+			compatible = "qcom,qcs615-cdsp-pas", "qcom,sm8150-cdsp-pas";
+			reg = <0x0 0x08300000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			power-domain-names = "cx";
+
+			memory-region = <&rproc_cdsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&apss_shared 4>;
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
+
 		pmu@90b6300 {
 			compatible = "qcom,qcs615-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0x0 0x090b6300 0x0 0x600>;
@@ -3727,6 +3775,44 @@ usb_2_dwc3: usb@a800000 {
 				maximum-speed = "high-speed";
 			};
 		};
+
+		remoteproc_adsp: remoteproc@62400000 {
+			compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
+			reg = <0x0 0x62400000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			power-domain-names = "cx";
+
+			memory-region = <&rproc_adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink_edge: glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&apss_shared 24>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
 	};
 
 	arch_timer: timer {

-- 
2.46.0


