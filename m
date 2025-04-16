Return-Path: <linux-arm-msm+bounces-54493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177EA8B842
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B18E445EFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FDF24888A;
	Wed, 16 Apr 2025 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNFzkAlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDBD2475F7;
	Wed, 16 Apr 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805077; cv=none; b=BipREpcAkWqj5LCvayAKywYDKrSktZsjJCPZ8tr2jRi+bVp1tgjbSJXPeKJodDKJATZl5zkPcW1dIjHEKMw265FN0VdMdlIT1T9b9KTHaqfrCOyPhaPGiRaBeXP5y6IPpAF5B3QFwHaYBc4ArGJXEUUJTAb/f07CtCSp0jdnD9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805077; c=relaxed/simple;
	bh=c+DGbKzXmCKiFzw8vcHL7jqO7BNAP+exQmv/hCmlbRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QU2L9+7uKXcHUVR4xj4lpQF0VeyoGx4UURvr4vWzeiax9NfNVDqqH/+x94w95Tuoo4V+XrZkDPKidw1HV+0D07wlQLRmvJD+A13tdd9hJoZR/EdmW+dI5Q8KZkCpWhVegRfpYNuShpiM/+3aCrm81DvmVew9XfMZnb/IugMi1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNFzkAlr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224341bbc1dso62093545ad.3;
        Wed, 16 Apr 2025 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744805075; x=1745409875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM7x+ZBG1DXAyQZ90aa0DW8MY6nV37JS9LRikgJBlYM=;
        b=UNFzkAlrbFiSivPpYNesTR2h8O/J1rDRI/dD39YmkYBCzR6de7PQq8Q1qFPRgTResf
         jCySp0ANE/LT2WQSRA6E4XbEyxAObwwZtFdn7C7S9A+ToPHaDIix7Qu6yWscp6skpUMJ
         RtqZoyzFxKdiM30Tx39TkG81iQz1ls3tY7dPUyR1pVpCftuz0DPmcpV2HjF0ti6BcjQ4
         Jg/0FNtskzGZxcXAODDMkXoIKrm+VNl4UuNbENUKQYZdRbgKQ+p5ptNmd6T6NO2jipJ8
         exiqswRWQpF6nYFKW1HrP8I9uXJS7WCUt5AySzcrAEUS4AGoOve65FVTQ49tdI0KPB6a
         8ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805075; x=1745409875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM7x+ZBG1DXAyQZ90aa0DW8MY6nV37JS9LRikgJBlYM=;
        b=J36vi+jIIzS8QE1sdzE+rxJbzEq8V3SJBLrwWR1ystPrkkw2m5OMlXB2qe7YtBPfUD
         3m8jrs0nvSHG5AvuiRGr5oyeG97A9krZp/iSYXae0ylwV+SNH2ZyzToXsPfnlL08UNsq
         LDIFhrcf9JU6k/yBoK7D7xJ2mincIqV98/V7D7rSp9VstRb+ErZsKqX3RG64YemCEKs3
         tcLqKhm6iNO89i5Fdzeg2zSFMTkS64XfIgts5a1g4WnjrfYczzuS2ahcz2y0zSqrjNFQ
         ielFw8dotFllq1AE+sCXHM72in4ZEDNIp1hnOcTQJIOmIOnTAS8QN58+QJtMhpzVOGcr
         Wy8A==
X-Forwarded-Encrypted: i=1; AJvYcCUuxg9ePVxDwYRd+bitdzgNehvORnhnMxgJFr5dn2qi1XB4yHZmhvFH6e89QK4DVMelYXbovYv4mBUqyCbM@vger.kernel.org, AJvYcCXA68DTVIzvnlxckPj8VAAoQtLEnjbbIxKtzzTuiWJvtsorse4UZUaHkZ3MigOEwpWMK8GYE2P1zLYU@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLcGr0dSbrNeplEKXCJ6JLpivmAj9atG3RjDxVC10ruciN+ZM
	WS6vHIXEaseyNquHrZ6vLbtAOMXFbaeiiycxYDTvHyP2G8tplcqu
