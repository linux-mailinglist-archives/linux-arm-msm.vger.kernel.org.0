Return-Path: <linux-arm-msm+bounces-62171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E4AE5FEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 10:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74B98192216C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FE327979C;
	Tue, 24 Jun 2025 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyKcr4Hc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D073279785
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755114; cv=none; b=a2ymHug6OoyoZn8FstNs1uwVCmsBsdC/AB75dboOevlIuMhebcVzW4WlQpptLQEPAVZ2T6t2e6ZAP2S2fkiTsBpPtBg/Xof/PDc+XXlGIOqo51tOi7A87iqKuQ6d57HYO0P71yWZLQ9StyVGuMyZonV4dmpWnP7NE7UTpYkBDYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755114; c=relaxed/simple;
	bh=O+0/NNdyanOsKuo7VkrM3TfSK0WCzMVIxK4peN58Ks8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d7KZlCxRVPqOWjS84ovv2YXRLyivPXsvzG/Nf5OABjHi3kn1HeC8E5ZvdWeaxKSQkf98nDg1RstcPLAxI2SZBGkAirhPRHIYxCDOLOCoAvCDfmTrZTrBxerFDgO5gdgD3vj0WAizCNOWvLcEZj7vwoq/B/pFqTnfzceLYdgdyag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyKcr4Hc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlEWQ021903
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 08:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ez3Gwl5i+FDthYRtNWM/xe
	hIhu8C67oWMqeNxloQp3I=; b=QyKcr4Hc7h56gOwh8hQoWHThGTdgMO83kEcbQn
	o+1tbecCcZFLE44vtZCpsVKHDBBFsXU/BeqYXrz9noIuU7gdlZvkPO6yEvCvjNEd
	Cs7TvRR3TNU9jhlsBNADcQwO2wx15pj8wVYRPUzGWEMQWOIZKmXVZ8BEaHFm1ytX
	hO+XSCHUIYmULiGqYU57mU3JGXrXrfT1qPW4FeFYKLMZPRJwY9sCjImnD858R3/n
	+hbExo+mVlQIebPuQ97tHnx90jQUTuXl2qoeEh6jx+Q4RPOegN/c6+AyC1MiUZcG
	FsdIY/6j3hATNRCgI/a4DR06Zz2z5SyKeueCliV048h1E5Pg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgber3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 08:51:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so168195a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 01:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750755109; x=1751359909;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ez3Gwl5i+FDthYRtNWM/xehIhu8C67oWMqeNxloQp3I=;
        b=SqVXy3PPHFnvk/Cn//Kw1fNNdg5a+CuPp6wF8SBSo1jr54D18vgGbs5+nVBLpQDDL3
         IQcul9BcWpEUjeukuDzia4/Mx2jh4GpcYBJxAqm2ksXqNdwNzdq7BtGhRHXJREZ+KSM+
         3czATqS0Q8yQMgCKZTmKBZ7o835aVmRlLdmW6rQ1VEsvUSozobEkkQ9ugZgPqu0LCF8F
         ZSJuWeu35DFnHUuPWC/8uASFu66Bk0kEfbQTiI6uodKi+hYMQanrRmmKZRbj3XuY+IfZ
         dYCm8oH/nkZhEiRXPlc3iPMHOG8PzqCEPxrtKAznlcD56ug8q9EDzOL69weEIgRpx9cQ
         c1Yw==
X-Gm-Message-State: AOJu0YyrIvGc3xDg3DHdrFBpnZsn1Nya+gG7xZrH4LA109OcrSyVylXr
	yCsolIcI1P/0MZXRU3IoatZ7ux1CtbApQ6QFnZnXADkOBN9ibpJWVPVeB/YN6AUPMIcEuYW/c3t
	gxOQZCwURR+pT2juGht41NFm4xdcIUE7G5YPOJmexswdfyiMI4oUBAgGEoHEasrFPWPyOhmgdQo
	T/
