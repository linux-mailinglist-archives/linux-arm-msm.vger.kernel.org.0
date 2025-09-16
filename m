Return-Path: <linux-arm-msm+bounces-73737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29012B59B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C10DF527EB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614E335A2B0;
	Tue, 16 Sep 2025 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kryeaJq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9AA34A33C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034820; cv=none; b=PTMQ2qSuwo/zd/wJ6K1asVAkuwgebS2FqkHJDIiuStI+ATBQDHA6x3rCBn1aNRLLopxAX/f+VaESQmRwNBoWA6GjPA9zWeehlFW//at8pK+CFrQpPRmEcYuihsfoKYdKZHzJkdXTS1mwdmYMo8JMYCZQs1IAu1JyHQpspfI4EIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034820; c=relaxed/simple;
	bh=gW0bPo3OkmUFna1ZDaJHjlE8SmA8Fb3vkmArQbP1lQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBnbHyIxfEH8swZuDJMTaDq+TiXoev732/MKAxYsbRY1YOlODGn8sr4kOu62nBkltWyCWQXu5YD+7BZkVM6w2OEMn3kfZ8F6Kp+y50cLAUXkgPbpHbRf5BGmfL3/ZWunOtZPp2O/mJDznKE4x/lCeq7Nnx5dViFg3jzCFRr0MFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kryeaJq+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABO2A020371
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DfmoJCJYMW/3EkyXGndpmyfnXojx9Z+R8xHTgwqc19U=; b=kryeaJq+CAVPVeZs
	5Mnk4BSWozSGC/kzOElFYesnzCnpGRIbdLR1drPh2k8Tg9YzhMPIx5/vJaYypNsn
	weaoHcuibn/K7klHYfbPQ8WxtvBWvcvaC40J9GnL1B1Sg7rRx2PbiqaXTlseyQOx
	fDX+KXRd19i3G1SBa5IrK11qK6Vz8GnKCP/NSAilZySEcj/9yQ+EhK6/hSYW/ioX
	PXHlMW8olP2y+NtepNIJPUxVZO8CCnIZOGNk0zMPkOcgI5IRFhooXxHNvW5IXC/8
	Vg1uAfpbe/8krCOSV2d4jRrGaCt955ZEwb9iLcI0HLvJD+kQtpu5X7oOQF53vxmX
	oFphig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chh6dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457f59889so58074705ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034805; x=1758639605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfmoJCJYMW/3EkyXGndpmyfnXojx9Z+R8xHTgwqc19U=;
        b=skJXAvZS8VPvtArh8R3YsOFtV7/271TbdoWl7kSOIlhIyGBiN/ix9nqud24hS4wbc6
         M4bEI/Z8wb8XgspiwA936tGIEFn07CfZ7C2TQ8zPwuunh45i30UgTWHh7TlwbnnxdBVl
         O8OaafTUesG6t6rvcBzjqLnTeIxhM/PukrwKzBazNIEud3ch9i4p/613YF8EyswghQvb
         61JNYbE28R/NQOqzbxghH2SHpkvG9MoSSD3bkUPxAwDltb8oZ8lHJcm7D26mDxQgOAM4
         c3foDA+lNbkdPcTSEBZQ05E4GqF8XkhEAxFKHOtuXMJA9f9hktJZiU4A15VT8Mkwn2qQ
         SfBg==
X-Forwarded-Encrypted: i=1; AJvYcCX8VKARMpllq38v3E8iIBJkT/39cNG8sba4AdkyJnpLp74KKmrAI30ENdwN8y0cx8nXaQZ3vhOH/Y3pHjw7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7IpY8M45uPhCG4EIv64O4hgv2NOA4fG4FROcHUar8y3EokcYU
	iJkbzSnUbquETxVoyli1Tsa5mibRILttvu5s8BuiPFcN9cohYj4Rr+i58EKtOcCm/N+B4u3DBhg
	QcW47LAgxOkkHRe8FT1KhY7GZJH6Nk/uDDA3VXeRHXbscl8T/ziFXem+2NB5sIX8bUdw6
