Return-Path: <linux-arm-msm+bounces-80159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21041C2DA5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 19:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E84C24E335B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 18:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89DD2264C8;
	Mon,  3 Nov 2025 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYkFtK6/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QoiXP7rD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD87284684
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 18:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762194027; cv=none; b=hpLNT94MRLYdmKKMxcjo+N7WsuBPuTBXrapOn52k/et0DUIjA2TlKY+j/zZI1tqocYVnY5fbzfpAyTh/q8wQFo4DAcgl+Y3n8El72nKA0zfnq9Jw5qYlN+s2LBUC7QQqS2tcXmuHsznoDnsFFovFnG47OMPtu7UeBwaRUWrbBUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762194027; c=relaxed/simple;
	bh=rlRxbzyh8yyj6CJU18HLY7UiR6zS/35hHQYL0zGGwVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jforYKCvkNvIO58tvxeSzhS6GrII4wPj2oUUuEbRMm0fNgpM12K8CNpTVUT+Tbgc0Fc8mh8xg0feWZUCRwiLNbef12KEKkeVOtx4xt51594svIQ0uCbozNlNIv7N49MGtSTuzlNexeLFjWOfDeo3oqcnDHJthV6HiLoW52pZkdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYkFtK6/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QoiXP7rD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H2sKe3595039
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 18:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6KePe1VaAb4
	Rb0Kny+upVC22Zpbyddm9VODeMGdiXKw=; b=hYkFtK6/NXYyoNw76imw4aHAbpz
	quRkgm1aakICLsXCvgAMgnmmDGqzqncQbSaOPzCSdvayjIiE9qxnMgR2TcEw6Fo9
	uTpVHRJwe08Ro4P2FWHuE7EjXrPnEDvaT4krKg/VR6SHPgnAmb+t5fqRjP3Twejd
	JVRuXazw0WShtdB66AdcdRObSkuTuQ53jSKt/v+jfM9FTu5giVufggy3uP8jeqyf
	mqt20sIEoC7aztZXKHD98Ps3sLeyuMN7HrG+3pItBSVp3yT+4MPmZaHE/Xw0dMda
	UGr/3BBAnVwF0lNRUzpeBguTy7zSIpUbq4uJD+/wLH1EwTGAuT1ut4ySMcQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70exg7q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 18:20:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e892f776d0so235413541cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 10:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762194025; x=1762798825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KePe1VaAb4Rb0Kny+upVC22Zpbyddm9VODeMGdiXKw=;
        b=QoiXP7rDKXz24ckCxNY1unWlrcite+49/LpgehyD2OrdlrQnK6Y3MipChN+3QNFOHc
         OALymGOnI5P7HD8mnXalDmyeOMNzmMk2jRXlHNOYVx6Cvdy4OAJt3bNxA1MEKRdE66c/
         9Tfr+Vt656pC0Og+q6jp5mko/TII5Qf79mOxEvR+Bjlm+D1WFqXSzDrn56bCMinRFVEK
         GBhHZFZNnP4Aha1kWhzpEuVOkPaujfnymlV10AsoceTIeRrSy7yGQuXxLKGAbIxVrzFZ
         5Vi4GPOSlAjWvWrI2CPeI++Eg4PVKg3ggObv001cYhTHybisGjieyUhP0lsLp5+bBLde
         p+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762194025; x=1762798825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KePe1VaAb4Rb0Kny+upVC22Zpbyddm9VODeMGdiXKw=;
        b=IbVcCsxQ77BN2k41t2Hf6YE07ZoPqbH3D38gKV7q6TRsJ88MBTHtvme1kFQRAcG8v0
         Ubmb44ww3I07mEoVDr9Ifa8DazsEkM8H6g96viVwnz4uvARXw9H0NK1mKaNb56uT2Ilj
         7X0OY/3Vrp3GiLRNZCqDfY8vXt/aKzHLUmKwbND9PYxYHqWtTZVKtyl2cSQZU2FDr/oV
         UEJ8dse1wiazy5Ie3oGnjF6ceT2v+HMFryhpObFgO5Ja9wv+P1HOZThtlTdzfCNds35a
         gzaZogJ6J2LZmhEuSy3kPz/t6VaCDvJfbAeb04mU8k5gWAKum2FQfa0wviJQO0rhTYLr
         dJOQ==
X-Gm-Message-State: AOJu0Yz5Qtf4ecidsYfj3HW7qMnAtsfXJMXnD63Cnnp2TBJQBFeIwV/7
	C/GnKZu0ErXjS592XNSpsDmh58PqQ34ED6VAOqWbyAcY6lCt4nKORgrKJ1FRKAMeMVFLyF13Wae
	jU33ReQMcR9UtW7wK/YNYWUAdySs6McW1+bl0U4CCWm0LVg6Jyjk0AEgzCPknjvq7TJN7
