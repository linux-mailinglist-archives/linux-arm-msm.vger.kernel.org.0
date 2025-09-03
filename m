Return-Path: <linux-arm-msm+bounces-71822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA01B41D5D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E7001BA5CCD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778F72FD1B0;
	Wed,  3 Sep 2025 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fehguLeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02452FCC1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900073; cv=none; b=S2zu8+wCqAshbuWx/B577V0u0ryRT+2p87di0yc3WVl/dvV6jiaVyHpW1ykWdO4cE+WDIuPxwtA9XyRSYNH8dr+Q2bAJs6Obra1MEMtx5NnWhHFpSLXAngNEmdQZXwdI/du8mJouP73xXk22hxMiK7rWIOZKDrpTwS92QhtX/uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900073; c=relaxed/simple;
	bh=OnktyLXlAvw79LU30W2286PIYUB0ZIxd6VhBwuBv3ZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bF9FHJhK0qvnLnivrajamt53fqS0Hoog35q3AmQG34PCGYE4n+PCTXs+LXTDXxk7KooVhwbNDvcCKjTHfJbBXfh3AarwQdY/Kbe+83RxGZ+zGeYmZObN7cEoWQDDGYTuAVpyXUO7v9AiLrTMp783weSkRqI54Iuu56pSU9tYMM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fehguLeU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEvgN000723
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXZGpMX3yOrOQ/k31nwEuT7jwrMYrLpKw0F69FmVEdo=; b=fehguLeU8nl85U4j
	rhXTLdC9xdLtUq8Hg07zOGaP3Ad9x/JL4mbtOcnaFcYxeKRCQMSUIzEzsLpZWGPE
	GoBkvDYOv3kMkp2X5ix42AsoCGdAQgtdxb4QNfwmcDIZPo+yqs2mJO8u+1UoXl3A
	iw20o0Tr8f09+6k2YsCNuAzqfV3+rlLNTj86Dj7lQD5LLkhTz8EpWU+A4KP2QX6S
	2yMn4pAbBXaX4qmkoR8neOp6d+5Y6j2e96SnbcKFPZ4RZd2hdEI7+iu0bO4goShF
	g7V9a3xQNSMoNCF98k0cR9smmH29TzZ9waGzpYwcMLJpj3DY/R8VGADSqj3Saba/
	WPcBdg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush33byn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:47:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4e63a34f3fso3059651a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900070; x=1757504870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXZGpMX3yOrOQ/k31nwEuT7jwrMYrLpKw0F69FmVEdo=;
        b=XB71+dvME/AMFz2rsQ0njtzFrvO2kSSobOO4JMLugo0v7a+t4rATPBjvJ9ApKQtq1L
         pil3tS97EJLey3vtpWtZRkMBj0Xk8jgjWB64WbbsPe5EmKnQXaWFCoXQrhCvOPZJNlMW
         5uz1+WUxgADOrRptUwDWLho36Ive3mIlpwY3pYd+hUZEgtJVbCiz1c9KY/ZzXRXeK3HU
         /0Eb2guNaLNajOK2LIg0M0ssHYnCUZ1oqD9rlOjIPfc8GrrxfJXukajFVduPbvulX7ox
         RfZVOmN6HvbSOfEmQAjZKwhgvWOjhXOICLjhGuGHaZdfgtvBRm+RujI/vL1QbfuZlGrp
         jEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2KL7KK93lZHI+0iUH6LTJGdFvD1R5zYDAWnu2Hc0jQ2i6mRfvnRaFFePqM+3g56HLLN5/ad0dnx6Hd4z3@vger.kernel.org
X-Gm-Message-State: AOJu0YzUll2aveTgFqyDrgUjmpZmw2eSYx119yBc6TKn4eqeXkctqkG1
	IhsEwRP8aTnVBzzFQQQbHjELTAYEERdLaRp3V2TGDkENTnkjrOK8HgQawTbq3MuU7UyStFNgwIX
	aRokO5SLWoFREzU5w3DattqrVBKI97OdfN8meBtVT+7zrJxtVz2IVZaTwDBZh+rNmZf41
