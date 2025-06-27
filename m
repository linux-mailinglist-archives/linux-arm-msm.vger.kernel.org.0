Return-Path: <linux-arm-msm+bounces-62725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF069AEAF51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 08:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 943C53ACB0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 06:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAF121CC61;
	Fri, 27 Jun 2025 06:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GLZfuK6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC0821B9D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007357; cv=none; b=oqcS4tbl+JQxpIWzB7cv1Y0SXw5iuUqboJO/EFidMxckhs8nq0DVORPi84qh430iJ9f0I0B7n3rj6FNplchHqUSoD0J30pvk4QYtoexeja+TL76MAwMus1IoQyIRsqjlDcxLqwyoBnB+VW0QXjmbr/5//Y2wkJ2k3pcpzFWwfYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007357; c=relaxed/simple;
	bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SzwIYTfA1rNfbHpgPW0pZxff+ZijiGYEfcV3iyx+LFepvxoyefSJ/oRPOHZrqy/8PubjiBa3+UCJ2oglxcem3hO5GBnja5siDkmx4TcRwHk8pDMS+bWqmteCgmQ2ra556ReLe5LKx82imThJhJj9RECD3m36VU7H5cOhGiiZoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GLZfuK6V; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c01b983b6so3470496a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751007354; x=1751612154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=GLZfuK6V3V5tz6CVFInk0eOZloK9XZQSBnb0/SH5mbkzFmkdZf9pynWH1F3PALUyoZ
         FyWOeDp7eNhlZa62R4b+OsPIHFHaqFJAtpd7URptt/9SqRcODfiZN/QEkAtO2GCRJcpV
         tolAA7WenIS9+d/KORxpyix1qbRT+ma1vJzUey9dKf1eILxI/CtqFVhN6AiWGhFJx/CH
         O9ZxPFvDY9+CPPZBGC2Yt1D2HnGEkgF9m5xgRkhr23qxeUrE/YSy/IIuDEIIMKcaRUuO
         xaooTtjBmEXaqiuSMNFa8Qm3R7J4OQ2jw4NGpfxU06iX07IXPIXNAT4cV4LKZDNMJI/s
         0VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007354; x=1751612154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=vUOAZ023OIGPaDMnipCG756H1LEj7th7ScpzeB5buCQB/XVkmFd6eJRQ3Zavz7h88N
         pIfHjNcLQF3CBMHBo7woi01FKxq6yVzJzBE0sf315DgMTtZ/s5DA8uD95bB6vkNGeI7u
         6lgoeOQ6Rx8aduUIhsWaq5KOT4GdKPTGu+PtrViTLOEKoigyVwFqKYOURaA+2hgHXPgl
         W36AHlwUqys2+Vju3mXS4vl/nImqu8jLWTb2M8fCeSryBto+E/m1SEdX+2Bw6cflE+sv
         U9EAW2+0dIiB17JWxaKAHDa64QkiohMFTMx9QyrGSBQcEGsPvDTV8PtFDFAI2/tuGOFZ
         Kfzw==
X-Forwarded-Encrypted: i=1; AJvYcCULktte3mSh0qKj0l3e65eA3BotgA4ZdV1b0qnIscjdr4Kv2dK5ye05k+AtptCPIPpXerznBAxX69l6B8UR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/lavSi55JKH/uqlfDdLfRrdYyzYPkUAG8z7ThJ0CILZGxgo7L
	Scdg/h0hIjYhMTpE4r0yeBZx/ZF0T4RkPH4NgWXnRqSK9XU3JO2+xWCMolw1G3Y7EWY=
X-Gm-Gg: ASbGncucvfa/hHmIboyg0B6wy+ekED/InHgwabqoB9u2r21hVq9oFW1JL4/7zQ/5oqe
	gyGUyV+prHznejmDRFJuhgiVHVsN23JbFO0GiLnTPacJ6qdgpqwUmJCmPhJLbQ18WICrG6GLUeZ
	z8a6xcNN258v3XHlS56Ug7kqSBmYxtt2T6tLDxnQJE/E10/F7j8eAlr981sh/KLs9o5ZVMoGHIy
	QUmeSNc2JDB1cGNnyYLs3o+tQrWWjjWHWNXJl0GbX/OzYKwZl146+RSZXTVB69xjnX4Tn3+FdTp
	6T9pYo2TBORHRnZSJ+nJpbMQuqjZoFIkHGfYwhn4+EYo3+jZOCk7590SdXLlSPWh7/8sB0QPRxa
	quo8O/py5KLgM5bFAafwGxgLVi3p4OAYf
X-Google-Smtp-Source: AGHT+IHKtWGMNxOrAU21NmeiXRPZB0y6yrZYF854D8KsmMxJtVjeumi6eM7NgTAZzCVzhns3sClWlQ==
X-Received: by 2002:a05:6402:2553:b0:607:35d:9fb4 with SMTP id 4fb4d7f45d1cf-60c88f6aab0mr1436749a12.15.1751007353652;
        Thu, 26 Jun 2025 23:55:53 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290ffb4sm1019451a12.36.2025.06.26.23.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:55:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Jun 2025 08:55:42 +0200
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8350-pas: document
 SM7635 MPSS & WPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm7635-remoteprocs-v2-1-0fa518f8bf6d@fairphone.com>
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
In-Reply-To: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751007352; l=1636;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
 b=+rgwx4+CVNDxQfWKsxQ/6EJvYCG7U+5yECkT1jRsSqNcL+okjTgoYfxH+RJM0aKR2ixLnV+ik
 rx2coSiKB5RAtJbtD4m/x8fwfN334DGfnb7FVqbcQBuUVrx/JW1t81B
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the MPSS & WPSS remoteprocs on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sm8350-pas.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 6d09823153fc8331f04d4657d9acba718533cce6..9ffddafea33739d325fd4c469642bff461a933b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -18,6 +18,8 @@ properties:
     oneOf:
       - enum:
           - qcom,sar2130p-adsp-pas
+          - qcom,sm7635-mpss-pas
+          - qcom,sm7635-wpss-pas
           - qcom,sm8350-adsp-pas
           - qcom,sm8350-cdsp-pas
           - qcom,sm8350-slpi-pas
@@ -91,6 +93,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sm7635-mpss-pas
             - qcom,sm8350-mpss-pas
             - qcom,sm8450-mpss-pas
     then:
@@ -142,6 +145,22 @@ allOf:
             - const: cx
             - const: mxc
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-wpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
 unevaluatedProperties: false
 
 examples:

-- 
2.50.0


