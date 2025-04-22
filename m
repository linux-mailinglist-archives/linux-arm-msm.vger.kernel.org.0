Return-Path: <linux-arm-msm+bounces-54932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4EDA96747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2BE63ADD41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA4427C157;
	Tue, 22 Apr 2025 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9rZFv5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59727BF74
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321143; cv=none; b=e82UGhA8CW0q7r453ChPwt4so9sXoLghRTBcL88udoDyMgOpz2wzeZnRL09C2qnTy0A6DNoVz4nUtsmll0zsFXxiCU0X65ySaYg465VczZnDM285/qqBmTFU6Jao4wwbEgplQunxgKVvaKLaM+RaUoAO7S73tkmsbbXea6OUlGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321143; c=relaxed/simple;
	bh=ZgUctIQTYjWrXxfNyYBxpGZo3m0nZVj0c8WONv4n52c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sS+Ecwmn4cqp6WyXQIILEwkBrKZXyHLT0kwpQ+HAyPJ0zkFQW1H1PIEtSo7rTi+wJbpLTafR9U8ko6XdkH/T1r2vwinQLyHWXEmsFLKtvcekqtcXrNK+PctV8nFrvpNnrRg6kWBbESXQGYpJFol4DQupMFW7eu3OwW7BcoMUE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9rZFv5n; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso10588076a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321140; x=1745925940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVK6SAMdQtK0FFO3trNDw7APCuecG0j/aMOLgynyWRQ=;
        b=k9rZFv5ncRCqZCBBGx/YPgkpc3Ql1QBEpk9K1u7fR3vLwT2gXUuKDSjGGhitv4hOHZ
         Aro4qvJwIVgFepQJOoxgGk+KiBjC7xri6f6XjFF0BVKXcV64h3wXYjpl4BOEaiNCygt0
         /Oui2zYjCYDTfWn+AMypbDPcVVjpJYKAMuyR7V4y4jkbcG1X+45w+fIVLfk6frt1sTUA
         V7vvm3dy5G2zl0tw4dpAjjq659e+I+s3zZ+KhXiw2SaFeD7qU1n/gRbz3JF2GNvLjQbv
         Vot08vuNdiRC3fXRVKLXgQlUBAepj3IZO3Ou3QH8nHYCBn/RzYhHJxF+Pibz9iF9GGEJ
         mh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321140; x=1745925940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVK6SAMdQtK0FFO3trNDw7APCuecG0j/aMOLgynyWRQ=;
        b=JzR/fZ2B+eUviNXdsoxxf91kP9C2hPpSEC4xsXcVln1nwMIrPW8gV4AnCzG7h2sWsW
         I+5jKCEZD4Hbs7hLJBShp3rKyMg5iL94PUKOzSegUMx22H6NN4SWBvy3EhGpmQqD6Sdi
         BYiU5yLcc4eXPyvebLlXNlDFE52Ha2YLd6hi0m1UJLQaLjlDjSmUg3Xr85srfeb017pY
         XvekfJoT6vJVP32j6mfJztjJlZ2Hnp0zLOJOD4Z/LY+ux8NKtnOzC5W/FjTM8XpYcw22
         aJU/8mowygg83GhFw3FToxVh8peV55FRrShZzdkN2in2sb6TNYHcUpclP8rNi4KT4/0D
         uJGg==
X-Forwarded-Encrypted: i=1; AJvYcCWhXFAltMxWxYf3+VrAUC5ZzeCNFPSNl2pIV2fky5lr/VRO+gBC/3FH8RR3ybj5uHqSB650x2jNPTDZ1ERo@vger.kernel.org
X-Gm-Message-State: AOJu0YxMw6OwEWssZjaQ4+KSsRMiLiItYuFRswuCi4pQkAvHnflcUlhS
	A4q73KnOggIlPXIDHpwHHD+5U7kuCfYSAiNmXUv4c5S3+dKBfxW+8CHfGjBtWSg=
X-Gm-Gg: ASbGnctEiY+Nf6ion/+lGm08ZBhm9fOiH4A7tLC4gpfyFU2wOTaZuhwHDaeRhnQweNP
	WXKL0gUmHPePAXCB0r4ktx+WhlhEWR9Xqajzy0Oz0eDMxjD6m5qnsfdkRLkboXmCa49Q1ATalaH
	RhMgaWRutzC9kuExzKYa9RRfJ4gpAUi/eQhh0IPq1bJxjL/OwTIgwhENfv6cmMKpxSEda/V8evf
	eLyoE+jARfKjyBO3aRAzA30uTs2VsUEYXrmtXGR3gN1xKdxBUBWInj0DEyV9HZ5kCiVUvYW1bqp
	pmSun+7paplarHRDz7Dd9dDHbSrO5XqFbMN3NYA=
