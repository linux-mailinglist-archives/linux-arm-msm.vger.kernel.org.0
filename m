Return-Path: <linux-arm-msm+bounces-89406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C12D320A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46FEC315FA5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D7B2222CC;
	Fri, 16 Jan 2026 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="whdr5xjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438802690C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570745; cv=none; b=K+IUdYf8MLC1gy+0eslekp/uh661Z43GJ9zkyNqMjrvdjHOg0p/mtYbbLBbL05XNLEnoua4lbuliWuDYZTOaRneesJQSaZ6PV0Uv3d7dWkFV31C7U1DXDzMNGdPVjLSnYP7qhd5le47a5G9aqV8QgAfnUt6Pjh4kloSq8Q6yasE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570745; c=relaxed/simple;
	bh=74xQUaywxzeebI3p/AKN6vOvKb6pTQmwzWbQ8IBCY4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAVuOVyOvz8C4RZJ+g9kRXiIxTUAhj8piqcHvzWcskg+buSeBROC/LqyiSOr4fF1bbrLGJEXzGtS8/MRBZ0KT2IhL3osBNUcCogHBOG6zitY2A/u82ldhKGtaghahFaq+2rT/SC4r2FWTyMVFA7xcawdBlZryGKpxrhWhDTeoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=whdr5xjG; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso3177509a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768570742; x=1769175542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8zv40JK1XZcjIozgFMQWPRZtDjY+q87cahOipxhXqc=;
        b=whdr5xjGPAr4xGQWjzO6+5Xn7vHN2ilIZ3WAZSbBpiEBuhtq9jz+0Llr6PwiwP4bPl
         PJ5iH8SIPv1AEttVnfZn8ltO5svkD9irbu4sP5h8o5WtAGOODJ4yqur8qc3S5lPrO2XZ
         Cj/16udoG0q/YGt4r2QO3YhH8nky7usssrcTfHloRNHYctO9GwV9rBV0QjQ434MkN3qP
         Y7Vzl0Y3OGhFl2oLhgfdRgICk+axeU2fmt0aL1XTt5piN0yrQeVDIJ/AgXscHqrR+SD3
         hLIAkOsgO5hpUX5HaZpTe/YIxVVY/LOGNPJqM4MIZMeTEWcWdY1kcOaS0aNgN1XjOhlg
         o+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570742; x=1769175542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8zv40JK1XZcjIozgFMQWPRZtDjY+q87cahOipxhXqc=;
        b=FYBR2DTisjLWQXmSVGAcaehOuio7FWv0wAUDbA2QzZGGhGr13m2o/YBrM9uxBBth9o
         gqI9amXWDdF+so2o3mflE295M/IMJaOcDZfiXDIoU5rscb7LbfTxyiHh0Zt2NfzQEaBO
         987koveU87xVIt6KPpR85RHKeTwkf7YNmnVf6Wc1FVQeXl2bW6HiARq6yCFV8XNli1de
         WC5pafwOt61/8hqQoB3TOCwG5zsov9ZskcxQ0RBd69bMTV+CBR+Zdd6RfkPzYcFFp08n
         ESXth46H7llu4KjdCsVsfnwQ1kF691QXIK0QWjYvdtJAH1s9flPxeumJK1YzAmoIThZJ
         YFsw==
X-Forwarded-Encrypted: i=1; AJvYcCVRE+MgwIYmBfWJXbCMGCEkNyYTT/N6+iT+pdx/PDEczr0cNpogO/ZDtRkKjGNvBU/2bzV9brUc9aPvEkRY@vger.kernel.org
X-Gm-Message-State: AOJu0YxPFig30NnLT9gLVbLEEWjSV7ustpsxV0rhCjtaFa4AftfTi2Ar
	uxR/oaQqUMZ46NFu1X0LWj9Pz1+6r6W3JgOqMn0Ahi2/iTYkDENxq7TIf7EdfSpVuvE=
X-Gm-Gg: AY/fxX6wf9YXU2N/tbYOU/CvZgpvoeAKNJarVXvLM+gw4PQ1CQFl5WqLNQ8ZLYUIjYX
	UP33rMVUJwnFrG7qY0Ck5gkZ8/fGvM1nUZS3DJ2JBZ9zK0EsOoz72Fib+LYU9Fr23tDkNjGDgF0
	pTw/5BqYG44uyit6rfZoT7e+9bpBjv6ns56c4nO1G9gxuNvWYcgpy1C/X+XKeo2zGqUuleDk5Sv
	pELilmrRKO9xODNdvFkyW4GcuS0s8/TrWVSGS3s3UiAtj4oaao4qcYGPdb/jruRPqkMuffbxzbq
	BWA7P7Xgp83ajavn5KS3NisHjQCg3GJrFXK1DeghB4fFjWEXwZ6XlQO1cRU9Tl4FxZHtIrFJwVT
	KV22KXAd1B08Mo6no9DekdRedp2mhR8eGuTr3oFG/4POD/Iy2H+/MHTcCdbjFqX1qNkVmLt+atC
	E8RJhvS0tkKKl7h6v8+bDGILIEsWywooPMN3RxVB8aIzcq7LNk8IvU8yflwasXDeM7
X-Received: by 2002:a05:6402:2691:b0:653:9cd7:2003 with SMTP id 4fb4d7f45d1cf-65452bcc0c3mr2165991a12.24.1768570741805;
        Fri, 16 Jan 2026 05:39:01 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8b7fsm2495528a12.27.2026.01.16.05.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:39:01 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:38:56 +0100
Subject: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
In-Reply-To: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768570739; l=1279;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=74xQUaywxzeebI3p/AKN6vOvKb6pTQmwzWbQ8IBCY4s=;
 b=8ik9vEwbTmvcrvG32NYH2EN1MhNw4//P9Jd+czHCtEtrqLHOGMqyBC/ZV/QD9GSLNvH4R7URP
 trRK9NQutJnAMLsQlLa+UqGe5SKSbZShdm0MRdt/xRrUeziMBoeH+ZJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add Milos compatible for the CAMSS CCI interfaces.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aec..c57d81258fba 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,kaanapali-cci
+              - qcom,milos-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -263,6 +264,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.52.0


