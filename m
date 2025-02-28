Return-Path: <linux-arm-msm+bounces-49776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA3A48DBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 02:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29BBB7A7D17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 01:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B51E57C93;
	Fri, 28 Feb 2025 01:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhPQW9fs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298835959;
	Fri, 28 Feb 2025 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740705419; cv=none; b=GimtSWLtjQqPxHAVWjSJay0cdzxlhz2c30DgA7JyXqNc9/yFyDpG914iCHz88DvrD3Ew7rtT6y2j0Uj0leIadro1C9PQI2rNWe64rRNKhTOtgrHDuI4kmftOHlQfdkVZ3EbcP2rnC3b8tXiZ5/p0Z3NCL+Nn1m+4iAaHgDCQvJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740705419; c=relaxed/simple;
	bh=SAcxP0a2rn7xPhYNSw8owclyWM1IMbvt0acCG9jdOQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3KJUe5xlCBFLwXljUlvfXMbQk23F2xjPWLjBtPDBcI5GRgGTRphQJNvII3Wi26OH2pt23KICTDjfPuqnI8EEi0MSh2zShcc6HAv+ck5Unx96eofV2oLyRqp+VlI+CMXUVb2SndLAO+dt9UMvmmG3Qye6OEmQ3UyKqV2Aid/hEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhPQW9fs; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-221057b6ac4so25817235ad.2;
        Thu, 27 Feb 2025 17:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740705417; x=1741310217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjQHOJC5YxMT13yqRftg7vLHFzmBjwfrUQ1D5eAyAxI=;
        b=XhPQW9fsqvmh3kvwkaO6ljikryesy4CpnFykrO8qwnYZJgiKVzqUc8ZioYauUWhk+x
         yjUBIuJDUyESqItJsezn9bkwmwF49FppbR5F8vr3+7kq4QBDcyQIPlX+da/qerQxRylq
         pZIJ6GlTeBYcdEefpWOvoCR4g7liMb0bFbnQtXYLC8Sfk+I6cGzHkA8imVrsljl8aCnE
         ODDt4DhRw6Zuv/MCzbgsRWpihRibd7/dXQGacd77S9ML9kICJJl0btoIE7EngInjX2CD
         jz30qdMxXKRNBvZZNAncHzlPuQjeScml04KhJiIMSL0rnLsXdp22G01XB7yw+Y562MLc
         Oqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740705417; x=1741310217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjQHOJC5YxMT13yqRftg7vLHFzmBjwfrUQ1D5eAyAxI=;
        b=iWy8Jjem1CrseSkm5C9Mu0XSI2XwsXSC1QC1IEqPe7IEy8QOuMrWMDDGhZbuME9p0n
         48xwIz1TpO2rjMSzLNTwkXpbUfsF0N+o4jpfoMPRthIXHK2UQHfaeS/k8DJFUHcd8qvT
         zzAmQzRpMmq3fOou1W7f6cGNgixan4gNya4wILftwRD1IjvIiaWSsyuzol90k8zi95Z0
         8vNBWJr5Nwk/tL5Xnhw2iizcF+QfOxnS9KYwNqyP9o+ojLZhTkZ4tGuGQ/IYXGTj7Pu8
         guQlYhtXYbRVP9RA+9p4w0Fx7fb2GslChbUoWiRuseKMx8pX9es+BQhKV3G0cWxyZkvz
         QuiA==
X-Forwarded-Encrypted: i=1; AJvYcCUDojRTe7Q0to2SuZ55kz54P9UBlfvnPzXalphdpw8CxZGCCepMYqgm562U2QunCQdYBj7ixwrIubIE@vger.kernel.org, AJvYcCXumA5IAWXfS7JXlfBdeO6NUkz2SZ+78LuOvtshpYqXVodl5qWa57YKn8paC7lAd2KO4arU8IkRFydj9V0i@vger.kernel.org
X-Gm-Message-State: AOJu0YzahOUv8tNd2Sfkz0XFzv0Qv0w/hrNe7Vqx7oA8wpurpVzeErws
	RJyZn4TyNm/jHIpqywnIIhzMl+yd6LFj/nhXD8WTT8WbzfrOcjTD
X-Gm-Gg: ASbGncs/sdsLtEpo67ns3JEAAn1aFrmvSreIH9RAqS98k0F0gAIT4ANtELB4ZjWVNOx
	kpwQhHtFBRV3SLHoCJCBZRBR9J+Cf2P+KhPYJVrzRy9hj6BVtGAdTh1nGAZY56mLRsNHWAA1HMy
	FPXxYcGG8KYFGfI270QROXaYKJXMjQESACioMp3bmh0xXlFJWrE15gjoN6/yghtRRv8DHM4g5g9
	U6jozuOW3FSSIoNFfQ4bzItZRUfKXs7RL6sG7J0QEUzbkx40e9z9KaNxfLFTsSa2JXVSLrcto/g
	afhbKD9u1VjgwddPiPJliHKwD9Y=
X-Google-Smtp-Source: AGHT+IE8XyBT4EWIuva/YaY8WNDuQziGPA2wa+3mqcptu7JpbSq41hj6QwKMilEtIIjqtd40zZPlFA==
X-Received: by 2002:a05:6a00:1782:b0:732:5651:e892 with SMTP id d2e1a72fcca58-734ac3722a4mr2348389b3a.14.1740705416932;
        Thu, 27 Feb 2025 17:16:56 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:aece:4d21:7e89:e9e0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe4ce55sm2535901b3a.68.2025.02.27.17.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 17:16:56 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Thu, 27 Feb 2025 17:16:54 -0800
Subject: [PATCH v4 1/2] dt-bindings: nvmem: Add compatible for MSM8960
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-expressatt-tsens-v4-1-d70afa5a1fd0@gmail.com>
References: <20250227-expressatt-tsens-v4-0-d70afa5a1fd0@gmail.com>
In-Reply-To: <20250227-expressatt-tsens-v4-0-d70afa5a1fd0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wctrl@proton.me, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740705413; l=899;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=SAcxP0a2rn7xPhYNSw8owclyWM1IMbvt0acCG9jdOQw=;
 b=PtgjKcg3EdIn6y0q0RV1aAFxR282GNydivh3H/bEp/sbWVVeKmH74Tk2M/i5B9bLgwfENLu20
 1vcVTbxOshXAbFn94e/oXvobJVZ2G2E2J0pqOMshkYtX06Lg99qCK3n
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Document the QFPROM on MSM8960.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 80845c722ae46611c722effeaaf014a0caf76e4a..37282e89c8ad78b088f0a447891cd9301c750db2 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,ipq9574-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
+          - qcom,msm8960-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom

-- 
2.45.2


