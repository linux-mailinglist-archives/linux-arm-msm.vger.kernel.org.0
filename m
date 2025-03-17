Return-Path: <linux-arm-msm+bounces-51577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8ABA6400A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 06:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64D6B188FA10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 05:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F6321B8E7;
	Mon, 17 Mar 2025 05:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bCE5m5RH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FB21ADD6;
	Mon, 17 Mar 2025 05:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742190163; cv=none; b=FFUxsHSY0J1RD99B0YxaAeFXfXobvMFVHXrC4UxPtJbRX9V6QXFU3Sli9k9Bu6X2eyRn0RheW74DwBaXtOKy5RCOW6gVwT7xUMDiOvfYOq6oM6U3cAhcs7vmFhz5rSrGXJKZPZPSgdAxXvWBvFMsXxnf+xB8s/4V7QwxkaUTo2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742190163; c=relaxed/simple;
	bh=c68/9k2D10R+Phhf39BuhBP9RJXYYUit2jRwJ+posK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=TZPvpypLqIbD+g87aWf8216omQvXQFbf0Ajc/5fEePmeVvPBQLRNaBIhydvoLknYmwBLh2dVjCX2/65kKOg2YTdv4I6ee55XdRSsbNHgx1QGuBQhriVCMWKIXnmxZg4DEZ++n57l2CsoMXfPoB0KZZRWBBM0BWblS5Uy0YvukVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bCE5m5RH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GKZic6030742;
	Mon, 17 Mar 2025 05:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=yLQsS8grmpbDzrjV4IFNBtgAwshZaVnNlPp6k44ml/0=; b=bC
	E5m5RHvfkpTNLhOf94HJdSHNJI3vbTtApm5Bsb1GvZP12PhhUPDuYrgxXl96BAgL
	us2YKyW4n905h3WaLHaOJ5+3ttBRY3fr3cvIqXBwJ5Suqz2wzwUztqRIjYOH2/tF
	H2rCz66g0jcsgYzxqSTHv/d7e8epHTQDC44vkPbjoqye4gI2NNh2CarW+5ndundh
	Tc/CJFipZD+XxWdxqDqXWBJGeaW2EYYFvPy55ZFoVtQ4eDItujguC3IVG0OAd8Xo
	Ge2ociTNXaDsZY8CTyxXHjBqSv47Bk43+w/J7eHHrDKUTq/uSZZNMz77f1u8ao0z
	fdOi0OiOFiMNVpYoNgpg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdkhga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 05:42:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52H5gFxS015900;
	Mon, 17 Mar 2025 05:42:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgm3pqj-1;
	Mon, 17 Mar 2025 05:42:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52H5gFAE015871;
	Mon, 17 Mar 2025 05:42:15 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52H5gFvI015861;
	Mon, 17 Mar 2025 05:42:15 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 58154571AC6; Mon, 17 Mar 2025 11:12:13 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 6/8] arm64: dts: qcom: qcm6490-idp: Modify WSA/VA/RX/TX macro clock nodes for audioreach solution
Date: Mon, 17 Mar 2025 11:11:49 +0530
Message-Id: <20250317054151.6095-7-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d7b64c cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=j0QZPtzr0s9QS1eNXQUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fP4TZ9-NS_FWZD2quAiehmMPyootwCip
X-Proofpoint-GUID: fP4TZ9-NS_FWZD2quAiehmMPyootwCip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=880 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170040
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Modify and enable WSA, VA, RX and TX macro and lpass_tlmm clock properties.
For audioreach solution mclk, npl and fsgen clocks are enabled through
the q6prm clock driver.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 9209efcc49b5..5f994188bb0b 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -13,6 +13,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include "sc7280.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
@@ -515,6 +516,62 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&lpass_rx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+	status = "okay";
+};
+
+&lpass_tlmm {
+	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "core", "audio";
+};
+
+&lpass_tx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+	status = "okay";
+};
+
+&lpass_va_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk", "macro", "dcodec";
+
+	status = "okay";
+};
+
+&lpass_wsa_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.34.1


