Return-Path: <linux-arm-msm+bounces-36201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A048F9B3988
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 19:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498A81F22E4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 18:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5A81DFDB2;
	Mon, 28 Oct 2024 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJ03qTEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A447718C333;
	Mon, 28 Oct 2024 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141307; cv=none; b=Bv6IBdQ0rfLvP3Vr2K0uHKfaU10GJcHDv9aiiz0M6FAADc10eeBNvLEWChHqQ5o/Mgmbw51AHDER/L/8lNWYos1x4S8OW5BYBAVFdLf+Us/JqAI4Aq8bsHeNzCIhQR9GlykeCn1Q5VALgLp+QP3z1r72ERqtdulPOwcm7qPxy2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141307; c=relaxed/simple;
	bh=wZLVeHunQ9dJsgdquHVUPhJkc/woD7Y+33ssUq+Ml3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNj4tmP+G9KJe0KzP8KA4ConHiQeVgatvwtXHSI48YkjwCXuClhGcfUC69sPu9dOvRLsZtzNq9wQL4Cb2R5apvgJ31psTL1c6yb1otC47KIcgQQJnNhTISuDjygrGj6siS8pVeXMusb3RUi1pYA2lf5Z+WcfMehCk0ykY1XjoEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJ03qTEJ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cbb0900c86so3726618a12.0;
        Mon, 28 Oct 2024 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730141304; x=1730746104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lyVZZQvsRXJg47YjpFjAC0Jg41UFgIBO25Gj/6D5U4=;
        b=EJ03qTEJjT/zmeS/ebVg+KCJLKkFLGyYvFCjR5ZwbEqAmcLLEA/feYuYsXlh8rGQK3
         PfzojPWQMYhpICitT1JjBsn3orrNyqwnzTzVEQIMmz6YOXSsS4tgjpJmInXTAoBsKWSD
         LP7jhJHLydTI1nlH9RhfGzia01MAP8FvyWqBjGQ83qAnAVWxXca+mpLE12qSjBa30gF8
         PcZtquEXiWdkiYlb0bpLuDmwBs8+nat0aks8F4GO1s+A7UBJxxi8WlORpfo0RoqebzQB
         oB8LRLaqrtLoN1g5UfWdu117+7msNo/9gPtdqIVxCV4uvcAFWipHQuNdrkQRqWerC2NT
         JStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141304; x=1730746104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lyVZZQvsRXJg47YjpFjAC0Jg41UFgIBO25Gj/6D5U4=;
        b=SPsASlfWqT9NhMQ7vBaKpuDj0CjU+ri9nzTFgWSQ8Ee28hD0ifQw1s1IVJMrG1Zv8j
         q2GHXRtivjMEvPJG9Vq33OrLhCU6E0Oz5s4VmLExsb4rG6AQyTORhqR4hs9Ay4B2E0mF
         9UyUiastammf43/CCRN2IHS8+bp2LrOhrOoBcbnxiz6KiUAuuk11/gh/gB6Dm/PD1obO
         LZ2JNkGJOaD6O3pZa7uUR1xGEPYLuyzCrJeYBFSX/0x6XmaVCGDljACmw7B9IIY9Hmiq
         21/PcC0lD7kQuOC5EuONYkxoXwbz0LaB6qSIETlD6GR0SYkg1S6tzn5hrr/78pBrZMsb
         atdA==
X-Forwarded-Encrypted: i=1; AJvYcCUds0Zg5tYRfX1oeleg7aMjCTYwE9sFzAsBkEi/oBW0mgw0IArCEOymbfkZLkq7ZSr6p3aodhilS4M=@vger.kernel.org, AJvYcCWmh9giFkoSRVecEnJQ1x1yEgBpU8gq+a0Aete5bADOCuIj6/NZCHr5TMmm99tw9Qn/PQZ/+70KCTUg8VFO@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWaLBdd7glfn5XQL5Vw5U8MwWnoLYr1GzOvzjEcHI1hGrWB54
	vWf1/6bbsz4EMTPh3Lo6nJNYkYtrYKMO4kMMTgEQbo2GRULEfYQZdX+23Q==
X-Google-Smtp-Source: AGHT+IH9e+K88V08b5r7guPqVP/9VmKvjlWqm98/H7ACquxAyI37SX3lLxRp50uQIbH7tbpHUd78mQ==
X-Received: by 2002:a17:907:7e8e:b0:a99:e939:d69e with SMTP id a640c23a62f3a-a9de61d1a8cmr686281566b.51.1730141303768;
        Mon, 28 Oct 2024 11:48:23 -0700 (PDT)
Received: from [192.168.0.2] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1f029617sm397585166b.81.2024.10.28.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:48:23 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Oct 2024 19:48:15 +0100
Subject: [PATCH v2 1/5] clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from
 IPQ5018 PLL config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-alpha-mode-cleanup-v2-1-9bc6d712bd76@gmail.com>
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
those will be initialized with zero values  implicitly. By using zero
alpha values, the output rate of the PLL will be the same whether
alpha mode is enabled or not.

Remove the superfluous initialization of the 'alpha_en_mask' member
to make it clear that enabling alpha mode is not required to get the
desired output rate.

Despite that enabling alpha mode is not needed for the initial
configuration, the set_rate() op might require that it is enabled
already. In this particular case however, the
clk_alpha_pll_stromer_set_rate() function will get reset the
ALPHA_EN bit when the PLL's rate changes, so dropping 'alpha_en_mask'
is safe.

No functional changes, the initial rate of the PLL is the same both
before and after the patch.

Tested on TP-Link Archer AX55 v1 (IPQ5018).

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
  - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-1-55df8ed73645@gmail.com
---
 drivers/clk/qcom/apss-ipq-pll.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
index e8632db2c542806e9527a22b54fe169e3e398a7a..dec2a5019cc77bf60142a86453883e336afc860f 100644
--- a/drivers/clk/qcom/apss-ipq-pll.c
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -73,7 +73,6 @@ static const struct alpha_pll_config ipq5018_pll_config = {
 	.main_output_mask = BIT(0),
 	.aux_output_mask = BIT(1),
 	.early_output_mask = BIT(3),
-	.alpha_en_mask = BIT(24),
 	.status_val = 0x3,
 	.status_mask = GENMASK(10, 8),
 	.lock_det = BIT(2),

-- 
2.47.0