X-Google-Smtp-Source: AGHT+IGFak/38L5C9a/ywlZnr61etyWEsgyGtnyILz14A2eKTkDqB2+k60+UZb924U/AV1523eF9sg==
X-Received: by 2002:a17:906:f590:b0:aca:aeb4:938e with SMTP id a640c23a62f3a-acb75120039mr1221113166b.8.1745321139737;
        Tue, 22 Apr 2025 04:25:39 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef45784sm630692366b.129.2025.04.22.04.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:25:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 22 Apr 2025 14:25:22 +0300
Subject: [PATCH v2 1/2] arm64: dts: qcom: x1e001de-devkit: Describe USB
 retimers resets pin configs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-1-0129c4f2b6d7@linaro.org>
References: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
In-Reply-To: <20250422-x1e001de-devkit-dts-fix-retimer-gpios-v2-0-0129c4f2b6d7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ZgUctIQTYjWrXxfNyYBxpGZo3m0nZVj0c8WONv4n52c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoB3ys6pR51rXun/I4Lejqlq8TRZIAVAIHHczS/
 I9tqMz00xWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaAd8rAAKCRAbX0TJAJUV
 VjEbD/9vdJtQUMnw32dowM67hrTvuQO4yOFlEv89ZQVN7fmGRR36YU7eW6FLhH+resuFrTEaAuO
 mA8gYg+L0yXu19yAImIMhzSkTsRpshtCwgw09eWVAJgLYZ92zOvtxh+gsk9D/E2fikYTT2y49Vi
 sKWp/ZaR4svDlClJsERb9o75EKsnLtIq72YQtJ2G4YugaoIUL67GBpjSo2EHtnNMQcxicQ4KBpK
 BreQyPN9upDcPJLRyOaMpiVk+GFf9nqx+PchV5Bhtcw93xcRS89ZRY1EmFoW0G3Ug2DkPtFlvhu
 pWL7i/dtFdKQxaQMCyfM0FDESkyqjryC8aqdL/Ht/5H1zFVET1mc9AFYHBpl93eKP5B618nl+5w
 ppfUzuRItT9aj6JGMlUpd2VfQM9W29901bKcPJJYmzpXheZctdYbJV+bXByzzccDONMY4HRukMT
 5ErkIOcQTPxzjH3YbVmxUOSY0OinH5D+6Ho/t5JDXDXnUefG7J/yVvZcALf+RkcvMSBMzoXWZtN
 tA+a0Xn7zHyEcV0aHMjRGw3hpzE56E6k134/+iH4iKProLBhLng7FKlmb7q+wv/nXpYJXTi4SDB
 moGiSITGw7FSmAgQSBSi8x7U+9FwohSHgYxzacuM+M6CdRRp55L17h+LBsmdgbn940K2KTr1vT3
 NmY4g8FTiEPsFsQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, on the X Elite Devkit, the pin configuration of the reset
gpios for all three PS8830 USB retimers are left configured by the
bootloader.

Fix that by describing their pin configuration.

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 74911861a3bf2606add8cf4aaa3816542e837513..13516ae253fea6a7872da6c48bcf91eb95167a42 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -789,6 +789,9 @@ typec-mux@8 {
 
 		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
 
+		pinctrl-0 = <&rtmr2_default>;
+		pinctrl-names = "default";
+
 		orientation-switch;
 		retimer-switch;
 
@@ -843,6 +846,9 @@ typec-mux@8 {
 
 		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
 
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
 		retimer-switch;
 		orientation-switch;
 
@@ -897,6 +903,9 @@ typec-mux@8 {
 
 		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
 
+		pinctrl-0 = <&rtmr1_default>;
+		pinctrl-names = "default";
+
 		retimer-switch;
 		orientation-switch;
 
@@ -1018,6 +1027,15 @@ &pcie6a_phy {
 };
 
 &pm8550_gpios {
+	rtmr0_default: rtmr0-reset-n-active-state {
+		pins = "gpio10";
+		function = "normal";
+		power-source = <1>; /* 1.8 V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
 	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
 		pins = "gpio11";
 		function = "normal";
@@ -1205,6 +1223,20 @@ wake-n-pins {
 		};
 	};
 
+	rtmr1_default: rtmr1-reset-n-active-state {
+		pins = "gpio176";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr2_default: rtmr2-reset-n-active-state {
+		pins = "gpio185";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	rtmr1_1p15_reg_en: rtmr1-1p15-reg-en-state {
 		pins = "gpio188";
 		function = "gpio";

-- 
2.34.1


