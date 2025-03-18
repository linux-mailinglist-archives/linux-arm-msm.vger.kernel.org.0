Return-Path: <linux-arm-msm+bounces-51768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BEAA67855
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799623B428F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6981220FABA;
	Tue, 18 Mar 2025 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZdLOxiP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8971220F078
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742313053; cv=none; b=imIGfOoDVnmtvhhk5uAUFud9clqUemO9thKW1COG44WqnUJagVMAPC4ouUmrg4aUOgAhvZf47qyJeK1R7+Fb6D7On9qK7a+e8gIOjz5u+ne3ike0arxy0a1l7Eia1pH/WOY8jMA2rwegUpdaMX4KmZ6CWDLcsN2sbQypOsaRmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742313053; c=relaxed/simple;
	bh=A1OR0H/3leTyQG7s8erz2iVyGAt5XrNq/unx0Esos7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qcJGLhkyV3+QOSmrwVQM5+gQ07GOyeg3zd9oYXPuOE//lP78UssTKv0MFVVn6+Qx7VTrBz+3CTgN3YMMjF3kqfsk0kv3IZ9+axTZFbZhJ+igakF3omV+TPyZ/K7LiMjVn1EvxHT2U5bzDYG1XsJnN3bFHM6VZcXk2TI3AdgGhMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZdLOxiP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7430e27b2so1109195566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742313049; x=1742917849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0H+othSZYzBFGTxHhK8oQHRlThHzu/xnHIsmmLyzv3g=;
        b=iZdLOxiPsH5K+3zL7/j6d+uV4cJg/IILFp3sQhDiCnr0Nc3m7FrCcbEeer6QjPx0uj
         HyamZ0wXyvFJO0cNlBjDjFuvDTn728hqFl4cls2ZAmsWBnXZQo/GZMEEvZ/ctCSJTYr3
         Q6Uee5kbdNOygvFQ7tyB/3Z9zjN5+9wmTXpvHwDjgs6v2NvPo14bzI2LDrMPJJOkaYu4
         Lod/Ayj7pLVc/kpMPiVpjudWFfYesbGecJT+5FxBEPVivQH68rY2w1FTAc8ZMjTsMdvJ
         wl7Temdj4OGefBjrxYFSduP2LgIL0+V8dbiGtGUzqyVxC4AWbFmae8dW9VNn+jH7j3t8
         oz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742313049; x=1742917849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0H+othSZYzBFGTxHhK8oQHRlThHzu/xnHIsmmLyzv3g=;
        b=NQMI3AlZ8towSm/mN/GHddAMNw0GcJUOFTg/9pA3mqRGxpQIPQVMSm9/NvLgijOsIz
         cpn1payhi3Zg+k9CpZy0AHT0HCmo8W0jYGOMMTZLxCPyHP3OD/SycCMaGcjSQiYrZxav
         BrnB1RDJIQxy9lmCVtulmUPGg2ZXFKPzQ8xjnXn6hYYIIhIK9Rn5Xe+MFLM0dXmweRcB
         wuQ6jnppF+WcqR719uGGeL7RnOgTw3Rlggwn7ZH4zIxrn1l+M+8BkDoIZdRh8wa3d56f
         qowVwoRbBmFVUOACmesF2uKhya6aNJRC4gbg2EWoM0qTPruaZgYhqWkGRj8c29Qs0LfK
         K1ng==
X-Forwarded-Encrypted: i=1; AJvYcCVh4ReGeI/PmyEHCQJqpDCN9QXe0qTE6moMXEoaiM7ciPy6lmuGCwviyfx5OJ1d/KEDKv+K9B60kQY8CJ4R@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/m2JO26l7+NcUzhcVO1bcYedfe+fYftNS1vM3Lendx9p6Ky1
	BQ/1pieanX8qM6gl0S5FOIs+92IJ5p/moqlCUpTL9qEiNvxQO+/FpYtM4/W0T+Y=
