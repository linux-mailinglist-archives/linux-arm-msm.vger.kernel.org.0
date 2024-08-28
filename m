Return-Path: <linux-arm-msm+bounces-29749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A296239A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580C71F24C8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD4616A36E;
	Wed, 28 Aug 2024 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTMgkFkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54437168486
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837773; cv=none; b=CVdbvSlxcDKZgWWYYVKx4vvV4pJF+an7UI9EvW0jcpdbgwTCEu6G7yqLEFUgCb29zaRq/NVIIpGdql2HlurXUl/Cra3H4j0xuvFcjRCQzo9isHZPA2vbpmhFM/gsEwbBNesdIWdleUOW9rFZhEUtOpuAHKQeRolaznfPS73eGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837773; c=relaxed/simple;
	bh=zQ/EAttBpW9Q8AXfVWlgDx0v3eHjsl+TU739HvihRfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcgME4870BDEtdnWB7O3lXyrp8emNlznM2+DCWuFQ7gAFTxf1gOJMC1RRTEUuWxpWI07M5dRERRnkuDNcGTTCj5zDL55maCRWQYsEnG99YXZ52sM5I5IjOANLr5jujuaG42myZpc8IuRZpt+NR8ANFu5a+30jOTmxmWhlPDF6v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTMgkFkB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280921baa2so7262585e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724837770; x=1725442570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZNNRrHbOALIGghuHu53Hlhnl0hetnh0rIsXkn0hdN0=;
        b=RTMgkFkBd8OJvVJ4VGf1urRoEIIYpgrodjqUwW4fVJ3RKS19wKbjgrmr6C6I08N4hH
         i/d35PjIVzkOOYbq3VIN+LW48TUel0KSGlHX50FIf828qVMYWZCg29wUCD8ElP2fWIge
         zXoPmZiS9cneWu46B7jw7hiBL9gj+6c3MK3vwuB0BlU4VOIByLvgHUad7gFweOn17Q5v
         EZ6tWakFtaJlaWiJwQgadSLoNVcQYd0zV9pApjMlr8dF0e9zmh/WFGXLnbs4HE0QScJi
         NYiyTaCm04U+v5HVzAIY5z9lDjIXgk8RDnsasKxNd5KOinWYpW8ZcRfcVnfeLbTp0rvT
         hJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837770; x=1725442570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZNNRrHbOALIGghuHu53Hlhnl0hetnh0rIsXkn0hdN0=;
        b=dxLNGfUJ0RXx1p29oY6bglAteMVrDSKj/vCDmHteVc4FzezKIs1tORVhi0yPALzhC9
         Zxh8LER0+9hqsSvDg19ZwXlm3CWhYZAnuswhehfwAKQA8ZZm3jnF3Qsb/o+DuYudWhRK
         fPhUNyHglL8m1NryjXsEpJ83xj3F414WoJypxVkn/iDh1TGF/NybdvDmtMz+zMvrmnSG
         oTovox2sHo6OGKKxMEXyAr7jxSUWMKmyI83pcMzIOQ9CpkXORyr4FR9gcSX7ZCEfYsTs
         9i83WvSMJujF0mQduYAcLDxXX2Zo4YIjk7eGRFWTz6jqxNBVshGTdjcyTGZP/Tkw1a3e
         LHCg==
X-Forwarded-Encrypted: i=1; AJvYcCV39kzCmQb50019Ao5fC5LT1E37kOyGP3s+ATJbICHqqIgti3nR3ftQk97EBDIvvn60TBzwuQ92XNRHrgZa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Evsp8hXz0brUnD7eJC9t/oXMLh5A4gRsxYpwU039W7XQPNS8
	YvhuyKXrNQbYr1k22T5FRP1c3l5qmwOiaabArsg5dYKU1G1SZPpjBoZaT3CFEHI=
X-Google-Smtp-Source: AGHT+IG9/vDsNXLZCy2PLta7RRyHss2Tb1u9MzhedawWhzPd5nwASvDx/bFEslbEbjrUTV0SqLsSJg==
X-Received: by 2002:a05:600c:5105:b0:428:18d9:4654 with SMTP id 5b1f17b1804b1-42acca311f8mr70381685e9.6.1724837769651;
        Wed, 28 Aug 2024 02:36:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63d7d3esm15270825e9.37.2024.08.28.02.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:36:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 11:35:58 +0200
Subject: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO
 hogs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zQ/EAttBpW9Q8AXfVWlgDx0v3eHjsl+TU739HvihRfs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzu+C4RJJ1RBPM7LK8KIDj+kQS2rURjG6cPz4n
 Yv6DIWe9IiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7vggAKCRDBN2bmhouD
 10KyD/9tsd39XLXpxYG0Lh6I05zljRsfz0oC9ri81+o5RR3kYd9IjLAbtMSNauoFquWI80pWYNi
 LEZAngibtD7JGqFe1ScTwmsECnMjAPN5XRteP9tc4603vRhDHj2SxRFFi2Zi9nq7+GdatJBlJfD
 IsekUWVWvctDrFHH0rg9HVteN1DYUrLEgc+EheM2qYgI2U7QQElkKI1/l2HpWeYdLJN4CL6fioJ
 sWlIFFZf9jTaIlqe+TO8ebW5Lh7ATlXy+rO5K+ZMC2KS7zRUrQJfg2WrWTXZ8T3LdKDaCqkl1gj
 wPXclOFxIW+tA6gd2tI/SQh6smy9p7vpzmXp4pWxVwM3zBPwRf2k1HB/nKvXGehJISf/H2QAVNo
 2nrMN6i3P6PAUi4tvKaR1CMeLhs/8KDfFhNmuhGOJLByoo5HAfqUW7C/hHLBcp14Jk5yqxuiLvB
 K76O4HnJTdFnRvyRpjqjHlTV4p0D/mYhGP5JG7Vgsk3j5HDKbu4wtTj4PudviDb5sspANnDP6qI
 d4L1uj86Q8weETPK8GwTG7RZERJSQPa6OiV6XX3fx7PV86IYZ9fLHUjK4CNU7vJVyt+07DbbAW1
 o7HOH/UVl4OQdq/L31kY12RnfU8hwZnRd74ocoy002eM61JwmFXA5Lt9d4B0cfPhuGCElomKrOc
 tqjIFpovb0Tqe+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

GPIO hog nodes should define type, otherwise "dummy-hog" boolean
properties would be allowed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml | 1 +
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml       | 1 +
 Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
index ebf74e48ec5b..cc5de9f77680 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
@@ -37,6 +37,7 @@ patternProperties:
         additionalProperties: false
 
   "-hog(-[0-9]+)?$":
+    type: object
     required:
       - gpio-hog
 
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 2784d32fdde2..c1b799167d81 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -425,6 +425,7 @@ patternProperties:
         additionalProperties: false
 
   "-hog(-[0-9]+)?$":
+    type: object
     required:
       - gpio-hog
 
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index dfe5616b9b85..0f331844608c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -43,6 +43,7 @@ patternProperties:
         additionalProperties: false
 
   "-hog(-[0-9]+)?$":
+    type: object
     required:
       - gpio-hog
 

-- 
2.43.0


