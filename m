Return-Path: <linux-arm-msm+bounces-50467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708FA545A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A0C164505
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B252080E4;
	Thu,  6 Mar 2025 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTn1l9Jy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AF1207E11
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741251536; cv=none; b=FRRkkzKJ+6Q5M34W6w9LWD5n7y7ukXmYY8TTiUqXBhZXWx2AmRqGPdxOhsd3Uk79hPNdReW6xd5+qdLvrWMmOdWIlG5OseDQyo1pYw16/w/o70Lvx7ULuqfZgePPJn5ZjV+W5j2nepJu0MUxD2bvZnUiBsMOLRgf4d1Q20WxzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741251536; c=relaxed/simple;
	bh=NWlL1nGttJYahk2Cib0CQslDOn2EQ4g8BSNR5s0Vy4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIERsJ5guaf2gd4Ajv3PKfNvK7TB7c0LNN5gSmRjzbB34z3105K/051k//GGy3PA8gDwKI9wPEPQKLUMUO4ge7MRemuBPtarICKU3ForcwVURYoR3doMc7ohNSbaEcwRjh4ejYo0ef+BhiWVvd+QUyMuB7YThSTs/5x7UeR+qIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iTn1l9Jy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bbe818049so463735e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741251533; x=1741856333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzaWip0h4cgnJEaNxzWkXQf8pOprxx1UV0JvZpTPUv4=;
        b=iTn1l9JywyFToOEZDB03xM+KZymFhEm1e3EKN2AN33XI7czuW8ZNPfc4sMThRptgyw
         fGQIoVb4aYH0EGIEz0Xw5nPfNFDEbbyoc5VzVl7MZ45voopn9GwOUNssn1atzQ0XU9qn
         0jjCNU441n275PY3Lf6A9YMIldYYp1XOiqZkWkXmiirzU32h8Irulwl1VWyQW/skMfKB
         PShn7+Nq7DGJM5y2roAjl5KlMwdM3SiNgfY+05+ZAPDrUK4Enc1IK2xQKn2cdxru+FlL
         jM6Pp6pVqTsqH0v9AHSxtIEEbeFqvr70aDMCPLSSO9JrlCvK4ZSviEEvIkzD8ayhYN9P
         93kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251533; x=1741856333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzaWip0h4cgnJEaNxzWkXQf8pOprxx1UV0JvZpTPUv4=;
        b=aYvr+rxrvyLqTzPRw5aFo5ec3nKa08MNSQey/FZJeJQ1GXXgeTPurqmhEAi1zt8Gu3
         VyOqAzIVZpBu4oQ1bQS2Y7apG+lybKVdCZTWGeOSWeSxU7K/TIc2d0hMlCTVwIUkHo3W
         nWByyHT7TQv1nTX1QYyZHEmnw5k8zGL9oMYdMO5t86I+w10/v25BRkf/m5XDdNgJnDMo
         c3KalfvTfvlEI0USx5BrUhpES+BpzyFL6VXEzb1xoVzwSjUvDeEnrFGtZa0X+xhrD9Mi
         kCp7IPQTzz1l+2NSFQBS/eO8fDGnPjJE4EbVrsH5WHyo7IoVusyEC5xV8yV59IwiHmoM
         43mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeR3pU08tw0WbsOFUvVzIOHRZ+hrDek5kGtvpEDsIg0znv6QvZ4ZBwfhBZpJfR1PxCsOon8WcI67pFkhj9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+1/tq9ZZfwytn8mOgn6TW1Mk0uuYsqMkS/ENmawnGoto5JAt
	ujJSl3Ntw+mvkd/hS8b1cPBplN3kSsG25bjE8pWccNOH47tPvGHmYcVc/CN16gU=
X-Gm-Gg: ASbGncttrLR/Pt/kzyZt+U2mQ65YcHVTEgKTH4O4A0RR+m4frgESh+p+IXkrChT+Lk/
	oJZUO0HzeD6uw0QYtGx5qyxXp9OH0/9g+23z/31it1bc/CQ8BrDGXCFJJMaL9HM73uqnFto6tcL
	Hj1pZcsDuZlettKa6SrtvGbRAYKKeFlYX7FMMeoV2vdGSDufExipr0iFUY7alhlDGOpBeTe9uZ4
	kCt0t99TCEL2jhNiyMnJEuZXNV6KL9Pw93eR0qGW3fXOn4ZPnR+34O+lrHByg61XEztlfJ5/uB+
	gr24KfJvJ5+Ohs+CaaofAv4/X1nCuivFWRcEImdlAIS3JaWo6JQtMaR1BHk=
X-Google-Smtp-Source: AGHT+IHVNtHxGr+nftjAhnUun25Kgv6DcFTFjM/EL36b0UMvE/mwNcZOxoyBOBbcisiK5cck01E7sQ==
X-Received: by 2002:a05:600c:1d90:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-43bd2ad9d91mr19260025e9.6.1741251533219;
        Thu, 06 Mar 2025 00:58:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b046dsm13184405e9.5.2025.03.06.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:58:52 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: memory-controllers: samsung,exynos4210-srom: Enforce child props
Date: Thu,  6 Mar 2025 09:58:48 +0100
Message-ID: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung Exynos SROM peripheral properties were moved from the device
schema to separate "peripheral-props" schema for child node, but the
device schema does not reference the new one.

Reference the peripheral-props schema so the child nodes will be
properly validated from the device schema.

Fixes: 67bf606fcf18 ("dt-bindings: memory-controllers: samsung,exynos4210-srom: Split out child node properties")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for Rob's tree.
---
 .../devicetree/bindings/memory-controllers/exynos-srom.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
index 2267c5107d60..1578514ec58d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
@@ -38,6 +38,7 @@ properties:
 patternProperties:
   "^.*@[0-3],[a-f0-9]+$":
     type: object
+    $ref: mc-peripheral-props.yaml#
     additionalProperties: true
 
     properties:
-- 
2.43.0


