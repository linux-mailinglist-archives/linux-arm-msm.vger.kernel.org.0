Return-Path: <linux-arm-msm+bounces-66567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FACB10C6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02E24188CA46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3C42E974D;
	Thu, 24 Jul 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtHD+ISg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5AB2DBF45
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365403; cv=none; b=cej1URgeHYDg7tr/0hBiBG/69ds8srmB7NvtmlWdRLADDTmAzNfhQ7cP5voEO6RphR5dKnQvw/cFENCkLlVgoS3RN6Erhjt8S40pq2ZQhqz0oTxwR2JU39oXGuU7iLmWHFPqspjeGtlTnSe+hE203t7CpbZZ3TCfv68HW6n+QiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365403; c=relaxed/simple;
	bh=kDQ1UVsh8/N1GCc/zzfiOopIyL3CRcZ04ezY899nhXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9n1EcA/5D8Y3M+zyFa1jBG8Ar3EdNgRgyMgEln+Hltarv5Q1wI/miR8t3hgruFzyhlv1G7+Nr6+rhl+en0CTa1xUOVdMFvpuKbfvYGT2MSmjtugdCV7HSNyeMiVCBl5stig+ggX3rjR5J3WnpkSumtU7h+F4GDcxAVBfzL/OX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtHD+ISg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45634205adaso5030795e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365397; x=1753970197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fX4Svte8gqoaTLJ1gLDVO4a7qJdtBtTgEqouOAtsRZg=;
        b=mtHD+ISgSM+SUfi253ZtmszbOMyw9ORPp7cADqLUVvtUQSh+F2uKGW/HoI+6/G8h+b
         sgquvAhnD90ntjDcj493uMRFktkg0EB3wJdjEsJffTHNTqZvaBbR4T6UlnV63KAgJu50
         m8mhqe8AUSug1EtN8ewwaTIHIaTaMF1/2/ELIKaNg7AZaxcfN+A1nTo23afrhhqnk0mc
         yzsgOXEQE7HAgnyWUvWTbiCJPteSDFEDgILZsOtDaEweLOzn4WmfwXgGka8te1qf8YjK
         qRU+D/j+Wfz273ZqaD6mk4O8BQRoVRpM4s3MPjVrrTna5m6Vj38zKVqQHrOwG1Uq1xQr
         d6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365397; x=1753970197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fX4Svte8gqoaTLJ1gLDVO4a7qJdtBtTgEqouOAtsRZg=;
        b=wLKmW765Tfz5P1E7aYnv3siPsszdAMpljc7xibUwqJAtBGBkJaAXaWYZJ4Dp24gxr4
         ZsPbAXnHJXJtT0evD1dk9YIz/LAfOeOPM0v+awkwil5rDwU529tv1VMxapJKCRim50BM
         E5gQRtMr8xUspM7zYvAY2Gu6eImu3NkrjM+EbNzcayAT1MPCN/0duz8W+CR+4U7Uimuq
         SgWHFsGwjJ6HcLyzn/qJwGqb0g/w5FiBedHOKh1HCcABQKECcmIW1ozf9ZWvqVW6Cgtg
         LI9JDOBWWrKr/HAb4rgCbrQMzprLqg6z2uT4tjS+pxYBxSInTza3vUOGCHmZO7LW9WJW
         gq5g==
X-Forwarded-Encrypted: i=1; AJvYcCXOqL7vSI/aW1iHGiJbogUg+Bh/t+zcm23vBOvNEY6A3REw1OAvzs2JY07SWFPh8B7wL2QkU0PGhQPb98ek@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/mnyoI6hq+m+VcAMXsyEVq1v5gHUjgp90AbBWMS6RkhCzMQr5
	wteEWz/g6cIJ1ZfaHWxgQRFqeBK0DykUTgDbnhlWKX3vMSUXTxuGYADo4QS0Qt0m2jU=
X-Gm-Gg: ASbGncs2qTTy7KNBvTn2FreGUGmbOhWOuuVZwKC/mfoO1XwR1ak4e/9uaGgswOdOY5C
	6LczTsUNzUJj9EtdmqdO0YmT4av9Ps6iTm3MtUorLbxMCmdeeaA8lw613D+BxsLYRgF80hCKUc9
	X+JF3pXqWx+7Zc0tiO6RmKkxT3i829dASrYR7zH2AhelQ2m+4scXGVq3bmLMJkf5xWOQgmL78NB
	gVnE8fdAWrLItcEbIkmZc1Kp3wt2I/n96saW9teOF1lju+dbC+yqRX4OdyEadij7qKXX0Qg9IFo
	eLbgg8B6WjJEnTCfyqVcNA882tNIZAhw1jEX4kc1ZkiaKzXADsXu/s3A4txnG0QyYYlawvdbOo9
	hCRG0HFF9bGLMjqCjuZ+2vtVqtQvez8vUGKuX3NVqIj/O1vI01vUQ/k70Bevw+7DknzRzHRDArq
	bhbG287PujR4EatGooFOm+DpQ=
X-Google-Smtp-Source: AGHT+IEQVvnmK8e1EDhTYEG0c9433X/scuppejD17sDlP6XiymAvLgXWbUNkWttS4mn1l7PUSu9quQ==
X-Received: by 2002:a05:600c:6090:b0:456:18ca:68fd with SMTP id 5b1f17b1804b1-4587118251dmr22564675e9.10.1753365396747;
        Thu, 24 Jul 2025 06:56:36 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:36 -0700 (PDT)
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
Subject: [RFC][PATCH v2 16/29] mm/show_mem: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:59 +0300
Message-ID: <20250724135512.518487-17-eugen.hristev@linaro.org>
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
 - _totalram_pages

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/show_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/show_mem.c b/mm/show_mem.c
index 41999e94a56d..93a5dc041ae1 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -14,12 +14,14 @@
 #include <linux/mmzone.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/kmemdump.h>
 
 #include "internal.h"
 #include "swap.h"
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+KMEMDUMP_VAR_CORE(_totalram_pages, sizeof(_totalram_pages));
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 
-- 
2.43.0


