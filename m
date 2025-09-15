Return-Path: <linux-arm-msm+bounces-73608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F85B581FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 18:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B14E1B202CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 16:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512B527A103;
	Mon, 15 Sep 2025 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCEehg3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7824DCE9
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953678; cv=none; b=j5hLUVy6k0rYBzF2cGgsW5RVsLlmlbak/WqBQtpMhTWqgJhSj66yFjkbiScGmMKiuQ8ha6VoqrpqAxXs/HOzi1qpXakGos3Oo/pO927z+VU9HLVVCiBKKKPk4qRXXhMq1/Yc3QV4yL5HUnpeEH7QLa4dP/2WLlFg3rP8jbyx5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953678; c=relaxed/simple;
	bh=HZPCk3JqUA3vYxv2NPfDB+tVL6uTR2siqsxBukIGtE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5W+hJI/2S4KroF+xChIA4e/SXci4hYHTlEgyIGOCCOs7IEo8Z/BclPc2EaMzvdZm1sOypPoweXRsDsPO5yn4fVDH1iaruhRWpxMFV23MiL6n+b28y57VMEWICoKAOM4l4QvAU3M4TWCMVAeP4HtrTgMOANO31uicTDnwTyPKDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nCEehg3p; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45de56a042dso29414245e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757953674; x=1758558474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/K+Z0wL5+PZjzV0vqQ/YTMEX+mNIMBAJmD7MHAv9vo=;
        b=nCEehg3p7ZjrBkR1o9dVtCYqkviINENyRvvwZdwta8NPOj7aQsMKToUgUvj4rHxfif
         bFDuBgN39L7zO6bnMdQCLysDoECK52dSQc9kWDwMfOVy8b3t/VCw8DIeQxat+7oZW1TT
         rh3K1N0ht5112EkFDf6EH5G6J2UdGrGxG0OlFAOZrprKJLxyplQEfetLK4MX6hxDjG9b
         dyMAuKBOy8J/nWGHAY/eZOzwdBYFxXY72Lgw8bGxCn71QlutffRBhmWaSV5ZlpHY3oVJ
         O+vjf6CF8Sbwn+RhP0MFmPKn8o0I84sgB1r+8k9USu5D2NI5TgtKKW2Qw5L8nI+zpp0A
         dw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757953674; x=1758558474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/K+Z0wL5+PZjzV0vqQ/YTMEX+mNIMBAJmD7MHAv9vo=;
        b=KnsIg1G6JYvzgLS7jv3NfNU1Y9j1Pyv161Bc5A38+hJOe0JOvXgYwsbcZ7anxaApzW
         91i77rQ3KnPR6u/0forG/bZnGqtA8XwItSIHWcSILqFhH7CybFXgDkaUCsM4FT+d5bYz
         pYvAEXxEdNZHl0KXCibEkis2chnXm/QIvRsoj+AitjxyOyPJxoSiObM/7wWErargPQ8S
         4KK3nsT2ZVsYNhLGXQ8rPD4nTBLj4XsKKjr8FVLde/rHNuo7lY7+q6sDSiFszTf/9Rpr
         5ujqeq6MYaYECE2SK3rsBo9LOwrg2BAU47GfdoAtQUP1oJdzNv6JwEFCJEyw9ZTudKjN
         QXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqLL73IoEEBPRP7NGE+73DAAkwxeVnBcXUfyc83DUrPH8fw/5Vz/ed/8qq3nvCkkrC3N77xAl+/Y/aMzd5@vger.kernel.org
X-Gm-Message-State: AOJu0YyzfMR3iNojCfeJ32Sc+Hr+0qoWCLZfqLv/Yrm1rjHwEIMbNeM9
	DSQhFZr9/w3SfC2pvJMHyw0E0y/cwLG2V8ebEpsHN6Hbe8vol6AvfZjWjMT7gHWtmXw=
X-Gm-Gg: ASbGnctlqSWP9Ges7fANtHRibOXO3iS19QSjRzyeRoFddoQKJw6aD018NOiQ+ll9GRr
	2+zObxKtuepvbtDTko88ApJrHef8L3F1Gp4gm1f6CIUhq9lHmZ//GLtLpSry3v0xIqYt/3sGhyY
	GFMCXcmlYOjHXL+fljiGKzH21ug4Jtk4SIs9a2pnclUqrulZME0ALgIf+f24ufkMJDOV9XegsGW
	T6AoqxV3hNNOmw2sy7lL76O3S8E2uDCTId/53EGIU+lJy7qCkgh6wvUvFRfcEvzgxS+cAY1BOzz
	1pdXrWcFRJY8jBrhjedZ6htK4JuBhnjbryl++/x6xr/6tiRk87CaTCLREFJTG+a2OY3/U1k2zu0
	TNgemoTo9RF6JxQnNbTq7tWRSH7k91JpJLaE8/Zw=
X-Google-Smtp-Source: AGHT+IEn0sbvsgmnzVv9y6r8pDxl2GODt+IaZynjI4BpZgrjw2lmcfqmUv1WBZqeRiA6ek+oG19YaA==
X-Received: by 2002:a05:600c:58d8:b0:45b:868e:7f7f with SMTP id 5b1f17b1804b1-45f211f856fmr108161745e9.17.1757953674396;
        Mon, 15 Sep 2025 09:27:54 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:e60f:4b6c:1734:808b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9a066366fsm7857989f8f.44.2025.09.15.09.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:27:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 15 Sep 2025 17:27:49 +0100
Subject: [PATCH v4 2/4] dt-bindings: mfd: qcom,spmi-pmic: add
 qcom,pm4125-codec compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-pm4125_audio_codec_v1-v4-2-b247b64eec52@linaro.org>
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
In-Reply-To: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 christophe.jaillet@wanadoo.fr, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add qcom,pm4125-codec compatible to pattern properties in mfd
qcom,spmi-pmic schema so the devicetree for this audio block of PMIC
can be validated properly.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..776c51a66f6e7260b7e3e183d693e3508cbc531e 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -137,6 +137,12 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+      - properties:
+          compatible:
+            const: qcom,pm4125-codec
+
     $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
 
   "^battery@[0-9a-f]+$":

-- 
2.47.3


