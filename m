Return-Path: <linux-arm-msm+bounces-82547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D4C6FC28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 6FCBC2EDA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D953730F9;
	Wed, 19 Nov 2025 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FsCbIJad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C717236C0CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567148; cv=none; b=XDm5aMsyTWo/mrwJtHPtQ9wOoJEI+Vg3LcIuT5Te9dw/FuKWhe+Z7HTNwgrdxDLXFhpmn0UtsN7gxEdI+Tg+iJ2CZTMU9swvFNZkZ1ypNeB7eN/RV+VkpzVTR4aAPYiaL46PSne/lwBSzNWrwHR8cdY5fcXT+dMF8wuSiX6Xxl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567148; c=relaxed/simple;
	bh=oxMJ7nEx298nSQNAUvIm+RfzZDeUkq7JnffHAGnHY2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZlFCgT7A6fgLGXbvXmi0nNKn/bqAgSqkA9Z9EFJJNHqObeAQ9W+VyukRMsOvLGoMjYtRKWtQmc91O6Uk3cHu8ETKWycX18DBwfq09T2xY3JaJ9xFxUQy9/752h3eV8sSuSjyMCgZ++fXMOQ9Wj6+5iqyCnNpQPnjvo7hjhX/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FsCbIJad; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3747783f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567141; x=1764171941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERGSngcgAQCpMTKH+vT5ZfmIUQiWuwubvJ1CKsgHOkU=;
        b=FsCbIJadiUYCr6ejMirqwdULle+dFIB303mznY92UxGov8aRpXM1+QZ0YZAJZUD4WL
         dEklnlMCpvxXLYdxfYsOMAAtdJ7Y89yogdYrFJamQiRz30daYx5LMFbN32HWiJubddSV
         yKSmzvQbxm0kZ9/kKiXGX8ElkghkgmgldHj7ofdE/8tU2HEt33UbAYAY1F3di2i4/P0U
         23nzNwXa9vf8tpAXj4yyp7i95O+QXZpgrtz3n/IVl1PCKWqIBOzKJ876OYZYt+aiyuMe
         u+98CAqWIInRKYI88txn1aq/8lAHBVFah13SAXvoapuq9p6LywhU7eCXy7B7xaClvy7C
         x/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567141; x=1764171941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERGSngcgAQCpMTKH+vT5ZfmIUQiWuwubvJ1CKsgHOkU=;
        b=lHcsGyiohSgnWzf2gFw9riJATE8+m2hK4Ef3EtlTOEoqcC8DN6uIv3MsbndE7wnhcg
         ljPztXbc83SksL4db0zvlMFDDMj8DB30oOjNv4nkNk/wB2FLqvOmwZD8w/8G+h217nPi
         BXVGWLUBFOyya7bWj3TFgLC0X6oIDq61o6QyFrlgeOE0N+9Xur0ueM7V82UrpjBv9XG+
         ycuUyoQC9pE0bzlXvVB3gvJD5Hp06vq1qjdTN/AP4FaTSDHi6/JabbUlkDbrie/IKNW1
         gIieWQlpg+vNXahhNiGQ7G/epIhEwJWDDdMW46aG2TcgjE1HcAaC5fvaZfVkGP9iq0gK
         nRyg==
X-Gm-Message-State: AOJu0Yx6VQO+3umsACM12+iI3eox1PB3IPb8lPGAJVEzkbgBkW9aKPsJ
	1vlm8mQ/Kxj9Kd0MQwhzneNfowjsZHACYgUVugGTIZsh/f8P4WHbJ4qRv3KFtsBW79x6lUZ3bo4
	kV+DT9Bgpaw==
X-Gm-Gg: ASbGnctCK7Jlw02AJzT8gC2U9hxES2kSci9Wy4de+YXgT4gIhNvssyQIiACzMaCViVI
	gJsrqqSU2tu8Z4JL0ixEqCbqAXaq5LcfiSdOLzFw18S42rUKVBg71kMcGhZV2ucInmM005CHwRR
	qolY+8/hbd5PjW/EqMNyjhH0qMrgJlbFopB52KbdWv6yN5v8A4wjlnPrnyYA87kQjLWm6GUuzNs
	GViH9EWYHVgCMhHlvJzSc7P98hlqpgM2K0o9pLsvv7OctqogkDDDKKBA8awYNBHQ4hQ9KeX2n/2
	7wYSjs9zYad1ERKhm59bUmbTXzwBu5WX6qO66yMIWGNC2Z26UrdRea49WRmpj9d3JNwDCBlkMwq
	W6e9dvOJodyvCvSi1tAfp7kwOy1QE070+G/hdjU3XL1S8dXKWI4yEDVoaSwtGym19J9xAO+9ZQ2
	a8b/IanyVFPeM1b3QlCVcw9h3hH3bXAw==
X-Google-Smtp-Source: AGHT+IGbRbXBdWPtS8s2pezZSC/ny/HyWuyG8gk1o+dQWRtSU7DtMYRlEtgHBlikDrn4myL+c90Kfw==
X-Received: by 2002:a05:6000:2410:b0:42b:3978:158e with SMTP id ffacd0b85a97d-42cb1f9e99amr2655929f8f.30.1763567141134;
        Wed, 19 Nov 2025 07:45:41 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:40 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 14/26] panic: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:15 +0200
Message-ID: <20251119154427.1033475-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Annotate vital static information into inspection table:
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 24cc3eec1805..e99539e18054 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -37,6 +37,7 @@
 #include <linux/context_tracking.h>
 #include <linux/seq_buf.h>
 #include <linux/sys_info.h>
+#include <linux/meminspect.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 
@@ -56,6 +57,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = IS_ENABLED(CONFIG_PANIC_ON_OOPS);
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+MEMINSPECT_SIMPLE_ENTRY(tainted_mask);
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -662,6 +664,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' ', true),
 };
 
+MEMINSPECT_SIMPLE_ENTRY(taint_flags);
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)
-- 
2.43.0