X-Gm-Gg: ASbGncvHWOWT6NGMiLr4g6sh4prmslyrmCGxylPqsY4JrB5kiG3GA42M0DxXe7C48wN
	Y0o1II/duSDNzDa0J0EgmDxnvnQGAIazDpm+HIHYeAnhzldx/MT0COL2KwE0j7YY7j/7VPeoXsP
	5G2tDNm0/O45GLiTK9/DfMIMXZIHk0d3vYgTwfbWS74dF4molTPR8BOnlL+5g8ngFCMS3QV2Ora
	hRd7PIxzkqzfJZUUHkcDXfj2chfYjq9aqXot2RByC/uT92Ju5hmwoBcbgas9HLmgCR5+gbnpLcU
	/IbAH7RDkDtVMSvtIAx2RvEP/RU0sp9qZwFi0+PdBDSSUIsssZWnA/yyXY02I59AkCG8
X-Received: by 2002:a17:903:2411:b0:267:d7f8:405d with SMTP id d9443c01a7336-267d7f84855mr29224705ad.10.1758034804865;
        Tue, 16 Sep 2025 08:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5eMZ3RiMQThYk5LoeR9kX3JpRxyHtX+/pIEbsAA7FmX7mepRw7fJ9bUWKCBjk6kV7kbNZUw==
X-Received: by 2002:a17:903:2411:b0:267:d7f8:405d with SMTP id d9443c01a7336-267d7f84855mr29224045ad.10.1758034804410;
        Tue, 16 Sep 2025 08:00:04 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:04 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:27 +0530
Subject: [PATCH v6 05/10] arm64: dts: qcom: lemans-evk: Enable PCIe support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-5-62e6a9018df4@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=2502;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=3WsuSGjjSbB/JTrN1dwDIFLbf/p0GZwKko6k8n3FmiI=;
 b=sUXfC3dIKKDaw9CiY4EJTvMsBLjNH0VUE/wTCuR3uY8De/EzQ3wzGaIcguY3uTR8iU+6KQKIg
 hA7Zcj65CgxCSmnYgSQg5Zy8MEqKbNZGHovLvxIGtEWXeSrnsvFH3ia
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c97b81 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=y_IpLqVBJp9He2uYrA4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: y5zfdVyQhQlam8mp0Ixm603vD0OHbVoZ
X-Proofpoint-GUID: y5zfdVyQhQlam8mp0Ixm603vD0OHbVoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX+N2TFmdtEod9
 sakgN0cTRNWySUpqZYreDrSS/vb6tE2xp93bKLX7TVyPlo1Z4ryzLeIxtALMsBQQPFxB2Wstnfk
 zsmZQJtn3jCCfQWymZJJrjwJR1JuclkvjMXPqFsi+w2DeZClb0C3xF+vzFSadeTgMAk560nqQPa
 4nY/Vbu2uM6uFupbvK0E7O5WNbpEbT4zJeOHVc5nUe5pNngqBaNcq6ViXhdUqXhG6yPrP/2c5np
 6vsK/Qt52Zrg8Lz5U7c8UXAATyGScuX4jpTuVdukUI8/T7u+uIn3sd5yxKPvw0M/Pcb1Zw/+IuQ
 f0YhS3BFpELV4cvPJiJJg5QNFBwdtNj8AUh/ojS9NGQS7YFzA0VbBss5R/HW2CCHLPVOtxCzzrK
 S7K7o366
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>

Enable PCIe0 and PCIe1 along with the respective phy-nodes.

PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
attaches while PCIe1 routes to a standard PCIe x4 expansion slot.

Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 97428d9e3e41..99400ff12cfd 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -431,6 +431,40 @@ &mdss0_dp1_phy {
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
@@ -447,6 +481,54 @@ &sleep_clk {
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
+			bias-pull-up;
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
+			bias-pull-up;
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