X-Gm-Gg: ASbGncuYxj5kVG4h+T/LU8PChfAjfn2Ua/eBYmcylM+1c3ze6xe6nIaXaBfR7ppyvUi
	cE4RYQo7u3+lDIfzhJs7Qz6XKCIre4Q4KYRBFUK3V1t9XGUQEuEFki7syUZeq/Ge3o9Vnm7j/WN
	FR2lZ5YyAASyJhuq45FxyQzzGL0htRQXRikFNSW+EVBlZDCXV8Y3xa8EMQsvxX/qhcxNtlhPj9F
	kYM+vutgZXm9nyTmo4NdM7a/AYIKylqWYOpo+YD3gevYy8CwDRnpMGO1tLfr1TPb31yKy4GaMD9
	cwJPxDqdyzXfdQanNEWpA8Bzmoupnklfcz3vX2l2DhYuAAXt8Ch4zfOwHaesvINI92wZANi0eYF
	U78xr/CWUnZUDKLMpeeLhc6afllnxEpCCMWju1OufbuId5b4QC6JaEecAcw==
X-Received: by 2002:a05:6a21:7a47:b0:216:1fc7:5d51 with SMTP id adf61e73a8af0-22026e9ca83mr25244519637.37.1750755109176;
        Tue, 24 Jun 2025 01:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdJcCzJ0lzhXtZPX3cXGruU06jzOsonnUDOqdYvKlzOVRBG/862XwlRpc1U3+CHVebQ0xzBg==
X-Received: by 2002:a05:6a21:7a47:b0:216:1fc7:5d51 with SMTP id adf61e73a8af0-22026e9ca83mr25244485637.37.1750755108770;
        Tue, 24 Jun 2025 01:51:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118f7d5sm8760344a12.12.2025.06.24.01.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:51:48 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:21:44 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB9nWmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMT3cyCQlMTI5P4jOLSxKISXYskQ2OzJGPL5ERDCyWgpoKi1LTMCrC
 B0bG1tQBBkuiYYAAAAA==
X-Change-ID: 20250624-ipq5424_hsuart-8b136b39ca18
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750755105; l=1552;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=O+0/NNdyanOsKuo7VkrM3TfSK0WCzMVIxK4peN58Ks8=;
 b=a+sVgAtYouBwL1e9eTQMZbFW8Ggaa4Dcb6QWyE9eBhMavn0AqEdUsEnsDlhx8C66pGw54ithr
 EDQpl7nEJxHDArpu+fswDkkau4OPcy8yjY1i9oXFrPgyhKrsgZwKFZo
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: -P50o2UD12IRNJYTKsYc1mfFYWG36ETq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NSBTYWx0ZWRfX+62afpVWqi0w
 qt2tdJQWtlcPsyAVKV6y9OO7IYK+eRytcYZSK0WFJSrVnleZEGu9zR2tEa+rHev5mDk/TGN06Ja
 Jx4us27ktR4lLEWc85K4alyMyYuneoZoaYoDjkUxEmiUzx3AiH/UipbeIolx1l1+dApqc0hLf+4
 dZ7zkUpTlzsXoFek54tyWHvXBnDF/BcIQYqZrFI1RbtWCaaDUdV0Sp95rXxlI28HoT+wyovv6A1
 oLcNV1QcT8yjXMEE4DpvRtp0rlnzjXIZuq717foEBeY2lZevxV6eUoMBJRMmfzmaVel0H3e5aI0
 yWySMzKvoEEDeg3nZzQt+vYjeyHneH5lKv+4yrz4a1sKc02x72M4WQvmE06ENfHESCvxTVUnaNT
 s07wtTtkwsjfhms3BDPfRhvS44itZvXr3hGat5DqPcKJr7mif0P4aA6rfBujjNvTM366sAeu
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a6726 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=EDESvqxZEWg_xnwLgQYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: -P50o2UD12IRNJYTKsYc1mfFYWG36ETq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=942 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240075

QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
first SE, which supports a 4-wire UART configuration suitable for
applications such as HS-UART.

Note that the required initialization for this SE is not handled by the
bootloader. Therefore, add the SE node in the device tree but keep it
disabled. Enable it once Linux gains support for configuring the SE,
allowing to use in relevant RDPs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25d79051adddef604c55f5b01e6e8b..d7c425a54c39458b4701a42c55a226ac5aaa7a3c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -417,6 +417,15 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			uart0: serial@1a80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x01a80000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x01a84000 0 0x4000>;

---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250624-ipq5424_hsuart-8b136b39ca18

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


