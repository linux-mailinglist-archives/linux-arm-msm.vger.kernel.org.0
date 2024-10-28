Return-Path: <linux-arm-msm+bounces-36202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B78C9B398B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 19:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC86DB216E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 18:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1CD1E008B;
	Mon, 28 Oct 2024 18:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lewgeHeq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DC71DFE13;
	Mon, 28 Oct 2024 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141310; cv=none; b=c7zHr3A10K4550MO937SaBm64ipWvwx2J5GbVhGeDeCephTqxwduoCY7q/0DuGs1nbX/7n5g8A63e+h1CWP2kjHBjAaxp8TMRRL6xRq5naH2mgiU2EwjMaB2esUE0KLTisG/Af7XvO5pqtQ3N7qaqE7nfVm32HH0rdITCJaSwW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141310; c=relaxed/simple;
	bh=Bc6r+NncPoReD4r5h4VypBRYmiGXN3f3EsIGE6RHtRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RUqmH+DS2qQU4K0Fo0RcSiKR7DYfeiNvpwMZ6V0L0KrXSW6PtWC2DP4OvNzOTmhFjG9uaHng10eGaxAy0sig60+C3nYEQA2f7dsytixO3vlBubMVvqkVRMNx9aJc6+FpXNq52XXrLn+dt5zKzsLaULbBwKTTV0o0u4eSvn2KgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lewgeHeq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so5955325a12.0;
        Mon, 28 Oct 2024 11:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730141305; x=1730746105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThqSmsGvu8DQRNRTmh8NRaZWskBUyhvYPLVqXS2yzxQ=;
        b=lewgeHeqetDACwFpNb/O+Ojmbq7AknFsxTckdx8+zWYE1Ec6RNMXcHp70tAGTPbCdQ
         JrZRLvG1BM69OkMa6l0fNliuy9GoZmkcT8TwgDwd7CA7iJ6pHsHZUOizLEFxjFS5nzkZ
         la/X4P8TtRTazexHED2uyAHG9Fksd9vlk6AB9NdMM/QtNG3ahqXNTXMTX7xWJhxZ21zF
         IpOK/mG4Y6IdZpIQmGjPeS9o6ZCIn0Rax88c20Ks85xCjtOeiZzZqAWN+AguM6+mcBI2
         AuUozHLBTndFvGx6KTMYFgE8rGQ6iG9G2BCKdi1sbt9c7sEUo5w+0ZP7Y3GS5jYidbjs
         JorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141305; x=1730746105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThqSmsGvu8DQRNRTmh8NRaZWskBUyhvYPLVqXS2yzxQ=;
        b=JPi61+on71KO7cLHwZWKUHzVCUBbKVRvtP41qiptT7zEFbHFeFs70XR1TzDvSTzhLG
         utHP022HbO2V3of4mZwqiEexNgzPymwfTLr/AKEWES+rfd4YH9bP4mn4hpLA05Tfwepx
         +th8OrTCcDOkvO5GQr2Q0Zq6hUjZRA743+LUseGfeMQn/1mGKvkscTU/rAqhZpeUlSSJ
         ahy5K6bB58lshTfk31fTT60FIuY+hnijkhtvUJXOoCTVxQV/Fb/swOHeUCIzhTn6i4aU
         2+8/M8GvZrNRXLi7PTryQAxw1E9duf0QBp8Kbkl7EqHogv2RtzewuRB4VP/SAI6uMFSU
         BE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLTtowAxlwJj24a+PiUQb7ffPRJH6KBUyJUMGXvXwPsUIHP1TRdw65x5Cdx80Qp+fVuC+rj0GK1l0=@vger.kernel.org, AJvYcCXJygLXJXtOlB2yQqGsI/Yf+bI9WSFjEFyN6xUsw8g/szrfJs1B7iCuipaZeR1q4mYIYjV9grX0QxxEVH15@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVPmPnnmgQzpcJP+8UCbzKGFI/jzUO8A3dgirwood6rmoFnFO
	uRqD9ibv4UUcFbuvN3RJwQQoUTnJDUysFB5UsPviEi0awiUvKtrHmcO1hQ==
X-Google-Smtp-Source: AGHT+IECr+9CX0Ix+JZuvZG+xwLIhqaBFb5T2Pyng6mgve6qUhZBQyuSvI98yJT+zfpZUWi9sRRZCA==
X-Received: by 2002:a17:907:7245:b0:a99:f8e2:edec with SMTP id a640c23a62f3a-a9de5d6f21cmr996733966b.21.1730141305387;
        Mon, 28 Oct 2024 11:48:25 -0700 (PDT)
Received: from [192.168.0.2] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1f029617sm397585166b.81.2024.10.28.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:48:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Oct 2024 19:48:16 +0100
Subject: [PATCH v2 2/5] clk: qcom: apps-ipq-pll: drop 'alpha_en_mask' from
 IPQ5332 PLL config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-alpha-mode-cleanup-v2-2-9bc6d712bd76@gmail.com>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
In-Reply-To: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
those will be initialized with zero values implicitly. By using zero
alpha values, the output rate of the PLL will be the same whether
alpha mode is enabled or not.

Remove the superfluous initialization of the 'alpha_en_mask' member
to make it clear that enabling alpha mode is not required to get the
desired output rate.

Despite that enabling alpha mode is not needed for the initial
configuration, the set_rate() op might require that it is enabled
already. In this particular case however, the
clk_alpha_pll_stromer_plus_set_rate() function will get reset the
ALPHA_EN bit when the PLL's rate changes, so dropping 'alpha_en_mask'
is safe.

While at it, also add a comment to indicate the frequency the PLL
runs at with the current configuration.

No functional changes, the initial rate of the PLL is the same both
before and after the patch.

Tested on Xiaomi Router BE3600 2.5G (IPQ5312, out-of-tree board).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
  - add RB tag from Dmitry
  - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-2-55df8ed73645@gmail.com
---
 drivers/clk/qcom/apss-ipq-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index dec2a5019cc77bf60142a86453883e336afc860f..d6c1aea7e9e1e50a8d7561ce352feac4e76fb1e3 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -79,13 +79,13 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.test_ctl_hi_val = 0x00400003,
 };
 
+/* 1.080 GHz configuration */
 static const struct alpha_pll_config ipq5332_pll_config = {
 	.l = 0x2d,
 	.config_ctl_val = 0x4001075b,
 	.main_output_mask = BIT(0),
 	.aux_output_mask = BIT(1),
 	.early_output_mask = BIT(3),
-	.alpha_en_mask = BIT(24),
 	.status_val = 0x3,
 	.status_mask = GENMASK(10, 8),
 	.lock_det = BIT(2),

-- 
2.47.0