X-Gm-Gg: ASbGncuE7Cg1R9NEclKV5DPRGpYPCV6fMXHgVOmhtZ+zX8mEd/nOWd1In/maFXYmHGN
	H7sTs6QpiS9mYM84GUSbeR26PxbzgaeMuIkhYFfCBvnaiNbphirjGy1NUN3uvseuLWZ3TC7yOku
	XVETgq2YcJv8s3TrGVBW9RFV1OYx2NKB6JL9XIef9hfb3Mj30mNINJsSm6Dc8CCYRnVTHMcoVts
	wMdxSR5U5NckmRpVNirK0HPno66MA18Kh+WVJkDcpHwy0CZwYazGb9a+9dWloHZsYvRMphaDa7a
	KztOyYR+mZjomuAYagBE+tc23KED+NyJk0TWDMWVt0T5pVl0bXR+nRT+jt0jDJpOUSxVEVGJW9+
	hf9x9lii5A6kZ7O9SOVd25N+Ef1/iFZMqAo/D9P0WWP11Sv3+za6BOiRJY0PYqeui4g==
X-Received: by 2002:a05:622a:4c11:b0:4e8:955b:ac04 with SMTP id d75a77b69052e-4ed30deff3emr164567591cf.22.1762194024848;
        Mon, 03 Nov 2025 10:20:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4oxMJtz50yM90yKKKIia6FO6BqNrcEfMAMT8ylD8wZpLbSlCFYUGYTPGoQtsz0TPiz1enWA==
X-Received: by 2002:a05:622a:4c11:b0:4e8:955b:ac04 with SMTP id d75a77b69052e-4ed30deff3emr164567091cf.22.1762194024267;
        Mon, 03 Nov 2025 10:20:24 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:8842:5746:daeb:a8f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c53ec2csm169096545e9.11.2025.11.03.10.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:20:23 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 5/5] arm64: dts: qcom: qrb2210-rb1: Add support for EDL reboot
Date: Mon,  3 Nov 2025 19:20:06 +0100
Message-Id: <20251103182006.1158383-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APHuRV3Y c=1 sm=1 tr=0 ts=6908f269 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: iDbp1q_uxxH3JPUKKhUJj6fRK5VyPBws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDE2NCBTYWx0ZWRfX+nv39TjqyBj8
 ZuUVOR0T4Ey6po4o9ProjKD3Y/VaZQiXCoRzDqfbuBmSuVkyrOZpdaVWY2G+xoeJYfXlXj/JH1l
 jcDShRDKLZX0SaDFIRPO7FtBPrLEJ+73XGabPZ9cqKh4OkKanbxn1AqcwgxeEdLRyEDPDyoloRS
 n2DGXEMii5i28qX01OZcEZj3+HBPX5prUyfhSNY0jLXn0fZ/i13Qe+3RNfThHjzvS45TZyblli4
 7B1jyWCgmQowxPYFPecAtxXmZmab+dB2oTQ5C/hH+qfZUT7DSboezVL1WB4s09Kw9UGI4X3ZYOv
 FyJVhUgWt6jBpY5l4x+EScq1y+I4xA9DiGxA4tOvDLIlr2jlC5lq9sfqqQZD2GB27wusAZBE6sS
 CQU+qdLk9OAx00eP/YLA7SPGgux3vg==
X-Proofpoint-ORIG-GUID: iDbp1q_uxxH3JPUKKhUJj6fRK5VyPBws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030164

EDL reboot mode can be configured via qcom-scm, enabling the platform
to enter Emergency Download Mode for recovery purposes. Additionally,
we enable PMIC-driven warm reset as the RB1 platform's PSCI interface
lacks support for warm reset.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi     | 2 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index cf8c822e80ce..5d84a3250481 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -15,7 +15,7 @@ pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pon@800 {
+		pon: pon@800 {
 			compatible = "qcom,pm8916-pon";
 			reg = <0x800>;
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..70c6c929bbd3 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -322,6 +322,10 @@ &pm4125_vbus {
 	status = "okay";
 };
 
+&pon {
+	qcom,warm-reset;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -510,6 +514,11 @@ pm4125_l22: l22 {
 	};
 };
 
+&scm {
+	qcom,dload-mode = <&tcsr_regs 0x13000>;
+	mode-edl = <0x1>;
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
-- 
2.34.1


