Return-Path: <linux-arm-msm+bounces-76488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB0BC6634
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDCB3C270F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D7A2D0283;
	Wed,  8 Oct 2025 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ewp6Faod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239832C21C5
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949824; cv=none; b=PKt3CqJzeHlp89uNnIDt50d0zGRqj3ObsfepRyay4FvTR1TGe8zbj5c+4obOT90+23X5AdvV1hfCOfzxmghMdfSS0oiEKuOnSUx2cknawD6DXuTsKp6PKPttqhAoe4qE3MkV2i9SXGe6WGSk4xg4BSOMkrOA2JWrnt7cRgyYNRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949824; c=relaxed/simple;
	bh=VR6dMtQFlUqyXkTOBw7VzCqTi7iU47yIJOHH/q6KrsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/y/8JO0KNJVPrXnAVOnJNCsOiI5ryOnkMFezsExlARoySBsq2tesdLjytvLYef9TnhR7P70q0zsZ4MUZbBYEEquwtf5dXUVnXW+NwHLq8+9SIwduW1cqkv18aPuUkSH5y7fhyvkDIJFfDp1MeOxmI7wzGkLFtqd8G2OzeMl/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ewp6Faod; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3f44000626bso196747f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759949819; x=1760554619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOOFxG03P7yB1Cqo1iuCOyE1bExy3dGIUFcsRsyL8QM=;
        b=ewp6FaodzZTU1dGRIB6KsDoB3mqOEwTIsVR15SAfzV8nU0C2ftTJ6V5QPSovg2/0F/
         mhdg0EFmE4/CBJpNcT16VSk0HWqRp09W8hRvX13jm19d5VVNBIXyqqut4xDM1wCyA5Z0
         LHPCry0SKZ6YwYsCY+yR5INFzsYmXkZC/opjlJkceWWAVucIadhn/iQeON8GA0xUR3Cs
         9ucfwOtVshvc1b0muCx3YEZevS1RkfH9NttYC2YP8NlU1SlMsU6cl+UpTlvx7ZEja3RC
         KL29GsVFDZns11dP+HTeCY9qVU8/NjgxMNj8wopgJVsT3hl89CTYnoxED2fXAS5pEgkx
         Q1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949819; x=1760554619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOOFxG03P7yB1Cqo1iuCOyE1bExy3dGIUFcsRsyL8QM=;
        b=W/xxByjZmxWu5//n+OZ91y6lu4zlcSJ3wgAQMsq4oPHWYIBrfEgCfxzucnrEBrFIxS
         mGE9YYEPS7XivuskuPf0qwaGFLx0rP/IFuN1+FYp892ITRXvlkKFk6LAE5iadjX4VI+V
         7Q00EoGK4j2Nh5aaRC6qCKeihE49u1zWM7P+AnkYxVslyJp0AQD38Bq29Aj/uSzTtCMY
         Sue/okeUa+8Kzv4BrlTbEBH8YQMGTqXl6fS6Ev4K7JG5vKbBN0zJz8vOyB2Lyyvp68RW
         WHIv8VUHTU1nHu3aH97tzNYlYXGgG4hy2LwpyLH66ndaAnTKBZYAN4X0YlNb5VuULYNM
         dwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe23/iE9Xya1NJT8WSxQF4TOdqCo42gSgwi2np7bnNYlHtlt7+InZXTlbrKpKBvIpa/ke8D3yFvejGV3eq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jxGQLc5B2DBj64iAunJs5fMZuAYhe7mnwSPvzxflKxpme7qI
	G55z9iELgckAh0J9CKsyDFgQVSqKL3SDo1a+s8nqAm+4qiPtKWCHU6gxYvCW49tGz/I=
X-Gm-Gg: ASbGncvBoF8CXJd/bmr7IUb6tDnzAyJZem6ysh7P/118qfn8kpRgVqeV0S1103p5956
	J3Dwa78q8AXasZ53fBQXvLyGGIZXy7Vbg1UCn9dvYrxsiN695xFcK8jMnQSf53el5r5YmzpAaSG
	NT6Gim2W+db/J1B6maxyqxgP4alZ9t1h7F8G65EeOBqYuy8ULvW6663DnMtb/jOh2U1ZKRfURn/
	OFeGiCYNpmHrphYYB8VmKtZEMXUhvA04kB6rFH9Dprhoj4yG+Hj9aAne2yRxUp93LvorY19eRfD
	b7CcICsz1W7VCVX9Yskqw8hqjTosyKzqpTF6tB1DP0Lcl9USW+RbEzeoFqJZxIN6qPvUyH0WoEn
	KGK2r333w5Lo7QUGyY+ZntvhdRAF9xjJv5qO0fYNW/5XMCRkl40nXjk/jhYGoPwT9S7HDDtw=
