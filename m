Return-Path: <linux-arm-msm+bounces-63594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE76BAF842D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 01:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8D28189EC57
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911782E11BB;
	Thu,  3 Jul 2025 23:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i2B5hA6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6892E1C7A
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 23:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585012; cv=none; b=tH2DjOCAtljZL7powXmj0RQ8sYYPttMvOyjGANaYEgGcPIcifDapTCCbyF60QIV3qW0C4BkmhpDmvOpHyCEpDbnzPsz5AOMy7PFM+KcaTsD+EQiYd+HQroeMq2hsQxO+XuqZuyhlSdoT90jjG2L6rx+oq0hH8Xfg1FVP6ljIlOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585012; c=relaxed/simple;
	bh=MG6R6xLI8D2rCtfPyeozFwBeKwPJHUOoxhsT2UMyvnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1UNnpcC9SVTXurtvdAuw6kXUK1cjlcaqoZQX3qtXHHQXQcdQmQJYC4GzQyU8JG2ss4rLA4MKZjaDSYEj9r/WFZ9GMkBiyfUPL1claQSeqNON0p7i42blFZCC4wADOIF6TYjYfnNLKsmZ/rGu5lugJBHlNASjy0pyiE5UyoMKOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i2B5hA6f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zl8tqJGsXRRT241pfz1ME5G6IziLWcd0tIVkpvs50QQ=;
	b=i2B5hA6fKMHDbJ3APtXNAKBeY8pxRJY5KJrz2DAUM2NqeKSVmNKsCV5tSzokJaKuS3DldQ
	LrpqINv12IKPWBT7cizkH9kHmvFT2pyL/623Z3Y0t+rQlsJuUm02PMJn5+WZ7ACFQOAIvO
	ZmBUobc6u69ClZ1neVXxTlX3rl2SDKc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-C6k8M9f4OsaFO3h9NHwIGA-1; Thu, 03 Jul 2025 19:23:29 -0400
X-MC-Unique: C6k8M9f4OsaFO3h9NHwIGA-1
X-Mimecast-MFC-AGG-ID: C6k8M9f4OsaFO3h9NHwIGA_1751585008
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6face45b58dso3735956d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 16:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585008; x=1752189808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zl8tqJGsXRRT241pfz1ME5G6IziLWcd0tIVkpvs50QQ=;
        b=QeuM1M7nZNZZHtqKD+tB87+cmEzt2TSfj6F+v58b5D60HY63KmuFMCGcw8N0QWWRXO
         gZf6zokQLtscc2n3//xAO4N7Y24+lnMWtPj/odXzAxJ62ln0CWeT0GILOhDpzohdJsbW
         fDsEFWKD8Z742UW358tCT8ix/dZ2VUYzaojbtUykxWuOk9Q1neL37/naw9jUIxDWXQSb
         R1o2HsNcBfK60Xjyoox7LcxWwifi0Q8uIvf/Xzj4VQ9dnPRe6ITZPDQPTaS/v5hzOspZ
         JafrJ4mTGY+9EUh2kRT0uvKmNTbDZrzqglnwgCG+/9JDuiK6z633tmW9EYZ5Mq5mKJtI
         mIeg==
X-Forwarded-Encrypted: i=1; AJvYcCX5g7+9aM2HqXJydoVP1mOd7h7DqeyLSnxcT7RGz3XwpoW33P7sKv4ix+fXi/rwuWYsoL/bodHII3U2D6+7@vger.kernel.org
X-Gm-Message-State: AOJu0YyVRnoa7m1KLCnCTWOASEB1kSeN8oqHdBdUMyWsUXxLLj9lsEbj
	dlYce7MLlLbM6w+evSoSbPX6Wmu0IA4hFeXob5E9rfoAfSPXZVcLew+MBZDxqP5Z/RoLE2KHsWp
	aHrFv9OSPkE6Bm+z8IaKI2RVJv6ahxqgtSi4GJKjiT8oh89WgRln0LmUlNz1+fdRNRYw=
