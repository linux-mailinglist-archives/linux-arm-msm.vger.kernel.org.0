Return-Path: <linux-arm-msm+bounces-73688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08528B5943F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBB512A7A33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1900E2D0267;
	Tue, 16 Sep 2025 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtnSm9pv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A972D028A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019675; cv=none; b=hJk9ymfIMv7c50/SqTdRLybO8CUIZFKitiXK4BX8thQ6BaWfOII2jgrk8AMXbQWNnt1T4XHt5yElNk8PP61FRNtsOlUBDls+er+csH58AO3/hFbtrFuqB9jKyeLM51sLh9zO6Ix5Wh9YHf5p9G9gY9k2EoZ0q4aqBlsmRzKrd+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019675; c=relaxed/simple;
	bh=H8QwqcbzikZ9doV2z6v5RmxCk7YJMt4fL77bDu5hjC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxQ4mo0MmzQbjb5q13ux6ZznutJPaQLZAOgyuQTEDNPxdw6btW54GfBpuWGLAAmL9p9AROORlUokT0Q+iHMIOoT/8gZWvcs0Mn5xdhnx9kupKssYSn0urAiWoD64DW2f4nasFM0KY4i/5R18kbnGoCpTftVi/euz3iNzIpBT36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtnSm9pv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3q64b019431
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbefT7A0C0BpxFO4WkUOl6TDFSMTNVjZvsErL/F9ONQ=; b=DtnSm9pvgWiQaAgX
	3K70hc1rDLKo1yBqk55BKr+e7FPZOkbS3mu10faweF5kiRtBkIQaL/5v0Xr/vYvY
	MpYNKnvzcCH6eeyHAzAfRrQjYtP9xk1SWt8huUOtzfWxsdMLxwcXH4v4QItCsn6s
	6APTKSjBlw8fdG8j2SeyTPj8T/yEOzi2QQYxEpjTtPO41K8PtLH5gZUPDuTwasgJ
	uQ/nPudEl+jdcc/YAZzX7IMeWzOFwJuuAn5rmnjqUoB87QOwOZON8k77jclrimw2
	uBK/o5VqfbKexHnMj4FYy1NequU8Nonunk841yre69sJfLC2bTOiiUdIiJYeRkmQ
	qjiaGA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9cxn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2665df2e24aso38646395ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019671; x=1758624471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbefT7A0C0BpxFO4WkUOl6TDFSMTNVjZvsErL/F9ONQ=;
        b=sRzd7JoFPnV8XxRmXP1tXXewENkBJb0XeIGuo0bdrIdEk4yzhYDqIRzcdtpIgKnvoD
         L7Z1VsSRTcssRMzgskqOfzaOl62zNmhy/xMJtsHH+bYeVERj4oBn9wCd2akLyEZo8bme
         ThIcHGx4Tbnv2T0ZGqPp7k0Tt6hJh7rPGcJHp2fme6LmCzPCqDCTaXrDlF451hRdTh9A
         eHROpj6mFeNnmt/ktR5VSGwMYLIJoGicpGLgukY8dwVIEEqvjY2CLv7QS0kbm6y+UwLT
         Ct8e0Ry51UxOHxK17BH6F1z6RO6AqMA6srSGTCUmgXqNed3pFdsCxvR7YYtjf5ABqyE6
         zGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUtxQ+ASGY3amNl2Q52wI54UPzbjUHDhnI7LjFnZk7R5j62O4nh+HnldrEPLYIQAXL3YiQGjOtAEFGaxlH@vger.kernel.org
X-Gm-Message-State: AOJu0YxO+OQvEwHzk7WiYYPDtHG07kWm4io837usmCMXmXAiRGowPjHi
	qV6ENfAd5ASxrlebkzGGGfB8HHAJ9DuBuQZa6tvN6wnFuyx8UuhqwJZ36JwnxKXGxbgeO3sA4nk
	mU2+U+jtZ2nSCACUK9DlZQyRvm/z4Ycahp4cYsxeaqFQj9Nv3boAzUllP23uJ4tG1F+x/
