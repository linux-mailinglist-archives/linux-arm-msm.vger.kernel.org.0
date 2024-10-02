Return-Path: <linux-arm-msm+bounces-32919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22098CB33
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 04:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B097B2201C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 02:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B2A5FBBA;
	Wed,  2 Oct 2024 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="un5WUHSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E924EB5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Oct 2024 02:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835638; cv=none; b=hI/qMCcPbR7Fld+136Ngw/GEoHzARRk5MuQ3FgVgB0gO8puHu2H47swYFhvztgOEGjEpW3h/70ltKXqTWp/ZJZm9PXjLNEhujLew7s1kvTOvmBUcj1Md8IA871HVpc60cOe3f1hrhRd1DeSPOlAX09dNLo4iD72/DUqdErVcJmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835638; c=relaxed/simple;
	bh=ULS7v19diYZOA4yWMObow1IhNGxKdw920LDv9hjWWKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR/TB2JlDPvEzTekLErwtFNIfEFyd7Ut2l9FfIPqbNv8M3GTniEqZQJ5GuhykqR+Sfe83rYZ5gtRmz+m30cNE+beX3E/uQh8prelEPJKanNerFbGsLgYPw1T5q5EN/U+yDnvSqVki24Seyci47+1Rajm7olquB85BA+jGepx7aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=un5WUHSI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so4340822a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 19:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835636; x=1728440436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/fecHAusQTSWcNvNWVR1JO2nQmW0cI1ww9wmHUrbrs=;
        b=un5WUHSIolgMTPH+bJzkRk85RdKTr8UsHz5TZ24QOlilgqytvNJC/tpCuRFtO4BkwL
         xCNggz3fzP+2rSEqwSW0Q4nY4C/5ohxTZ45UEi1EyO4/ub9dKVwx3j1KGDzQuYpdUZ3Z
         Dh16NNCEglHUJ+ZVX/+ZtAp82py+xgxpMbvRl2LQujrRH0HkK78jETtKemE0ZU0uI6sd
         KCMvwiCHlQNMSa272TrvmG/fysYkZcqrTdBm2hI0FHBh/AMp2mMdF+kOgZRBdEMYXg6k
         uV68gHyxwBavZOOfcbp8SnjlWxODiO4ASXMkvaerufTI9GqL9TgV6hpmtPBKmXCVwxxL
         ISmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835636; x=1728440436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/fecHAusQTSWcNvNWVR1JO2nQmW0cI1ww9wmHUrbrs=;
        b=ZD6Xsdzvves0YaWSdGx6mN5oCX6r5Qekdl158VZEsJGsAZF3XeEFWcnWcFS6KIkcE2
         tIN3Z2I6aY6TSTdl4FSaLRfV/MBqZpBOHSzuGp0zp5FzlxwrJymNCbTY65QV+MP2GPiF
         NnrmegGryRGuhr3+K027aWlEO8Bq868+sokMyk9mezrAq42MuyZwjQ7Ap951YGXClsFN
         uCjbAZgnEe39Y7EZq8VQlg/ChnQOOZXnoMhmM3K537Nu1YNCxjTJ1BgB92OfZGtihh0A
         itjqZWOddjuht3c2KddEmXd5Uh/o8Cu33F+CcLGHGcZq9x4xPqubmxaHs2mANmYTILwY
         OChA==
X-Forwarded-Encrypted: i=1; AJvYcCVa8XtjDas7iH32FgrcHmx55QooYarYP2L8faiNZaB+f8CxCMcDDvClvsJWM30jYyC9CdcMei4mCeohTjCn@vger.kernel.org
X-Gm-Message-State: AOJu0YwpZUnAVLnz9cpnH59Jes/3BBg10F4zIAZuV+rVhKBlGvLx3UGy
	EtBU5/wo3FBmbq78lJkbjWdwHyOpUKSig7C+b7E7CXBb9IXnnfJQNXXCwZuf+LA=
X-Google-Smtp-Source: AGHT+IGSWbnUX5pepZAtcaQL9h+8bQ2G+ar2GaP4ub1B1kbGdQfmXR5BpalUGXI74HFkbN9vCYhdIQ==
X-Received: by 2002:a17:907:6e92:b0:a86:79a2:ab15 with SMTP id a640c23a62f3a-a98f83d7a73mr142020366b.40.1727835635620;
        Tue, 01 Oct 2024 19:20:35 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:34 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
Date: Wed,  2 Oct 2024 03:20:15 +0100
Message-ID: <20241002022015.867031-8-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sound node and dsp-related piece to enable HDMI audio
playback support on Qualcomm QRB4210 RB2 board. That is the
only sound output supported for now.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7731681688d5..b8bc4452ca48 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm4250.dtsi"
 #include "pm6125.dtsi"
@@ -103,6 +105,51 @@ led-wlan {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qrb4210-rb2-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+		audio-routing = "MM_DL1",  "MultiMedia1 Playback",
+				"MM_DL2",  "MultiMedia2 Playback";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		hdmi-dai-link {
+			link-name = "HDMI Playback";
+			cpu {
+				sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+		};
+	};
+
 	vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_HDMI_OUT_1P2";
@@ -318,6 +365,14 @@ &pon_resin {
 	status = "okay";
 };
 
+/* SECONDARY I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
+&q6afedai {
+	dai@20 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.45.2


