Return-Path: <linux-arm-msm+bounces-72505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ACFB486C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235C2164532
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C872FB0AA;
	Mon,  8 Sep 2025 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZbStJ3e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA82FB0A9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319668; cv=none; b=E4fQ3GeS670Zow3aPnKT+49SrzRlqTuBf5vOkXyyR/NxQRqoSkA4uLfM/wnnjerykZruwcu1Q2EBOTLoTr1fHXi+0SFcUXabYoXDFiS4J7p9qY0zcj8CjCPg/W9gWtxONTA+8SD6hZAziG7a/EtAw/TSzITdv1KyiqbZpV3pK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319668; c=relaxed/simple;
	bh=uT1RQTZ8HcdDiPZOvVJtf44HkHxuTXRz/oiN9/qCASg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cX3s8wR6Y77lsTimgFeOREsQFmJ9iZDQg+bZz0dd81XoiyYWzD8Uhe2QQXiiGkmSUe6IeL7wPup9GnyN9HNIqrRa0opO/hRVhyqc1DWtj3+nNTVHU6QJc2hPuftwJZz8E15yoiY/+ApxcxwxeYbDKaNz3bb8zhIbyU9LjriLGko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZbStJ3e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587M032Y030096
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzF3Foo3tIflXdtMvnJY/IPP1JEHUdPK3n0iEo31wt0=; b=XZbStJ3eSGPBUDMN
	88HUUu+ve2w24Yc3pl4aXO9fi0zOwwhGT7XZ9Rsf5e4CKGn+kkfullrWpPc4bPQl
	IsIme+7CQL5ZVbQVChzJMixULRaF5KzTJaj+k7JQlKolToadcQQsE8eSPt6SMYNE
	WcrxXfdGs9ErxnufjVLVPYNZ1QDpjzKL2hqV1qWUM9D2wB4PKNDqvIKnO3KP70zD
	/HNnEcZi86UiP7OcxK+nMPV6XAk8OvBKIbEhioxKl3vj4XxR8/8APj7j+bQnYJ9F
	tdk43cCDQZPqnDSnq0IKDGYkeoEJIwuHXi+t6GGjurk/h5z+GyakOyFo/PHcAe3Y
	21H3BA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kupug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:21:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24c99f6521dso52270475ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319665; x=1757924465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzF3Foo3tIflXdtMvnJY/IPP1JEHUdPK3n0iEo31wt0=;
        b=CQqezp09K1NWAb0mdpUXDB5uL5qJfAVxeUUdgBF0P/A5c01cOHGTXKVW/9crcMJpyM
         DeSKPpZ9SB2FVOwz1YS+m8Qfc3KjujVHJl/zGmK3PO3iiBRO++/bc5glY0xR7Zv/QTMV
         UhVE4C5uCP6R62S5F7h/VKzs6LK/Q1Y8vSE5EkdJkZiQ20wQsdienGAXqHOuT13wNoLQ
         vb4eieQgFmUzBpOBx5EW+HNODQHU6cPeTzKrVe0inrSHtNfAQeGO4qhBXtCDgMnZe1Et
         lZdKQh+0iVIg/YYyy4Nn7yVKUmeCstxsKOX3iG91c9VckEoJdTNWefzaCutgzNIKjVGd
         OyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXx4X5i9DdVBr4JpKHu5LbbuKwiqpv+BGWJgugraB8HBv29slYFIs+HbwzzR7Wg+NG+mh2bAiRtLcLeQIg@vger.kernel.org
X-Gm-Message-State: AOJu0YxFZVczDVMtFvjavCk38J6E9BUZDV+iplkk1vHnP0JdoeCExCE3
	FQtJvJ5x5BHXdf9Wsc2lVaRMXS2R8NCtLo0N0wL8WWnJ1vu+a7vi96oi0U44zF6cc3w1V0TEIxx
	vH2xsrO8ybn4aEOhAp1jKfbrtUSMhCsH9mN3AUNWIiTwKDGe6s12RpOzPRCk9Dp5PRJ/u
