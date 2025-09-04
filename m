Return-Path: <linux-arm-msm+bounces-72102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C6B44341
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 962C7A63189
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF1231AF1F;
	Thu,  4 Sep 2025 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKYTjy4D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA1631A56A
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004000; cv=none; b=I8slqJVntPFbdUId56IbQpdCwAkWrokg7yxXwaNJfDzixrdSoWadtpC8PnRbMwDhQVANhZoZyWh+x87x8QurpxqiS6Secwx/d3X3agGgRQyYQPE5L/2NxGZ2keSIEG8R7uDfNHtUxGTbmfvDzjlFgnGrV3gnTQSJXpPWYlVxNJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004000; c=relaxed/simple;
	bh=fDkqRvGyaFinSWWq2t1lwFf0RsUH7vJwveAVvT94bTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFFXRZIvWMCxlSUcn+seLNrjcG8iYN9SsvzpaZUBRehKBBM2+OS4IRyCAtBrr1wqcyrYeGQnwI4pkKGxpw16jPr9aJ2T3waJipHIFuB2qiCZMBpCdDqke4IKsiyT7TWKXSpO9HpczezBL9ziar8zbPAKIhlfO57tQYS7vXMxgF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKYTjy4D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GUxLj018575
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 16:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xas60C8ijwiTmwJqhI40fQNiOoeLXxnVG1r0X3sdz6I=; b=oKYTjy4D0n4qQ0o1
	XQq56dMB//2ozU06P8HYW51yWWdR1d0EXY2FQKUzl2vzzv0CkUF6l6oVZRJMuO5X
	NSkDxELMXfhTTGvR5rgDBZ8DJv9AcdTyr49KR8fNRG5DIEnRC+Ny52nIJNkilRa6
	hbLqsOYCfmuUcJthhMlRqVKy2E5Cm2VyqxLV/b3LnVIXUI4SKlV4krmiUHoV4QYL
	AFmN+LmbvmzLVFr5a1qzTdthMcGQvwu2X+8szW9N9ebLv44Z+Gwl6+wMPyUc+PJJ
	5jEXAokkG75hMqPlJuCOPwwWyIuIORwCA+zn+RXV6lNarfJWOLgEeKvwrfx8ylct
	d3kOMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebur15v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:39:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7723aca1cbcso1194450b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003995; x=1757608795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xas60C8ijwiTmwJqhI40fQNiOoeLXxnVG1r0X3sdz6I=;
        b=RGD2PTDMysm1NKN7QjEhEauVYTyA5f4SZCuLMNl7xaY88fqX3ZwXsMYCOPdpfRz5EH
         LlYlyWKsMSY4FyLcz3lHc0pgUdjArezPqThfxvFDavYxdiAB6ipcfMDhK95MJRxCQCAX
         yh0iEc0hh9n8qdv5g6Zd0Zj1W26jTCR3pfre9e5OTNbfnx7FnvbNnzlrT4cizLpNxxrB
         +2nu99vz3o5qk9O9Nirx/dv2bD+9PnOpHELGPx3OVUdT8F2XNIKaUXtIK7ZrpLi7PDgb
         qPel1oUQTgQ0XivanMm8EaVcl9/DlL6CC+YRUl+dY49zi0ef1zvF5qQxbfRZlwX1Zh/k
         X31A==
X-Forwarded-Encrypted: i=1; AJvYcCUKC16XzMr8ZMihtWdoX0Bid3RQLCZTwt4jnZoi+VlN02ZrtZ8zNHzvZy427i9kJ1uuE8Uv4oeJDMrkJZ9a@vger.kernel.org
X-Gm-Message-State: AOJu0YzBC7BRzczE+3LDSKkQp1FriqLUpTyaecr6p0mHd9f1QcoSR/4S
	LRL2Cx92PuEa26Nc+9dbT2Sbnbf0xT/FBB8quIWPA+G25M43H5/I66K+MrHMs1clL8HsuUSIYYu
	HD2luKjJQ754AfnCJGwEGxA64Hc8SACy9b80sJM0Yt3s7PoK0ZG0wJiVb9rYurAeDi11f
