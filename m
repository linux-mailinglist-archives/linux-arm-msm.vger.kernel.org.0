Return-Path: <linux-arm-msm+bounces-77383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902EBDE770
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09D754E8195
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46312326D68;
	Wed, 15 Oct 2025 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEktIwMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD376326D5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760531298; cv=none; b=nckbkOG8Cn9jEEM2qK1BQHtKTBBexwX2m4JFKLxbcJKSaCaL9+ssMqnc8ERPKdv/98Cys6aFYHFeJm2OlkGWWseuYkJGn3N+KmK2+12tweh9Q7A4K6CgvEw79zx99lFIoWTJzfj9PGKvelTZpFqwQJaWrAxJ1F+RyZG5x3y9Aqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760531298; c=relaxed/simple;
	bh=Os5kE7Qp904fgsLtlKi0tEm+/ya14jhuJ1TcRTMG+jQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pgTitebUlCIlnbGjmmdzAZXXRIgsPzX8I0UGh6tPb1tNDwQOUMDdoeGgoBdX+IK+tq1yYcZAF/j1PlaWTyp7odmTNQHQ/SN1OUGJ3Va+9SX9vSDXgw/P0E57pafSvqzkQDzG0j6UzzuRmwsPDBZCD+EEe8LVbxp+mCXfj2VyzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEktIwMp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-271d1305ad7so101979965ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 05:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760531296; x=1761136096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/4Q1O4To4aHXOUJ7WUI51pM4khtah3DJn+Z1/RRGrw=;
        b=iEktIwMpcVWpHHVMbvDks1bbLR23IVav9X1qzcwR3MHrWCvIIDTWyESyClVHKKVJk4
         RlSk+mE9jUj/sOOGHjpFZA6qRMii1HeGaTd+EtuUtR3bS1gvrWZ99eUTrZebOuvk36uy
         8nIXj8y8y11HesukPQV+4xMO1kLgUCA9GbztmVrZ3vV3XHwfdlDCNLTJHVq7IqGDcdb6
         wnwjm0xRmUVTRNa/iL05XgmhG3OZ/bC4kKQMxe/jFFa9Ex2N/KFGf5553OwiNCHM4gdk
         5rCp8x6eV20KdCb6AEeRjpc8fL/lMFJl0/ujm0TZeM+Fe88AAuCMFHdhmCbECAPnot3+
         ysWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760531296; x=1761136096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/4Q1O4To4aHXOUJ7WUI51pM4khtah3DJn+Z1/RRGrw=;
        b=rM2OWPL8NR3jFevlOnoiOXMYtoj2BWhtLEjUW+qGVOD3ooi/sLgPKJHMp3ZUyDNs+W
         XPz8vT71LxjRhGfFZWmmA0x3ZSca3ImquYrDxx/efmIiLf/9NyuwYYkwCdiE4MU9PG9N
         YRhEhjooH6ApY6QKONVN1QzsicmQNXReJ7/9uS35cX+hWjHQce94b9iCDKbGIXPaXInC
         PmK7h6HMbnjWLcVdhjS8A/Dk3sFvqryJWn06WNZ86YDFRqKkaUyJPuwIJ4CFA/Yc+494
         kVWpos8D0PEkWsCRbyVStSS0P96L3/e3VTLsAR81ByOFmFssnemp3hTUtG5SSG0fc8Kn
         JikA==
X-Forwarded-Encrypted: i=1; AJvYcCV0WGBYoDPQYw5O4cDTw1rVc0KyVq9pKEEt8lnQoBv0PqAWd/VT3Zp9fhNcClPuh3Vy2aGy+Cpd7GNVubdE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1+RSj+LDJAprg4LtvMe33ibmE1mnWEoyYkpcNIFStmUbtQlNa
	WnFNxCWlhzD46TXuagb4Agv54l+30Ttx5pEV7p5y+CCxAuD04OvA8ofH
X-Gm-Gg: ASbGnctjQgYpqIsB6o+OcaQUSEjwAGz5qmi/PrYNqPVt3CrE/jafkGxRd8oIl/rNEJ5
	J4WW5EE8maK97ORHAEIr1fyIXeZN69Ap6z1fq19J9VwHn6sOs2zYpUDpo1AwckZuOxOU3athvyU
	I7OfWj7OhZb2WKhNpvb0vXXH8/BJM4221AC/IIVABt6mvfsOjTzDAHF2FjVoDNF7QTHTBn+8hEH
	uCmpaB8Sm9gMd5vekcGSMprZgWqzwRCgajcK3W1JKcKug1OK7c8kKe9RP/XyJa5kbZjzsZrK/RP
	Bu9hZQOx1AHReuOIKYjbcmOCtg6gVXw2cjaFCG61Go/TISiTXq8cJygEz3qtLZMaj/Isn8/0gvg
	oExC7YMJC6u2Ig0+SUwOHqWh9Ild/OC0qY/MDu236nG3Ske/rCZnbsNz55ICdqRLORCOfZkH9M/
	VHvA==
X-Google-Smtp-Source: AGHT+IGBXsur2mXMSiVFdUfO/wNEz1AR+AmHWbQC9W/DI30eL7NtcHOtDsGmRKWzPjI5I7G9dDsy5Q==
X-Received: by 2002:a17:902:fc46:b0:27e:ef12:6e94 with SMTP id d9443c01a7336-29027418f97mr362061355ad.55.1760531295849;
        Wed, 15 Oct 2025 05:28:15 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f87b23sm196688025ad.113.2025.10.15.05.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 05:28:15 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tessolveupstream@gmail.com
Subject: [PATCH v1] arm64: dts: qcom: talos-evk: Add ADV7535 DSI-to-HDMI bridge
Date: Wed, 15 Oct 2025 17:58:08 +0530
Message-Id: <20251015122808.1986627-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hook up the ADV7535 DSI-to-HDMI bridge on the QCS615 Talos EVK board.
This provides HDMI output through the external DSI-to-HDMI converter.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 21 ++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts      | 76 +++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 55ec8034103d..b58cae02c9cb 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -244,6 +244,27 @@ eeprom@5f {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&adv7535_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
index 25057f4f6a91..f7e8be3667d1 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -14,6 +14,82 @@ / {
 	aliases {
 		mmc1 = &sdhc_2;
 	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	vreg_v1p2_out: regulator-v1p2-out {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v1p2-out";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_v1p8_out: regulator-v1p8-out {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v1p8-out";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_v3p3_out: regulator-v3p3-out {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v3p3-out";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	adv7535: adv7535@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+		avdd-supply = <&vreg_v1p8_out>;
+		dvdd-supply = <&vreg_v1p8_out>;
+		pvdd-supply = <&vreg_v1p8_out>;
+		a2vdd-supply = <&vreg_v1p8_out>;
+		v3p3-supply = <&vreg_v3p3_out>;
+		v1p2-supply = <&vreg_v1p2_out>;
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_LEVEL_LOW>;
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
 };
 
 &pon_pwrkey {
-- 
2.34.1


