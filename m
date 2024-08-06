Return-Path: <linux-arm-msm+bounces-27982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96B948E1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 13:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 061C0B24AF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 11:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A3D1C3F3B;
	Tue,  6 Aug 2024 11:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSNBgM19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414B21C3F0A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944982; cv=none; b=SnQtvsJPm5iDOxX0qc+/X4qlFoc/QhmiG6B/rP2Uxb7qmEtMlen3w2cGXM6rvcd+vlktdgoSCdKxn1MxZ46Zea4cEbgWF7HYvmGD95hYNx6ljw7L10pyWA2qQEjEZeOV4JU7U0BekYD3iXdobe6bEZQbSeQihLePiDNadgV67tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944982; c=relaxed/simple;
	bh=6V65vXM8FQwUV7v0SXbiGpzXztfTEZwxdLqnBCxG6/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpZlmy3miTkDlCxHeS7fqTsrn/k5AB1BZH4QnLciCMx0nCWlIU6hto4sQQV7H9WjC6QL+Sp7Phww+k3ilwMkVAOZQ5uoeAE0GcLbJ8otlYBsDyPcu83HiWX3KDUjPJRSdzAWvfo8adfwcWRMCV8n6CCXvW7lPJ8Vx/GGq+aQKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSNBgM19; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42819654737so3686395e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944979; x=1723549779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcyvcwsgz2iQmtLQWjshVBEVrR/YiNBp3RnZXLsmNgk=;
        b=wSNBgM19l1rWghz/Y+iV07S+3KyuVFlPOmmltuNp1SW28LhGJgTUoWFpUpIvcvh1S6
         0KbiDtj1TbK/UVaZqOmk+k7ZGnSRyFvDTw02mboKPHnQKOFFcQl+BJj+dgN5jWdI+s3o
         9scMRHPYWFx0y8oyC8S64vVgwhi8DWUvBp0Ov9JNGEPsFPoUW6NSXZmRtPBA6df5Rb9S
         kf8vEqr4OxQuwdTCB60I01fVWLVktzZkLsoDrfXPIGkLQOfvjyUndxxslmFrN8pN5Jl2
         cG9pfHMqIABHhh+o1Ov/rkS4RhjFHGKzIkch2ks7gzlJO52YaDJYdK3EQJOqYUtFcBbd
         cWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944979; x=1723549779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zcyvcwsgz2iQmtLQWjshVBEVrR/YiNBp3RnZXLsmNgk=;
        b=LS0pYvTPP3kv1gG0khDrnu7y4ZFGcH+tnEkTBpGoWwC9KedD4+XEk2YHYZSdLvKhBA
         fzAh/owbuKB2ngqnd5pkQ95YdCSN03txcVCFBwwlwBCzZuVpJkKjg+z2upMeO3nyB2Dj
         7PZhZgjKTrzcKBMGRKGS9D29oxEeM0AbcWhlQiKaEo1qBwYTRMPm8fHKBAbeghFF+x82
         peXyvWqkBVdpWuHk5aYt562uvW/b8xna65BhvBZQTrAmBdkjJBFb6srjXWv+k3zfkiiw
         pD9F2n/bsWbcvvUVrmeoAEJYOFj7ml9k4kTGgfoC1+35LeGcyCrHNZdQEqbbzXjRzdTE
         IqBw==
X-Forwarded-Encrypted: i=1; AJvYcCWSqFqOZFf4me2jeZ8Y3bF4jq1yxVEEPde5KJ8zt1X9SJ0PhjdZPDypczgj5ZUi7ur1uNCf2aRN5PaLFEfp2vTffhmex5wNDOZ5Y27UTQ==
X-Gm-Message-State: AOJu0YyezngJW0xHy1/ei1830aL1uVPJWRfBY+kAhG80/WD3aHhs/Vb7
	o6clMcnixQ7W+y7dT4PN4kRcxfjWMeMQzDdUL9ZfO9RjJW6TbTWdmXZj2MuCyuA=
X-Google-Smtp-Source: AGHT+IHdNQyl3G6YqRv/AULLacN9IkO3UKdGEkDTc1z/CSIyS1focn/fP6c1AdbO/8YkYsQAvDZDYA==
X-Received: by 2002:a05:600c:4513:b0:426:63b4:73b0 with SMTP id 5b1f17b1804b1-428e6b96e50mr97378085e9.34.1722944979504;
        Tue, 06 Aug 2024 04:49:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:39 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom,wcd934x: Correct reset GPIO polarity in example
Date: Tue,  6 Aug 2024 13:49:29 +0200
Message-ID: <20240806114931.40090-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset GPIO of WCD9340/WCD9341 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index beb0ff0245b0..a65b1d1d5fdd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -199,10 +199,11 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     codec@1,0{
         compatible = "slim217,250";
         reg = <1 0>;
-        reset-gpios = <&tlmm 64 0>;
+        reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
         slim-ifc-dev = <&wcd9340_ifd>;
         #sound-dai-cells = <1>;
         interrupt-parent = <&tlmm>;
-- 
2.43.0


