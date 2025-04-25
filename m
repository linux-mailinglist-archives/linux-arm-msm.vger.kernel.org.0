Return-Path: <linux-arm-msm+bounces-55636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA11A9C87A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0228F17BBDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FE124DFE4;
	Fri, 25 Apr 2025 12:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/eR5EQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA38723F40F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582519; cv=none; b=fJB5VXG77FrYfZYBBChwOJpINup62XGmGeOwkTkw+MJNHo1oYnV60+SZ9TE3T4NaVvkP6VqRrEzIaQIschD7ZagQn1QFloPxtlByz7JvuFJ0nEuAmprMGqvIAKNrIELfQKAf/49JaFA+AY+PKb07aoK895qljVSzQlhL+AeIQpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582519; c=relaxed/simple;
	bh=/d6x59FsbXyfCoK8acmz8NJpqeM3LKYXyt+zeXsdhDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5R5KXgehFd7j0kL/cOITifA2A9H6/pdoU175tf+zilHq7fK/8On9fWKygHNLQXblBWpt1o48LUaYxnR0DIEN8V6KLWCtMvbegUpOo1b6t8hjkdn5tNIQLz9LT6nqh6L/QuQwyqrI+i4IP60AGne0gJIMMfop3nj/ZG4QIcuBFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/eR5EQw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso19841335e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745582516; x=1746187316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhE+Dyz1wOpvAJk2uuIrq2Trm7OKDV78hrVHrvsSei4=;
        b=h/eR5EQwrBpKHBbG2jYmiZkRDhXc4l2sQRuVH/nUccqHaN3OAotX7YOVqQZISnM6qh
         4nmy7B4Vlm8Z3BWTaABz7vstGhiPqYn6QE3QkfzVtTE3TSvCTSjDwA+Ldn39y7hUOcA+
         QgdqEkF5V4IIEdKRjPhe95iYvL4ubTEaXLdEOwm7KXb/byQIoF9JxKZI1Hq+X1WAe+CC
         zDX+mcWFwpRVSbalqUpKy6nShBGnOgt2+25+Hl+4IQ1PWVNhgxg0uFldRxqTMZoVBr6P
         sBZWsacjf7ijsk7QQ7KycghY4REvqD1NmpTUJSvflbh1CBBhb7jGBvb0gvSPXb2wgRD3
         djxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582516; x=1746187316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhE+Dyz1wOpvAJk2uuIrq2Trm7OKDV78hrVHrvsSei4=;
        b=kMi48C6EuOQBNp+4hGANiSNrxrZ5XX8fsxEXvr2fH5R6+QlDCo1wjr6f2ztzKGIOL4
         Fj1QKYaO4oXbyGrQThWs0HVFTUIaL/xA/CGD56G1mPVdLh1R2sm7fsqiKrqPZB1S3BMT
         sFmQV59B4p4SP6FVTDBQYyL6QbIh2Kr2DhsoP5WyhGFwXl5iPXJJQEVh9YQUorcBm0Gi
         KVJOdBYozPxudyeurJixNIQOuMEsOxNlsy4ElCu+yYwxdamktc1uTit7Y1D0UDWrtn6N
         a4y0RXoiDFlkMXi/Oc1LNU0Lnl/MjpXiMOniae9CJnXQXLxiL+d3/wvCoFzXBJC6J2k+
         JHZg==
X-Forwarded-Encrypted: i=1; AJvYcCXat5zxMDkx4Zlwpbzj/7zYiF5p3y99jfr1fGNLklfh20mwKD7cTsxB4FYPlwxcN6gDQ4jSnJX5S5NTtXZf@vger.kernel.org
X-Gm-Message-State: AOJu0YwF1WNXl8grfrRDWmCqno2y5rsa1cItLLk79gm9f4t4LO82igMd
	o49M6y3Vsm1PPhgSrwxGxXQJfaxzlIFjniLlpBJDHbButUym91/skPbQ2wvS0bc=
X-Gm-Gg: ASbGncsSa6n/ApNE1pEJQSoNxmunrBLFHCry+CeipwIGVRD0rDy8yE+9rTLUNtaXlTL
	sTbaur4nQrK1D6ef9+8VY8woKg69MvLHmabHqPH467zaTLp2gmAekGfVwvv1yep1i9y/OuFpMMS
	fU0Dw53fWuCg6PH/miuPeR0NqFuyCcrOIfIYz40LZ3322toMjexWbv5i2yDvcIWuptqK9/hPX6U
	DYLG2NnZJuUZC2XCBlMLGVdTDo9j9g/hRfxtHs9QOXqHyk0eZrR01g5N2/f/S8OfSlkFQyAwfZf
	8dhD+jdbcGYMc1sJHhjvGxl3E77HlJJUSP1vqCX1T+Rjly8TYdAeDPoVpa0MMdidfvX7FH6z78f
	Ue3fZsg==
X-Google-Smtp-Source: AGHT+IFHLlJzP5BL3V6sFN04q8JXr4Eh6yXMm48K9yC7I70ivFzicvWZ/rGjCxcg+f8noEGCsOnkoA==
X-Received: by 2002:a05:600c:1d20:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440a65e420bmr20732465e9.10.1745582515548;
        Fri, 25 Apr 2025 05:01:55 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530f6e6sm22648985e9.17.2025.04.25.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:01:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Apr 2025 13:01:51 +0100
