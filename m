Return-Path: <linux-arm-msm+bounces-71829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19265B41D87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37BCB1BA6E74
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3935F30101A;
	Wed,  3 Sep 2025 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Di6ovHwc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E53002AA
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900104; cv=none; b=sgnp1iUYaSqWbCm+j6ObHOwNrWE4HS+aXdaQQAsd1+N1Xi0h0WE9DmRcuHwof9KagiwAK925KUcGlT17EgqBj4Tk7ZLweKsX9BbB2aC7L512SgCWp81ejlUhcfEfTLAJ+ZAOAX+cJYiLxV+jG2OhFWQB21Xbgp8xD0H6eBFGTEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900104; c=relaxed/simple;
	bh=vgKvMK6y/VPKyttLGSjpHqgq/bQ7Y/dk0CJOwFyaiAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X45V1NzRFXiEQfWJGAvC0rcLNnoNxV+G0HyTtezO11np9xm3Jmuf/Uv0IvgL/oTe6D5gi5yupNWDm5pJ2lW3WEKU1ZqzLamPC6LdTQxAxE7XOk08KG5YzdoDXJbLMinATIN8yqXMfN+DI3O4ydhHdqIAxW73iIdZsgauvUN+Pb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Di6ovHwc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF5Gq010194
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjZ3r1HUnM84qXtwvypQUlVDZydeq+NJjZUSJGbaimY=; b=Di6ovHwco6mWZuEN
	LZnaHk93AeeNNy227jX6WcjYLsCOyKRnXIZNIzi7eXNGVSIPkJSSQ3tAIkVXq16K
	w7AoikW9qQOCXH/cIfZm1TbaULKV5lrMzCy2CajBVwzrGqYBhE5FFCg/cHB7sS3k
	98zzsuVLcrvJ1wvDKEe7T18UIZsmgE4wVJ5bOGNXAd0a6sfET50G3mhCLeARVYmR
	vaEICHcsExrZR4bpvw2wMTKQsG9tpZnndI04PHFp5olYpZDCrn6hmU+xgqqOdRXh
	X+GAQsuuN+PI5zkrg4oLPf1FTmbYM8n7LRuh51M/fY2qJ1e1LaYLZpUyOWIW/vmZ
	MIfbDg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8uep4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:48:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7722ef6c864so4477947b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900100; x=1757504900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjZ3r1HUnM84qXtwvypQUlVDZydeq+NJjZUSJGbaimY=;
        b=a3WmNUNngPn5pRUF61SEIUO0C3Cr0YQdrlSyDRPvIMCujLrsoB1CLCeYV7x22yjM4G
         r/jOb3DBXIJ6oj+3w6AWG34801V14rsr1AsxKcrqD9brV6K92xYLzLoAxoUAtqTEHYYA
         rY/6cNcvOc05tuXOYhHAI7WzTgCyWM7wvNz6Dwyj2e38Ja3myR5aU4FlnPe9GPQZ7Vsx
         foOghk68E61CpXcKzZmvIUGzq+wC5zbU8px0eYw5J5GxXJNRuS+ztKZh7rs7lQhFO7XO
         g5o0Is+98bpOeb3QJsBxllU3vW7L7Zyjv4o+IaU0Zu++aXKx1NZAI7t8Rdy/IhdVLvPZ
         eX5A==
X-Forwarded-Encrypted: i=1; AJvYcCXUR/Du3wNBiJbK5VmgHO1bxtNBSszRSJN5eun04J6eM7f93C2CYlrMBZNFKB6EbBU44jBzYW/ge7S3uGnH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0j0HKkdMoobgglnmayoZEhn7k6pDoIX8cP5KooNsbQU+WJEMr
	0QqlFWyYLdeQJ2x9L9OBvZ9yvS/QalLKL9DfekOHMsiv5K7eg0OA+GULkgOXF0ptsOmzEW+Byod
	NqRZ5hCayvNrhgW4Jv0qrA73QC3N9hBtfucKUhkDahUVWrZUkmOaIeTd2jNCy8ierNrta
