Return-Path: <linux-arm-msm+bounces-21133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B98D4F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68A1AB28037
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 15:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013B31862BB;
	Thu, 30 May 2024 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOSw0XBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9F6186293
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717083837; cv=none; b=I5xQgbNHeVgvvs9+DllySRNQ+p01rxnAqi+IzvOGuyRIepuar1ygvP4aUJT+mCUVWj5vT9iNBzpkN0TSIaOtAWmX9HCnwUuZQmbDtZxfjngIQec3lb6OcQLcTXwxVFqSfKXsqQXu7aASUwSnAyKkJSyDojJXaBZo7YJh/WjnR64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717083837; c=relaxed/simple;
	bh=1LTJ1ZbHYVIiunTosxnkif5rOzcNdAVdISpvTDGmP+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3DF+Iwvp1KwgIEroJP12Bf+mWKvIcqk79zaJq5oIv43RRbQ7OWmZD+6E9LbnD3eifJOmOmT3Ed/n/voYpCL+kjxLO2zNKekVjiEePu7I0F3pKUv1pn3xk66ALWtLuZlh6bHlK1pRhdod0+L79ERl83u/YyRcDGgP1ccy/e0S+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOSw0XBF; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e9819a6327so12186931fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717083834; x=1717688634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EB2qCn5UGV9aqEQdkg+7453N3Kl73IeR9N5SJgjDlZA=;
        b=MOSw0XBFxKosNI7CmEuiyqnisXNwCoPWoY1+ypwgQg5f6RwCvGAiEsBPzLc9SnMHyW
         3UXC+SEeXmM9/g19zIMVF06tfj22G2/XJEEkc/bKUkjejGJXk3gto0winJ+1t/NYVEH9
         ushOzckZQOnkDqbRBAWMQbNMecuIIwsPx3FreQqigppjCHumdOcbVubVdjb1Rv3psZQf
         lhcb4U8La6NZA99YXK2KtdvOObN5dGxSWRkmHI6Alw+G1nHZL6ZctKJI5wxokeLFTV+y
         Th4OWaQzjn3E4z2s5kEWKLc5BrzwMcieQ4x69SX4rOXLhjLQoNTYFjVa71EyVslLztme
         +SGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717083834; x=1717688634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EB2qCn5UGV9aqEQdkg+7453N3Kl73IeR9N5SJgjDlZA=;
        b=WC/2rJMgl1EZ2/YZWrQa5XuFbrjjKpDLrKcshUwp66+rxRwQzTDMU1mliSZxMso8+o
         l3rwJftVtoPRaG2x/07SmkK4ZEe8HYOkJ7nx2pqbvSWBbwbn7hXz1BTzRjy2E76XTpSN
         Yki06faRiI/lljgsDb3PPJFyBqjHb7A67ykdeQ5LtOVXgeyAFiA4Au2+3zKo/6D1ll8q
         nUX6O1JIfc0vPB/brTkdg61Rm5AgRyll+e+aUUzs0CtddMudSqveCPNbgR9tOF8ZL0aN
         ueJOSA/OZ3GcyBUo3IcBRMe1PNN2RTw+ylxtS2zqBWCoPWrTyMWzO41kgT39VcQ3jP7L
         9b4Q==
X-Gm-Message-State: AOJu0Yx657n3hHZ7/Pkk/ewNA8pZpv+unIoSAKwf452uJXZbXTfDqOF/
	Qc/YT/cJSZYsPYkTv4LGMjsNFOV9J0FLLhRIFe2FnxeIRJ3uA9ZDwDkCSs9SEnQ=
