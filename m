Return-Path: <linux-arm-msm+bounces-55244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E1A99C59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 01:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7C6E1B8091C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5397258CF7;
	Wed, 23 Apr 2025 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyJlHHsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BB02561D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745452424; cv=none; b=SmSssEJEAsTd3m7+ZPFO/yjXHhgr5PGcQ7sLC7aHqXhTyNyYfVPXO/tWfrm4mQoLnDir/UcT6vOhUhdkxwgEOvlLxKEA85MJdR+BI/+aAYc+JtUscAdykN799iC4Bscc4+i84CKx/uFKBWwBWfAVo9wALtCGUku9RORr7SBR6fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745452424; c=relaxed/simple;
	bh=CgPfChGYkYZwzqPaR62nTm4YG2M4v0JMtH8KJAOU9X4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XT7smXCqVNToH4mBmIlgTz75bLtztC0hlesDLTvjvgce1obY4qyN7cc10Iy2g7FAyGv2eTlHivAz7NfgdyqOaAJzOVhT3/jLuYAoBmcynSYQoamRW2VVS+e9kBUKEAZmljv2n9Kwj3MfIwevE539TSC9l1LgkmpC62y2iFnu7R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hyJlHHsA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso348560f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 16:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745452421; x=1746057221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwLBPEynKL1wju0MgNxJTHdjrLotKS+QD9x4JLTZx+M=;
        b=hyJlHHsAbW7XN1aF3qlOwmo1OJCOpwaC8vW2YIYClNosdz022pMDF1nk5K9ZbL+dcQ
         UJCs4jJsGBW3iUTR3ZPeh5WAGrOljpWvT13La0ZUlBdR3ccSQjene96Xl6H9JHXEo2S7
         MBDecn2yKR36iWrNmO2MPPUkPO8f8IH5CQmlgKpUS7PKEWfODQjygMUq4IM+v0wS1Uxc
         blu/EhCVjzWazLhVUGkXaMupV0HXtae7tW5Wtc0iwobAY0b2Ju6+g53Y8ZXYiv2lZ/Cg
         fzvSYqLl7sibJpkHb5WqxSEWogxVdEwbtaue4MZH0/tr1ADcvEjtP24XeHwMBDOil16w
         877A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745452421; x=1746057221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwLBPEynKL1wju0MgNxJTHdjrLotKS+QD9x4JLTZx+M=;
        b=dMqQIhMIxo2fPoWz5u6m9rJY6DuUzZuZNRGsLXCn9AEdQnSvoE9rQpIxclIcgcPZGP
         p6huZHMkWEEGGO6Er7JEoeFHP23ZH2QIjfCWzKGTxRY+vXL805Dv7Y7G0ZweGII8IwQt
         O/zw3FUnwb2htZmNsSlKsxBN5LPBULAyMPJOPAOLwuHRN+nuwZ671oB4frC/Yt4X/NCk
         N77r0nb+VWxCfpGKsUKpfK+Ea5KNjxPKqWzB+KM1LbtL77NlrxyJrK6d1JiqpADNPe4U
         3sx3/cHF3zxYnOHmcgiILqEKsUOU6AnLoupMwUjteIcg4ZigXmbnfFFowygU3xaX0rm9
         ToSQ==
X-Gm-Message-State: AOJu0Yy4ecacXYFhtuqK71PJY//3lBbp+QciL2B5LdVM+XH3Lym0MyTm
	+Gg23LK9UBp4vK3h/XT0U4ZoOkmnwsmVGbzolikpVchFTS1R24LF0oRVFRwkOyM=
X-Gm-Gg: ASbGncvyBRVCq3nF5IqWLK1+JVxI2QukuA/UkMdOwECH7y5C6oOFjfwkX8PKsmuEkPD
	JtfwhTnfS6EisNh+y9I8Gq3nSdO/2NJFT97sUEaR6bgU7zzLKnFIS7RfEzI8+20TSwR97sY+A03
	jYPeT4En3idH69kPrTaSSXIV30b2SbmBdAzR8jfKaYSnpMpheyy3IhMxbFHg4Bj5ucNjbK3ag3g
	+C0NCSx6NqoYsqLBxY1H4uMRc8ZwRXJYMP5ihz5KiJQYJSO9/gSuMGhXG6+8992SED6u5h5ijPQ
	4dgFiP0lSRWKYercjBYyMDRIdOVTLkxTbLQHVYQMfuoXEjhRFQZS6LAYRwXDNJxMqi7DceVd5WI
	xejkk4w==
X-Google-Smtp-Source: AGHT+IFJP3TMShgZm2zs5Bo+tgGxZI2YPRYASIJhCwPJSJ8AwH0APgB65lXIUXUB0TAFZMbtxwStJw==
X-Received: by 2002:a5d:6486:0:b0:39c:1efd:ed8f with SMTP id ffacd0b85a97d-3a06cfb2d02mr270029f8f.50.1745452421325;
        Wed, 23 Apr 2025 16:53:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a7ff8sm267265f8f.13.2025.04.23.16.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 16:53:40 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 24 Apr 2025 00:53:32 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-3-ace76b31d024@linaro.org>
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
In-Reply-To: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=CgPfChGYkYZwzqPaR62nTm4YG2M4v0JMtH8KJAOU9X4=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoCX18jURnf7z2FqvMN+OkxjnjJe7u9mTCCSXuk
 jktMFkj8mWJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAl9fAAKCRAicTuzoY3I
 Og71EAC4qrll1AH5fWzu728PwmNwdin3hy5VtWrW1YV+kxkAGJebVzak2a+FCWJiyFSVI052Y86
 DmLcmEkXpK/wrcUiP+4/GzE4fg3WIW/KJyRw7LfMyPW/A/0cvwpuZrc629r30UEHEL1oMM5eM7E
 btL0ZT+LnMCI1wSHGKZxaBom+Ur9nGgW1e6RSgr21PKYCK7WLPJwfmohbTBKgno8X+cY3W756LE
 vWXTjXebfdPxlr3bIA2zox9TpdVHO3eDpucIZSr3vAAZfK2Qaoi9SQk5bieyb0f1jlPUe0wSA8H
 kqzUxmOd6KupX0LuHlM8vEf7DtY7TIf36VQh+xrXT42fZpr1a7/Seb5Fp5K7axEivtnxUUGfQjC
 oe4V0ca6jro4MjCd1yKrnn3aYBQEzcAzWm+qCDRYhAgc0UahGfRK6xW8Mh41GVXmTP3IApxUZkz
 MMTH++msjgYrXciZXZPK/RqeU+z5MCLpys+o6DRUpX0X/1EDr8qXYHxXJ2WH0U31o5gvxlqEumf
 BJHQEEOQ7xqnntHQHFJ0JPyYo73g3G6TwKnVh9QdIC67H98I5+LPhMVtMi2i5/Sq5PZgsQR1jKG
 yDMlOcPdYecPKI5ub1MUxp+RbTHHCYDVFzh6taJREiUYBItxdkGZPCZ1fvxKNSbHMNE67cSIHhR
 4VuR0KYfp+WgKsg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../qcom/x1e80100-dell-inspirion-14-plus-7441.dts  | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts
index c38a65598637f74e2939b5491028c1e15d573d00..51abd89fe08ff671b8e508707ca4dac055302fb3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts
@@ -686,6 +686,67 @@ zap-shader {
 	};
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
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02e10_ep>;
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
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
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
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.49.0


