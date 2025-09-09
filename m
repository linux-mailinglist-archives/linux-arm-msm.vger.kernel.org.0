Return-Path: <linux-arm-msm+bounces-72868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D78EB50658
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 21:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5713D1BC8940
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 19:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE64E35AACA;
	Tue,  9 Sep 2025 19:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/fx49pr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460872750E3;
	Tue,  9 Sep 2025 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757445730; cv=none; b=ONQmazLHFm5iN5V/CLU8Lbkfsgn5JqL+7elI0NiCUayQsgppdQaAfL4Jht/3nKd4eessAM/+A0GQdeg2c8OBnpcIWTBeaijj8cNOCRvYHkeMBP5+utlkxbAqc5wqV0sAMbseVULtH3zrfzLTMpnPVZp27DDDBDp7atUFfOH/5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757445730; c=relaxed/simple;
	bh=DkwJnDfpja84IGPxGS1DQp8OdoDKGyIaui6RgEYM6jA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbGRpbB9bNf92bgE4L/LgXzin1KNKKPtj1xeAaKyHaPBLdrm5iNSdqxHtpHviZxdvZvkbhX9vw6d191FsN/FSkySGlARv7t50lW3d2ECWtm7BUjiKT8Ild0hv4JTkndOlQBXqdX6TP/HTnFcVr0N4YlIcT5kHUm5KiHzjNwt4tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/fx49pr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so9564839a12.3;
        Tue, 09 Sep 2025 12:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757445728; x=1758050528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oieuy47KWnV3Qe/sTSLbZ9ljlfIMT7lwWIfyN2yTHow=;
        b=W/fx49prUl3LLJOAZ5myvKfdCLD4acmNSsBds+uFJB1VMHs7RcYxs8hj8AapSv4Mws
         3wmUZLGE8EdWeKnls8u781h9XcQAgv6WUHH8obkTrAgD2PRS9334QXdC1F4BcX6grYW4
         tpX6wGXGgPJ6/SUWaPYVHHSLACCU8o9w0Q9kgw8sNNJ9Q+uJ2MuVY56D0N+N4vOGz43e
         veaR/00Hg96Sf94jDTz9tG0k9mYHez+8pIu2iyBBpfMmXpWzX0tlRpP8gIiW/1a5nheA
         LiN2u9wtqLtI/m/KnVb1cwdPVhp/8xpQ4Jfo31J7jJUqBlc1c9URSkQtjtZFZY4LK/Ra
         vuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757445728; x=1758050528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oieuy47KWnV3Qe/sTSLbZ9ljlfIMT7lwWIfyN2yTHow=;
        b=JUt6rurBXSI3fysNK3xy9e0c/QIa4TEBXYPqq/wRommNCKX8cQplmRj21UV5yfEw0Q
         gzUQAvaD1ZZ9FQrpdg6jKVdh4gz3gTjJC8vDZJeU4sAWKM+UetGuLugETPB02SYvnk7r
         l1tbRzBozV1oLAhtf7wuoyqJ0SwZN+ozTzthfDFWNilNLi/0cSUTXTVP5bUWp81NdWb3
         CftgbV7wMkKBmfg4pbJ22tcLCnTJV5HaHRd2ZbFS8RFZnp4pomHk1VLsbKAyldy2fuHB
         Yli+iCrSH3NHcEPjoYlWflKbd61dmStcGV72DhZacw3lDH2TXWMXMSLidkfJXMovqBeS
         3BVA==
X-Forwarded-Encrypted: i=1; AJvYcCU9vquUmdfm0SxCUXZLtiDwROe6v1zie8yr3cj2iLVcDmtLJ61Fk+hBQCzpIJv8kTMcaN91i5EfhO0nWuZ5RA==@vger.kernel.org, AJvYcCUBHSo3QibW6PFuPis/KoVxzS9bEPVepbjPkGpZZErvsObGUkrb+Tm2WA7rxbQbxGrXrPV9CEKXYytD@vger.kernel.org
X-Gm-Message-State: AOJu0YyV9Dlr99H6o2+dWZB4p0Jpk7jGPeCYQTjAb/bqPEh4LjTjozOU
	Kb0IwHFYnSY/hsZA4PDUozBE5IBVNWAll6tH7U1bqDJep2fHhLtXTfWn
X-Gm-Gg: ASbGncspms1Sk4Zfl58JCw2gdPTl6QF7LUlMIfP0c+7Z6AuN5bvvTjyrSF2HfmwJkBd
	XOZJqp8BUmjthMIn4MWtfe7+fW2ZQGjac722ftEplk4UQbZxb66gsaWtqYrxdDxHYfGzptBIZsd
	/IkraQ9+lab2inLvc/itc6hdlXIl5hXpb1JnAw9uZoSljS1p4QjpDHimmNpj1Yppi6k6QI8CQJH
	3mQP8+rYkIT4Wxt8vBcd1t64EGnbN4fGCLWXdmIlmmshICfS7uuQa6uU9UCkf82/N7MNLrHT4YN
	7JUgNg7Y9xpk3cKDqS/eq+5IEqUMnjV8gfFkf0qXHtV6ydqn+MJHrNpuFUmVKOFptVY3XHhSNs8
	Wl3sPDpyAqDIlZ9pwvdrq7STRNN5oFaQ=
X-Google-Smtp-Source: AGHT+IEx8vehf8toW9sEamcXTq4k36E/4g3lgwrRSrDjOUL437S+3WDeE8TA0/Z8AlCiBaawUaLqGg==
X-Received: by 2002:a05:6402:50cd:b0:628:b619:49ca with SMTP id 4fb4d7f45d1cf-628b6194ba8mr6958646a12.25.1757445727633;
        Tue, 09 Sep 2025 12:22:07 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm1847142a12.46.2025.09.09.12.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:22:07 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 09 Sep 2025 22:22:03 +0300
Subject: [PATCH v2 1/3] dt-bindings: max77705: add interrupt-controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-starqltechn-correct_max77705_nodes-v2-1-e4174d374074@gmail.com>
References: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
In-Reply-To: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757445725; l=1490;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=DkwJnDfpja84IGPxGS1DQp8OdoDKGyIaui6RgEYM6jA=;
 b=z2lJABoKtuzu2K4HkB//UvN4fYKzHFUhZCSTcUcRZj1Ivp16x7RJcfciWVbYDAhHJgtDb2ZoP
 n2PcgTfzWKoBJdNFeT7AMeSF23hOiAgaZvzGebd/jxHmbjPtpwUMXuC
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


