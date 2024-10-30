Return-Path: <linux-arm-msm+bounces-36485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C59B6C64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 19:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46E84B2188A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0211CF7B6;
	Wed, 30 Oct 2024 18:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKFTrraI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC191CEEA3;
	Wed, 30 Oct 2024 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730314670; cv=none; b=C2eJb+uF2jVIbA7psGTu9oeiiZ5AGiKi1yVMrXPikSN9p2qVbDcgvzcqo2k3hTgoSqBrEQlUTHP6IQKqOW5HnRq3M+6SOPimbSub4+KzuMnaSfpD/uKKkff8cSsVIatHkWjA9stMQMXKhDxwfyoVdoxhaeK0854E9hpmig2q1sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730314670; c=relaxed/simple;
	bh=8W/QDRI/pFgdFr7Ezxc1BasTCKDzA984KK3I+7s0VLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQ1zAxVShUkwfI06n5CAzj50vbmNJARCVyk1W+4LAUrayzY6tC5MlK8MOwUDr7CcMoUg3MHb8HNTvqYABs/upDHXkej4Uyn9Z976Y8igHhOeIoU/lDed3Qx7DabAxuIk8T3OjGHL5LL3YgjwTIllXqGQHtulZh3YsRu2PWHy4VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKFTrraI; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c94a7239cfso132384a12.3;
        Wed, 30 Oct 2024 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730314667; x=1730919467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdlYOoP7yqq2P4oaMQxpOvCFQMzIToOeYQLgC0CJZyo=;
        b=KKFTrraI+dV8RCSrc/qLyrxYQWLNJ8aCf0wJaFte+jbCQWyFwY65AKMz+tTYrymU5Z
         q6HbwcuGryib4AqFplJdd0mjqHiclgOnDrdMMhcCUtxsXo5TmfG4j9fRjzZZQF+mhIe3
         xlYuHbmH6EZWLyxshmVtEmE/dQ4oQ5a4cm1A2THeUUJmIgwahhdXcGxiL4SWDkyAfc+f
         AfceYgIlQjI0Y55RUJwNf/7QmaKSfiJ0eVMWNsKQsujgFtAk8O6w44RUKFegZNp9HZKY
         kAnP3qKl1lHDa262g8TvzJ3E6k722C2jEQjxpNWL7XSfJGtHpBY2B+VJ+34M5zdWfHqS
         NzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730314667; x=1730919467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdlYOoP7yqq2P4oaMQxpOvCFQMzIToOeYQLgC0CJZyo=;
        b=qs1GYQZe0QdszRq8Mqc4v9a9IC8hs6mGzLSJYF8cq67HcwB8raLLlJxN9GFHZt4cuc
         R1hTkG6Z2N/7/HNtTzMKsKhtGHtQSJtpan8F3thnQrH1xhNAR/MENP5AMJ/T8p1PaYoW
         /ZsSv3tA2zf3ZagRTp24duTKIpBxuMy/3zP0SOi1+9pdiJACcgqScz/f/aP1/FiX/H3Z
         lhXrJWA3m/Ihx9ojGMvye6rfC5MVSmTHhLCZetbiarnRmlLz+1B3y8hbeFR3njKmSa1R
         ZYqT9oCrQ/ubSVNxOwEfQmdVCxJXCN8MdHJ6AzNmjwjajIBHRySeGL0GvFH/ZFruRwBw
         MGAg==
X-Forwarded-Encrypted: i=1; AJvYcCWzhPm5+PhOp4joDRBTLMP+ThVHAxG9MxE8OUohLa48vh97DHFPaJiO8qox6jeOEOBWSvAlSMUPwvOw1iif@vger.kernel.org, AJvYcCXRedQqM8EX8ih+ojkohEWEdLKJ//fKB9NADdZxJSHjjp+4YCOlAKyUk9I4RRqhTbwaY0mhj4mW4eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuBrGvrReYAN9IQW4q2olSzdCrUP4hM+W0YRnk+A+yt3rYpplk
	efGkXKAB4byn9IkPDyzmKN8IQpz+09v4ssh4yDTDhfsF/L9ef7KoRgi2Ew==
X-Google-Smtp-Source: AGHT+IH+Amb+N98Twp+vREgoZ6+xDRqrsrCdorc3RqQEtxrInbzNmNAzrXM8mztj3QOX/Ubkz1nAEw==
X-Received: by 2002:a05:6402:1f8f:b0:5c8:8290:47bf with SMTP id 4fb4d7f45d1cf-5cbbf8dec00mr15327907a12.21.1730314666404;
        Wed, 30 Oct 2024 11:57:46 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c20dasm4970447a12.46.2024.10.30.11.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:57:45 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 30 Oct 2024 21:57:37 +0300
Subject: [PATCH v8 1/3] clk: qcom: clk-rcg2: document calc_rate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-starqltechn_integration_upstream-v8-1-40f8d5e47062@gmail.com>
References: <20241030-starqltechn_integration_upstream-v8-0-40f8d5e47062@gmail.com>
In-Reply-To: <20241030-starqltechn_integration_upstream-v8-0-40f8d5e47062@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730314661; l=1308;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=8W/QDRI/pFgdFr7Ezxc1BasTCKDzA984KK3I+7s0VLA=;
 b=T4T5W4sJ8sROTHoLDLU8t05+7vbsg7c+PcrQxk5/Fr1JMPN11PLF26EykR2erfK9uOdv3h4cJ
 XAlrLE+27gABV95WkSE4jVOXSRLxd7hyYiG/WNCX3NEI3Md+0JjMiu0
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Update calc_rate docs to reflect, that pre_div
is not pure divisor, but a register value, and requires conversion.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- format kernel-doc
- test with scripts/kernel-doc
---
 drivers/clk/qcom/clk-rcg2.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f00..b403e4d6dcdd 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -148,12 +148,21 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
 	return update_config(rcg);
 }
 
-/*
- * Calculate m/n:d rate
+/**
+ * calc_rate() - Calculate rate based on m/n:d values
+ *
+ * @rate: Parent rate.
+ * @m: Multiplier.
+ * @n: Divisor.
+ * @mode: Use zero to ignore m/n calculation.
+ * @hid_div: Pre divisor register value. Pre divisor value
+ *                  relates to hid_div as pre_div = (hid_div + 1) / 2.
+ *
+ * Return calculated rate according to formula:
  *
  *          parent_rate     m
  *   rate = ----------- x  ---
- *            hid_div       n
+ *            pre_div       n
  */
 static unsigned long
 calc_rate(unsigned long rate, u32 m, u32 n, u32 mode, u32 hid_div)

-- 
2.39.2


