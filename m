Return-Path: <linux-arm-msm+bounces-62368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ADCAE7C95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A3C6A0355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE132C158C;
	Wed, 25 Jun 2025 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BhyqMgDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C229B766
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843103; cv=none; b=COz0qSiRNoae+wW1FdQ5QzC64VzFShrR16r5qQktZSgNY8uuEG4eVuoXYt+aGLxS2oGTb0wOcY4ZpD6b2+ElJ0KCHyBUY5pGZ++oCEECsNxDkVBjnjyhmocR/R8GuxcqVaS1tTzIXGdMHaui2hlO6cIIaO2YczEhTlDXn2D8Wdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843103; c=relaxed/simple;
	bh=sSmNKlCCE/hYQS1Jt6CmnYrp1DfkuQdAFvrOaZ47sRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IsfLohMhgPZmEA5igcjBebaI3rOOLlW+CiEHb24JrVfxynp7JeP/SI1C6x2PNhFxGS1mm4ocwf52qbYuqkBW91TtHD3V0WXbgcHgkSVTxt1LuSlumYGOmfPrO8RI7U6vJsb4I57ZUD7M1IsNpDS6h+/U7QuDZwTJ/efsthbvgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BhyqMgDr; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6097de2852aso1759990a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843098; x=1751447898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwBID1vXAAf3T3W0EWW5L2l4FPlZyUrP4RIEpnyDcSE=;
        b=BhyqMgDrb25kfEYbrTlforw2e8wQkPfSCGBUhthr3Ap0KLQvDHGsAGo2PLfudNqw1m
         ZYsp5/y9ztV5a0zmBRTPCMaMdphUvVOlcdMIzYREUSyM8P4gprrQ1etRmYsEq1yqvdML
         4CH0KPVhdgGR9EaRGxgXURK9cVNxa0TTK+jFUXPq7YITw2sygpLcNrGWMx09aJX8s1DI
         MfYZevV9nMOyijbtd9gl+Ppj+j/W4ybirIzsHdupcyX+f7CpO5TrJZxqb8uIMoeASxvA
         o0THv3iibcswFhfWLJX+wt+wR81FC9mLclumeDxYF4uk2fwHwrDoj/ClCEeEIr7ThxK+
         vxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843098; x=1751447898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwBID1vXAAf3T3W0EWW5L2l4FPlZyUrP4RIEpnyDcSE=;
        b=imr0HrslSy825mpzcwN/LnYGWdAgCKoVmvYRD18iiWOt7oR3NbS0oqYOq2pIkn7i4f
         a3EGv69AumQC3N6/145MK9M8PYEtVRWgftULc1xieSrkQw8GRYmMjlsQH6eOwxZ8T9/5
         AR3Ca52hy9u4e+PHP9V4U2CR4+7vs8QfrlmYF3KrnEwWXRtQ4T4bu5mna2MmTQvd+bBN
         Q+q9ctyuw3V4Ezcq9DrfOilwSAoYB3iyTd+by37QANrSIyUVqK12WxsqUtB2lVobPs/n
         0avflolgL6kh7XRhrwuVNtvQn/vPtJO07zKFQJze9yDaOiz8yLcmGeFKQgYeAPV+IIwy
         XPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr0E2Hj3hIfSVkzGKju8GrPzrQ9W5cy/CzrLn+0zHxtb9VIIc8vhwLatw79hjmhydvcIa7TaKynxo2v64O@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfue94rJPZT2jsNHUHH+ZqSDKu0w1CIHlesJRlFxiKbbcNdvi2
	MKQ3OSkGLytzecP+31cyfqugvJ0pr+yi+PoFqgQ1y2TXQigcqlHIxi8HuR0tyaYRZUE=
X-Gm-Gg: ASbGncsGu2QBEanH/zsfguXka7V1keUuWcb1tBwIWkSBNhSsYNkSukDlok4kGxWOG84
	zDnPla2y7oXmwGJ6i7tudfy9BbqYnfheRc7FM1iegPf6rtUGX2ZTtRT8vRH00at1BhDSTPmgAgG
	3jLlmXws2d+Ln1QkevlBdcSaHcG5/sFx8PAI50X3ENWoUBvbsnUYv5Fq7Qn73/btGhyQbb83rhC
	JjmNYkOzf4iBApnthWUBK97yFpibXky14KiWVvMNnEoECdvVAyPytXJBNLTSewshLqdxrHmHaRd
	GE+mgqNxaofQD3ou+dTH3LmNLgBkPGFt5td02SSOSfNoYKWxdvjSsd8LdtRqO/qgaRm1eFtuDda
	/QICjTjnOqLzqLBDfvTYYpMdL1Q0Rya2R
X-Google-Smtp-Source: AGHT+IGXwkSlAKfNfKxCHo2TaSnK4jfPfpaJp+4WHyqX+8p7y3/Ix0pLmryFCKMcp13ni53P6h1WDA==
X-Received: by 2002:a17:906:7956:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ae0bebe96dbmr228885766b.3.1750843098321;
        Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:04 +0200
Subject: [PATCH 3/4] pinctrl: qcom: spmi: Add PMIV0104
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=1029;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sSmNKlCCE/hYQS1Jt6CmnYrp1DfkuQdAFvrOaZ47sRM=;
 b=Wtzgl8AnylHE/Muz8JMpkBz/7QkNO1Nv4Q+it2k8m7CLdbsR8TK5aaFR+PNYbiVtqFwEyV+Rc
 tDIWDZ0Wk59Bn4ywu31W34TFp4IabNCSPn3e1d2Cucs3b4xsLJNi5dg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

PMIV0104 is a PMIC, featuring 10 GPIOs. Describe it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index bc082bfb52ef480941e1804f1142496e1db6413a..40de5554c771d0c034a458fb4d5e8876473b391c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1244,6 +1244,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
 	{ .compatible = "qcom,pmih0108-gpio", .data = (void *) 18 },
+	{ .compatible = "qcom,pmiv0104-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },

-- 
2.50.0


