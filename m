Return-Path: <linux-arm-msm+bounces-34709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 846069A1DF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA4C1F2126D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFA11D88D3;
	Thu, 17 Oct 2024 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7Hf8xom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13C11D88C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156496; cv=none; b=LEhpJ3lVKU5U7kLiFmA/bJvukRUNBG9q7qC+9KtehCcoDKykB+wudv5tqJDd40bMsm+OU43FCtiIlRB0Sq+GhHK08qCuH7ZFHhZ/W/j4vNSwwThNJ8v9bYa/H6QQ3/08pHCRzZG/8urXjWkBhtisBMz36iKmHO78+wxsSjGkNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156496; c=relaxed/simple;
	bh=OFUTbt01W57UIzbwt1gpTo3z57X1onq8v0mSZ7fvckY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JfFsNUbSGCghMSejIfMpY+kdkQshAH1DKPe2s3AOeGX9t2yL4K1p/BsGFNxG44hRCYckLWcpPAN5L5pP0wKjAjm3/zeYoVfZcf152mxutS0r+X741ZJ/389a0d8HEBsAxuzxBoN0xmMsXYDKDTtIIalMGJLBL+faaaLkQd5vX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7Hf8xom; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d4ee8d15aso81071f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729156491; x=1729761291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++RZvUSYm5I0ITBIr1eDkKq7SHCu0gvOfmRf7dj2AKQ=;
        b=u7Hf8xomKotgv0K6Fe8eh3K8uKgYJe6IPo2CeDagYQ7YEjDyr8xgodIbfm0TLWzFAS
         Lv/fpAWDjqWiIMFszWM1LbSw5UuJC5FYIzDH7oBi8A8XM+oXm1rJqs9x1nwJEsaI9gFg
         SDpxmIBPseOtyr0WzxiO1eutKE5ookgrfpm9/weh36PBHo8Ib6DVS4l0SuGxA/3WTav3
         +JC3ScPIgoN+ws94VseMSKXepFB+0QRYK9ZSki/cXtfbIIHmnmJ+VwyHoUJiFvexEAZY
         wYY5apiXZ5t2dKUQSdcvQwmhx1WG0/VuZevbIuZ5ZQEepwxT7BWBTkoiY+DdtBfLP2/h
         yyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729156491; x=1729761291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++RZvUSYm5I0ITBIr1eDkKq7SHCu0gvOfmRf7dj2AKQ=;
        b=I6I/3ekptn/5JtZVuFGFPWudmatgGmQeCz5GUPzq9zC1qh2qxa+Tg4xKElo+eXZ8vB
         v0sq4MNbsAqTkDW9WwsPL7Or2rl1VSyv0miLe4W0P/ppPwtb+EXT9tUoFpLMlwCINR+g
         Exh1TkkPderFzarhPOaEGxY4nx2LGyPsZEdzXgo8XIGmx6I8K2hV2HFyLGVT2ftj7Su0
         Uky714PkvyUPUS9pOaiDL7cX6uJn3dEZcwuvCOQ7Y6vpcrMkdOGfbT9Y4GvEEJekYSpY
         p8fBVtGEH4a4vlYkcfmNeOCN3C52OSNFBOjDcgfSKxQabeKKSolCbVZrjYlk+/WpnMM0
         ziBA==
X-Forwarded-Encrypted: i=1; AJvYcCU9sJQBKc/3/r3Il3uxVHR+x+EUtm/oJ3FEYSCzIDXyMaKo3tRyutIIlR0gim2Oa+mq2rlLBfM9iadGcfV5@vger.kernel.org
X-Gm-Message-State: AOJu0YwvlsCLn6QkCGckk65JS7p3VJS0snJK7hT4FTAQf7MkM0fQZ43p
	7oD/9BLCuRCA1FRpBt+gvF5Gt5gtUNwb4KZazx2Zoz3la9MAtctBklRxAng4ovM=
X-Google-Smtp-Source: AGHT+IEE02ekLjm8TbPP6kTm+oXFzkRyX+nHueXutR7x0HjMCzdjaSTpWmIK7+MmtHTpAANlj6Cbrw==
X-Received: by 2002:a5d:47a6:0:b0:37d:4517:acfb with SMTP id ffacd0b85a97d-37d936999e4mr953956f8f.2.1729156491016;
        Thu, 17 Oct 2024 02:14:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa8778csm6614252f8f.25.2024.10.17.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:14:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mailbox: qcom,apcs-kpss-global: correct expected clocks for fallbacks
Date: Thu, 17 Oct 2024 11:14:47 +0200
Message-ID: <20241017091447.41450-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1e9cb7e007dc ("dt-bindings: mailbox: qcom,apcs-kpss-global: use
fallbacks") and commit 34d8775a0edc ("dt-bindings: mailbox:
qcom,apcs-kpss-global: use fallbacks for few variants") added fallbacks
to few existing compatibles.  Neither devices with these existing
compatibles nor devices using fallbacks alone, have clocks, so the
"if:then:" block defining this constrain should be written as
"contains:".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml     | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 982c741e6225..9d2dfd85b207 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -165,12 +165,13 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,msm8953-apcs-kpss-global
-            - qcom,msm8994-apcs-kpss-global
-            - qcom,msm8996-apcs-hmss-global
-            - qcom,qcm2290-apcs-hmss-global
-            - qcom,sdm845-apss-shared
+          contains:
+            enum:
+              - qcom,msm8953-apcs-kpss-global
+              - qcom,msm8994-apcs-kpss-global
+              - qcom,msm8996-apcs-hmss-global
+              - qcom,qcm2290-apcs-hmss-global
+              - qcom,sdm845-apss-shared
     then:
       properties:
         clocks: false
-- 
2.43.0


