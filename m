Return-Path: <linux-arm-msm+bounces-88145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2D1D06471
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 22:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90B5230AB24D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 21:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F67933A71C;
	Thu,  8 Jan 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gtlTBoya";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vm9k8qj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654833AD95
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907115; cv=none; b=Sg56Dnd3XbqyVDTmEu4PJ+JYQi9v8IzPiyBhA14m0ZCHrWnppvLlxPRW4FMjWmaNWN8z71qkK2FxC0UCRr46sN8eYVUnSStLbo7wJiOig8G2yAlNici+PmHvkanpuA765as+LavZfIlRuim8Y9KAtZIk1Zuhgnxgat/VFaxZeu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907115; c=relaxed/simple;
	bh=du1Xe6+sJ/9FCDiGI+GnbfUkgLY8U1mL73/oBpGj0IA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLASOxku+CdW+YKwZ4BSI044OOe6bGOTJJT3IlvTd8zERwYTuZeFMLHKHTykf5qu2M5u6QrjU5wL4Havw87dIrWpx8yODv7W4MTnSq0yvUqFQQTc+QkkplJsg0HRVLfeDjf0RE6TTG1l16OoaxxTiPVSgCZi8/S0Hi4HzcBDVd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gtlTBoya; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vm9k8qj1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kyENCUC06yLwn97ZLVCAPwAscKa4jHnikLex8sZo8gQ=;
	b=gtlTBoya1hM2kfVZdddTVsQFzbLBpia3IDLiAv5h3HkLeZ8CTkRfpABerTJH7/pPk3APBp
	GeEkCfUYWQW2v9Fj9RpaURICBiKCHYNBHtU+un6d1stC8ao/eIkDXUkH+HBkrI8O0gFNH/
	TjwBYASmCApqFBq7w0NrIQZgQyJfgBA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-fMsji-BuPw25XcYCvAFNjw-1; Thu, 08 Jan 2026 16:18:27 -0500
X-MC-Unique: fMsji-BuPw25XcYCvAFNjw-1
X-Mimecast-MFC-AGG-ID: fMsji-BuPw25XcYCvAFNjw_1767907106
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94128f1b13fso4472720241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907106; x=1768511906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyENCUC06yLwn97ZLVCAPwAscKa4jHnikLex8sZo8gQ=;
        b=Vm9k8qj1yzFFn2p1L0tyGsoJpXFxngpWSYs8ftaM7wfVbynpSlCsNIueseszDWq47j
         PzMCj/KsHd7ULcslRRDcI9hz9UEGVJ8e/wdiPYtGZu3AMIXv6edTGZr6p2DeYXlH2PvJ
         Q91UVGT7e9nLixm+zcN+M6yAL0ynYlC+TQYZMFdYJAVc7r62xLvj8qOB9QhYxfuHIQH5
         a7WURTXZHH536IKrli6RKX/qBm45x9d48VAN0sn0PjySfOP564aQQ3rsyX/Uy5o0Cf0H
         E4Rnc+khbXz9b2SxyzNQXQ0bshnPk/4QXoAeIKe7OVjQoCy3BFDojx5EwUQogxb+hAIq
         m3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907106; x=1768511906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kyENCUC06yLwn97ZLVCAPwAscKa4jHnikLex8sZo8gQ=;
        b=dCikSzsi4M1u0j22RityR6IV4qfsVw17SFruipdNyrvsSJIurT6vEsUcMj5uKVetoV
         +mX85/gaQEy5/ROwsoGnSfqwf+c6W8HjvyjN0KvEVUOntUE3PQaMwjVLHo97VMzi8IpJ
         wMmJZSZ7yxiWCoYZApB66KFxeyKM9dZDfjkv3h8CSSs2Hkh7zcLXNqduQQJH9/FfYHVy
         lLNJNDYMEIXK4zRX8th0fE4r9J5CIn04W79+EZLQE0FVCV9vOULFobgHdZKeVwf2EzZa
         6W8vHOHetsbssWQxtwfzjRdeuRFMDcHf58G0mSQg9PHWpchI1gHXLTCv8uXMhnscqjP0
         HnBw==
