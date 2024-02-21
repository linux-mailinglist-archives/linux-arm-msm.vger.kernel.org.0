Return-Path: <linux-arm-msm+bounces-12031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8181285D701
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 12:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35A85284208
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 11:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8951041744;
	Wed, 21 Feb 2024 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXSRbhzy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00B8405D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515043; cv=none; b=txJLOUNCvCG8d1ouG8NWLGRRu6Tsce8WatpHedDBGoTeUOpsvBgekDWnir6bUJyHBWFcsSqRPZSpTC9g7vK3cgJGLsyDjiNYhN2Y1iOnitYPY2Azag8pCGrBFCt/MPOgPtOFKN09jJSGv9c6XZGdjcx5SU7PdnqfO1NZCfBvKtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515043; c=relaxed/simple;
	bh=QBSDWr0jaVh7zeXBOsel/rJ+6ajgeIvN4uQ8MGcm7Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hU68dqPQPsBNQf4M3vdxuPrTEvxYHlg9gkguC/Fbf2irGewrbRKD4WTfyC+pC16gCmtbgC/h0HF4JvhzCtZlayE/RI7KQzosZWWGvD9UDUcYB1iJ5u9ioeZc0XobWMK4sXtgyw/G4jBqp7WYMrpvdiW2+YMEFmMOzkii7ubm/Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXSRbhzy; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e72ec566aso62357166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 03:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708515040; x=1709119840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAQmTehuuu7pDZORVsAvuPr+CnRbLVUq10Y5vLWq90k=;
        b=IXSRbhzyjX0CHBvWAEJajL0BYaVdpQZCNtderlyXQQ8Mm6FUwt9c9gD+mNk2d9Cu3L
         kfVaaIAuIx1Zu4MI7/f8Bds4GJ6qEeTzemF15gotVzt6tcvW9G+BXn0zXge+akOR/8KL
         4RUjzH92k47IqQKVC3sUGLJlP1Rt5IEWC0wKaLnRvNSyHmdFt0GiZHFSpbCBWvAp9nRG
         HRaaSQ7pgtva/bL/dFv9JNqnkn/I5KEuxd6pvCxyUqN8S0Pz7Z1aMp9m1dfPCzKEn6z5
         wojqu0RiKtIPJYnksYOfZm3me450vvEwN9eeQ5EZ5+qkwgtV0U0qTeiDVoZXDt7Sela/
         Oxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515040; x=1709119840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAQmTehuuu7pDZORVsAvuPr+CnRbLVUq10Y5vLWq90k=;
        b=wvT+umd3jYqL7yutaw+dTSDy5gYVW7i607NdwyPK84kSeAd4l3BxFBZ1xcG3tORf2W
         EzdraqeBl1f2N79xWJoA5QWHI+HdLZaajun9SGsErZc4nKiyIM2/NlKstDf59owx/hNn
         2cDKwf+TeKfxiT4ZvBuF8QvhiS1Hx9Usbuj4wgIHCyvUSNDEVdpOfAyacL2yNNmNjZ20
         4es/zsjSjZMwYPEIjNHC0w4X06hlwv/pJUnQKrR0Fe43rHv+1NYCUBphXe3wbYWU/ZrQ
         FkQKECMA0Z9I+G0oRYKPKWec8/8yLs0qysP7JCgmm03QkcRDfrFD6R1M4EyBXQnZBg8X
         nEyA==
X-Forwarded-Encrypted: i=1; AJvYcCXwMBLM6fMvBrkpL9L6rmm60Qd1KTen3umo+iRTFYDSyp83vtOm+nvvSnl+tf4dfCNON7oH1afUm4JV4tE9fovPsgeA9MGFTDlDqCRePg==
X-Gm-Message-State: AOJu0YyZTnGGA1xWP+9Xhh6wyVilvsTAUrdK0GvtPgwrf7dL+X0bxfbI
	GGJnWHFeZSRTpvNTmY2v30Y+MqAi0cJOO6l57N7E4OaodXQUcQei3rogstXYDwU=
X-Google-Smtp-Source: AGHT+IFMtWAXfF6096VkEiNa5/PKLj4TmtqoNEwWGCceJzPnphZEPIX4fokcFB8EcevGHD4Key3dhw==
X-Received: by 2002:a17:906:368a:b0:a3d:bb68:be30 with SMTP id a10-20020a170906368a00b00a3dbb68be30mr10815533ejc.6.1708515039933;
        Wed, 21 Feb 2024 03:30:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906c18100b00a3e278c4a3fsm4393712ejz.53.2024.02.21.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:30:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v6 v6 1/2] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
Date: Wed, 21 Feb 2024 12:30:35 +0100
Message-Id: <20240221113036.23905-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
share SD_N GPIOs between two speakers, thus a coordinated assertion is
needed.  Linux supports handling shared GPIO lines through "reset-gpios"
property, thus allow specifying either powerdown or reset GPIOs (these
are the same).

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending because reset part of the patchset was applied, so this can go
independently via ASoC.
https://lore.kernel.org/all/38fda6619769da7240517982adfe734cb653ff5e.camel@pengutronix.de/

Changes in v6
=============
1. Add Rb/Ack tags.

For full changelog, see:
https://lore.kernel.org/all/20240129115216.96479-1-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..22798d22d981 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -28,6 +28,10 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 0
 
@@ -37,11 +41,16 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


