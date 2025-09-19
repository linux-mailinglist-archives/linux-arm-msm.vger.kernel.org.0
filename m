Return-Path: <linux-arm-msm+bounces-74137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A802CB8883F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 11:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6335F1C81650
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 09:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4911C1BEF7E;
	Fri, 19 Sep 2025 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCmkW+a0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C82D46B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758272904; cv=none; b=J/PiRSULqKP81mG6kYjw75YXTvedYDWEkfhzemQWeP32wkqzxD/H1Q5z3GNUB6EiwVmWHc3maqCv0abhj+kj9k0PNu9THuJjfaHOGMmuOzf+2faTqDlrsC6G9iKa4SwwCaCvdPf6rx4RLtA9TI26n/F5X1Uhz3fKuYu6DHFs120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758272904; c=relaxed/simple;
	bh=QAf8PPSaPOW1dXcDI9+c34wFeqG558XUfmyI1Bhvxmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ct+3+bYU9uDwB7cgrYsF+4D/TIovgSXQFvI+PVeVbXdu1WV6WAjRFU2rMRHTAiVCqYsyw3+dAzJDKp5iVith7C0jWTv5FPmhpcHFz1o5YjWuqSvssfMSFagGdIoznfEPl4hI0iydmaT5ez8Ri4o3ATdaKocZiJ8JbzGrd2yj+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCmkW+a0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J7J8Z7010735
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1201jJ6f+XXOQPOoUJASps
	DX/E2sK4NLMNpj7tDXUBQ=; b=XCmkW+a0m5czV9M35RhWpapjDIBH8bFdRdVM1m
	DN7OlJrvB6QzhyfD4eCEO4587zsOAv6ckuF0ebg7UM5lFYr7E0eOWi2Sj+FcxURl
	x8xoPE88WG4n+yP/OBr1bhGbRmeiJf18hiyroMBnBPC8FWaJjHi1uk4ekv7fNRmE
	P2e71ddX8dXD3SylmrZTUkhVCMTnBwfGuPqCKdnz4W7dP5S59zmH6eTyzlkZcQVO
	VBWRQkRhVfy2BkOj/CvlP+IeOpVBVdqrB0PTULYSRDJG2yT4WYi8Gcq5oXVaABht
	OectLPwWI6N2ihGiUdJ8SozZC5A2weIWHoB87yIM0p7YQnqQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy1qbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:08:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77b73bddbdcso2123122b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 02:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758272900; x=1758877700;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1201jJ6f+XXOQPOoUJASpsDX/E2sK4NLMNpj7tDXUBQ=;
        b=KAjSrL/U/yvTwjYOrQQRCg6beh3SB56RRdIhZIq03ge7z4N4As9DMip8KPjvf7eQNZ
         Ce9QKnBHO2XnK9w98hpDGsWRMAYbXDr1z26xlAySv1QKSeBWM7f4E1irwwBJWQlQNQ8E
         iH4OwhlLmJ6KeeqzZIgoKdHmNL0x1t/0xqQ/vYu6B5I89XvqWO9cyHZSecM9Umrwm7O7
         dzUcZmpZh6IKqSzm5Br7HJqLv950w4+TrSETzTwcc2Guq8gA5B3bJh6LQNllEyv8dBQn
         gfqzRM4Cio2rnY08fyW5xfr4juIfdFUh346RgQtm2YteCWpwyt406bTgqY3AifZ3FWCR
         G5Ng==
X-Gm-Message-State: AOJu0Yw+4SZaPfK9ap8e/OaGLOrB9hZizueUm83sdVPsXnIY2kj0RWnf
	lpRk7jAT0Bk7fp1NkgVRWZEWOxuNycVcjW1p38mJCkugEh3PAESOPCgHat86lPvpthvfuI+zqF4
	IMJ8R9ArUuJJoDG9RJuQdyiewyM11M+9On01d4BUeCCupfmzUnEN0FQIjXQzbyaZ5GmKTCCCdRV
	Q=
