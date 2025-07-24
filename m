Return-Path: <linux-arm-msm+bounces-66563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8017B10C5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58FA5188AA7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E352E7185;
	Thu, 24 Jul 2025 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ARqjK83l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D262D2DBF45
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365397; cv=none; b=KFwEJRCkl19ZhO7cqOUH5gLhzplAEtxTkxUYJeOlD4JjV7uXciB1dz5VPCdzHdGYqV+cna/1WE/VAx3Zd80L8LgF60GvPzBCdEjwnRUXiqzg9rAs1WTCADOZIburNfTSr69oNq5i9macRbvKAfzwNoUbaniv0UjeDI+99u/opuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365397; c=relaxed/simple;
	bh=Yxy1SBIj1dJtqJdo+SY4u8s4+niserlLQYp3eIctd7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5wRr9IHkBlYEntnViGPPRRaqml3Ozvhn0ezVtRIqP640uYARnnj3pk12bc5KDLCehawi5MJGXa4Q9l3vlhY8VqdonxLqf0bShny/yCLEezGgDVyEDTE0epaGOtJTYY68n8QZIqH5pbnbjU8leeniMdeEdRW6ShXRBAA0WmAiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ARqjK83l; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45634205adaso5030395e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365393; x=1753970193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t+kxQ7dPGtocO2eml/1QU47n2YVx1Ic6Vfv+oiY3pc=;
        b=ARqjK83lvYxNl8Lne8lZX/A7LtPSOrgVphMfQnIg2EwWyTqXQeJG6JHMqN6ytAYYmh
         PswH3oHdlWDuPJh8SsW+P3uquLU81BpG58SddVBBy0Nn8UlmV2OzuK68hgaO7EUDF6LJ
         TEnEdrn82pEYtS/XaaL9kdhATZdZC9Yw/1tiUmuiGTcBB9senuRHJzm2RSlloQfSC0KV
         7x+0pMdY5UUIr/s/6C3/n1DWlOmWVWTwWt0PTsVKNnVd5GC2vbkt0wmv2vzKtUF+G6LF
         Oke0h4sskYOveHCn+yARbBb6k9QMauq0FguiI1vkdtqyFqf6DOk2AZaUxJEtoIPheBc7
         +uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365393; x=1753970193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3t+kxQ7dPGtocO2eml/1QU47n2YVx1Ic6Vfv+oiY3pc=;
        b=tYMw0Y/iqWAS02R0W55o28C17MF4xbsuu5xbpoOc0eXVvotVk+bJREV+NYHQr+//IG
         4l3L7QYsYtw2e5gLCMendKdatUgnqWIyxZ/OYpGwgt8+dnvEnd0Wed3fKLLFCbDohvpg
         p+tjWNI08ol+znbG7mJ2WbEZGQmF2Np3dYQ6ZNR2k+IJC0sL11PJXlfxVt+VH65jflVv
         XelzW5RQHiM7KizKrNvmrAwQ1BXw9kt12BSr5MMI9SQPu5jvz5e+eCkFJqOeVMSioJfe
         czeKGXFmDz/ykFD5cqVBg5T5cYvdETsJe/tQ5uKNgBgI5z6YJjpyZSF5vkjSnTFptxwn
         uWow==
X-Forwarded-Encrypted: i=1; AJvYcCVTVYSYSj9bOcJEvPkcKuFMk6jmTeEmQcN94ciDQxOvR1FkdlvCOgvCrOC9Agd/9b15qzNKpGT3OIs7IjDi@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCFSJ3hL6enlhKg1uq7kXIXfTxnsMjk1pJdL8mGE6USbLU9EH
	LCGw6I9d8wf8DTTdrDp7m3CDlShJaU78zoi3cux41h58q9gcG+96MGWkUh6SF0VKmxY=
X-Gm-Gg: ASbGnctFR0qYApyXYZoyOQovdePhhe1geaG0eOSjQrqEaIPOMNwYmH3HfWS8b631040
	b3/0PgCKktVFtfAYDIJK1CqejcwoJ4J4xaRWRgpp6OAlbZTEyzZIBomQPqB8FdE+/Q/cyL9Cfmr
	oyn0OZKoqSWe/6x3cZr8kMbzNjHgFaMRdmEvPbodg3Zirt1UaoXVWmV8CY2tw6kZrRI3Qfbnkpr
	9vHNvD/CWtOnEipIRXrdXaU3ibLbTphCNIrhu3+Ktg0iovs/hPd3y3A3lH5jhmYNMAi4xWBK99t
	fgJNLLDlM6b0YGzdBaUFU9jP89um5MgIAjQKQGJbp1oO95yk3wmMJlSRNyrs6PDgy0krmCQ/hww
	TCF5Ge5vT6W+0nS1JFcBnW4/dJG/8LkXLq3pfEDE0gOB3/neBqrarU9214vku8IMqPE9g6/R79a
	Ls7zOdNVcjv2Lt3tsS9v4Ieqw=
X-Google-Smtp-Source: AGHT+IFgnp7J9pcZF45aCSKJ4GVrrhV0572AUoK1dVlyY1LCSR/mU9Z7mKYUQBRdiPhCDw14ZigOTA==
X-Received: by 2002:a05:600c:a0c:b0:456:19be:5cc with SMTP id 5b1f17b1804b1-45868ca72d1mr74457525e9.14.1753365392991;
        Thu, 24 Jul 2025 06:56:32 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:32 -0700 (PDT)
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
Subject: [RFC][PATCH v2 12/29] timers: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:55 +0300
Message-ID: <20250724135512.518487-13-eugen.hristev@linaro.org>
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
 - jiffies_64

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/time/timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 553fa469d7cc..a5698e3ace2d 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,7 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
-
+KMEMDUMP_VAR_CORE(jiffies_64, sizeof(jiffies_64));
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of
  * LVL_SIZE buckets. Each level is driven by its own clock and therefore each
-- 
2.43.0


