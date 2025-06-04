Return-Path: <linux-arm-msm+bounces-60176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFA7ACD7D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C26F47A50DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 06:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FE52620C3;
	Wed,  4 Jun 2025 06:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGRO57He"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCA9230BC9
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 06:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018454; cv=none; b=Zd6KuKoJ8+8jiiuVx8Nu9nWAi/w/Lioje8xHamxJdrGbulPYpvR1Wb8U9JYDgyP0BH4DEKEUTOQUabsxvJdIGywzXWSgVDSTBbHH8JP6dJSYvsxvSWTNkV3nvDl/42RJkrFeklDmq6eOvPb45bY4BytMx03NUJDSTwBGqX2WI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018454; c=relaxed/simple;
	bh=S+Vr06DNm7YB89ZupCnoEi5l0tnbrL6S5BIihirZLd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cj7oB4jIZJZvTJl/c6K0sXM1HdeWWjk54C8ftR+J826IRYG03wAMjI2Ae2j41doxJYJML0KLJK7u2uYpM0aHSu5MwbXABNAldklE2t5TSQakBhE3OJklZdzysD+yxfnXIMkfRBZMu0IjhRWDBtGnAnEKA1Y26VhtAyjFFZaenig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGRO57He; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553KhGvl000738
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 06:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i8Jdnl0unu1Ugmz+Sny018
	vDTajWqp19uec6eBvnv5o=; b=pGRO57HemMVI9jKKIFfzdJxIBU7eyj+kYIZX1R
	gp1IRNLfkjlAymdr6hwEqUM+UnR00MnqNBES0XEDDxnQduHClljdKhRXIHHEs8VB
	ZIdE2mJOpcUVnZpv4BE7apkYZPVGKUd9jh6pZCYTvlj+FFeDBZgPQ0QrYz5BM0Ak
	4I2QUUC68//oG/ZEBoWo1/G7pyLIa86OdnDCjVryQSPXcpOQAjI90Vre95M603tG
	OSjBttUZ2soFeriZq9+DCzXmka+FLeOVGFZvj1lJxjoh/dNpwENbMtRD40mKzRSM
	AFAMrAbBdRCPZNVXCPy80EAn1lVadP1uLzzNdwxjg5sFOQbA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuuv6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:27:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2f103f6074so612563a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 23:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018450; x=1749623250;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8Jdnl0unu1Ugmz+Sny018vDTajWqp19uec6eBvnv5o=;
        b=wh0f60k7VhKHxSAv6Eho/HmE2ok5uRS5J58LkFSbdHl2cLDlhK8+JOXlVE6lTSziZp
         cEVrfX9tyyui8SHCAVPEdfmnzs8+GjsC5DDYBdjVe9mJ/zLpNaSKtkCXOHsKCLN1WT2A
         ncWVt56xkSRH+xOJnnGO6QtH7lupPzC4AwzdOGbRX7ieUbsiE+UGcb1WaJ+Eo0bZ28Cc
         QUcxp/1dF8h9RwXTW0CD4yhBxOvklBrAatL0MXvdlUxF+5ULNQTG6u+cPPMpWKf4Wnek
         hSrwNCDd6IXX0RqbUq0TYd2bMHLRDBnpRDkAZb7MrPy7dfElsDgihloQT80OfHR4o7Jx
         P5Nw==
X-Gm-Message-State: AOJu0Yyk9/JwwcdEuCpft8TFY1yvF7NWCPaMislj5L0/JVegjNQGyNnK
	HNqQtSygGL/vBraJc2FILFIr8HILvwySJu854YJeBbEYIl2g2hxZNvLsvqzACQDsBJGfQTQMo2L
	OVaBfN8OUi3SwfNsVC5xhHkIfrdRpfS6xVHV0LRjTen6q4BG//yESVjEFKLDC2irbuReR
X-Gm-Gg: ASbGncswVo4Y5HieYT0fwXSJEaTSSZ/hsrrOPRJr3yKhn9unlRYMAYzUwTJOFHfLy4L
	OoU61jt6bJuywEQC1nDEaCSVNppOhlaCHOlEn9O5G5A/MhIwm/kvydXVxb+7I724ts9NHSMv+Qm
	RUD7VLBsIuSjX8yZKRXue+yFReM83OHd9YkXXQ6mYVfkP8aLElon4+AGJmAscvr1cyoUwyizM4A
	5iLx1TBVcTheeZT1ZwFjURc/64bb7bJt0pZ5Kn0UWm5m0bkC4yifYlcgZ3FVOaJ2QRTEXMMo99p
	dI7icjUlBpANOUj4ej8pH/wbLg7dQObMZ8UiNCFama58I64dwtWx
X-Received: by 2002:a05:6a21:a8c:b0:1f5:7eb5:72dc with SMTP id adf61e73a8af0-21d22a6cb78mr2708326637.3.1749018450408;
        Tue, 03 Jun 2025 23:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtTUwNbIkJQJC3mzKumJbHlzqEtns/3tOR6yrzopn28l0jLbp3v8hr1YQAE1z8rStZV2svvQ==
X-Received: by 2002:a05:6a21:a8c:b0:1f5:7eb5:72dc with SMTP id adf61e73a8af0-21d22a6cb78mr2708294637.3.1749018450037;
        Tue, 03 Jun 2025 23:27:30 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff70b5sm10419995b3a.160.2025.06.03.23.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:27:29 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 04 Jun 2025 11:57:22 +0530
