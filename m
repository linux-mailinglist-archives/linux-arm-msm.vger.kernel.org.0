Return-Path: <linux-arm-msm+bounces-73739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB2AB59B67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B59117FE94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2412036808B;
	Tue, 16 Sep 2025 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dn+F4eCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7063629AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034831; cv=none; b=kIZX0H5ppKkpB/aW13DbewY4daYM0pybwfIs5FNPJAXZMLL/ehZxCpGCeQN+eQ9IeV338ATaLg/+Um8/egS2ryc/jPSIDmcqTkSFdJzKgfpIaQS/GAduhWddbCTbWZjPDQv7scnduseXz8HgvO7jUZVvxd4hHQQ/j20XvWQlzfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034831; c=relaxed/simple;
	bh=D+MI1yBSPD0wfaK64wdrIx16i0xhge1W8zq7BamNICI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBT0xinBDWbLATkga1vFIe5irKLJJH+ztYksJggJ94o02eLE+CcBa+3pnD3m1XqPrHTJMyVQhka0SQNC3MiacjfYhscN1Fch7ZJCr6tKstubH320y0fQIJf/bjq0qC0gGOXclsDol8yLzRG8b0BVlsCKYCiPeLTUyxnuaSz96ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dn+F4eCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA6AZQ004961
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2Wl9Ei/DIdqaCb3FT29b9bLmkPceZ9goQF1SjIPoN8=; b=Dn+F4eCw6jihG5yr
	pMwLMbSQkJ2EoH4uunNiOUHS7/ns8U/ttw0h0VsHsXDxIpJc05bxDMEWL/R7CQkV
	lAYGz3FWgwTmFasHMhppKtHrN+d6+bIcLoEMhrF8KcDNL4agkOa0BRVHjOja4d/j
	hXdUTU5rx3/6VjHUkEntJaopwOr5ITtV8BFfXVJANvBrl1bX1BzwMnaE6XXiZJTi
	QsdaGOqicNAIjSlTt2upu6MiAPdUIwiBKJn3ePeYvaREmcWMK5xg3n1hTUQNV9MI
	enn6G0oSDws+h2B3r6GmtTpPGKkAstpJNFzlKdGLdYb8FNQ06RCQjZj+Y0TvuIBl
	1wP+FA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u596ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581ce13aso113322785ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034827; x=1758639627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2Wl9Ei/DIdqaCb3FT29b9bLmkPceZ9goQF1SjIPoN8=;
        b=IVDUwGp0oYdv3vX/6OOAlp42cFYkhdLVuzBtmJnYfWLSCZBYVFf9HoLnIrYpKqzHpQ
         PyYEhNbMoyLs99ZSubg7Id5B7P+xCAniKvINmyTvZjFyZtpxro63IFT8Leo3aKntHWhE
         bewpTHV7KBVEHGDXhR0tV6LdYv+eGKNEGBIUymUs1C7jFPcKKzn3t5hBDEhlnuf5W02T
         3u4pC3PGO2U9BGZ2YPDTxhaIACMlUd4SmhQeEHHjvYOp33E4i/tNADpy98fQcQjxOKzN
         /v8oZ7JH1u9Bkq4S89+pmniGI1CmDFAWWnqg8wX5vgKx6hLFpJGG6MaziPCB9lrJjN1y
         RoXw==
X-Forwarded-Encrypted: i=1; AJvYcCUYVvyI3EVOyLOhh6odv0cUvWEooN1AMVbNboPkjaFxh6j9l/ip9F61u5i6FybMxhygwa84FPrUPrOqMAhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzalkk+WEAau1NOgUUXb/jp5sSahlA3usJlC0K//Jp+KWafjqu
	vITdfgpWxHBuzl2zePlRXrhggpnqwR2sqYvqKCaDVd5xBCYJO/mLNDbZbQBu3/X04sWQGl2g8ms
	TUDEP+4gEJIPq5qbRlV1/xBkPEWOaMEb37WXpXhrqD1r14eFvUJ7mkvyn8qwi8GODvNMy
X-Gm-Gg: ASbGnctQkLWjUwqXvuGy3ReJYDT8Jd2/xGlQehwnw/+zMOebx8GP+Qk+mvhov5b23Rj
	61+L99uLJzBAhj7azZRw1aZdJQJbrhzWx7VYVucg/lC85N6ESxQUDdqu6WLIO9Gkxdwtp4Sp+ef
	mvft2wmPtE02pTUYOwg8KGMc7qgoYG7iA85tGaVnBby209e7nxnsxLlwY5hb1EwbB+rn8iEJRbC
	Ja99xTAwfB3OK/wBxg3wg81SesYabsP0jz60t9viC3nsWAEVm5I84SlhbSCOCS+Vhe5LdjWS+9G
	1s8YkpM7yxpXHsCswlEBzCLwtRJvYFpchsowYvPlH5QtSFgHUEUeRv56+CK4bn68DqsF
X-Received: by 2002:a17:903:240d:b0:267:ba92:4d3a with SMTP id d9443c01a7336-267ba924f53mr55752545ad.6.1758034826589;
        Tue, 16 Sep 2025 08:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzVwiO2rpg+4Oduh271gIE5EJgVxIPETHc/7YFjqcVMjYk69yT8M6FE0sDePh7YrEWkPJSxg==
X-Received: by 2002:a17:903:240d:b0:267:ba92:4d3a with SMTP id d9443c01a7336-267ba924f53mr55750955ad.6.1758034825496;
        Tue, 16 Sep 2025 08:00:25 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:25 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:31 +0530
Subject: [PATCH v6 09/10] arm64: dts: qcom: lemans-evk: Enable SDHCI for SD
 Card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-9-62e6a9018df4@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=2151;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=wTUKv5iuUm44oYSXkoHnDdPei2RDohsGfjquUCYOO7w=;
 b=1NB1AhnzEB/9+2GIL0JUL6Q8Ie0ZvVJAQ//XKFFLSSQ4J0ZdEwVGBVLskYVRXlR8Q9J5Q/0YP
 nJfTAVZr+x1DdWQr7wl7aqjhYCYat5eQOrhBeh7tdXNL83zicUM8UKG
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: 2ZFM0DfcpH1r-se-oVE4U5zGLj9tUQPS
X-Proofpoint-ORIG-GUID: 2ZFM0DfcpH1r-se-oVE4U5zGLj9tUQPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfXw2Y2ERbEOINv
 V33j6d2Zabtc4UCeH72IPAChSY3Deffier2ysKlmKOWUH1+a4keuRB2wqZqmrif6eK1AnsmVKoh
 8wnlM9Zrw87Ui55u7mzxSmxVZ2HzsU53J2c5hpdHKP9YQ7T9IlxVVfMKN3Heha3gB0eEAOGlwwt
 ESqiQurMgb8HoiQWFHh82kxewnbKE8anwvILTKiWzKFa3ECSVLUHjW1rEe+ohytyV3RW0yfPvxj
 b3NMTYFIwHcgWRv0fHQaP7/xWjLHGOa2mxWO036KvgwrU8WcD/qv0GCgqBb6BNxsru+ycS2s4z3
 MpYR6k0nlsiJ59TzECEx9w8enpkOmeQ319iZrfqDLVErLYbGnDRkKVkhgRoCa+gxXVOVWLAedCc
 cfSdaesg
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c97b8c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ZiJiVGjlRZjjTBZS6bkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

From: Monish Chunara <quic_mchunara@quicinc.com>

Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
to support SD card for storage. Also add the corresponding regulators.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


