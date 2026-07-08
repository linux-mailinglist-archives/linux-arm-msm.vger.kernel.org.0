Return-Path: <linux-arm-msm+bounces-117453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gAMfBJudTWrE2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:45:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A1720ADA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:45:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Qn7a7hRG;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117453-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117453-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D1CD303877E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8944C36BCDE;
	Wed,  8 Jul 2026 00:44:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA47C36A370
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471478; cv=none; b=MEfA0ab1zzubm3Srl2oedb+wb1GH7xgY3VGtZTop7858S1YVsEMf+xBv8ZlROcFhQjiIHZ9tiNJscJHfKLuB2WrhXQ8D2kC2NS4M1xTejKYq9NDYWdA3qZg1urqZs4pj/0KQp5s6IRrFmjIhQPKph9sgkNi1F0drVwVqmwMyl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471478; c=relaxed/simple;
	bh=+ME4uIwfh7U2ZsvpPKYM6p+xs5eimsD0mEkQXeCVi/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iYlbMwsQVgZm4Hde4PcjlE39KuEGE6bwK3pAxaud1Z7dFpbCSNWSKKIPdajbrJ6XhfadmCChw4cUEGAOkDB34pr7zOrdSe0Apgp5x/04+44965UUK6gPMBtjjp6rDYbjH16RqLOI0+BJCfYQZtYit7ODsTItwkapQQfKf/OqUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qn7a7hRG; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so424515e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471475; x=1784076275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veP+5F/JehNLDz0mSqLFb4LSBoU3B+S6w7lib5M/5j0=;
        b=Qn7a7hRGDwOP4LlSJ0PGF+DHOrV63Ea+UEZlc0gkK7jcNea1Fb2yYZxgOFqgV1rn8d
         0GdfxlcyIFmV3f0ohXx3X1jvFiy9R2P28eg75NjmwlCjGfwDDlZo+XaHHdqVsEACUPE/
         qVK7XdHdgczLEAXcf5d00lb3WBtPmyOhgCOKDOFLy/6ZBFgp55kpophPpNhe+BhUqDkv
         3mpmDewB2CNdJHJEtfvkveb9yR+uf9AOsHbMRMUrEbDp+3yxSwHwMeDQJjnzgvcFDtt1
         nnu7HbAuoCt2dmsNr0gKFDOIZSyBqWobr6j6TiMVH/1likf6lu5PO7N46ZCZyy/MPidO
         3mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471475; x=1784076275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veP+5F/JehNLDz0mSqLFb4LSBoU3B+S6w7lib5M/5j0=;
        b=jE+pI0et6Yug/FC0pC1QlTQBsy44EJQ2ok7xmAaBkoEx8nZWqlmHrhWKRNmCm0u2ak
         Ytyv5Jd0F7H+raScvZyIQvEusUytYwVF6VM/xoNZ7z6h1QjWbMJAh6wYHq+BBCfxLnzE
         hNKXi9NaFuhgpk/o+1w/v0plpgqqRSy8045P012LxAYCdneT2NIS1+vwic9smtTNDDO0
         dFRfqm0Ga/Kz3BoThrHPVX9+dplwjmgReAUsaSwhFHqfgWg8U5kkE8dDummw8s+GFp10
         fMQp/PNeo7tJuhzD1FB/OS4C6gIx0lVhEf1TIcD80PjadVeO9mJFFXlKf6YrsF289m+e
         QV6Q==
X-Gm-Message-State: AOJu0YxgsJ6Ht770vaSH5sCny1qPOIIRKpgcOWUk2a97oZHU4fQ0x8S9
	0xugMbLdUeWIY53zV96K7g6Y/3uI+eQhk7JD+segfdt9746G5KPVFB82ts1aKHox+4o=
X-Gm-Gg: AfdE7cmCe4VibWauWSk57EuhH3NvBFMIUEYL7LefZ3pkklbe3mLPBuy6ngMn7534QM6
	t1QZZ1kjThwOgVxMHKPrBJsEcaoJTJPKy3Z+t0s3bLDI9Q6tXEM5LAHyex65Nk5MkviLjZ4rtK5
	AQyXzo+yx/WcHw/69tXbsVX0Y9Py5dCkWlOLOJGlDirJfd89XoiRoB2siyIdPgCsNNt5TmQZxkM
	R696s7gmmz+KDjx3BK6/eif06Y1Y43jxbs2qXcumIrAQ/47txgSjQ8/RZ+GPwPFPPvT2GIM9N4T
	aYiM3tNALkQx6qiDHEIXc1ZEYaQim+tViJZwTtWFcCH+5k4FtPSvPifKrEl40xSpRpgjClftB3h
	UMdVDZ4YOXqYeOb/CEugsNNuAE0PwtRxiFpP4I6svk/ruQbNQ5A8IKCQQgtocAtGW25ZdpTCsO9
	pmIWWrDzD9ARVqQUKxxRuQRSO5yPvfxlqdhg==
X-Received: by 2002:a05:600c:34ce:b0:492:4911:8a with SMTP id 5b1f17b1804b1-493e68bfa4emr1560835e9.12.1783471475147;
        Tue, 07 Jul 2026 17:44:35 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:34 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:17 +0100
Subject: [PATCH v4 10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-10-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=+ME4uIwfh7U2ZsvpPKYM6p+xs5eimsD0mEkQXeCVi/I=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1ebs19ebdN4Fw8+ba1fCey8OGla8+D3wHUz
 Of4kSDKH2yJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXgAKCRAicTuzoY3I
 Ovt5D/9r9QOowQEHNxF2nmIsRLjR/afhkMXT3QuRuwn/kqs8ExUht/aw9JPy3MuuFXtgLfNTXQY
 6cRy40YRmaZNiz60CjaRPRDT293y65rSZ1tj9GkHG3VvTS/O7yGtqvAQD+TUw72aVNt/xqoiCgk
 zQ7Zh7R/lKPESAda6KNqodq42LyVFataY4+bfdb0QChh/jHgKhM9GyoQ1x3O27aYWLs0tHXDTuS
 BoNo3CSyJ2y3KkN0EmruFcS4Hirs2cvq0UcRvycasuCMDG3Z7PSbTOVMND5gKMnuxApnkunAhqt
 8yQQYixmnB6TGcPG2QornGkl05E2cpLChpwGw56ORwwucnd/kwsUvsI0eMLj7df6RhCCaUflD/Q
 0PclSUu/KDVgDFW8GIJtlBJAMMAkw83hMXPWAl32iIp/+yUTVNWRIPfKeKmoJ0RdRbY/Pv9OJ5W
 7R/eb7aGHUwFNMvhfpoU3Rj+5nlnReLMdF4GD4JLuZqICa7p3la3sfyqzfd7r4L42u2y9LvBw2j
 JvdhAs3GZQqXubUDnLSP8wJxVlAOSNL+EPkSv23rdwJ5bdkgJvEcHo4eA5ojMCaNsTwoTp5zW4k
 tdONyZv78vA2MtLI3E1horTMh7oYJfHa3JtDdf2kHOqFODpjVC15t4CaUx0ytuZPNjACtFedBFq
 MkpwiSSElX3LJpw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117453-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B47A1720ADA

Add in the RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index bcf3e2f610e66..3945f4a79952e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa.dtsi"
@@ -863,6 +864,88 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
 };
 
+&camss {
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
+			camss_csiphy4_inep: endpoint@0 {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy4_out_ep>;
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
+		compatible = "ovti,ov02c10";
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
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csiphy4_in_ep: endpoint {
+				data-lanes = <0 1>;
+				clock-lanes = <7>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1410,6 +1493,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.54.0


