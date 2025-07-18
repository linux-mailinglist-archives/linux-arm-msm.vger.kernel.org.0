Return-Path: <linux-arm-msm+bounces-65659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A37EB0A49A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 14:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBDE57B7EDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC022DC323;
	Fri, 18 Jul 2025 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZE4u3Ay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A304C2949F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752843452; cv=none; b=MriBSijq20JahZWlmsAMLvVgAH7IkpPEmOGlwviCPArzbkjBLwXVpEIlWboVDy4vtHp78RSWcT63afDpv/WU9AFLkyAX1OiIWsgYQSy+bS/icrIN76YK2ZgGppAo7UIkHzAZ7Exbh11wgNUk3N1F9ogZlcsZFmsREpx8+qjUK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752843452; c=relaxed/simple;
	bh=cKGR0zU7s3E7oC57YRtxwLHqmhnJa97I1Yo8wxaA6/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPdER/QR+cSuZWYaJ8YK3b141guwBtkro6ES8hSfjUhbUsIMTKjMuitPLH7AnkTniu7iYPMlAidMKlT09ddOxr/emc77TlzLaimqaUgH1AVlyLmMByWBvsw+j5S3UN+UuiWPrkcJAWOZQIhA5lLtl6KNrg30o8Hqfr9IJU7QZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZE4u3Ay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8TMok007306
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86sPeJjsQ6KRGA2VS9+la7ElomzbtmNHgwe5CMceEL0=; b=WZE4u3AyaDYwX1Xl
	uwxlB7F/aOeHMbV8VSOE1fVOI5SM3K9RqEPP4P5VNiRx0/FvjumZ9ctUFFEbJwXI
	YZPfe/WUK8fufB2zQ6pDF/61Xxbkm4VUZ4qZxL0Xil9kPXFm82kD11gDy9SwNZbz
	uw0twJyI6jo2aLR3hIag4t+Pf+pSrwmBGtRhSU9fjXXsX7QU0AXGpHzqmkNdL5QW
	LyQ4GvQ9rJDv/OCo5JgXPi9uQqwtSv3Qr747Xggx6LhxG5CkYzZGeZ5aHSsh8bIF
	wRRVKMu9jVTBxeh+x4YYkJzZZ0CYYd0lBssDkhWCVDB4v1GuvGlW8kS6uobtPC6w
	Ybuehg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcacq16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:57:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so2018584a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 05:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752843448; x=1753448248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86sPeJjsQ6KRGA2VS9+la7ElomzbtmNHgwe5CMceEL0=;
        b=olKdVCBMCBl+szjRvT2+o9Ypn7DzNkB8mJgg7Jg5H+TKTZMXCc86p4DlrQy7nzSuaF
         xXRRlCKwYvg3RC/CS02PSn5cER0ff8ctFvV0ulzUXe4DjoIVSL5Cnnod60zmHMyZDvAn
         LWV4lE2u42zUs6Wg1le57cGCpmZI+7RJqr+Q4y3sw6EC6CB/rJTvNUvkxZhWdUd6uFrO
         esGQ9CaMEQJYyimjkVL8XS4omJD6oS3ixnN6G45cxxN7FUQiTF0EzDvA7zSaUW56Wxjr
         +Cay+OkQcMnghTqyzBxNFKof555HK2wNfprkL8+7+6tlXj6qBGOVQvtY6KB3+XuVH3LE
         UgPQ==
X-Gm-Message-State: AOJu0YxQGXNwKsXsNiqHvbcmg35gmjg5jv05mFph4npn7R47/ggeqFqW
	UYimwjAgQ1hc59iBwD5+DG9Lx2l0l6DqUdkVpWPo5jKSvC8wcjiMm3/o1LEVAcNZn0AlAPy/1KF
	D1pJSJJ+xQ9E9ObWmWc4qf559/4PU+8xoz43yXsHoiBAv4LnOQCEkc4cMuSDojo3lP9hpxdxumm
	Tk
X-Gm-Gg: ASbGncsgkzR6MbDolQP/7UXoGIGnGYm3oxQU8Vtezgj4As1ixCoq5jo953EnsKZcWsl
	z+iZ23N5xCo9TrwS1IFhRIw3uFXjWfyiu634m3yjgMSkJJ4m5ljiPHKvi40/Ao6r4hci1E365aG
	s7uPr94+WVGnl2aWbZXjIywvr/MuH49GNeCwcOFJ5HEFWD6svv7TSe6EkaaPHVtfJmD6NatmB5W
	TVyn/wsZ53qfrpx9uB8gBTQhvy9c7czVoXxJiQCF6qa+umWH0Mjzta9dPbwuDjYPAtqjGTkf4se
	aaBu+bIrwATcAam2qOiQ9oYdoAflXeZtAMzb79ILy2e/jONvgy0A6NaWBNIi1a6PvskkyigmKiJ
	w+KzGVay/+LJRFw==
