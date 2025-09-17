Return-Path: <linux-arm-msm+bounces-73973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B15AEB810E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 18:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CB21653F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2712EA48F;
	Wed, 17 Sep 2025 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx7VQFM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CB019F13F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758126943; cv=none; b=DYj5tDntbVFSkhSJXbjADCxZi5FI1kIfvwAM5MtabLywRwQvY8zG18EVNUuGokNvfaTOMQOAamhkYXUgFtcbjc7C9BSHMBOmDpdYXyHTm8FmOvxmKqWKpMcnlMh+Jv+A/GzIf+49OGwNqzumgm32XrCXmu6y7vnaPolekw1usVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758126943; c=relaxed/simple;
	bh=f81wndd+dooIUGWRm5++6NpsJFUA8K/jCjOWGU9GpdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aq5vq3S3Q9SEP0i/0pUeOdNH6YR4NSG1vsyPsfYg92JGaIaA3v3GgiTylMtTLUQzdUxNe9EsQzHjpE30el80cJ7kj14fkamGr5TyokMO4wPPS7s1H7Qf0ulvCq/s2ApZhB3miFtusfgNxKd4rcZAYb7QWA3d0RrgdH8jj62JPaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx7VQFM2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HDGXpg004305
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YJiS1nQwiN1N7rkz3DDUWUz06uyHGgzyXb0
	BmwurICE=; b=Xx7VQFM2sOkvb5L7YJ2MjruZ9ap6plaxtpqzTo5F28qK1dxhFWH
	ZWdQ7PKddr+/nnk22WRbtVgRCgRMPnr/GhalgzUez0I39DmlYS/Mk0aN4TW9p/Cj
	kP+8uYEVkk3xU4tfmpjFtMOcB3qMg9BgB7mFeNOMUukZXsyjdcuqI/3QAFw1p+ZG
	Gc0T8xIW65fFTtmBYMTbsO0uAUxblP+KyU6iGn078D0bcN2BD48fvria9xSvj450
	RIs+ClGdqSk3pdcsW1QxDrYtILMyNck6Zd6xSzayaND8a2xt4yVuoKQqgahZF83E
	TeU2NpgBhSFv9okjx4OBrKGgZPIRlfI+Pew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgrn8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 16:35:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5e178be7eso641851cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 09:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758126940; x=1758731740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJiS1nQwiN1N7rkz3DDUWUz06uyHGgzyXb0BmwurICE=;
        b=r315v05I0GCv2gK9iX3P4GFgqDfPBmK2Pt8JF2WI21kSk91C877zoGethrzN76O5gg
         rZWCxJGXFf0UESZ1PtcAop6bNE8+WcWBgogOHPXxoOEVbYVOE5ZY8kSb8SWNcFEtuFOU
         3iloGqYH7ctc9Bh2IbnUCg0ro7n5iyB9AGJoUK5eRRc8JftZeRtZUMhqW1a+3QwcZL0E
         yX/hk2xXBueoWuKIvi8hxBWGTDYSs9x1DOMdAmyDukx1NaDEkdb5V4lo3ACu+W0WLkHn
         i9rLMLaaPtHxEM0QeP7lo4HrmdpUBMqwROEucPJzqZGwvPVvFb/bGvz6oeQk4wXVEqXj
         OCHA==
X-Gm-Message-State: AOJu0Yzf46mJpK/ommRTzOVfjCVRF6aWgEnZyTVYya8s6gpHpx7jdysw
	XDW1piCmrc1CxVpZuwALY4dYsi3e0YFqnvaLbEJ2v05kme9IFhaXuM6BAYKgO5eWdhYCgOqF6l7
	E4ug+MNWbMW448wGWw7U+P+VGYuiOSPEqJIWBKkkZItYd0MnGNnikq411VBa9F9fYR3cw
X-Gm-Gg: ASbGnctGuTcn5kP4NSPmbO8ZwtG0paosz4b4uGTJykC9YmeLl1vNLUyaDsEPtfdJhhQ
	nqkV7veNNm+QskpaN5arqteK7avFEybhBFr4zj6SajlyS23PrYFYfyh6cjTD14k4Ka/5qvp4Q8X
	AV19/X1YCUp/cK/HebNGp9LddetYP1iASBBRqNI4lSTWRHsySnhIC5QimOhEb8JUAqmvh1QvMJY
	UbfQmedPDavjSJd5UKtBPq8TJPWM25BdFyLtzBqCyQY2sY/chNFfwVjSU8+iTJ7gZ/P/hPxw8WW
	sr5mlxgL7SlnuT49hlXgVHowhISzV5VVkPlws/tYJBI5MaF9y5NbvL/ZW4P3VijwW+iwu3zCABw
	=
X-Received: by 2002:ac8:7d03:0:b0:4b4:8f9f:746c with SMTP id d75a77b69052e-4ba69395b33mr32934641cf.23.1758126939775;
        Wed, 17 Sep 2025 09:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnBOmyy0hUgWIxeQc/ni1SsWn1VtcEfbYG6Fec6zZQvLqdT9yZP1hmhXU17L8j/vURYJFrkw==
X-Received: by 2002:ac8:7d03:0:b0:4b4:8f9f:746c with SMTP id d75a77b69052e-4ba69395b33mr32934061cf.23.1758126939042;
        Wed, 17 Sep 2025 09:35:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:81ce:8337:616d:c2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32141ae9sm41337025e9.5.2025.09.17.09.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 09:35:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
Date: Wed, 17 Sep 2025 18:35:33 +0200
Message-Id: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7YG3U2sCDQ1lOHYVzPxyVX4CXM8rDDe1
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cae35c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7YG3U2sCDQ1lOHYVzPxyVX4CXM8rDDe1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfXy6+N9sSdNpk0
 Oy/QWXxK/MQjGOQygHFij8TvGMjGDa2OnW/pIQ7We5YlHkoxtoZFWzkyBzpv2B8nfe3Dc6sTjQj
 PLumfkCbmShjknVsnJdNlMHH6LdVlaN4PdqOY6LV5T0+wkZTe5/iF/HdczvJGBrm7gkZRWOZvz2
 uOQZTRTPd1VyhObShtS7DRgzHxphH071D3mzjOpEH0/yISOEtrcyveN2jAaf48RdKRzBOet6Ddv
 I/QVF8WUW1QjhQ37bP7UhUppkw2iWaArqi4zft7VEA2VEjHkArdrdJLQgoX/Mo8Bb6GXtaax3mf
 VeayNpCCzpb7R8zXRpulTaC75172W2ZnnZRJ1tjcJaxQSvY19BEaGaVqT29V+CthjGCjhqIr4oo
 guAPr2N4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128

The PM8008 device is a dedicated camera PMIC integrating all the necessary
camera power management features.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 81 ++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 67ba508e92ba..cc0c53fec1af 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -220,6 +220,87 @@ zap-shader {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupts-extended = <&tlmm 25 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&pm4125_s3>;
+		vdd-l3-l4-supply = <&vph_pwr>;
+		vdd-l5-supply = <&vph_pwr>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-supply = <&vph_pwr>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		status = "disabled";
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3404000>;
+				regulator-always-on;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.34.1


