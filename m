Return-Path: <linux-arm-msm+bounces-81304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AE3C4EED5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 17:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B1003AEC97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 16:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C5436C58D;
	Tue, 11 Nov 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvR5fOEA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUTM3Fo3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D110036A012
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876985; cv=none; b=Hw7eVZCpEuMRDHsGLUZt0di33kRV5cWeknBF+1PjVa436dtexEroo1D0GyibEqOKkEva6ktDOwNiPrPFWvM7betVV+Vrl4E7qyDdeopcC65/NKpgVhOMF20/7dtF/q0k4l9Lcr2vuwYWJ9O6SnqjRCyU/yOZMjiVjRPsCzi6d/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876985; c=relaxed/simple;
	bh=l3xrD9+9v1GvcvZapU32Ui02MZPCKddhri7VMC8wBGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ym12cYwGqkKWJszl9ueiD96cBU2oPgZud/olgWMY6WaL27qvvJsTMYOCiTRODOwO7EFc5OM8lA0OhiklpHduGgiolnGrS19MhwMFMHKfk7fA6aX3aMjdW/BlAHoHC8gB/6bRTRewGzEVdZD3gL7TkAcrLtYwHON186wY93Lc0u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvR5fOEA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUTM3Fo3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBH1eB2029211
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbGoFZn44hkO3zbfBLnc+18PkSEewRXy+JGD0E6m0uQ=; b=UvR5fOEAON7SLVnd
	TyE0Zu9HX21MF2yNOnsSRoUqO+NxQNNIjk/sPwv5awSzDeNpLzIX09eddXVA2X8h
	aYx2URek0YOCcTF0Y/b8Gj7SQH3goM7a7c9rVTq7JGXbFzySsvr0fVOanGWu+m6M
	tQA9LouLUzjCYOvReXL4657wPBRrV5d0Y0PtXbyLftvEtStE464sEVF1J+kjhDcd
	VKCBq6JdGQ1z0MCd9d0E0va0xdHhqg/yhdHoTur3oAOofPH4LhYSqkg1UWd+w/bq
	tiUJQAZuoTkQotE+aZsOMg6x9r7n73nYEd2cSiTEchTBxmZImrZ5/MzKFZDznvpX
	NAArnw==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxqw1ude-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 16:03:01 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-948a29f1ec9so212086439f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 08:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762876981; x=1763481781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbGoFZn44hkO3zbfBLnc+18PkSEewRXy+JGD0E6m0uQ=;
        b=gUTM3Fo3drEE+1x1gG4CfEIK9htsHI73TCstHce8fWcJsmJSrHCzyErZv3vzI3jtgS
         ctemBNSgewVfLX8LIuY5Q1JpntS/e4G6nYHSZSCNJaWb7Tk2P9tyl++RfECfR5k4Fj7E
         dnXArsqAtmlQ263LOI564Ev0pWvfj8NmGVYSMYL3ucF+xD1Zc1NB4YF9wxw0aZkrKHA1
         H8p1E9ByZZno6y1+Qx9An6lDqO8i3IMaOlRf1XXdtwVS/ZdaAYED2a5tSjAUvwXOVaCc
         BFXEGCQLtr7VVrLuSGvswNDl99m3OhfSfbn03f6556sGF8EocNMgj/7qQsTdyBGIQ+Lr
         An1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876981; x=1763481781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbGoFZn44hkO3zbfBLnc+18PkSEewRXy+JGD0E6m0uQ=;
        b=c0+X5ypNn7hWoVMbfd7ShAyYT9Mzs0Q5H2t+dOgAXLhP6rZ8Z4K0F1H9DczCbA8MUQ
         L0+MPAao5/SvCr8S4puRZoqwWZzQVrcKJrcOdPpCeA9ItVH1/Hz71M08Zd17zgNaW1/V
         2DK0qD4WTPGIcPxURzKJTFjMWYdv2nXgXiNK9junvdOgnYPGJUaReyJKzztqqM627ix8
         8RydGUjcV/2u3b0H8GU0T4z9SoBfkZZXWB62IMK56aWo9lMwyKtYhc/l4DksBAHbIOqP
         MxaRZ4aV99jnjKGmiILVTBxBGos1CcxJOsllwL8HKcpiNuAigEulw839eX+22rGs8IWm
         Lnaw==
X-Gm-Message-State: AOJu0YxyNe80WB7DeD1mBuas9/L5b2YtTB09hDbOPvE14LTr4hAXDP6B
	RNUNdge8vWuW9U15WapMqWd70qUfwugXr60bTb9CqsyTSwUSsdvs5bKIo+FB78dWThzmNLzygYi
	aqcRLRHSFUO2aKyjrxp56+VrG9dzl6o2jOSnnm0v+nCR70/m0GkI7ToqCKjlVPZrS3MO8lS1ysy
	Rj
X-Gm-Gg: ASbGncsSiirpQjpcIgG8OU6ST3PDRJfGf/sJ22B1sajd5yu8Y0HlZFc3qcNa+kUTeUb
	MZjq5ZhSda7bIXAVdgZsYeeTWLjCT3/25QwMwg+1vla2663L65vLa4BrdeQIATOvwN33jQVrevy
	BaTfttMtxVVtnPCEyCEa4V+J49MZf7rn0oLzSTjn0bNlmniDPXjMcUTPexo5A+SA0X547PGaB6Q
	YF8Nk4FtAx73ll6wgG/xDkw8FgSc/ThCtD3awjFOsu96U1kSrQ99/uVB58HXeX7HAz0xOemNkEi
	U0TDG2d0sLqdrBR753sai4tVH5Gnj1fLaHERiG3xrLUC5Kqj+gSh8oACafTAiQbKsmIuF7Cs9qW
	m4AIb0HmOBsbn+Ylu3cDF7bbRSnRfXznfp9P35RnfRY1cqUHRzzTX4MVr9q3oCH2t6bkhrxOFno
	RPRcjHuu1jV+ma
X-Received: by 2002:a05:6e02:220a:b0:433:2df8:5dcb with SMTP id e9e14a558f8ab-43367e46482mr191109595ab.17.1762876980163;
        Tue, 11 Nov 2025 08:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcIrjNrcWvAvyzFU+VndOC4i7Ye0n9dF86+rgpgTbYokP9UpB3h4ojIjGElh0RQ/NGRwmoFQ==
