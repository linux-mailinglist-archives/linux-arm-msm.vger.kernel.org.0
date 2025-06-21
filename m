Return-Path: <linux-arm-msm+bounces-61958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C12C0AE2C1E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 22:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88768188E916
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33992777E0;
	Sat, 21 Jun 2025 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VistqUMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3FC27146F
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535790; cv=none; b=nuuq9zVRYD21e+IwggINthugfnWtv0tWPERbcuBU73KLMGuJJaNpiXXRhPOw2JGCYZxo+hzX4QKzOg1C7bz+hqxh89UQ/auV2Us6N48433qwAFgNZCrsC3h6qxgMlsLNC5CXqM0ZFV5WXzQKAGouiAjLYwCndk/1HSbL1PWYh6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535790; c=relaxed/simple;
	bh=dmCipaDPJe2YVwyZOa+uBgBo5lkKZLTd546OeZ4tdeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhGByWjm5nUXCnqC8YISEMBJKtxOOx/tosynUlNy/McWe+pYY//U2bYzp0IsVMO1YMUPnWi4P18XVgUIRVaDvw7QxvYK00bVI9DdIBT4lvhd9d9G+7YzOzZFzBaMnNb0HAECTWGW+7ZoTwYs1+tLARrlB0vMBzFBx/3vZbFB6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VistqUMG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LFmscN013697
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	js6tCKZ4RBWtZxDLFFvdhQJKiTQFitZgh6nUQc1LmVo=; b=VistqUMGctL0DUi/
	9SM72S+cbEt8Q0HxzQRo+Fnjx7Wm5/Ygw0GTZFGykTNzZ5/wgGQwydZo3snIE+Uq
	A9f4uRlHm+QtY6m7MyrCasVjCdPggOXgLUgnzb14POTissWWOVEK+DNeDQkpozju
	kqcr59DszQ1murEA7FjWbTB+eqpsVDGndTKzbgfUUcPvHT9goE/QP0xlSwW+5UAK
	+7kAHzViOM4wNl/JiCVPpD/1SHHbYIk6LQQ5fCmWWbz9S7BfmwNZtCTNdYJfdsLo
	M40dVofQ5+A3dU5pAGyOF3Ld7KyYEv6G3YKgVsQb3J4sxcE7TenbqnLGtbdFgQcq
	m8/FPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dp64h0av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 19:56:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09ed509aaso415079985a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 12:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535787; x=1751140587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js6tCKZ4RBWtZxDLFFvdhQJKiTQFitZgh6nUQc1LmVo=;
        b=l6+dbwoWWWjWt8iW/83d+ECRax602Uk4AxaKUDEGsF++Vo63i44PTEY7eTEaXSrVrX
         2CccAvP2tJ3lKI4xfiXXoZAkYb1Is4hXwweffdOX0jqsFdN1hhnJc9EVE16kchy6fyN3
         la0RnFZr75F7AI/RAzlYGptAczrWWdFBMPi5PF/gLCjSUaB29Y7cZ7XtRmaNxvlG79fB
         fGhOUj+RVyv1erXTkSKiiEfQzPHBd03CkcC7embKWnlNia4fle+rSCpRNvEOuD5HMCYw
         KEzejPeG7xSkiJenx0tAjCkddu2/aJiMZzuOIFcyeTS6isIOZRgjjNwom6lgrXtj90Xk
         BseQ==
X-Gm-Message-State: AOJu0YywckDMCpjPehyaBZmHVNSmhNDc9yD2j2Nwq47I58dhlxLaam3N
	lV4240fLJWpW3rOCtv0ymXFWOD86aRBpz8j/fKTc0UgPg0R5RsnxRQuKjcG9C8bVcpA2ZPh4k7G
	6ECHYWfCSWWpvAvmz16WKxHvDr10vaJOvHPH3TYbyqyrbjhdBsdCeCAOYw63zNWgUvqWh
X-Gm-Gg: ASbGncsBykXGqUTx5HzF1YbNKBrp3SNZQ91aqq/fMrT1radsO3bWRL0+IBE0QLTFLVe
	vW0/ldCsQR+oeM3fur+dZErUzLHO/MiUNOPFArGoETTikjoI/gHVfhEaxb0sMMgsbf8ssudMpAy
	32FLqbVoE+ZkgzncSm6FHL8eYqCwJNJ5iQwrksHnb9ohdyT4HvAdZYrzenQevghbHWo50KsOvIM
	MBsXpuHeLOfkdW9ubbPPBce5mZ38OlbJwj8EF++yT65Hw3LmxcST1kJseMcaZH4FtOIGJGNkSj0
	fLcL4T9MiVcBD7roDHF3TutZCkeeXNeEy1qwGEKy/yBgPVADidWKrEGdjcH+Wts47GXi/K/CCST
	Qg49jl9kq2As12e97J4rpxwfLb1bgrJxOkF4=
