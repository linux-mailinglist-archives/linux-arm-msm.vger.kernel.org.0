Return-Path: <linux-arm-msm+bounces-24443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48691A5D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 434FEB20C1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3308155385;
	Thu, 27 Jun 2024 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RtZgseXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1005D15278B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719489365; cv=none; b=n41rlMW3c82o4DaryUVuwMLlZ4qE+fbVxNbRs9OPvSsuo2Sc+YNYOmAEu+kuvmHYLzH6NZFy+rH3lK83MO8vzQ4j1sgPRoSXc0Uez09gBjvGxJ141o6WM0mCyYz4W1x5nIswqh5i+ZCdTTGt3svPAvcAmZS6r63it8mHQyAk7HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719489365; c=relaxed/simple;
	bh=UkWKKOsTNz1C80xDz4hBzX/O51GwHLLmPnZ3RZsUr6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8nmQAmCr0u42+oX6imnyF56B4fiBcN6e211I3zAcP1RiOMH55impOPHYoGQoEmLnU4cmPLOc37gEHG2mGihZ6x3vshqGIcPwj4hiMh7/wfhU7IQoO5zmxL3HHxk5REuh5BuU9EX3B+TUKXlqVVM7mWnBvKeoMvkfsHbJniTObA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RtZgseXB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421b9068274so66683905e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 04:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489362; x=1720094162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eB7qTRAxnSkgE7t4FDRl+bpfSSJGxOmGp8nh0Nok6h0=;
        b=RtZgseXBbYvyIAQx7Fd6NA6axTCq9hMPJgniK+RRFgWhL4hphY5R8rnmDZFl2cJLew
         36ckxGHa7WRYgdyNxgp0V08/IKITfV0pR7mlfLIYCAcRHoDvKf/8ZNLLzmS8wAaY33jx
         IHX7GE9q3sVVW0PAyBtLasO/9uYlM2VhHXi8KvgbTAMRebzeTDXQaX1gaXPJ4m1Ei/NV
         ZpT/g69DGccJazgMgeF4Gga61prR+76WOOLq7rt1HhiJb9XBG+vgQGj7z6l+NwL4R1Bq
         vqugQV7NK0xBdwOIiSbEv5cvs3uiNF/VfxYHNOzq0A6vjIwtfVpVhgCC+4a0DYpgjNth
         HubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489362; x=1720094162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eB7qTRAxnSkgE7t4FDRl+bpfSSJGxOmGp8nh0Nok6h0=;
        b=TBQZsFdOC0MaT064n1/2/+g6isVo28ec1i0f8ATXx7Veeci9hUYjyHfyve75cMG1Es
         NlawwmSvlFcnmKOguvMNIrr4ArtAxtEAjYuhBIreSIvUKwQcMmWxxxeB/tX4bJdz0c6H
         r9a+oazCHSR3gpEjgqvZ773ieyxgUYQAT6VXYRAIH0Whq3uXVNzTSICBv09xNwAbGPiB
         5OGsB3jTihcrMMHlUzmb69GoUqK5kRwPFrVP/N2zwN/910oGXBE7CjAmZANxT2TC5i1X
         OILrIcyGlWxasNDTQ96cowYtUnkDscQf1ussow2Uomdhl+zpU/FzruBXvJqfUoWA6zfs
         hYMA==
X-Gm-Message-State: AOJu0YzwYDeXRi1vCYyY4HwzkQZIv2feEcpRv5hxgFY9V9yF/9H6RVR+
	kNN9q8jqeoWCzvHLQdEXVxT6m4gn31mwOPzunQOaIdWlhYRS9+qOJ6pwDFIZBVc=
X-Google-Smtp-Source: AGHT+IElItNp3cSHKsJTKvy1VXuKu2eMXWGGPys9ZBSGpHUZHQxdJ4zDKyVCa4+CO6Sc9OuHVdXXdA==
X-Received: by 2002:a05:600c:6d8e:b0:425:656b:76ae with SMTP id 5b1f17b1804b1-425656b7748mr9686195e9.23.1719489362352;
        Thu, 27 Jun 2024 04:56:02 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:56:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 12:55:19 +0100
Subject: [PATCH 3/6] ASoC: dt-bindings: wsa8840: Document port mapping
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-3-bd8987d2b332@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=UkWKKOsTNz1C80xDz4hBzX/O51GwHLLmPnZ3RZsUr6g=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNNzIYgBD4wI/PAjnXHpOZClxrctCQtBgmud
 GG2+Eky/sSJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N9iDCACoqrzNg2bonxWWRPIlk9J/1IuSP15wQmt8YcvPWxi9MTepRJQPWXHxS1T+I6Ed6N8E/4N
 siF4aiQKS7sRkNPP2evMWdyZqxlxlEtpbakw/afA1Kom4IUNmr/PLJb9o6Q2A4d4i5pQmvuCb9L
 1qR9Gskw+nZszbxIjsQJPphvXkYJWBig549ZgMhQTIttc7XLohqNPj/pLEXYMzy6QzELCqA70E/
 SCoeVcc5H/RqwYYDhOJFjBPYFUCPnhHPQsdmZlCNY/qK7QyEFPNBAlpo+FYb17sZl9ey1s0X2o8
 LZFQxRULxG/4R4NU7W4ixlSBxc8IoPGu9jfwRWfztLfoY7y4
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Document port mapping property for wsa884x. Port mapping is required
to be able map correct master ports.

All the device ports are not mapped in same order as master ports, so
there is a need for having static port mapping for WSA codecs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 22798d22d981..83e0360301e1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -32,6 +32,14 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+    maxItems: 6
+
   '#sound-dai-cells':
     const: 0
 

-- 
2.25.1


