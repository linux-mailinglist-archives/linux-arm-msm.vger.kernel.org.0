Return-Path: <linux-arm-msm+bounces-86971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D81CE9BAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9B5330303AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64892101AE;
	Tue, 30 Dec 2025 13:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYvLmr6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE7212FB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767099780; cv=none; b=dapJ1lJFVhBYANNKzA5JurVj7FVtdCnIGsb0dDU56mA0syHpQJvz8tY3KZdfdQU3Vyo1x1cNZZ/pm6GP+HoIONCe+xq6gOlOGMfor42zwv8lCs7mPjvT+PmMe0wS/URON6+gaI8ZTiGzOTcHT9KxwtbjlvzfaVIfLyREIhTwqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767099780; c=relaxed/simple;
	bh=SVJlcDayOcdOuFmlxFZIJno8JEUkvS2rwI28zFq/GdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AVdtNC5GstGE+XfrbnojERcpMESeE95fklchU+/IJoT4BsvH5h2C91BNeYmTzXXV36iRyJH2uwsLHsK4GlvnXLk3f5jaCPwvtV7tRWGjN8Xzt+GtXf4DPaHEm8d5cnllcyOYbwP0XkDJAblxYbI/dY7IkqH526bqZGK4miUpSuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYvLmr6W; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a1388cdac3so92611465ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767099778; x=1767704578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSJakbOsK6HuPfvndjr4pklixI6V6EaaZEWI2YnlWqA=;
        b=IYvLmr6WkDXnZXu+1PZPZwoX74HMI+IjjSlk6sYwxa9MNFuQ4egJOr/UUoCoabdAaL
         w7dDoHPk1HXwVzCDhF1KJWR8K59EZCmUZj4LmuItJKiEOX7zyFsFeaAOZzPspLQaKlOO
         /tU0msYVgZnPr+XBGJv0G4jrrL0uC0Cep1oJfI6cn0da8ReV+4d4ixPgNO4q94RX0673
         cFNvC8xwZb1VRkYV1jx3diq6+RvwpNdLjsQTHAhimvAyV9YpB+f6ENTsgXQnAuYZz9Hl
         uY62Z5KyDNfVokZK88bmO5AgngmFGNBqGAT1GlbIsbzSsG970/xAeR5fxRObwUk+5oiV
         W+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767099778; x=1767704578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jSJakbOsK6HuPfvndjr4pklixI6V6EaaZEWI2YnlWqA=;
        b=AyV+ozNhBbrY9jtoU5/sblNE0JmrsJ7UaMikqbgqxf06eUyb2C1innt3bb8W1uDHph
         TABIYC9z4kxdBtDWeWgTzB6C4dGv9DrhaMLvwMK+bD6gxinkdZBhdHwP0hO7Pgc8bvg3
         iC0DgNI3BeDFP4swaCL1cjtc0t/NVgNsuvgGVgg+PFhgjDOmnHeP4I+hgpDK8G1euyFI
         7hSPcIeVztQUObi6YPDHz25H2RpYmhS7h2FH2cpkpKIvDjeK4BFP/FKLk5cF86DSam7E
         gl+tJjgw+jzazGQLDJ5rQrNZKAK4fUtcVddtQbPKv+UI88nAC0E/V0R5paekEGjWtaUA
         0nQw==
X-Forwarded-Encrypted: i=1; AJvYcCXbd7qv/ALc7pYg9m4Ny97PJBIxJ5EagsLC0A+7oAlpptFUNR4ItN1JEQPAAlashMuzy+yo5Ntha8qOzyFI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7TclRvejtOaRadp13mZTpi5epFcP9PoI6kzR3FKDNT2nlOSrY
	NwMyaIKEgXPMeSni5LBgRJDP1O7gS6jTppWlz+k3cWCqLqZfxv9b2HOl
X-Gm-Gg: AY/fxX666YT0GINrV1mMpalQESxsYobWtaOiUsjVHkvAcZPsovHH2eHTAi9FoO9rveT
	ul1/UNJFjgNNS6C9w6eMMM+4aXGMPIOwgKfvoMx3tOpDUfxl0qlp/NdVXxZKVO1AbA5LmeYt6eu
	zRCWdzfAwekKEGMFnHyyae/+/TuGhcGMIURrtQhMI1maClv0/lQcvRy+Q0Kev4hAUDEbb/sld0y
	mFUgqHLPYxiu8lIeb1sLjuM5rHS7TwX3oTDvHmft9++XML2UJsFEU9BbFs8M1ugxQFTx3Yw6slD
	ptLXJuHib9rn7zij/OxPlY4tnVCLS7FEByt1ZnJXSN/kPGzqmwMkwhQ55t4NPcklp1NX3cJ14sC
	V/HBpbPl8sGCdlPD8KP0xQvDytUxK2A0vKZhaf8YhzXPzUJaBWXRkd/6WJz97K4TeORX4K/Zl0w
	/Z0wFUW3oDqNExOaBM0Xd3xID34O9tdKIFp03M
X-Google-Smtp-Source: AGHT+IHZerZ0LNO2PuMFv7iW0Mjil2vz3+YsCHT76XvPfMWbN4zdO9z4ljPoono1/dOsj9Os3Y/Gyg==
X-Received: by 2002:a17:903:249:b0:2a0:de4f:c9b with SMTP id d9443c01a7336-2a2f222b700mr347394015ad.4.1767099777888;
        Tue, 30 Dec 2025 05:02:57 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec6bsm296003075ad.87.2025.12.30.05.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 05:02:57 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v10 2/5] dt-bindings: backlight: gpio-backlight: allow multiple GPIOs
Date: Tue, 30 Dec 2025 18:32:24 +0530
Message-Id: <20251230130227.3503590-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230130227.3503590-1-tessolveupstream@gmail.com>
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the gpio-backlight binding to support configurations that require
more than one GPIO for enabling/disabling the backlight.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
index 584030b6b0b9..1483ce4a3480 100644
--- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
@@ -17,7 +17,8 @@ properties:
 
   gpios:
     description: The gpio that is used for enabling/disabling the backlight.
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   default-on:
     description: enable the backlight at boot.
@@ -38,4 +39,13 @@ examples:
         default-on;
     };
 
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    backlight {
+      compatible = "gpio-backlight";
+      gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>,
+              <&gpio3 5 GPIO_ACTIVE_HIGH>;
+      default-on;
+    };
+
 ...
-- 
2.34.1


