Return-Path: <linux-arm-msm+bounces-66566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B9B10C7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 554F2AC4B84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4832E62C6;
	Thu, 24 Jul 2025 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/jVAsrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250D32E7165
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365401; cv=none; b=FD+RDo/cZdTqXQzL3lZsDb75Q4BCpQjRX+tIfkn9NblUn7A41wRQlq4ZvWi5C18DQ+2JCiIMCYJnKt4z9WpRj1xZwCnZKO6Tr2qL1XBQWRqEfsock04xBVEUzDa3Z7dCpX1h7xZptTWoElIGdidXeQFbx8O2NiXRCa9hKfAtwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365401; c=relaxed/simple;
	bh=IV84GkIv57xHF9DSEvVSmOlbKrWfdF7K1awiWUW2oPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6LVlnLyKtN3UeW9ifY3MB5KTlkLImufdkEUvdyuXmkIJC9zHacItvRf7vKaBy5Wh7Hl4cRFde7qbEr/2JRoaTKZ/Iw8J81LNc64h2JIG8q1qgBRuGhnXk8yDjAtHHt111UQKoE1CD/3ftuyd4X9olcDXUsxDT1W2g5OL/L+syA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/jVAsrS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so4578135e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365396; x=1753970196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf/VqrIHQh0utzrTdiqqaO7yt4rF9Ojfq/Zu+7lemII=;
        b=s/jVAsrSDhWtyo9ZcV5kEKKw/dVAaBJ/nYU0zR+1TTbAwT6C90R6q4o2Fs7FTNl7EC
         JBz/zNnGUfo0C6rjn6bbYNcbu0h17l1DCsyIswwpqRE/Z5YJCnvklYzvHRVr7lDcjmK/
         GDb7UtK5YfwNF6dr2d7lJriWdesbG+04Mp1FaNrZo5ptMuWFm+WWlilSdR9E9Y9TXk5L
         Z24L7aBFpqgoH9WNId2cx3yqQWpySBhKUZFcsPEZpgj6KtjqgWBiLwpTykACJL2KYoW1
         w0EaD37ra0WKDf2vQ68AkDd3tApNxU7ohBQA3Kg9ZgN3ECcv988LGUYKzeUHIywN8eb/
         fBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365396; x=1753970196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qf/VqrIHQh0utzrTdiqqaO7yt4rF9Ojfq/Zu+7lemII=;
        b=oeEWeI2fTw6SvzRTkEBt5wD2g1rjcqxA5M7+U4SM9NKSBNPArMEx72vC44R+BLs2ZU
         tCv7ATf0rjJbj1HGsNN3BEQlQs/D0GGcyK5ETUHZcLrqOSv8/00obOCIxNFQGlkv1ddl
         VUvTg6EyByilgBBLiSM0+yk1XFG4P5CKKeJETpnakgxmKRIGWqFn8HEkCNr3FZ2YIaYh
         zcwFP3Qk/ClkZeaPXfrQMTgNbY83s/JBF1lIZgR+kq+HyJZLZz2i0OGhtl1AOvhvIUGf
         6z8EtqeN3tjPItsH0/Wnjcu20gpWVok6atBI06G+L2bCxfwB7pd37Bmx+xz2E6srCSpg
         lxTA==
X-Forwarded-Encrypted: i=1; AJvYcCV0qlkLSfkN2K7P54sbIYYGQPH1pXydMEpYVjv9gA4dRP7mh5wQ4b6r3wKg7CTCC/Jf3/UNSW3MM3qRgSfK@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvvO2TpNehKpe1Xl2cDS2KF2acrDJYT7DaMcLHuy1sUGeKFZL
	f9goPmmubCAwAgCLa8cV6zBFjOxTNQ0g/7dbeaaziaM2onU/NL7CNZW3LWj6+nyJFGE=
X-Gm-Gg: ASbGncv1b72MtVCm4mjsq/uvUzKbiLSnaAegvR5A5Gm4Stzm7x8hpTGtQ+pZWAw39iW
	CezrSDqm7cfvELZjMBFDE1VPg4nMmY+p/xI/OXcNOZtDRXCA3JZ5LkwkdgDO0B614FinTXD+ABS
	L7MPWvC1Yca5lR7sYfvu2NOJ/yF6rG64zGnVVqdy17oJqjtleqnFiol5GXVEiCRk9yHLKJHFCfQ
	nQUo9u4+ziRyGRVR4kTEZHjLvi9ZSJ9dOmmN1ANjdTsVdCQw6I8xZfpP2CldsxKXMhcxjNoFayR
	/jiQrH+pLyWXN+HknNvKhVzWlq17RgO6FeWZuCnDonMUH5DSfIi4NjNRmNeo4L3CX05tMkeFhDU
	hENoXIUg82vNep47kj3gezxK2Sh6Eu7Bikoh1xjRuXcp6Auqq2phkYtQ5sqmPXgobR1yFDe1WLA
	X8TPS92QpOAZdM
X-Google-Smtp-Source: AGHT+IFzdwFCiaRsVqkw+Vzf0TWhLQA78AFXGtgtYDTFYK39RF9ZemaLlLUrmcl7qJaLyA5hKTyeLQ==
X-Received: by 2002:a05:600c:3b28:b0:456:24aa:958e with SMTP id 5b1f17b1804b1-4586a8cc2famr61338095e9.0.1753365395873;
        Thu, 24 Jul 2025 06:56:35 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:35 -0700 (PDT)
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
Subject: [RFC][PATCH v2 15/29] mm/init-mm: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:58 +0300
Message-ID: <20250724135512.518487-16-eugen.hristev@linaro.org>
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
 - init_mm
 - init_mm.pgd

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/init-mm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 4600e7605cab..2dbbaf640cf4 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,7 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/kmemdump.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -48,6 +49,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+KMEMDUMP_VAR_CORE(init_mm, sizeof(init_mm));
+KMEMDUMP_VAR_CORE_NAMED(init_mm_pgd, init_mm.pgd, sizeof(*init_mm.pgd));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {
-- 
2.43.0


