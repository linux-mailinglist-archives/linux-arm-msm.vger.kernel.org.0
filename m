Return-Path: <linux-arm-msm+bounces-105370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCKaGmZZ82lfzwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:30:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 625C74A3767
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28141300D573
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC934219E7;
	Thu, 30 Apr 2026 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="imfRiAs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E64266A1
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555310; cv=none; b=MH4/r7ttv5F1lJc+MvmE/t9r75AaVzG8YAC8vhGCt8FiTrgt9KOSU19IBNnR5zNUWukE35c0AQHMbbsItjfA1uxcUoGocimA7CGxk/Lwd68smctgEimad2JxHAAcgoiTM37LN9rc5d4kDiy7uPvZifoJe4b9wYvBV+EmhDtOLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555310; c=relaxed/simple;
	bh=GqRGrNLZXVzhBSOIsCYxa32HgZ4zBg0+yUDiq0uerkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSQ9M59edlaMUSZJ48OdxMjvLA8ganUR+LH3/ZYhFPUGgN8p5dAI7cYMhkcyVtq6/CVb3l7nsJmDl7wQW0sZ3BHDqJ4Y6a2YAeKxgCancWUnEMwTwZJZj6JbssvAHBGvdCV9+Se8j48qgRljDSbo5JMfPyOQBp/TMBsPgSU7nxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=imfRiAs2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso20140015e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555307; x=1778160107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V2mrc16hrnhb507yXsAugmx8ywjiAaffpYxLf0PPSI=;
        b=imfRiAs29jnWpf/BBtEO8wB8Wqz5ZtHnOmHwJqzMfxAFANrUvruIMt+tuQRPBptE6G
         o11oficBhc0WLyZCCV7Gq6j0TNF1ACV5moUSR7zPZbLHhk5TbH/+E4bu7S7hHe1x85fd
         Cqm9ajErfkq4P2AADB50FlfegCgr0sFUHtr9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555307; x=1778160107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4V2mrc16hrnhb507yXsAugmx8ywjiAaffpYxLf0PPSI=;
        b=WY2bR/iCGu9ZG4yef+XglfVrI3UaBhibuqtr/u5U6ie2YuUOaanVGpif6ch/AE3fZ4
         9+ZIJRxah+Zv/oov4pmAaMhbqjK3g7EQ3i0W9qIkzTxgbBdPgN3p3CtUWLBciwwaJKJ4
         eSJAXG/5Ww63MlkMFjr0Zym85OCBs3sY46gd4PMo4VitYHT2W0BoDPh+65fQ2lZRHuHx
         T/cske9K9IR2bF74A/7sjOLeX0p6wrivzuIcl7D+i9eNRkLkSprka2oJbvKUzV3nVSUW
         2qTgWqLsRRpWFPM463EfxmQdk91Cqe3ZJSqnDEFAWBjnLZHcL+Rlzts27jyeTuOGz4IS
         NhVw==
X-Forwarded-Encrypted: i=1; AFNElJ8/qXw3byP6Zjz9tMIbvXYtTM4Ti2A6Zgvjg3PYlR7z4aESizDqOjeqWX4TASxC4P/8Oq4QKQpCN1J4xMwQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyhtafDg94JbYwW8b9nixVbIu2PkzaCHZhbmDsnNu08d/hBQ1t6
	A3lr6xTHEY567ZcfeEgvQU1StNrGq4WVjKBbmtnGYSeYLRoN7UYPEVQJmSNQp/Mp1W0=
X-Gm-Gg: AeBDievmyZ+Sae+8ZSa5SVmP98FSJAkL3vOD2S49+/NPOnjarkwQC3ss0FwVsy7G6uD
	Sf8OiaM5NmA8UiNk+mLdVKD8ArkaTCkKdff7SYFHsPC/q+k1uJ27HxNUd8vzLY3E3QOlB7Nc0kU
	IVB1ksZ9C2z1J9Ibd7WU1gAfL4hPa1kyzOVJGZ6EL2e/9rn7wWa0HhaKbfLq6VZZQmUGaz/unyY
	jnrSd/M0IyQzGNBNCfIZEPGkspDc96DxdlVgZyA3NvfTbWHNf1HteuM+xC0lLG/nu8VAntbuV7d
	FoKMsb+Io9QEp0wio4uxtNr378g18aqNuOpnHzSv5PdJzJpq6uKpkJg0cktD1mMiCLLF7eLuVCZ
	8EeVTC4Rr8Nv0uGIWS4cyK2u8B0d90nHPRI4H5Ktnb85D/BVjGK4bxFDC2YAO90Mnz6pJQXlLWR
	h8RboYVdRrypJVXilVwkViel579u7rSLPQz//YBqJwbIsmwKMMC8/gvzLFTNcn2njkP/lQ1CTae
	TjlAA==
