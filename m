Return-Path: <linux-arm-msm+bounces-76487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D65BC6602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C04D34ED6DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C54D2C21E2;
	Wed,  8 Oct 2025 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LN6ytmQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10927B50F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949821; cv=none; b=R4Ii0DVQDdgn4zW14rmYx0pF9nuauoxG9fCymfcdBYclGYiauH2uSOUH7yXzo4ty766X8hhIZ9ad0k7rJgIpJRMO56JhBcl9mJ/IcMbho/6H4pYTtlW8lRPxqjxs4vPeMUDit3MwI/YvUviIrsgfDfTBmaFcEKvIUgq+Fb5HPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949821; c=relaxed/simple;
	bh=7XTSD+DcVKhNzFeyRU/magqYZ1NDagGF96Oa/mMURtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A5aD2gCfv5o7ho9woPi1/9CnZXevqr6pel6laXy4vXTEIQ1jBf2k7ZAT4tt0Qt5Ah5VDM9ANhK3PMfVztJ3UntNhT3KTLR6tQdbiQKm123EguuETh5QUUUiKEp69G49O8UX93y0i2Vj3lSRwakZhlidUPvPyd1FIgYMmpqtcyfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LN6ytmQN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f44000626bso196732f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759949818; x=1760554618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiZQLPIj7oURX/aVK5meVV8q7EcmiHH/q7vr22waMhk=;
        b=LN6ytmQNJCcgh/JQ6o6j5vmlIE504h/2e2MYtae8BuaVLNZNMqmZS671tFGJYFgrH1
         FHt5YDYPwZdNobDw1ohpU1M34FI+/9GeZWGL7G2YkYjXmjux3IcjzJCKIiJUFcqSLktZ
         nNkOpS1+J75PA5ItuB6d4QfRsWgtDzvgzduZcgFBwAsaYc4r1VovtBGjzalzBqYlISPS
         3XkW9petxleMRIt6IFC1QHCNy5an5E0dfEk8hVitRtTlkvPtYEObQdt9mN9IWIdI6YbG
         pyPSY71eoq09WLZp6FSVkkRT1WiBFiBzjpmGOIGEpRov/+GfIWKfbbXK5RHBfObyWHeJ
         riIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949818; x=1760554618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiZQLPIj7oURX/aVK5meVV8q7EcmiHH/q7vr22waMhk=;
        b=OqNCPWTqQwvbONQOPOApFW5yKXjgfZdMYTpNIsEhaU7SH2K6gtvCJPo8a2wvtM+PL5
         s67FYPTbhcRf6BxAALQxQX2sc/scu33TjlYL7OjM9QnGBn5CqXQJw3+XrLiGLET4IRbF
         NX02lht7hz2eJqeQk/NubSgYh1PWUTVbckPEZrBUWk9MunQoaVN8xK7aNT8gg5wR9wMk
         LGEQ0mAOLC6FvSmdmAR3INrV8Q6JZt7w6IGyJG1wHxkN8oCaaONWAyb7TgjyzOBsRKbj
         GBei4KyRoW2486zckK7CZCJv3B4r/BPG7ZOG+QXVALXnjzRRPJUfwmtEZtqdOHKw7stp
         RnPw==
X-Forwarded-Encrypted: i=1; AJvYcCUNKkkle5+IyKl/zw+7mD8NJ/0OhabJPEtrv5vWOzTUBsDbO1nA4pbva1Co1rNzGkHvDjdpiF0MvZJMAf8/@vger.kernel.org
X-Gm-Message-State: AOJu0YyhIOAecLDC3OIxfuUylDVNr2p1LhW5P5xNGD+44rSZsDYhoaSS
	xPYtGBRQrEd5lPwNQJFb1XXVIYniuDRBUnfDFsQYAU7Z1plocj9Sm9Jd4pDpaVhltSI=
X-Gm-Gg: ASbGncuRrpSMHMwQuOfE3b8JZu4i8toTgmmnGUbvBHo0jjmAuKPCAsWiIfwhFt8QzLT
	STHPYagoPFJIpD809hlwaeb2/hEOu/b4lCcfHbhuaKjZRWU8DixmkDLozqML1BZlI+rB37vKTMU
	kdYMgXBz8IjkOSe9cFkSYUQ8Qa1RVyRP+4CKgBQ1e5xhUTuCisFlN3+61+GFBDnrBVqvynZ4sdk
	538HDhIjsFrvzTunSXexQ/fXNkmT43s78fLfWA8KnDgQrokcuCDEYNzzwUueiNWdKlh/etj+nwi
	HVMqnt6THmb7Vc0dXHhDFh9c6li87GzWVSlLPklg27usXWgQhhXdNSuFkhmLjJl0Fqq9/nnstqW
	K5nBp4VhGzxJzHwR86XIuJQJl3hZz0lugFK+dpzMg9eUQPVlSwEGRI4B9m6WA1muZ+Hbye58=