X-Gm-Gg: ASbGnct6fBl2rMZcCQdY2780ilq4MGmsY+8Y5ylRRdmPd0NypLhpr48hBpRnMIIGBF7
	yEBZRxWBp25yZo1pqexFfmADnuM6/Otbv22aLLJcaWiBzf5/QvoNffWu4atBsnQN7xZFCv/MOG4
	QN6HJ7GnEckPkzGCN/w1tx3HQTGiktW6v8gO+Pqo8/WF1JGOKsbddolHhrm5CpUVSfguJ7UivbY
	jTeHLUcEV5bryDLNBhQepMrU71FODYAAOblQ3RRa1K89kkK8dMKtFMP+dxUxtMuXUKcKnhuSRlq
	dKUc8KGzDXsAQt6JQyI0MMk99ALc5Qr0wUAUSA4hSZ6jZVbhO+35QBXLM3iisnHHAaXN
X-Received: by 2002:a17:902:e788:b0:249:1f6b:3268 with SMTP id d9443c01a7336-2516f520906mr101902105ad.18.1757319665519;
        Mon, 08 Sep 2025 01:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtEcObXeeS6q2IcvPfNPJBnf2iAPFVQ1ZO9r/1M/JfZ2eGQGxjoJQj/+y2pFDgvex94Mgosg==
X-Received: by 2002:a17:902:e788:b0:249:1f6b:3268 with SMTP id d9443c01a7336-2516f520906mr101901715ad.18.1757319664998;
        Mon, 08 Sep 2025 01:21:04 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:21:04 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:50:01 +0530
Subject: [PATCH v4 11/14] arm64: dts: qcom: lemans-evk: Enable SDHCI for SD
 Card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-11-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=2103;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=MDJChDydQoup+AQ4stXZYHqRNLvdQ06UIqjeVzxFUuc=;
 b=wR7ahREHx0KuEoAte6tk5BSWjlaOXiHNgFfN4HxxkzQLWC8yORbt6Mhc908CDcr+wTYG0tDBY
 Tyb+ex5UVqTCq4C2nujd/yIBpqTGi0oLGZIpiaBFQtZBevShEWwLxaU
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX8qWhneihFxMF
 ofVI12W2Wv3idLvGF0nPzpBerHwY1zlSpkyS4u9OTl0aGpdbJN6kHQiQD2UbD7RqLvLBrGTEPHe
 TVgyC9x4DL7BrH9ZgzeWYa7rrQKgVmfx5uJh52RMBFwZbMK7DNAZlKDJ7FU9y/U4GZdG51DqNuY
 Piar5qtjAygjVZr0wV+2SIKTk6oeohNYKGLb/Bov5NhCEmB83onA91/05dipPDk1fVUUTZGKWfJ
 VjIzP0wb4zB/eGmJjOHS7kdjZBDbR5Kb8Xyp2hOvj0C28DrNV6WTTtzeSTOpFHYui/htBhO/So9
 tYdCgeRmKfqwemz6kayvJXj3GrVoNaNN8QGFl0SN1UqjhSyTKzDY/9ad79Mw1ksDIPLPAaN0ftY
 7elb7eas
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be91f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=yrLL4yFEfc0NwOpttVsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9m_-io1pu6gebcEfkjvmeqHhGne4qdNN
X-Proofpoint-ORIG-GUID: 9m_-io1pu6gebcEfkjvmeqHhGne4qdNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

From: Monish Chunara <quic_mchunara@quicinc.com>

Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
to support SD card for storage. Also add the corresponding regulators.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 6ec6f9ed1ec9..60e365a13da3 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -16,6 +16,7 @@ / {
 	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
 
 	aliases {
+		mmc1 = &sdhc;
 		serial0 = &uart10;
 	};
 
@@ -46,6 +47,28 @@ edp1_connector_in: endpoint {
 			};
 		};
 	};
+
+	vmmc_sdc: regulator-vmmc-sdc {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vmmc_sdc";
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+	};
+
+	vreg_sdc: regulator-vreg-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +484,22 @@ &remoteproc_gpdsp1 {
 	status = "okay";
 };
 
+&sdhc {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };
@@ -511,6 +550,12 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	sd_cd: sd-cd-state {
+		pins = "gpio36";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart10 {

-- 
2.51.0


