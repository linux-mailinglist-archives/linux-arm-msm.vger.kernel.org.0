Return-Path: <linux-arm-msm+bounces-72106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE8FB4435A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 110BC1CC336B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70365335BDC;
	Thu,  4 Sep 2025 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJ5F8iSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0C335BA1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004022; cv=none; b=GapeEcJxu2XVRLU2jTYBs1jVtnwvPLyaSAUVKALdobcx43/f+AvXEebquJ4e+rkgNdsySdbB9b7wRjMy7EqTvAQ2tTpk2mJD3cZjqDlV57OVyTYn88XS2oXxtoFSfoAApomJ3YQz6MbnYwxmCAvbwZWbs7w+P1x5RJZhaNl2Yxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004022; c=relaxed/simple;
	bh=37H1xMtSIIFaomL+56Isf4j9FIno96UEZs0f3vwqssw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvNMVjKHKub6U32/McxD1GhMGoERuSwfLca/Q0zYeY5E4rhJYz13A4xNQEEXSZKmY5jRbE7r2wrzYGvszBrspwnGpCHJhwymmjY7H1maSPV/5EtCIlAkGR9HMZoMp6lUy9aljLbQ3HvyD8FFFMLoDLLXc8I2PBedJ2eyJ/n4Cu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJ5F8iSD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XCtt013645
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 16:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pi8mfgHfMnKup1+xYHuBVu4AKpWd2gFfcTTKk7r1KGs=; b=GJ5F8iSDpX5t9FTB
	BKor2gvLEUtjRl7YxzFY9XVh1S0VE0c34M2BeWqyW7zKYwlWiLsxV5UEkkEgkIzg
	Er93+9k9KMTHPw7Kc50MOt/hnaD31xDahaJhBm0s1dO+kcOId1QNx0azZ/p0LoLR
	2kpS0J3A1xicXUG/xddyxcztRsZTR9Fa3NP0uGklnk0593Ctg9iMbqLIrBtPCWov
	KJfzmftI2NBiKwWm/zZl+00Cl6sUh/62E57kLpxgddnyYrF5zeaIvK73oj5KpWIA
	MvwiAgUKo1h8vi2uaXGHyjNddvAn0z1m1+ceTbc5GRLP16BdfXeeS/wt3Mz24vNZ
	5HXgCw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyc4ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 16:40:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77253535b2cso1270530b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 09:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004018; x=1757608818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pi8mfgHfMnKup1+xYHuBVu4AKpWd2gFfcTTKk7r1KGs=;
        b=geg0mcpGkDCTT+wkX3tSpRT6STyjHTbwUIRuv9hjZoY3mqI3S5Oe4/PWA87HbGHYso
         wn26I713poxYH+YgkofVOdeGIP3+9baKq63em28QZzlyaxb+3mV1pJdgRWi3cFjCXz5h
         4RWC9JW5X7/V3G5a9KuecN+p+xG8lD6TykesFG4g3ZsQfJrPiA/uE9dOosOMwdROq0L5
         qFqDLD6JZINK7RbXvJy6k4iNq9x8/XF47JJz6XJsPFqr7+w7i8btfucbfdHf2lo9Jz2v
         C/k491IjMNb5tbOi3TUGTtdQ1tnNiqsdnVQqGfsoKQ62j9PC6pclPXsq5AEhI6dsW9DY
         iTeg==
X-Forwarded-Encrypted: i=1; AJvYcCWd7qbKGEUZDpbyu8m+GEQSoitkwLlEetw/PsQPSW6LTo7GgRpk8IKQuLC2whEJc1VqXY185/l7PMjFk54o@vger.kernel.org
X-Gm-Message-State: AOJu0YxRKIRbL311C6S3T4n14aQV8nNveqDE8m+DbluZTtqSmRKGuDVx
	37CO5XiMgbnVPYaNAdBzLciv91PqTstL/tFRX0vlgYH24t2sC2+oYRDm6Y+YDUgRTguJj+eDaH/
	CVzfy/pRKCB4Vg6qeJ3tbaG6Sm/ksD7f/fpqxYCSiDM5978fA0Tp9R2Btn/HimoKoz84X
