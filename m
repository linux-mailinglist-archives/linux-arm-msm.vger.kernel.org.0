Return-Path: <linux-arm-msm+bounces-40268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C59E3BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16BFF164C97
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F06E209671;
	Wed,  4 Dec 2024 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTiEO0fJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7F1F9403
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320839; cv=none; b=LMdfZJL0BqBVW0Rxm66hmQTWZAoRpHEpRmNpQxZCvdQGaATDR9INXRdz1iIAk+69R4VO2TI9tUsj7eP4ii1foTI6EjtO5aa8Xjzm8k9CVTM5e7yYRLx8+uLJttKl+ilQla99mF2uilFW965hbEG4/w7qLz+NKN3DUakGR4T108w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320839; c=relaxed/simple;
	bh=oQlxhyNXi4VLEYzBv6Mg8vKwQUxEbTCMppfaXRioQD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDpYgtAkGG+iB1dq381cpxxRbHDkjpeifFrhm61caKGCu5Lr7MdGv8d+hGbXQp+lIxQqqOtlvzpVIWSAv/gMAsNcu2NhskxDy8H/rQsMCy6WAgUfB8ulh6gfysEhQZOaBFMFAQpIX2XSd4/dxKNzNlB/+yYr6XcH3oj4pE1tU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTiEO0fJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso63579945e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 06:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733320836; x=1733925636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wo1Wzwh3Br92Add/ZhBjQllfXt/4cGMlJOhUAuIwj4I=;
        b=MTiEO0fJhard525zItua4SZIN0pCRUSw1weHkSuXBMB1vkeqyxmRObPSux8Vkgfad9
         G4zPTSIxVGPXb4WFr2u9Mu0oSq4mI2SQ3vlXe1ywO6f2l1myhn+4H1Dbxg9QQHoT6amy
         bTdQ51/JwdJyJyf5DT8Kfv3Zn2wPjvAv5wg3gP4hXLH1F2GfjlgpBPZjT1dYc6zW9VSE
         bqgzyGgnqPD9IfIjd2trA9qAUXYmr/vuh/7Ct1AAOcsUmwlFSJxwD9sH4+6xhy/TMIFk
         zGjAl3qkwNw9qCA8OU+CEyDi5qJOpOWSRztbgxY1vGiGmC+BhLJziUSwGmPk31Zx4kIJ
         0N+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320836; x=1733925636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wo1Wzwh3Br92Add/ZhBjQllfXt/4cGMlJOhUAuIwj4I=;
        b=R/ayvjEO5SRKY1hiC60O2RJDiK0QRRU83d0ahfkzNH3yHsmGvWAYjM+ehb54H8Dpaj
         j1etLxIkUlGYvxh+/ZNNpKXmf78inIzFLSLTcSKrBy4U6uVy91UfrykeT+OEvTI6F/UZ
         rWhKLaTc4EiyATQQ7gwukIe5XyKDz5MklPiVkEbLpI9KJILDWWV3IOfnETH3BxtMJLjc
         nmT+GfaeVTABd2BGCXh+q9mU/KWwfga/CFiMOFuY5xzDhoWBqGoepvhH/TNSWmFP+aab
         C4ucDpvKjKpJZKJqyTezgvq/bxjfGFmjqSidFqykwAENqAnvYL8ZvkxE8/WhsHgkBj6A
         FW6w==
X-Forwarded-Encrypted: i=1; AJvYcCUZF/zzrxyjZW8FVD5zos/S+MmHWp4WkLSk67ByirT+zU4hpfUXbTkXcmrL5XKQygNxGd4jamKpjFmpTFjk@vger.kernel.org
X-Gm-Message-State: AOJu0YyoiAo+TJws3bL/p0yjociRpstp+6LRFgBuJGyirEmfDDCGFEkv
	4nM4VP1Oj/XQm4ECwnhz0bM2VZ136gHBqJE0jGoqSpYQetq9kQqFyNdeDfY/y64=
X-Gm-Gg: ASbGncuDhBq4UxoBd8YwCahYw+I9DbF3MJtzNEbjllvP/qyT8VbYFvmTZ+AAKVlYj1B
	Q5bcuhekKl2y8IC3mINrxaLifBgfSyZ3LTUkraK3OYQ5D4Uc4YdtCg+riAfGLsFFsQ/VvWpDHVM
	h0wvnmbq6HhhQOH7YefIB2GBKTc4srt+R3D4kwrcvB9tvB8WUFJt02fS1uZVsi7GpOsDSYN/aQT
	Cp6854L63Iy2zFu+0WeCZoA8jnhND5LFq/EYPgn1PgS6vgh6jnppFetDAwfkKD4OJWw9mk=
X-Google-Smtp-Source: AGHT+IEz3Wzkbnj/7JvjYGuWMu1+ciM8h8hDG3as1EYvNSR4aLNyIUb+eq8UmZ+7LI9j3XWrrIrsuA==
X-Received: by 2002:a05:6000:210d:b0:385:de67:228d with SMTP id ffacd0b85a97d-385fd3e90camr4308405f8f.21.1733320834201;
        Wed, 04 Dec 2024 06:00:34 -0800 (PST)
Received: from localhost.localdomain ([2a00:2381:fd67:101:8e2:966d:36c4:3579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm13689978f8f.49.2024.12.04.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:00:33 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] arm64: dts: qcom: qrb4210-rb2: add HDMI/I2S audio playback support
Date: Wed,  4 Dec 2024 14:00:27 +0000
Message-ID: <20241204140027.2198763-5-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204140027.2198763-1-alexey.klimov@linaro.org>
References: <20241204140027.2198763-1-alexey.klimov@linaro.org>
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

The audio playback is verified using the following commands:

amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

The same path can be used as-is for I2S playback via first low-speed
connector when DIP switches are configured in a way to passthrough i2s
data to that low-speed connector instead of to lt9611uxc bridge.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 51 ++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index a9540e92d3e6..edfb18c85da8 100644
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
@@ -103,6 +105,47 @@ led-wlan {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qrb4210-rb2-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+		audio-routing = "MM_DL1", "MultiMedia1 Playback",
+				"MM_DL2", "MultiMedia2 Playback";
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
+		hdmi-i2s-dai-link {
+			link-name = "HDMI/I2S Playback";
+
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
@@ -318,6 +361,14 @@ &pon_resin {
 	status = "okay";
 };
 
+/* SECONDARY I2S uses 1 I2S SD Line for audio on LT9611UXC HDMI Bridge */
+&q6afedai {
+	dai@18 {
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


