Return-Path: <linux-arm-msm+bounces-73732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49459B59B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDAA34621C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE5034AAFD;
	Tue, 16 Sep 2025 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foT1nTOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CEF34AB07
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034792; cv=none; b=HPKRnSBHSn5FjRx/TAVVa/6kkxJGqZmNzHqyQJW3E3pU8TlLExDeSD5SmkX6OZLbkWcCGnRTLL6deoHv6uT1VdY7q4Zej/QAoZg9K0Lx8I+SoL+9PsxQzaXWJUcWGjYYFVSGRJr7a7EShKDx+pLH1lGZrCuOaXoL3xxugcvP1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034792; c=relaxed/simple;
	bh=ucCiT2duDaoIeQYERYpaS3b404ydsb4qHh+zyj5bIXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSL9ngcEEkT4+vMm5sjAT9CT6Ex11Qcj1xkvjojv7x6okwKHj5E27vN30sl5aY6I5V7p10r52J3aCQCZPiLrSocUKtHbsb2Q3+qzeMbbVwc/WVOc9+4C/rNfQHe/9pAeP9qnNUI4Ky60VRPpf0NZV+QdhUu3Jbr2w3bcooWa0VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foT1nTOD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAWwi0018495
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3c861F2ui93zu/77nje/iPwaISHn2dkZfiQXCBPatc=; b=foT1nTODyAMpVdcL
	XcscrWD0iavaxaRSk8HBvD+zeWUpM1EOcguDZZ749PhbvPnNvw4M+NWjLtXg0s8t
	T7WFnCkEYfZEYSk+fu5kQdZugtuMK6BBZnTQBljBLrYlJy71OgOW4+EC9KNOK6E0
	BPw0/kMNKx7m0FckRw6bKkS0/t6YtT9mkt44OiWtcqNObwLTKCv2DZWRTTcPIHdZ
	wTE1hHy6Ttv/SIT7I7m4ycbGPS7KHVTKkcIdldW2+MG7k9xYiSDYZ/gq+DOyByqM
	7Fv+eV7OW3tiUfT8jDEEKl8fMJYf1nIcHH6sZ3khRvnuxUBNQRUptwxFFcoE/FMs
	1CfFUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9dn3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:59:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-267ac96f558so19766925ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034789; x=1758639589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3c861F2ui93zu/77nje/iPwaISHn2dkZfiQXCBPatc=;
        b=JkFHz71Dh5Ik6TsTsqeoByFleS3Qy8FjK6V3Wf+/tuX1fnRWNJ/qM8cCMWOpvXBvsE
         gWvMHolaIcRbRUPNoC8tdtI9QIuOpriXAo7G2IBFF0IZ+4JJKTqvVMq3iPoPDpVwcYbe
         gdG16JL4bOzLFtBuOnb2Ehqpkb8A/niz4SINKRFtOImqdf/uE2WGsWyUXbwwS/DKv+X/
         DDGb1wEezTQo5TPk1Xis2Qq9jSgS2vcHQCIbCMoRtccSTscuUMAe6ajYg1ylyusGwkAC
         /uTXhHgPmVc0vPZ3+RQBTgtrcKckd4AKSzgH7+gBOdO5+B7+x8uG0IiQDM36l4m33P58
         GoKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQGDRwolyhjoJj4QlmjeSo5v/WIJQdX1TyE+nBTqaIHIaWgXWIahVKvnU2t6CY0aFJCXAD5N8XPFH1+gxa@vger.kernel.org
X-Gm-Message-State: AOJu0YzA/1Og9udL3RE9LFlXEnz9HXhj6SeHvNnn7usz2cyhyeV+GW1i
	cv5lqY15Lr7sOQJy4f9H50EtH/Ec6CyhWjdQzHBXwGbRV7dCV55Rdygz53ZoNGbTSLB8tfsLR0G
	5J36apmNzsOu/j+3uzTx2DXuiCFE9yteQxatbXIDu90A2L13YXkCAS01Tw4H2+hX5fYXi
