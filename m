Return-Path: <linux-arm-msm+bounces-72497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D79EFB4868F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F391887450
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66212EB84A;
	Mon,  8 Sep 2025 08:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dp2bUuWz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3860A2ECD06
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319628; cv=none; b=Iern80RGmlzXUxCAKAM10IbSLAaSd3NlsM/5s1UfQge2qQkTNu/HHG/hkH36/As0T07Xg2LQdpYjDXU+Fu9uzwTxH+H0BK8UYCcm9PvpyFx3AQ+Rfn90K+ZWu54qy8JJOKhrFsIUbblBoJqwTuO24c5ahZ5RVbNG8WoJsTUXB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319628; c=relaxed/simple;
	bh=gBYL50YC1XDuPqvactY/HGpJkmgy7jZJJarlpKpBrwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezctrC5GIi9YZgLJsgmBUNIFc5VnXHk6gjwVROlcKYVrWb6DVp19hBA5btysjSDm6WIVO61NLc6Rgimwom6uXQU1c7iW8a6o46G4qLc04xtVIVz7wia4u9ccQfveEp88qGhkIFJeIS4QYXSam76tIvxUDJ5mC4wJpilsgux/0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dp2bUuWz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MlhK9030846
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rF2ixXvd+CAVz8mNHLTt0wOko08EhUec7UB+gMTdRyM=; b=dp2bUuWzeLYrMdh3
	xBGmajAhoW0wE4g8Na55zjrnR0MxuhNvRtVBKb7HT60GyeWypyzIXqWzCETHwNJP
	LQTrd+8rpAXv0xWsVDtj9rHhGtrkjObQ+nXR68gRQkPCqtW7imJJZm2wH7/ZYZfH
	ZLJWoBW5UH6vsMawubGjxvbWrP9Y0zflvY4zcM+LPldfP4hxm7pQweAfJAkhZ7dp
	UYv+ixev0xAf+gkgdSiVy5HtxYh2/HOwfmLVk8qgahhPqwteYy9vZXNGzOlHcTBJ
	WVIkS4xFy3mBQ3klei3zIhNDK061p2RPCjoPgfJq3QS+hmrYBEx1hsq3ew02rcld
	1dftYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapc14k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:20:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24b2336e513so64540215ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319625; x=1757924425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rF2ixXvd+CAVz8mNHLTt0wOko08EhUec7UB+gMTdRyM=;
        b=MMPF/AIIBbTLAiHEL5ANpjIBd7IVeTrLY1e1aerj/ar01GkxqoS9EvIpZgkKk7q4OQ
         Rx02TQ2LB1s6NuZmmytpUsUP/XNtjTVDiWSqa8kqT/B2S2TNB3Hx1RXbv/qxnJ1iGUQd
         pNt5qTI7vCwzTdEyrdluAJs/B0/kCEOrubIfNZ2KaoWrH08FzQfTJFczNOmL2ExNRkfs
         WeYu9L0F0aVYPd/D2B1OrBz1h0M66vKUDZg8FYsQRcYv0oX6hZiRcmT1HJIknvXbWZcx
         54gSU/1d3nhv+q03LN95w4OX7pSI5s9KCVARt3iX6Q0PaON+SJEervrUjkG0Z0ST6hg8
         hgpg==
X-Forwarded-Encrypted: i=1; AJvYcCWH6v+I3RrjtCJlVg7Jxjqi5FlYpP1yUYI1KRGP4DmSB0rD+dOHkgq84iHzzKSfznykJgpCjyc2hyUcRVhG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63bv0eXuA21dsJOeKuEBnSWjHMGnGdsUV60DWt+chlhQQ/7uN
	fRRoFZ+lkfDROzXpUEduxxSZq9msVNl8pyvpNGtNqg6ObTLiik8FeqQJjWKzujuQTHCQKjzoo5p
	eIE7pho2A9Eg0+KQE3NOFAbW+UwKI1cS9plSPQ4PpUhUAeDnxUYKWkZBnbdALLnzkcWyP
X-Gm-Gg: ASbGncvVbFYJ2GZmQ5rLskRfi2SBrjMWM0qaA7mDIx+0THUokFbUuAMtQ1SrNDLZU2M
	cL2/DrSQISkjY+HN9z/IUUYMGL2iYJV28IdM2RUn9zkDG5i2p8sfjo9mTtHT7vWZyJAHqPLxng4
	4iffPIEZVJmFC+tPfUppP4MDsdeLSiQUXUcQsu2H6JBoDxqudtOsM8nHEfMmlEnB0NOkbb7+k+/
	881xu67mIdB7ihI7S6z8oWgBYO191HzaXunCHEUcZAohaCpiy+OFXBhslYh9Iq4uUSkpPc5RGrB
	wLcWZtN8K5TvImqxcGQXlB4E9MRJ7312hdnK2gDwhpwm9tZr0C4s5dVdlfPKbZQS5jU0
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr115464915ad.11.1757319625019;
        Mon, 08 Sep 2025 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4jVT7W/OifKwAmzHX3E8eS5lp8cqvuFI63Bk1zsxQR6CJi6eIpk7aZvqHkSYv1XuC0Cg1Gg==
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr115464595ad.11.1757319624524;
        Mon, 08 Sep 2025 01:20:24 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:20:24 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:49:53 +0530
Subject: [PATCH v4 03/14] arm64: dts: qcom: lemans-evk: Enable GPI DMA and
 QUPv3 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-3-5c319c696a7d@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=1269;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=X+CejMSc/iURyNBdtIHd2b0fknWkLUOZo2knn9rM+7I=;
 b=69UvAQaEZdQB4XITcnpWuh+ii9MjUlEFC6sUkQg/714wq+9n+m5oVmf3MHBWmDuQcPwQo4Fth
 if7W+CtGUV3ARrm2yusKZrv0XAub0o85QCtRf1dtyki0QStCLYQAh07
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be91ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hGGMonP7TOO80wKNN9QA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NSOu-aNRoKLb_ZPeg3xN2HtzapvgrxyX
X-Proofpoint-ORIG-GUID: NSOu-aNRoKLb_ZPeg3xN2HtzapvgrxyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX2VxLc4yR1EhF
 yw07XQBMn5HZ5tyca8aGJR4kdkJhtmcqpHp4pQVSLzAydMOO/jmwe2d6T71qDlKdxEz1anr2aYL
 3bWiPnPG+UVvb1O9Fcj0bE15j1iu0wPzROJRVMbyIoBeLCk7eVsMJ4BZB/sXooM0R/bn2gc4IhY
 Yo13oSXUpJBj9GeyRmCscdkcqGioh0I8S4iSmFa6XQfgVWGjk6bYegZX4LluaPb5S5Cs1La3fd5
 e0M2h8F3DHkiDk4BUbjTYVtFDew7hI9/nrlyZdui6UMjykNaKdiCmdfLM6/erxOMJKqhpp+JjvC
 b7WsYiSGkR8HVhiBMeRw+BO+tdAEAV6cv2z1KOBi5XOn48Wmj1urPPyb6QE/ftYMzTsH0GQryp9
 qy4CAyYR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
DMA and peripheral communication on the Lemans EVK platform.

qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.
qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 9e415012140b..56aaad39bb59 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -277,6 +277,18 @@ vreg_l8e: ldo8 {
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
@@ -323,10 +335,18 @@ &mdss0_dp1_phy {
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


