Return-Path: <linux-arm-msm+bounces-42508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C669F48A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A33516EFF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF1C1EC013;
	Tue, 17 Dec 2024 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EqGD+KxD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B31DFE29;
	Tue, 17 Dec 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430228; cv=none; b=uEV8CsiIS3o61m2VyCXbZAP1GlLb3zUK6jJJONxdug68rXGldapLqnfQST5by/B6rHrvyMNrkszd8iwIWzWetjOC+7IkEEHZentjxNNbbw9jwNAden6L8I/55ZhfU2PcrvPUiTq1RHtE7iR+U1heliSPgHyIprHPRlQ+B8sR13E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430228; c=relaxed/simple;
	bh=phY7aIS0PtwvIBKMXHpp+93RA9fCsliuh0wJtoYcY4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aVov+ZtRKBY8xMG2lj5VsGCxD5v/9lCaf0kxVjhQLeb3HStPqGJN9n02y8MrsQkwF4d/puFxCIZC4HtmSVG1r/v7lRaJYTEz0eR1ekcM6KcnjvgbBKyaPCNQ33QCTxZhPEeX7TKitBcrjdo8cT9U1vI++oshuH/Az7Uc6Svf4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EqGD+KxD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMBMY9019112;
	Tue, 17 Dec 2024 10:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=faLgLjv5NT4
	Py6ggo/DNiSVGhonh79+UkdWIvRDIacE=; b=EqGD+KxDwl/9L+75ZDlnJdZ+KZy
	ejcZU2rzpC051Zn6keUezicdzaDYqMA/oFkr90+rQplnixQx2zgOtPzdhZ/y9rnC
	kMM/Bsx72er+dxuGiprZqpZMGlsmguBwJGtX7/4ryZUoZjUgDxw2l2lrZ3DOjILJ
	LXBrCJf7baPwntF0+WSjjo3VFSvud5/nQvjHpcAG5sDB9EbZO+ueoDAyQWfHw8Cy
	7QobCFljVUlpLWvCg6udGwZ5Lq1pldwO4dqamLVGweJGFVDJfFXiiF2hDG2XHeFH
	wbcVOMq6PTadXejiCLtwwpgkq9emA6qnJbIo1vQ84KudO2jytmV6za60TCw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jvs81j7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:10:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHA86sL003814;
	Tue, 17 Dec 2024 10:10:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33keyuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:10:20 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BHA83j7003796;
	Tue, 17 Dec 2024 10:10:20 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BHAAKBL007148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 10:10:20 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 2CD181BDB; Tue, 17 Dec 2024 18:10:19 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: [PATCH v5 2/2] arm64: dts: qcom: qcs615-ride: enable SDHC1 and SDHC2
Date: Tue, 17 Dec 2024 18:10:17 +0800
Message-Id: <20241217101017.2933587-3-quic_yuanjiey@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217101017.2933587-1-quic_yuanjiey@quicinc.com>
References: <20241217101017.2933587-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-GUID: GnIpXwZOdDmvJGMdgZU9b7ujoLHwd9Nr
X-Proofpoint-ORIG-GUID: GnIpXwZOdDmvJGMdgZU9b7ujoLHwd9Nr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=872 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170083

Enable SDHC1 and SDHC2 on the Qualcomm QCS615 Ride platform.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index a25928933e2b..562e4dfd221a 100644
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
 
@@ -210,6 +213,40 @@ &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
 
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
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
+	bus-width = <4>;
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


