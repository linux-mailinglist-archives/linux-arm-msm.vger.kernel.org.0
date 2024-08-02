Return-Path: <linux-arm-msm+bounces-27789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC3945CC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 13:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F4831F2243E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 11:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52471DD3B0;
	Fri,  2 Aug 2024 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zq/WWwaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000771D1F4B
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596747; cv=none; b=X56gtN4yD5DqEXM6gDTXnvcuR0LLTjxvMCEEQr5j34U/vlK3/iYaOaePRYGqvdQpvUh+KeuXqnn4KpjYAIlohJD42CgEO0zWOBQT1mY8fY993iPN1NvOvZNXNXx0xn2zpr05NTuwFFn116Pm2rPRqSQC28270mVZIafWPkQl+Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596747; c=relaxed/simple;
	bh=7x33FzHLkZMz9gMP7486x/FkZIBSCgqPCbd+1kfig/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m66bpWusD5Qt6WV7YS2IMpUE/XR7DkUgrDpY5d7DmAnLFuqh6fuXT8+qJZyCqepWeiBNjaZdWfQDO9uT5riOCOyILhluCIl36qujllvx75BdWUZEpiD6nTk1Zk9aLEQul+VbxfqtRfxSc5TX3bvEYMuwyUj5s4Nn62wizVvNK7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zq/WWwaQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so54344205e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 04:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722596744; x=1723201544; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=moJRtCeaBUTel4W4KGQPWwkOGmQte9vTCn0AiSSidok=;
        b=zq/WWwaQtRNavHiGlX/CorMhE30gaMUKvaLma93UCMQVh5NFX8KWg4uFbmmBarU3LO
         cxj9PMeDsfT7kmAFDiipgwzs0SUfLEqg9QXKfL7NEItvELGNPh21egfUx031hXzwUUkk
         7c1Nv/jqT07NsA0ueW2HZCm1zzdAUqXBYPaJFL0fkdhmvLEdZDSpcm3HJuO2vWO+hIYY
         4qUoqKVY/o4+sub1HfxXTU2xhLvykWBbbd8zr56/oU+cQ5CfB1ULLzDXrkRUHkjzD2YN
         /MWZrQfxrO+AdqZop1SoZHGXkVYKerXtY4a1Zv6/SdIxz79jD1aoggJJ1zDbIyMsNcD+
         YUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722596744; x=1723201544;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moJRtCeaBUTel4W4KGQPWwkOGmQte9vTCn0AiSSidok=;
        b=Lr8QolLpSHvfKrbmPtMEiXNq6LG5FothW2L/7s/ZDx7opPcShQQwOK70gEy8uf7eNF
         DbxLyVn9moXmQRmP3jiI4sjkr0ZP0iibIqOLkCavXe27OpjJfD7xY9IToCXfR0MfmGpY
         M/9ahh67FidiDDH8rY8FAWeZ04vz8nK+uuvw2DY9ALUOV6aWT7qHg369ezCUc1RtNoaI
         UHN9WVaQkFVMCVSTy+OcZ4hajVpUlPUgTplP3sZI7yLIDq2XdL0jvzIRemQW1Sk1wdJZ
         l1wbff72swaObZXZrNq0tBidtXRFW7ZhSfR91K+WACYrWB/l6QfSdgRkfKiJ85VAfzkK
         tX4g==
X-Gm-Message-State: AOJu0Yz136EITnqO3/WkgWOn5FwmQnkzGrT87/xtUBXdUvSDSC4Y1Nrm
	z6Fjw8RlPNREKmYc3lIVJSjfe4PYziBGqIBJGJ3vHB8D70EFRmSLWA6O3w2gI3A=
X-Google-Smtp-Source: AGHT+IFIx4gifVEu7BCRNgO7MBIqaVGWWLdEsVbyzJzxD28h4WOTtz2X5xHFE+SJzxU/kVKaax59Eg==
X-Received: by 2002:a05:600c:470a:b0:428:10d7:a4b1 with SMTP id 5b1f17b1804b1-428e6b78d89mr18249025e9.25.1722596743943;
        Fri, 02 Aug 2024 04:05:43 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6d648a0sm28805855e9.10.2024.08.02.04.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 04:05:43 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 02 Aug 2024 12:05:42 +0100
Subject: [PATCH v2] arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v2-1-a80a301dba16@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIW9rGYC/52OQQ6DIBQFr2JY9zfwRSVd9R6NC0BUEgsGLKEx3
 r3U3qDLmcWbt5NogjWR3KqdBJNstN4VwEtF9CzdZMAOhQlS5LSrGSgOi3WvDM7kDZAD7aBoLZ8
 xQtQCBc0rLMb55CFMChJCg43Chg6jEpyU5TWY0eaz+ugLzzZuPrzPE4l97a8n6H+9xIBBTVtE3
 UqqubiXCRn81YeJ9MdxfABe8izg9wAAAA==
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

Changes in v2:
- Drops useless assigned-clocks entry 
- Link to v1: https://lore.kernel.org/r/20240801-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v1-1-30622c6a0c48@linaro.org
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index a7c5a3f5926c7..2bdfff2a16cad 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -592,6 +592,62 @@ vreg_l10d: ldo10 {
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
@@ -1436,6 +1492,22 @@ cam_indicator_en: cam-indicator-en-state {
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