X-Google-Smtp-Source: AGHT+IE9RqDBgAa9w5lbGC/woJK3bS0VJZz4UwnYIRaetdKK7Bsv/24VfWtedXzFLf8LE6feJRopIA==
X-Received: by 2002:a19:9107:0:b0:52b:8435:8f22 with SMTP id 2adb3069b0e04-52b84358fb1mr159455e87.36.1717083833902;
        Thu, 30 May 2024 08:43:53 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579deb8f406sm4879700a12.34.2024.05.30.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:43:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 30 May 2024 18:43:41 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100: Describe the PCIe 6a
 resources
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-x1e80100-dts-pcie6a-v1-3-ee17a9939ba5@linaro.org>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3861; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=1LTJ1ZbHYVIiunTosxnkif5rOzcNdAVdISpvTDGmP+4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWJ6zBz/myBiTnzwAi5HLTb6p8fI3Q7PU4Wm4R
 KK7hJ76asSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZlieswAKCRAbX0TJAJUV
 VnGaD/9Ia2Vi5BnGohM0XdArqmAz+X5XQeQ0Mqd3Cljv5YYfZVhAwscEanXwSYbDMZf2ZXpnHrs
 suNKoS3MtEgCLYxirTIMG427DOxCk1EVlzj8gv1I8EY9/4hQ6LfYSoK59w4033YiVHZw+Ay0RKN
 IoOhPP5bEu/gM17W5nY5fMY9boFYSWIEM53WyCyzz6HmirklhjzBJW5ouIG16hAyE5jBKo6E7G4
 siFPLQWqEfcFiSENAu1qqvH0hOfWDxBsvcDVXxGbyRETIRNbOVMVyiMIttbwYSUvUTC5bvTnft2
 Pgv1AVP3DtxxHkCyF/205qNUe1TsA6JtuYOAUCXkE5YIjysucznE5ARODt8ZlKvpP8jbIDQco3r
 36QZ3vdEX8+jPllbll934E8PcYHkG++DsyhMG26VOZLoCexx3nM7SoGQyAnKH8/zD8Si1p3ZThE
 1E2/86D2unl3PmduOSPy3QeYX4gy2UH7QmZ5W27k8yL6o+LDuRpvESpwvt1zTsIwztOVIHM9ODS
 yqGXYGKJzB/3ZPSOPDcuuNRuxVI0bbkkFuzZKzgDfYp6sUOVFpq/KmPq4TqT+5yL4FTB8Hc8JIJ
 5vc6P7zvIFN7F2WeYA3QTrCfclVvt309NxKcEbOiNMmrL3Kppdi1mIn2vEiTlgfkIKZQlojIg2W
 LW3uIDxWnIQ4k1Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On both the CRD and QCP, on PCIe 6a sits the NVMe. Add the 3.3V
gpio-controlled regulator and the clkreq, perst and wake gpios as
resources for the PCIe 6a.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 52 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 52 +++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 3ce2c8a841ec..10ec40a193fb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -173,6 +173,20 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nvme_reg_en>;
+	};
 };
 
 &apps_rsc {
@@ -655,6 +669,14 @@ &pcie4_phy {
 };
 
 &pcie6a {
+	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie6a_default>;
+
 	status = "okay";
 };
 
@@ -804,6 +826,36 @@ kybd_default: kybd-default-state {
 		bias-disable;
 	};
 
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie6a_default: pcie2a-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie6a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+		       pins = "gpio154";
+		       function = "gpio";
+		       drive-strength = <2>;
+		       bias-pull-up;
+	       };
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index e1b19177523f..ab02a6e35eb6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -59,6 +59,20 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nvme_reg_en>;
+	};
 };
 
 &apps_rsc {
@@ -466,6 +480,14 @@ &pcie4_phy {
 };
 
 &pcie6a {
+	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie6a_default>;
+
 	status = "okay";
 };
 
@@ -528,6 +550,36 @@ edp_reg_en: edp-reg-en-state {
 		drive-strength = <16>;
 		bias-disable;
 	};
+
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie6a_default: pcie2a-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie6a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+		       pins = "gpio154";
+		       function = "gpio";
+		       drive-strength = <2>;
+		       bias-pull-up;
+	       };
+	};
 };
 
 &uart21 {

-- 
2.34.1


