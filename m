Return-Path: <linux-arm-msm+bounces-55354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E6A9A8CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9FC1B86A59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F20D22ACEE;
	Thu, 24 Apr 2025 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zP1nOWxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF9E227EBE
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487669; cv=none; b=hicIZqiMtGknIbvePkRAMPfw+p3k1MVqo3CqarueQYfsW68KYDTn16U/tujYXIXOkyWp7VVLUzNRWZNUxZwkPORza20AFTauvsLSWs92NwG5WQJz+b+qzHOGKDbaGW+RyuD7lVjvUtxv74UqOwgXXQw3yG+HCAlWAuD2nxUq7OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487669; c=relaxed/simple;
	bh=LuhZmuKMh2Ehx7LzOYBB4z9DfzlR2nAR9B+J6RBwVrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLZk6ZDO4Ll+Ffs08h6z1gm5eBhyNKYRTFbF6Kee5EUgMZiWHk38GZi/tMpGZtSf1C75UwYB8qhpe0+Pek04/PZyJ4k0/j/sGpwkHAlsc/Gr1/o8XMcwj8TNutEik2+/1m5NZG7p5GS4j/sXI1y8qOIP97QkgCOAFUXRAPOYvJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zP1nOWxW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so386935e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487664; x=1746092464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeV9S3LSZxQPe7TEEoGIl6QYOBB16ZvqbMujGlSwhMU=;
        b=zP1nOWxWNu8jkIgY79pG2+4CfhXsLQHgjCKaZBGZDE9v8l4/zturXSyM5dEkWHRSUr
         QAnNczp/Ztuq1ep0ymWEofw/LaHS7itgNgV0m0/yYgf9CnCjJ953Tb3qSm6lGzEWBDri
         Dbrp0qwN+9HzfJo1omCsPuKraJouFxbbdYm7hxotb4+HGX2UrCeizrDCkZHqPYVpcHts
         YLmFp6/IpgIPWwivto6Wfm268xBpOUvpEENAvm1wIb/b7A78iOHn+6PMqHMW9DuRq5iy
         Ewuza1L6i7uFNBEzh90PxoOeqNVxdVAWBZe3ReZ4Yeh8kB6e1hKJKDMUu9eJiBTU4ZoM
         XnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487664; x=1746092464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeV9S3LSZxQPe7TEEoGIl6QYOBB16ZvqbMujGlSwhMU=;
        b=Qk3mka8mUKAWM9jQ0aiotLfst0V4aTz7myjxQCEpW9yZPqDCm5ovsBUXEirz7bmIvY
         AgSmvLjS7uZmuJabTp1PxHokcXpUhXjKptewnea/KyQO4e5toJZOxk9kVrBcP3U/B5Sl
         9Hw0ABtC+rx8Co8WjNSM1QcwX4wlVuubF+IEDpq10NLnAEaL+5HsA73XsujmphcLDMge
         sNZz3QrgUfHcXzmt9hu2XK5+OGvAzITc61kzGdizIZameAxaa9UJzzP0CN7SZcJLobbU
         B6ru/5MJMJ73++zhxsDAFzjsSkVc/MZS2Fu0/jGMy18uAw+SElwyjbMnWeXOc3HjpOwW
         RBkg==
X-Gm-Message-State: AOJu0YzuSqvOh7AJ4lm2flstYUMvUl+Zj5kFgL7fBOuJhJtOB4GWoD5R
	5Kqobn2wUQ378DjknVMT2DF+6Y/kliuvcRv1SAvHYlGiWrFdFgn4bvIoqhGLtWU=
X-Gm-Gg: ASbGncvGlCiqfNh+1KaDgmbv0ouN0XgJDMAaQEYc1n8V9c/IhqjOndyBnZmgDTo5ho8
	mTjmUEiGDtA6/yAwiom2X6Uv1lEuKmDMCOml9wxMcNjrtMTZMx+X7D+0I9nr7bD7auFEHuDSds4
	762+7/5jdryuk6YOtKD4xzNh9aErSfKgAHBnqLr62JmgvPB7dThYpQiU//yeXnLz0saLCTmFaQ4
	T3TqamnWHoi4H/3DP7DC0+aYtxDIGSYBaM6RY/fTCxHz35xVJizqhb523xHeaVNm6aP+aaE2a/U
	3HMHw9mZffRjWImH3vaWWPObYfMBblYc+E+F61xxQ1nfiAZ8TsdrUDLjyKE=
