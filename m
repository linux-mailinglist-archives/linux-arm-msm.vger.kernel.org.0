Return-Path: <linux-arm-msm+bounces-94320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLyhENVfoGmMiwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:59:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9AA1A8216
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74CC931C8633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056433EF0B9;
	Thu, 26 Feb 2026 14:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQDeW7//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852493EDACF
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117482; cv=none; b=nvogEoj2yld1h5xrU4sWJcoe2kOQPRbgkdZOF9U3l+MhnR5OnANh3XaBP1YyjZ0C8ISNDenOUtUTaWY2mjS0s892zJc/le7MWoRrW19OtjD+aLfZb0+PNr7RcdnNnANsFU/qX8WVT/0LSQLL7PY6CJjGKmVNGiK6S3HR0wm8Ee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117482; c=relaxed/simple;
	bh=PZliYhJiPFyZNkAm4JLciiLWwJQT5YMK35xTkwdH/J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uX0hdDU5zLVm8sl9gj3oxym8y5M4KNrcBlTF/ckmkPd9LYtx2jkEE1b+d80MLK0YttE2aIut31UnCQcpD71yvvuq78HUtnbCkVqo4v7CbT+hUjmPFTtrpx3RQOXcQGuaKWuhgFUS5CsIE0gSsEjtLv+cKhZHdOK3DAqb4kD/4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQDeW7//; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48375f1defeso7120965e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117480; x=1772722280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ux9KlDrXiMeO+6sxOIbUbjCaB/XkjWdPsfbfbK0QR0=;
        b=DQDeW7//jFZRuQbjp7uaC/258tLOoXC8+7g6iytd90S+1Ikna3BFpgd+K9U58qL49O
         9mwzN1enO536qOebT+Ud5GF3/UXRQDdDJK11PMiuHqRr85Qm7yAM2vnSFLMdfFbSbSKA
         Z8BZ0FBUPXeGFnBrRiGryOQiVX/ycS1bomrp6cFuxN/0X98VDpy0o2K3helcAwpmFmas
         iH4zfxOQzpweCxQ1rdKf28cW3sxzc5aApmNCqgzY6wkPo+5FDGsmStS/ZQEubEMtEYZq
         /OwFarIoOCZUpOCGEjs7kDpLghrTyKchr0P+nqG0idAjEJZnyC6LFKr+4J6T547q2ocQ
         R9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117480; x=1772722280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Ux9KlDrXiMeO+6sxOIbUbjCaB/XkjWdPsfbfbK0QR0=;
        b=RUVZgeNqGntSH72t1zOnU8feS9sEmKG+71EY7Bwq8j82euoFA9YS6vfiou5G2moexH
         nGeJNGMBDWFG4xp8/ySwSn0v65DefWHFdbJEbC00Bhg98eFKC4nDpNTinNvgR4vrDwuW
         iji3W7CDPjuWhRg2aM6+SDDMqR6UgXoT4jWEFMv78ZFRfkxxHi7aXvNbXEX3Gzt8Tl2P
         qV25lem99W8jN/dZpqO+4ska8JVWlzvhRWfPUa3/VaO70htp8eutPr4shs1fuiVs8Cp+
         vx38WE6tizxXhNgnqSy2pxtTTClGZLOvX66FCsW4XAPcWpQqXOj2+GJdieMTU/NrksIp
         BTXg==
X-Gm-Message-State: AOJu0YyUyvrgBRbMATY8x1o0rGK9wANGqx6v8e+mZqhBuCfCtRn4huvw
	1qEVDEtEd6VAp4qveYSx6KJkwyrceDoU7xnRjuKKqsgULKuniOOv8TbIud/s2KajUsI=
X-Gm-Gg: ATEYQzx16mK0Sdl+UEK/s3U0NgtWhS1KMpAarVNzp1KoZw9qozddnVFn+0FXIUHA9SB
	DngdB6F+26t3xDTDBf3/8CHHQeAxBtFYq+Uk0WUFiNU/nzwmoqX029swwvukUgDai8HcC3kFe/b
	RUCsl6i6rq7CtSFuJTQYu1l7dGAhwhMFqlEQQpZalM0eB3eoo6r9U44sY0yAdMzgkxqCrd2vis4
	jxXJISOtPFLjIq7AtUPF5OLazFqjqp6qd2NWH5FVKNE0RbsH92PEyEPVOnrXfkHlgI1mxFmC1Kl
	uMmZ+oLG7rqmAwYrOT62BbkUdQYmlIL8yJRyP5v8sPBmByZvpoKxT5cKVyknz+ERXLMm4FcU8xx
	YS/odpHVmcyRWhigH5vMHCS8gwIp2n0+6h7yPj5C0a3ShI82b/s5oeoxrpEwXgMXwzVe7sGfFi6
	3zdA2dnn5qJddcxGmvK9QxtPOIhChTlikhYgIeS3IPB8EGzX3QMtNBDBK/GgHyFic0mvdfX/a0G
	V0=
X-Received: by 2002:a05:600c:5020:b0:483:a2ce:f461 with SMTP id 5b1f17b1804b1-483c3da0aa7mr39721945e9.4.1772117479888;
        Thu, 26 Feb 2026 06:51:19 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:19 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:13 +0000
Subject: [PATCH 08/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-8-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=PZliYhJiPFyZNkAm4JLciiLWwJQT5YMK35xTkwdH/J0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3dUD+FfVTO8SPG7gbCqSUFic6slWtXM1Iy9
 iJrmPM3LKqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3QAKCRAicTuzoY3I
 OtruD/4sPvR8XEMySYW/t9KsJHLERlLF4YWvsSYYUWBOd/Tf2N1Dtl9XXHpZTAzYu6S99rtSvmv
 v+AARFl7JPAE+eKQFxR3pADogafQ6mqWG/wmQ+HAH2H/qij28BQgcOr4KP4zNY24EodQSuh75mp
 suBrUieUciimjR/IO33i4Kbj4b52Eebsh9u7myf7CEThQixqEDn5+65W+L8oLymzinu9wjdo35B
 Y9tWGKdsyhVhDXvMa6Sh2iEpMiqhIKxmCzhG0Wuicdav55/4X6HI7gs5VbRtyQ5LwrIUnGar1Zm
 RHCkMUVLx0AbNUVqrRiaBJBUdP0ZLMjpMs+Zny8Gf99FhyBLgxVLqOvnTULjXaNoL55s0FHhizo
 VpZYFUV8k+tdOsz5SUakz3rj3XbENJ6fj7uP822C6yWV1jqqZcGaWWwtTSRPHYScDe+NPNoZjxI
 /11T5vaaeTyurQ6Fbjn4RK7/YpNyFTm7Vwz792pfDPNrefyknX0EiMgnpz5FE/AGRRuwyDXx8ds
 Cd3NAmdJD9hgqYRzIHCXrI57DKPeICO9thdQM7/fegCZQP8tzeS+RFpcm0KhfIp8HBPDRo6cQla
 8j01pEmVq5Ix8RqDSIhAasy1KZ/24nKg3XRYAHpvVXm/ngcixLx8/cowVJAjYM3Aj6yboaBW1jD
 KhwQVeeKtuLs4wA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94320-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.36:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C9AA1A8216
X-Rspamd-Action: no action

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ee49785c9d005..54bf21f1c6f37 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +867,66 @@ vreg_l7m_2p8: ldo7 {
 
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
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
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
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
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
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1508,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
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
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.52.0


