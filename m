Return-Path: <linux-arm-msm+bounces-27730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B714C944CD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 15:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C42C41C25D76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 13:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E18114A611;
	Thu,  1 Aug 2024 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pl6vSKgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A331116DC02
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722517641; cv=none; b=u4YtC+1Q4vT5XpwxyKKlheBlPleCB6TfmEL4O+FwcIRzsKT+6PeRAUNu7lmT+9JRuqekDf72Pmc/+QbCnLfOiYbjFDkYdgvgLtZPeyTUmEzPTDBgP/CHmDlZBDgr6DCgwuqiy0QvuzZI4KhJqwKta2YTIKGS8X61yXMo/zNfKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722517641; c=relaxed/simple;
	bh=nQ5XSld9PSFpLY0t3S0c0MLprEgPzNDHYo/Sbpd0vCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p1D36+qwWBoCMIFFoMm7VYQZedPI2pCZhY9o1nsin2FN5F+qOQZl6rSUJWT5cYQgyJJMfbtOQoLcgMpJp2PkeBF1VGpwd0fXBzvz6BEc4+ic0WtlpVJmYB3cROiXFiBde2i29OcDX055ZgpPpJ7Cx2JUliW27h1GYOX35mzJ01c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pl6vSKgY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f0277daa5so10877020e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722517638; x=1723122438; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bPCgM15F59t85GYnL4EkkhrEXQ+Td7nXhlbvKlNNkps=;
        b=pl6vSKgYmVv+4jbiPQ4vAJMgol/1hc3OtFOerm49Y4cEyxsxcQsCszxFu4I/78Vbwx
         ZHW3EYA1+UmZe/jDCGYZHQT87p7Gx+o2TsnbmVi0CaaDN8aAxiKibdWAjxXm5vtYCEaM
         B9XKkTu4BspLznqh+ft5m/U35AmTNDkALA+I5utqNv+Axb66V0F6yZMTi1avNnM7msv0
         ASubv87vkLXyVXqOUA6XuOEDCtpVpKwuy59dSOMwnchkKYxcj29HT1LEC01MiLUp7Q6j
         T8ADPpvDUCvYGKJOQObN5gKJJ4QLBCmVsySUROSu++w+gTpkjSVBD4PtPisf889lJnbH
         p3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722517638; x=1723122438;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPCgM15F59t85GYnL4EkkhrEXQ+Td7nXhlbvKlNNkps=;
        b=NNsQCT7R6z0p10FrOcZBfPdFfvAOXgNw8IF8ctgmjBhKhrbZLgSOnyYWOVs004Lb+d
         dLXdOUfJaqUwVZgF5XWKLAaznsvRLfVHDbu8R91AiRghkg11AGosG+MP6bGwVNPlx4la
         Pan+6qT415dgz3f7tjhebLb89I9qDiqJg0l0/pdUT+UmrpTeYCPE9e6FX9cDufYuhHvd
         frIyYPUrSayLt2I5guPmNeiuf8X+gupuIAZvGpfQOLfVpi31lvk8/GVVSXZ7spFDvQ/w
         TkZSskTY1hUsLHIx5Wtj/5JqzsHe0bCsu/knvpe0X0kn8fbDwgWkld9VFdogfJjW8jia
         XNxg==
X-Gm-Message-State: AOJu0YxwUww/DDR7C+50U0hDFYkY4y+jFr0hFgcu1B+mSD43xNB1vceS
	xYSv/1SQTH3ogGe/x4CjGa8GlqK3WI/JAjl8EAgx+Ix/OSPo2EieVNlCSk3GDSw=
X-Google-Smtp-Source: AGHT+IH7DEq9lYUEKuIFdu5goxVuft/BXSs/R2ZL6A0rDb4kmdbzlB6zA1tV8wbcKAPqUtxFx4aO/A==
X-Received: by 2002:a05:6512:32ad:b0:52b:9c8a:734f with SMTP id 2adb3069b0e04-530b61f3346mr1386507e87.50.1722517637506;
        Thu, 01 Aug 2024 06:07:17 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8adc7dsm57505355e9.14.2024.08.01.06.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:07:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 01 Aug 2024 14:07:03 +0100
Subject: [PATCH] arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240801-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v1-1-30622c6a0c48@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHaIq2YC/x2NQQqDMBAAvyJ77kLcJhj6ldKDiatdsFGyNgTEv
 zf0OHOYOUE5Cys8uhMyF1HZUoP+1kF8j2lhlKkxkCFrhnuPweIq6VsxcT2QLJoBm47jRxU1evK
 m7rhy2sqGeQlYCB25QM5Mc/AWWnnPPEv9X5+v6/oBK3/UCIUAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev

Enable the main RGB sensor on the Lenovo x13s a five megapixel 2 lane DPHY
MIPI sensor connected to cisphy0.

With the pm8008 patches recently applied to the x13s dtsi we can now also
enable the RGB sensor. Once done we have all upstream support necessary for
the RGB sensor on x13s.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
The Lenovo x13s has a five megapixel ov5675 sensor as well as a one
megpixel ov9734 B+W NOIR sensor for low-light face detection login.

This patch enables the RGB sensor.

A gpio exists in the upstream dts to indicate camera activity which
currently we don't tie to CAMSS activity yet.

Running

- A Linux distro which ships libcamera > 0.3.0
- Firefox nightly
- Setting Firefox about:config:media.webrtc.capture.allow-pipewire = true

It should then be possible to use the on-board MIPI camera for Zoom,
Hangouts etc.
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index a7c5a3f5926c7..463d37fcd2ecc 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -592,6 +592,63 @@ vreg_l10d: ldo10 {
 	};
 };
 
+&camcc {
+	status = "okay";
+};
+
+&camss {
+	vdda-phy-supply = <&vreg_l6d>;
+	vdda-pll-supply = <&vreg_l4d>;
+
+	status = "okay";
+
+	ports {
+		/* The port index denotes CSIPHY id i.e. csiphy0 */
+		port@0 {
+			csiphy0_lanes01_ep: endpoint@0 {
+				reg = <0>;
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov5675_ep>;
+			};
+		};
+	};
+};
+
+&cci2 {
+	status = "okay";
+};
+
+&cci2_i2c1 {
+	camera@10 {
+		compatible = "ovti,ov5675";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAMCC_MCLK3_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>;	/* Front facing */
+
+		avdd-supply = <&vreg_l6q>;
+		dvdd-supply = <&vreg_l2q>;
+		dovdd-supply = <&vreg_l7q>;
+
+		port {
+			ov5675_ep: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&csiphy0_lanes01_ep>;
+			};
+		};
+
+	};
+};
+
 &dispcc0 {
 	status = "okay";
 };
@@ -1436,6 +1493,22 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio17";
+			function = "cam_mclk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sc-rgb-xshut-n-pins {
+			pins = "gpio15";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio25";
 		function = "gpio";

---
base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
change-id: 20240731-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-525b250dfb84

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


