Return-Path: <linux-arm-msm+bounces-25836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2990C92D0DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D6301C20C44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 11:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6834A190489;
	Wed, 10 Jul 2024 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RanwNmgT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D42F190490
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720611630; cv=none; b=Zh2m+mvFPpoc5P0hkbW6CmTWRLvMStUCnTkOZFDmmfJN5DXw9dm89MAifUjvfld8WBNiZ635kzSuiQ2r9iA8D28nlwmJjb5WriCgdFWYV4+nyE2vCDxQ05UF8QskWkYSZ208zvYNtL+k2FSrxNUpBzrPHZoCasCMRG7rZDZZavY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720611630; c=relaxed/simple;
	bh=GyHNGl6crgejPZUcF5UFfU1I2URJ1GXezzYJiwmUt7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUEe6TsSlUX7W/iF+BR7dKQ2m9zIfTOVECJ1n4WmJEyn2kL9WqN9EhVBEub3i43gVVQhVJe8J0L5YmUVbFQnva5NXCTtG75I8cn92yiaA3iR+ekJRsYQ83i0lMr6R/DqoG7bk/HVBOsz3sx+QrlLHye0PbFNxdAD/Fvqa8cIjsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RanwNmgT; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so32319751fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720611627; x=1721216427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tndFt/m+6Xi7iQuvvSvyVqsOQaEsWMefArV1oOIs2Gs=;
        b=RanwNmgTHyC34emBZYi9JCSk4QxUy1jb9sK3o6cKzyXtbBegHeUzKty1vY5t1JYAnw
         v/mHrwlb8vY0H5K2jblyNUfetQH+pWqv0BGgIffaDNWZeF5ir0CAgP6Dsn9S/eWyFqa4
         TO59p7RqlXGmqO6ETae/KRO8NLfH/qY4r0f6WY8RYlYrA+PGUtMKUxQW26qgtZI6mT+r
         9wA9mydkPky4Xtz13RliR2USaVa5dN9BMnmytbwGQDzEGWMJplFMQ0Irck0GUNQk+b+1
         YfIRtcAgHIFLzhIhhleiFbsn+9tPHd+WskozmWQUtS/+MmOU2Ynub7hnZHRGcmJ5B8hn
         MOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611627; x=1721216427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tndFt/m+6Xi7iQuvvSvyVqsOQaEsWMefArV1oOIs2Gs=;
        b=N94c5iP0ztbMOExqzua7pWZ28LiHYf+o2OdDS6IJf8f+CJvc+U+rig8gECsRql30z6
         bfKu8emAFz4r2PYmiRiWpQx393CBhxgw4+28OSCepZA5zU+Eow8PHRCJfMgzxEqPxeYY
         ons0s2jluotzm15SxnMYiAjS/9TZbLCs/CueT6gdF0UrQYhSLMsulMTt7TLcohifMycT
         K7kmUjAyF91JEY4Dv6G3rDQLKOztsGGG2RcBdloaLfqHzTW4HkdqL2ZqIfw5VP+Pg7yE
         HZeDYFYrUOzDFl8Db+H0GOOfVOB06I3uu2XokMZp6LuTh5FBpIsYHIgpB+VJB+Z0y33f
         /TRA==
X-Forwarded-Encrypted: i=1; AJvYcCUzWMOgZR6T3uwEcuuMe/gG9ZmiNzxRgfgDtNJL7UfKtuH4snc2XNMYAJAfbL/XGQtWGMXsGlxGaWUhjjrLIdtLWsgP6Q8W+yA9k//UAg==
X-Gm-Message-State: AOJu0Yy9w01x9Q3+iOXNzM2yRHxgeNIsYbyD+XQoqIreQ2vYwM2LBZc4
	oIAOC1Xq4H2+/3ArRVgCZfTfdzBNCoEUQj7vjG4H4S1bYrcPxd9y4YVU7NAfW5I=
X-Google-Smtp-Source: AGHT+IGWe2HWZsTajp3UFPHR9qdU81qRPqrHF9w7b7rKpMjUZoKdSVUGVh8iPNoyMohT9TfK8GN/3g==
X-Received: by 2002:a05:6512:238e:b0:52e:bf53:1c13 with SMTP id 2adb3069b0e04-52ebf5325c5mr1174068e87.7.1720611626810;
        Wed, 10 Jul 2024 04:40:26 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7361b5sm78602875e9.29.2024.07.10.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:40:26 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema
