Return-Path: <linux-arm-msm+bounces-66561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39978B10C70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5832AA49E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6692E62D8;
	Thu, 24 Jul 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hL+cbu6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF872E4981
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365397; cv=none; b=ViSgpNV7a+Xpb44aGmRoSJfzKdKnwVI6GXdsWMxWRNVp9myV3S98TScFCnRQlnC3Ye6X86hu3dOl1KdJce31jdrGJzV3e63nWZlCoYyhw/JLV54RryqSbu4/TR8W0a2WoL5VWVscY5TNbpAe7DWIdZ2g7WwPTZDYbn4csWyAB6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365397; c=relaxed/simple;
	bh=YrGjiFMH/zlkC3aj1afXt5OiVcA/uj0LuVvyhAgKIeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AG0V0I8moZcIvYGFutY9DbFzZO4Za747Uf7vQ9WeOi74UmdlBPs9z47FUK8t3oI4mNLA2w1ovzcDNSrBmbby1b5COQlZe0x8LJwtet3AKdXaZ+aoeqp3H2iFy0vk7gQ7mUIiTMlJaWwULTcyA8hRvMhvjZAtiD9Xd79tdFGIEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hL+cbu6y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so4577565e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365391; x=1753970191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFMrD7tjY0571sMCF+ur1VmM8eA36pvQygKXmIz05uw=;
        b=hL+cbu6yP6EjGyJww08MbKFjb+YHPqZ7YRN2X+iaJQSFXXSoejFtRUQUISGeGk3bnT
         l4Mf3gBSOeQVUcf3zkL0cuXVrR7T6m6I5BZmiqKv0e63ju/1voNOkmgIC5khxZFfZqcp
         6kMDmBdL5IZuYb0WxFzgvRnu3IMyj+HXD2LjI44tjwIJoOS/cZ8FclMf9WupAvrKNtza
         Mlx4V53ttJVOdBW+tWvRS2uZhgZ0UsJpdg+juC7/+pzmSFpUq2azjNcvDQmjqA0NuGng
         w7rYBsSgNtZJISnIcSBRNSMSguYIQCYYRDLA25r1LhK5sR2dkhetmsbw9M++vwI5m0vi
         syMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365391; x=1753970191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFMrD7tjY0571sMCF+ur1VmM8eA36pvQygKXmIz05uw=;
        b=lraetjSgHlsXtFz7CEVnLsM9Xq1ewGLYeLUCMVBKV4qkWbhDS/+gYh6paTwibYcV/Y
         LdJNKb17ZJU4X5wFQwe6yXEj2knlXfNmceNVUl6V3GBUVifzAurksiFh6O5sRHdNAykT
         8oEjTcPWHeVLjC/Wgjmr/b8q9lFvUtC/oW1o9qnsDzMjIpEIsKw5eOpceCVdU9fauCvj
         Ds1izu5jCmmia6fgZ7HohkARHEjkT23W1hZmeL0j3egmWcJBvUj9XBl8PYOlUQo7fTub
         frUTjv3lDBGHYohnQgIg8WlwSF86tw6kDHRmmlf+P3w4n0Xp/Qui/9fz/ZgH2U5qOSnF
         bANg==
X-Forwarded-Encrypted: i=1; AJvYcCXkKH3Nu1QgwJPl/0vC+Mz2gJMQtn/Rr4wltgx27X5H5vAbY1984w9dttfJBrybMFzysUKAeMUtyCm8TK0T@vger.kernel.org
X-Gm-Message-State: AOJu0YwpL0zH6x0Osa2U79e5+bHmb6fXPFDnCW1xy3I0bh/nq0cDXJUw
	pBHEy+KRbXDLQv3b0zBXeVQFCnXCjENuJTwypdtYZVubszIPWZuSiFiOewOhSEgMTbD7HtPzvBt
	EiUammUY=
X-Gm-Gg: ASbGncs9wjNymJk68Pxks8vM2twliVMMO2WUhYVFeQkajkqJcI/ZfZRNISJ8zSwdypM
	TGdATCW7rH7TlRgdNWD+uMfeNHwYaoFj3veaP7CgAezeBkGRriYjJH56SJJ3LGXmz7m0TMXu21Y
	vYE8BDPc2tQG7bz4Bu1dvkw2ghjWmAHcry/ZBsfKd2QzbMcOC8C+YTBvu0csWLDppKFfS4NqBrZ
	yNdhlr+GEPBMZBtXJQlq65EFZpsHnDKeqkalF/RU7L59sc2ZxV0OHvb/6dmJMZy7oVfmfRP0jTs
	0ZRl6fs+0H7MMIXzVSel8JDv8WqxbkAbig+VCLMCjkuKodvWPC1MUHcDlvAZZY855t49/yRn64h
	kRL8aMaybpD/+LNHNE8XEbFHoHqHoNw3MpL55vJ9VgMbw71ljUX+bd9MrHG8tnuZkAL6JiWBaie
	SEawAHL2KTrT5U64k0YDet8Sk=
X-Google-Smtp-Source: AGHT+IHYV/rdyT8foqBo51VlSPNSFrqLVd1yTjWzm4T+7ubMqxXGaXLoYsD4QdIBTbjTZBYyuCKPkw==
X-Received: by 2002:a05:600c:3f07:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-45868d80dd4mr72372095e9.30.1753365391122;
        Thu, 24 Jul 2025 06:56:31 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:30 -0700 (PDT)
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
Subject: [RFC][PATCH v2 10/29] panic: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:53 +0300
Message-ID: <20250724135512.518487-11-eugen.hristev@linaro.org>
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
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index ccee04378d2e..fb561a2fdb59 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -39,6 +39,7 @@
 #include <linux/sys_info.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
+#include <linux/kmemdump.h>
 
 #define PANIC_TIMER_STEP 100
 #define PANIC_BLINK_SPD 18
@@ -56,6 +57,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = CONFIG_PANIC_ON_OOPS_VALUE;
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+KMEMDUMP_VAR_CORE(tainted_mask, sizeof(tainted_mask));
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -601,6 +603,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' ', true),
 };
 
+KMEMDUMP_VAR_CORE(taint_flags, sizeof(taint_flags));
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)
-- 
2.43.0


