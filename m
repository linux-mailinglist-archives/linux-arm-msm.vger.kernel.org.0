Return-Path: <linux-arm-msm+bounces-74969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA8B9DB2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E73C4189AE6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980D02FB96D;
	Thu, 25 Sep 2025 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+4nF7Fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1308D2F290A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782069; cv=none; b=nBaFiMeA2CNEpWo2BJ4secp8mVZH0X2RJLK0VS/cRxRqtmiN+8VOYfiDRpXTlowBjVftMZtrWChjTUhNjFLHLp1Nd9vQFQP/ja+Zl545Ka2msD4HR+ev6baOflfI2VB4RlCfxdGJ2WFbwU/jgzT/2A5SO1KbhbeH7xtCm4bs/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782069; c=relaxed/simple;
	bh=TpwtaDCgHlivPpLqL9/Qjhh1d5fBRL34j4LQ0tY0CRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJR8egDSIv1BGur80hK391DH7GxW+SlLzAKiEqEKVWoskX980+przbMrys6Ks93c1DnTx+076gHgIRKuJF7r90qZYTffmXoPeyew/MSP9Le2qJS06gS9+bC4UiIxz89Pq/SOvnb+TpCXji1LjT2SEn0v9Ty4hScAEsJsLcA2jJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+4nF7Fu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Ev4f021670
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zftByufi9VJbnQvCiyTLuLuPz4flDxNwxk0G+B2C3oY=; b=f+4nF7FulxMp9fms
	/UvKus+RY6t8j6CExvUwlojxdnYsCC7H4/0zRr/3zXZHfZzpbtSHiE6rgrw0kHgT
	L/nPeabl9/59ukJvxXWMUhG+0ge5bvTyKma9Z1kGLzMZD82xO11ed04DICuBPeET
	ORp2+PW7ieZZuTKwDz25amqhJhWssegVN+CqDUdpgFdAwRyWizRnP1y5k3ZCA9JV
	pLIPC/gBj2HqP9zSVQlM0+hJ323XCCiOLn93shUf3EVTBZBGkzDZc38jUAo+bW5P
	ENzQmfrn/pTw8WCoL8rqhJCUW8Tar6g6XHAnR8YNmAn3xFMPguXfeQ1sEIbzxGgB
	Zm506w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaekkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26983c4d708so6176005ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782066; x=1759386866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zftByufi9VJbnQvCiyTLuLuPz4flDxNwxk0G+B2C3oY=;
        b=edWyiik/CQwe1wbLzBrEOO+hNRqfoJj1R/VOWUMfILIiGkB5bf29To6UAzTCf5iNnK
         rbOgvZHH6sD07lmHbuRJad2nKziGgcy3KTTIgSs3daOAV6O2NVzUmKmSL7uBey29aL61
         byRocl9oQZKN9hV4FXmJAx/b/AFVrrQQctY9+IUGIsGraQY7YYmNmA/wyu4tX1T1dyvg
         T5AHQ/NJHo4PtkJ4vwwTg+tZlNfOmVY5x4a3NQS4zAyH94aiHOJbIpmk7ueiqEj1dAce
         AeZDoslI4EjI6i+fQL8wE4MMFNzuFdiSim9lvf7DEXoLYCBcGq8B8D+4RSGLWWDytdWy
         lyxw==
X-Gm-Message-State: AOJu0Yz3BSBhaEOQAllKkwiPw3DABAv8tTdfbSIoklnyZahW6F+gjpVU
	QxInLmWYaOUIzHY8PM4a4SknkYJPXEfeDjY3d1cUFw6FdDy8v4XIc3REqZL53mCdsFhPPf7xQAx
	HeuhS9iYAGOPiWmAioHP+cbEmBYRFu90+Dig1CfXe/fVmCvWjhPihfKq1X/h4iNO6eV7h
X-Gm-Gg: ASbGncuVALI8vKL7QUyyYiu1UoVWBSHP18Oc3XSn7pya7ZdlcS0InKxBq6aI0KgKzrR
	UyBJElozdHP3+ky8247ryX5ksQ59VSarin5EMvr7vDDDP6dGvTM7szsMn6Oprf7nzB2DVVD84wN
	Haozz15ZqhnZR3iM+fI9Mmrm/zceL7ZfsLWIfGCbJHTbCrPi2bvfD2SaEk0oNbn6T60Cz728erf
	4WWvEVw+ZTX/hPlBd/OrdWM0eYFvORDtDTDEWalsVOiIRtLe/s5Gdr3NLiHEzW/1j6/Za1G5it8
	M+FCCJSI15R+vB5oitaqgyxNiZ1bSaBAqjTXYTr5daBk035dlzclF4N+CYeKz7Qs21GjfrC8z0g
	4hhvFPmhngG9DICCWjyhLmfwYnvT9+6rjOYwSrzbduMJn4aKGytc7SH2doh/V
X-Received: by 2002:a17:902:f64d:b0:259:5284:f87b with SMTP id d9443c01a7336-27ed49d0965mr28734305ad.16.1758782065799;
        Wed, 24 Sep 2025 23:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRMrtfbUYMmvipJcaZAjG/PAf36/y1JXJmZcKD4A+f+AbJNuyywZoka5EsJsGc4UHDgbii5Q==
X-Received: by 2002:a17:902:f64d:b0:259:5284:f87b with SMTP id d9443c01a7336-27ed49d0965mr28733295ad.16.1758782064078;
        Wed, 24 Sep 2025 23:34:24 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:23 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:28 +0530
Subject: [PATCH 20/24] arm64: dts: qcom: glymur-crd: Add power supply and
 sideband signal for pcie5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-20-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: n5a6RQdYi1fcwQ-AghEZS-XH0C3gC_Tj
X-Proofpoint-ORIG-GUID: n5a6RQdYi1fcwQ-AghEZS-XH0C3gC_Tj
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4e273 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=p3KB_V4m9cBtC7zP5zwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX8NyM/Vgt7Y9C
 THH2dBnK/iXEK9sSS0/OSeYbNko47ypXGUqDg3StmIxEf70Fs0NVDlu6oMBsqWI7GEgx7NAV6g+
 UowLiVi+3y3XR64pGNrN3nv/hwiIYVYW7NcVWf6QwYghr32piSpT0JruecSl8ubzgLDQ4s6lJgy
 8eaE3bGg82errgEBaWynVR7H6vVWHlazuCAvja8313RheThm5ildo5o6gKHrAFsflvlRizSnIbP
 CGq5FWCc1msX4ye1F9ZONX5G7MZBUy7yjNty9QbuqaL+fQDoLa0NBseNgenD7/dNzO70UVzYTJq
 T6XUP4unqZ3CI3YODJ7ZlasBnnte2V3IYCusMigmPbKOgSiz1bMqOrsgQx20PLa506dss+O1Qky
 DbkektpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

Add perst, wake and clkreq sideband signals and required regulators in
PCIe5 controller and PHY device tree node.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 68 +++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 3f94bdf8b3ccfdff182005d67b8b3f84f956a430..03aacdb1dd7e2354fe31e63183519e53fa022829 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -107,6 +107,20 @@ port@1 {
 			};
 		};
 	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+	};
 };
 
 &tlmm {
@@ -461,3 +475,57 @@ vreg_l4h_e0_1p2: ldo4 {
 &pmk8850_rtc {
 	no-alarm;
 };
+
+&pmh0101_gpios {
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio14";
+		function = "normal";
+		bias-disable;
+	};
+};
+
+&tlmm {
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&pcie5 {
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&pcie5port0 {
+	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};

-- 
2.34.1


