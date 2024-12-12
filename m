Return-Path: <linux-arm-msm+bounces-41625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A149EDCCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046881884374
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9797F18801A;
	Thu, 12 Dec 2024 00:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s4t6s1Nk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C0185923
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964479; cv=none; b=B9d1xpHH811LrO3OhmU8erQ4MHJ5YKkZNMwkVJxasYTtrTNnF0CG2NtrVbA69xzHQjTY2501F4KOSkb26FZNmjlbhOpPmvAsIYiN/Wlxe8jeI2KS+36gsNmFpMIJj6EUuE8kmxKc3bKO4MxdW5uT2MH6ODl8U12dIllHNfoGGa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964479; c=relaxed/simple;
	bh=+qZJpWbsefzjYMujqUXhoz/g918GZzo/W+6ECps7Yyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8BTPiMYK5wL56bB7gzR4TSs8N7DjieT8E3+NyFMyZmzdUyqOm0k/iLa5t69tzmwSbrRZY3/kaUhjcbYA3SHs5EqOn6sqMgLz0eKZdXN5c3C1WOBLt7GEIEOZWs64v0P9jZ6fmAr0UeLl9A3wAJ2Ff5PXh4Rl5kF7QPLrKb49y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s4t6s1Nk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso18102f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964476; x=1734569276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=We4dCFru12PZhRdi+XGfgBYzTvC/KMY3TA37oXXagX8=;
        b=s4t6s1NkRb5oOeGlLmEFg0U7uGnIwNzK22C0lRJ50OwP/THpZ/ns/nGlJK5wqgU8y2
         UaUVC+JDDPIM3PB0+7+/9mNoRk1Z64q1rrlKjGgu62g9DJh2pEAouqgmfLKwyMS+p4hA
         qGeid48QTbZHdokN7L0yVlQFoQDnAZRf3y5J8nwFu4wsy4nWxQuaeye2TYfIhlKd6sZX
         vGVbDi7vpt5bV05ad8snqZXR0wFhDp25ZdDt5FuUbpoIljsUw87oVwxaeWuL+Gv03ZMj
         NUdwxCYEH6guHNHc7Ls+r9Y5Cpf3mXD+wDu1nTnwcvcW9vePFvMpMM+bw9EL9gkdVR0l
         S4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964476; x=1734569276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We4dCFru12PZhRdi+XGfgBYzTvC/KMY3TA37oXXagX8=;
        b=u4CBvPYTtAUkU4QAgXGE2fVcoR6H0hwjeQmGVXs+dkBPOMaKK2ZEjxDzErifIQCv8u
         49dwdR75dZrBDl6YAILGhCntbinukKZw6/FuVRym275xTBtfRqB8qqdnZ2UbqeWwYoHw
         /nwuFZ7OSpSZYlDP83kSoHvEplkK2gLAe8nFPJXvI7b1O9C0slx/+IiLvMJEmncw4WFg
         YH45uNdhT5elCEzEceRzi4jiTjj2Kuj+sM1udKbSAHhrv5wb1Bcmv/rV4ROd0a5IPgAI
         mBbscIp6nw/OJ8KxAKJG3UnrdKKWb8FUMthRehCUyEz0XfudrI/VHExk9vm8qiZ/icrG
         Gb0Q==
X-Forwarded-Encrypted: i=1; AJvYcCULE7GRCPSt0pAyFgOkJKg16yY21kxV1aYclfgQtErQ7jR+d72f8NmB3HXXxQmX4cC6MFuZT5bkHonUImOs@vger.kernel.org
X-Gm-Message-State: AOJu0YwmYxY0rQDGonflhOncVyn/5cieN1TGGoz8o+o/AHlNvaq+k2A/
	DPRyYRUYt2gzrRCBq7LzMk6wkgldss6IqoQDLVY1SFTXKn3JSpvpI02mxEEKNeE=
X-Gm-Gg: ASbGncsvacgXGMYIOo9aDreWtFI84aIk6qB52CHv3tIrMjupY6xOQHFZmu0Jtri1EaN
	HAx9Y/fNscwGVaika9P7vnrM6Ol35GAREuZ/kxQH4WIH+3Wgi7rvmjDbk88Yf7WiXuhqFbRg53L
	VisKQIvXe4ZXC+9JR2XjLRriCl+wHSqYxtBtlg2Cj+vTib6ZphszWRBTXtppoBFUm7Ejov+lWbU
	km7Qi6fznt40O8CpoVgwN6Uuw6ifoH9mn62nj76FHm27EZcTOjqF4JeXCMqnmmdZtL28n9N
X-Google-Smtp-Source: AGHT+IF8s8iPYKfTOUiE9XO1Gdow8KyJ8funy7efvpCgoqXHZtBpV46L9p6MtcxIFwCoVR2JiBVvug==
X-Received: by 2002:a5d:5886:0:b0:385:ef2f:9278 with SMTP id ffacd0b85a97d-3864ce86941mr4710014f8f.2.1733964475832;
        Wed, 11 Dec 2024 16:47:55 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:55 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/14] arm64: dts: qcom: qrb4210-rb2: add VA capture support
Date: Thu, 12 Dec 2024 00:47:26 +0000
Message-ID: <20241212004727.2903846-14-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for audio capture using onboard DMIC. It is directly
connected to vamacro and txmacro without any soundwire interfaces.

The capture was verified using the following commands:

amixer -c0 cset iface=MIXER,name='MultiMedia3 Mixer VA_CODEC_DMA_TX_0' 1
amixer -c0 cset iface=MIXER,name='VA_AIF1_CAP Mixer DEC0' 1
amixer -c0 cset iface=MIXER,name='VA_DEC0 Volume' 110
amixer -c0 cset iface=MIXER,name='VA DMIC MUX0' 2

arecord -D hw:0,2 -f S16_LE -c 2 -r 48000 -d 5 record.wav

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 33 +++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 34ba563d0d07..0b096bae74cb 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -114,7 +114,8 @@ sound {
 		audio-routing = "IN3_AUX", "AUX_OUT",
 				"SpkrMono WSA_IN", "AUX",
 				"MM_DL1", "MultiMedia1 Playback",
-				"MM_DL2", "MultiMedia2 Playback";
+				"MM_DL2", "MultiMedia2 Playback",
+				"MultiMedia3 Capture", "MM_UL3";
 
 		mm1-dai-link {
 			link-name = "MultiMedia1";
@@ -132,6 +133,14 @@ cpu {
 			};
 		};
 
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
 		hdmi-i2s-dai-link {
 			link-name = "HDMI/I2S Playback";
 
@@ -163,6 +172,22 @@ codec {
 				sound-dai = <&wsa881x>, <&wcd937x 0>, <&swr1 3>, <&rxmacro 1>;
 			};
 		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6afedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+		};
 	};
 
 	wcd937x: codec {
@@ -827,6 +852,12 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&vamacro {
+	pinctrl-0 = <&lpass_dmic01_active>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <2400000>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;
 	vdd-1.8-xo-supply = <&vreg_l16a_1p3>;
-- 
2.45.2


