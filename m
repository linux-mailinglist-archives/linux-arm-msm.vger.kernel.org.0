Return-Path: <linux-arm-msm+bounces-59085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2EAC127A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8A394A1B5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F7F29C344;
	Thu, 22 May 2025 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lfei/3ko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F1229ACF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935674; cv=none; b=FqNwrM30p0eodPqCtJcMPHdkS/73xzBtaCyKw9vH21yap5+5uYLlVkqmPb0w/BwwV4o2N0SoyNsvCPgisMDX3hWjjm1bjRh4yKB5TDPsax60NTPlzIBde2OyiCS9ZGfYhmz4kBRhfKDcs2VIEWDqhjB3oivG8u7wCg1L/P4n9Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935674; c=relaxed/simple;
	bh=S6jZhUI+XAJ2PlE5nePNGPGqQp49fPpI3d6PmNbCvKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5gZhNgb0jGqlInGOvmfVHFE9gaPAgb8f7npdSzDkavvzNB3fq/eQ+nIXYuN6eXcxntpvS4wq5iwfnNNwyGtb6XJe/no4ZZ3gOGIEqowqAHUDQSeDUmE9Wv8LOkdN88TpozMEmMsx+5HrWtdg3kP3lKmDEPLd0F5FIecs5PPWIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lfei/3ko; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so69773175e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935667; x=1748540467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLq9dfH5kw3m9MDlrQzYgeHTL3bjAaliqFaw63+wHMA=;
        b=Lfei/3ko1TmKGManuWlHdW+YkoNPXj/I5U199qy+aVnF0Rizf2NoUjzrKolFl4shgk
         tcexM70t+slg5iS+feIFy6chTIOj4X0gwMvRWiNku1BzK+m00Ke43zw0zwTe7RHCAuhP
         9Dnn3MRFOwuffPrFtrIV2zP50d23ijDbk0yPN5+XjKwVSkmMYwHCkqvZMhcuGPCrE5Kw
         EIrOsDyykJGJA0FF+a1C3bHiIWhaobbD38VYyxg7iCRAlKGxMaohDDwBG6EVDaYt33iD
         GBHJF+f8GyX3dAc7pDZRQYeBR4h/u3Q+zIqbB73SvYahUM6QUv2v/cOszdXtX/UoUOTc
         FBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935667; x=1748540467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLq9dfH5kw3m9MDlrQzYgeHTL3bjAaliqFaw63+wHMA=;
        b=rdcBxifclYzOtM7dm3A0xjG9ZnUdBb2EqYfqI5mP85e5oCRsvFBbxqCkMYmnmZlmpT
         5ezaZKIDS2k1YiGHA0UzGngsd3J/OGS1SpcGtRd+slAPmucEkqvbr5EEZL+IMLm9v8CU
         j6aLanBMBr64z5rKejb/znnIv4IJmqg+q07UVOFArar34Qqp2zMRXA0OYjzcyjTr0Pde
         jk0MgeAYIr26uxO9IhOiSAKIIdlLqNTlwuIgV8rKTK2QuadqFJF48OpzfBHrGgkBye6I
         3g9JwVANom8UPL5dzzzFviz63m1Xkzpx2vo+Ji7dj4qXEpC5CetbV8Q843G+9Uf55YWp
         +pzg==
X-Forwarded-Encrypted: i=1; AJvYcCVd3xuqEmvN6r/o8cewr9CYhVNjTs3JWArqEHADUuzy7t1CDaD+frpHMAUJnVcsMH0OOmwNkMCYVdy2yETv@vger.kernel.org
X-Gm-Message-State: AOJu0YzHnHl6dm8VXtnNaQiJ6RQarNDCHialCyqdb3usk7PjWRAcXIZN
	d7ASq9BcWYYxCKTe9n7Rth0fQwDd1eAGWukqL9iNLpQqV8EYsxREE7Ta54Y0v18J9HY=
X-Gm-Gg: ASbGnct31nR9TXmUGUWLu2fs3FK7s9OJsl8wD2tBlqsH9KpQMMrU91wikVBIkwbZ/Ql
	5XrNnDLTDj1KQlvCb2x5UwQNv3lZkWR5A5MD4EumnbF14TLwiHoCvYdFfzHkZYrehbTncuI8dXQ
	NcaHcQvYS0I/ODkdNgVC0IVd7eFhTKoQ+TrX61vdJqkmIjlNJ+4bwFFB48jTLFzohmgvAWUvwvI
	rE4xM//rdt6+2+65BjbbU1YoCod9fBusAlExc1ZVXpXaM6IGwuggh05LKBMknwT/XW7w6VsBu5S
	wgI4GRCw9x+dRoA4S6RirXXtwPtBr/nSoWJSuKoDHWw6nWlYxYEy8YrljXo=
X-Google-Smtp-Source: AGHT+IFHZ7GRnEumz9miXfhQcVTeLvcllCBZO2l6C+Fp4Xcd0b3neA0piaRSIcSFkbEs+4+lyCZ18g==
X-Received: by 2002:a05:600c:4ed2:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442fd67504emr198840965e9.28.1747935667099;
        Thu, 22 May 2025 10:41:07 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:05 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:41:01 +0100
Subject: [PATCH v3 11/12] arm64: dts: qcom: qrb4210-rb2: add WSA audio
 playback support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-11-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

Add support for audio playback via WCD937X/WSA881X. From DSP
and rxmacro the sound stream goes into AUX port of wcd codec.
wcd codec decodes digital audio into analog and outputs it to
single wsa amplifier hence only the mono configuration.

The audio playback is verified using the following commands:

amixer -c0 cset iface=MIXER,name='AUX_RDAC Switch' 1
amixer -c0 cset iface=MIXER,name='RX_RX2 Digital Volume' 80
amixer -c0 cset iface=MIXER,name='RX INT2_1 MIX1 INP0' 'RX2'
amixer -c0 cset iface=MIXER,name='RX_CODEC_DMA_RX_1 Audio Mixer MultiMedia1' 1
amixer -c0 cset iface=MIXER,name='RX_MACRO RX2 MUX' 'AIF2_PB'
amixer -c0 cset iface=MIXER,name='SpkrMono WSA_RDAC' 1
amixer -c0 cset iface=MIXER,name='LO Switch' 1
amixer -c0 cset iface=MIXER,name='RX HPH Mode' 4

aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 4b878e585227ee6b3b362108be96aad99acba21d..1e2b9d2516b62e2e80c40ed6c3a0c4548a02630c 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -111,6 +111,8 @@ sound {
 		pinctrl-0 = <&lpi_i2s2_active>;
 		pinctrl-names = "default";
 		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+		audio-routing = "IN3_AUX", "AUX_OUT",
+				"SpkrMono WSA_IN", "AUX";
 
 		mm1-dai-link {
 			link-name = "MultiMedia1";
@@ -151,6 +153,22 @@ codec {
 				sound-dai = <&lt9611_codec 0>;
 			};
 		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&wsa881x>, <&wcd937x 0>, <&swr1 3>, <&rxmacro 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
 	};
 
 	wcd937x: codec {

-- 
2.47.2