X-Gm-Gg: ASbGncuikEblsE0crM9lRg5KGAT1N5/U3kQP/WkkZEouSWD/lGUsWQWuEZtbz8Cp93r
	Tk56UiHkmw+k0q8WyCCdZlkWJSURE5bfR1eLONsIbim6de7Mf1hZMHNUaRqOZ3+FdPkOgL7/09G
	RzzDIuudzEzFhdU7PBhhyL8epnbBjkel9hc9TSXFOyJGIfCGWs83e+7ijynpHBMPQK/IzeJ8r1q
	uVCJ9lf4xY6l5QHktt51kWQkl4aGi0xLcU+UIvzA8sb3LnZxtCP3GT+llc3zd2nd7Ki4JG6SWtU
	vNXEvcVAeEU13pQI1k9JnW1CB6krqHtb5SfJa9kpgWvxymlGg5Qsyt+d3Qq4gF1HmwhL
X-Received: by 2002:a05:6a20:7fa8:b0:243:a91c:6564 with SMTP id adf61e73a8af0-243d6f431a3mr19272867637.50.1756900070437;
        Wed, 03 Sep 2025 04:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE+Q7esFWKub9PAlvBnehvvfXsc6KCukl6SiDDF6aya8S/1QEYowQVoz4bs50W6LD49Jov4w==
X-Received: by 2002:a05:6a20:7fa8:b0:243:a91c:6564 with SMTP id adf61e73a8af0-243d6f431a3mr19272834637.50.1756900069926;
        Wed, 03 Sep 2025 04:47:49 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm6584074a12.37.2025.09.03.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:47:49 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 17:17:04 +0530
Subject: [PATCH v2 03/13] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-lemans-evk-bu-v2-3-bfa381bf8ba2@oss.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756900050; l=1237;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=wNPfzyJsHuof8OoLd/8jyZfN9jNfvGHQW02eb1RzEjE=;
 b=0b/LYijs/sr4es5fM86gI5QstjtnDPg6dCaC3GynfKhA8oLib+VAZsHsOmZBI2gUq5fzF3dL0
 K0ocgFnwazdD47ESQZRaghlLahaQT5VBA+vJ72LdfZ4XLgPnl8cC3aE
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX36XEyESVXw7K
 MJ/ANQTUQsZg7b/7JqzM3XBqK4BnQwxBhVh2uoNWaIoPV/TX8CjayWgVWjB7aeTpy6m6wYhse8f
 n3jNJIYKu/H1bz8wgWdzyjHBVfDbjgnJhMN+mCzmm9eEZZPFr+SEPrLOc9CiIDL6lI7u4UCn6yo
 zoHI0xf6CBrJgniPUARIw4crdlgdphHC1AX9hxbtUEt2DNPcxnV8qLv013z2ViL/GOwM4a8Nvmi
 rITnSTDqslnWttIeD1KA3omyumpO7XiRsehAFwgfUUg/kGE8fblLyRDAh3stbMdopF01m0loVyZ
 fbG49a2xRV2zen/D8u1j+02V6GMU1rpxbUiNZm7lMZT8xKg/QYlmwDhYzxiV65Lgf8is+D6ETog
 Ai9OprDI
X-Proofpoint-ORIG-GUID: KR543peEvUKjlnGvXueXw2Tw_CbR_R77
X-Proofpoint-GUID: KR543peEvUKjlnGvXueXw2Tw_CbR_R77
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b82ae7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=_e_tMwhLnjs0gR3cx5AA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

Integrate the TCA9534 I/O expander via I2C to provide 8 additional
GPIO lines for extended I/O functionality.

Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 9e415012140b..753c5afc3342 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -277,6 +277,38 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&i2c18 {
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x38>;
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x39>;
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x3a>;
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x3b>;
+	};
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0


