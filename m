Return-Path: <linux-arm-msm+bounces-10635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD385142F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 14:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17EFD1C23B5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 13:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47843A1C4;
	Mon, 12 Feb 2024 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAv6j+U2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB33A29A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743423; cv=none; b=fK0ehV0zp03ixNFuRa0Iac8mvDTgg7a6cnUXFvw1aF3i7aXtyos/gr8XI8aEJmj3Eufz2se7olrI7evfZm731/xoY8VAvMsSRr8BsGOS0YaHzUN+QnpyFzD23unJG/YBBIzCOLRWC4QkCPKscxhXfJyumXS9lwAl7aYzPEnM/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743423; c=relaxed/simple;
	bh=yZBlbkJpD1p3nFnJsrg8uJhSz73a9OCV1t7lzOQKRPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ouw0Zx10OxRBqeRBx4yM5fOvGudhDSTo8HnlFOeUv9sAmkVtiSHPk7DRV4PbO2hzFn2LVzP/eOEtoW7JqtYGdGOTZd9JlAUoPcy1nfb6vlif5V19eJEwJOBr2YiBeENnORmUinzychQuCPz5BKeZFO3eEDiF1JWoeg/aVdA2D28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAv6j+U2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3ce44c5ac0so695666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 05:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743419; x=1708348219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jX6V4JHyCBA4UlDc/HqdUeodRBCSbvRidLCxVmFMvHY=;
        b=YAv6j+U2cgU0vA9KNyr64JIoJ6/VWg3YV8cTbZ0DeILMM0/YIx6ZrJ5G5gmzhRQL5h
         b//D863fuLEw71IUv8WzSztAzbXK+68lkN51fAJZWAxjd1OxBV9Wbs0xW/FnFV7AkBol
         WcWGQjiYCjZh3g1liIy9porY3k0TxL7AKncqTyxPUvaS8uR0oJM/plEm8gQvklRvq/LO
         E6fgf/PV0f+k4sGh1U7I1O/vJpuPXaHON3do+sZqglCUSPK/4YxD3gnnNyZQJ6yOPaND
         lmFVZqeNZ9n0LdDiutdQ5qQS1EMcaYRp2ulHMBYd4sq07VzbpCKHJWZKLJ3IOPTPNVQr
         wuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743419; x=1708348219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jX6V4JHyCBA4UlDc/HqdUeodRBCSbvRidLCxVmFMvHY=;
        b=GbISGBvOmiJB4UazRjJBpoqQW8KovyQHVKR2BITuxtFQElR+kta3/s7v9nfPIqiTYR
         tHT+ElkLyPQ5k5LF7EOMop3zSQenSE1aM5lyNOgWKyXzvlfJ6lk0+VUlKRNgNbsCHQTI
         0mRo/RAEc89ZbnMlwpcJH4YsjoTPZq8iKieYFTuB+7JVpj9ZrdzMNzN1OyHW04egb6T8
         NGS1Mn4aB/FXrwqBwZeAH6RHM1U3+d2sy2nLVxzNg1rYr+wcVF4+rMttkCxAPndCKQw2
         mmVKFQGTW9+JEjeNzdkCg7EG7Nwjtao9QkKT3MdyFGpuAK2L1TLWaGIsQ+PQuB57Vzv4
         GmHg==
X-Gm-Message-State: AOJu0YwPw9p26gB2mSgvFPMjHFEuvR+Nj8Hr3zOaTt3JIhVgUsmMxk/y
	An4ryGFrzkFKqg0plNxWi3jG4c/fCUfsKktkaQ2FgT37zbl435NcoDkz5dskT80=
X-Google-Smtp-Source: AGHT+IGO9+7w76ORAQeM9qSstVbN2XfFoA5uDKb8YPD6yBzEGTZr1tiX17Skbe4o1ZbYT/isTQJ7qw==
X-Received: by 2002:a17:906:350b:b0:a38:5cce:1bad with SMTP id r11-20020a170906350b00b00a385cce1badmr4896835eja.68.1707743419202;
        Mon, 12 Feb 2024 05:10:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZMWwd9P89QXJ1/oAaEto4XrLAdsJ/Y6AhqaY1lqSha7DU1UnxPIbMwuOuMF1ATV1L39R/gtW7J/3G0By+3aDtpPWY07ek8XLgMW5cLKQBvA2CNxA6m+7d/Ypx1p/S865sEtcFW2dLmCHoJiafKpzBUnp/LMqZr3ZzvKOWOe0VTVu9FBG4/HQYTkjLGM03+8FUhtGrLx7vSzqHQxjGhiuzINBYtk075Xs+Yd/0+kAkdqie1ZsL2iHFXJeJHKwykfIKLNdPi9jc17LnaTcHrasMsnZghhziCwblcGztD9oFJ/WhTHTPOqFUsniKV8A2QYbQo+TJzoirEPmFOY8Y2t8oGP7d9WG/r3lBdjDarYTtCntRdmSYb9/UtL3Sp2dR5wZXn/K0d8Ln3c1zdmmpmH6YtdJyhUyC8CvO5+Ue2k1FKvq+4sgPbgycRBhetv9p7B/ni5LkgEb6UQPPZ8idIIwH/ACvFbaqwDakOhMqASZvM4soPSjtUFcsrpRZi2e9bACdwUrEIdFRvgYSMG+uN4kJTIm3sTYAduwTbLHM5JZPIecFxpvfLg67XhafS3qIMbybuA7mUJTwJF9YpKIrzv52pj6QR/XHOrwr+Zz9RCrF4sBd2DCpDF3TX5AKfuf5jeVdmriBiVdwdLjHhuLc3TBv2ZUub8Za/url3NkEvhQKc5YZt+0mlD9MqtlhCuIZKm4Hr25IZaxtOGdg/gXW7UzyZredyrob9L1YLn9/eAdPEZrLbS44MC4aUUVVdivE0303q+DpE9E6YrDD+XBcBrd4UvF01Z4c7SjMf77PU1Md7qJOlQd1FEQEweCJPxD+8N/j0L0quBNJueEDkx2MeWT9qIAz
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id gz9-20020a170906f2c900b00a3515b35be4sm193052ejb.104.2024.02.12.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:10:18 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 12 Feb 2024 14:10:09 +0100
Subject: [PATCH 1/7] dt-bindings: ASoC: cs35l45: Add interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-topic-1v-v1-1-fda0db38e29b@linaro.org>
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
In-Reply-To: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
To: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707743413; l=694;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yZBlbkJpD1p3nFnJsrg8uJhSz73a9OCV1t7lzOQKRPY=;
 b=Typ0ntFsRGIVP8WOd06O4OXyj4D/TojGIZIW2/xa8742w39ZZQnOlVwlytnL69I4HHCDQYYQy
 lMI+CQBwB8MBNUEP7PJV7F4SEkn4v6myBhYcAd5suogucdMY0QxTzUH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This chip seems to have an IRQ line, let us describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 4c9acb8d4c4c..70f6c62aedca 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -25,6 +25,9 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 1
 

-- 
2.43.1


