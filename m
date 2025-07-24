Return-Path: <linux-arm-msm+bounces-66571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B89B10C7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480991CE82F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8932EA75A;
	Thu, 24 Jul 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOAY9+ss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4F2E92DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365406; cv=none; b=IFWcZCx4XBJmTd4TX1TKNnQXR9aRbo345h3BVPw9nzRS9RlF/nflWj0ECI19+z+hR7mwaQfh3KRfwvIb29QHTeVmvN7a6kN4PsF9LtzrfZvUrMYYwh1A0ys6zUqnBScYE4isrhlH2SNlfOKoigsCKzkTojaVZ4AeY2kCdIfGTks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365406; c=relaxed/simple;
	bh=wARnIHcM6q6qiMPnn5loBslIGs8WDjRosQ7TWci8o8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGGC4LtNoYV+MzbB3CAFM9jMgzNz2vAdeD/7P2nPd1TQHkhaNFYRliYX4D7pb82wDCsN0eQGe3cy+FPzs92TV2Y+w8Tapn/HMoDSfaynUKlG6DG8cE9d2H11Aj65yYf/QJdVkonf2M7RIsGBTbiEAg7QGoT7eEbUkrbuJ4Z4Coo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOAY9+ss; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f379662cso692692f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365400; x=1753970200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ay6ISBVXr4RhwBg6A2t7OCdYp+NqRXGL2jP3qh5ffs0=;
        b=JOAY9+ssBL5AftLlTXlwCYP/JT+QP2lzmifqj13XQuxS3W5e2xCdZGZJnGOoxAJ+BH
         31i11imIbD07KejKcMpa89wM3cs+YfFj29ONOHDQ7VaHrBWEbk8SU3hOpyQll2rGMs96
         1WbBJO6uGitA1frzw/38lz3rF8qXBUsYBMeLOpuNlvl/9TgiJIzHAseN2dPAwJRnR7sn
         b2/QOtkcBzcgIa1Rr/PiTMLwP1DX5yui2tNfPlZXV3rV1jD6PM0Sk3O9pcW8OiOMaGvZ
         RbOvuf4JT21MCkQpb/L+SzfX8EOnFYRr9SCpz5xAtpIj9aMZHf4/6AN2HTCP+STXJ3Bb
         MVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365400; x=1753970200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay6ISBVXr4RhwBg6A2t7OCdYp+NqRXGL2jP3qh5ffs0=;
        b=WI327KQtd4wg2tRrJDS9m7y0Uibn/1InUKuS2qb5tIMnbIFRNZbW0mK2QX8xLJLgQJ
         fK17WAeDgAqW/UGZSCaRxd913/Wc8Mnl+OciGuhegarGAq4NxJ9WakE1d8FQaNLYtv0M
         Ij5m26wnajxKdcuJYRi5JUR4gil7QpkTc4VQDnQNUzBWV5Cmt/0g1coq3vRe6joRBWAM
         3Rj3iqugocKVJQ/5zBSpoG71+dNtiJbJ1RB8M74UUtC+1bZ6jdpYIW8TPsKlkzpcCUz4
         Wz+VkJGt/gP3rMedYe6HyU2JB4OKqhP3opRAyQanMIV/Szi7LvY+RYohuWn7Be9F4U9h
         OEWg==
X-Forwarded-Encrypted: i=1; AJvYcCXX9REq/ltiwFxXYSFk7xMhZEYyiXHRHtPHvwuJuQaXs3pEKLycspphOsV6yne43YHPDr6D//5ds91I8aYW@vger.kernel.org
X-Gm-Message-State: AOJu0YxF9qGN4mUnxUD/JegXDCpgIjvOKQ4m1gNo/LCzfl9silF0Q4hl
	VzySK9TGDltyY6cwq4T+2YcdQsSPyqo59Zzv3FxaU+aTb9oE6rYQSBwieu0jdpMfY1E=
X-Gm-Gg: ASbGnctG78jX0ZvVSjOytGyigJoqZyXzx3iz3SXFA8tcUeO+XOlugAmpZuUZa10LdOV
	wHRHz0Y2dBv8DzOZqrQSuIWbLfz05MgJaUo1M838qwweVxWg7/PquxjBcQ4ZD/QzPeqqzeuK1Mk
	qtSKUDChVOsMjfJ6Y8i3IOabpCPGCXjUX0DWnW/HLqghyPb7ZmIbRGPt60YpBgdcxa1tB4SVi+/
	nLiQzOy/RC2UHL1jicUDxm98g54yCJE47xHPJK72ps5D2kv/3eDynlA/aYnPpF9vcNfq8NFNUIy
	okyZHMvey0aZprqdZ3jZx50bTCVou5klBQcW63ohDhP7wIHQr7sdqEy4A8l/OmAIAWhuDYRF/Hy
	hJFyoQtOeYMyfnD7pPZmxF1FXodbZcQ7Q9jE4ATXXehmipHso+pGLvQsi0x7NJNsAOIrHRinvg0
	mDVF8gEzbCsm/M
