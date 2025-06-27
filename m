Return-Path: <linux-arm-msm+bounces-62727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA2AEAF5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 08:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE2D43B2C41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 06:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9037D224AE0;
	Fri, 27 Jun 2025 06:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YhCm067e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72021B9F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007360; cv=none; b=X3q3Pn47bwTsz2YJU5XeCc+r1UWnTbD9oBBOJDqzWKrv0qWxiRSw1nG4GeUkMgS838a3mFMLs4djZRbyXQiROyBZ2KXssfS47crgtoX7CYXKmloUCvQ6mGvWBmp5JOPoYRSi+6ujjtfFghJ1YjE4sCf3gfu4HapkodUR5dLcWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007360; c=relaxed/simple;
	bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssQhM0zfut8QepBD2579Gf2ExUtdnj/IJovKZ0RkK4RlGhY4Cj8xhJ90HA8ceUXwdxSZspdZnvAF0scAPS8JPhOev9ti/lcgCKaLBdal39axet+ugjJFktJDLI/VUvA8YGp+xv8hBgtNUByWHHVJ6vbWqj5ht/DXIb+xsOgmHwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YhCm067e; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso2886057a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751007354; x=1751612154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=YhCm067eU/raIk9FCTXkBe80jv60EoqO2R7/Bh1awKzhDZeMEvST8FwyHi3kJ1Jc+h
         87WbbKiT06isBplt6J43Iuh7IUZ7n3W09RQJ/Olhbkfw8c8SuFaV5DJGsnwMDPnTThj3
         C5nFiqC6oVS8MxY2n/3eAEUmViA5Pwf8aIhyO6P60Jnx75hX7iv+BoT9Cj+WcVr95DjK
         PRodeoOgBHWhTnB8CNcUXiopJA/mzXMwv3xSCF3IH8tiooVV0nDgjPxaoWERCWKvEA8K
         WA3yG03gsBhmbMyO8ZWVKam9IbOz30t+hZHrpyBAtFIQyg/2dLBmV6KysRp0F/CEQkgy
         gTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007354; x=1751612154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=ZIMS4qiv3xPWel8Gk8dp71kPgpoyuIp7Mmi4RU8xQFEKnjebWEe/obYbpToJzNbOXl
         Mi0Y2UsPjEtMf9sgcW8inwjwSbdFH6rHH9l2NdZwtHId+kF2xSppzhsAhHHiTiB4As8n
         Cpk0Xi2a0ZosyNDohkD/tVpBHyeMTFYZboVZ+eD00miqJaCSBdHK7y0hF0qAC+IpFQRP
         brkkJwiNP9VHSWf4mEErjl3xsB+/xN4xdi8Fo0vGG2CTTq1yo8QYCf8MB9nczWHlrFIf
         TioVTlTcmWAuwevTzf0fCr2g18HEA/K5SwQ+CXLd669cz/wa/3nkIEhnhsC5zfxLauAU
         lE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdzg1uQ5qHG4O5vf4L8yLRjfHkvnAtU6vG2ErD/Dy1myzzDqqaJeSBnFjHF/DFkMgsfyqJoQpePqbQyabJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr7RDu8L2ihKu75iAPHEYVjlMWDY9uFv+6KFu8XuaLawd+4IFU
	yImSXoZ7lezAmiVG9U+navN8Qh37IeIMnjhalPTAODQUfxQsl5VAltS3ZgqYa0fUeJE=
X-Gm-Gg: ASbGncvxl+CO/pDk47JI4It0Vqnh09250D9oOsNpP2RoxsJEFThw1BKc82okUbP6rlN
	U19epo/sh6RmlxVu9YgqgIRqM0SdtJicUBqClfrZ7iF5pvQvxI27TimqoKD2g0nen+5Zy9BCKoN
	YQ0Vpllu1pzpxaWtAhruIL/tB+6lOJCvtxIWsOi59gk5T5PskEepfwb+FD7aJP9rzH1LGH7RZuj
	0oYCWeYhFUKxXPV6hwWo5+iB+QuSaqaHxuzqbnaAjFqCdvTiNI9Aa5f714Apd2Xg72RprPnzTMK
	LBsv8aXjmTLI6AJ7RWAwusYcAQucsW0abjZlAxGkM0oT6VqqGGn1r94m31H0kcn284E/PCOiCZ+
	LeXMSwPf3VsRIrOy3DNA9HFPmfmsFerMW
X-Google-Smtp-Source: AGHT+IEPOegvS5x8uAfxLou6BqkH4jPPap2DV8GxhIYNv+0+kp7YUsrnViWajQTwwmSuckNTkr/hcA==
X-Received: by 2002:a17:906:478f:b0:ade:c643:62ce with SMTP id a640c23a62f3a-ae35016e6d6mr183382166b.56.1751007354155;
        Thu, 26 Jun 2025 23:55:54 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290ffb4sm1019451a12.36.2025.06.26.23.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:55:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Jun 2025 08:55:43 +0200
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: document
 SM7635 ADSP & CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm7635-remoteprocs-v2-2-0fa518f8bf6d@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751007352; l=2202;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
 b=rEYZ0sl+6FbVHfD363nhKpPvyLoXc0/GrxUiNcWrTXEXL1tlkyPbvtPFub8YAxVWHHcqZLevW
 927VTS6GeQaCNRCaSA4ODimaVc+E6Wr2QnkQZm30Y84tyDwRgj0VKGy
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the ADSP & CDSP remoteprocs on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf48217a0799ab4e4318026d8b93c3c995..44cc329be5067ab6cbaa0a467669cb3f55c7e714 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,8 @@ properties:
     oneOf:
       - enum:
           - qcom,sdx75-mpss-pas
+          - qcom,sm7635-adsp-pas
+          - qcom,sm7635-cdsp-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -165,6 +167,24 @@ allOf:
           minItems: 5
           maxItems: 5
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-adsp-pas
+            - qcom,sm7635-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+          maxItems: 6
+        interrupt-names:
+          minItems: 6
+          maxItems: 6
+        memory-region:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -185,6 +205,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7635-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,sm8750-adsp-pas
@@ -239,6 +260,22 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-cdsp-pas
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


