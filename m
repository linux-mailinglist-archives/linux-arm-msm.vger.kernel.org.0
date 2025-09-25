Return-Path: <linux-arm-msm+bounces-75187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF63BA13AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E2B170AEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA8531E8A6;
	Thu, 25 Sep 2025 19:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxJUjo5Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99331DD99
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829130; cv=none; b=EPapkOqtFdVlfFq+vKKL2qU+LyxHdeNZaOPA1y6To6diN01mbEM8+tEO/Va5k+aSmH9fm6Lbz678D3J+pf3VpVB9p2NsBXvEm5kiQ7PsXkNXZdtCChhpr+KEbnp9kvRa9MD0v3f+1s4wA+Fcf1DRrXZp48u1KUeawFsTusFNjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829130; c=relaxed/simple;
	bh=MKlBR2dClXHDuRj+BGr45XY8mOHthTppSW/DIxzl1Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HV6hwxUis9ya/FTK2Wbv6/3QCo1PX4WGPxpOjA4E8h+hjG5E4roGnpFe19odwh+0bNt13pdgAE6yRa7Ca9tMikQbzfMW+u9+/aiWeKxYNqVM5D2QwMOCPd8dXLZIoifJGKLttyfGn1NO+q46hf3Tqta7hGlP7p5+G6b+QlSnYGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxJUjo5Y; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7ae31caso186677266b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758829127; x=1759433927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlX+6+mh/UPamy3i37VKA4DH1qcwrv7NT10uSfZTwWo=;
        b=KxJUjo5YOaFaclz4QximcdTMbD75WmId1k6t7ku7lnaK9njVA50sEusISUPnZ/mmRL
         N2UXBI86LUKpbFckV5gu73BQVIZAhJyk7PS5xFsmIZZBUxgeP6FS/K8uzbgDFE5CNy0+
         nXjNn7k5OSAvGnnJ45gjWbe4YrRT/YRPKbuHKbtZxK6lYJC5goQpRQDdCh/UXNEOj54L
         W+5uRrr8CTlM40/MYXbgG3aTx2IXEXtN/zx0TS9Ci5XSB87jhCz66SesxQtdlghPSbPU
         1UvONWyuyUItWhMbnH+1yZx9QTmPwh993U3AfLcPNjQr2Bb93KOQwRF40+/pdKlPWgfs
         Qn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758829127; x=1759433927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlX+6+mh/UPamy3i37VKA4DH1qcwrv7NT10uSfZTwWo=;
        b=EYG+269qZAK9RMQAdUfPo88gaf/pgN8U3gWHueuNKPqn/dm7Eh1asScROKu2VjTxNX
         r/Btvo9YIQkV82Jc7+dipkj3361P/f3qA+/VZFgAQ7TePfNhofprQctGdMWkX25v7AgZ
         rywBnMPUGLdd8OQQV+xn2R9fTYB0PkykgWWfmGXNAuthTraoJu8hkwBCwA4lIGX6N7Ic
         xzHIkspLBVgNz2s/n4HOXmWKOVD/BNFeX4kwkzGOi4fKCWx6VYru3ggdIUWegT5pitqo
         3fSPjGmj9s678zYZ907yzZF2U1omzFd5EZzNf9b5tduufSotTab5wJldrzreVugmL12t
         4dhw==
X-Forwarded-Encrypted: i=1; AJvYcCXQIxDQLH5nI53fiKhzv2czkYWgicWz6RdXKiL7Lx9Y3dXmpIe5nG8hSgWqw2Uu04HwsAbdo5w9Vx6f69XJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyMXKWUQFmHV6pytmAHz65QG1r2t8CGxyMd863im4Zg0HmsYfgO
	xuSsJ2xaIvdc+eOUkYCbW8KNbr5Ei8lJR/0T8/Ic5m8M1Tqf8DDqUGtG
X-Gm-Gg: ASbGnctRY9CqWjTXpjdk6Qa/bqvu1nMjoS0Bp/qyG8ivd7iAIChWvc5GCdM07/cHExC
	5NhR56oIrhHO3GFYLKngm4eNduY0WGLjWzhVgr6FaOwRK6tFPKP5BGw+7ya8Q2taAVgyDA15xYP
	8FaISxrq3qHqARX6em/vS+qTNwuX8jSp7vXHmUugJsqNYBAxi1kl0pImT47JZLwNgSLCC75X02z
	AOJ1rV4158rCq7ysd62EF6Rmu0myQIY6i/1mHN9E/Lz3hxWBfIWgqqpx8axQBqGb9XMfopDlpUO
	mwqyMp+CXUUFVaDEMtRfdI/8+bFVNWh98+f4MUyI1/R5LU3lWZy7PWx++o3MHrm7fpbVVMubmDr
	JSDRcsKDWj/r4KGBq84DYn+cfrVHUYyo=
X-Google-Smtp-Source: AGHT+IFfFBd/tgTpAyrafNZKQ1/PjUXY5Ha4wrVJC6PKi/5tOGX0Ed7VXD5cf/oZh2r/aUhJ8/tUHA==
X-Received: by 2002:a17:907:7f2a:b0:b30:ea06:af06 with SMTP id a640c23a62f3a-b34b80b30bcmr427286666b.24.1758829126244;
        Thu, 25 Sep 2025 12:38:46 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b353efa4c35sm222820766b.26.2025.09.25.12.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:38:45 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 25 Sep 2025 22:38:39 +0300
Subject: [PATCH v4 3/3] dt-bindings: max77705: add interrupt-controller
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-starqltechn-correct_max77705_nodes-v4-3-93b706bdda58@gmail.com>
References: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
In-Reply-To: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758829121; l=1612;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=MKlBR2dClXHDuRj+BGr45XY8mOHthTppSW/DIxzl1Xc=;
 b=1UvcAjZOjFkI/v8zaSdhZgUc6plJ2IZ4WtEQH+Ev863H0hBbVjpgk3EsX9gXUnqJ9hr3iZlCf
 U1A/RRyyKwTDSjAJIBoQYbrFrmhymT5/urFOAu6IbjQLYHeGNp/+2mi
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add interrupt-controller property, because max77705 has dedicated interrupt
source register to determine which sub device triggered an interrupt.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v4:
- fix commit message: node -> property
- fix commit message: minor reword and punctuation
---
 Documentation/devicetree/bindings/mfd/maxim,max77705.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
index 0ec89f0adc64..d265c8213a08 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
@@ -26,6 +26,18 @@ properties:
   interrupts:
     maxItems: 1
 
+  interrupt-controller:
+    description:
+      The driver implements an interrupt controller for the sub devices.
+      The interrupt number mapping is as follows
+      0 - charger
+      1 - topsys
+      2 - fuelgauge
+      3 - usb type-c management block.
+
+  '#interrupt-cells':
+    const: 1
+
   haptic:
     type: object
     additionalProperties: false
@@ -120,8 +132,10 @@ examples:
             reg = <0x66>;
             interrupt-parent = <&pm8998_gpios>;
             interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
             pinctrl-0 = <&chg_int_default>;
             pinctrl-names = "default";
+            #interrupt-cells = <1>;
 
             leds {
                 compatible = "maxim,max77705-rgb";

-- 
2.39.5


