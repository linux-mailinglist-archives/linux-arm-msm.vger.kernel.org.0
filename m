Return-Path: <linux-arm-msm+bounces-48936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A9A3FA7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49719188F1B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65A01E7C2D;
	Fri, 21 Feb 2025 16:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fLRJQsPv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3CD1E8850
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153790; cv=none; b=YuvZzWSNpP8ImfA3i1oCuVuBp+E14MT0ImuB8kDDqQ75vHhsvnJClHvSflj389GOLZ1kmXqflTtltXz5OfgC3T0IGMa3vWdI6IoiZky3fGUZLoNobYCM02jBc7a+yXx6VVIKbBkO+VFTUqYg1z8pdrssdMEztR6OM8n3RyKAZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153790; c=relaxed/simple;
	bh=RYYrqjZBBPZWi7VA/WRn8140pmz5H68xLv5MzgliR78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AUEO66OKLO+eyQhEuGHYU9lf95fZRzk3atlUZkKa4Pl/1Q2ScKvhJUURtm6xnY6xvItLW7X561q7jkkpdgjYT+72AP6tHoEfVG7s+ksC8GLiwV3s7PXzxjoiIAl96Mm4fWZ2IzvDiNbWYMNJuHwxhvb2m3gs4eosTF8y4i52iJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fLRJQsPv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7098af6fdso35218166b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153787; x=1740758587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iecpj9KIMrY3zBOzgwFtaRTFMVnp7wDD9F9a7Nu1whg=;
        b=fLRJQsPvpsPxK9IVBT0WhA9wHoBXOW/bAFqOatLe49WYbn3T0q3mXQ1mbjBlzjLPB3
         1q7Ku3syMUVBONjEc9eMXf+jmv3CmZGIs/129+UcXjqmBksyno0kWJ8UhevZ+BpuqpcB
         rvGtwh6nRezkwFMoejBD4aT4iVkoGQUISQ+6eVavVS1EkpXLhSYq6UTb4M1hQc3N8W3I
         5U873zWJ20Fz6Y0ANLaj0XsPVr3q7m+A1wX84HEypPIOZd6o8XtbRmq6C4ll8GCoG7ZJ
         CIYtDzum4LJ2/9vt0Yf4qCqQSnKg9PO+e++YKWuGDuNFbFUoyPTM9jPw9b/Y/XJdimjZ
         f8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153787; x=1740758587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iecpj9KIMrY3zBOzgwFtaRTFMVnp7wDD9F9a7Nu1whg=;
        b=mrOIlC6dwKzpcIJB/s+/zNg1s0r4rCg543bZt64HM9TElcHG3BSQxQ6hYrzXtAPsKl
         ZwVGOs9U6dBKXhgZ5nGxU31+qxIbVie8UVD21hzy31l66imDX54nmrvLYnmZvRV4Nog5
         IO6RVtltnkBf+2aSwjxiRJDzWodwE6CHr0ZtJlKKn0fnL/mIUNMyWjHO8nmNktgbKSK8
         kLpgptcX8TiWdbOdRbypRXC3qItICCD5dxyEGT+s5yrfzLYOjhCvZ9ncm6HUurinul4/
         EYWHGvWFh+J560DbTI2ZYsy0bLWq8YM3qwsY8ZcT+3ZxO0ukR6ivgPtsIUG1m6EtaFS+
         Xo1g==
X-Forwarded-Encrypted: i=1; AJvYcCVo5pYoM7t121f1o3OmaJ7iPj4XXwmociWX4OX4D00oxP29Zx4l1iWojEDIrapvA7Sqq4ftooibjqzhv6iZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwoxIY6rRi5cekG3X+9Si2yN5UhAV2HhxkqYmaZy1b8nz2lusOB
	8Je3awm82ZWbFmyl3l2xVBgXJ4htmLuVkz7IBXKsGMJR8NtFJM2ZLjbVK2wBxxM=
X-Gm-Gg: ASbGncv8VPYYPIpyU527yLjgyGz0jGgx4Q9AMAhY9PmRyvsTJAneoqWbn6yCjsUGEpZ
	pROAY7q07LqGnnb3RuF+1sm7Bgsaqn7mIDau2dnLs0r7GCmEPg1lzVUi1TmDwnCGVdyP7Us2PLd
	7zXJZGTpiLDtgE+MxUuUv3UuXN9PYuS+VcPG0M6a7Pkeu9WWAVwrXDlm+eAujm+I4gaodvborZk
	1KbB0SuC0Z9EYfSCvOJUwdzQNiaPFsl2oRbb++XRI5yJDvEDa9ZxVEE1j5JpJnZ3nJdzbEzP7Zk
	lYoMqpkNc4hfcZuI0kRO3osBPEOfWNVRuzR0QIeUfB+yj2v2tFBOdj3pyOE4yXJzOzE1PCN05do
	=
X-Google-Smtp-Source: AGHT+IFD94Z2C6E/AhuO+19C1vGdBFuuX7tNp0Xx3W8Vs2QPQWhGEEzUJ2reXTaWktyO+VoDRaxiJA==
X-Received: by 2002:a17:907:9722:b0:ab6:d3b6:d825 with SMTP id a640c23a62f3a-abc09a578efmr125277166b.6.1740153785316;
        Fri, 21 Feb 2025 08:03:05 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb98640619sm1040782766b.54.2025.02.21.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:03:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RFC v2 1/2] dt-bindings: remoteproc: Add SM8750 MPSS
Date: Fri, 21 Feb 2025 17:02:59 +0100
Message-ID: <20250221160300.160404-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add remote processor PAS loader for SM8750 MPSS (modem).  Device looks
fully compatible with SM8650, however it lacks fifth memory region for
Qlink Logging, according to downstream sources.  This is a bit tricky,
because updated downstream sources for newer downstream release dropped
that fifth memory region as well.

There might be other differences against SM8650, because the modem
currently crashes after starting.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
Split from previous MPSS+CDSP:
https://lore.kernel.org/all/20250220154132.199358-1-krzysztof.kozlowski@linaro.org/

Retain the Ack - no changes to the binding itself.
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 8bfded3c66ef..2dd479cf4821 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm8650-adsp-pas
           - qcom,sm8650-cdsp-pas
           - qcom,sm8650-mpss-pas
+          - qcom,sm8750-mpss-pas
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
@@ -164,6 +165,21 @@ allOf:
           minItems: 5
           maxItems: 5
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8750-mpss-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+        memory-region:
+          minItems: 4
+          maxItems: 4
+
   - if:
       properties:
         compatible:
@@ -191,6 +207,7 @@ allOf:
             - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas
+            - qcom,sm8750-mpss-pas
     then:
       properties:
         power-domains:
-- 
2.43.0


