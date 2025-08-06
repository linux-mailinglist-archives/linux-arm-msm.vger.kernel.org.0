Return-Path: <linux-arm-msm+bounces-67923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93BB1C85C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E6B3A9AA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9484290DBC;
	Wed,  6 Aug 2025 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bUyNzDTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9EB28ECD1
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493025; cv=none; b=qZaqJTsU4jAvcLGf7ZZ3wB0ElCHNWVbmXllAoN0HXE/6jO1PnS/buFJfskoBk1m00N563jGfNsYp8L1ujVSoT1M4TY0//lCHITRoQd1F0zbGcOteqUzLN1/+Hk5yxbecU3pSs9lcv4uImuHY+ynIdqWHxEkfdf0LM6rO9PvYZbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493025; c=relaxed/simple;
	bh=ET4/cnWWWkHcg4PrMTCOEmtwl30gm5wJvQlKvN+x1Uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ria+wFSdkmR1/68UOERCdkOE0saWGk6PcT6ggS3V9/BZQWgTQBVOzK/kJkwjeZBYaa49h/y+m27rIfWW3JZAuyDhzl9UEzRD4KvuUQrTbinZ1iP7z35mjdk+xhY340qxZBBRMtTo+uU2rqrd5/CqhvT9k+uPKZHkTdkzU/6Ha2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bUyNzDTI; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af95d5c0736so624023166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754493021; x=1755097821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWQOq9ZFA0+jON41lT2P1ONOkTPCL7fvL5fMlE2CuZY=;
        b=bUyNzDTIknj4zQQaX+uwMqIe6fNJzDG/mWg8dM7AFR9nyhZYn2nOu2ATy/uhjfg5UK
         sGQab9nMpgpvFgf2TY5cBzms4qksToqRDf5jk0FL5CQqZvIl45FFLYD5nNRJFMba579d
         V8NaefeG37BcywjIrz3W7FIhd4tw4/fBBnPP3W5narYeBXAkLnOZIS9F5toDg6HjNNEY
         GFQzE8n+bwgw4S69vNfYHGCiajBn6xY5bDGnYz9j4xuvvJDwRGGN8Mp2iBAJKvekOOFU
         w88HF6pJAwMQy2lfNy364273hbH9kRkvVptOBsuQUSPq3zMt8nYrq0CtGIB7AB62wPTO
         UnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493021; x=1755097821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWQOq9ZFA0+jON41lT2P1ONOkTPCL7fvL5fMlE2CuZY=;
        b=HzhvwMBa9gGB29Inhd2gvCRJIbb0oxjVJToI3LwesuVi3/5P48DmP4ms52zgdChRfd
         PUrTRn4zBi/AwcSsSc/zN63hLTcgR8KpFjOiE1gFpSAaRWd/SC6YNOcES6wDGmZKvoHY
         PjBKCiZHbsVXa8tGJqt/HnHlYGV8WG6Rfd2WuJ+7v0wkb71uktFEjdV+vkdzGApdUDvX
         BqzjNCAO5g4oUBICME1Zc4j1GNr4NmUpf5vsyZdvW+QNhYkbXFN0IFAD4cQCFwLDcuxD
         JaI2cmw7+4Y77HEK2nj2UnjYeA+WQ+dxKq9lUg0A0nUm1oPTcdAlOkeZ36Hf8gIpoOXF
         +J8g==
X-Forwarded-Encrypted: i=1; AJvYcCU4pgJXQRSdj9USjiPhoybz+RKL2NP0l55MsvPgV4POvv+TPSdcoZHEaSFW2N0xMbKjr+5mLZb7vfsdevDp@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9VORq3C+8HnsFl/4i92jAyKA1aKtJMnWPjUwWAlsGuDuEcMY
	7Cjyr41sY85K8S8yJaZR2nqJvoCdZR9oCbt2e0l1mNKkc6XKAO0jDDLLP7dILPlBbiU=
X-Gm-Gg: ASbGncu8ufo4Sro8f8WQseGFKJDkzAnrsdTV4xLgIyxdV5wvXKmoQX3t5uCbejnHwRm
	PKZYBZEIc+GU0my1PeWrVIisabDsuPeGekW+KpWJmuL0qq54xkLNDWc8hN1XehJGddEqdFtgOgk
	FUicAPpll/LqGyspYE3AALIUKZxNZSSJtQcQ5qyKdjdkrLSZ5/eNeQJoZnzxs0om1Nbf2oBypB5
	K9KJ3+p2Tp/k26/x2T0TZwXFCypdI2B6sv9ejDW6YNaK0Ugrl0JpbZ7yrbT8i5ZWAbJ40UWEIM8
	yK6J91F45H/1gSU2+wP3j8Npo8ve5D83lGf7qL5G6ST6sZiEdkoRZhMKjd5sCFtlzs9PxlAmcjX
	MG7fpx/rMf5J5D6MBrdiinXz7MuPbU/3x+cb1Bxe/yrc2UtIk6rHcuxVWj4BM5q49W2iLPh5PNQ
	NDuYg=
X-Google-Smtp-Source: AGHT+IHDiUvyZem9mnKzHWgCS04byao7rqFEhYeBxSdb8hW07XFM2TDwH3AdldZ5yojPBgR8oG59Tg==
X-Received: by 2002:a17:907:3d4c:b0:af9:610e:343e with SMTP id a640c23a62f3a-af990116764mr319719666b.11.1754493021348;
        Wed, 06 Aug 2025 08:10:21 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b77sm1120100666b.51.2025.08.06.08.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 08:10:20 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Wed, 06 Aug 2025 17:10:08 +0200
Subject: [PATCH 1/3] dt-bindings: input: Add bindings for Awinic AW86927
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-aw86927-v1-1-23d8a6d0f2b2@fairphone.com>
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
In-Reply-To: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754493019; l=1612;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=ET4/cnWWWkHcg4PrMTCOEmtwl30gm5wJvQlKvN+x1Uc=;
 b=BDsHRqaB0NzKRARDq+jBvJ++2ZAtUPhBQ/H+Gqwm7jqsb0bXU98BNzQC8cF+qPuWKJxaCp9uB
 dDm3Lq00oPXBY7wtUrNl7cOp4oHfCuthzhNe+/zObhAHLfzi3AI+g3v
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add bindings for the Awinic AW86927 haptic chip which can be found in
smartphones.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../devicetree/bindings/input/awinic,aw86927.yaml  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
new file mode 100644
index 000000000000..43012f28d9aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/awinic,aw86927.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW86927 LRA Haptics driver
+
+maintainers:
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+properties:
+  compatible:
+    const: awinic,aw86927
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        vibrator@5a {
+            compatible = "awinic,aw86927";
+            reg = <0x5a>;
+            interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
+            reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+        };
+    };

-- 
2.43.0


