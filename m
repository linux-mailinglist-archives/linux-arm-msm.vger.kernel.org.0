Return-Path: <linux-arm-msm+bounces-73385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA4B556AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 20:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73A3C1D62819
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 18:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254E233CE82;
	Fri, 12 Sep 2025 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOqhcZpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324A03375C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757703406; cv=none; b=ksNrCbTYRPgqBkMivkYdz3nQQfbTecNdYXV25w0mZTQ9QtrXor59Kcb0KBpP3or3pjN8rhR+GzSN3yexqIML8A9wibopaUwodQCrAEowdod7wgXOyQu0QgeOa+GMHtB1ty8RqsSsEMH8ZXL3QD4GUYLI6t0BysDpYn+v00kQc2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757703406; c=relaxed/simple;
	bh=NuhdEUhqxZA+bUb3jcXwQjwqzeFpVk/pkWfNTnUfb0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCpjhuIzf6JxE9KXjfu8ZSwqVLOzVkw4Zsa0sQ05Kf1l6AhFHkwpIp1QERt/x4x6aGeJNtPRNMh6HjB1iebx9T8zBW4sEaQUH7KYAtdFVANvuyIGagC8mS09Q8yuFqsTe3bY6GYROky3TNLdoniOrAOCueZBlI4cHi+WahPGUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOqhcZpD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0787fdb137so344568166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757703402; x=1758308202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMFuMNHgQtIODbObQedXrsxWoqDPf7/6pdH5IDOcwpI=;
        b=VOqhcZpDGQghuNsJheC76zS4Wkg0Zq7Sm4A4SnmD2pVFCUH3HKZdnjBdI0hAXS7I57
         sXoa2Km4zVfQJvOD4yW6i2/ESksF22sXKstqktx33/ZgK8ESmUbbDb8OpHPpVSZkcDpj
         NQXB8GGys2/Wq6iHzGaN/9RcfXqoK2Sn0cBJgBECm+noViColeGSdgQzQDmKnsvS9lVE
         l71AxwQGP2F0mG3vX+s6Qji6id53C9CupaS6Opi/MK8u9G+9Rkw309cwYoLcTfKBeb6A
         w/5qtBynMI+TwmmxXiyJx2tF+cTgaQSvdIaYfjlpr2vl/XbNkjX3/lke5boJOH4e/RAu
         YU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757703402; x=1758308202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMFuMNHgQtIODbObQedXrsxWoqDPf7/6pdH5IDOcwpI=;
        b=w70C8jzu+drOiL1DrhvvaKJSflfNXpAemWjRq7WyVQXoMvBva0CnRogZaLyiIQfM/S
         AkPFY9XIGvHaoKPXbixxJNa0vFwbdKeq0SShXLqoa5kKP+dgFotFI3FOB6MBRO/1XtNN
         F3Fyq3Awmyh+pfibf6Fbm4eg7hMwx24fgyNwrxr3mLYw7OV824yQdwqzJG0yINnSpIDu
         QVA0N/vDMHodJFEgwzpzM5JT10Qa3gGqhkEq5NBv+IuETl+swisjTUBYh7QItvu27uXK
         uTzxkCQDogFemuLNsVtNakB1aGXsMxjcrHcJiDd9GNDwY///JENwbo1NiXVDly0AmYb/
         86mg==
X-Gm-Message-State: AOJu0YyhVsalnoyLC81NQba/iuF7j2PsmTfyjVK8dJzLoDrZoPNbQuFT
	qTgg4e4D0mBloGJtHtwYAQPDcB3pclm0MUi3UQfGMEKNpOglnk3uaO/k
X-Gm-Gg: ASbGncsneG11yhlUaSozwpk9hauCn4vUjWIiyG5au9q4GesdlTJZc7xwteP+do3KF/W
	5CoGe6WUNsuZbbsZlkkAtb7k0PqLH5sbWEe+pfE1Uk35HInTw2ApiREqXToHrhOUSXXnXa+u9gI
	R+3WMj5joSmtfQcCZeFb2XVSdm3b2UyE6P/TSuy22rFNtuf3zx4l0USJRhbSmvz/C73abdgoJBT
	uelj3+Q757EibymP0QQzUutss/TeWqXiNk7MtHnOljfn8dWH0zgirzKU7+GH6n3HU+KTQv9tsBW
	qfdMpMZET2RtXArVzDHZD5dEV+6DHXl8b0je9xGtCZvGP9XHr0s9C0xIBT4wJVW+Ol+y/Y2Gjc3
	ANpfdOl2CeBXtMAXjB54jP3NSX8eQOWmIjZ6nhP7bHQ==
X-Google-Smtp-Source: AGHT+IGTL4pEw44esZuXiYOpXJ8UaMoJp/w5uz6YI+s5Fhx4tBOD/bNzTMRTfy/5dx0N6xED2ZIftQ==
X-Received: by 2002:a17:907:d19:b0:afe:ef48:ee41 with SMTP id a640c23a62f3a-b07c3a783ddmr386299966b.58.1757703402115;
        Fri, 12 Sep 2025 11:56:42 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b07b30da310sm418184566b.20.2025.09.12.11.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 11:56:41 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 12 Sep 2025 21:56:36 +0300
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-starqltechn: add slpi
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-starqltechn_slpi-v2-2-5ca5ddbbe7b4@gmail.com>
References: <20250912-starqltechn_slpi-v2-0-5ca5ddbbe7b4@gmail.com>
In-Reply-To: <20250912-starqltechn_slpi-v2-0-5ca5ddbbe7b4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757703398; l=1717;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=NuhdEUhqxZA+bUb3jcXwQjwqzeFpVk/pkWfNTnUfb0c=;
 b=bFrvnGE8VIM/ELvl0Z0h8PH1FWAGmZKloaOgGml5/7biOlmyMwusnSEYVqdWF1LOlxpDpiSiP
 kyb1B+zHMPSAyk9z6z6oJbOP3DXaGwaCejyAmSA+H76KZgj1crtcR4K
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for Qualcomm sensor low power island.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v2:
- pinctrl replaced with fixed regulator
- add space before 'status' node
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 32ce666fc57e..75a53f0bbebd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -56,6 +56,21 @@ framebuffer: framebuffer@9d400000 {
 		};
 	};
 
+	slpi_regulator: slpi-regulator {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&slpi_ldo_active_state>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "slpi";
+
+		enable-active-high;
+		gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+	};
+
 	vib_regulator: gpio-regulator {
 		compatible = "regulator-fixed";
 
@@ -902,6 +917,13 @@ &ipa {
 	status = "okay";
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/starqltechn/slpi.mbn";
+	cx-supply = <&slpi_regulator>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -1028,6 +1050,13 @@ sd_card_det_n_state: sd-card-det-n-state {
 		bias-pull-up;
 	};
 
+	slpi_ldo_active_state: slpi-ldo-active-state {
+		pins = "gpio8";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	touch_irq_state: touch-irq-state {
 		pins = "gpio120";
 		function = "gpio";

-- 
2.39.5