X-Forwarded-Encrypted: i=1; AJvYcCUNA4bKSp3rmVkkG9skkXYLmXOnLn6o/0kw6zcvmrPh6pnmAiw77OUYy6fjGEFoINHp7NsAoLSzJ+oCzhHj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz68iS3UYCuZr/EJ+swPL0wJIsl+QOVnGHsSI+9BcOBwwtW9i9f
	2OjtR3u0dmwg7K7x5OSCcnGaXveIgCCg2UUjAQl9RO8upwMGDGxK5lpB7h4jZr2xmRKW65MKfDV
	0Q0ZvI+u9/rhpdj24Hhj/gq+JbqwUmgOg4Eq77zsCrx/okQHcCydBSzUl0GwV95UU7YE=
X-Gm-Gg: AY/fxX5JSW793cEaAjNXZX9DgLtealcVeSTKNICV9BozuII+etv11VoXBQtA/1jk72r
	c1GGy2z8232EUuuDzLrZJOWvN1d8DYhv1W9y01cWoCsqvs2EjHrjNxJJ0l1D4fiazYFms2ppCmp
	hIKltMrYKWkOUUEOEONayuZofsI1wwiRSqppzH2WIQroFg7q8kIxxL+2OHGZJKTbz38Y0/96l4f
	LLpb1AvDo5aSOdjE/YwSm55OlA6YQwLFt2nRTNlU9BOdCcI/9HUuSfrt7+GVvadzRYIYAE9X0PS
	laYsviV4zMBQM9Svd4cOiEf3bWMR7k06u5yQLTJLVoGAQNbnbidnXAZMUaNL78PILcxQqxnfHJ3
	01YdBjiqtWV6flVA=
X-Received: by 2002:a67:e716:0:b0:5de:8ce:3cb0 with SMTP id ada2fe7eead31-5ecb5cbb301mr3229161137.1.1767907106532;
        Thu, 08 Jan 2026 13:18:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA0Kg6G5fUNtSpWfcuvqTzw14WB2ReMmWmnvR2nyyJ8lxMnn7KB1EFTL1i/rv/Ooq/958J5g==
X-Received: by 2002:a67:e716:0:b0:5de:8ce:3cb0 with SMTP id ada2fe7eead31-5ecb5cbb301mr3229140137.1.1767907104694;
        Thu, 08 Jan 2026 13:18:24 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:24 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:33 -0500
Subject: [PATCH 15/27] clk: qcom: regmap-divider: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=du1Xe6+sJ/9FCDiGI+GnbfUkgLY8U1mL73/oBpGj0IA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HY4BJo1e2jdZnjzY7pI7sN2ny8hr0SUK3mFTk49U
 2zL6XS2o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgInsncDwP3pZCM8Chy0Kuvee
 dUycGPbjzeq3OxRO1tqf/jrFbadbQhMjQ0fV5YNHT58ze6uuwNpQb/LoQGmFvURo9M2CBn+hNxG
 uzAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_ro_round_rate() function is now deprecated, so let's migrate
to divider_ro_determine_rate() instead so that this deprecated API can
be removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/clk/qcom/clk-regmap-divider.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index 4f5395f0ab6d0ed8cebbb32cc231063932ba85a1..af9c01dd785372166122224e717c119a2365f4e1 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -26,12 +26,8 @@ static int div_ro_determine_rate(struct clk_hw *hw,
 	val >>= divider->shift;
 	val &= BIT(divider->width) - 1;
 
-	req->rate = divider_ro_round_rate(hw, req->rate,
-					  &req->best_parent_rate, NULL,
-					  divider->width,
-					  CLK_DIVIDER_ROUND_CLOSEST, val);
-
-	return 0;
+	return divider_ro_determine_rate(hw, req, NULL, divider->width,
+					 CLK_DIVIDER_ROUND_CLOSEST, val);
 }
 
 static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)

-- 
2.52.0