X-Gm-Gg: ASbGnctkEl26rfjHmZCKwlECzhp0DREgM4IwUAr/ih8uBPvhpxFZUdkRXutnN6nHW5J
	6A7xGgvfqKMUcmu8MWrmKT3dZTUeFWm3mP/I5239h8oDqBrXno/Tj1QZILZ4hbka8zdOuhSQxTO
	TycJXI3IfSMOiWcT9bnaXRjeZ0SpdDzcf6toG6Cw1iQzi4mEGq2Af2fccLACfXcG8x375aV5+WG
	DjCvdiNp846x/GTNbPCUPhl7tCJ5RV2oNRyQDCFHAzI9uG4RbHPB5dNEw/XpfbhxNhJoCMlhwRI
	M20Tilm/JvdPOoyck2EkPEQBoWtVWe0i6yqfPkmHkShamSAN2PM+76gINxrJYuk0d25U
X-Received: by 2002:a05:6a21:33aa:b0:248:ace6:755a with SMTP id adf61e73a8af0-248ace67795mr8575125637.11.1757003994881;
        Thu, 04 Sep 2025 09:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP41A3JzklvhNIPpcnoxxSAwwOYtQAUUMNoQYKRhiAy8Q6cGA9PJGa1zZ+GFCUFRtnpQ4phQ==
X-Received: by 2002:a05:6a21:33aa:b0:248:ace6:755a with SMTP id adf61e73a8af0-248ace67795mr8575090637.11.1757003994387;
        Thu, 04 Sep 2025 09:39:54 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:54 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:03 +0530
Subject: [PATCH v3 07/14] arm64: dts: qcom: lemans-evk: Enable PCIe support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-7-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=2445;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=AqtBG6UZAsfussB7MJK1QEtygnY7f30ULmObk2D0omU=;
 b=LEmcR/9fffgUDa8DhLlIj6NBanm8EP60HW1h8I+sRyX/OaSOwSy0qGZsrE57ArTE2Ic6mhyiL
 9jxjR8kYUdpBn0n4CQzixqhXnmOgh+c+/RAJSw6eY4mThbrMSmUG2mK
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: Z8nQiyXoouRxRNRQCzRKaxpAvBzQg5uK
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68b9c0dc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RIgN3AgQjrtB0c6oJ0UA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX/9U4jDXEf5jc
 ME4aEZ7fglTZ5sTHzmRl6VC4847gjKmoGYD3dvNzgDcF2FTVUQXFbwx4oOAIOYtSqCCuswPIl39
 sU83swb9D2UI6TLO2j0Sz2L9jAnEgQcGTfUpJDs51fL1chUkUQ/BEufhmBrdUpcw4HaBwcmFPqd
 41TlpbPHSwFRoDh1ilmYN0qoZJ2F9dC/2Tu7pU6fdefOMIGfkkGiV4d+cY+/XlOfcI4DjnNRvqF
 A9+Z7P9zQ7WYj9pRT51wMH5t4QmxtajFj+IJG363BLG04X8OEE6puQ57rQLb96VUkSwNdEmReYj
 WF8nufQWIkX34w4bI2uo7eDKcWF8FtItb6kvmG1jYCFihDUQTCwLi08xYilJ4f8c7yH/1tS0Udg
 71mFXOmh
X-Proofpoint-ORIG-GUID: Z8nQiyXoouRxRNRQCzRKaxpAvBzQg5uK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163

From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>

Enable PCIe0 and PCIe1 along with the respective phy-nodes.

PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
attaches while PCIe1 routes to a standard PCIe x4 expansion slot.

Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 30c3e5bead07..17ba3ee99494 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -379,6 +379,40 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&pcie0 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -395,6 +429,54 @@ &sleep_clk {
 	clock-frequency = <32768>;
 };
 
+&tlmm {
+	pcie0_default_state: pcie0-default-state {
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio3";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;

-- 
2.51.0