X-Gm-Gg: ASbGncurHdoE7XjIR6la3RxitSVHr52dUpKtViAoYfV5APmyg+e2TWFNGuEJVxr6hNS
	jJFb2jVu9lTXfRsyFmdBkwjWZcW3kJpJDm+OQEvCjrJTBIda5C9q2znGVtj9HYAYg97uuhiEh6c
	JX0quG7BfRDmpbQ/8LsKFzWaWxwRNNEcUuHsKJhRJnqpO9zPd5i/f5nM4mIuWhVW09NRLcoJEYl
	FQwkjofIozHcc0ynTEvr9/hmczp/W7rUqK4MZqATOKHC0RoRVH8OxwGVNAQxWkNKR2Rh5VTF4mq
	F46HKBWeWq8vtT51Wg5dvPOkScsJexk+kEJiVf0=
X-Google-Smtp-Source: AGHT+IGjmNkai2OqNwA8/dUWOCbwak6evON16LRF36TpbLv/gFaJvSGvFqbQl/bmCAtp4AcK/zNx+A==
X-Received: by 2002:a17:903:1a44:b0:223:325c:89f6 with SMTP id d9443c01a7336-22c358c2862mr29539835ad.10.1744805075390;
        Wed, 16 Apr 2025 05:04:35 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33febfb3sm12033385ad.259.2025.04.16.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:04:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,snps-eusb2-repeater: Add more tuning overrides
Date: Wed, 16 Apr 2025 20:02:00 +0800
Message-ID: <20250416120201.244133-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416120201.244133-1-mitltlatltl@gmail.com>
References: <20250416120201.244133-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In downstream tree, many registers need to be overridden, it varies
from devices and platforms, not only HS trasmit amplitude(0x51),
HS disconnect threshold(0x53), Tx pre-emphasis tuning(0x57). And
some devices require different overrides for different dr_mode. So
add property entries for host mode, original entries will be used
for device mode.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../phy/qcom,snps-eusb2-repeater.yaml         | 41 +++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index d16a543a7..d0f5e770d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -36,25 +36,60 @@ properties:
 
   qcom,tune-usb2-disc-thres:
     $ref: /schemas/types.yaml#/definitions/uint8
-    description: High-Speed disconnect threshold
+    description: High-Speed disconnect threshold for device mode
     minimum: 0
     maximum: 7
     default: 0
 
   qcom,tune-usb2-amplitude:
     $ref: /schemas/types.yaml#/definitions/uint8
-    description: High-Speed transmit amplitude
+    description: High-Speed transmit amplitude for device mode
     minimum: 0
     maximum: 15
     default: 8
 
   qcom,tune-usb2-preem:
     $ref: /schemas/types.yaml#/definitions/uint8
-    description: High-Speed TX pre-emphasis tuning
+    description: High-Speed TX pre-emphasis tuning for device mode
     minimum: 0
     maximum: 7
     default: 5
 
+  qcom,tune-usb2-squelch:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Squelch detection threshold tuning for device mode
+    minimum: 0
+    maximum: 7
+    default: 3
+
+  qcom,tune-usb2-disc-thres-host:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed disconnect threshold for host mode
+    minimum: 0
+    maximum: 7
+    default: 0
+
+  qcom,tune-usb2-amplitude-host:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed transmit amplitude for host mode
+    minimum: 0
+    maximum: 15
+    default: 8
+
+  qcom,tune-usb2-preem-host:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: High-Speed TX pre-emphasis tuning for host mode
+    minimum: 0
+    maximum: 7
+    default: 5
+
+  qcom,tune-usb2-squelch-host:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Squelch detection threshold tuning for host mode
+    minimum: 0
+    maximum: 7
+    default: 3
+
 required:
   - compatible
   - reg
-- 
2.49.0