X-Gm-Gg: ASbGncv4tTO5O5iverD8yPGUPuaKKPIcJciubD0oZK2YJmSvTZ6uI/Vs1WiBh9yYutE
	NInnopxTP82si56h/9YkDU5HDiAPz83x4cdzDJivOhbeLhH40FyuX/YSFozAsfLFJwi0kKoKoZi
	bzaf2g7mmNU1puVFo5GO6REYlFLZ68i7tn5jxxL+foNY/8Pi+VAnc4HaDwX/LwrQ+id/p1udOlm
	Ilm3PQoZsDJPPk03HhCaE1iGP7hXhCyK+dYw8+fwBWdHWmwA9GwdIoOSY8APbCNFarBGAhMP1bY
	E/1xL5+sEkaxZfyARVak9mO0Tv2wK0VJ2rRrfF7ADKVEaTwr2EY8CvJlhViBE7GIJJI9
X-Received: by 2002:a17:902:ccca:b0:25d:f26d:3b9e with SMTP id d9443c01a7336-25df26d3c13mr191532315ad.11.1758019670591;
        Tue, 16 Sep 2025 03:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIwlPFkFrF0A23fYEzT2xF+R+svZM56yfsGO8ZANDLvL6HFROJPYSPUG1fzKuQzM3uWNZfCg==
X-Received: by 2002:a17:902:ccca:b0:25d:f26d:3b9e with SMTP id d9443c01a7336-25df26d3c13mr191531955ad.11.1758019670152;
        Tue, 16 Sep 2025 03:47:50 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267b2246d32sm33122355ad.143.2025.09.16.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:47:49 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 16:16:57 +0530
Subject: [PATCH v5 09/10] arm64: dts: qcom: lemans-evk: Enable SDHCI for SD
 Card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v5-9-53d7d206669d@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758019616; l=2084;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=4ciQ96Zx1ayEnFBiXoRdRMoUhFOeRBAJsPy/zaYTqMk=;
 b=1lbihZixVOcWdOgKnh3BrHdupvH3C5+p1uNconNaGX3lNvSOxT2I2HO30GwrMv6+GXVUWNboO
 5iHoTSAox+DCQu4J7JDgdiBbMDIJmQQOU82d1T/ayjvhjHurE3gAiVT
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c94058 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ZiJiVGjlRZjjTBZS6bkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LFXAHWG3W8S9fDPD2M09e7Vb5vSu26tS
X-Proofpoint-ORIG-GUID: LFXAHWG3W8S9fDPD2M09e7Vb5vSu26tS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX4zl8VLqLOWk8
 dVzjshuWY2G5+W1vPWH7FmJp/OuoESmP40Tz+P82uQN1aLvF1BkyHT3fFdiGc+0BQZRzf8EgKhV
 mBNCcYq2WM1ONho2UEkwDUPeT9FOy5SVLWpnK/lAGcCE9GfmtO1KTalqwEddD1+zPp2VfImgg2x
 UDX/tlZoUJpAQWgeHOTsQ3HCeIcv/ML4db+E26xs7YYnlFlClwbk1y8hSjPUipIJkgwa7QPNnFM
 Yf+ZCdNLHnpJFHQx5LfODpiY3Lv/x3CwJ3oevSB4YkN5nM5tDDTOb1fA1jATxXtvTBZCLInDN31
 9YtvZ0NnzoEoM35b8Ytt3VN7X9Z/YQszpLeVcULGOzPxOqMDTtFrm6TL0srDG79IDDiF5Ovrg8b
 mlX1SI1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056

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
index 3a0376f399e0..0170da9362ae 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -17,6 +17,7 @@ / {
 	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
 
 	aliases {
+		mmc1 = &sdhc;
 		serial0 = &uart10;
 	};
 
@@ -98,6 +99,28 @@ platform {
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
@@ -513,6 +536,22 @@ &remoteproc_gpdsp1 {
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
@@ -563,6 +602,12 @@ wake-pins {
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


