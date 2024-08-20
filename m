Return-Path: <linux-arm-msm+bounces-29051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE5957E4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 08:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B604B223CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 06:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40F81E2137;
	Tue, 20 Aug 2024 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="etg93A3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CECD1E210A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724135492; cv=none; b=kLRR8qzl0iGgpYG1sgH00WzaH235mn+XJ3QPOrAIkYVBOj5VSRThAbi1zQIRHN43g7lHvhH6QuMa5FMJoOhjpsO8b9zrvBR091ZCzm9aT8ez+lIMe9j9BZ60b09iaC8TbdMFJ2qlcRKZBJ/AQnyJ8niXIiiNBptn/iOGEMlX5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724135492; c=relaxed/simple;
	bh=sXqiiQ8My1UQHdF8XP8yxQIGVVpVwbUHO3wz0fBARec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwM7LFCDKzkHqlDOQheORGtJh9lceGQ/GQ1EC998BqI8MvSqQWx17ITFotqJ/ZWqnsMxU7DXZrIGMMZKkSmAkQVdirlNB+9AS+Vy3UFLLOKc7s2I1V81SQ/MGmX4lIlVqw8cntzjy13BrAbFEeAG+ghmkwdItnDB9qvNEyexo1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=etg93A3a; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42819654737so39697185e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724135488; x=1724740288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVW3Gyp1u8xh3tJP8cuhx0/w5djPTqbmXPb9/SDuAG8=;
        b=etg93A3a59N3e2GmFSnmOCBeIR2G96/NFEOSx3wvjqVsFwlZEORs+sKn4rAGqtD0VZ
         SzUwiX9fTAl0UFp8hYQXjioZDnmUcBosuKAA7EWg0KouIoUnG93GWGBmyp8IcXES9Efi
         24YlJeJ0xxok3rZJDyLHXHqhntO7vEgxN3eRs6+ksnH8YS0A2PMpxIWFtn1Qs4DqP/g1
         YA3VPdTz0UGI7fAii63r6oqvowRxAkhwgzb8jFUC2t/sVltSN3XyIxmQRIf7Ho6Mhph4
         P8DzfV1+axwyt9Cq4tnRJiX+PisE3x3FMZb3gK7S4zbceW74IuOQ/sNUCyJVgtDZukFT
         Td2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724135488; x=1724740288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVW3Gyp1u8xh3tJP8cuhx0/w5djPTqbmXPb9/SDuAG8=;
        b=BNBcz4cMYtXCrbX9sJWioP/TaENCuGAU6ezwdBwD8XF1eENhR1Q9z6AEg0m0gWZIRo
         HlMqJYoOWSQmPlhFQYTi93PVn6FVqafWhCI1lAr7j2jYOfnVNaUsXBRDWFXjrs7BVMKj
         n8gWNuGMCkCyb6qalLrlKDfDFcTQNlpn1h65ZuH8lWqynxW5+VIUHA51/sXhWXJC1Hz5
         BPm+CxMQSKm4AOI2U98zG+Uwe9sQkVbofuUOv+Muueb0E8GX6JnOP/Vu6CZs0fry1NpB
         48Ud4xaUMl9DWg7ASheejUOfc+GCO/abksfArG0R0wafZQGWrmqFpFZ3MOgzouJpcheb
         1CEg==
X-Forwarded-Encrypted: i=1; AJvYcCWnDgA8AdD45OpbKtlMewD2Fsym3oAgUC9qvVpxWO2ADUUZ/qvZx97jLEmrwZORpl6Lzo+cV4+h+GgOthxGSXpEXZcL2tQqMVPNtV39cA==
X-Gm-Message-State: AOJu0Ywg+IH+KFDjur//HjyVJ7Pp1FZnMmEUhOeG6WKoK25VbEWYluk3
	0GHYn6tnA61ndharSSzFRmWjmgfz361H5Nj/ieKnD0OhTLMFqhcx8MO2haM/2zU=
X-Google-Smtp-Source: AGHT+IGqSaOTtMAFkFfw+MY+BXXMyKz8R9RHIlqmZAA07Xvp7gk8CM/mI6HP1sjFsVSnwGZxMAECLg==
X-Received: by 2002:a05:6000:186:b0:368:669c:3bd3 with SMTP id ffacd0b85a97d-371946b1166mr8512834f8f.48.1724135487564;
        Mon, 19 Aug 2024 23:31:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371a937a694sm7959432f8f.65.2024.08.19.23.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 23:31:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] dt-bindings: i2c: qcom,i2c-cci: add missing clocks constraint in if:then:
Date: Tue, 20 Aug 2024 08:31:24 +0200
Message-ID: <20240820063124.9242-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Top level defines clocks as variable from 3 to 6 items, so each clause
in if:then: should narrow it further with explicit min and maxItems.
Without minItems, the constrain from top-level is being applied, thus
qcom,msm8996-cci allows between 3 and 4 clocks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Older dtschema behaved differently and missing minItems was implied in
if:then:. However the preferred policy is to be explicit about such
schema - define strict constraints in if:then:.

Cc: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index c33ae7b63b84..7dab3852c7f8 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -130,6 +130,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 4
           maxItems: 4
         clock-names:
           items:
-- 
2.43.0