Subject: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Fixup csiphy
 supply names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-1-2a3dd3a47a6a@linaro.org>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org>
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=/d6x59FsbXyfCoK8acmz8NJpqeM3LKYXyt+zeXsdhDs=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoC3mxgLk+ZrgfFS0o1d0z07eCsMd581/ipTLzk
 Zm4jsolLV2JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAt5sQAKCRAicTuzoY3I
 OswSEACBlHM2WhbARrwSwsLpzQiZfXgr/AMoIeiRZDfTZsdA3omq2r923t2zOQ+b1eAxDA9dF04
 XxLbX7JA7z/c9lRAn8lbFmsk73j6ifowg541sprVtVfEU8g8oRlnUIrz+wyDiVWTYtOs+71Jtxf
 URvQv3wHJv3PJQRmv380xH/bwWmmhqBY8xQiSpah2w1bvnzRo341HomJqWH3F4M0XUD6TQu4P5m
 vnC4r2Tq0aGS9pQ2CiRAhswl52qLfNhyG0OZ+0qvJ46/S9gXgsoNdtef5XhuJIWxH8FYRKPGJwp
 K5DibzQXKKeCBSRvpinQG6+MOxEEgkauFHLBw49Tx8DfY6lNIa4hMRaKU75Fy/XfGwlPbASfzLs
 bfdMAn7YCK/EmPoLC4WrgkudzzlhW9fWUbKp5ttjWDxF35h5OQG2QUr9YmYuWqlvrQlwC9MYl77
 WFK8gS+cTfODfdYxZDVH5LiK/9s/SCC8t0Cl3x1HeMCcXGJDaO6U+FG2CA9EFrMFSNjl1ERDTr4
 oAcGHd3QTY8AIhKwWC70V1b2+gP02OhVEvxhsqxt4p8Wkj5Xkqtisgi2h8stgGbZRudukhw0gmN
 rUEhHtkhYhb8GvSJC3q4WKxdCd1VlN8S26Ul/Nv/79ZKdI6eRXIjm0WGYyFFxVNrDLKVqgpyctf
 EspYC7I650RQLhw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Declare a CSIPHY regulator pair 0p8 and 1p2 for each CSIPHY.

Name the inputs based on the voltage so as to have a consistent naming of
these rails across SoCs and PCBs.

There are no upstream users of this yaml definition yet so this change is
safe to make.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 113565cf2a991a8dcbc20889090e177e8bcadaac..c1cc6b275cb2c630e262279f722ce4657cba096f 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -118,14 +118,6 @@ properties:
       - const: ife1
       - const: top
 
-  vdd-csiphy-0p8-supply:
-    description:
-      Phandle to a 0.8V regulator supply to a PHY.
-
-  vdd-csiphy-1p2-supply:
-    description:
-      Phandle to 1.8V regulator supply to a PHY.
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -157,6 +149,30 @@ properties:
               - clock-lanes
               - data-lanes
 
+  vdd-csiphy0-0p8-supply:
+      description: Phandle to a 0.8V regulator supply to csiphy0.
+
+  vdd-csiphy0-1p2-supply:
+      description: Phandle to a 1.2V regulator supply to csiphy0.
+
+  vdd-csiphy1-0p8-supply:
+      description: Phandle to a 0.8V regulator supply to csiphy1.
+
+  vdd-csiphy1-1p2-supply:
+      description: Phandle to a 1.2V regulator supply to csiphy1.
+
+  vdd-csiphy2-0p8-supply:
+      description: Phandle to a 0.8V regulator supply to csiphy2.
+
+  vdd-csiphy2-1p2-supply:
+      description: Phandle to a 1.2V regulator supply to csiphy2.
+
+  vdd-csiphy4-0p8-supply:
+      description: Phandle to a 0.8V regulator supply to csiphy4.
+
+  vdd-csiphy4-1p2-supply:
+      description: Phandle to a 1.2V regulator supply to csiphy4.
+
 required:
   - compatible
   - reg
@@ -170,10 +186,22 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
+anyOf:
+  - required:
+    - vdd-csiphy0-0p8-supply
+    - vdd-csiphy0-1p2-supply
+  - required:
+    - vdd-csiphy1-0p8-supply
+    - vdd-csiphy1-1p2-supply
+  - required:
+    - vdd-csiphy2-0p8-supply
+    - vdd-csiphy2-1p2-supply
+  - required:
+    - vdd-csiphy4-0p8-supply
+    - vdd-csiphy4-1p2-supply
+
 additionalProperties: false
 
 examples:
@@ -347,8 +375,8 @@ examples:
                                  "ife1",
                                  "top";
 
-            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
-            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
+            vdd-csiphy0-0p8-supply = <&csiphy_0p8_supply>;
+            vdd-csiphy0-1p2-supply = <&csiphy_1p2_supply>;
 
             ports {
                 #address-cells = <1>;

-- 
2.49.0


