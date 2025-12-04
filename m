Return-Path: <linux-arm-msm+bounces-84288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C4CA24E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 764CC3064530
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314AF2F99B0;
	Thu,  4 Dec 2025 04:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clZQtqFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE6A24C692
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821721; cv=none; b=cWXktz24DEXtHYhrcZMn/L+85AJ8GPk2TZsL1Qoir4vXe5xV7GDFUhdwgGhHhEGOLscyePkxFNkb2wx9mBGqzj6m3R7O/BN0w1amofeOhtcyfMG+a80okTtobhAkHaCqvW+pLtl/gvRPX5LY/CSkpPXvebneekqj4spYdUJLKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821721; c=relaxed/simple;
	bh=cCTa1Ub1pnaiU8UIjMhINECGJKAf/9IA+3VQdk4mCwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgNsRpQl9wP+x64asdPNxSkzydUBpEqvztUqWwQp9NV4SmB8yPqVaJrR9vyOjn/Wx69TJuw0FMMLgg22bMdaS2tYXaVbAOE2HpR9QUl1cSnuzOwWsQV7XCNsGHl4wYcCWJOv86eoKDpFfNJFOv3dbKVAX5x3cqoHcHTVrck8vZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=clZQtqFT; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957a623c7fso95342e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764821718; x=1765426518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+XyKOinqpBtoj44ERUZULYsqn5yhNXioBZ9JsX/ED8=;
        b=clZQtqFTQCDps2zVcdXxv8reaBKcc22VXo724cNnK7lP/c6YAkYE+2Tzd8qDArLVkA
         kTzDiVdkqUHgj53uwsLc0t/jv8SJ3Qi9oSiu3GkE57vgsMybsboYR/vDQtROyuzX1L0l
         /PRJ/ZVhcMC7o7a8HzLmCAhHnlNKZ0Qm6o4TwaP3E7L1PQiB+MM54VHLcm0lQkyLqD07
         bM/y+plNlo892gLydjgvsvBmcVR+edhN+UOZO89Cs2m8SP4IhSZbarfeWYcok+YAkzZe
         dI4D4SjVfXnhAoi+3soVztnR6LCmOcnqqh+tiiQelANyQPu7AEqFsdJfcWueskwUssf3
         jVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821718; x=1765426518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+XyKOinqpBtoj44ERUZULYsqn5yhNXioBZ9JsX/ED8=;
        b=SEXiS44tlaJLE5mmMbE3SYIMiz7tQHK5EWCHi64IJGZhOLCh6s/sT4jhwMLDVdjewa
         A/4m6VbtUNSB6YBw5ScQ5gt3qtfgoSGaQuB9JOWcN5jzfbpQIgQ9KWS3EJSfjmX37xed
         t+NPX1cXT+YVQ7j/AwvkLy40nqV2Np5N/Dh6kcTqo3b4q0LbuND4lH7tVPY001Jvbkcq
         72bKB4cqaE5pxuzbwqedGUjnTDCpbfoh7HQ4hWDjnDbeeDJZe+JsyrGNiu002AQG4k/i
         JjWrwr3HDJsgz0fqPYemGZMedRsSgAj5NbNld3RB66mIKIi1bYvyL0RDGgIiqNmyfAuQ
         D8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzcbTO3k59wmlU0+4dK6nuECkeQxPmJ4Rp8OMdRHx2Xd5h3Rjj0Pf3N+NikZN7z7TZpMAN1f6JEV25R4Uu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5kLXM7uL3VW+rsgUvNWvmEQzBjdK/A2VCZiaThy13zeWLkbyP
	1EwdxbAEUBOcMzUQMNdeRu+DLlG3COnFqji6Bh8zGm8+FZPLD0dOhPaE/FUZanL04ik=
X-Gm-Gg: ASbGnct79YsNkJ5w/NFUXtAKYM1Ww45M1QBdWOlbWTt6wQW00a3Vr/vV8Rt3QP9+iR7
	X9Au6piq1gFeKkhSwSjq73BpvB4nxNR/mirwTGG54JJCpAEt8o9+PMhzJpQKOxerNKX25kujaxg
	v2G6oPViP3WEvElTe0Jbw/8ctXJaqpdTBJw2euZaJGVzNJUX51dpWKXcJA83kCXIuT4jFeb6Qpf
	y0/SN+KzFQHziqCPLDXlXFUA8XVkXzpMUqZJJJtBm+5+E4BBaXBkDrB0KhThsaiEHj38JCkD6IA
	oXArC80qexNl5X2M/+S25HzlB0Nd8Xelnchf0uh1/kMeTNPs8ZaizVGJL0s3I2Z40NwoG6gwgtZ
	Rdy70tkmXuFmZDJnDDCD412yr8nFaEZYvFuD05oGW5kj2Hc/zLCGtPOIcJDq2sOiYKDGu6zJhak
	S2dUifkV9uzeSlU+9IiGEa5UHccwJOybppHe1YJDwJjmMP9AsRN2kvbA==
X-Google-Smtp-Source: AGHT+IGpRbDjOtO+1hBkY+99UNjMqgYZfk6I4/EiFhuPSCij79DgfDXpMMC5pQsNwnU1iTZ69qpbGg==
X-Received: by 2002:a05:6512:238d:b0:594:493b:4249 with SMTP id 2adb3069b0e04-597d3eaa910mr868250e87.0.1764821717681;
        Wed, 03 Dec 2025 20:15:17 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2a1sm67649e87.64.2025.12.03.20.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:15:16 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
Date: Thu,  4 Dec 2025 06:15:04 +0200
Message-ID: <20251204041505.131891-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
References: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support of Samsung S5KJN1 camera sensor connected to CSIPHY3 over
MIPI D-PHY interface.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 43 +++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index b2feac61a89f..f990e68c7a87 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -741,6 +741,49 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&camss {
+	vdd-csiphy35-0p9-supply = <&vreg_l2i_0p88>;
+	vdd-csiphy35-1p2-supply = <&vreg_l3i_1p2>;
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_tele>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	sensor@56 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x56>;
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam3_default>;
+		pinctrl-names = "default";
+		afvdd-supply = <&vreg_l7m_2p96>;
+		vdda-supply = <&vreg_l4m_2p8>;
+		vddd-supply = <&vreg_l2m_1p056>;
+		vddio-supply = <&vreg_l3n_1p8>;
+
+		port {
+			cam_tele: endpoint {
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
-- 
2.49.0


