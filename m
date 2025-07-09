Return-Path: <linux-arm-msm+bounces-64270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA896AFECD3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99FEF1C81120
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC242E7640;
	Wed,  9 Jul 2025 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="S2X+5WHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7223770D
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072928; cv=none; b=IucJ7ysFhhQAcLXFJsenxzKM55n5Gv70ouukdXhC7islHASyl5lapn0Mi437cf0r4OaYWOX0423TgG9mMFU1kDjX2kk32eUcNoDnJShCjCmFz0EqNQK5PFVbhEBSYsyM3hSc6QayZ2ig0tTD3o7ul23mrP210j8NL4idTNgXQ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072928; c=relaxed/simple;
	bh=NXnGscA8zt8gzxiNiTYIUpV9OfGd5HRPGvlVvXT/iJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNu+f9kT0wuWwLWHq8i3fxxT0tb9FoBsjD5F7mkD911lAudFZnn0ZW2KrLFZYxS3E8v1DspEh5JZUMZdqwP1lJM2bWkQD59O2iZvG9nI7sUMM4QXyK+HgTtvBxdNSrJHX4XxE7E0FiMH+acVLixlufxtB2yak3uGjHQ5ul7fjVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=S2X+5WHk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb5ec407b1so987330466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752072925; x=1752677725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3A3hRQjja7NMerwUSuHLGaJ14/ejKpqQyPzO1AUrp8=;
        b=S2X+5WHkxvCTkI8GCnIhZ6XJc4CH/JVvODRxquvXfi8ySc1qbffB5YvWv5Ax8Htb6V
         80cNmZKswnQWtSkv05BGtBrc5iWe6L4jpssglTblkmQcntpFnN9eSUaVRZui/YfPkor4
         JNElNPQoTjYCJjyezgc6q++paIgQnsObA7Erol1sNQ252y7OOk8x7eTN7PR8guccyFIw
         i3+Bz3RgJk5humniUz2MIpbUDOqwEaTHRZoRG//587PFmRA/8oBDruHURm2RQ4E6mfeo
         1NmtOMJmn+5ZaoaTmM2SL3h/0tb347K/73r5fkR6XhMXj3OeCNy0lxNd8Tq9+nxife7S
         P9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072925; x=1752677725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3A3hRQjja7NMerwUSuHLGaJ14/ejKpqQyPzO1AUrp8=;
        b=pY4zXwlA3yxX9xkWF9lTewrs0bXeyuNpJGrKXjAQxri64WrbXt6792DrObG1u4dJk+
         PcW2idHPgAuTf2i4dYT4tNbsKojxgianhEUjSw789YhkQ8jUL8IibTZvdRVUBka/MKS0
         e94UsfRxyrhdid/1/LZZqmWJHyJrKHJPI5UME4GHd6HAPDh/uOI+kBnGoliaO7ANSxan
         PvGqhST0+0fNliaHFbEiy73kHTjlvds4qOhQD+cv/xd4YAncZ5Wd+9PR1Yt6YfMs57wt
         L7mwxfrRmOG4u45jxCtljJabubQVi0OEq1YMI65CBRK1TU8XmMbceu4LMnzuga9V2gxv
         Hlwg==
X-Forwarded-Encrypted: i=1; AJvYcCUWpOGGGTxw4rxeuEjkLwFmVL+OxdPhwcmGkN6lo3n1BWl6cJr88DZbvrdPBy0WM5hpVm6kJPsoiuboYHJg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2l+WACNdEb8xKYVEB/9boyZzAtdh1OYdKlLI0eHgonIIl7rjB
	s16mQj9BX/pEBns+aX0mJ3UQ6MmDPHMwWVlvrtVvsCazCTefo4gysduvmWghlxsRYPc=
X-Gm-Gg: ASbGncs7wNeTXLayjoTFXJ8/5CjsvySfBx3FnaZT07XafDNmzpmoF1iegvnf/nGmeN4
	2XMB8dvJud9d3/nW85hOSU/yNkM0XeomY7mB+QRKut0SUxQBRTIIyQTKeLuJtRVxxWOooYCb6ZO
	9I9Q0h4k2bOj9FLbodGhjh1RT0GtcZ8dSTyxe6xiUu8Cc1D8MQaWwd0BkugC8Dk4ENu1mfwmvOd
	IPM73mI7kbmnNvZKY6YGKSMTQ1O0NRfWMijBDyPK7hthVIC5zzLxaWjRtTUBT/QMuh+11TpmDik
	CnTnvU3bCJgEsvYr+YjmDXq59OdRK+9jW8mmxRrTHYY09VWY9Qxz0peM1OSGpI9NzZ8LOn/Ipl8
	5xgVtGC0cbeSw6LtqsgqrMyn6uOD27tOf+3/TQUSs7nw=
X-Google-Smtp-Source: AGHT+IE1CWKVdaIzESsJv98mg9o7AX3rvILsP4/LmkQKyHBEdouOQ04zPbRMcVC/GnkZe9exm7j4sg==
X-Received: by 2002:a17:907:3c90:b0:ae3:6cc8:e426 with SMTP id a640c23a62f3a-ae6e1049e58mr9441866b.9.1752072924666;
        Wed, 09 Jul 2025 07:55:24 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm1116795766b.158.2025.07.09.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 16:55:14 +0200
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater:
 Document qcom,tune-res-fsdif
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-repeater-v2-1-b6eff075c097@fairphone.com>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072923; l=1262;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=NXnGscA8zt8gzxiNiTYIUpV9OfGd5HRPGvlVvXT/iJo=;
 b=H+Maa8FQfQMc4eZK+lVTkgEgw5axIHwWJiezVuUHjjiMKqtPvImloJEAECKGkVNX2B4QbuKj/
 VbyHsa6K3PHDkywR6SF4gjvn6DReQ+U5+SEDTmfS3zD9EEvXZb76HsM
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the FS Differential TX Output Resistance Tuning value found on
the eUSB2 repeater on Qualcomm PMICs. The tuning values have special
meanings, being different offsets of the resistance to the default value
in Ohms but the exact meaning is not relevant here, as the correct
tuning is determined by hardware engineers to make sure the electrical
properties are as expected.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 27f064a71c9fb8cb60e8333fb285f0510a4af94f..6bfd11657e2992735998063b3ca390e04a03930d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -52,6 +52,12 @@ properties:
     minimum: 0
     maximum: 7
 
+  qcom,tune-res-fsdif:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: FS Differential TX Output Resistance Tuning
+    minimum: 0
+    maximum: 7
+
 required:
   - compatible
   - reg

-- 
2.50.0


