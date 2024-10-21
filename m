Return-Path: <linux-arm-msm+bounces-35282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29C9A9100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 22:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E225281C6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1E31FEFC6;
	Mon, 21 Oct 2024 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8sfM/6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E01FEFAB;
	Mon, 21 Oct 2024 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542155; cv=none; b=fUgsvQP/FbW9frm6RWiEUYZRRfN1oV/ZYBF05A+DiskHALc+p9KE8xVdh//nJX373f4QPUGrnX66lFEvPMgeWbXdjnYIgXqSytvvd+jrHC4OUDhm0WkvQxJfzVhSPSyM1k3ZXKvefTGxsyhkplSclotVz/asO+cRj32/A5VtDCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542155; c=relaxed/simple;
	bh=wO7xITuJG5GXJ1lJj5YlfqQ0jtSxwBCqgwT4iHS5WJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0orS6162KJj8hEkESmK7JSYsTuVCOPiA+nFhJra/zxTPAwIzFoXUK1bZS07GSJBgeXtlcagwvfhRV+R42LxKvHV5UYdPwqTr2LeQK+sP0hDtDAloP6OxsvFuTJ08VWLCZtp96fnBg0clv+spiNlF5FrZX6nXQAPpmgkmJejYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8sfM/6e; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c9428152c0so6596191a12.1;
        Mon, 21 Oct 2024 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542153; x=1730146953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2XXuDDlU++mbkCnQ0NL8s5PWg5702ny9VH8GeOe8rw=;
        b=N8sfM/6e+0fCDA2FKOU1jvM8xyNWKxkbtk+lqWzGVsRDYc5fxFHIVyrRC2GTSawY2D
         6VBbZKlUfpJxaRc33so1uBcVD1fnWJ+cEKEEjD+6uZzyaZXjGm5TRaCjWRsXJHGfkvMX
         JA0dmya0Sn/0mwS8w6nKlaQelieIrA0Ehk/bMW6o9R6TIZftxO/y6Mda/lqOkycDKVxr
         ESHFWw0cu31fxmr03OtU8jujqaJVqOwNoqFD3AiDKb4itrtrgYsvZ3mRHA4TsNb56QYQ
         wdUVwHkIHtb9tr+udGmi6d5lZ9y8KXUaa5WGcQCa6RTK+dY2Sj4KzTF0YNlUfb5BZdjX
         k6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542153; x=1730146953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2XXuDDlU++mbkCnQ0NL8s5PWg5702ny9VH8GeOe8rw=;
        b=cB3ZyecaQfPsEK8g+IDCWJ9XZqITRE7UwmSb9cGQn419BvTwZJZUHo6X0zGtIT34ee
         KVCrv0zq4tS1Lxo2gFUR+iIIWRP9RYbnKERAg1eYWroyq0DjLlpto2c3FBulI5uasiHO
         04D9963eSnWLVJ3Tf4C0korPOX0+D/AtOJDPpQgLe6pqWvI0jVnLja+vHEzGSMckN6P8
         LA3iPwmhxE1B4rtUc49BVldqeVUCSA2x3IRkKWtQODPkPL3bIuA1D20F/CoLwWzsOlc6
         j0RRzzJp3A/9Xl19B6S4XJyxYPaLvBYHpx2dSeyJj3r/pHvsUGEo4D8vpdo0AVA5rQ7+
         /XUw==
X-Forwarded-Encrypted: i=1; AJvYcCUk1gtZ8zMIjZ1j6xm/7gVp9MMrdYwlWSM0HRgtFcnxjUi1wkyE/lr2/h2Ego0fH5qqJoixnNXVv9o=@vger.kernel.org, AJvYcCW1rFB3EPcDqwxXRWpoQmwegeZqHUKR05YqQpJmPuja/ggd4OjF3M7MUZ0cjHybaZmksAxBHh83lAD7ms2U@vger.kernel.org
X-Gm-Message-State: AOJu0YxoENR0NbP9F4NCsTq1cqMnD7pGjiXKUmYtdTHJtiJkNFDi+B1o
	Vp+WDOb1wBI5+oZiGd0SjxYjeoxstXsiLMgMFps03sfP44b0IlJ5JlP8Kg4C
X-Google-Smtp-Source: AGHT+IGGholbNXi8gC7ySdmu4kronu+UcOm7cbOy2xMZoBdWIYhJZgg6hcsFOpGzCuqc2XqPs+Fhiw==
X-Received: by 2002:a05:6402:348a:b0:5c8:acf3:12c6 with SMTP id 4fb4d7f45d1cf-5ca0ac443c4mr10200596a12.6.1729542152658;
        Mon, 21 Oct 2024 13:22:32 -0700 (PDT)
Received: from redchief.lan (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a654b9sm2366497a12.34.2024.10.21.13.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:22:31 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 21 Oct 2024 22:22:00 +0200
Subject: [PATCH 4/5] clk: qcom: dispcc-qcm2290: remove alpha values from
 disp_cc_pll0_config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-alpha-mode-cleanup-v1-4-55df8ed73645@gmail.com>
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
 drivers/clk/qcom/dispcc-qcm2290.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 449ffea2295d3760f40abe8b1195e9022f46a9b0..d7bb1399e1022afc68e45ee335d615d4a5be5add 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -40,8 +40,6 @@ static const struct pll_vco spark_vco[] = {
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