X-Google-Smtp-Source: AGHT+IFOkWhGQGiT0dp4ICTg0TkIvfUECbXMM42t3JWFvFwW+rK+Qaq/PoOe/vkJ/UbLJqvfCqQJhw==
X-Received: by 2002:a05:6000:2891:b0:3ee:1523:2310 with SMTP id ffacd0b85a97d-4266e7c203emr3004379f8f.27.1759949819408;
        Wed, 08 Oct 2025 11:56:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e96e0sm31029735f8f.33.2025.10.08.11.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:56:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Oct 2025 20:56:53 +0200
Subject: [PATCH RFC v2 6/6] arm64: dts: qcom: sm8650-hdk: Enable I2S for
 HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-topic-sm8x50-next-hdk-i2s-v2-6-6b7d38d4ad5e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3004;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VR6dMtQFlUqyXkTOBw7VzCqTi7iU47yIJOHH/q6KrsM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5rP1+tIgy4FjsDv+XzF0CRGQkmcxZ19RMb4SDpBX
 GYRYgOiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOaz9QAKCRB33NvayMhJ0ewzD/
 0ejNqlhTL6mP2lJTJALO8t+ttwRC9ygs5IKzlWocOuwtxD3qj26o0S/KLmJ/7vYKuuwzWwDegMog0V
 SwXf/KsNjP97GTbNK0BBwP0toC5HMve61/Vq/W5clhMszjSCZ56G8L+M2/Q2hfOOwCuWOTaDEHit2S
 r15aNEVLiJcyijq3Rl1gNhTrI3l3eLOeZhmshgIf5AaRjy41b2rv7cRTd/dpgNWum62gW6Bs2gDpsJ
 j/GRVecN2XKlapFntnGu9GONhjoRIt4r1B+iiH3RmsRXqn0JfzXkyc5Rz/RxQbLWBcJSxrMuztbxuL
 KbVhDt61kzy9MFlTZPCCx9sAVQdeWNGVC3jzWIR1hhErRGZYDfo2ZQNXGUBwOPXkj4w/MzAKPvEhOf
 Uc2b0zzMnsbLpJIFx0LUgxaX3Sh95UWhhKTWEOJ0Po+21oRaQHuSGfax59wOfkgVcpF5gkwuwSYTjD
 cLKlj8rCklMkFdFfDiYv8imwEWUkRMlvmoG68/UaVyofMzEGqJ5BBcmfVPpoC/7FrU1QPJ1q29yEL+
 WS8y33WiAJC6KJJFimF4ab79rnk3Ghj1EnVp5iJu5TaTdtWFMx8+hviX17i3QRrBckgm7af5qAHGVw
 5EN/W1QZgbaw+i9lx7/UnfvoDgxQnNxZ41f6FNzDqxKpEMamwhSIHe+cczEw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 25 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 87d7190dc991b11f5d1162aabb693dcadd198c51..e15c65a97852f2e27d1c1d282945feeddec20f6f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -171,6 +171,14 @@ sound {
 				"TX SWR_INPUT1", "ADC2_OUTPUT",
 				"TX SWR_INPUT3", "ADC4_OUTPUT";
 
+		pinctrl-0 = <&i2s0_default_state>, <&audio_mclk0_default_state>;
+		pinctrl-names = "default";
+
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "primary-mi2s",
+			      "primary-mclk";
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
@@ -218,6 +226,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		pri-mi2s-dai-link {
+			link-name = "HDMI Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	vph_pwr: regulator-vph-pwr {
@@ -853,6 +877,7 @@ &i2c6 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ebf1971b1bfbebf4df5a80247a6682ac8e413e3b..7cf5073a29ed4aaf72662a4e05ba1c6bfb118a3f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6203,6 +6203,46 @@ wake-pins {
 				};
 			};
 
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "audio_ext_mclk0";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "i2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "i2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "i2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "i2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


