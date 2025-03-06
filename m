Return-Path: <linux-arm-msm+bounces-50468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E970DA545A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53A3169919
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB4A20896C;
	Thu,  6 Mar 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMegtc2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AB32080D7
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251538; cv=none; b=UkQ31cgl9DERmME/nFQnHhblgNvlIX2irQ6mZG0qCGpzQwih+mya9yTAPBr6g6LktxRejFRNPgdYFvj89hQy+foknD9uqiOPfu0//UwMhhjrpW1NBg2KDgNeWqt9an2EAsNPfaPbgVB8mH2BvZiVFLV1bAtxuNPX7eFMlOuWrCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251538; c=relaxed/simple;
	bh=h8r+LBE+AI2ozP6h7eTjG3J4/BjLDXG10kpvMQ2oQN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRbIosG9azvYKWkj49vYuq7kojQilNX4TQDa1a8IZTgfrTaPVk4tF91GnReMoOVYrqEj/z8R8+R2SFWZ/qcXIzSLZtHpDPL1gGiCWQigdSnCsL5HLnp3uSLw04oywVd/Rs1DvpIaRFMFKF5DshmsB1WwCno79jeTVsXnFHW6WXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMegtc2A; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bc2f816daso325575e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 00:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251535; x=1741856335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hEmsvIcMhwbu7qmMBTCnWlLRUTQP6Sh0jelKQ7eVPQ=;
        b=dMegtc2AgzVA1a5u67kGMZfWNM6Y2LiF3j33GyVUqWf6SkLWzu4w6S46qfUGkDb4GF
         cWglMRcyrJzUohaMbBZgI2jQrruFryCXRNMZSEPpDKcRPtRe7z9eR0SHhaMRP3hvLVT/
         VwWG9bM/xsRGhvR2KP5PGpj36t7Gbn5Z+Y2Yy+mbvhwM44fCQD91Wc0xTis0sz2RC6P0
         gbyauqLKeBK0ke+s81PVqBg9sARw6ShhzqbWGRwmZrKcJgJFwIeplITKA56D0qfBmkwh
         HxqQjjS/cpX4oYOvObL9vJp8pUNdYQdvE9KaYx5rLATq5yaOpguLZ2WYp7uxRY2CvpsZ
         OEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251535; x=1741856335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hEmsvIcMhwbu7qmMBTCnWlLRUTQP6Sh0jelKQ7eVPQ=;
        b=YHOislqIBdQnFMQ2GZVRcH3iYnJ8yIBEBVOoqYMhPXOWQb+mtd7skvKwmIJhw3tXGA
         lnFKhjUMEC8zp46G9iMarWY8m2Bc3vo0FiNYqIIkPR2rgkrPyRJ1x9GOb02um8uQKXhC
         qhAwAKLOkRZIUC/v8BO9QYCPrB0IL6ARbvAkbZ1hIsZF5S5ExOqWtOU8qsu+w6OBLOl4
         CEN3mw208VkJ+Q+Vbth/kJ6g3SaxOXVoTgy2i7ReNHdWCsoUaFyoW4u8WVKZi3Sf2/lL
         vzzapFvzfUb9DC1K4iarpbwTWO7ejVqjM2yIyVBJjvNSV1LGUeF2o+UXwfFo6GONeCL2
         l/qg==
X-Forwarded-Encrypted: i=1; AJvYcCXnXbFLfwqVd9QEcy3obRYskcml/2TnykV/Umalb1MiXOrVdxRQQAxhUsZShh7ZXFln1ykBo7ldRc79RkEQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWQ/y531EMAP9iRtHHZXeVMh/OFuwTsA/NgqF5f0PFD+uvnqb2
	m/bW7px7OBLTgv+1mGSbmJ+NfcEqrNPNubx21TFj1vP0AVVn3YRs+BVpmwGvT3I=
X-Gm-Gg: ASbGncuu2n4PwAHVrchAWcHaSK0nIoIHDrZ0V9lmJ+ZqaBs2QJhg6bTbP/HCG/WxOHC
	+040ebUXijoeVl0aoJmOXbktiZapenNBcRYgCL94DUa6YnZtWUTqIt+PQEfa/joutpZWRdvXcoj
	tooAFPRPWxG7qFddO9Wpt5l9pVNHmY73lhWwXf0zr4hACabcWm5pVKs0Bwsp7RdauVG0MHGamAA
	RHRlo5ZpvTgOE8/Ku70OVtJH+ckUWcVPLFXvoOOUVnNe6QJW/oFXOw2a290EfSRHyNsZTCRYnZb
	K4JwdrVhdb6C6jrbBo90BZUNuSFtk3KkdMi5/Hw8kqmvIcqI+5VPzdcFmgU=
X-Google-Smtp-Source: AGHT+IHIwsYxtasUsH7F1cqK4+j6EXhOQvlZn/zl/WS+mfi7XrhQaNW7pJTzxIk7YBr7G3/zWRlTbA==
X-Received: by 2002:a05:600c:b8e:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-43bd29b66eamr20092285e9.4.1741251535085;
        Thu, 06 Mar 2025 00:58:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b046dsm13184405e9.5.2025.03.06.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:58:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: memory-controllers: qcom,ebi2: Enforce child props
Date: Thu,  6 Mar 2025 09:58:49 +0100
Message-ID: <20250306085849.32852-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
References: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm EBI2 peripheral properties were moved from the device schema to
separate "peripheral-props" schema for child node, but the device schema
does not reference the new one.

Reference the peripheral-props schema so the child nodes will be
properly validated from the device schema.

Fixes: 06652f348f28 ("dt-bindings: memory-controllers: qcom,ebi2: Split out child node properties")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for Rob's tree.
---
 .../devicetree/bindings/memory-controllers/qcom,ebi2.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
index 3e6da1ba460e..423d7a75134f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2.yaml
@@ -104,6 +104,7 @@ required:
 patternProperties:
   "^.*@[0-5],[0-9a-f]+$":
     type: object
+    $ref: mc-peripheral-props.yaml#
     additionalProperties: true
 
 additionalProperties: false
-- 
2.43.0


