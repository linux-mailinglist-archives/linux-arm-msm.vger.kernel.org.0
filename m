Return-Path: <linux-arm-msm+bounces-59086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C24AC127D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EE1C5026B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60E629ACF7;
	Thu, 22 May 2025 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgeLvx+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135DD29ACEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935675; cv=none; b=uUE1KzT6j4bQmc8YfTfrlMtnL4VZ6Z/t2YxOo6PWC2vDxBEbKBX598JfloqO2MEZQzOMth68sO57slliQMOtMVG+HHcpa66ChidCPHfYnYYo5aLpBUZTknEZwZlgZ9j7ivP4/Rod6oHG+fXiWqAPHxWOdbGeLo03iRhPsIMVx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935675; c=relaxed/simple;
	bh=lhEc6CmxoeqjBbJ8Pm6+cHPF11xa+fHx4k1bho3h33w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtNi+LoFPhEZKhATc4cuYA1ExW6oL7o+KsvOZEbh/zs56PD6MRXrE8hCG87R91isMUVoOD19jVDdBCvVAcIKYoKaDTi5ROgnU6Kedu/iAckgR2TEb5Hk39TZ1RJxQ0yC/Wm6Hs8ibzqkuSF4z4HxPHHkCmUPGwomiHyPOinzbnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgeLvx+O; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso65073065e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935668; x=1748540468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEEzJQh+mi4rzI2yTuNmUyI1HaStAMzjYAaHLCvcS3s=;
        b=KgeLvx+OI+jG+o6JN/k0nt7mU7lmKxFh+tO9GjHoHGMwxJL/ggYaa3SCDqYJj/gLZ1
         nhD72yfmRxBhtCZCshuTyiyug2BBSBr1T5UY9/5F9tagYqU2mgAVRA4DbUBkRaVJ9NWp
         psp/aZ6OwaNmhF4z1LQSrTsCTC/W46VScNc+Z67JU4mX7FvplFjvxZ+Zx+UETFtp4H4G
         AKVnVQjgeFmBreKOhVcO0t5XN+mWY+WnWWOzNfqqXZl6BkmUblF3Rh08/sYAj/pDy1Rn
         s7BsIfN94WV1nUPqDBMN2jpbv1efjeta9BbRCV24F+2O+j+YBUO1QmbJ47ePjVWUvjoI
         OQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935668; x=1748540468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEEzJQh+mi4rzI2yTuNmUyI1HaStAMzjYAaHLCvcS3s=;
        b=NhmuWS9+kO7zhYc9BB/+huEIbBBq2yf1E7l/NX53CCR7CD3U1lbsC7iIxTAfkUE4VF
         BxurXhWvxuOLlupe9X+WQYhowW3b6Fj7vLXSZd5uH4HsQKDbkHH8+kLIrC+s2nGy8k3t
         3omAE0uF1fml3Q/KctVJHZudfygjoOsltcTXYlCjSpOuCjEzfReyKvu2SGKLtLszcf+N
         OHAw3OLTNUp2Uy1bqv8JGW9+q7zRUmdxmSoC7ApWrxW2kA3KjNXFnWoK690yTul/Y+1u
         02MavpPfTfY4Wukb3YfdUpgIHeIP68k4QQ5RzXOLaZqkLfitxsqUTQolPgSlIsI2P5P9
         ncxw==
X-Forwarded-Encrypted: i=1; AJvYcCVbzVFeOc9XvwLQJ6nEhXJDIEfhTvN9xPxI7fMukX1S0ABEizuLwGkrLENz2yixl6jsa1QQME//zvOTyOVT@vger.kernel.org
X-Gm-Message-State: AOJu0YzSYEoGgfS61jbciE+ndMkIAj5mYtpwIdYUayxTi9vJ4NCizj+B
	hsCqh9EMurmiopE/Nnaf7gxzOhTVfWstn5S7kVY7IR+yw1htPU1bYWFP5IeskAWZeaA=
X-Gm-Gg: ASbGncvIeWBbFV7A1e6eSsbi8ZbIqkKbWMs2AE+/eZFqLYu5pRj5a42/lohKoOZquKc
	MCcVO4IwRZhiz7hz8Mglq9xpj0NCxU69sMGZonoeWW5oQBMBBYvTYIgCLt9Z//8Nj/61HERAYYj
	bokZxgYGidzedjEOP7RGevK3ag5VaM74EfgvL1DbSMtGgHCRZOiYWe2CYCuJTIdL6zEN+47m8an
	ogRCly80rpyDwMoFSjzpbzHU5LY5kFK+LNVyY1CJzk2Jbv6qV2mHxrguEYUpyALUX6/Ci02QDwS
	1J/A5L5IO70dmqbgcPErDj6DoTxU+240s808E7xO1rR9Sa10sEqpGF+p8bo=
X-Google-Smtp-Source: AGHT+IGgojgkTlxJMrB0QdTOFW9DwcjfnE2HsPWKTiCh2DyT3aGjZFJfYpsdBpxBzniyJBoPRyM8gg==
X-Received: by 2002:a05:600c:a369:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-442fd678b83mr295575445e9.30.1747935668030;
        Thu, 22 May 2025 10:41:08 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:07 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:41:02 +0100
Subject: [PATCH v3 12/12] arm64: dts: qcom: qrb4210-rb2: add VA capture
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-12-9eeb08cab9dc@linaro.org>
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

Add support for audio capture using onboard DMIC. It is directly
connected to vamacro and txmacro without any soundwire interfaces.

The capture was verified using the following commands:

amixer -c0 cset iface=MIXER,name='MultiMedia3 Mixer VA_CODEC_DMA_TX_0' 1
amixer -c0 cset iface=MIXER,name='VA_AIF1_CAP Mixer DEC0' 1
amixer -c0 cset iface=MIXER,name='VA_DEC0 Volume' 110
amixer -c0 cset iface=MIXER,name='VA DMIC MUX0' 2

arecord -D hw:0,2 -f S16_LE -c 2 -r 48000 -d 5 record.wav

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1e2b9d2516b62e2e80c40ed6c3a0c4548a02630c..1c125ae4e2f3eb4f715bd0aac42a60b9132ecfbc 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -169,6 +169,22 @@ platform {
 				sound-dai = <&q6routing>;
 			};
 		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
 	};
 
 	wcd937x: codec {
@@ -833,6 +849,12 @@ &usb_qmpphy_out {
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
2.47.2