X-Gm-Gg: ASbGncsrypwGUw3Mf11BqlukjC4UqSRQCH0/f1uARkYEwb5Ekk7rLzl66G2SqwNZ9te
	wsWG5OALR6m2V5Ag7qcU5LNqkkHeEXML/TeDTcxbOS+U/gmuFSDb1jbpsdlWrYq27tiXhG13twn
	M8dK37TwrldWwvYoLbN49IloyiweWmnwz0fP6y3fHh6ndW98v2JgGhp4qoSrddeFd3GdgUme88n
	vSwWnAu54/cOoeiP/VMZ1T2CJ6BQiNFQZXxhL6a5Kcmedvuaa7ul+sQLaNWRCG4oaBgixN2iezq
	U2/7cy93LbGuxtNXALvLvnqi72THoSXjEpFLssdhVNsDppw7Cj3xKuOi8n/Tt7aeKaa0
X-Received: by 2002:a05:6a20:431a:b0:243:a682:9d1f with SMTP id adf61e73a8af0-243d6dff535mr20746141637.19.1756900100363;
        Wed, 03 Sep 2025 04:48:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKlZFAPXjo11ONNgyjTG4Em+10bWJ4qImiiRsEKou0DfbxCAQ12ZIlEmIHEIKkikQaarj5YA==
X-Received: by 2002:a05:6a20:431a:b0:243:a682:9d1f with SMTP id adf61e73a8af0-243d6dff535mr20746109637.19.1756900099859;
        Wed, 03 Sep 2025 04:48:19 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a2851sm6584074a12.37.2025.09.03.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:48:19 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 17:17:11 +0530
Subject: [PATCH v2 10/13] arm64: dts: qcom: lemans-evk: Enable SDHCI for SD
 Card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-lemans-evk-bu-v2-10-bfa381bf8ba2@oss.qualcomm.com>
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
        Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756900050; l=2019;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=e4UGRGci1o4NHHD8fAyrLZlNVC7z+j0/9/IXHZK3Mrw=;
 b=ICtwKqzBUI8DnoAfdFtTbF6z6xI87ochkmdFtCaZRSqZ8SnbpmEpFlk+xVEDBMsw3mOSDvp0p
 oNtX60FlEzkCc1SQZqvnOPWma3bB5PuPmot87BngWv/hwS3Y3ThiO7X
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: OB_acVXk5WWgzWguULeLaPU3RQXaxUJf
X-Proofpoint-GUID: OB_acVXk5WWgzWguULeLaPU3RQXaxUJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX7iUb5SSs78UW
 RoJ1q9fkW3Iq6/68xEms9hkubqWqDctXG3N7g6M5F3pwIRYyDrjKCg2xEwh/CX2mdb4gxqXHH2v
 sS75BhotoiiruaiUyrkZhWpJo6v3ze89hNDvTE28FXtv05IbmHbSdHcCrU/eMUBXubVpIVYnbsf
 RciVomLEAu1dGFO3Btl/aQK8zO7n8+wsXfx0esM5U+szTVS4SplEB2nPgwMf0eYDov8Iy/oMzcL
 q9H/A7i7lM+YHrcDkFONvCfmn8W09GiJSRkQRzJYYiKR//A9Lt0fsISdxINeePocys8KABsGNa6
 mJXNFvDERzf85bpJH/EH5+0yY72/SxrFUStGSeLWt9RnmRZPv76Y7f+EIrieCEoa1rZClkGCU0+
 h5m3H6J0
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b82b05 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JaNxBooIv5ZhbLa6QxEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

From: Monish Chunara <quic_mchunara@quicinc.com>

Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
to support SD card for storage. Also add the corresponding regulators.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b67b909fb97f..c9e7977466b3 100644
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
@@ -461,6 +484,20 @@ &remoteproc_gpdsp1 {
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
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };
@@ -511,6 +548,12 @@ wake-pins {
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