X-Gm-Gg: ASbGncuQlnh1KUYEyQ6avjL5xj23YfNk4FHGOIqVGuOBKgdYUsjSj5FjompmIhpXH8g
	QVK8wuGk4pF/2Lk1RNtHDzRS32z3JkocslJfSxpzlPhvD0VxIenBMCScCXB+I7PEITSwbyfLdOm
	a/Qy0AkSZOop7RmL7rB3LLnBL/H2Lw/JiYdn7+gER5NHacr9/9CIBp/a5VToBEVk9wkktfUDXnX
	TC8qrcWdYN0/PdgrWJcAXlooPbdKeb5UQHi+oNOYwUhe/2OKMWpASsaBZqiCNRVCkfCKxLSqBEa
	DjGEFup6sQ7DMtSyg93SjPdwaRIHLM9zWMzgnWwPL5I=
X-Google-Smtp-Source: AGHT+IFT+vh4QBZ27nVEv3St3YB6igseP/3SRDvJ7M0MlLPN6tXiv/kSeMAh+nAat+5e6JRpbNK4+g==
X-Received: by 2002:a17:907:1b0b:b0:ac3:413b:69c7 with SMTP id a640c23a62f3a-ac38d514670mr507582666b.39.1742313048692;
        Tue, 18 Mar 2025 08:50:48 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0077sm875615566b.93.2025.03.18.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:50:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 18 Mar 2025 17:50:34 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: x1e001de-devkit: Describe USB
 retimers resets pin configs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-1-1c092f630b0c@linaro.org>
References: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
In-Reply-To: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2185; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=A1OR0H/3leTyQG7s8erz2iVyGAt5XrNq/unx0Esos7M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBn2ZZSaIbWgeSu7BTFdoWbR6fG6Wj3kRg5HHfRJ
 La4Mv4iL1iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ9mWUgAKCRAbX0TJAJUV
 VqKTEAC4rt+V0YM6TLUvd9y7/AXgScQFSm/uvom2OKEwnnHK0FleH1ag4xSOYzdEvAfuN2kM+zv
 eHvHMfedhRgxruW1rNBZtZa5SN84b7bOn1lk5WjY+CixsKKs3v2twYIHNBJePCgBUbd9+spVSFd
 Gc0Hplg0axgQD8hCuign9TBDMOBp6yEzRJAsDB2cK9JBSDy9I9YnHFgrvQYgEI6uR25ch3cM+kk
 kfXqt8zcwggRKPPJV344npf0dPw/t0EXlSjr1IEy/PCUZcHDFwD6lYQ9w9vGvVyet/G05GY60jF
 ivQwiLUO0RtN+NqBElBr2RiexyyrIcFqcXLI9aCEPadBy5Kt+OrRK8Fg8G8vPcX4IDaxmhbk/UG
 nF8fmYNA2+Pms+LwyF5FM0GUY3GCWxBtiBgjP5rqMGTqcSUCiyFVrkhXl0mVO/Lh3PdTsBZrVqP
 PBvYwqr8Tw+9ICu7xQv7M+XDqZUDBtaz/gOYwksW1ofmQQ1tApDOw9sYtS0DDi20jmTqiDXhkFE
 vSZ/wZkEvdfBp9oVrVtZLk50X6/fFNlHmo0iepqUzyaHPZHmWr0U1dgo/RsVyJpTOBTGy495Syh
 yyvVa6uE7qvoVG4j4ViXcxKSNZQArkkZrYXfdhXHRYGTG2x4RYzsaI/brnh+WxlO8ePCvs0Zb4Y
 zJVJkMgCwSA/pSw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, on the X Elite Devkit, the pin configuration of the reset
gpios for all three PS8830 USB retimers are left configured by the
bootloader.

Fix that by describing their pin configuration.

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 74911861a3bf2606add8cf4aaa3816542e837513..902335396c586a991c4a2de19906b039d887780f 100644
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
+		power-source = <1>; /* 1.8V */
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


