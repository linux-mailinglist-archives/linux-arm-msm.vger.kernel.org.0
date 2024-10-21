Return-Path: <linux-arm-msm+bounces-35283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCA9A9103
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 22:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A87CB281CFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7E01FEFDA;
	Mon, 21 Oct 2024 20:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeYFDrli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E6E1FEFCA;
	Mon, 21 Oct 2024 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542158; cv=none; b=QYBqaaj/spJD4pL6F7EQADMEf0eTiPcf+i8ucxrNg2o2CYZ98nOoFz9FrgbZY2d6m39jMk0R0TLTtkdwopkh1XiU0CKUHwLJAN7ACZK46bO7OL8YMgi0DgAlr3bTL7mF8EU28vp5R1KTlaCebHgza+6+g6lelLq8BGTcWYJ8JGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542158; c=relaxed/simple;
	bh=HyV1HYjLScohBPh/00tXVNyLUDdbtA9AN5TFXZThMhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVHKtk4yGyKwyP6XCqRJC2azq9dEymQXdbPaFDUFQ9RsLClwh/rlhxTNfpK41Ce2DwRNAQlaV/k4nZ0WL39Kwd2i6gpgID/KY+SICh/ldRb+FYIugfrEsjX3SjMImTzWs+3TYBenZ9Df+TlP9W8GWguEolhxbDgYEYolqg/hooc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeYFDrli; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so6336892a12.2;
        Mon, 21 Oct 2024 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542155; x=1730146955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOH2Pc3KFq6bBPSNxl1UY5bFlP+4ex8kBkOOMJO1alA=;
        b=YeYFDrliZbN03suyA6hFIZfuKvKwMefZxGYT4XOcYEYMUTSMh124/MGcrwOC72vpXb
         nEVybIzGFk9BrL86smcxCRpB5W7OqJAtE/mebDjNg+HvuhiXn98lePkwsRDEnZULsacd
         Af6Ce6+tahDHgfoKwpzT+1EkNk1RZPGzyUk3ZpbdOhJ/L5p+385EayAM72C+Q8x0i094
         wUoDJviF/8NVDe4azftBzv+VBW8g/AdouQuqKYQgqvKtv1eAWAuYL//Tjofal4zK5UQG
         Bef9c0Y2AZYrW+tl0BuCgebwUnmFHaoTXB9h0ae4uh6Zemi0oSRTV3AsAGlSeH+DedL8
         mpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542155; x=1730146955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOH2Pc3KFq6bBPSNxl1UY5bFlP+4ex8kBkOOMJO1alA=;
        b=NtFkunYgskQC/51YofGsj41mHTo19zqv4g5h1r5AnasEu0C5d/OX0snSceUpy25Zap
         mCeKhOqnBok4f939v2CzIFv0kDCoTs/6VtE5auJLZTnnUda2/nbslN5DSNhyKUwaaNdu
         D0YrrFFEWZfnt3q7zlyqmCPvgEofL2Adjro4aYIDtDu+SZYSURgg3IJDOase8Twsb02q
         xOYXPtwdJBKHP0WD9VF7G4OpMODJZ8Jx3AD0xq5BO62skw4P5hLFml6MroopLVZGXDfl
         zpwk/ygvZFtp1+tw+jk3m94kWXcCGjbIffaQpKBhm/4HKZDYGw8h1SqI4ROsbaUqL+gf
         KYMA==
X-Forwarded-Encrypted: i=1; AJvYcCVd1+ZcI1XsFQDC32WpBf6Z6Fy5/sfii4h1hW8SOMuRIBFpNBpR9g5ACr3fpz1+4VEjquPTZ268Onc=@vger.kernel.org, AJvYcCXxD1Zbe4m+HYQf9WIeJuQjOjK+YAm5A7EnTbxhG3Oaom0vGCgI8WgCOqFbXcGW6E4ch/go3RFAbzqorXFe@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8zBgkgeXP+VsuNEBeGsSPVUe+o7SQP9K+IFIC8AFGRZOX6P9
	XBGia19c8WX8HxdChv+gVUm0yEuw2OTOMZadoWINzrE/PcGfFNNQ
X-Google-Smtp-Source: AGHT+IF5kt879pJePv1sjlS0MWuWVkzkaD51mNxZdPgCprUZvqL6g2itNlj14yh5sSwjvn4NlY8lmA==
X-Received: by 2002:a05:6402:4310:b0:5c9:3389:bdc3 with SMTP id 4fb4d7f45d1cf-5cb7fc696e8mr167311a12.0.1729542154501;
        Mon, 21 Oct 2024 13:22:34 -0700 (PDT)
Received: from redchief.lan (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a654b9sm2366497a12.34.2024.10.21.13.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:22:34 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 21 Oct 2024 22:22:01 +0200
Subject: [PATCH 5/5] clk: qcom: dispcc-sm6115: remove alpha values from
 disp_cc_pll0_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-alpha-mode-cleanup-v1-5-55df8ed73645@gmail.com>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
In-Reply-To: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since both the 'alpha' and 'alpha_hi' members of the configuration is
initialized (the latter is implicitly) with zero values, the output
rate of the PLL will be the same whether alpha mode is enabled or not.

Remove the initialization of the alpha* members to make it clear that
the alpha mode is not required to get the desired output rate.

No functional changes intended, compile tested only.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
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