Date: Wed, 10 Jul 2024 12:36:08 +0100
Message-ID: <20240710113833.39859-4-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710113833.39859-1-rayyan.ansari@linaro.org>
References: <20240710113833.39859-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove old txt bindings and add apq8096 soundcard entry to existing
dt schema.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v1 -> v2: added r-b tag to commit message

 .../bindings/sound/qcom,apq8096.txt           | 128 ------------------
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 2 files changed, 1 insertion(+), 128 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8096.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
deleted file mode 100644
index e1b9fa8a5bf8..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
+++ /dev/null
@@ -1,128 +0,0 @@
-* Qualcomm Technologies APQ8096 ASoC sound card driver
-
-This binding describes the APQ8096 sound card, which uses qdsp for audio.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,apq8096-sndcard"
-
-- audio-routing:
-	Usage: Optional
-	Value type: <stringlist>
-	Definition:  A list of the connections between audio components.
-		  Each entry is a pair of strings, the first being the
-		  connection's sink, the second being the connection's
-		  source. Valid names could be power supplies, MicBias
-		  of codec and the jacks on the board:
-		  Valid names include:
-
-		Board Connectors:
-			"Headphone Left"
-			"Headphone Right"
-			"Earphone"
-			"Line Out1"
-			"Line Out2"
-			"Line Out3"
-			"Line Out4"
-			"Analog Mic1"
-			"Analog Mic2"
-			"Analog Mic3"
-			"Analog Mic4"
-			"Analog Mic5"
-			"Analog Mic6"
-			"Digital Mic2"
-			"Digital Mic3"
-
-		Audio pins and MicBias on WCD9335 Codec:
-			"MIC_BIAS1"
-			"MIC_BIAS2"
-			"MIC_BIAS3"
-			"MIC_BIAS4"
-			"AMIC1"
-			"AMIC2"
-			"AMIC3"
-			"AMIC4"
-			"AMIC5"
-			"AMIC6"
-			"AMIC6"
-			"DMIC1"
-			"DMIC2"
-			"DMIC3"
-
-- model:
-	Usage: required
-	Value type: <stringlist>
-	Definition: The user-visible name of this sound card.
-
-- aux-devs
-	Usage: optional
-	Value type: <array of phandles>
-	Definition: A list of phandles for auxiliary devices (e.g. analog
-		    amplifiers) that do not appear directly within the DAI
-		    links. Should be connected to another audio component
-		    using "audio-routing".
-
-= dailinks
-Each subnode of sndcard represents either a dailink, and subnodes of each
-dailinks would be cpu/codec/platform dais.
-
-- link-name:
-	Usage: required
-	Value type: <string>
-	Definition: User friendly name for dai link
-
-= CPU, PLATFORM, CODEC dais subnodes
-- cpu:
-	Usage: required
-	Value type: <subnode>
-	Definition: cpu dai sub-node
-
-- codec:
-	Usage: Optional
-	Value type: <subnode>
-	Definition: codec dai sub-node
-
-- platform:
-	Usage: Optional
-	Value type: <subnode>
-	Definition: platform dai sub-node
-
-- sound-dai:
-	Usage: required
-	Value type: <phandle with arguments>
-	Definition: dai phandle/s and port of CPU/CODEC/PLATFORM node.
-
-Obsolete:
-	qcom,model: String for soundcard name (Use model instead)
-	qcom,audio-routing: A list of the connections between audio components.
-			    (Use audio-routing instead)
-
-Example:
-
-audio {
-	compatible = "qcom,apq8096-sndcard";
-	model = "DB820c";
-
-	mm1-dai-link {
-		link-name = "MultiMedia1";
-		cpu {
-			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
-		};
-	};
-
-	hdmi-dai-link {
-		link-name = "HDMI Playback";
-		cpu {
-			sound-dai = <&q6afe HDMI_RX>;
-		};
-
-		platform {
-			sound-dai = <&q6adm>;
-		};
-
-		codec {
-			sound-dai = <&hdmi 0>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index b2e15ebbd1bc..c9076dcd44c1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
           - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8016-sbc-sndcard
+          - qcom,apq8096-sndcard
           - qcom,msm8916-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
-- 
2.45.2