X-Gm-Gg: ASbGnctD1Nk0FmfJE+DdS4VQ4JQsYT2wQwkoEOwa50VyUJs3wMx/eVHtx0T+E3oib6D
	GHHi1Dsz2gAfbeBM6JzwTWvYzmg816nGeEKnA4+EEW0YsSA3vs/P2zAvYM6oRH3tiksKqSFh3lw
	lELKl/jnslvLDFLNntGwbMmKuPlJdVXx3/jhTW5VQwLUaIRCkQPOHbOcegmNo33tTm5vxxpElh8
	RS05jcQg+GVNbNheDLQzIlx+5kWLbovAESIaVlU1K3kw5M7FAOK6kPFpVIcCrK0DdVinw7wLHHD
	H2rJ1ef0DHTBNbiZakuwms3RIuJ+NgijuANPxJckWK3HNv38CwlWi26vihuHxZALA5Nc
X-Received: by 2002:a05:6a20:1611:b0:24e:9d94:7b10 with SMTP id adf61e73a8af0-24e9d94816cmr247276637.51.1757004018375;
        Thu, 04 Sep 2025 09:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlzDoVe/ok6bgJxtH9oYRrIlnY9HX5pm5FSQGgaZcab7BxYMmeLwqre3zAaqeD/COLWeIl+w==
X-Received: by 2002:a05:6a20:1611:b0:24e:9d94:7b10 with SMTP id adf61e73a8af0-24e9d94816cmr247235637.51.1757004017868;
        Thu, 04 Sep 2025 09:40:17 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:40:16 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:07 +0530
Subject: [PATCH v3 11/14] arm64: dts: qcom: lemans-evk: Enable SDHCI for SD
 Card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-11-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=2022;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=yUijNRhoZ6rLmjbWk0JNkSUbsDS+vVSGs2OkDCpSUoA=;
 b=VF5Y+giUrn7zCiKABQLHLV66iugc/RqwOrYs5ljNeevW6xirtb1lVNZdf+nmHztLAvSfsPBMh
 7s9LHG/3xGnD++W296n1i0MWvwNS1mqR8pmlQ9CdE7IoXWBFXNoTZBL
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9c0f3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5BVB-bh7LpO0klZGoUQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ta6ypWL2wqg7ereCyIohZx6krtZ2Lvc9
X-Proofpoint-ORIG-GUID: ta6ypWL2wqg7ereCyIohZx6krtZ2Lvc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX6PXsZFMl8opG
 Jlmhcnm8tBEQvmiYvsvHfc1WyIuy6uF24l8jHzu4+QdZVHGc81TGbgZCsJgX+JWMWVvT97SYlMb
 6r35e5co25HKKWgYGtBjgBnGHcH+jFaPLaNYgR55idvYx+1Y3g5RJyCs0tmSQ+Pe97ORd7CGoqB
 barg+tXLxhRoJsGR4kp6hhowSxQtEmZTb+WpsxK8cAjgctiGQutgjNv08BcPiWLwQ1V9zdjfKcB
 DBhNe6BD/IXSZb/UMcEQ3mLMH9I2Tgplod/XPxUC6JxkhwYwVXh8D7p13HtQA32K/MMyPoopLIo
 3izOd5XwpxVH1DHg4J7dd/N1Dq6vKRpm4M5H71P9fcFmjXWJQ3b07ZAEPvLGrtZhmfhGt4htpKL
 /27tWBzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

From: Monish Chunara <quic_mchunara@quicinc.com>

Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
to support SD card for storage. Also add the corresponding regulators.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 44 +++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 6ec6f9ed1ec9..7a85ba044ed4 100644
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
@@ -461,6 +484,21 @@ &remoteproc_gpdsp1 {
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
+	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };
@@ -511,6 +549,12 @@ wake-pins {
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


