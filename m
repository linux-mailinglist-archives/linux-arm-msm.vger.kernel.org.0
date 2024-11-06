Return-Path: <linux-arm-msm+bounces-37108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 843579BDF57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 08:24:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5D121C22DFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 07:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99FC1CC8BC;
	Wed,  6 Nov 2024 07:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LTDZcL8A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415181C7B7F;
	Wed,  6 Nov 2024 07:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730877859; cv=none; b=EihVehwCK6XfO2C0XuaN4FxZ78hD6/ovEhQIcSjEd8aiVHfJB6RN//Ojsfa4JJ1TXv20SwNWFTOOhxLtAIX3mn3mFP2LZnH5c1LKqripnLnfoYGTUImIL8dy63PpA3kROZ4nee+DwCZduPw+zJnfLoK/75t0CVXCVdtSVnAHPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730877859; c=relaxed/simple;
	bh=d9FgkX8sRWc6GVjPqzzDapvQlGKSVVVBoIMOOqg3yh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pxfYkdF79gYqN7sz+vamXL6GqNESSpWMEx2TI/cVg+IlUWy8bhNp+cA0TMw9IheAlt69wQdRjlahCiuGC9YmliCZfx/n4gyP2WNWBbTY5wlO9kgZej1QN53UyvMO8R8gGLh/cf/xmXkwcaQyUeGO5XDmXnaGjX7bSaajutKa4zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LTDZcL8A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5LDFMt003794;
	Wed, 6 Nov 2024 07:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3054MTo/moP
	LYYPFzHL4TpJLVqcLSu8FE5MTqtNj/AM=; b=LTDZcL8AoszO+6YxjPSBX6ePMe0
	3hcLvu2ikouKQs00lcKBgXythJg5u+mJd+zAzHMH7wm8NBBHAKR0qPi43RoNdSE4
	kY2q4HXwdUNk4T5/iNelGd4V8fVA6RacHumUrS2+Z1C2jNpOi2S1a3GhgsY5WBlC
	PMyHzAu+MLMZ313N9q/DCrrpnS2kUXCa0lTicPQbEcatM0G/d7pPcr9Ga9jy1DBX
	vt1xZPtYzHFuwa65eX/mMjG3BdpFlR1dnMXSCLMJMFG4d8QioHkC0PAlHF401WlF
	s7ouPYGuUlsOadAg79LO5e5Wjm4v6QaWb+HtTAfYG0VlWsxhrZr8TZ09lXg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbub2jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:24:13 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A67OA4T025646;
	Wed, 6 Nov 2024 07:24:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 42nd5ktsg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:24:10 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A67OAEP025629;
	Wed, 6 Nov 2024 07:24:10 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4A67O9XT025624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:24:10 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 408C6159E; Wed,  6 Nov 2024 15:24:08 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable SDHC1 and SDHC2
Date: Wed,  6 Nov 2024 15:23:43 +0800
Message-Id: <20241106072343.2070933-3-quic_yuanjiey@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106072343.2070933-1-quic_yuanjiey@quicinc.com>
References: <20241106072343.2070933-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-ORIG-GUID: VMQqOirSQgst-xe0SJ3OuLRdRsRWqS0w
X-Proofpoint-GUID: VMQqOirSQgst-xe0SJ3OuLRdRsRWqS0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=872 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060059

Enable SDHC1 and SDHC2 on the Qualcomm QCS615 Ride platform.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6..308fd741a467 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/gpio/gpio.h>
 #include "qcs615.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
@@ -12,6 +13,8 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
 		serial0 = &uart0;
 	};
 
@@ -210,6 +213,34 @@ &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
 
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	vmmc-supply = <&vreg_l17a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l10a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.34.1