X-Google-Smtp-Source: AGHT+IGN0ymspSlj1adZv2o4cYIlgAjhVVoZnt4eImM2+z4+3AO2JGuQPOMQrlG8FXjJkjiKbxwEYw==
X-Received: by 2002:a05:6000:2410:b0:3ec:a019:3944 with SMTP id ffacd0b85a97d-4266e8db288mr2637577f8f.43.1759949817855;
        Wed, 08 Oct 2025 11:56:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e96e0sm31029735f8f.33.2025.10.08.11.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:56:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Oct 2025 20:56:51 +0200
Subject: [PATCH RFC v2 4/6] arm64: dts: qcom: sm8450-hdk: Enable I2S for
 HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-topic-sm8x50-next-hdk-i2s-v2-4-6b7d38d4ad5e@linaro.org>
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3019;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7XTSD+DcVKhNzFeyRU/magqYZ1NDagGF96Oa/mMURtI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5rP0h3qoC1w/mpnCdDfVslxccXRPm/l+l8E0MoQ7
 XNzCMPeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOaz9AAKCRB33NvayMhJ0Ya1D/
 9yaZBIXg5qgeYfS2tk2gjyt8jzfkse0r4vXhR160ECEF9JKZcND6lxhebNGfSu2ZfOF0hwYUKeoolf
 K+d1tcb1x+4h+q7W6/oCLpK6u4MSUEjJn/0R2dSVkras7Qj8NPJDTVYXeNmqeq4HqxlN5rHrYNmw0n
 DeXvbr4km67vWWp9uN6SRNTKvqmzLj7KwLgTrH/hicl7QS1jwvv3mCne3f7NGc+kWRO730tJTNvYb4
 1ST/HDcnxJNJOliX86g+LADg6y4Ls2vdzo6oJFzqzm1ISCVce4ErcwLAD/wKiIXb70J589qaLK0kUn
 7JqRus7V1/QAuogpu/3qswPSmjqnEZEEMlokx3UPKhq4/DWfCnzJ0QqC3R0+BZUKOhOZHa6Xq2RcJy
 3IQTHZqpv73QSGZt+voHueHpf7ZrknL3MNRbzcveKxu3/DNycALVxbOVJx/HYe5iCPifZeB4Drgn8G
 yYcwVFxh/yWkL99bwO8MRwhK6zEv5LCR8XKdXgTDKjhf3XLD9Q9AZkGMEeYaoJnDEzEUkw4xU40x68
 VldKPL57XRvrXnvXq91oF0+8tqjPlOBquFRnrnqO7wZBtw4iyfTm2qAntWSL7y6i5dwt1NrXY4fS7G
 6vlFr8cEbLyJ46U6SidYKaUZYpHBi+Kh4SLAUSN9gaeTI0Oi9xCRYj32isBQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 26 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 0c6aa7ddf43263f30595b3f0733ec3e126e38608..7b822086a57c600ae9b5668d6d7a375d0ec55fa7 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -667,6 +667,8 @@ lt9611_codec: hdmi-bridge@2b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
 
+		#sound-dai-cells = <1>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1016,6 +1018,14 @@ &sound {
 			"TX SWR_INPUT0", "ADC3_OUTPUT",
 			"TX SWR_INPUT1", "ADC4_OUTPUT";
 
+	pinctrl-0 = <&i2s0_default_state>, <&audio_mclk0_default_state>;
+	pinctrl-names = "default";
+
+	clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "primart-mi2s",
+		      "primary-mclk";
+
 	wcd-playback-dai-link {
 		link-name = "WCD Playback";
 
@@ -1079,6 +1089,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	prim-mi2s-dai-link {
+		link-name = "HDMI Playback";
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 23420e6924728cb80fc9e44fb4d7e01fbffae21f..5ddc1169e8c23327261820f7baa31983a3eb0bf8 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4288,6 +4288,46 @@ qup_uart20_default: qup-uart20-default-state {
 				pins = "gpio76", "gpio77", "gpio78", "gpio79";
 				function = "qup20";
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "pri_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "mi2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "mi2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "mi2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "mi2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_tlmm: pinctrl@3440000 {

-- 
2.34.1