X-Received: by 2002:a05:620a:7014:b0:7c9:2383:afef with SMTP id af79cd13be357-7d3f99234b6mr1109778685a.37.1750535786991;
        Sat, 21 Jun 2025 12:56:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyl5cNRjU35xqzI1TlNWEdTw1aDtOySJKpk6eUkl28uTHs5uRyf8Muw38NgV5PbrWglll6yw==
X-Received: by 2002:a05:620a:7014:b0:7c9:2383:afef with SMTP id af79cd13be357-7d3f99234b6mr1109776985a.37.1750535786617;
        Sat, 21 Jun 2025 12:56:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 22:56:13 +0300
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix RTC
 offset info
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-more-qseecom-v2-4-6e8f635640c5@oss.qualcomm.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dmCipaDPJe2YVwyZOa+uBgBo5lkKZLTd546OeZ4tdeA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0Y4X6L4n8r96z7ncK96s/S2o+JX2Su7RdXap/8SNrm6I
 7vU3nhNJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8vQj+2+WLROOr3q2V2C1
 c9vWUuH+zGeX93eazvKp9fxWUWJ2YQbvXRd2hqVXPRP+fRLu8QoM/7Iono2ZpSI6QiemoijnNp/
 Ak/jSss13cx+vmrQ3Lk37kEfY4oxtzbzJM9nE7M2fnhUpuWTH95Eh6Uosg3pw7b6bSxv+vRZg8l
 Vfu3XW3n1VT7eb69rvzLri9OejxBOGwIC+CJatjGfCpI+U7gY6ff3dzVkLL0uy2erryN6PljdzX
 uf4v4VxW/btjS1nRfgU2aOsb0ueShQUW3yjps7VbMYNtYAJVjLmDy3ZOlwUV95mfblc3HX2bM2g
 K2v8P73xihNZ9GWXoLTtct63ntXzGXx+1G3mnuYgkTARAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yZxAsT9y5wWlb7qkY2E36RMCI13vvxJf
X-Authority-Analysis: v=2.4 cv=dPOmmPZb c=1 sm=1 tr=0 ts=68570e6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=lpcYNmPcDvg0ODyLRbEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yZxAsT9y5wWlb7qkY2E36RMCI13vvxJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNiBTYWx0ZWRfXz9yXzQ2L6C5G
 Isrd/pBQjNTPe2PDL5oB/izgZahSkyhBHNcOdn9gnDqSvpraR+4Ia8CrZLlXciumZJJRSkeX0XR
 P2Q+Hx3SRBVPJHEdO39SGHp++2Qap7/jCbaXbU73EFK5ymHzmJQiN1JeY4ShjK+jWRHIFGEmgpU
 VRY14puSeZlDxPZUvR/cNC5et7IbZDRVtk+LkVToISKE4/6ULjDp+YEYH3cXhOwmG8mf4q+FCPU
 oomLDPt7j5+rIbhpy4C4AIta9x3rdgmT7fnDr7MlYa1E4dEZrlvubaDoJQks6DQ9yub6cq/hkpE
 s6uV+6qlFLDSD0vw0/NQWAgkRN1Ulc1QcSsoqkPvSIOKHGCBgvvOyPbyG2D/uJeHMzriNi5uB4P
 ZPspK42nsZV9zULlD8tYStPBLwNpK7kILmybkiuGmwuwH0I3EowgPpWUv2VnKNi/XqJjAmR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=947
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210126

Lenovo Yoga C630 as most of the other WoA devices stores RTC offset in
the UEFI variable. Add corresponding property to the RTC device in order
to make RTC driver wait for UEFI variables to become available and then
read offset value from the corresponding variable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index 3ecb330590e59a6640f833a0bf4d2c62f40de17d..50b41942b06cf1a3f43f9c754b3bf2e1eaa4d353 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -101,7 +101,7 @@ pm8998_adc_tm: adc-tm@3400 {
 			status = "disabled";
 		};
 
-		rtc@6000 {
+		pm8998_rtc: rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 8ef6db3be6e3dffe4ec819288193a183b32db8e8..c0c007ce8682cacd1cbfe816ddb975c0a099ac89 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -592,6 +592,10 @@ sw_edp_1p2_en: pm8998-gpio9-state {
 	};
 };
 
+&pm8998_rtc {
+	qcom,uefi-rtc-info;
+};
+
 &qup_i2c10_default {
 	drive-strength = <2>;
 	bias-disable;

-- 
2.39.5


