Return-Path: <linux-arm-msm+bounces-84842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F397CB1913
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB552302CC82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB3D219A89;
	Wed, 10 Dec 2025 01:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IxzIIUHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9056721ABB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328744; cv=none; b=NeChKWvyn0EMJBJFHh8u5D1UAGlOWovlQeLFRcKTqptTiH8EaMNv4gtsbLlKCcgwR9kQzcvH1R8dmL8nPBtHlGZcCGQZtZcASNaqc5hMrOLut3+XEXfp0tUh7kJTUEeR/TBEiir53HKjt1u3hGVVKtnFAS8L1ASKvTRKP681DI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328744; c=relaxed/simple;
	bh=J8jdRyxN4pHi5HwGXl4WVjETvZhi27YUV8vuAHkKjmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGhx5IAMEdxHvMXnNRkP7Vx8j18NhrDYO6kt7/JeKspSRkewHa+PsbKXIV286kkcN7zA4hn6LzAn7HzTVWxJLWf65JzwSLc2bW6mMJ+Q0HD1+dzdfe8aM3+DG92x4XD/iL6rxanfEWweimQhlTMT9pTt+lmzYuGW6J2L3eGhR9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IxzIIUHC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so44290175e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328741; x=1765933541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMLxoWB0gDu+hYqFcCi8C1Ebr4DsG+tpvO7SBM73pts=;
        b=IxzIIUHCW/DeNp6ilaOVI3QAnUh/lyTK2xZAeINqiZIshDdzefx9POEMaa+aFfAX/o
         Em9YE8m9sbZ8A2PTTCOnoqguSdsqyTG6z1c1YPNNGrMTzVWjf0yCgkeUQe1LAUqUT1lG
         b4carawG6rCsq/fqOclA3YB3bk4DHlCvWeK2XF9KNNsQF1V+ecBa7uuM+EsohEFIvkSl
         TFoPiAcp12P0E9VKiS1uXTF+6XTJl75z83unhfLCisx/M5gop3nc6fep+4vvEKh9zp1+
         rW6uvkMD4H7lHVsSI85nV+u7lSZFX5BYOjArtsa8l1VbdLnx4bt2RnTsYF2IU89AsPVa
         utnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328741; x=1765933541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tMLxoWB0gDu+hYqFcCi8C1Ebr4DsG+tpvO7SBM73pts=;
        b=nsczA8xSBDj4Q5mH3QnSf206+P7xVNxo4k5oU3S8O4rd9e3K5Wc5V42mhzPnn9rfXk
         G0wZjORvkmvIcUH0AIDO+Jz4Y7SG2fwyen02rT0Qsft2wWf/fJQRI0IP3OmDVv2g6Iuk
         bT/eafP1tNSwxkMb9uTbCe9kbBQVJMJXqEt9aLHt29RVkFEUf7N8yA32a97+v7k0Thy2
         e7k6Njr3DtYyIb+dNbB/GZA89+IMD17zL7OZ5s5sdaGcfY0sY0KMm4Ryy2aEdlBW7rNg
         3FSJnQ7+iY/K4Aa63ym9iRRO1lK/+Z2Cu/JIT/STQorVDY3l+ZOO+jShklVe25h1S4OB
         mOww==
X-Forwarded-Encrypted: i=1; AJvYcCUXmzxESvY9S2nudIUVN3EYK63IsC+ZvxugTm/y9x1jha8nBjYNjOgOUhgnI3PClkfIMGlO8q/bodkgLXMy@vger.kernel.org
X-Gm-Message-State: AOJu0YwVmidNl/wtN0hPCPy3900S9CAmmHAyXL80sOLfWl8emhIBwDZw
	UGSmi1SxS+IUXfBLikXLOPUsmtj+YyoSeLsfawAcPgHZe75XRLDi7JAFwNXWYVvwCRI=
X-Gm-Gg: ASbGncuxK7rGhDxHsUrM+gcP7PPzrOtg+eyR90Boggm7pgA3/VT+JF1ARu7kfmEmMs6
	v0pTUaCzfQ4jKdb28VRmoexPUVX+rl1aXWiUcO7P+KmMdpRhc57rSbwX2C44klvaNOnqVBkIb5d
	0kr8As6Dxq6KPTQwf8NSL6AUHOxs7dWNjE+p4nDcASEvEglvJjrY9kbXaOvDqnU+helROJYPhbJ
	CO7JsDsWzGYDXbHp9rAPjaRD3HQk2ZbBPlH1pcgLK4jso/dwLBgAdprbDyv6tbmd85d6xmXOvjF
	dIYWwWxIj389m8huyw/roFJIB6sSCKuYCE9cowVFcTcuZ4Qzc5iA8UfAlODDmllpyJN5vo0qi3c
	MuLRQqKIBljK3vT2y+UuSvhJrqu7qXOInT+nnGOI3vLsyYegIKzdngq5V7Gf0EGmfdByIwf3G69
	Ko3SfALlPzGHnzPcPzoHmIhaCs19YY6O2PWlcQFUteq5m/nomswibWgNeI1G1R
X-Google-Smtp-Source: AGHT+IFYMluiQ4OKPV5Xr6Cra1B0NB6igYOb8auHiypnamFYSFB9jzG6KW2GARdfJZJFx9+vko2ixw==
X-Received: by 2002:a05:600c:1910:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-47a8376e3d9mr6486015e9.8.1765328741065;
        Tue, 09 Dec 2025 17:05:41 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:40 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:05:27 +0900
Subject: [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for Giantec
 GT24P64A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-fp4-cam-prep-v1-1-0eacbff271ec@fairphone.com>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=737;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=J8jdRyxN4pHi5HwGXl4WVjETvZhi27YUV8vuAHkKjmE=;
 b=mI6wLjWaV6kPINJVrW6xd+goS/oplPOblpiCMDfCYKOyYykcFKB5qA36gXDy031uD9RaEwiY1
 Ga78FKqUPyXA7d53Wc9YGCgs64YyHEeehU3zD27+Qo8eFR8CIdnQRR2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the compatible for another 64Kb EEPROM from Giantec.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index c21282634780..ce63acb025e8 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -132,6 +132,7 @@ properties:
       - items:
           - enum:
               - belling,bl24s64
+              - giantec,gt24p64a
               - onnn,n24s64b
               - puya,p24c64f
           - const: atmel,24c64

-- 
2.52.0


