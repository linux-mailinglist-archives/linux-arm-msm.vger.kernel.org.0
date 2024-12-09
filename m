Return-Path: <linux-arm-msm+bounces-41058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3B9E937E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35ABE1886731
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D22322D4E5;
	Mon,  9 Dec 2024 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMznsNRK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60722A1F9;
	Mon,  9 Dec 2024 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746198; cv=none; b=hQGR0L8iwjYe+/4YqAfwbeLkJ/zyYYp5V7fMvEVNtNt3eJ6SbLxiDEd1QDQEmvLy5n1s8aEeBqTwQAVwa9wr1hQCzgpyAecS0TizT6e10JHmoRBheq0H35/k9IzViMnNUkSMLfxGaDLV8aYiqMP14UqK6bSz82oE/M0WlLIh3bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746198; c=relaxed/simple;
	bh=5EUQlsyAc8MhpaEMJFQvmuSsiHXWkuvlPBRm/0hOn9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyS/qr1hJu7dpXNYRTNAtv5VEr7Y+DzGZRxH/Gp/ZkH5/TUjdWf+vi4onmAwCOMQ/u4VaDyQyvwGBm95k2JVhWI64Y+OTI1vw2w9M+w7gyBKcaG8z91m8gGPr6ShVVHVGMfKnUttuhtJ03QyNZ+Cy5ytkfTFycjO4owGBlWRx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMznsNRK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9e8522445dso841429166b.1;
        Mon, 09 Dec 2024 04:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746195; x=1734350995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3r469K9nUPLNtZj+adF415xBNZpP7beV8sQaTcAzKM=;
        b=gMznsNRK6ifVh9w9FvUOKPNLpL2I7Sk5o0rTjWBi1/jfEUBHufcTQzVXH5Jylw3aky
         jr8gzpAx7R0AOmlWwMLwPGzw0AQ25/GEy9NZiawx9BpAlrE8Y0ZGfmnCAsiQVwsGey1F
         +8iMkW9CsiTEvVRIRw2DfGBPoYIkcgCYYud/mhYwmCI6OqdE43PYLQRStVZVMRJM41DR
         0NNgVO60m+HvYdGN1zeVuHJBXZCRMAN/Selxblsmm2P2nsF+YOL53Z0ccX4JajVJzwCE
         pWDFvPDohw5RXBPHFYRHQl9AMNbDPqiIDtQzy9AjLb7On+nWRq8Rix0kwZS8gm/MpwUw
         ixHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746195; x=1734350995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3r469K9nUPLNtZj+adF415xBNZpP7beV8sQaTcAzKM=;
        b=Dt99TNCQk5pfyouXnuihFhVjgK00pjSnpKflxAO0/Q3VJU9gZPrsRi+nkvTNtrELX9
         cWI0AX6KVibdv5iv3tj8TmJM0ztZ+qhsCBI55YTcLw/2eg6WahVTqH05/IR1Ab5yCpn2
         Cpxc3XeosqAn+qTWKXlKzF388gVMrBagClSCQyLI39mqfXdBUEUhON7qF/aggEkx5cwO
         pOMM3Ka/NYyBfkJhl5YxDpn6yUxOyT+tFvHt/YikN1NG3wPxkv1fP7KgbDKSiL9FZ59t
         nfNOexFPoJLQmn7d4sse1RAPpIRjJTwC2mnK95NCHDZWCFDkGNJ4thYiJRTkJsHHWdlj
         0Txw==
X-Forwarded-Encrypted: i=1; AJvYcCUbiNDPRw5FXfWs8dL0pdkr3Of3q/SacMg/5c0j6JEP+US/66bKWDToyJRCBQgh2KcYCjl2sVj6GU0P@vger.kernel.org, AJvYcCVEhK6K6wfHpFgCBuT24UC1/cYRL35kCbCKdqHfHeH5GwTbRHUU7hN9DdR69kykBFZuK7JDbEfGrSUAaWAA@vger.kernel.org, AJvYcCVywI2OwC2IRfzda9WJ1YxUzOq1px56pqFsb+7Kw2LkRHP8UHcyQZGrMCKdx/nam+7BueO/IiPxpeo9YOM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Z1i6oZb2+MNuurDClJBglPhnubfr6y4F+vpcgi2XCL861S5x
	9eQl897WDEV4t2+gn/IJpcJXGPOIFKUaJUO2z/8Lip8K7gDh+G7G
X-Gm-Gg: ASbGncs/NayAkpiz8c2udp2zp6qM7iu+/lpV/4mUIQ/8M7VzA6tYcpEzEqIerCCfA/a
	ZZ2w2mfgl2v+0d9pH64lgog8cdCbmxYfssz49+ZtmIMu9V5Ao0MyzIszYXDcA0NLBMBtwq9mXVc
	6XSqZdxdoYEiJJAOR3VezPnKicVt2EP7/aQ2HhZw5apeWDt+fMPI72cy/Y6W7EB6ADYdIcJv4ku
	/K9h04O5F7zSuENOWnZYaMfLvgRzH7MLKuPXBv2Bw+Z62WI
X-Google-Smtp-Source: AGHT+IF7ghT0wSD02aFkj824v9gcmc7KXiitumzJKaFhACToDdLNVnkJ0EAVYb0atfpOqgK8Bxnvuw==
X-Received: by 2002:a17:906:3cb1:b0:aa6:96ad:f903 with SMTP id a640c23a62f3a-aa69cd5d737mr10438866b.31.1733746194638;
        Mon, 09 Dec 2024 04:09:54 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:54 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:17 +0300
Subject: [PATCH v8 13/14] arm64: dts: qcom: sdm845-starqltechn: add
 graphics support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-13-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=2444;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=5EUQlsyAc8MhpaEMJFQvmuSsiHXWkuvlPBRm/0hOn9g=;
 b=nNRDvFfo3TjlTv2yArp6Ah+tst9TULx9FBMewzuZi8Dt5rru5iv6bog8vNIEhBqLc9zV3zHRn
 9dc7QaN691JBjgMH3gaKyGruiTG+Y52UgZET+qJeD4nxf1P/iXE8piH
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for gpu and panel.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject
- refactor: remove 'sde' prefix in tlmm dsi nodes
- refactor: place tlmm dsi nodes alphabetically

Changes for v5:
- fix label names
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 3a049459aeb3..e709b2062152 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -208,6 +208,52 @@ vib_pwm: pwm {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l26a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e3ha8";
+		reg = <0>;
+		vci-supply = <&s2dos05_ldo4>;
+		vddr-supply = <&s2dos05_buck>;
+		vdd3-supply = <&s2dos05_ldo1>;
+		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&dsi_default &dsi_te>;
+		pinctrl-1 = <&dsi_suspend &dsi_te>;
+		pinctrl-names = "default", "suspend";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+	status = "okay";
+};
 
 &apps_rsc {
 	regulators-0 {
@@ -859,6 +905,27 @@ &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */
 
+	dsi_default: dsi-default-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	dsi_suspend: dsi-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	dsi_te: dsi-te-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	i2c21_sda_state: i2c21-sda-state {
 		pins = "gpio127";
 		function = "gpio";

-- 
2.39.5