X-Received: by 2002:a05:6e02:220a:b0:433:2df8:5dcb with SMTP id e9e14a558f8ab-43367e46482mr191108405ab.17.1762876979238;
        Tue, 11 Nov 2025 08:02:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a1b231fsm5149139e87.74.2025.11.11.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:02:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 18:02:52 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: add apq8096sg-db820c, AP8096SG
 variant of DB820c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-db820c-pro-v1-2-6eece16c5c23@oss.qualcomm.com>
References: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
In-Reply-To: <20251111-db820c-pro-v1-0-6eece16c5c23@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=31716;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=l3xrD9+9v1GvcvZapU32Ui02MZPCKddhri7VMC8wBGw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpE14sbawsvxFZvWk/K5x9IRD8Xjj2o7EVwGecD
 uFOCv/plBeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRNeLAAKCRCLPIo+Aiko
 1S9KB/wOhsKjWUsrk7ho8JX3Fbuoue0fvZspDJWNF5nT21yenRKmn9LfzJMwoFe9EDcD7OGe/NZ
 nnnuWrIRMPigpKnZPMhx61uWHWO9Oblk7THfhOIZKly1NKyRd+9fQWmTQIF7J5QlnKWSB8Vz97f
 ZyvdYfNky6zPz2TojlaCaem1wNwGsTWrXgr2JvhqoyjD1e8TVEAEI7SQdAipVHpZhxy+Zq/cdt6
 4Mp92Xa75Hwy4VpAPUbEZIhx/krcDOVXN4nLc5c9Uj2GMFXUdWHSOwpl4fIICS7SULTeASDyKEt
 PgAvumIZz9Ua3+4DVo2945prTf0m31M0wztuUOYvh+HF6Rg7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEzMCBTYWx0ZWRfX39WGaLZZGN0B
 GKT/hIB+wCTUwuJCbZ3lVDxTboxmUawEl9eJq47b8z9rgCdsHvvHU6wm8vU8Q69hpOP6Zk9fGSv
 4snPpyCKIc+kG6a9jYDVgQ0C3DbzkCSwO8EAjrXrOsvUMxmKaJGKNNXot0pszgOirqNwiS9mSFe
 l+6MUG+kzs3geDVPjAnh+oLKUk53QedILB3bPEbvV+bSYQuQOvQRpXhtc+vS8JOo+xvtbpBM16W
 wbC8am7IY7jC/u10fgsSx7YM1zcNgKf61ATE3mlIdPinv9BV+25fvquZuakmoM4MVTRc+MCp14z
 cxTA1EBMQx/lQBe0fc2gzr3sifLUqozkjB47oOO087Lur7klUGDjiBuk98GaLFBjxDQZxZJB/1j
 CIfOhUrmXOqD/4VEyqkMWHVdH9h3fw==
X-Proofpoint-GUID: Z3bq-WcUuC3tdIf8Dj5-YvLwKStYUtp2
X-Proofpoint-ORIG-GUID: Z3bq-WcUuC3tdIf8Dj5-YvLwKStYUtp2
X-Authority-Analysis: v=2.4 cv=CeIFJbrl c=1 sm=1 tr=0 ts=69135e36 cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lIkWrcjMruFOK0M9-WcA:9 a=QEXdDO2ut3YA:10
 a=LKR0efx6xuerLj5D82wC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110130

There has been a (rare) varint of Dragonboard 820c, utilizing Pro
version of the SoC, with the major difference being CPU and GPU clock
tables. Add a DT file representing this version of the board.

01:13:26.275: B -    417880 - 8996 Pro v1.x detected, Max frequency = 1.8 GHz

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 1126 +-------------------
 .../{apq8096-db820c.dts => apq8096-db820c.dtsi}    |    5 -
 arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts      |   15 +
 4 files changed, 17 insertions(+), 1130 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c4cc5ec01de7a0ecbc45f64c3ee15..c3ad5c3cd659198a6bc88bf07d6939977937f5d1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-schneider-hmibsc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 9fa70ff6887b78caf1826f653a5caccd9653269c..47b4568e4039117e3bf6e08ffa8a2c8198d748b1 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -6,1133 +6,9 @@
 /dts-v1/;
 
 #include "msm8996.dtsi"
-#include "pm8994.dtsi"
-#include "pmi8994.dtsi"
-#include <dt-bindings/input/input.h>
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/leds/common.h>
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-#include <dt-bindings/sound/qcom,q6afe.h>
-#include <dt-bindings/sound/qcom,q6asm.h>
-#include <dt-bindings/sound/qcom,wcd9335.h>
-
-/*
- * GPIO name legend: proper name = the GPIO line is used as GPIO
- *         NC      = not connected (pin out but not routed from the chip to
- *                   anything the board)
- *         "[PER]" = pin is muxed for [peripheral] (not GPIO)
- *         LSEC    = Low Speed External Connector
- *         P HSEC  = Primary High Speed External Connector
- *         S HSEC  = Secondary High Speed External Connector
- *         J14     = Camera Connector
- *         TP      = Test Points
- *
- * Line names are taken from the schematic "DragonBoard 820c",
- * drawing no: LM25-P2751-1
- *
- * For the lines routed to the external connectors the
- * lines are named after the 96Boards CE Specification 1.0,
- * Appendix "Expansion Connector Signal Description".
- *
- * When the 96Board naming of a line and the schematic name of
- * the same line are in conflict, the 96Board specification
- * takes precedence, which means that the external UART on the
- * LSEC is named UART0 while the schematic and SoC names this
- * UART3. This is only for the informational lines i.e. "[FOO]",
- * the GPIO named lines "GPIO-A" thru "GPIO-L" are the only
- * ones actually used for GPIO.
- */
+#include "apq8096-db820c.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. DB820c";
 	compatible = "arrow,apq8096-db820c", "qcom,apq8096-sbc", "qcom,apq8096";