X-Gm-Gg: ASbGnctH6t1g7qmHePUWVsbLPcBkIghO5Bck6csR3iOmPFOgN9umYvZA+UI5MBJ9/cm
	Si4qUGpSVdlDtowZ+QO2gIDAFplUal89PKZdzh+6e230Ktw6Z7iTTS8QsFmfy23Ox01Z8/QuIII
	ZAVin58sfFqbTC6oJibCm/DHhVBgWLgwrnfX2CKZubVi2tiJM3/11eT9CFBG6fRA4cqKHEfT3lR
	VZcjWnfbPZ7R0jMaoUC6QJG/bcm4QjpEYqd+xaNPd//fqaWCu+xFBlTj7IlrJA4obQTIJp44nz2
	K3huwrPCjPpGJ3FXdSt9epewM9N2B4U3+Vaf7lWnnettZW6IYlELwjBk0m4nQHie06v6tA==
X-Received: by 2002:a05:6a00:392a:b0:771:f071:28fd with SMTP id d2e1a72fcca58-77e36d2891fmr3691128b3a.14.1758272900066;
        Fri, 19 Sep 2025 02:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1ctVUiHOCYAhyPQgIHmDw2/ieiXUu4lKWjH8m/+iKcQdMktzFymE6vMKXe78TEi/bB9DUAw==
X-Received: by 2002:a05:6a00:392a:b0:771:f071:28fd with SMTP id d2e1a72fcca58-77e36d2891fmr3691090b3a.14.1758272899576;
        Fri, 19 Sep 2025 02:08:19 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec3f379sm4601064b3a.74.2025.09.19.02.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:08:19 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 14:37:40 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Update regulator
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-rb3gen2-update-regulator-v1-1-76913be0a8d3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFsdzWgC/x3MQQqDMBBG4avIrDtgUhXaq5QuovkTB0qUiZGCe
 HeDy2/x3kEZKsj0bg5S7JJlSRXm0dA0uxTB4qvJtrZvX8ayjs+IZLms3m1gRSw/ty3KwRvfDdP
 oDALVfFUE+d/rz/c8L4r4svVqAAAA
X-Change-ID: 20250912-rb3gen2-update-regulator-fd1d46cba1ef
To: linux-arm-msm@vger.kernel.org
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758272897; l=5260;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=QAf8PPSaPOW1dXcDI9+c34wFeqG558XUfmyI1Bhvxmw=;
 b=mqqH31iF7qj1+yy3cTaWxAYFcg48rDdY1Va/effXC9bAHF0uDVdcKKDa1aY1Ce1OWDtwUpE7o
 JLwQ/enyRFpBhES3lLO7P8ljPrGBN7ZRNKuQtqPv7qEfNd1RvJ0B24a
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/M0HC/RsDDJH
 MoNUK6arbSrxNeaNDNgNh4jI2pSdJX8es22867bWeEiQDWiqYr2RH5ln5XhcsyPqvoBKK7fZuYt
 l+9hMxvyMqJDLYBpupTF7manBNQQ5sbE8pgfsse1U/c/tkUsJQjHPxOuJVaUnq2Zy5dQc3X4/XP
 r7XNL0LHMQw+AMIWEcoAe37ggix++nzbJ29b/CWlG3rq1uG2xGaDG19HYAJIlU/gcsA8fQQ8Akf
 8ICgugw+jydEYKaXXQJSPLF01yKchoVSJ5v202Y9dJpINZPaoo0k/eQ6xnNnJQXU/7m88+kcjon
 IDNNMXj658fOLuXIs+PgR7dFoeAWUN7iDQCG51xGsYtIjKIfnv0aJekY00ElkudwqWyowhLsjhs
 QUHXl2xj
X-Proofpoint-ORIG-GUID: Z9AUda8Y9bSeOA_23PjM0hgqdoP2Yb34
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd1d85 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xy6SXK4bz0Lwp-duAgIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Z9AUda8Y9bSeOA_23PjM0hgqdoP2Yb34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Update min/max voltage settings for regulators below to align
with the HW specification
vreg_l3b_0p504
vreg_l6b_1p2
vreg_l11b_1p504
vreg_l14b_1p08
vreg_l16b_1p1
vreg_l17b_1p7
vreg_s1c_2p19
vreg_l8c_1p62
vreg_l9c_2p96
vreg_l12c_1p65.

