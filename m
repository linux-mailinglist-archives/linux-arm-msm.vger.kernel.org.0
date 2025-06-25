Return-Path: <linux-arm-msm+bounces-62362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8516AE7C80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654B31C21A3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BA12BEFF9;
	Wed, 25 Jun 2025 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5ZsAuNk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E01285CB5
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842939; cv=none; b=Z0Qh5UaTumAsAMX+2jS8vctEb3gX6GdKrKUAuB8KnpPFXP5v8Vq4vsyw1HiYSOwmUUKBYFGpWegDjycaT1qr42N/NnN0UXd+bBZm9lE9fCu4RUGAe8VA+CDyk08uoh+CWPtSz9K+o2Jm8L7NTqilBwNpISBccrmYReS1i52CCUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842939; c=relaxed/simple;
	bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhtI7w5HdChkKjWWkuzThPBCTkbpn65erUfeP4vsA5GsEJU6wZZR8jmNUyNbcT+0BNXuDfpBJw/jlKvUtoszZRGtaLYzunWypVJSGMkYj1vWMetLfQR1yXAJg6gFUXXzB/+LIrnpSQ6AJlAavR0zsVobEju1B+gcbIkwrrGEF88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5ZsAuNk5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so10033210a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842935; x=1751447735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=5ZsAuNk5flxRjdA5DeVAMW2lh6xoxyR4ixDJYAEy8F/NT5a8ALKjRLOo9NDnhNYsFu
         WQ+tvUOHTBAXPO9bZAkzITnHnlSYaX2SEeDqHixbWs8xR1tZuUDtucmdQ2bcrF58ct+7
         d9tLQrC5xGdG2kJzAF6C4diHWbV4lAdpbk1DdGLmoyuUaNX/lONPPzalZFMYLDWoOXtg
         9HfeE3tr4jH+eufqg0QhSAuQQrMMiZJyRJ3uz3e86hZbeb+oQouZ3F0V1Pid0KQrxF1S
         l3j9tqfLEdKQ7QFspmPyuqrhVvroIB9+zTeSqL3gbHPaKJmVJxQ6VJPWORvzMSgytHCD
         6R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842935; x=1751447735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=lSCUnot4L+hNRXjnZqykTEbzVy/qjaoiCPZ3qYWVKyNoFsED8BGMApIu8fGA1RypEC
         KnRL9aeOicXuUpXhS7f/U051jZHOxE78xPJK8m5FNU2XXPnr5wXEbkriEiGAeuahULiy
         DVckB/LR0uY0ZeaPdOyLa0CXHoDf4eI2P/EEbLkOjznAyxuq5yS0TbhCFM9TDEs04Fka
         r5kcL2IhjrIrSNEWhb5zZrMsD8I/dHbcwQbZ2L+EIcGoYsdec2szVT5FgWn5J1ajK4rg
         swirNAJ1ZZYHJRjsFAJHebsS730gUWxxFJfOP4KRr6ZlHI6D0R6QwCfRAhMcacRjNZYd
         e+8g==
X-Forwarded-Encrypted: i=1; AJvYcCXPNV/N8bZZK/YoXmlP4etbZU/OkJcyK6T2sqYSXPzCK0N8z80sSRAXmS0W7x294nTGUyPyAabMxNMq+Cbp@vger.kernel.org
X-Gm-Message-State: AOJu0YxzI2nOjyXBUk1ulKUwiciNloPXLq+R32chRBL1zM4im3Yrnsfg
	XafM14YlmizWzltjCAwzprO5Vfy8moXkZi3j9nlS7hy26iVgQvu5lBhr777QiFRH3Mo=
X-Gm-Gg: ASbGncuU5pOY56xWXcVekPPfk6iHKpb7HiQXy1WdXigBaIKqIq2Ds4dv2H8vU1UCYs/
	6SapKbAjUvEfN0erGu0LaQ26npI3U6+wJ9JrSkWq11MN/mIF6+IERncuodBtFSD1VRT2QbFhBKk
	lr6Youk+3+Q0FeiR9vIkuYE2c36+u/8EFKZSgQF4AyNnLtRyUwGmuPOxecM/8SEUk8r0Ujgn+qf
	kK2iI2y/QFi1owmnStR5ujnMb7IbmYcKVWmySiEWT/AY0QZe2VXdR1T9juMpWlf/96VKTbbxFpw
	IvCJ7b8m1e8ypVNvtIbR/PdCaUq5VnGf72XvYyrMOhgV7VlqZtURORZQWubUOgEoByxFn/uG3e2
	NdHr2PGtpV/oboBOPM2z/JuwPfIxggFV7
X-Google-Smtp-Source: AGHT+IEdvnMggPRjXeNXk9UrWAy82iX/E3YmgkRFIIX7Dwn9s76Z1yNwQakPIdmgVTzFWVP0kMULvQ==
X-Received: by 2002:a17:907:3990:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ae0be9c0a0cmr234927566b.37.1750842934951;
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:15:24 +0200
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,sm8350-pas: document
 SM7635 MPSS & WPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-remoteprocs-v1-1-730d6b5171ee@fairphone.com>
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=1636;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
 b=lwVYnYjT3ta7F4XNDWGffuCCAndUwPpyI3CUun3yyQm2dg0KAa/k0Y0gEn/TWAaSv+QSMoFWB
 eFt1xh6vBvcBISUroSF2a6djQuaV3ag4qJEUIuIVNlkRGdIIsoyqUC5
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


