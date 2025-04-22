Return-Path: <linux-arm-msm+bounces-54941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E33A96786
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 534FD189E4A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843F927E1AF;
	Tue, 22 Apr 2025 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GU7LQMgm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7176327D779
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321544; cv=none; b=YQubRS9+dowdx8nMHjnJ4Sk+0jFe/useLOLL2dcjZxF6dJA/24DP2uLwfKQNVoOx3a64TV8JYx0nP/FncEucI29iD4aXSCqyaqj7bUoqFZfEOqCnmQm2QKe89lPgqizGu7IeUjON5cWe7SZENM30OXINhfEBzrWDfGFhYQYe25c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321544; c=relaxed/simple;
	bh=ZEfuO89SqASiM7GrCPCbp+s2T96g+unLkUU0ynS0zgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghhkVHdTIC6VS6vkVURqaTPrhc8UtREhXF14nXM3GsrOrdg6iqvC4GHnNX6zAQHOr7eYMd35jK/8AytoKFS5+LYN/UFmpryw4VoTxhGPfTMeTXgLvydWBIPxSRGRWiMFQTzab/bv8JjsvIuM8iTB7shKHpLjFl1RZGKeWXZcEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GU7LQMgm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4014475f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321541; x=1745926341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9mhCj0ekrSAhKxeAdIDKoiXrDacQrSQO5Vuilr0jZM=;
        b=GU7LQMgmVIJUSoeSNKjC7TGDQUXttCYFRYCb7dKAB517LiucoTqHa1XD52VppNUgiI
         k9WitxHy7GgbkMEkvLBQ1Pw4hQpkb0LVC6pxCgoD6n7xlSlepDZLunog2+WIH/HGgwFV
         LwBxkQzSP5SjEz3RaagwxzxlHJh8oXFcvCosbzmTdlLSVMdEQk92aNWK1z7aISTcENYz
         dqoMlzowXCbN1kcIcYpeythaRyqehNbVDS/8t2wV9A97vfvyc6jGuTph8ygJxdUFMaBx
         ub+eohfH4xUBSyvOutGu+E3tE2nKEnXywM5bw+50I+8nxd1Zx6Wx61fznsDgen2/BtWI
         kaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321541; x=1745926341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9mhCj0ekrSAhKxeAdIDKoiXrDacQrSQO5Vuilr0jZM=;
        b=CeDrb6u2exZG+w23424XRkbHOWE62Tt656lKh7y1pEW0TKfcSil3DMhGXBjA1m2BzY
         1ZbbJ4zYL+7LwkBMyvl9u1Q+GmAGiMj0pbwP2anBzhNGJL390dQmaq810lAjH+VQAsgM
         99CvdLlQMBr6AUBzPvFc1oLtqZkkfmTe7XdO57Wp5ASu8eGi+qwBeuuw1rrQD9GNf3wy
         XJs5U42g0HtDudqBnRgaZHQMwS/gT9Bz3o7B7KaquC56BSdTR4t5BsnXY/zzkOTCsIkK
         AWZ70C+OSDGzC3zsD9PrzT7DuiFSx6HkofQw3eUPxr63dkXXdLMxN74+0YWIyX7y42OF
         gMlg==
X-Forwarded-Encrypted: i=1; AJvYcCUlb9V7X6JhwZFkQ9k02s3ZLQDbZHscoF9pZvcoLmGR063OKOCX8UMyhLXDAOaZd9GOK2EuL9kgOHbYMvFl@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmffknF0TUurbxAUZl+NGFmX3YKen4zyyfyEbXAQV6VGtc0Er
	1U2r9X1vIkiB8VC1uzG+5ldjQD5SCtQXZLJ1QzbUrbLUzbXTiFrEgn3tkbi1VPk=
X-Gm-Gg: ASbGncuAENRSX8jQ5hwwdKyyEzLDoQlCBO6tiWzzm7IxknO165I7Pq8ciiJqXTMxflu
	joAQ1h/FsEhYIv3C6UWdnMFmhRvNitW+YCijrjmsFeCpflSAq6LiDZahh5cgiIKK90xQkUejMpI
	8+4UPFExB1bt4s5nT9WfaJ5na7xP2fumpIjVk2T5zeu5MR/w5SOaj8fUW44gQ5BOXe0Yu/KUo7Y
	6HrVDRAHizemf1jj+yw5oy5uZz+HtAwuoKaQflY2xP5VZXk6hBal3IT+xCdkqa0+fB4GIqktTUI
	HCkMCiMB5wYhNsmqO9DNDWNJWQP5om9JWRZAHRJzFPXwPSAnjsr7
X-Google-Smtp-Source: AGHT+IETnKdGNbtMn7JPOPRBj99xAT5wJXNpOwUNB001P6TYN6eu4ikfra2LHHxXB1sLzvhGYsSz8g==
X-Received: by 2002:a05:6000:1ac9:b0:39b:fa24:950a with SMTP id ffacd0b85a97d-39efbadeb66mr12760697f8f.36.1745321540656;
        Tue, 22 Apr 2025 04:32:20 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:20 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:49 +0300
Message-ID: <20250422113156.575971-8-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
to kmemdump.
This will allow kmemdump to be able to dump specific log buffer areas on
demand.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/kmsg_dump.h |  6 ++++++
 kernel/printk/printk.c    | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 6055fc969877..cbe76c94710b 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -80,6 +80,8 @@ int kmsg_dump_register(struct kmsg_dumper *dumper);
 
 int kmsg_dump_unregister(struct kmsg_dumper *dumper);
 
+void kmsg_kmemdump_register(void);
+
 const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason);
 #else
 static inline void kmsg_dump_desc(enum kmsg_dump_reason reason, const char *desc)
@@ -112,6 +114,10 @@ static inline int kmsg_dump_unregister(struct kmsg_dumper *dumper)
 	return -EINVAL;
 }
 
+static inline void kmsg_kmemdump_register(void)
+{
+}
+
 static inline const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
 {
 	return "Disabled";
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 057db78876cd..cf4aa86ef7af 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -48,6 +48,7 @@
 #include <linux/sched/clock.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_register);
 
+void kmsg_kmemdump_register(void)
+{
+	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
+	kmemdump_register("prb", (void *)&prb, sizeof(prb));
+	kmemdump_register("prb", (void *)prb, sizeof(*prb));
+	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
+			  sizeof(_printk_rb_static_descs));
+	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
+			  sizeof(_printk_rb_static_infos));
+}
+EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
+
 /**
  * kmsg_dump_unregister - unregister a kmsg dumper.
  * @dumper: pointer to the kmsg_dumper structure
-- 
2.43.0


