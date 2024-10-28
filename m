Return-Path: <linux-arm-msm+bounces-36205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31409B3993
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 19:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8823281805
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 18:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15A71E0B7B;
	Mon, 28 Oct 2024 18:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8yGEmz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C21E008D;
	Mon, 28 Oct 2024 18:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141312; cv=none; b=Dw9q0b87wFgL72jCwuBZtO7FnYJsIOxuDSP94Gks3HQee71EdSQrv2aIy/B52bdvibYW9w4L+YDu5tMCfJ7DJWgdkW0mfjSVJLPGFruAHeptP/j3jQzOqlh59bLLRk9keGS7qn5mnxpP3Ih50CqmtKyjsmD182GxwqCJnGhzhLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141312; c=relaxed/simple;
	bh=7yCnSD/2GuSo3KNhazT7H6gIGvBqe4Cbts6U9Qd+Fg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8lSEnIVg2zKKJ8LbkqmftP/CXZywqogjsB8FO/2J4MtUyMjtrp5+yDk1FL1bMoT5nEGZHHc0m8pZn1OqJfsqza6j0MVLFCT5bejbbGZCxzkUUb5nhSkL8xO9dWbjnRv/xUp90uDavSu3+aUPV7dvEZf46Z+KmxcxAhCk8Q1D3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8yGEmz9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a99cc265e0aso719530666b.3;
        Mon, 28 Oct 2024 11:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730141309; x=1730746109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXXfTAEkam83QhXgigwp3Sp4eBqaqdCR04cbjsml3X4=;
        b=W8yGEmz9LgWONsXNJaiSNIPic8TINgDswiyzrE8WAEhs+QQbYcc09dpt7KVVy0twZk
         gK9lWAm8SgN9dQX2PEpSHKMpOCLrlKrKjnegvObo1icAY30MVbndBBZyXuUH71iHAx9a
         YyhFQr68thwwMA97wgWlgVGD8RJbI6uagBOeWumJn4X+mM0hXZZ6eff57lDvtZmsh290
         nMfX52zJYfes8Bq6vMCCENgziMewRNVT4+ft9rTQiNNPhgjiWLQzsxp+cQpzNjVY7nRm
         Hxm0Jr8qoaKCt3WW+1KgHlNWsR734ZLbmr67mhm5K0dz9NUqnasLKgwFIts+k2FUzcSw
         7afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141309; x=1730746109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXXfTAEkam83QhXgigwp3Sp4eBqaqdCR04cbjsml3X4=;
        b=Sz7vH0RfNOZTzySXuuYBZeJDkBjsEwpjXtDboZ74EtVT99oKtLkFO1MDjbSnoJPNR9
         FMpvKiUPzEVnMZ7d0/LWsaZsO+GnXz9MHXvzc6eDYc1qQ/cyahJ/Dxp2tafnV/GJxFOQ
         UTyPOQT7GRjCmmzq84Lub81ATJ4bNMUtMSfDYhG3JtO41kl0pQ/VhSGsHDKeupQDEL9V
         Oc8eoznU8BvW7HARjLKXZbjDyR3PmBlzeKbUGNoXtPlFxQAMGKedbqQrvpb+HdoF3ZZQ
         gpR5SUs4WA3BUwoLJFUDRPWNdNDvCfH/HA/i+0ws0gGs6qwEL2jZW5qhZgANDkCU+85a
         U9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJtMTEv+JHjJ5ZMquBSWcBQ8PAg8nPmlCJIgiuZAUBIMNCq9tvakwA49aFzs1v423qCBrZZso4tSRK6Gyl@vger.kernel.org, AJvYcCX8YDcOePkuohnUIJ3G5wlEaqVvb01ki0MwjS5sw2ZyO3YcyhsJrW2no61v28YQ832aQ/Vdqgo0sHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkE44LQG63gCQrj4H6ryyhh7vIEaIBxMOT0lhsm7SDqYwDCP3C
	lkBHR0oot58rQcCVTPyJ/KZ7Ms0RC68m3TOAyuNb4hzIoSQ+H9gETyuQ4g==
X-Google-Smtp-Source: AGHT+IGuGvnH3S2IwavGjjh3kYjtHwOl0iZ9ybgjficwGHEPIT7DcThmtudj7m8KEo7CQR/coYkVrw==
X-Received: by 2002:a17:907:6d23:b0:a99:4aa7:4d6f with SMTP id a640c23a62f3a-a9de5d6f211mr877704366b.12.1730141308878;
        Mon, 28 Oct 2024 11:48:28 -0700 (PDT)
Received: from [192.168.0.2] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1f029617sm397585166b.81.2024.10.28.11.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:48:28 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 28 Oct 2024 19:48:19 +0100
Subject: [PATCH v2 5/5] clk: qcom: dispcc-sm6115: remove alpha values from
 disp_cc_pll0_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-alpha-mode-cleanup-v2-5-9bc6d712bd76@gmail.com>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
In-Reply-To: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since both the 'alpha' and 'alpha_hi' members of the configuration is
initialized (the latter is implicitly) with zero values, the output
rate of the PLL will be the same whether alpha mode is enabled or not.

Remove the initialization of the alpha* members to make it clear that
the alpha mode is not required to get the desired output rate.

Despite that enabling alpha mode is not needed for the initial
configuration, the set_rate() op might require that it is enabled
already. In this particular case however, the clk_alpha_pll_set_rate()
function will get reset the ALPHA_EN bit when the PLL's rate changes,
so dropping 'alpha_en_mask' is safe.

No functional changes intended, compile tested only.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
  - add RB tag from Dmitry
  - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-5-55df8ed73645@gmail.com
---
 drivers/clk/qcom/dispcc-sm6115.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 939887f82ecc3da21a5f26168c3161aa8cfeb3cb..2b236d52b29fe72b8979da85c8bd4bfd1db54c0b 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -48,8 +48,6 @@ static const struct pll_vco spark_vco[] = {
 /* 768MHz configuration */
 static const struct alpha_pll_config disp_cc_pll0_config = {
 	.l = 0x28,
-	.alpha = 0x0,
-	.alpha_en_mask = BIT(24),
 	.vco_val = 0x2 << 20,
 	.vco_mask = GENMASK(21, 20),
 	.main_output_mask = BIT(0),

-- 
2.47.0


