Return-Path: <linux-arm-msm+bounces-56066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CCCAA070C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145C23BBBB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1849F29290D;
	Tue, 29 Apr 2025 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eMij4evI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFAC29DB6E;
	Tue, 29 Apr 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918696; cv=none; b=SWA5TFEIPQ8vMT75tF86ywb6mYBlgRp43c2fnY8m9Oj7URM7Lgc57BpQ78UjQXNwsDDJUAe9cXF2skPy6BH0NOIaipZB1cQ1Br0gNAU8u3f5jlD5ArABLXtGC0SHgtCOt5rmH1UHlVkRwMCd2RqRRxm/OJrpNiySgdCd9UqBaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918696; c=relaxed/simple;
	bh=VaiGBsPAcDeY34faWDpbUdGECbjPgNtGe2bitNvD17M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WRSQGe1HBnhqP4LeX9nImo6wBohgVckEL1+dkx2fxiEOH5AQ6SQLaOklA4OqYMiz/MxXkpkSKm+ABupRF06yJX5ftmCUCFebVBpAJdJ4RmttmqOiNTgH/M/jvpdN2rC9yRp8jPiX2rOtqHLnSFqrrRHSWk4VcpyzxoS+TP0Y3jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eMij4evI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq5bc030435;
	Tue, 29 Apr 2025 09:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=rkUeF7V5qgth51fDbAHG/eakY+DdgW2lvsJWKGbqg8g=; b=eM
	ij4evI6begdlfDnWdEl4SoNGYeTbHWVQfwhcbcm14hvsKgPdeRTcLRRsQclkQ1vA
	QyRORJ6sP22RQgj82igTHXlVIF9kHBTyvSzqQdcZs20766IkSurGoeuyGuTGmOkW
	8llGteb1ITqVE21RykB7C0sbCkIzBQIi2bBm8cGyLRxqjydr7DGoVoSUigrRK5jJ
	3scs2VJ5G9Wq/24GSYDF2uXCMYETNbgEp/BIfayNT+a7iXq8Ozo3c0gH/lKVk9xE
	CsZz8mKturHgLYBAtsaEvvhz79aBy1AgE4zTbLx9rJnJGT618r20RancX9xUFUtd
	td1WbjCT9AmNhfH3Yncg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevk3mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:24:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9Olef031627;
	Tue, 29 Apr 2025 09:24:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 468rjmhb34-1;
	Tue, 29 Apr 2025 09:24:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T9Ol2u031586;
	Tue, 29 Apr 2025 09:24:47 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53T9OlH9031559;
	Tue, 29 Apr 2025 09:24:47 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 973F3604544; Tue, 29 Apr 2025 14:54:46 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v2 3/7] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock settings for audioreach
Date: Tue, 29 Apr 2025 14:54:26 +0530
Message-Id: <20250429092430.21477-4-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Wu0aF7rE0kgdUYgRJQBYn_mF4kqWJf--
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=68109ae4 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=dTmu4OR9L3cT1w_1Y_wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wu0aF7rE0kgdUYgRJQBYn_mF4kqWJf--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2OSBTYWx0ZWRfX1MeyeNBdFmwC nCMYKcGlp1Wlg4gfAsXcsTxq35iRHUq8Gyb6fg8YLKBHfohK6Pl1JhWVmxj8C/ZXhfWfbgwOc3C sSra1V42Ahk7Essdae1AUva9aYXMajSOhdiSax/UopylXifcD6aWNANmYyBvu/ZJuwicdBg9VLb
 CbjOb08kq9az9a4I1Oq48fTLnzkP107lY9/7czWHqRo8B3TMA8M6ZdFZlPqHFrMKPLVxk3xH2cj zyPdwJ+Ct1W09pzR04mTCooHvgyGEMRIw07g6jzXMa6NHahHE2Embbdig3v+W1faBWGOA6dJmhZ rPdWPK48I6PmcNFNiZ1PN4PscKGEx8VsVM54uFxyAbs6qAC5ziwNzT8C9NKQeXYx7vxQdlR+gSk
 5z3oFdgvn5+z/xMlU75QgD9jg9kURUOzy+nLmrCv6xY1G9nMHwZJTGEoYLjgKVV8HTH+L3dV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=853 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290069
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
settings. For audioreach solution mclk, npl and fsgen clocks are enabled
through the q6prm clock driver.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index b11b9eea64c1..f3859d805ea7 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -11,6 +11,54 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
+&lpass_rx_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
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
+};
+
+&lpass_va_macro {
+	/delete-property/ power-domains;
+	/delete-property/ power-domain-names;
+	clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk", "macro", "dcodec";
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
+};
+
 &remoteproc_adsp_glink {
 	/delete-node/ apr;
 
-- 
2.17.1


