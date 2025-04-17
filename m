Return-Path: <linux-arm-msm+bounces-54633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B92A91ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 13:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0621447EDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 11:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD15241CBA;
	Thu, 17 Apr 2025 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qce22+Mm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7819524060E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889236; cv=none; b=kHqrewArWuCH+ikMvwD8au3+xKgP1RyVFlF/5linWyOiFcGqme+xF11uIhX/62ucMwiS5GUiAaamBjrl/28ed8KWfolAKuUQpR10PbuRaWdTlEFUe1IRv6zKbF4JJ0KS4MKLvpr2FpR0fyrEo4N8+kPymvxffilqBTK2BB6R9ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889236; c=relaxed/simple;
	bh=2nnKPnNKSenGk7oH+W/zKyt+Vs9nyo2TyOcvxnYkJUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AvXU31Sy0n8+72JhDegS46Qvcb2k0xschDBBRrC/YvOCXaeBfFA4HzHrjLchZESZcAwi3QNwAXgW7XwyOVmqT8831ajkR6qSGh80Dk0t4yXxPgcQJY6vlNojoWL1OG7PjwkPcYPkmxAjIom/WMrGO0ORH6B8JjwldfPofBndfZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qce22+Mm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so4672565e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889233; x=1745494033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mn6UYVV7ZzZexDC3IKQgx7MkJK5bKEbv3iNQ8BNX+8I=;
        b=qce22+MmVOpq8gspYBBebktf0hkeW/6Dw0KtR75F68pVR7+Hl6BcvJoOFpwKp/TZwe
         kmvzaPWy/5TlOKoDwRZRF42Jny/EKAI6ws6Ps3KNqJ9dpEXabrScj30unZ2AEftMUkBh
         Mn5laNRNtXwnCTQb1YUPk20l29xDFUTX6HQygtp+ulkjCcemC8C20WUGlZXxH2zFgTyO
         o/DhMVogOebZG6vU7u5jNkhoelx64jEVrTPoVtHB2jHIJTIsufBu47wO84N2rQOvLSxu
         iwzJbqSTYS84i0IhJK3T2A7lGneE53g6D+SFrb2eCAoE78ceJ9KBJja4sIQlSVkhjf+T
         ZaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889233; x=1745494033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mn6UYVV7ZzZexDC3IKQgx7MkJK5bKEbv3iNQ8BNX+8I=;
        b=sS8GanpovsOoT7Jy1h+nrypQSyyZo/lR7xgIYnsBMthgCBTF7WxbZPfPvcaJAbjb/O
         IpqgaZKX0U6nxZoLHI1TSPbTqGrdt5Ny7OaFAA8rHX2yqbma7VUdbKhzyCmQkrd7+0ic
         T4nIuDt93tl6sg5wS0GUi4SjGEGWOSGYZyR4bChQXkUtIXLIUihxt1c/OrETWrFJXwuc
         aJb/LXW3Q7S+LpHeOJJkC7hJ9CXfupf+x9k2vlzdd/cRA7xy+I/Zrnul8tixiobpfyxT
         mOOHRMVh268O2p2FnGx1GcIFZ/MQeP1i25lfe1+yHO8PXADsK8r7KgaH2LOHT6MhyehL
         rREg==
X-Forwarded-Encrypted: i=1; AJvYcCVy1+foxE31cMkT1Zqr4m2rnuyQ/hRU/NijtnztGlkn2d3//fK23DgFDrQbAsf2NXttoIcYmQr3Jb2iU7w9@vger.kernel.org
X-Gm-Message-State: AOJu0YwjaEEAuwgHLKtOfCIdy4YDXr7Kk+M94KKiKixGEINYaGI8iXlr
	QHdmnUZlOqP3nyX1GoLzhIj7k/bzJSAeJ9WcTjcXjLky7pGG2KDEVWTTSMzLrSIQ0leauKnBKMa
	wusQ=
X-Gm-Gg: ASbGncu5y9tW/UiFv1bJIG13fJMH2wGLd6o0K+fR4vWG3jt3RY7BdpgPiLZ5l6VJAdG
	JTZt3CRSZlYX9Ud2aR8KZJCnZoKs1ZTpXXZQ+L76KsTheyCB8DcXP16oxvki+RoLmiKpnWWAwBH
	r3RUVXSd7tWQTNEIudG2br2YUsWn8QDnyoZh9crCOIJMfzlTJw38qc843kDAqjM7reZtpZpOiYo
	4dihYB6+7MikqW44k01so/V7GV8iBbeX2WBYP+/W6KslIujLlhsuVVruWCUcwAKWaOW3fodJWtv
	fpG3NAhWlARCsn8kXUevvCHyUzfRujfFtuimARTANybB3RSpxwoA4J0Xomog1Yc0zow1IFu8HJa
	YVK17yg==
X-Google-Smtp-Source: AGHT+IEUqScCO1azSIC6mQA8vGrm3CDpp/x7AVftuXoA1RfRc/gtPvrF3kjcLdpXweKxDtGUu+/VdA==
X-Received: by 2002:a05:600c:c0b:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-4405d6df1fcmr54165755e9.27.1744889232626;
        Thu, 17 Apr 2025 04:27:12 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:12 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:07 +0100
Subject: [PATCH v7 6/6] arm64: dts: qcom: x1e80100-crd: Define RGB sensor
 for cci1_i2c1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-3fd4124cf35a@linaro.org>
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 74bf2f48d93522d3f5b7ca990c06519ca664d905..048e49aa805c7239e1a22b59bd784683d1d0da08 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -894,6 +894,66 @@ &gpu {
 	status = "okay";
 };
 
+&camcc {
+	status = "okay";
+};
+
+&camss {
+	vdd-csiphy-0p8-supply = <&vreg_l2c_0p8>;
+	vdd-csiphy-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			csiphy4_ep: endpoint@4 {
+				reg = <4>;
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov08x40_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.49.0