While at it, remove RPMH regulator rails (listed below) as
these are not to be used on APPS, and any client accidently
voting on it can potentially cause issues.
vreg_s2b_0p876
vreg_s2c_0p752
vreg_s5c_0p752
vreg_s7c_0p752
vreg_s10c_0p752
vreg_l4b_0p752
vreg_l5b_0p752.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 58 +++++-----------------------
 1 file changed, 9 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 18cea8812001421456dc85547c3c711e2c42182a..6355c1e2c58165757a9a20ab4368e93545904693 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -335,8 +335,6 @@ regulators-0 {
 		vdd-s8-supply = <&vph_pwr>;
 		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p972>;
 		vdd-l2-l7-supply = <&vreg_bob_3p296>;
-		vdd-l3-supply = <&vreg_s2b_0p876>;
-		vdd-l5-supply = <&vreg_s2b_0p876>;
 		vdd-l6-l9-l10-supply = <&vreg_s8b_1p272>;
 		vdd-l8-supply = <&vreg_s7b_0p972>;
 		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p872>;
@@ -349,12 +347,6 @@ vreg_s1b_1p872: smps1 {
 			regulator-max-microvolt = <2040000>;
 		};
 
-		vreg_s2b_0p876: smps2 {
-			regulator-name = "vreg_s2b_0p876";
-			regulator-min-microvolt = <570070>;
-			regulator-max-microvolt = <1050000>;
-		};
-
 		vreg_s7b_0p972: smps7 {
 			regulator-name = "vreg_s7b_0p972";
 			regulator-min-microvolt = <535000>;
@@ -385,27 +377,13 @@ vreg_l2b_3p072: ldo2 {
 		vreg_l3b_0p504: ldo3 {
 			regulator-name = "vreg_l3b_0p504";
 			regulator-min-microvolt = <312000>;
-			regulator-max-microvolt = <910000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4b_0p752: ldo4 {
-			regulator-name = "vreg_l4b_0p752";
-			regulator-min-microvolt = <752000>;
-			regulator-max-microvolt = <820000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		reg_l5b_0p752: ldo5 {
-			regulator-name = "reg_l5b_0p752";
-			regulator-min-microvolt = <552000>;
-			regulator-max-microvolt = <832000>;
+			regulator-max-microvolt = <650000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l6b_1p2: ldo6 {
 			regulator-name = "vreg_l6b_1p2";
-			regulator-min-microvolt = <1140000>;
+			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1260000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -436,7 +414,7 @@ vreg_l9b_1p2: ldo9 {
 
 		vreg_l11b_1p504: ldo11 {
 			regulator-name = "vreg_l11b_1p504";
-			regulator-min-microvolt = <1504000>;
+			regulator-min-microvolt = <1776000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -457,7 +435,7 @@ vreg_l13b_0p53: ldo13 {
 
 		vreg_l14b_1p08: ldo14 {
 			regulator-name = "vreg_l14b_1p08";
-			regulator-min-microvolt = <1080000>;
+			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -521,26 +499,8 @@ regulators-1 {
 
 		vreg_s1c_2p19: smps1 {
 			regulator-name = "vreg_s1c_2p19";
-			regulator-min-microvolt = <2190000>;
-			regulator-max-microvolt = <2210000>;
-		};
-
-		vreg_s2c_0p752: smps2 {
-			regulator-name = "vreg_s2c_0p752";
-			regulator-min-microvolt = <750000>;
-			regulator-max-microvolt = <800000>;
-		};
-
-		vreg_s5c_0p752: smps5 {
-			regulator-name = "vreg_s5c_0p752";
-			regulator-min-microvolt = <465000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
-		vreg_s7c_0p752: smps7 {
-			regulator-name = "vreg_s7c_0p752";
-			regulator-min-microvolt = <465000>;
-			regulator-max-microvolt = <800000>;
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2208000>;
 		};
 
 		vreg_s9c_1p084: smps9 {
@@ -600,7 +560,7 @@ vreg_l7c_3p0: ldo7 {
 
 		vreg_l8c_1p62: ldo8 {
 			regulator-name = "vreg_l8c_1p62";
-			regulator-min-microvolt = <1620000>;
+			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -608,7 +568,7 @@ vreg_l8c_1p62: ldo8 {
 		vreg_l9c_2p96: ldo9 {
 			regulator-name = "vreg_l9c_2p96";
 			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <35440000>;
+			regulator-max-microvolt = <3544000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -628,7 +588,7 @@ vreg_l11c_2p8: ldo11 {
 
 		vreg_l12c_1p65: ldo12 {
 			regulator-name = "vreg_l12c_1p65";
-			regulator-min-microvolt = <1650000>;
+			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};

---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250912-rb3gen2-update-regulator-fd1d46cba1ef

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


