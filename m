Return-Path: <linux-arm-msm+bounces-102438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEBeJj9n12myNggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:45:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74C3C7E4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 817123007BAE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C45538C411;
	Thu,  9 Apr 2026 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etgFg7M4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C983081BE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723906; cv=none; b=mmzJPvhVrq1maqCfbijFiEErMzd2aLkKAtFq7rYUkIh52toPjJJ9oSK6hQKA/P6U7WMiv8Scd3+csT3v30KWfolta/y3yquVGQFjcVCCZWZe0p+1lYmlFBUBYmdFpvLWyY7tq4gZuDwUgH+arW2kxnDnZVcsSl/z+u5orucZ7Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723906; c=relaxed/simple;
	bh=khwFYCbDm41zThLw4yGVJ4PMQb1Rnc2eS+6YWJp9oUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMjt01Gr0nNfJMZlDw8+uWzuD/UffnpLJs1PcKFaJ5Pah9F1xjaB0Qms7wqvQFOr7XdZscnnft8KmQjl0QwnH0I7/y0ZZND/rfjlXzUXdMJHn/+lYDMA10P4RhjPy8jrjvvkgC1MRgEQvr/Bvv1g1nF6EKrghHKWaMvDJg4LjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etgFg7M4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aaed195901so3529805ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775723905; x=1776328705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12mp4IHDHsUCxnWm4E8gVc3KRHRuPdJHhZVSMmkST8Q=;
        b=etgFg7M4MK7XAl077fX4AQZ4CxOhhYsOoalMnbYJCkMzOvTc708cnK72gqm3lYYT2W
         9WKWPa4GO9yB9uL9hoQnXj3a2PCsA0sxULQIFHfgP4n/02VExARSnCUmQpqOJsJdtjMN
         NYFIt5tGWE+Ec656u3+cjiWbUc01DqYVCMfktRvb0YVBeta1W+NDvzMjU20XeVGZDIow
         heSmU5v6111m5nFClxnU5aabaBEfNSbRsN58dEIFfrSq37aRS0kkgiw9j98yf3Tg0ifM
         /LSmfZKRtaifSeusGuDh0i6WTjUj8Y92ZLDHIan3vScYSoCZahAAunLqWCNhaqh5mKxo
         Z+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723905; x=1776328705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12mp4IHDHsUCxnWm4E8gVc3KRHRuPdJHhZVSMmkST8Q=;
        b=q9L8HOvKEkhWKyceQ/vrMNNyU9OAXBwdXdoZyE74qhYqOKtWI5HBjF0dBMl4oSQ84U
         0AZUGXPfTQYsh4fpyaRjk9WtfHFhoK8YzqLtZxHI20WtmmNpyeqjstzDW2F0tSG7Nbnc
         S76UMM3hSOF89XDJzdvUWqal/q7mi46M21rLWV4/hzTXWhgaKU79zMCZ4xtIgNU5poUs
         G474XAbLarTYTOfwTi0kr7sE0anvJi891ATd6BM7aF0Yk3O4CSswidGl+EOarRNZLQNa
         lUxFl52ocIGPEeadPXxiSP1kHiJH3x2j9NtBaOlFpsEXXzGdAPyfoOosVcq0vvR3y9kH
         QxRw==
X-Gm-Message-State: AOJu0Yw/qHlVSJGFwp9pdeTDHYGGRTdqI92bNc/LCUdNyC9KQCep2T9R
	1zTa551rrYKpQuoqX3M8LIzQoYCyR1D/XQW89hgPjcfebLnb+4PH8fR1
X-Gm-Gg: AeBDievGw3kII9TjPGnuUL9lm8VK7XBbL1vo408IPqeMpAM37AchW4Whymjw2Fg25QJ
	fEWPqFJVhvaaCasPcGtAtgzPu7dWk44sLNarU+zWFMq9uJ3o/eU5eZzfZg8tpIfmDiU7RP5+0dM
	7RQTn7Uj2oxBjXKp9RQLz/1wPEh5nGc7YzPSDIKVeEhTNujx+hkIHfSsabCPNV5RZuBIVWg+SoU
	zmIr7ZITjCsMNo7Bg5yafaze2ROa7pJH52cr52r6sO3XMumj9dgh7aC5d/tbynZVDTf0WJKw+r2
	01cT7yVOjemS78BXcAU/PU4oZZzrZPmIXfvavU4/1yj24TRXYBMMKZl4PRdjVA9em540P+KK/21
	8UXTs2vqjjQ9DSfbyWclLJWtEl6CuVqaO9rOMM3hBQOvxF5V3Eoq2BqPJgS2sjCriB85yhMk2iV
	7lcW9b6U/iL+PXbmBzO5QXVroyY/51eMy1RKJ1f6+nWtlJxj24qY1+B4i2uJJhK7+EjF4H
X-Received: by 2002:a17:902:f611:b0:2b0:5cb4:d894 with SMTP id d9443c01a7336-2b28173fe0amr278347925ad.13.1775723904538;
        Thu, 09 Apr 2026 01:38:24 -0700 (PDT)
Received: from tomriddle.lan ([2406:2d40:64ea:4810:73c1:d012:263a:f41f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm224497585ad.52.2026.04.09.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:38:24 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH] arm64: dts: qcom: x1e80100-microsoft-romulus: enable OV02C10 webcam
Date: Thu,  9 Apr 2026 20:36:09 +1200
Message-ID: <20260409083609.75341-1-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102438-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_SPAM(0.00)[0.993];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.3:email,0.0.0.36:email]
X-Rspamd-Queue-Id: 3A74C3C7E4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire up the front-facing OV02C10 camera on Microsoft Romulus by enabling
CAMSS, CCI1 and CSIPHY4, adding the sensor node and its endpoint, and
describing the PM8010 regulator rails and pinctrl states required by the
camera module.

With these DT nodes in place the webcam can be probed and used through
the upstream OV02C10 driver.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 14b5663a4d48..9e910813fa48 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -857,6 +857,57 @@ vreg_l3j: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j>;
+		vdd-l3-l4-supply = <&vreg_s4c>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {
@@ -867,6 +918,66 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
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
+		avdd-supply = <&vreg_l5m_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
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
+	vdda-0p8-supply = <&vreg_l2c>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <100000>;
 
@@ -1441,6 +1552,22 @@ wcn_sw_en: wcn-sw-en-state {
 		bias-disable;
 	};
 
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
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio225";
 		function = "gpio";
-- 
2.51.0

