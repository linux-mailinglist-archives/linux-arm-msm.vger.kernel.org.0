Return-Path: <linux-arm-msm+bounces-27981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34284948E19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 13:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D74289A90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 11:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479DC1C3F13;
	Tue,  6 Aug 2024 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvWXNBzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E401C231A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944981; cv=none; b=N6cMorS/9Q0dMmGc1Z0Mb0KEAMdznq/QGPpCkadG0nOTA7lswstBBxBiw05CcmTwww0e1UmW4005E+WodRL+Om9XY4Pjajv7FSUmwZVux3LbbsgmMPK2kvd2MmK0LdOp7Kv4Jvj+CetJ96SRKOkY/hF7MxH9e8pzNg/KiFtACFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944981; c=relaxed/simple;
	bh=c3lLdrRtY4V+BRsUGT6/6tMSRh9ZQZeDQGE6aMuniG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYxrISGY3pzLAQMv51MN0W5GKXiFCdBBzf+ARa7tBPR7KitRtbzBb/b30RlSMbZFm6kvRcrcLbyvSf+TvcvZJqbsLdZldk/2i9HVtN3Hb7QTwtrLJHF9GZbQFfvPPDK59yBVvS37dlbPKfPg6eUpbuSlpxS/Hf6RSzo+BFTj9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GvWXNBzZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so3490645e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 04:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944978; x=1723549778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kV0Yieskmet+YpNp74afVHBUJdlYUWak9w5VSG2Hzvo=;
        b=GvWXNBzZ2Ov2nPfkZSiNXJuKk+1nWm+s8MAvw9aeN6+Ue0wnAxYjnGmYAd0Jtwjw/P
         7y4VYhOOKLnG4AdyHch9c+o6+jvkPdCp4I7KSyTp0M8RGYt6R4I/u/pHRwVZR13axMxw
         4STkcNe3/wMjAyN+/YkGKejvs2fzptm5nWM/KFDGLe1ageYBGq9T1f/6ArN0F0cNjNmp
         E2iXpn5Wr+4qF0qyQUJ8BU9nZbfZttAC/4HhgKBhdKyv6QBAw29oK2NQTIIMOqQPmwU6
         RN/zpktzEJOynZwnWUe92aQihXWRAVGhYKv/A6XJdIZsGN3rh4tP4XzdNAeNyCFv9KKt
         D+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944978; x=1723549778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV0Yieskmet+YpNp74afVHBUJdlYUWak9w5VSG2Hzvo=;
        b=C24QzXZyF/lTzq8weWN/+cJQwV5hxQjnE/CNpdTLPCBj9bAkTtL3GrNqCa88yRa+47
         cgpi5cDfEscmH/duVxCwlpoBx+LwDd4l2lzj65sCn+ZhG8RI+XTf6NbKdQS9AKebhOcV
         FRYHnndPCihKUrvRFBgNZ/Afh8PKHB5jlq+G/EPup7cc+zFVI9c4vjPyX1eLRg/5pdMA
         x54muYNqQW8VB2xmG9ETTQaFZY4qK99iWi73VQoi9mFlr9ZUAfmZIhpRhNBaCUPZ1XAC
         HL8MzJ9dcCigKEGqCo+P0MDLO7n+6p7hBTTMsWOG73eefv5lif5JvAWYdMgFxO6mfCsu
         jWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUASnvyIdNOp7jRWJVIMxMR+3SjUSW4A/nATkIQJ8iV/yCQSevGOoTLegm6apWCgHx/9+uuI0XqIUKxDqsdoJBvgRXXUZCSgfEiMvS+RQ==
X-Gm-Message-State: AOJu0YwhI9UAg83yQKpda3uRMIoaZprKziK8JJEkwRIrYx1+s+IbAnKm
	7DJvxDGhYd+6bdFeGyhb3uupF8sugZINw5ECPG5b2YhKth8+g+Z3feeYqimKrbw=
X-Google-Smtp-Source: AGHT+IG6f1zuYkR8BiWbt1DwVLwptX02kZYv79SfSpx5HpKdmiMF2N9rQ48DNHj2wxnv0s2vMhHcaw==
X-Received: by 2002:a05:600c:524e:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-428e6b7f4abmr94039055e9.30.1722944977757;
        Tue, 06 Aug 2024 04:49:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 1/4] ASoC: dt-bindings: qcom,wcd937x: Correct reset GPIO polarity in example
Date: Tue,  6 Aug 2024 13:49:28 +0200
Message-ID: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset GPIO of WCD9370/WCD9375 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index de397d879acc..f94203798f24 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -42,7 +42,7 @@ examples:
         pinctrl-names = "default", "sleep";
         pinctrl-0 = <&wcd_reset_n>;
         pinctrl-1 = <&wcd_reset_n_sleep>;
-        reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
         vdd-buck-supply = <&vreg_l17b_1p8>;
         vdd-rxtx-supply = <&vreg_l18b_1p8>;
         vdd-px-supply = <&vreg_l18b_1p8>;
-- 
2.43.0