X-Gm-Gg: ASbGncuvqFWjQ95duMurqa1H+UDRjh6LBKWWq3p9f1A7SqvMTJFMSHIAaW948eOrmGu
	M5jP7RkOSeJwSFCHYS9a1kVh2AOTTdVZUyZqdyAfv2T5D31iSv/uObttMCBUcjJmz0lj2ZI0SWW
	WjgXGI4yCCfa22flfopgKDBj7VWtj7+KAx1Jj90cksljm8A86AcVNi1+Dw78l/eO3BLWWOO+D2G
	da27nBC7+qiuKS4h4+ZPBgYfW7wT4hHUaNDWNFZgj+ECxmW5StoHT+WcyNVhWTHRpAU8NRCZeCu
	82ro87X7H0YT0Vz0WxQhkYtZN74y0jHSQowB72Hhz/quVA4MdxAsebgWEoGFPbP6bib6
X-Received: by 2002:a17:903:144b:b0:25f:e735:e521 with SMTP id d9443c01a7336-25fe745298dmr126384255ad.51.1758034788760;
        Tue, 16 Sep 2025 07:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlG3XxJr++7YJRonIxD8YwIAP2fbDCR8SQyUNRaNhoCTyvi4e+VWNopVW3BMUU4avieMbUZQ==
X-Received: by 2002:a17:903:144b:b0:25f:e735:e521 with SMTP id d9443c01a7336-25fe745298dmr126383835ad.51.1758034788239;
        Tue, 16 Sep 2025 07:59:48 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:59:47 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:24 +0530
Subject: [PATCH v6 02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA and
 QUPv3 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-2-62e6a9018df4@oss.qualcomm.com>
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
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=1267;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=OJ8bh3UnEFncYOpsWZZoUBMvVw4VlPpL+mr6xLJOGx8=;
 b=Ug9LZUZ9gmLC2/5dekDdCfDPxGAy+b7lG1ieijCJiCJRkmRmh74Cn5mfUItEHOO1OB/g7Mtm5
 Q4cCiRJYK1mCTm2PNKmtdYi1QjIgZij0lhxbvVlOHghJUp+U2WQjxrS
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c97b66 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=HCCwzLURLT_Inys_5lQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KSd-S5KnbbgG6pI5eb4IEbOEhJKAqBqV
X-Proofpoint-ORIG-GUID: KSd-S5KnbbgG6pI5eb4IEbOEhJKAqBqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX+Qm39k02VbwU
 0zdhfKpeL0nL1qqLl58808OTPUzI/E+S1O1prpO7ur398QM4AI5/MfohBxsItFj74azU1c6jN8o
 g3ZS7c5CoNPLl3v5VucwumyhAlHwPoX5AhYFXtkq/n0ZgjCnfHFRwOZfv6qMx2Rxyq28fAr78Jd
 dMi+V+/4hUIWSBOwCV+J8suqsjtbnvZ2L/v/n6EzhbcBIjVyielspCtC+pIE0Yb8DdhYmDqTzTA
 1LnaL9RE0lGKl9XIC1DO6xIL/hOLTBwh8N3JmtMfoSjQjnzFvBqRrbx6Yl3KVAzejbHuZketwiH
 jKjqBspo1UZvBs+kO7vRdnszQAyxfQk+U2VQx//o70PhLMpBgiBNhjFLqobGXaoilINVeP4pdj6
 K+U67o6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056

From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
DMA and peripheral communication on the Lemans EVK platform.

qupv3_id_0 is used for I2C, SPI, UART, and slots 0 to 5.
qupv3_id_2 is used for I2C, SPI, UART, and slots 14 to 20.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index f79e826bd5d4..4da2c5a12c1f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -329,6 +329,18 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };
@@ -375,10 +387,18 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0


