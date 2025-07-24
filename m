Return-Path: <linux-arm-msm+bounces-66565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE15B10C7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12E6AC1BBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751462E7F3A;
	Thu, 24 Jul 2025 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKo7RQFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B092E62BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365399; cv=none; b=teswZfcSBT58v2EBBUZ2kJjShth6UDv5xEsuPYSMAwISdbv+Lk674VKWTxhionjaO0n39raN4xcDsxiY6WM7e+OcT6L8xOo6Y/lwKDM5nLff7jqY+aQt+EdIVM0kHIPHujXriyiiP0wB6BeifbKjjAx7x0J3FGO3lQxHlzniROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365399; c=relaxed/simple;
	bh=Zu6zHICMsbDr9iEKVVQXs5NvRmjCVnu1EFLIYvz+qoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZQ1q7YHO0HKjTejnRBs/eTevJV6VvgMmXzqK1JHVpFRUnqwEAIW/KwrL8VOEqUF9EPOl8K1gXAQyk05XQFTgbeR8vhYQ7jEY8jePYPLOtjhrysg0L8+ZRj+D9cVX1jAjBVasTu+sstBMuwyrzqueP0wjNC6SHagMnaWhNwHHp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UKo7RQFf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4560d176f97so11419695e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365395; x=1753970195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQxVhQs93RF2j5r69/kyB3XsN/D2SLMeChyoBk7vwm4=;
        b=UKo7RQFf1yxGOBkJXGeh+sfBmBXkK1H+4dY0li35Yw+u8GlIDgctfLJSJ4gGAGBQ2e
         GpkP54mAuQWTEzVRa637gLECXTG4LBD+H2Zf/5hnwBXl+0qVNriDWLr6BaX2ks2iEWBV
         Mv0LJV9V0FGC4soAaRZCjk8RfDbvKEMAJLRjcque3PsP8alr8TJvWdUYjSqS+DRr7vxH
         eLswUfmFOgcFn+aCBJClnkAnPFfGh/e2rEOVqJpIN08L56pFgqzxoVpF4AU3+fyoZ+1U
         +4/H2qvGelbzeKomwnogICW0n8OA9YwHGMszLF3omZ4MskFKLs2D5R7Q/FM2tWps4Txx
         N1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365395; x=1753970195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQxVhQs93RF2j5r69/kyB3XsN/D2SLMeChyoBk7vwm4=;
        b=JXAYG0PufdoC7AJ4HehfwtUQ18uhI+SwOEDzx4pRJkMaPj/ugaNilGxs4Q3qVFyX74
         J50v4mWg5N6MkLWsrfmaG79VEoh5SFbcN/wF9ceAeNv01SjkNA0CDGLjwkL24p1Fdhn6
         CSzatdv6EDwqe7KYnm23heBqvxwZ1JplfZihpK7bBJDHmshklFIdr7jbl7oOXEGGYtEG
         nwGeNOk3JjLXkT7PPKFeMRyKmofyJjOZYZ1vGdggnXybQ9LUqBbpg+1O2CKqkjt7FKMW
         iEFROO9nYrjVUTNTF/z4c1MFu47FEMIO68j6ca4BBPXuKksWdS1+9MQYz3NUf6yowNAF
         KW+g==
X-Forwarded-Encrypted: i=1; AJvYcCWvrhaofXuiNQ34aXw4pdpKuwRH/DMiPY8Ex/bJwUFtN1sB08go2cNmj3AEd8ATGMMHCjtLJpQapbOQBJso@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7lmR+ar2DWcWvhtd2NTae+up7XIfLUgXNgHJ577wx3YZyzb5n
	T0mmhho1sB0VYpJ1tuoH3F3DP7myJV/VDYkFHO2dJWqsfli2StLSfYKFkZYghkuSxtyyqKjappd
	oVgkd3/I=
X-Gm-Gg: ASbGncuXnbwzS0MyE88rJ0by3DmiU/Pv8tDR1asPcmF4lM3272gR4ut2cf8ZaAzr+KW
	eFEZIg9gCfmb0fQqLBsgevPYJS1Tq0iBg+Oik+/155OkcdVUkR7RpVSe9Sgkd/czGcmfyHLOWA9
	BqkOi/5rqsOErsH83PH6y9QUfrrpf3KLkSte9m3hRIjUXF12etmUuXkh7XSoraA8fXXRxGrzJy6
	i61G2PmqifcP+jxI475pvhD3qwnKAWjydJVw4CJAns3kXJR7Cq1EEaXQEN3YSJyadp2ivpw7Rpi
	WRH47uOglhRL+dMXeqJbdyj994EWnKAiC07d/S5spPoIsCaW13gYdMsO5mB8BYRYx/9k6Zk7zFa
	VipDMuaJD0aj4lgyW9GbDGuvofXaHy05IzrD33BBIvsumlGEl8dBOzQpWLwK6Q4ao/KxWF8UbQe
	64s90wBCdY54jO
X-Google-Smtp-Source: AGHT+IGhn2BhSHWFDoozkG8rL01GLeqFkYg2AyJwTWU+9+XF/fbe0VNyrElgCTmDYeBHx6jzMQbcKw==
X-Received: by 2002:a05:600c:4e4e:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-45868cf76e4mr72058865e9.16.1753365394813;
        Thu, 24 Jul 2025 06:56:34 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:34 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 14/29] mm/page_alloc: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:57 +0300
Message-ID: <20250724135512.518487-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into kmemdump:
 - node_states

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index fa09154a799c..5f0015e27a30 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -55,6 +55,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/kmemdump.h>
 #include <asm/div64.h>
 #include "internal.h"
 #include "shuffle.h"
@@ -207,6 +208,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+KMEMDUMP_VAR_CORE(node_states, sizeof(node_states));
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 
-- 
2.43.0