X-Google-Smtp-Source: AGHT+IGCkgT/Av7S5A2E0I2QQdMK0eQR1KK2t84reKZkouB15tDDQWfO+rh0+B+shYiLiz/J/iIBUg==
X-Received: by 2002:a05:6000:1882:b0:3b4:9721:2b2d with SMTP id ffacd0b85a97d-3b768c9c202mr6498976f8f.9.1753365400320;
        Thu, 24 Jul 2025 06:56:40 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:40 -0700 (PDT)
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
Subject: [RFC][PATCH v2 20/29] printk: Register information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:03 +0300
Message-ID: <20250724135512.518487-21-eugen.hristev@linaro.org>
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
 - prb_descs
 - prb_infos
 - prb
 - prb_data
 - printk_rb_static
 - printk_rb_dynamic

Information on these variables is stored into dedicated kmemdump section.

Register dynamic information into kmemdump:
 - new_descs
 - new_infos
 - new_log_buf
In the case when the log buffer is dynamically replaced by a runtime
allocated version, call kmemdump to register the data with a replace
flag to remove the old registered data.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/printk/printk.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0efbcdda9aab..f7d60dbe5e5a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -48,6 +48,7 @@
 #include <linux/sched/clock.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -540,10 +541,16 @@ static u32 log_buf_len = __LOG_BUF_LEN;
 #endif
 _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
 		 PRB_AVGBITS, &__log_buf[0]);
+KMEMDUMP_VAR_CORE_NAMED(prb_descs, _printk_rb_static_descs, sizeof(_printk_rb_static_descs));
+KMEMDUMP_VAR_CORE_NAMED(prb_infos, _printk_rb_static_infos, sizeof(_printk_rb_static_infos));
+KMEMDUMP_VAR_CORE_NAMED(prb_data, __log_buf,  __LOG_BUF_LEN);
+KMEMDUMP_VAR_CORE(printk_rb_static, sizeof(printk_rb_static));
 
 static struct printk_ringbuffer printk_rb_dynamic;
+KMEMDUMP_VAR_CORE(printk_rb_dynamic, sizeof(printk_rb_dynamic));
 
 struct printk_ringbuffer *prb = &printk_rb_static;
+KMEMDUMP_VAR_CORE(prb, sizeof(prb));
 
 /*
  * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
@@ -1211,7 +1218,10 @@ void __init setup_log_buf(int early)
 		goto out;
 	}
 
-	new_log_buf = memblock_alloc(new_log_buf_len, LOG_ALIGN);
+	new_log_buf = kmemdump_alloc_id_size_replace(KMEMDUMP_ID_COREIMAGE_prb_data,
+						     new_log_buf_len,
+						     memblock_alloc,
+						     new_log_buf_len, LOG_ALIGN);
 	if (unlikely(!new_log_buf)) {
 		pr_err("log_buf_len: %lu text bytes not available\n",
 		       new_log_buf_len);
@@ -1219,7 +1229,10 @@ void __init setup_log_buf(int early)
 	}
 
 	new_descs_size = new_descs_count * sizeof(struct prb_desc);
-	new_descs = memblock_alloc(new_descs_size, LOG_ALIGN);
+	new_descs = kmemdump_alloc_id_size_replace(KMEMDUMP_ID_COREIMAGE_prb_descs,
+						   new_descs_size, memblock_alloc,
+						   new_descs_size, LOG_ALIGN);
+
 	if (unlikely(!new_descs)) {
 		pr_err("log_buf_len: %zu desc bytes not available\n",
 		       new_descs_size);
@@ -1227,7 +1240,10 @@ void __init setup_log_buf(int early)
 	}
 
 	new_infos_size = new_descs_count * sizeof(struct printk_info);
-	new_infos = memblock_alloc(new_infos_size, LOG_ALIGN);
+	new_infos = kmemdump_alloc_id_size_replace(KMEMDUMP_ID_COREIMAGE_prb_infos,
+						   new_infos_size, memblock_alloc,
+						   new_infos_size, LOG_ALIGN);
+
 	if (unlikely(!new_infos)) {
 		pr_err("log_buf_len: %zu info bytes not available\n",
 		       new_infos_size);
@@ -1284,9 +1300,11 @@ void __init setup_log_buf(int early)
 	return;
 
 err_free_descs:
-	memblock_free(new_descs, new_descs_size);
+	kmemdump_free_id(KMEMDUMP_ID_COREIMAGE_prb_descs,
+			 memblock_free, new_descs, new_descs_size);
 err_free_log_buf:
-	memblock_free(new_log_buf, new_log_buf_len);
+	kmemdump_free_id(KMEMDUMP_ID_COREIMAGE_prb_data,
+			 memblock_free, new_log_buf, new_log_buf_len);
 out:
 	print_log_buf_usage_stats();
 }
-- 
2.43.0