Subject: [PATCH] arm64: dts: qcom: sm8550: Correct the max voltage for
 vreg_l6n_3p3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-sm8550-correct-vreg_l6n_3p3-voltage-v1-1-18cd01a69ac6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEnnP2gC/x2NQQqDMBAAvyJ77sI2aUT7lSIS42oXbCIbCQXx7
 w09zmFmTsiswhmezQnKRbKkWOF+ayC8fVwZZa4MhoyjlizmT+ccYUiqHA4syuu4tXG0u8WStsN
 XJUze9N0UyPQPqKVdeZHv//IarusHYl9LuXUAAAA=
X-Change-ID: 20250603-sm8550-correct-vreg_l6n_3p3-voltage-cba298bc0294
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.collins@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749018446; l=4308;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=S+Vr06DNm7YB89ZupCnoEi5l0tnbrL6S5BIihirZLd8=;
 b=JJpUElkUFdjfrIHZKxSvhqXVXiczcVEXM+2ZUYp5bPJ6TDP9u7M6y81kHuSsoA3y9ukCy6i5S
 aQU+foMz4dDDwJNmp2mKlMwSUISqhbq7Z51r4QUPWkar8gMG80kXsmZ
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=683fe753 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=G29jiHXVfx2XXIaXbRkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 1zsPmVAR2gXaisjLM7HCfesb5UTDjIlU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA1MyBTYWx0ZWRfX+KcO7yv1exs5
 KT2wlzoE/Zc3cdyRT2pBO+m2GbruHYv0JLN7tyN/475/5eTcxYLEHnuRuJtF9Kk5gXw4JQFPoTG
 OMLgMP6YjboxLQqrqnl5wjCIVdue4Bs0bSJ/Zf2qSlR1//EsfCPB9P0SKWr+dBnhVh//V7nW6gJ
 8Q/0Ld5yReAUXjn4pkzWtpgW5BHJ/pXy3ZCPaWrbNSs+uEiPnHArr7oyh1bc1Vc+m3kAhV55KdC
 bb6t5PKgYdEVYCbfzf4wxa5mUbm3ralLiewUC1OYP+m8D9vHjvtYHy/PR5gR0WhfZ9s+wjyo0Cj
 l43TgKyjFeQBhNTTyuCX/Rz9c7KpNL0qcELF7JUvkE6TmO5w0tSsGTHk77lpx5e87tWJlF4Tjdo
 BpUnkT9Esl8bt5IPsppCGYQfw5LNsjNBRCF0xG9ufs3uDhSP96g1zHgR22gCX6jdYUIqW8ME
X-Proofpoint-GUID: 1zsPmVAR2gXaisjLM7HCfesb5UTDjIlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040053

Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
configured at 3304000uV in different sm8550 board files. However this
is not a valid voltage value for 'pmic5_pldo502ln' type voltage
regulators.

Check below the max value(3200mV) in the regulator summary for min/max
used as 2800mV/3304mV in DT:-

logs:

[    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV

regulator summary:

regulator     use open bypass  opmode   voltage current  min     max
---------------------------------------------------------------------
..
vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
..

Correct the max value to 3200000uV, so that it is aligned to voltages
allowed by the regulator.

Also, correct the phandle name of 'vreg_l6n_3p3' to 'vreg_l6n_3p2',
so it reflect this change in settings.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts         | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts         | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts         | 6 +++---
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..fe46699804b3a8fb792edc06b58b961778cd8d70 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -857,10 +857,10 @@ vreg_l5n_1p8: ldo5 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l6n_3p3: ldo6 {
-			regulator-name = "vreg_l6n_3p3";
+		vreg_l6n_3p2: ldo6 {
+			regulator-name = "vreg_l6n_3p2";
 			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5648ab60ba4c4bfaf5baa289969898277ee57cef..1e95a2849146e3eeea9f68085ac504e32b63fdaf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -624,10 +624,10 @@ vreg_l5n_1p8: ldo5 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l6n_3p3: ldo6 {
-			regulator-name = "vreg_l6n_3p3";
+		vreg_l6n_3p2: ldo6 {
+			regulator-name = "vreg_l6n_3p2";
 			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 3a6cb279130489168f8d20a6e27808647debdb41..5a33d7d7ac923c7c0bf6aeb51d0db728e65883ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -700,10 +700,10 @@ vreg_l5n_1p8: ldo5 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l6n_3p3: ldo6 {
-			regulator-name = "vreg_l6n_3p3";
+		vreg_l6n_3p2: ldo6 {
+			regulator-name = "vreg_l6n_3p2";
 			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 7d29a57a2b540708fa88fb59e821406f400a3174..073040fbd7ba215169adbe3862d3e1f6d2c786e0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -485,10 +485,10 @@ vreg_l5n_1p8: ldo5 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l6n_3p3: ldo6 {
-			regulator-name = "vreg_l6n_3p3";
+		vreg_l6n_3p2: ldo6 {
+			regulator-name = "vreg_l6n_3p2";
 			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <3200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250603-sm8550-correct-vreg_l6n_3p3-voltage-cba298bc0294

Best regards,
-- 
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>


