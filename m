Return-Path: <linux-arm-msm+bounces-25068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889D92575C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D244628BC6B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375B616F8FA;
	Wed,  3 Jul 2024 09:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7H/CBfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8698016B390;
	Wed,  3 Jul 2024 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000237; cv=none; b=txUWWbgHBskTqcOjiLaRR50SXNGQFxrISVnQOGSoIZkzifBx+NAiYfOXM5k0Kg8bgMbGCQ2zDJHIYPO/ietKS/Z3R3nBmiJKW+CMEeLMcjeOksPSVvsnVak3FqU6H1XNAaXvICnFq30u9Pj0tL2PKwAoRj00bsLPt4Ukv+qbWEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000237; c=relaxed/simple;
	bh=N0gJOHgxfgNpyO7ny+dBVGTv1J0OImnbpHVOZH5V8Z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hEMSLf3bXq3mRseJzoKacKFHzYCQYPvkIaxf4VHB0U1F8lpBBv+GRUGPpXCDXyeVvK/BgQi4NMGlf5ZDSXrSP8tmRwquqDR8nujATcDb5kkw+OQODCr6nfX0nc9K5P1pY9Igi243FUH9kade013W08nLtlplFnWh3Lc6u+VJ5OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7H/CBfp; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-58b3fee65d8so2455288a12.3;
        Wed, 03 Jul 2024 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000234; x=1720605034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VakF1oeyZohqJOzCR2EB+e9QseEPpQNRdPS7foA4iOs=;
        b=m7H/CBfpUyIRjNol+Q66Shjx+dyIg690wEt72iOsGqvZBfc5apYKKLSYqxNvVBBfxz
         +SmA1BzZUPhnI/78itDNFh3UDoGXvFbTEIicgSfO580+K+Mnbjb3ZjzDc9/043nng65h
         RRm2cAy80WLK+jF5ZA/glQB7Diev7IHF/fnsdeYFwryv3ky0RA9XEhM4FmN0BFvsVTwb
         uSY985WC04nZTIA09GIvnfSsH4uoWsdfBXDFLatg6A4CwjdWeTUzlsHZTq9mT3U1fdpy
         r/WdMrg+BHWjPQEf4OoFhGm/7MwAA158z5q5Rzohsy0F2jEV6lhsCopkhGCVoYpS8YS/
         Syvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000234; x=1720605034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VakF1oeyZohqJOzCR2EB+e9QseEPpQNRdPS7foA4iOs=;
        b=o8gc1QV89+DwCCyrBofJngemVc3270xca+WEpQMFIYA0Y8sPeI3S+a4m/71TCPOkFl
         W9P0hRJNeSzC/ZMU/nUqBGgMSFByIF0EDx/2rmqjelBHCx8OuCQEOqpKLTG5uNJVMstt
         vL1VkAr2QLpS//keyskWq6qkPMUeUijcws7r54q6UI3O+IHAHuKAOkwF/WNFHTcfUfR/
         ZnoR6sGOoQDNVN+nOcJHK5MsJRXztZEdjS9M+twJmJxH7u7KRmyKKlCXW1PR9mFBECjZ
         7vjRuiUNM2uC38u5QoQ4geeNgy/Dt2wYt0S+xujDeDFgekmAVJL8KkRnzHWLk+YfbljW
         kKtw==
X-Forwarded-Encrypted: i=1; AJvYcCUPP6Ngxg1QRg2agl79mcgR9H0Ku5pTo5Me4AxG31ZkvO0ygPFZoTx0atLT7kOlejXBW4sj6Cb02uTgdmJnLQcL6r3KVNIB/4kjyrILSb1vPWMBRrVHr3/EXx+LEVnVLJcg6oVQAwK2XBOw5fmVsRWkxo5tdb01LnfmhbZ/F9/1gQA/Tr5v0A==
X-Gm-Message-State: AOJu0YwoTBRvgZBjOd7my0P+gGYNo+kZIZr+SZO8fXcw+6BLUG2jQ1ed
	iVwKEjz9EdBiP8CWlFlmAeF6ZyqWPMJze5IF9r5hrrWF49TMHW6Q
X-Google-Smtp-Source: AGHT+IEGIMF6jrdxS/In8NlkeaCvlqbPYXuxDzo7b2vkqDV6QtioedyCtz1EmFD+tAGLOVsHKUj0Ng==
X-Received: by 2002:a05:6402:1e94:b0:586:e6e3:ea18 with SMTP id 4fb4d7f45d1cf-5879f5a1b6bmr7392371a12.23.1720000233803;
        Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:33 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:18 +0200
Subject: [PATCH 05/10] clk: meson: s4: peripherals: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=807;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=N0gJOHgxfgNpyO7ny+dBVGTv1J0OImnbpHVOZH5V8Z8=;
 b=brXdgrZt/FFF/7aOoRwCjMcSneXj5ric9H9NFCiK+WzN1kYqNVkq0K4Ee43Qa1H6bBN27toOv
 2nHJ1WXyPk1DAD3OnpS5N4nhsoLAwIQpSJeEY+xoiRb9y0EMDFuiH3s
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 130c50554290..ba1d531fce4f 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3747,7 +3747,7 @@ static struct clk_regmap *const s4_periphs_clk_regmaps[] = {
 	&s4_adc_extclk_in_gate,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1


