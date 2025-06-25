Return-Path: <linux-arm-msm+bounces-62364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F20AE7C8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21921885C00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DE52E1741;
	Wed, 25 Jun 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PCzeICXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F06A2BE7AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842941; cv=none; b=VQxDGat5laCfH7y9IeIaZy10Xy3HOL61Le9joO0GCGFvDmP2sZf9WTptPGaLH6c80DGUcof/w83rystEmTWg6Nu7D/PdmJGmVEsVEYa3sWTzQKrOy7juW3ATV5GlkmxuHhF8IRffvFrt36vHA7Eku6tPjRPPSkPbS0yZ9ECGLdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842941; c=relaxed/simple;
	bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qeTX13u5HOyTMJMLmm/Qh/PR1b21TSZIVWKMvXegg473onezqKW/JbV1pTKZ+7ohQnnu5tkoXVMG1YTZsfDmzMvZnM2oue5Mow+mAgddCuiaXBgJdJ8R3fLL+VxxCpZtLk1/RVfEznpPLQ9kgRsYzGgaQeW0syTRayu/UOxmHJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PCzeICXX; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so1223661a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842936; x=1751447736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=PCzeICXX4Gs/5BHvtz853AISO9hYli06DkGKHq2QqKOv61QpTVnwShME/2lGgyvh8k
         8DBl7nJKzSY+DiwZbtfpnqCuF8+vmJUYoc+Tk68UKFoZXBIDJD0TA7jQCP3j+cTJ0iIX
         0PnI1NDo/C+Lzmnm6IpHOZk/pusqYOZ8PJs400CZuTRjHgT337BHlETLINv7AY803XuV
         lG5PYfILPGVcgwZv8rScdT86MR3+ah8YDbiKr+Szz8u9Urx9891Q1HJ0Jwye35rXZkuU
         m21AuF16AnIsCLeVF4X0lbsCr2dA4wraca0hemwkUPzETyRqY0oQNHtWt0dVTXzQufhu
         7s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842936; x=1751447736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/MltAVAkbR8k6TCTW4CyO6wlIYS6CBRLi/IFlrjf90=;
        b=DqVYTRy8PbjF+f8mG6lTRWXt6Eek/lkkkFYXhVOpDOlweFTL6/vjdBwFVwGJ+2vDgF
         z0EB8Kcb3OtDYlMavhXAeVEG37zI0k/sooz9gIZK1GD2hNS8jKoiYCX2CXixYF/dA4/Y
         qSLrR8QGAkWyI8NG4sNpxvAGV0eJHc+oir61NxWFTE51m+yK9iKuGMSGQmc2nHrWhOE3
         /lv1uKRM9Ux8x7ra+qwIwF1HH517pBsLsf+kU/4d6IKDKDdDbVmfurPETr878r20eHHp
         AXIR5qKCPHke4Oq5ZPVLkL91QlEpHm9qgH+FMfP2AIioBbU8fCLw+2sOfObb9eMDe2Q5
         gzOw==
X-Forwarded-Encrypted: i=1; AJvYcCXKcpIxe3jIIjhX1moobjvhBL2VKAcDhprutY5upCdsJ1KMNmSQ4FpQHlkwIpN5hrNMHOPjDrfcgqwLgjBI@vger.kernel.org
X-Gm-Message-State: AOJu0YzKuxGg4/k+6mLLLbrAuXZo+mOzP+kDLeyR7R7VZ+AUObLYDzjd
	flSkmRxngeE10x6MQpMNobwMhokXomE+VXZ/E8ygAoXwFiMO9X1H9nTXOXrunm7XLSo=
X-Gm-Gg: ASbGncvQ3U4lVBXQo2W2vIUMcet0cVHNj8Ex0lpCZPlfX+acKLLTzXnQQLoU5DD8N4a
	SaXZK5vA/tbzTiv/IcZkRs6QNeOLrv+EPz1AytoT7iIV76R0B0HneK5ADsppTuQLVNr9K/znnes
	1i5maVVccZnbNg+YoEAR/zMkeryl9NYq0+NwXKV3m/Pz1GCLavfnf++yg4bJhUL+lYhQo+mmD/u
	babPu6IN6LZHkovYcoXdQE5Xmxuyl0C/dBf2EcIUbQFdKC42MPtwwB0eOmq6KbgD3GCTtS6UtP5
	/u5pgv0nsMDywDOFBtAAmByCnZJqn+KudFkiDvRx3BgHrcIKhYh9oOEbB0+nE70viPPVtcagWpo
	nIFI4KRzE9jQPbYSrzDk5Ba4+4KLlorN2kU849BQ4q1w=
X-Google-Smtp-Source: AGHT+IF9u++G4l0yqsJLtsvs+w8gPMs4RjEP+Iv/tXabdEWFnaRqckW+YPQ4QXJZhjqWJkxHUjBkjg==
X-Received: by 2002:a17:907:6d1f:b0:ae0:7dbf:6e19 with SMTP id a640c23a62f3a-ae0c0622b58mr174950066b.1.1750842935810;
        Wed, 25 Jun 2025 02:15:35 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:15:25 +0200
Subject: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: document
 SM7635 ADSP & CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-remoteprocs-v1-2-730d6b5171ee@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=2202;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DDoOiVWP7KZImpai6u0PVHDpzkeoi2DbnaMeS2WpWmY=;
 b=xibYVZUWgwzKFSJe7A8AxltVP+8sJT1sYP1WmkuirM6sT1wSbkM5vTqbfSkopSM2X0o/hXZ6h
 SqItXDUK2LqCH2r60UbaTUmdvE74DOCCLEBSTypGeO3h+Yffy2uVxNY
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


