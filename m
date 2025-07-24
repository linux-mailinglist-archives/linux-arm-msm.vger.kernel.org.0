Return-Path: <linux-arm-msm+bounces-66562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AD7B10C5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18EB2188B1D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83802E6D0D;
	Thu, 24 Jul 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gW9AcyqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288532E2F02
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365397; cv=none; b=edY6aR0aNc/JCfpthXEkD+uWTvzqNCqlM/CgbeRE7EimAUqyLGvcGnASDpqwQgrdmg0mtRItqZcIMnsvOd5KmI3EgDG6obnD9vURJ7UPWj64JKFUb8aVpp3M+lxOtL0zCg34GTK0ymE8n4Cn8fB9sVV+0aNH69d2Fa6uD2I+CNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365397; c=relaxed/simple;
	bh=lInkchUokjBe+FHAH3BxBiq6Y7tXF29NidQLxKe+PNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWOfMozi3Qtml8uQIOrIwHT/3dAMo9MgMHhQ9TZAR6/2FxKPXtbMaAywndS4uhk2KSJuljizluFKBGTJbeCf1CSSPNUSbxwgZO2bbybD1emQJdMypjhzabzb7CPavyQSDtuHaAXUQrkWnHxGTTy+CdES/nTes08HWATeUEEX9yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gW9AcyqK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso7181805e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365392; x=1753970192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl7MPjMQQR9YynEjNt+gG293fesASKmyZt5GnlBVdKk=;
        b=gW9AcyqKuSMhUqviT/CaEES5gWyFk0OxnCjCR0DV8Rfx02S0IQgPMd6CCa6dOcVh30
         63+5SGga433jpyLCKRIXeF4x+RONQMfgfnRhuEXYSrdOc15P7ZP6knymrDIPSnlOXUbc
         zFBeJYEvIP+0Q6l8vESKKOH7mvgMS3go6yHjeswsqDv5pCRNkBsMaFUpGolOHFcK9KIp
         B6bRuQK/BFUJdswR5pSmYLkG3M9hemjwfzoAjOdEICNheo8uqwkwqNhLV8X2BZObm5mV
         YQDLMYBBmiQ1th6CMa1aSDiOzN50Af38DcFCS6QDL1+4TAlQC9tZri6Kb23R6heF4d/x
         wrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365392; x=1753970192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl7MPjMQQR9YynEjNt+gG293fesASKmyZt5GnlBVdKk=;
        b=jTY/0SvQUONIlpTA7URKlpwXDu5C+IGb3aDqV2B6gWnXTsjbqh2tDhPpLToSuD09yA
         d7M54fQNqynZhIXt23rpXd5ADW7QahKABDbGd/aur5M5P8OgOK2RsbT1zTyineQ0Od/5
         51Smy2NKKY92VwydwutO+BOc6LEmRvga/bJndgUteCmEqVfTusXpVYqWIVJSYNrkAMGf
         Xi99o9A+gPfDMR529FB2qbbSjtHUZgyzQYMXfz3c3oaPfI6pTf+Eo8Pvm9DGhx2+QFTD
         Vm5YUEZwF8hxBKGZ2fiFz4r6p44iE+6HdA7Dgwub2NcGeSBUDQYcba7kBuJLFMEH79rp
         lthw==
X-Forwarded-Encrypted: i=1; AJvYcCUD+NlPrwgjHmp3gWtPF8taAzBE5j+rtYqfInRAAN6Em0BfCeebT5ewi+q8sAwdip3aFPvviCcb+VX0DGqv@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZicPGNLPprE6Itl23vzzFU1ryzkpTCFjntSgAmO0rtaY/4N4
	cm3O98wxozZgWKT8D/zWl264ksPlIshZX1w2oNY2X6HmmdI2nLUEhm9qyEbw2Scb5FE=
X-Gm-Gg: ASbGncvkc39AxsGZVh30JTvgiPD96SUtLCc1wiXAfgjyPgcXZQCLS1P0tVC+m7LN2q9
	Xcjq320eJs9TB/ln/ZF9q3DHyHmn1Vu1xwRsjEOvCWasZUxeYTTvG5gMaB2MRWq6ocuC5GpxcFC
	xRRXUwJIL2X7r/qYD2ogyXV2QJIA9M9CHammixlsl6hJHV9VgOOXj+tJbv81QNd3d1Fcu86LEKk
	KDl5wmfHEHJB8ssSksGjASwEYtcEQxkmAR7i6Yi7fQbunAY8BpBhgI5M7y7OuxD+MO/j3Va0UpS
	D3hx9+BmTLYsDleaRUi9Fy/jIGdJIrPsOLOspKkKxCP7Ir5UjkCFp8F9cMBWCfLdKwhuuUJ0UP0
	RnCMfionVMQtpGUhpyf2aVxKa65mk0sugG2oHtsXKzevqvp/Bk3EWVRUBU7iPQTLFTaV62DE6ju
	CcCeTGnHs5k1CZ
X-Google-Smtp-Source: AGHT+IHonQ82jnLO0p5HYq/pDMzB+6N1t6DWFVzcA1CVX2U3nXqH6sJ8SaBoH0rb44h0xr8LW+w4sw==
X-Received: by 2002:a05:600c:6992:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-45868c99c85mr63756925e9.12.1753365392038;
        Thu, 24 Jul 2025 06:56:32 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:31 -0700 (PDT)
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
Subject: [RFC][PATCH v2 11/29] sched/core: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:54 +0300
Message-ID: <20250724135512.518487-12-eugen.hristev@linaro.org>
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
 - runqueues

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2343f5691c54..18ba6c1e174f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -67,6 +67,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/kmemdump.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -119,6 +120,7 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_update_nr_running_tp);
 EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
+KMEMDUMP_VAR_CORE(runqueues, sizeof(runqueues));
 
 #ifdef CONFIG_SCHED_PROXY_EXEC
 DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
-- 
2.43.0