X-Gm-Gg: ASbGncvCLVjnann8Qiu3+t/5E0eEV1r9H4+M6Ank1NZ/kWEr9hq742n16E4HfR5YHHk
	SaX+CoVpmuZMaHUS6kJfNzayOy+5FQouJoqUXhC1BPa9GOts0YCpIq/jTWq/HMPE/lgFMQyu1UX
	TgMNqmJ5dPcxepZomAXcpKtOzZu1cGhE1NNposjul3jD55REZpqJSUeX04Ca0wa/T3dfSq7Ria9
	r7tSwhpRTKkIGtu8+zBB7shSX5UyrmhuFVULjAXz5WsbJLwFVfzcCMHJ03hXKIU5OC0+8gWUx8+
	quNKrVM0YJHbC5ws/5q7EOknriRBtFLXPuBRPsfkaKPmaX8t32M19qKM0ZsEXg==
X-Received: by 2002:a05:6214:202d:b0:6fd:74df:896 with SMTP id 6a1803df08f44-702c6d0108fmr3206486d6.3.1751585008550;
        Thu, 03 Jul 2025 16:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtEKstDD58UA9ynnp87TZzDRG0nHv8TZdipy2JJJ0KGfqawoV2yWwrMW4WiJnElhNazWCQfg==
X-Received: by 2002:a05:6214:202d:b0:6fd:74df:896 with SMTP id 6a1803df08f44-702c6d0108fmr3206086d6.3.1751585008137;
        Thu, 03 Jul 2025 16:23:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:33 -0400
Subject: [PATCH 09/10] clk: sunxi-ng: ccu_nkmp: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-9-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=2425;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MG6R6xLI8D2rCtfPyeozFwBeKwPJHUOoxhsT2UMyvnU=;
 b=gtIoYUrg7pKik5I/T79/xPlRf6FIf6RrEY9VaGQ5cG9HAHNGprjV14FnyjTOfqDKEtgskKdxi
 LMUL+S4rLZMAOnlypm4OupDw0dn6pZZJxEd6jy2V8Nc2541mBH3ukUS
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_nkmp.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index 6e03b69d402848b237154319d2296ffb4133a213..25efb5b3760759f2943737856246ce93000ebf05 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -127,20 +127,20 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nkmp_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	struct ccu_nkmp *nkmp = hw_to_ccu_nkmp(hw);
 	struct _ccu_nkmp _nkmp;
 
 	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nkmp->fixed_post_div;
+		req->rate *= nkmp->fixed_post_div;
 
-	if (nkmp->max_rate && rate > nkmp->max_rate) {
-		rate = nkmp->max_rate;
+	if (nkmp->max_rate && req->rate > nkmp->max_rate) {
+		req->rate = nkmp->max_rate;
 		if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nkmp->fixed_post_div;
-		return rate;
+			req->rate /= nkmp->fixed_post_div;
+		return 0;
 	}
 
 	_nkmp.min_n = nkmp->n.min ?: 1;
@@ -152,12 +152,13 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
 	_nkmp.min_p = 1;
 	_nkmp.max_p = nkmp->p.max ?: 1 << ((1 << nkmp->p.width) - 1);
 
-	rate = ccu_nkmp_find_best(*parent_rate, rate, &_nkmp);
+	req->rate = ccu_nkmp_find_best(req->best_parent_rate, req->rate,
+				       &_nkmp);
 
 	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate = rate / nkmp->fixed_post_div;
+		req->rate = req->rate / nkmp->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -227,7 +228,7 @@ const struct clk_ops ccu_nkmp_ops = {
 	.is_enabled	= ccu_nkmp_is_enabled,
 
 	.recalc_rate	= ccu_nkmp_recalc_rate,
-	.round_rate	= ccu_nkmp_round_rate,
+	.determine_rate = ccu_nkmp_determine_rate,
 	.set_rate	= ccu_nkmp_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nkmp_ops, "SUNXI_CCU");

-- 
2.50.0


