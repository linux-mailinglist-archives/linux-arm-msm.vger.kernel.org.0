Return-Path: <linux-arm-msm+bounces-25697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9992BE65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B10F8289264
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B76219E801;
	Tue,  9 Jul 2024 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DyLy/oCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6019E7F2
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538934; cv=none; b=GBgiipZMwx0f+7hKNjEy71R/K8hFdMJiT4/AnUEKLvnGabuwX3kyRfOlWMLCecYAEXZryLJsfP/tJkSqPCBPvoBQy2tHTLbmbTbO0sTb98BDpCz0+fwnlm2KtLnTUhBj8ukCQZNAEH8RYoNe4PIPfgZsEl4rgPL05NR2GfZGUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538934; c=relaxed/simple;
	bh=3PoSvU8RpFcazekfoaaScSpR1wxv8/6f43Gz5oYx63w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpCAeG/o0cbuOKrQWwaw+FedYioKwtSDMDJuBfQ9Asx2f6ZxA8jljBaG0f15GXMxj2i53j1oBSCnpdqFCSD30D/F6jmc1VcFg156rVP6aUs4er9q/ZA/620A6Pn7pourUbs6YE+bSSwnXvXhvuSKAR1rVE4Y05nnPgYtCv5oQZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DyLy/oCA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42671a676c7so7905535e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720538931; x=1721143731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr3GSFWqoAD9HFFPG7fGztnMb9LgjvrtTWNplj4lKO0=;
        b=DyLy/oCAQ3krLJ+rvFrbNSlHVwPlQ2xBdMqCRfIDBMu1wxS4JlDSDWNzCj7JRnPeL/
         fq2H2szFVYPdGE/AdaFBlZc3BYtW5N6eJHfwTRxDVtulXzxNH5LH4GdCOSL5zwOa7IJn
         egDw8CqyBFXksSIlDyuEEvAR+ySfqoG4awh2WUZOKTCXjCidhDCpC0F385nJ9dz92qlu
         Ytld2VdxxflOczH7p1MGQrlNKC9eI+2a1YmhOmVv1kC7dAc+VBqR88iGzwTfsHMh9AI0
         FLjzhiyR1SuheQ1rV5OvPFXnGwh2ujlver3aggOUgXir6tiXP2osXj6Dtl3EHB8svi4E
         y4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538931; x=1721143731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rr3GSFWqoAD9HFFPG7fGztnMb9LgjvrtTWNplj4lKO0=;
        b=j+kvgniwlZyplADgZVUjnG9jBU+dQmECVTeqbQwF7N7t1EOS7u7LUp1y/vASmOGJQ8
         RJhABLtUPdlHL7rKfVAQSFSNUuwSmUMjj+HAuka+gqzG6E5RCuH6jqiVWZWFR/jkrwop
         I2rP1qkGPfSThagnAn2+4ssHXCoE2HrmIDR+MPGr9V28UcIrimFNz9lHO4yD4BddKMLo
         BxUR5L6HdrdgpOwceuZi26nI6E4PjpfDUEfYIE4oV5y+UMyGSvb2mk55FGvAhOazepQx
         zRv4Glzqk3DAfattZaf6CxIIy4A7irkLHu6TQZKnjldZAjbIs0QmgVv17EOjpt9OYaso
         z6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYzb5z3ywHWgNsLuX+p27tkeaSD3qqnO9dHz9h5Nl9LDM6K0N0ixzoaBY/XyKoIs6DEJJraInKx+nUel8eW/CgizXhZazlLrSbBeGI0A==
X-Gm-Message-State: AOJu0Yy33TEeMJ//LWROFyV1O73VSibwA7qs21rheWhwT9S1jDRFdAC9
	6GV9kjDxWF4SqtY0RXomlhV6UV3jhhSVCv5ZJ8hxRMUSDIw/Xy9ggxMAROP46MU=
X-Google-Smtp-Source: AGHT+IF4NFy7/t/rb7zZIftACNCfbYCcto8cUw9zZFhNxIMxce8lrJOhUjAw1tc171MTvAxJ5BdJSA==
X-Received: by 2002:a05:600c:6d4:b0:426:6b85:bafb with SMTP id 5b1f17b1804b1-426707db6e7mr16978265e9.20.1720538931001;
        Tue, 09 Jul 2024 08:28:51 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f5a32sm45883775e9.24.2024.07.09.08.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:28:50 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
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
Subject: [PATCH 2/2] ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema
Date: Tue,  9 Jul 2024 16:24:43 +0100
Message-ID: <20240709152808.155405-3-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709152808.155405-1-rayyan.ansari@linaro.org>
References: <20240709152808.155405-1-rayyan.ansari@linaro.org>
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
---
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