X-Received: by 2002:a05:600c:5286:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48a86085131mr40450345e9.12.1777555306711;
        Thu, 30 Apr 2026 06:21:46 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:46 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output to dtso
Date: Thu, 30 Apr 2026 15:21:39 +0200
Message-ID: <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 625C74A3767
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105370-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[arduino.cc:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[arduino.cc,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arduino.cc:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.794];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.58:email,arduino.cc:email,arduino.cc:dkim,arduino.cc:mid,0.0.0.18:email,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Spam: Yes

From: Riccardo Mereu <r.mereu@arduino.cc>

This is done in order to support different video output over DSI.
Since audio part is linked to Analogix USB-C controller it is moved to
the same DTSO.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/Makefile             |   5 +
 ...ola.dts => qrb2210-arduino-imola-base.dts} | 122 +++++++++++++++---
 ...rb2210-arduino-imola-video_sound-usbc.dtso |  61 +++++++++
 3 files changed, 168 insertions(+), 20 deletions(-)
 rename arch/arm64/boot/dts/qcom/{qrb2210-arduino-imola.dts => qrb2210-arduino-imola-base.dts} (85%)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..e89a0e77072b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -193,6 +193,11 @@ qcs9100-ride-r3-el2-dtbs := qcs9100-ride-r3.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-base.dtb
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola-video_sound-usbc.dtbo
+
+qrb2210-arduino-imola-dtbs := qrb2210-arduino-imola-base.dtb qrb2210-arduino-imola-video_sound-usbc.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
similarity index 85%
rename from arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
rename to arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
index bf088fa9807f..fb22effb9a35 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright (c) 2025, Arduino SRL
+ * Copyright (c) 2026, Arduino SRL
  */
 
 /dts-v1/;
@@ -110,6 +110,106 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	sound: sound {
+		compatible = "qcom,qrb2210-sndcard";
+		model = "Arduino-Imola-HPH-LOUT";
+		audio-routing =	"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		mm4-dai-link {
+			link-name = "MultiMedia4";
+
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA4>;
+			};
+		};
+
+		hph-playback-dai-link {
+			link-name = "HPH Playback";
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		lo-playback-dai-link {
+			link-name = "LO Playback";
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		ear-playback-dai-link {
+			link-name = "Ear Playback";
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		hph-capture-dai-link {
+			link-name = "HP Capture";
+			cpu {
+				sound-dai = <&q6afedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>, <&swr0 0>, <&txmacro 0>;
+			};
+		};
+	};
+
 	vreg_anx_30: regulator-anx-30 {
 		compatible = "regulator-fixed";
 		regulator-name = "anx30";
@@ -165,6 +265,7 @@ anx7625: encoder@58 {
 		analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
 
 		pinctrl-0 = <&anx7625_int_pin>, <&anx7625_cable_det_pin>;
+		#sound-dai-cells = <1>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -198,20 +299,6 @@ anx_ss_in: endpoint {
 				};
 			};
 		};
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				anx_dsi0_in: endpoint {
-					remote-endpoint = <&mdss_dsi0_out>;
-					data-lanes = <0 1 2 3>;
-				};
-			};
-		};
 	};
 };
 
@@ -225,11 +312,6 @@ &mdss_dsi0 {
 	status = "okay";
 };
 
-&mdss_dsi0_out {
-	remote-endpoint = <&anx_dsi0_in>;
-	data-lanes = <0 1 2 3>;
-};
-
 &mdss_dsi0_phy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso
new file mode 100644
index 000000000000..6fb256498cd1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2025, Arduino SA
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+&anx7625 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			anx_dsi0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&anx_dsi0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&q6afedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	#sound-dai-cells = <1>;
+	dai@18 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
+&sound {
+	pinctrl-0 = <&lpi_i2s2_active>;
+	pinctrl-names = "default";
+
+	hdmi-i2s-dai-link {
+		link-name = "HDMI/I2S Playback";
+
+		cpu {
+			sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&anx7625 0>;
+		};
+	};
+};
-- 
2.53.0