X-Received: by 2002:a17:90a:d44c:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-31c9e761788mr15380321a91.21.1752843447714;
        Fri, 18 Jul 2025 05:57:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw0ZMchemW/BxrHg+O4GUogX2V+2SB2S/yCDt9/ia77pHKXWliKDjCnNxwxrDAi0XV8zA0aQ==
X-Received: by 2002:a17:90a:d44c:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-31c9e761788mr15380271a91.21.1752843446895;
        Fri, 18 Jul 2025 05:57:26 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3bdfe68csm12332435ad.183.2025.07.18.05.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 05:57:26 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 20:56:33 +0800
Subject: [PATCH v5 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-add-display-support-for-qcs615-platform-v5-2-8579788ea195@oss.qualcomm.com>
References: <20250718-add-display-support-for-qcs615-platform-v5-0-8579788ea195@oss.qualcomm.com>
In-Reply-To: <20250718-add-display-support-for-qcs615-platform-v5-0-8579788ea195@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Li Liu <quic_lliu6@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752843427; l=2660;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=HPPkd23RAXZhBC6QdfhvqrWN3kBAQ/AeNsE7Zd1V/E8=;
 b=a4WgfiCQDKJ6C63WPlA+4uQbQt3dxH2N7vlIXCddhAhWWBvQkTTpLeRNgm1ADhWhaH05hVVke
 MUMC1NfB6kkDDMtU2aGQIZTuFlvZR1ed8udVyy/b36naq2KOOSeWwco
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA5OSBTYWx0ZWRfXzI6wnQycdDo6
 Go4eJfGfPfOyss/OCEGav0HTKjcW8wPANvo0Za39P8VZNesz00jmFsrKNQMyqL9qMjj69scaaRt
 v0gadxR6jTSg4YY3MEMEOtrMFaP7rjEnBTCpwOQi7Epj9PiSfya8zTt9uWX7eFOpJk5+aYntvFV
 /eTTqeIRtSnGn9XEBxlBpW6MUmEbr4KCqQg6dpVvvMnM8rwtdSV+f3MLuapHmF2VHiXgq8GVILr
 Tuy9P5MZi5EMDgDeVwT7sVN8r3VUHtQ0bPHSz7rpw1wrvS5tIWUhE4ID+xNLRm9eiiOFUbLFVZe
 lEvhEV4lwiK73SICGTo8VCyA+bJWCSuKlKQUGKrfzhWnQ6L9aul0eaS9nsUwmobT2ebfbGLt0QE
 5GSyF6IkwIXLAmN79ZYgO6wQgf1X+8b4BYLitde26oOOFM8bPbNIT9I7vf0BOzrpNyONkMTz
X-Proofpoint-GUID: WEQBvo9uOIH9B48qxRD1IaR9g8vNUSZO
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a44b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=TqExVNhVPFZef0qJFWwA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WEQBvo9uOIH9B48qxRD1IaR9g8vNUSZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180099

From: Li Liu <quic_lliu6@quicinc.com>

Add display MDSS and DSI configuration for QCS615 RIDE board.
QCS615 has a DP port, and DP support will be added in a later patch.

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 90 ++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index a6652e4817d1c218c7981b04daeb035e2852ac1a..f41e0763170df40c5d10497049ae74ab4aee4950 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -38,6 +38,18 @@ xo_board_clk: xo-board-clk {
 		};
 	};
 
+	dp-dsi0-connector {
+		compatible = "dp-connector";
+		label = "DSI0";
+		type = "mini";
+
+		port {
+			dp_dsi0_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_bridge_out>;
+			};
+		};
+	};
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -217,6 +229,84 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	io_expander: gpio@3e {
+		compatible = "semtech,sx1509q";
+		reg = <0x3e>;
+		interrupts-extended = <&tlmm 58 IRQ_TYPE_EDGE_FALLING>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		semtech,probe-reset;
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9542";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupts-extended = <&io_expander 0 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+				wakeup-source;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dsi2dp_bridge_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dsi2dp_bridge_out: endpoint {
+							remote-endpoint = <&dp_dsi0_connector_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&dsi2dp_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio10";

-- 
2.34.1


