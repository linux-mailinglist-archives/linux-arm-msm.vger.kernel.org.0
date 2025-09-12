Return-Path: <linux-arm-msm+bounces-73365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB107B552E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACEFD1D623E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A1C329F26;
	Fri, 12 Sep 2025 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RkLKDK64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90466327A2E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689861; cv=none; b=eJMDvs60Aa//ioSJXFZ4uC7Vz0csp0i/IifEQBscSEWoU/vnExZaHNx853vTB3SkkOCoXz/83svdMcwhMkb8mskQY11gve5qS24l8bcKJIa3/grkRN42s1xYntWTfaPxvj04RGfUk8DLr6wCAPcfWbJ/5ohkMuqPBqk/Zx9tcfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689861; c=relaxed/simple;
	bh=y6R7JHolSByTQrZMijPqGMycDGbxs6NH+B+6pGvmKpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDwW9U9YR5cJOElFV7q8wNgbKgOh5zjaR8mxW315TXISqtOi2owKvK4GBo9e1HfHDid9bis+6HcItwhFRmdV+As8dpkdbJoEDOh3eEmKBsl/SnUqskCq6yr/wGXWHejtpqOpmkGTTvVYHmSurj58OOHa1U4D5poiyTy23CyJZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RkLKDK64; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-723bc91d7bbso15948197b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689858; x=1758294658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQyd/J78t59e431BzK+r1hLIHKrEAjBfy36U2OzrJzo=;
        b=RkLKDK648r9G39cYNUgxAOkTYXEi2/89mqteQ158UtaweCw6CikKqdSLRll8g0cHql
         qRxTuJrsWD0ihRSERDZuXzora7vcp8ATffCF4huACVPct1VvjVWD2nq/KK0PEWriuuLE
         V6RC44iPBH1NihSdKirV+JOfyCZ1lTWHtGH0frmoCOX96W1rNDHhysfntO28vlTE38B7
         MdPsuoE0+HqHemQ6VXwnwNc7fBPzUNDAwfWLAquFf2P8I1G/dowEFb/dmQwCyMpk7AcG
         vX13zFnYKk7wUjiGbHMIAQtDvjn0nkWJl9Vyj5D7EYO1n1UyJBw/7tLB2hZ9RB3Fpt4Y
         SWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689858; x=1758294658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQyd/J78t59e431BzK+r1hLIHKrEAjBfy36U2OzrJzo=;
        b=dHMiDQUCPZuCuuiN7Q2Xf7B33jRAvtgGkohOPyBgTGQ9KiMlLV/XtU9J1N1W8DmeJV
         d3b6sfGysDJq5Zvs0Tl5RoCV229rP8p+anDEBdTft3+bsNUagvyGDSoYwJ6hzv8wtT4C
         l+6JkWduWDj8KSqEYKSmNpAmuKOd3fU3c0QiQjwyCxxB170OLJjTneSX5jJCFbOsp7L9
         Jfg7yam8x1jMqqYz9rz8x3f2ODSltgz7ltG6eRcl8FR/kEqq4vKW1GuBnHLe0HF/aKme
         x1HWDo3ps+qTSkORrq9EgT8LHjqFY7TZVUQ8pgMimg6q1J6Xaxq/MsM1GJ0CPfeIumOX
         LMGg==
X-Gm-Message-State: AOJu0YznGzezX4bfOB+tKBm0t7R8KCWpXM/rs1vBMzn0OfFBD+rX7TYU
	pS7yEidXQtuzKOkfFHvlYmIK9+ZmoNasnh3F/BGRxyg9dAL8OrP24jXZ5kP81nFrIa/FVHuXn7N
	TVzyqwpoZAA==
X-Gm-Gg: ASbGnctac7qml8u56R7cTVq2nTVuVnKsDp664giEFfKJEUL1b1RBsc7hcp1MdyMchWL
	R3Y23beJ5JlhShoATWNs1YJ3zGM1YM8SQ6Q3+WkjJmNMNSpFewrIrQWL6dGaHE3Ylcan6+u1xi4
	Vjzz6b3BILaFb+DjzdMy84T63ZjDFM+P2VBKOAcZe13tfrvbMkVLYL1S31AqSpgKFMU/WlF6jVp
	PfFT8tepF9cCrca/H3EefhJ++p6PMRI/Gsz6l/kn4YURhF8bzpvpwsIfNhq9piQKIp/QelyxxIh
	KuWsMDBs/ZGHmZHJrvlbSVGBE74oWU880MKGydsdtJez9bMqbKso90auJtLBXOXAouzTAvO8u83
	/5s3F5pBHcMNZ3uY4ZR+6HWy5asooZzsbNA==
X-Google-Smtp-Source: AGHT+IHiWq2tZ0Zh+6RCMZ5n4YEMDF8GDIlS1UolWn0dcdm4mJQCk7ANF/Eeoayp4tEVnT1oJJ4YdQ==
X-Received: by 2002:a05:690c:6089:b0:723:9ba7:7f9e with SMTP id 00721157ae682-73064cfc375mr30364727b3.25.1757689858316;
        Fri, 12 Sep 2025 08:10:58 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:58 -0700 (PDT)
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
Subject: [RFC][PATCH v3 13/16] sched: Add sched_get_runqueues_area
Date: Fri, 12 Sep 2025 18:08:52 +0300
Message-ID: <20250912150855.2901211-14-eugen.hristev@linaro.org>
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

Add simple function to get the runqueues area and size for dumping
purpose.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c  | 15 +++++++++++++++
 kernel/sched/sched.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9af28286e61a..a054dd1fda68 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -120,6 +120,21 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 
+/**
+ * sched_get_runqueues_area() - obtain runqueues area for dumping
+ * @start: pointer to the start of the area, to be filled in
+ * @size: size of the area, to be filled in
+ *
+ * The obtained area is only to be used for dumping purpose
+ *
+ * Return: none
+ */
+void sched_get_runqueues_area(void **start, size_t *size)
+{
+	*start = &runqueues;
+	*size = sizeof(runqueues);
+}
+
 #ifdef CONFIG_SCHED_PROXY_EXEC
 DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
 static int __init setup_proxy_exec(char *str)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b5367c514c14..3b9cedb1fbeb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1330,6 +1330,8 @@ DECLARE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
 #define cpu_curr(cpu)		(cpu_rq(cpu)->curr)
 #define raw_rq()		raw_cpu_ptr(&runqueues)
 
+void sched_get_runqueues_area(void **start, size_t *size);
+
 #ifdef CONFIG_SCHED_PROXY_EXEC
 static inline void rq_set_donor(struct rq *rq, struct task_struct *t)
 {
-- 
2.43.0


