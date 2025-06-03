Return-Path: <linux-arm-msm+bounces-60139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C5ACC5F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 13:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B009188C3B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 11:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C3A23099F;
	Tue,  3 Jun 2025 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EZCTQArh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3DC22F744
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951852; cv=none; b=g0iWOM9zB8p+WiQTNWNPGW9M1LSN0fGs1Y9CGyEDvUqS9s8E7rlfufrPtSzEzt6CRsD2rLkwegOpB+Hqf6kTn7cOSwMlflbb4ejVktrJv4Lf1I7S+HV26m9PgD0Yadi8xqTh+pxYe4iUXjopYRMkOs/PHVaWLEEXcF05kb5kDxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951852; c=relaxed/simple;
	bh=PmQVq4hQS35gwAsgZYe0MBq9ErqtT+mom2oZuUDxvi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CndNA64RlK9tp86gb3Adin/T7iVe4grgS/EQsOICj9cch7J+oGI6DxT960RBCYaRtdmdGzPqBZ8eG1rcSUGvhpRB8uSTSPbn/lvbU29Y5O+1SCC/1W57AThw2n5pDFe/g7g/2icKyrPS824KNgivlB/HlHsPduOhiY3BWVKdKW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EZCTQArh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ca8e6d05so1739115e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951849; x=1749556649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=EZCTQArhG5wguIM/WrtePDThGROYXf9FMu49xPYbaXjlYXe9iZx/msOicacrLSc9MQ
         oSrlW+R2HhF2B+hPebtMqzEudtA1kzpF6QqIb2Acw9PIu18/2cYcD7FKTzgV5f0kT69t
         vGWU2sPUzgW/vvv/UIRyCYV7b64+rVnqdX3ZIZqi57NuDhwlwVe6xhoLK4LKSLFhkNgX
         zlIO6gnsDw2XJWX4Vw9gdHOlsC4znhpm02m6ab4hGqbT3zYbXCkUGh1hXEoceg2JlZaj
         ZpHlBZh4eoQwNZmCUbcDyE9WQU/yezKyJ7s6dkV7iXKF+bfdDLTp1wkLTykoBf6KVwkz
         wOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951849; x=1749556649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9iOMNCqnm556i6iWSK9mE2UkHu3B2asZSKy8c1kTbA=;
        b=IGcc6CSegsMz2u7PFKZARRKHQFC9x7bR73fO/2RRn9mtuvmlNZ3EVfQEeH+RteDWlq
         L0neN6VMEgj6OUhaCovJRAbesdMJECnVB6RLvUt1Qf4jQnr9ttPQpVc2SsmC1tmQlW2Q
         eZyIv+F21+FaAFr1+4q7uoki8j37C90GUfjWQJYmB8Hb8i79n4+p6hp8za5wuxl3+KlA
         UEfu8qkEjSkBAF9gmD5K2DL2Yw725CzSnWcW5l4qT7elxFXTaUe+xEBnGtD11mmSUGbC
         gd8rEHAnVQQAaSsfTNU1JnVipwVtLj67gTsp7/7fCZMyRZgp50ZrVUULFwdr9VITtoOJ
         KWhw==
X-Forwarded-Encrypted: i=1; AJvYcCU8fmpxCULN6z2cFCa9nV97QKrh3NSOQLPR9asvS23hDAdHJ6vXcIO4HESr/XGeX/HLinBnLJGm4uKjenz5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1j79kI7UYh4+lQ9YLT0YZWXoIE5Bb+nctFexHDggl1KusTv+n
	CUz7zeE+gr9u6VJY7mk/tQgs9rsEjPygNWOFB6AiJgfqDROqoC0HSHoii2DAaN/9Nq4=
X-Gm-Gg: ASbGncuYt5ft3RCRwF9tcIxcuTQokaNHjszOEtgDr3D3ighcTFtizmHwol4tGzIESvz
	L+fnIQYcHDxETYqn1qnkzXRDENRV0ESWVFRm0YiXGg+N6SM2IvtOqRyl9YNFC5S57ZHVpw4bJ5T
	+jJIrbOLwCqEQhkfhm6Ytaj4ovl5mOKSVaH1pVt8ypLHNR1AhwOP03U9tDHD8Q3YpWKif3VNaDa
	fQxS3DgqVlwJVOHeVHtKcAb2+Mx8EcylRtfJKDc9BeIv/M1HENRiJ4LoPEK+NVGSwOkpFNpjEHu
	IQieNxHs0Msf7BWjhhcdk+9ekYwRLt40xZBPqOlwDXUqQc8iDL2YIA2lu4XGdjBbhcE/o0LQ6V+
	rj0WdkZOFaLuKsqHOtTOvEw==
X-Google-Smtp-Source: AGHT+IG6CmWM3RslzVJ9Zs6x2OnxvGd9okADIrUTxvkVwVY0rJS07w9DnVo5m/6fQdGbvnL2BjUAIg==
X-Received: by 2002:a05:6000:2886:b0:3a3:7049:f947 with SMTP id ffacd0b85a97d-3a4f897bc88mr4781768f8f.10.1748951849223;
        Tue, 03 Jun 2025 04:57:29 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:09 +0200
Subject: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing reg
 maxItems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PmQVq4hQS35gwAsgZYe0MBq9ErqtT+mom2oZuUDxvi4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMb6qbPyHvmIRIrN/4NfNvZ2r6JN2VnhQ/rt
 P/6fx1bFIiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jGwAKCRDBN2bmhouD
 11okD/9H8uQVKm6Fba6vs1oJEhpW2E6WDVf76MJKju/FQ59Kihwd3IlRjqvGcI3JVd0sghwfs5E
 dVHRZW7lejfKzozTRGlzYKm8jWya/bma153cjRkvzpDQ4dCBvIRrkIYg1uIO2KFYZbF+V1iRT3b
 g7UmqkWQqU2Xb3Vf2CVYNjeCKU7YQMZfAM2zsm2XqrHunsByEHhmiuPvSN4lljzOe//vWePZRWG
 oO8322aArQSfeBI4C52Yg3eKV9fHdvXpB6DijXi8YYx1Wb7SNfaj4LhVu8ODa/+DU8SGRNlxNP1
 Z9PDMuPCdkOOHza9p/Gzg96ZEX6jiKXZKNLNsZ+MjGfjP+789AdQqGGgMgnuGAk8XzT9GFl8lwQ
 fiu3PECrJ9h2dK0zIrh7fps9SVMjmuxVr4ap/yatDj2cnoKj1Ecc3/++X50tuN4BcbhEcrwOBNX
 KhkMPb8L/I7QgZ5Au5q7TpxMhDVfJXNqe+Iy+pY/JEE4GthRQjtzicDApK+RT8f+pceNlH4Ic/c
 Z1yMhvvNcKbEQkmwRPFyFCJHuv4iX9VNx0nZOxzJnR5Lc+ILPanys9dW3fr6NbwJo5ZlEyyJujQ
 JAyTMfMPK7r9ETJN711C9Myj4NJ76EYYBkR/8yBzgRKUIZmx+mA4WHhJApZvSUkhlTtOCzwMCuu
 LpLpbn5wLmTgrQA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Lists should have fixed constraint, so add missing maxItems to the "reg"
property.  Since minItems=maxItems, the minItems is implied by dtschema
so can be dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index eea822861804c259068aa8c4598188db28895518..682ccd76f5c25fc13bb3375007d39e6208cdddc0 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -36,7 +36,7 @@ properties:
       - const: scfg
 
   reg:
-    minItems: 3
+    maxItems: 3
 
   interrupt-names:
     minItems: 1

-- 
2.45.2


