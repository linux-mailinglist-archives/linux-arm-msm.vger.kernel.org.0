Return-Path: <linux-arm-msm+bounces-73377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C64B554EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 18:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2F7EAC2BC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 16:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0CB32039C;
	Fri, 12 Sep 2025 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mz83bkru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CFE32039A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695632; cv=none; b=HqjP/wMCzNFB4ChzGSPLKEXor76GXziVlab7r5cfuoxY60OFghjuoMaiPs/Cv5YN3pZb6Xe85xGTF9FMoNi+GAr2bfcE09sGxJdtU+NphJ3l4OkyTnCRUgQCspkbZJ7CSHGKzCqQfjBDZWFNQ+gAfw5PiOisLuIRnZJeZT6MPWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695632; c=relaxed/simple;
	bh=DkwJnDfpja84IGPxGS1DQp8OdoDKGyIaui6RgEYM6jA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syDdBceBpCp1/pQU/6sd1HVf4RyGmnKvcBOMa/puiMj2FCneY/UA2UDEvNz0nx2dGc0fGS4ceJWgyGlIjOqPP516tbGWiLnYE1JudXLgP8P/KF2us0E7pj+AWAuz8/DTw9/4WguXRZbmThjMFWO2f21058fegJ9zSGIZIUilOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mz83bkru; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b0418f6fc27so371871366b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757695630; x=1758300430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oieuy47KWnV3Qe/sTSLbZ9ljlfIMT7lwWIfyN2yTHow=;
        b=mz83bkruWYRlL5w5gMeP/pFCElg/P8qNXrlYANvq5lZ6MTS4KcXVC577LPM9PWGFNN
         Wm0t6EGYQ/NgtvVp+ILH/d5M97A4FO3n5fcVbfuwtHzSHpDVPHOGyvTi06KS6VTP5oHB
         6akVozo6P9ectdqsbVaDGw1pTGBzIMMq0Q1rwBA+47SnmQdZnb3J7uCPrUONNGedD9JO
         hQjlwbfC2/gkv/oYvyei5XnXkoemqI7rigOkOLITaJVEOye59GkNqNpfKfTCKN/fY2t4
         Hg3fZC2qeWY6n3V39U/FovbH7UiU2cMhYjuO+DN5VYcZDWTlsNzMC0uAYYanGxWoD4Av
         xm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757695630; x=1758300430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oieuy47KWnV3Qe/sTSLbZ9ljlfIMT7lwWIfyN2yTHow=;
        b=AJh+89z5rPmoJgz4ESU//H1lsqXMFWHxsPJIaVsatE4fQsZR6kTufOw9xtXkrx/dRS
         ipkBWEYDDVt6JbhCu9er4w1ABqJqspdlDI5Aq15RI9ATQTBrlveDK4ba89dHWgtUiQ1x
         48GcyOb6Si7JAFpPMcZzK7l55rvVr3TVMhkPjsiEAlTXpzugbNozPJS2W7jhbQFZGVxD
         0CeTV8cg4yRDmIQPQzfoTyFq70sdtNPt+ViiqvhVZIIOp3D/ewKDeBKpMUvwRspUpvBr
         lcmgRKmFUy9GJdkAVR82u0W5IZI9Kpw28FU2InW2FFKNWjRLRGV746uovBL1oKkuhcpX
         WfnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXerB0T9ZsWFc0A02Gyez6rHuziLB5JQbEkvW6AbnrsVmgL11vhpo0VgtR12hWbPTlujLqcg8GpgeovEyLi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++jr+ENoHG/p1ttkiEDu3rZJz7lrrWJC3NGLNQ8DwQ6/PKqF0
	Fq7i1CYfI8Z5QRdHJ+Flh4D/CSuqDtUTJVZqItHJTjTDwXyCsNtf+NhP
X-Gm-Gg: ASbGncvgTlaxHmOOGvmJsVWQPBQkUaCJg011D04G87e5FKwJtrGK+La6PyDCoE0NWz6
	qXcr0GWp8YcEARi5nyKMeqvKDuUsism8y9qxE1QWgchdeS6Lc7ilmmKmknmaXeTHe6dUNcV9R36
	93x58NEyIR/EFbsgJWBiVa8qtwrcysUrexdmEvCXBQI8dKhOFgeavjuoXdbbh/aUkq30xj1PRio
	grA6Ft6EqW9Jz91ZZ2TOb2vo1hvYaCEwdjtPr4IN9f4kROXRzrXXpJvtYFT9eHQuDWtciG53Tlq
	YVKdvmyxpf6tr9tfwF3Qf67PLxClI3c9Vne8zUVSZ6MNNaQ6767lGT1gzGjt7m158nWNva+wQM6
	67cMSf1Zxl0qtTKHdhMyfmROkyDVpyS0=
X-Google-Smtp-Source: AGHT+IEXssYj4R9z1Ni5w4LEdbK/scP/hnDZiu0JM4wesncjFj/njaUI2eoA3Le8msnu4+rMdIV5dg==
X-Received: by 2002:a17:906:f5a7:b0:b04:58d7:374e with SMTP id a640c23a62f3a-b07c35fb4edmr379626266b.31.1757695628817;
        Fri, 12 Sep 2025 09:47:08 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b07c337e785sm229786066b.25.2025.09.12.09.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 09:47:08 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 12 Sep 2025 19:47:01 +0300
Subject: [PATCH v3 1/3] dt-bindings: max77705: add interrupt-controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-starqltechn-correct_max77705_nodes-v3-1-4ce9f694ecd9@gmail.com>
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
In-Reply-To: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757695624; l=1490;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=DkwJnDfpja84IGPxGS1DQp8OdoDKGyIaui6RgEYM6jA=;
 b=jhvTXYUpfdWR7isj6HYseFoGOtMKt0W9apbEbEJMtiS3oWuZ7qObDcWXBWoBsHrn7n0Ilij5y
 QxOjddgbZmzB7J4BeNvkx3M9/BTioolKNdm2WBdBtAJ57jOxRZYTjzd
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add interrupt-controller node, because it has dedicated interrupt source
register, to determine which sub device triggered an interrupt.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
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