X-Google-Smtp-Source: AGHT+IGm04Xa6LTTBxLRK26kG7UOtNU4sQh9km+Evqhj41iZtFmCnCtWMLi1LPIXC57uv+d/LVM5Qw==
X-Received: by 2002:a05:600c:198f:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-4409bd77f64mr6651435e9.4.1745487664361;
        Thu, 24 Apr 2025 02:41:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm41526975e9.2.2025.04.24.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:41:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 24 Apr 2025 11:40:52 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
In-Reply-To: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7012;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LuhZmuKMh2Ehx7LzOYBB4z9DfzlR2nAR9B+J6RBwVrk=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGgKByug1XYwnbgI6ikbC173TNSaBcvvZCgbIvLAGTk6zOnJf
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJoCgcrAAoJEME3ZuaGi4PXxBEP/iNO
 4Rt1KaN4NNBVyXUZtm527a8qkMgx6Ke4dKEC8zZvJUcgVnz6tXoEecOEcKO5bByaO96bMiAiJfV
 Gj+vpNa+ej4Uancr3zXXGOHpDNRUUAr1muduiwy4VR4tMjJrJeSTXe0lyhMpRSsTh9TMkKxXQja
 WQCt+nff7vZI0UoUjDAQDTGizd4o8bqJhJ34kyfqLSNuO20JugZcSxsS8FdpjCPc60wMLgPcR1M
 KyLZFgq4NfUfAweKc5snF428K7i94TbAExTJ0Nvta+0RgGIzZgizqWlIX4E8EjbbQBBMC7Sqws/
 q1+q5FO8r8NAxsKFCVxxKl1eK0HqLTiT0VE8xK1Fg/gsdpQeRfaznHor2n4ojnymFpIKLAEtfni
 nbDAXIxv4r1PcMumr3osv2BwMP/zrA3ZLiR2o9xbu5KDx2oDaRxNjdZTpzwO2Kj0tBViTNmtTYE
 SBkjAqXUs+fwdoLHRkXLACMlwMRTMeyoYpKe1toZr2pW15L7RiNxlYKEstLxe8gHEzl+/vVdt1X
 1lXjt9T/eOFs5Nm3wnuS89lm0HdKw+IxtxIwv1tPcC7vUZV/VqwKwZmb17d+5/eWLs0+uRIdIcy
 u0jNWQzOQKO4JnliDCqVVQHYlf5x/4P1PUuxIklFYwQcAZ62fvedZqYdCyuwIqU3Hyoy4n2J7mE
 9Fond
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add Soundwire controllers on SM8750, fully compatible with earlier
SM8650 generation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr3: soundwire@6ab0000 {
+			compatible = "qcom,soundwire-v2.0.0";
+			reg = <0 0x06ab0000 0 0x10000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa2macro>;
+			clock-names = "iface";
+			label = "WSA2";
+
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_rxmacro: codec@6ac0000 {
 			compatible = "qcom,sm8750-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
 			reg = <0x0 0x06ac0000 0x0 0x1000>;
@@ -2274,6 +2304,36 @@ lpass_rxmacro: codec@6ac0000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr1: soundwire@6ad0000 {
+			compatible = "qcom,soundwire-v2.0.0";
+			reg = <0 0x06ad0000 0 0x10000>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <1>;
+			qcom,dout-ports = <11>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0x31 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0x0f 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0x18 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_txmacro: codec@6ae0000 {
 			compatible = "qcom,sm8750-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
 			reg = <0x0 0x06ae0000 0x0 0x1000>;
@@ -2308,6 +2368,36 @@ lpass_wsamacro: codec@6b00000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.0.0";
+			reg = <0 0x06b10000 0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+			label = "WSA";
+
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,sm8750-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -2329,6 +2419,38 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		swr2: soundwire@7630000 {
+			compatible = "qcom,soundwire-v2.0.0";
+			reg = <0 0x07630000 0 0x10000>;
+			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core", "wakeup";
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_vamacro: codec@7660000 {
 			compatible = "qcom,sm8750-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
 			reg = <0x0 0x07660000 0x0 0x2000>;

-- 
2.45.2


