Return-Path: <linux-arm-msm+bounces-73362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC1B552DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229CBAC4F80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA9432275E;
	Fri, 12 Sep 2025 15:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAEbFTKE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3352A322544
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689844; cv=none; b=I5XdCkT6CLfsTp6hkePM1TH0pQnGZC9hijFVX8j7No1j6JvNC3g1qbI14DvWpMyP0F6VB23xqSGxB+H4roXf9pTrKZizf1k7AY+1VzyQhadal1bRd6ZUgYQ4H7oscMkZ8QzIpIGIAa1S/2p/aU42oh8jNChp3pwSJcU2I7OT9sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689844; c=relaxed/simple;
	bh=6AaRzfJC4rwBpQMEKbO3OuuO8jZlJG6Q3ebKObOQ6ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASfr2QnbG1UhhpQMS9lXsE0gsI0Ju7TxMzpNnDUk5c3RvsxphCeZ5yBzv2hWICPbJoVUs/LQxEuK4rlwTO6E6R3paqtfc380i/Bv7N63u04cBHbxAd6hXDFxLuyEZMOHQWQ375eMTCRhXl+3ETI7+ocjMQ5z5rR/R4nF8Qj9c1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAEbFTKE; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d71bcab6fso18126977b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689842; x=1758294642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGwNZTJUDbb42i0I/DCBOpee9BSl0Ek2gmsDPeJY6Qk=;
        b=QAEbFTKE3Is1fpN4DN352x4/uB/fuDeyg8Xhor65IPIkwk0uDjgCQ6Jh2BYx/AUUod
         IeiEckAQTr5gy9kRRfDPj4lGzKnQkeqqGzlUcwj+oYonAfewd2XF4ogfR0xVk/OPy9C9
         LT7VwTO/Hjy/zj12qr0uZvdfyDnKbBcVMr6e16LVaDQXKbTRVn4bo8cpbVWFABid7tal
         Z38O30igG7fjNVVZjfWLpqSfCp4BiUwK0lX8sTxbecKmUdfZzFE+gm8f0YAthKTVlsXL
         fAqvi8tPKPs5u2+qlxNSyZlz9K4y6cZ/D3hlx2tT9AUjf0QMHYRwEeB5oepeHFRa+N7p
         dR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689842; x=1758294642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGwNZTJUDbb42i0I/DCBOpee9BSl0Ek2gmsDPeJY6Qk=;
        b=iaiGl4dLm/MlgpYbYYZRTHUF6NQkzO51+COqcjOT0LvjaGrMnqzR/+s/ey8inkN8Dd
         9++BL0E01zKtLZs51m17SYjyQB414KKJVwxpGXMfOPsp91FG4gGNZtYM3kCark3Nsovt
         z8W0LRu+rTSt08KafH5nhFBdUBPyhM4XfUO/jFbC7wL/sXpB+t614tOVnybVIac8jb+b
         C8q6o3RwLl1VudAH8avAemljZxe6FuGcZTIjqRxFiQvqM3FR5fh8gJt1eAKlNeheot4O
         AczlmblN2NMmJhonEai5Gk5cdB8ukFbS3VCO/UM0ndg7B8IR7knGYX89SSH4J2E9PuUK
         aW0Q==
X-Gm-Message-State: AOJu0YwHw5iHinb2ATiYJhc+oaW520J6eDP7SjKHtSSl/a5qhIf/IwuI
	xkCAxAcR9OlsRagdN3LjDbIwPx7H5gMlkHfvHZpO/XuFnYPd4ci2PWw1Kig5MQRvTZ9+LgGuzSs
	FfBGySNKo+w==
X-Gm-Gg: ASbGncvkh9t2bP72lF6er363SK6akGAN9rQb777+JTGWCzWH+QGV3hUiB6W277gve/3
	o3PzFe77bYqg/YeRovmUTzHc75qv++TiTNYmfk1NFZcv4y4l0ypj6UaSOvwqPTjEDbWN0cVfbUH
	diTBh3ns6kGzAafTOVqPJlflQymo6upjLwv6oGd8PaH5ZAtKjehetYg3e9CJ5t9zS7QssE6BG3Z
	XhpEyAH+9GKO/yNrns2fAtBofTbs85M10LkahzREaZ+WmHa1qB3Z4JkK+ryipHZ7FryOkFarjN5
	vv4o4eAPMTWJQ7+HyUUqtm8tW/Nagpw1e2hGRGT0mT0qlt9peWlEOD12jE8SJx79LJOl9h/DNJt
	8H5expaNQOSL54bt3vTTkArX5h0VdNYNsAR2AHuULSJPH
X-Google-Smtp-Source: AGHT+IGd4PoJfw4tH37hzUk6PYKHbfiAkto5gdK9xgc2f3TOFApwMRiD1EpUFg4A8D8xg0pKJaYxEg==
X-Received: by 2002:a05:690c:f93:b0:71f:efa8:5881 with SMTP id 00721157ae682-730652db42amr34340137b3.30.1757689841832;
        Fri, 12 Sep 2025 08:10:41 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:41 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 10/16] panic: Have tainted_mask as non-static
Date: Fri, 12 Sep 2025 18:08:49 +0300
Message-ID: <20250912150855.2901211-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tainted_mask is required for debugging the kernel, and needs to be
accessible for kmemdump into vmcoreinfo.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index d9c7cd09aeb9..048c33dab98a 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -54,7 +54,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 #endif /* CONFIG_SMP */
 
 int panic_on_oops = CONFIG_PANIC_ON_OOPS_VALUE;
-static unsigned long tainted_mask =
+unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
 static int pause_on_oops;
 static int pause_on_oops_flag;
-- 
2.43.0


