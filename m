Return-Path: <linux-arm-msm+bounces-43837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54CA00514
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 08:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68CB91632DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB741C9DCB;
	Fri,  3 Jan 2025 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QMnBo3ab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4BF1CACF6;
	Fri,  3 Jan 2025 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889548; cv=none; b=iZp1EmFgkPAtogE60DamweY1VsBDXJqwbgnmegDujlGy6YtJ78Rfre3LLXj1+5/xTuWu9AR9IZd//xm3RU6Z5ccveYWiDhrPECXatgHi8MeJ0LfvTdaSVna8QeUPQzr+lBwoib54vD/ksyiXRqF7vlBPcDNJtx+3UBU8W60uJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889548; c=relaxed/simple;
	bh=VyC3W8O7pEMyWv06ZRGk03/Ezl+Iu9sbnPsh4K208us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LfmCAYC31Ub5OBuMMpM8eAPuwqnVINEEOlk9C7HVwD5qapIwdyAr4ZJNvJdHm42CdrZNQcP4imWV291xWfZvFlp641zPpoaafTl/pouAA+ZU7UKfd9IUcXkkPainIQxay4nrHXxIvZEfFvrhzOx5qniSOuqnZHUVQ5//EKgxtIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QMnBo3ab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5033qS86015576;
	Fri, 3 Jan 2025 07:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8aydGhIo9XxOke5I+yIVto0Os8osvsq6hM83XEMMBBE=; b=QMnBo3abPCSdpVvG
	rxuN287v34HcbpUJY3r7RrzyHzrHSTOyuoW9WPifbsuYZCVm0vaf0iNHoXMh5zJR
	ZX5SvBOjQb2+8l0Ued9Qfcexms01yMMN9eN3+7KKMr89Jn9xF41hievXn2BC0ouh
	upO+UriYPoRYJwpA+a06iQ9U3N5yAzHSDth8eZRi2q35USdWwmy9mSpfXfCLgYhd
	Wmk0KpX2MsjtX5R3V7GL1XEB0fL8JRUGIE7mADManpj7vVW6nLE4Fv/sr01CtIuF
	bSp379AJyoakxmMn5/aQzFGcngSpWfdC39u1UQH0LMzIsFMmxCipc05tf0eeBCs6
	9fYnEA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43x8c0ge24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 07:32:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5037WAi8018491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 07:32:10 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 23:32:05 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 3 Jan 2025 15:31:38 +0800
Subject: [PATCH v8 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250103-qcom_ipq_cmnpll-v8-5-c89fb4d4849d@quicinc.com>
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>,
        Luo Jie
	<quic_luoj@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735889498; l=1501;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=VyC3W8O7pEMyWv06ZRGk03/Ezl+Iu9sbnPsh4K208us=;
 b=hObJL1Fhjy9dndqFaZisgc37tkYCYXa6Vu3HbWc9oM1eOwi8k4n/fB42US5yVu5vkcw2pEV2p
 kCB4r1TO4tyCdsEEsoKFXUsFdA8mrDaqQLlDTcDmMQE49vcfg0OUBlF
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 27loeI9p-u2DVvq4xVnY3CrjjuD737pN
X-Proofpoint-ORIG-GUID: 27loeI9p-u2DVvq4xVnY3CrjjuD737pN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030064

xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
block routing channel.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index bb1ff79360d3..ae12f069f26f 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -175,8 +175,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board_clk {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 475868a241cc..b5c8d2ab2ab5 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board_clk: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&ref_48mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.34.1