-
-	aliases {
-		serial0 = &blsp2_uart2;
-		serial1 = &blsp2_uart3;
-		serial2 = &blsp1_uart2;
-		i2c0 = &blsp1_i2c3;
-		i2c1 = &blsp2_i2c1;
-		i2c2 = &blsp2_i2c1;
-		spi0 = &blsp1_spi1;
-		spi1 = &blsp2_spi6;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	div1_mclk: divclk1 {
-		compatible = "gpio-gate-clock";
-		pinctrl-0 = <&audio_mclk>;
-		pinctrl-names = "default";
-		clocks = <&rpmcc RPM_SMD_DIV_CLK1>;
-		#clock-cells = <0>;
-		enable-gpios = <&pm8994_gpios 15 0>;
-	};
-
-	divclk4: divclk4 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-		clock-output-names = "divclk4";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&divclk4_pin_a>;
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		autorepeat;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&volume_up_gpio>;
-
-		button {
-			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&pm8994_gpios 2 GPIO_ACTIVE_LOW>;
-		};
-	};
-
-	usb2_id: usb2-id {
-		compatible = "linux,extcon-usb-gpio";
-		id-gpios = <&pmi8994_gpios 6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&usb2_vbus_det_gpio>;
-	};
-
-	usb3_id: usb3-id {
-		compatible = "linux,extcon-usb-gpio";
-		id-gpios = <&pm8994_gpios 22 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&usb3_vbus_det_gpio>;
-	};
-
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-always-on;
-		regulator-boot-on;
-
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-	};
-
-	wlan_en: wlan-en-1-8v {
-		pinctrl-names = "default";
-		pinctrl-0 = <&wlan_en_gpios>;
-		compatible = "regulator-fixed";
-		regulator-name = "wlan-en-regulator";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&pm8994_gpios 8 0>;
-
-		/* WLAN card specific delay */
-		startup-delay-us = <70000>;
-		enable-active-high;
-	};
-};
-
-&blsp1_i2c3 {
-	/* On Low speed expansion: LS-I2C0 */
-	status = "okay";
-};
-
-&blsp1_spi1 {
-	/* On Low speed expansion */
-	status = "okay";
-};
-
-&blsp1_uart2 {
-	label = "BT-UART";
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,qca6174-bt";
-
-		/* bt_disable_n gpio */
-		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
-
-		clocks = <&divclk4>;
-	};
-};
-
-&adsp_pil {
-	status = "okay";
-	firmware-name = "qcom/apq8096/adsp.mbn";
-};
-
-&blsp2_i2c1 {
-	/* On High speed expansion: HS-I2C2 */
-	status = "okay";
-};
-
-&blsp2_i2c1 {
-	/* On Low speed expansion: LS-I2C1 */
-	status = "okay";
-};
-
-&blsp2_spi6 {
-	/* On High speed expansion */
-	status = "okay";
-};
-
-&blsp2_uart2 {
-	label = "LS-UART1";
-	status = "okay";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp2_uart2_2pins_default>;
-	pinctrl-1 = <&blsp2_uart2_2pins_sleep>;
-};
-
-&blsp2_uart3 {
-	label = "LS-UART0";
-	status = "disabled";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp2_uart3_4pins_default>;
-	pinctrl-1 = <&blsp2_uart3_4pins_sleep>;
-};
-
-&camss {
-	vdda-supply = <&vreg_l2a_1p25>;
-};
-
-&gpu {
-	status = "okay";
-};
-
-&gpu_zap_shader {
-	firmware-name = "qcom/apq8096/a530_zap.mbn";
-};
-
-&hsusb_phy1 {
-	status = "okay";
-
-	vdd-supply = <&vreg_l28a_0p925>;
-	vdda-pll-supply = <&vreg_l12a_1p8>;
-	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
-};
-
-&hsusb_phy2 {
-	status = "okay";
-
-	vdd-supply = <&vreg_l28a_0p925>;
-	vdda-pll-supply = <&vreg_l12a_1p8>;
-	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
-};
-
-&mdp {
-	status = "okay";
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdss_hdmi {
-	status = "okay";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
-	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
-
-	core-vdda-supply = <&vreg_l12a_1p8>;
-	core-vcc-supply = <&vreg_s4a_1p8>;
-};
-
-&mdss_hdmi_phy {
-	status = "okay";
-
-	vddio-supply = <&vreg_l12a_1p8>;
-	vcca-supply = <&vreg_l28a_0p925>;
-	#phy-cells = <0>;
-};
-
-&mmcc {
-	vdd-gfx-supply = <&vdd_gfx>;
-};
-
-&mss_pil {
-	status = "okay";
-	pll-supply = <&vreg_l12a_1p8>;
-	firmware-name = "qcom/apq8096/mba.mbn", "qcom/apq8096/modem.mbn";
-};
-
-&pm8994_resin {
-	status = "okay";
-	linux,code = <KEY_VOLUMEDOWN>;
-};
-
-&tlmm {
-	gpio-line-names =
-		"[SPI0_DOUT]", /* GPIO_0, BLSP1_SPI_MOSI, LSEC pin 14 */
-		"[SPI0_DIN]", /* GPIO_1, BLSP1_SPI_MISO, LSEC pin 10 */
-		"[SPI0_CS]", /* GPIO_2, BLSP1_SPI_CS_N, LSEC pin 12 */
-		"[SPI0_SCLK]", /* GPIO_3, BLSP1_SPI_CLK, LSEC pin 8 */
-		"[UART1_TxD]", /* GPIO_4, BLSP8_UART_TX, LSEC pin 11 */
-		"[UART1_RxD]", /* GPIO_5, BLSP8_UART_RX, LSEC pin 13 */
-		"[I2C1_SDA]", /* GPIO_6, BLSP8_I2C_SDA, LSEC pin 21 */
-		"[I2C1_SCL]", /* GPIO_7, BLSP8_I2C_SCL, LSEC pin 19 */
-		"GPIO-H", /* GPIO_8, LCD0_RESET_N, LSEC pin 30 */
-		"TP93", /* GPIO_9 */
-		"GPIO-G", /* GPIO_10, MDP_VSYNC_P, LSEC pin 29 */
-		"[MDP_VSYNC_S]", /* GPIO_11, S HSEC pin 55 */
-		"NC", /* GPIO_12 */
-		"[CSI0_MCLK]", /* GPIO_13, CAM_MCLK0, P HSEC pin 15 */
-		"[CAM_MCLK1]", /* GPIO_14, J14 pin 11 */
-		"[CSI1_MCLK]", /* GPIO_15, CAM_MCLK2, P HSEC pin 17 */
-		"TP99", /* GPIO_16 */
-		"[I2C2_SDA]", /* GPIO_17, CCI_I2C_SDA0, P HSEC pin 34 */
-		"[I2C2_SCL]", /* GPIO_18, CCI_I2C_SCL0, P HSEC pin 32 */
-		"[CCI_I2C_SDA1]", /* GPIO_19, S HSEC pin 38 */
-		"[CCI_I2C_SCL1]", /* GPIO_20, S HSEC pin 36 */
-		"FLASH_STROBE_EN", /* GPIO_21, S HSEC pin 5 */
-		"FLASH_STROBE_TRIG", /* GPIO_22, S HSEC pin 1 */
-		"GPIO-K", /* GPIO_23, CAM2_RST_N, LSEC pin 33 */
-		"GPIO-D", /* GPIO_24, LSEC pin 26 */
-		"GPIO-I", /* GPIO_25, CAM0_RST_N, LSEC pin 31 */
-		"GPIO-J", /* GPIO_26, CAM0_STANDBY_N, LSEC pin 32 */
-		"BLSP6_I2C_SDA", /* GPIO_27 */
-		"BLSP6_I2C_SCL", /* GPIO_28 */
-		"GPIO-B", /* GPIO_29, TS0_RESET_N, LSEC pin 24 */
-		"GPIO30", /* GPIO_30, S HSEC pin 4 */
-		"HDMI_CEC", /* GPIO_31 */
-		"HDMI_DDC_CLOCK", /* GPIO_32 */
-		"HDMI_DDC_DATA", /* GPIO_33 */
-		"HDMI_HOT_PLUG_DETECT", /* GPIO_34 */
-		"PCIE0_RST_N", /* GPIO_35 */
-		"PCIE0_CLKREQ_N", /* GPIO_36 */
-		"PCIE0_WAKE", /* GPIO_37 */
-		"SD_CARD_DET_N", /* GPIO_38 */
-		"TSIF1_SYNC", /* GPIO_39, S HSEC pin 48 */
-		"W_DISABLE_N", /* GPIO_40 */
-		"[BLSP9_UART_TX]", /* GPIO_41 */
-		"[BLSP9_UART_RX]", /* GPIO_42 */
-		"[BLSP2_UART_CTS_N]", /* GPIO_43 */
-		"[BLSP2_UART_RFR_N]", /* GPIO_44 */
-		"[BLSP3_UART_TX]", /* GPIO_45 */
-		"[BLSP3_UART_RX]", /* GPIO_46 */
-		"[I2C0_SDA]", /* GPIO_47, LS_I2C0_SDA, LSEC pin 17 */
-		"[I2C0_SCL]", /* GPIO_48, LS_I2C0_SCL, LSEC pin 15 */
-		"[UART0_TxD]", /* GPIO_49, BLSP9_UART_TX, LSEC pin 5 */
-		"[UART0_RxD]", /* GPIO_50, BLSP9_UART_RX, LSEC pin 7 */
-		"[UART0_CTS]", /* GPIO_51, BLSP9_UART_CTS_N, LSEC pin 3 */
-		"[UART0_RTS]", /* GPIO_52, BLSP9_UART_RFR_N, LSEC pin 9 */
-		"[CODEC_INT1_N]", /* GPIO_53 */
-		"[CODEC_INT2_N]", /* GPIO_54 */
-		"[BLSP7_I2C_SDA]", /* GPIO_55 */
-		"[BLSP7_I2C_SCL]", /* GPIO_56 */
-		"MI2S_MCLK", /* GPIO_57, S HSEC pin 3 */
-		"[PCM_CLK]", /* GPIO_58, QUA_MI2S_SCK, LSEC pin 18 */
-		"[PCM_FS]", /* GPIO_59, QUA_MI2S_WS, LSEC pin 16 */
-		"[PCM_DO]", /* GPIO_60, QUA_MI2S_DATA0, LSEC pin 20 */
-		"[PCM_DI]", /* GPIO_61, QUA_MI2S_DATA1, LSEC pin 22 */
-		"GPIO-E", /* GPIO_62, LSEC pin 27 */
-		"TP87", /* GPIO_63 */
-		"[CODEC_RST_N]", /* GPIO_64 */
-		"[PCM1_CLK]", /* GPIO_65 */
-		"[PCM1_SYNC]", /* GPIO_66 */
-		"[PCM1_DIN]", /* GPIO_67 */
-		"[PCM1_DOUT]", /* GPIO_68 */
-		"AUDIO_REF_CLK", /* GPIO_69 */
-		"SLIMBUS_CLK", /* GPIO_70 */
-		"SLIMBUS_DATA0", /* GPIO_71 */
-		"SLIMBUS_DATA1", /* GPIO_72 */
-		"NC", /* GPIO_73 */
-		"NC", /* GPIO_74 */
-		"NC", /* GPIO_75 */
-		"NC", /* GPIO_76 */
-		"TP94", /* GPIO_77 */
-		"NC", /* GPIO_78 */
-		"TP95", /* GPIO_79 */
-		"GPIO-A", /* GPIO_80, MEMS_RESET_N, LSEC pin 23 */
-		"TP88", /* GPIO_81 */
-		"TP89", /* GPIO_82 */
-		"TP90", /* GPIO_83 */
-		"TP91", /* GPIO_84 */
-		"[SD_DAT0]", /* GPIO_85, BLSP12_SPI_MOSI, P HSEC pin 1 */
-		"[SD_CMD]", /* GPIO_86, BLSP12_SPI_MISO, P HSEC pin 11 */
-		"[SD_DAT3]", /* GPIO_87, BLSP12_SPI_CS_N, P HSEC pin 7 */
-		"[SD_SCLK]", /* GPIO_88, BLSP12_SPI_CLK, P HSEC pin 9 */
-		"TSIF1_CLK", /* GPIO_89, S HSEC pin 42 */
-		"TSIF1_EN", /* GPIO_90, S HSEC pin 46 */
-		"TSIF1_DATA", /* GPIO_91, S HSEC pin 44 */
-		"NC", /* GPIO_92 */
-		"TSIF2_CLK", /* GPIO_93, S HSEC pin 52 */
-		"TSIF2_EN", /* GPIO_94, S HSEC pin 56 */
-		"TSIF2_DATA", /* GPIO_95, S HSEC pin 54 */
-		"TSIF2_SYNC", /* GPIO_96, S HSEC pin 58 */
-		"NC", /* GPIO_97 */
-		"CAM1_STANDBY_N", /* GPIO_98 */
-		"NC", /* GPIO_99 */
-		"NC", /* GPIO_100 */
-		"[LCD1_RESET_N]", /* GPIO_101, S HSEC pin 51 */
-		"BOOT_CONFIG1", /* GPIO_102 */
-		"USB_HUB_RESET", /* GPIO_103 */
-		"CAM1_RST_N", /* GPIO_104 */
-		"NC", /* GPIO_105 */
-		"NC", /* GPIO_106 */
-		"NC", /* GPIO_107 */
-		"NC", /* GPIO_108 */
-		"NC", /* GPIO_109 */
-		"NC", /* GPIO_110 */
-		"NC", /* GPIO_111 */
-		"NC", /* GPIO_112 */
-		"PMI8994_BUA", /* GPIO_113 */
-		"PCIE2_RST_N", /* GPIO_114 */
-		"PCIE2_CLKREQ_N", /* GPIO_115 */
-		"PCIE2_WAKE", /* GPIO_116 */
-		"SSC_IRQ_0", /* GPIO_117 */
-		"SSC_IRQ_1", /* GPIO_118 */
-		"SSC_IRQ_2", /* GPIO_119 */
-		"NC", /* GPIO_120 */
-		"GPIO121", /* GPIO_121, S HSEC pin 2 */
-		"NC", /* GPIO_122 */
-		"SSC_IRQ_6", /* GPIO_123 */
-		"SSC_IRQ_7", /* GPIO_124 */
-		"GPIO-C", /* GPIO_125, TS_INT0, LSEC pin 25 */
-		"BOOT_CONFIG5", /* GPIO_126 */
-		"NC", /* GPIO_127 */
-		"NC", /* GPIO_128 */
-		"BOOT_CONFIG7", /* GPIO_129 */
-		"PCIE1_RST_N", /* GPIO_130 */
-		"PCIE1_CLKREQ_N", /* GPIO_131 */
-		"PCIE1_WAKE", /* GPIO_132 */
-		"GPIO-L", /* GPIO_133, CAM2_STANDBY_N, LSEC pin 34 */
-		"NC", /* GPIO_134 */
-		"NC", /* GPIO_135 */
-		"BOOT_CONFIG8", /* GPIO_136 */
-		"NC", /* GPIO_137 */
-		"NC", /* GPIO_138 */
-		"GPS_SSBI2", /* GPIO_139 */
-		"GPS_SSBI1", /* GPIO_140 */
-		"NC", /* GPIO_141 */
-		"NC", /* GPIO_142 */
-		"NC", /* GPIO_143 */
-		"BOOT_CONFIG6", /* GPIO_144 */
-		"NC", /* GPIO_145 */
-		"NC", /* GPIO_146 */
-		"NC", /* GPIO_147 */
-		"NC", /* GPIO_148 */
-		"NC"; /* GPIO_149 */
-
-	sdc2_cd_on: sdc2-cd-on-state {
-		pins = "gpio38";
-		function = "gpio";
-		bias-pull-up;
-		drive-strength = <16>;
-	};
-
-	sdc2_cd_off: sdc2-cd-off-state {
-		pins = "gpio38";
-		function = "gpio";
-		bias-pull-up;
-		drive-strength = <2>;
-	};
-
-	hdmi_hpd_active: hdmi-hpd-active-state {
-		pins = "gpio34";
-		function = "hdmi_hot";
-		bias-pull-down;
-		drive-strength = <16>;
-	};
-
-	hdmi_hpd_suspend: hdmi-hpd-suspend-state {
-		pins = "gpio34";
-		function = "hdmi_hot";
-		bias-pull-down;
-		drive-strength = <2>;
-	};
-
-	hdmi_ddc_active: hdmi-ddc-active-state {
-		pins = "gpio32", "gpio33";
-		function = "hdmi_ddc";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	hdmi_ddc_suspend: hdmi-ddc-suspend-state {
-		pins = "gpio32", "gpio33";
-		function = "hdmi_ddc";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-};
-
-&pcie0 {
-	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	vddpe-3v3-supply = <&wlan_en>;
-	vdda-supply = <&vreg_l28a_0p925>;
-};
-
-&pcie1 {
-	status = "okay";
-	perst-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
-	vdda-supply = <&vreg_l28a_0p925>;
-};
-
-&pcie2 {
-	status = "okay";
-	perst-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
-	vdda-supply = <&vreg_l28a_0p925>;
-};
-
-&pcie_phy {
-	status = "okay";
-
-	vdda-phy-supply = <&vreg_l28a_0p925>;
-	vdda-pll-supply = <&vreg_l12a_1p8>;
-};
-
-&pm8994_gpios {
-	gpio-line-names =
-		"NC",
-		"KEY_VOLP_N",
-		"NC",
-		"BL1_PWM",
-		"GPIO-F", /* BL0_PWM, LSEC pin 28 */
-		"BL1_EN",
-		"NC",
-		"WLAN_EN",
-		"NC",
-		"NC",
-		"NC",
-		"NC",
-		"NC",
-		"NC",
-		"DIVCLK1",
-		"DIVCLK2",
-		"DIVCLK3",
-		"DIVCLK4",
-		"BT_EN",
-		"PMIC_SLB",
-		"PMIC_BUA",
-		"USB_VBUS_DET";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&ls_exp_gpio_f &bt_en_gpios>;
-
-	ls_exp_gpio_f: pm8994-gpio5-state {
-		pinconf {
-			pins = "gpio5";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			output-low;
-			power-source = <PM8994_GPIO_S4>; /* 1.8V */
-		};
-	};
-
-	bt_en_gpios: bt-en-pios-state {
-		pinconf {
-			pins = "gpio19";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			output-low;
-			power-source = <PM8994_GPIO_S4>; /* 1.8V */
-			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
-			bias-pull-down;
-		};
-	};
-
-	wlan_en_gpios: wlan-en-gpios-state {
-		pinconf {
-			pins = "gpio8";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			output-low;
-			power-source = <PM8994_GPIO_S4>; /* 1.8V */
-			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
-			bias-pull-down;
-		};
-	};
-
-	audio_mclk: clk-div1-state {
-		pinconf {
-			pins = "gpio15";
-			function = "func1";
-			power-source = <PM8994_GPIO_S4>; /* 1.8V */
-		};
-	};
-
-	volume_up_gpio: pm8996-gpio2-state {
-		pinconf {
-			pins = "gpio2";
-			function = "normal";
-			input-enable;
-			drive-push-pull;
-			bias-pull-up;
-			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-			power-source = <PM8994_GPIO_S4>; /* 1.8V */
-		};
-	};
-
-	divclk4_pin_a: divclk4-state {
-		pinconf {
-			pins = "gpio18";
-			function = PMIC_GPIO_FUNC_FUNC2;
-
-			bias-disable;
-			power-source = <PM8994_GPIO_S4>;
-		};
-	};
-
-	usb3_vbus_det_gpio: pm8996-gpio22-state {
-		pinconf {
-			pins = "gpio22";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			input-enable;
-			bias-pull-down;
-			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-			power-source = <PM8994_GPIO_S4>; /* 1.8V */
-		};
-	};
-};
-
-&pm8994_mpps {
-	gpio-line-names =
-		"VDDPX_BIAS",
-		"WIFI_LED",
-		"NC",
-		"BT_LED",
-		"PM_MPP05",
-		"PM_MPP06",
-		"PM_MPP07",
-		"NC";
-};
-
-&pm8994_spmi_regulators {
-	qcom,saw-reg = <&saw3>;
-	vdd_s11-supply = <&vph_pwr>;
-
-	s9 {
-		qcom,saw-slave;
-	};
-	s10 {
-		qcom,saw-slave;
-	};
-	s11 {
-		qcom,saw-leader;
-		regulator-name = "VDD_APCC";
-		regulator-always-on;
-		regulator-min-microvolt = <980000>;
-		regulator-max-microvolt = <980000>;
-	};
-};
-
-&pmi8994_gpios {
-	gpio-line-names =
-		"NC",
-		"SPKR_AMP_EN1",
-		"SPKR_AMP_EN2",
-		"TP61",
-		"NC",
-		"USB2_VBUS_DET",
-		"NC",
-		"NC",
-		"NC",
-		"NC";
-
-	usb2_vbus_det_gpio: pmi8996-gpio6-state {
-		pinconf {
-			pins = "gpio6";
-			function = PMIC_GPIO_FUNC_NORMAL;
-			input-enable;
-			bias-pull-down;
-			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-			power-source = <PM8994_GPIO_S4>; /* 1.8V */
-		};
-	};
-};
-
-&pmi8994_lpg {
-	qcom,power-source = <1>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pmi8994_mpp2_userled4>;
-
-	qcom,dtest = <0 0>,
-		     <0 0>,
-		     <0 0>,
-		     <4 1>;
-
-	status = "okay";
-
-	led@1 {
-		reg = <1>;
-		color = <LED_COLOR_ID_GREEN>;
-		function = LED_FUNCTION_HEARTBEAT;
-		function-enumerator = <1>;
-
-		linux,default-trigger = "heartbeat";
-		default-state = "on";
-	};
-
-	led@2 {
-		reg = <2>;
-		color = <LED_COLOR_ID_GREEN>;
-		function = LED_FUNCTION_HEARTBEAT;
-		function-enumerator = <0>;
-	};
-
-	led@3 {
-		reg = <3>;
-		color = <LED_COLOR_ID_GREEN>;
-		function = LED_FUNCTION_HEARTBEAT;
-		function-enumerator = <2>;
-	};
-
-	led@4 {
-		reg = <4>;
-		color = <LED_COLOR_ID_GREEN>;
-		function = LED_FUNCTION_HEARTBEAT;
-		function-enumerator = <3>;
-	};
-};
-
-&pmi8994_mpps {
-	pmi8994_mpp2_userled4: mpp2-userled4-state {
-		pins = "mpp2";
-		function = "sink";
-
-		output-low;
-		qcom,dtest = <4>;
-	};
-};
-
-&pmi8994_spmi_regulators {
-	vdd_s2-supply = <&vph_pwr>;
-
-	vdd_gfx: s2 {
-		regulator-name = "VDD_GFX";
-		regulator-min-microvolt = <980000>;
-		regulator-max-microvolt = <980000>;
-	};
-};
-
-&rpm_requests {
-	regulators-0 {
-		compatible = "qcom,rpm-pm8994-regulators";
-
-		vdd_s1-supply = <&vph_pwr>;
-		vdd_s2-supply = <&vph_pwr>;
-		vdd_s3-supply = <&vph_pwr>;
-		vdd_s4-supply = <&vph_pwr>;
-		vdd_s5-supply = <&vph_pwr>;
-		vdd_s6-supply = <&vph_pwr>;
-		vdd_s7-supply = <&vph_pwr>;
-		vdd_s8-supply = <&vph_pwr>;
-		vdd_s9-supply = <&vph_pwr>;
-		vdd_s10-supply = <&vph_pwr>;
-		vdd_s11-supply = <&vph_pwr>;
-		vdd_s12-supply = <&vph_pwr>;
-		vdd_l1-supply = <&vreg_s1b_1p025>;
-		vdd_l2_l26_l28-supply = <&vreg_s3a_1p3>;
-		vdd_l3_l11-supply = <&vreg_s3a_1p3>;
-		vdd_l4_l27_l31-supply = <&vreg_s3a_1p3>;
-		vdd_l5_l7-supply = <&vreg_s5a_2p15>;
-		vdd_l6_l12_l32-supply = <&vreg_s5a_2p15>;
-		vdd_l8_l16_l30-supply = <&vph_pwr>;
-		vdd_l9_l10_l18_l22-supply = <&vph_pwr_bbyp>;
-		vdd_l13_l19_l23_l24-supply = <&vph_pwr_bbyp>;
-		vdd_l14_l15-supply = <&vreg_s5a_2p15>;
-		vdd_l17_l29-supply = <&vph_pwr_bbyp>;
-		vdd_l20_l21-supply = <&vph_pwr_bbyp>;
-		vdd_l25-supply = <&vreg_s3a_1p3>;
-		vdd_lvs1_2-supply = <&vreg_s4a_1p8>;
-
-		vreg_s3a_1p3: s3 {
-			regulator-name = "vreg_s3a_1p3";
-			regulator-min-microvolt = <1300000>;
-			regulator-max-microvolt = <1300000>;
-		};
-
-		/**
-		 * 1.8v required on LS expansion
-		 * for mezzanine boards
-		 */
-		vreg_s4a_1p8: s4 {
-			regulator-name = "vreg_s4a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
-		vreg_s5a_2p15: s5 {
-			regulator-name = "vreg_s5a_2p15";
-			regulator-min-microvolt = <2150000>;
-			regulator-max-microvolt = <2150000>;
-		};
-		vreg_s7a_1p0: s7 {
-			regulator-name = "vreg_s7a_1p0";
-			regulator-min-microvolt = <800000>;
-			regulator-max-microvolt = <800000>;
-		};
-
-		vreg_l1a_1p0: l1 {
-			regulator-name = "vreg_l1a_1p0";
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-		vreg_l2a_1p25: l2 {
-			regulator-name = "vreg_l2a_1p25";
-			regulator-min-microvolt = <1250000>;
-			regulator-max-microvolt = <1250000>;
-		};
-		vreg_l3a_0p875: l3 {
-			regulator-name = "vreg_l3a_0p875";
-			regulator-min-microvolt = <850000>;
-			regulator-max-microvolt = <850000>;
-		};
-		vreg_l4a_1p225: l4 {
-			regulator-name = "vreg_l4a_1p225";
-			regulator-min-microvolt = <1225000>;
-			regulator-max-microvolt = <1225000>;
-		};
-		vreg_l6a_1p2: l6 {
-			regulator-name = "vreg_l6a_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-		};
-		vreg_l8a_1p8: l8 {
-			regulator-name = "vreg_l8a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l9a_1p8: l9 {
-			regulator-name = "vreg_l9a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l10a_1p8: l10 {
-			regulator-name = "vreg_l10a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l11a_1p15: l11 {
-			regulator-name = "vreg_l11a_1p15";
-			regulator-min-microvolt = <1150000>;
-			regulator-max-microvolt = <1150000>;
-		};
-		vreg_l12a_1p8: l12 {
-			regulator-name = "vreg_l12a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l13a_2p95: l13 {
-			regulator-name = "vreg_l13a_2p95";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2950000>;
-		};
-		vreg_l14a_1p8: l14 {
-			regulator-name = "vreg_l14a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l15a_1p8: l15 {
-			regulator-name = "vreg_l15a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l16a_2p7: l16 {
-			regulator-name = "vreg_l16a_2p7";
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2700000>;
-		};
-		vreg_l17a_2p8: l17 {
-			regulator-name = "vreg_l17a_2p8";
-			regulator-min-microvolt = <2500000>;
-			regulator-max-microvolt = <2500000>;
-		};
-		vreg_l18a_2p85: l18 {
-			regulator-name = "vreg_l18a_2p85";
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2900000>;
-		};
-		vreg_l19a_2p8: l19 {
-			regulator-name = "vreg_l19a_2p8";
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-		};
-		vreg_l20a_2p95: l20 {
-			regulator-name = "vreg_l20a_2p95";
-			regulator-min-microvolt = <2950000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-allow-set-load;
-		};
-		vreg_l21a_2p95: l21 {
-			regulator-name = "vreg_l21a_2p95";
-			regulator-min-microvolt = <2950000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-allow-set-load;
-			regulator-system-load = <200000>;
-		};
-		vreg_l22a_3p0: l22 {
-			regulator-name = "vreg_l22a_3p0";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-		};
-		vreg_l23a_2p8: l23 {
-			regulator-name = "vreg_l23a_2p8";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-		};
-		vreg_l24a_3p075: l24 {
-			regulator-name = "vreg_l24a_3p075";
-			regulator-min-microvolt = <3075000>;
-			regulator-max-microvolt = <3075000>;
-		};
-		vreg_l25a_1p2: l25 {
-			regulator-name = "vreg_l25a_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-allow-set-load;
-		};
-		vreg_l26a_0p8: l27 {
-			regulator-name = "vreg_l26a_0p8";
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-		vreg_l28a_0p925: l28 {
-			regulator-name = "vreg_l28a_0p925";
-			regulator-min-microvolt = <925000>;
-			regulator-max-microvolt = <925000>;
-			regulator-allow-set-load;
-		};
-		vreg_l29a_2p8: l29 {
-			regulator-name = "vreg_l29a_2p8";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-		};
-		vreg_l30a_1p8: l30 {
-			regulator-name = "vreg_l30a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l32a_1p8: l32 {
-			regulator-name = "vreg_l32a_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		vreg_lvs1a_1p8: lvs1 {
-			regulator-name = "vreg_lvs1a_1p8";
-		};
-
-		vreg_lvs2a_1p8: lvs2 {
-			regulator-name = "vreg_lvs2a_1p8";
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,rpm-pmi8994-regulators";
-
-		vdd_s1-supply = <&vph_pwr>;
-		vdd_s2-supply = <&vph_pwr>;
-		vdd_s3-supply = <&vph_pwr>;
-		vdd_bst_byp-supply = <&vph_pwr>;
-
-		vph_pwr_bbyp: boost-bypass {
-			regulator-name = "vph_pwr_bbyp";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		vreg_s1b_1p025: s1 {
-			regulator-name = "vreg_s1b_1p025";
-			regulator-min-microvolt = <1025000>;
-			regulator-max-microvolt = <1025000>;
-		};
-	};
-};
-
-&sdhc2 {
-	/* External SD card */
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sdc2_state_on &sdc2_cd_on>;
-	pinctrl-1 = <&sdc2_state_off &sdc2_cd_off>;
-	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
-	vmmc-supply = <&vreg_l21a_2p95>;
-	vqmmc-supply = <&vreg_l13a_2p95>;
-	status = "okay";
-};
-
-&q6asmdai {
-	dai@0 {
-		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
-	};
-
-	dai@1 {
-		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
-	};
-
-	dai@2 {
-		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
-	};
-};
-
-&slim_msm {
-	status = "okay";
-
-	slim@1 {
-		reg = <1>;
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		tasha_ifd: tas-ifd@0,0 {
-			compatible = "slim217,1a0";
-			reg = <0 0>;
-		};
-
-		wcd9335: codec@1,0 {
-			compatible = "slim217,1a0";
-			reg = <1 0>;
-
-			clock-names = "mclk", "slimbus";
-			clocks = <&div1_mclk>,
-				 <&rpmcc RPM_SMD_BB_CLK1>;
-			interrupt-parent = <&tlmm>;
-			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>,
-				     <53 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "intr1", "intr2";
-			interrupt-controller;
-			#interrupt-cells = <1>;
-
-			pinctrl-0 = <&cdc_reset_active &wcd_intr_default>;
-			pinctrl-names = "default";
-
-			reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
-			slim-ifc-dev = <&tasha_ifd>;
-
-			#sound-dai-cells = <1>;
-
-			vdd-buck-supply = <&vreg_s4a_1p8>;
-			vdd-buck-sido-supply = <&vreg_s4a_1p8>;
-			vdd-tx-supply = <&vreg_s4a_1p8>;
-			vdd-rx-supply = <&vreg_s4a_1p8>;
-			vdd-io-supply = <&vreg_s4a_1p8>;
-		};
-	};
-};
-
-&sound {
-	compatible = "qcom,apq8096-sndcard";
-	model = "DB820c";
-	audio-routing = "RX_BIAS", "MCLK";
-
-	mm1-dai-link {
-		link-name = "MultiMedia1";
-		cpu {
-			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
-		};
-	};
-
-	mm2-dai-link {
-		link-name = "MultiMedia2";
-		cpu {
-			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
-		};
-	};
-
-	mm3-dai-link {
-		link-name = "MultiMedia3";
-		cpu {
-			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
-		};
-	};
-
-	hdmi-dai-link {
-		link-name = "HDMI";
-		cpu {
-			sound-dai = <&q6afedai HDMI_RX>;
-		};
-
-		platform {
-			sound-dai = <&q6routing>;
-		};
-
-		codec {
-			sound-dai = <&mdss_hdmi 0>;
-		};
-	};
-
-	slim-dai-link {
-		link-name = "SLIM Playback";
-		cpu {
-			sound-dai = <&q6afedai SLIMBUS_6_RX>;
-		};
-
-		platform {
-			sound-dai = <&q6routing>;
-		};
-
-		codec {
-			sound-dai = <&wcd9335 AIF4_PB>;
-		};
-	};
-
-	slimcap-dai-link {
-		link-name = "SLIM Capture";
-		cpu {
-			sound-dai = <&q6afedai SLIMBUS_0_TX>;
-		};
-
-		platform {
-			sound-dai = <&q6routing>;
-		};
-
-		codec {
-			sound-dai = <&wcd9335 AIF1_CAP>;
-		};
-	};
-};
-
-&ufsphy {
-	status = "okay";
-
-	vdda-phy-supply = <&vreg_l28a_0p925>;
-	vdda-pll-supply = <&vreg_l12a_1p8>;
-};
-
-&ufshc {
-	status = "okay";
-
-	vcc-supply = <&vreg_l20a_2p95>;
-	vccq-supply = <&vreg_l25a_1p2>;
-	vccq2-supply = <&vreg_s4a_1p8>;
-	vdd-hba-supply = <&vreg_l25a_1p2>;
-
-	vcc-max-microamp = <600000>;
-	vccq-max-microamp = <450000>;
-	vccq2-max-microamp = <450000>;
-};
-
-&usb2 {
-	status = "okay";
-	extcon = <&usb2_id>;
-};
-
-&usb2_dwc3 {
-	extcon = <&usb2_id>;
-	dr_mode = "otg";
-	maximum-speed = "high-speed";
-};
-
-&usb3 {
-	status = "okay";
-	extcon = <&usb3_id>;
-};
-
-&usb3_dwc3 {
-	extcon = <&usb3_id>;
-	dr_mode = "otg";
-};
-
-&usb3phy {
-	status = "okay";
-
-	vdda-phy-supply = <&vreg_l28a_0p925>;
-	vdda-pll-supply = <&vreg_l12a_1p8>;
-};
-
-&venus {
-	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/qcom/apq8096-db820c.dts
copy to arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 9fa70ff6887b78caf1826f653a5caccd9653269c..0c076852b4946a4d1b67b25dff434cf207469acb 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -3,9 +3,7 @@
  * Copyright (c) 2014-2016, The Linux Foundation. All rights reserved.
  */
 
-/dts-v1/;
 
-#include "msm8996.dtsi"
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
 #include <dt-bindings/input/input.h>
@@ -44,9 +42,6 @@
  */
 
 / {
-	model = "Qualcomm Technologies, Inc. DB820c";
-	compatible = "arrow,apq8096-db820c", "qcom,apq8096-sbc", "qcom,apq8096";
-
 	aliases {
 		serial0 = &blsp2_uart2;
 		serial1 = &blsp2_uart3;
diff --git a/arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts
new file mode 100644
index 0000000000000000000000000000000000000000..f3ab5a7c6e53a1925fa6e11ae7acf940d47dc4ee
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "msm8996pro.dtsi"
+#include "apq8096-db820c.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. DB820c";
+	compatible = "arrow,apq8096sg-db820c", "arrow,apq8096-db820c",
+		"qcom,apq8096-sbc", "qcom,apq8096sg", "qcom,apq8096";
+};

-- 
2.47.3


