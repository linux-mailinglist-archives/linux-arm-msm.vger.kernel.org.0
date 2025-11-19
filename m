Return-Path: <linux-arm-msm+bounces-82550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562AC6FDC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DED14FEB47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB21366566;
	Wed, 19 Nov 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2cvfbXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5C7377E85
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567154; cv=none; b=PN/lpnoznjeZEZsw8xj5frZYjJylFIUQslWcmvYYDr5e5BL12o8zjqjIg2brde3e7uqpzGj/XonXy9uPlfOwqhkIkPRfmR0ErFPhrOAC4HiaDsgjgj4edcUfbL9ZlvYEJfRLxkZpVioeV0zlG42XECbaArRQkUZNBCEVFwx1ExI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567154; c=relaxed/simple;
	bh=puCNsUx1cqEsVIIsTQXC2Zu04afcvVugn2nqwtYBNCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0tXHPZjX/3HgSG5KsScONZTFmAPhZqsjQ3aDtIhujW8/bqv3vKKiAnGYlEjiNfpO3SK5P63OEBPTYdT7zymDHUSxmkcAct2TlvnjJD8k70q0t0HPX1XQCGP6A1v4N2MNxi+my5yAWDU8tHP09KaXLeTA3EuEVTsYCPkpZYNXNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2cvfbXn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32900c8bso3968898f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567146; x=1764171946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=;
        b=u2cvfbXnHZX8S86mhbmVlDKoHQ2qZIBOHUToZr3q51jGLlJFmHxxQcU/fm1uw3dr/L
         ryR8SU3D5iO0H6+339AdAvKpGNAn1CK6/oOlstGHI4cd4xG6+/w44Ge5Or0ybjFmHaS3
         TmyiHTUji9gaHk7uex4IBqSQYtfvzqDF4k1l4LfR1824PbZuKmIt9zwUJc4RzpmuIicf
         FnV8EwOu8LdVRf/aAcAWgL+Gv4kc4rnhvuoRDiBZpPwDdKCtUw0xPkaSpKH5yXwWXj/t
         JHK8eUL5sBMFkiK5dz64vZJDZsK1hF9kybnlSUvlmbITELWgyWL8yGyyhYzSYh/yxDZ1
         XWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567146; x=1764171946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=;
        b=CMDxlx6ZyO+gHjZA89WErxxu+RvkerfYGsOvDLZiXERl1qDdWjH5yuR14NWrk+kLns
         O54fc/RBGPq5mAbYjSOQRj77zW77yHMW1LE3/U7HADw5J5EEtTLKhLW2oJxsWot0YOUs
         AwFIk2rlHnO4bX8tYbix8tK1FaLOHqUqMNP4MKcn6NDv9CYx37xv17mlPlfugD3aaBN8
         9kD8ZG2C9X5gCDCHyyqhkCqM40mdbM6gnwYZg0XgXlpVF92ySVorUatzv9QO5AQpG5rq
         IQzQXdoLc6EwLlUd0Tdn0fk7z3eNm1HxOO0MXzTwurCxEC78gMd7xjgAGG8El+gNZGbk
         GcPg==
X-Gm-Message-State: AOJu0Yxj7r7c/DvuPSUKV7VK556pP3r84R9RHGfSrQzvGL9MC7Ir9ONA
	Soen0Dy18jRfzc907pjsn4rgl7wbW12PdAPrvbjszDK8+5oYaVbYlB1BDQGp1aVWw/YnOxlI0Iu
	FStHlkmTF/g==
X-Gm-Gg: ASbGncskqbautz2q8bt1z+OnDFOFHap5NdcUbQJd/hgTQctgDhnFt+RUTn+h07o+w/Z
	3x7bLcg+mwlFoxSiewgyO5etuDD/5nn5HYGqWscWh+yKANe1hQmkCje8wKMQqbE4v83HeGH20Qa
	7PUasrHJOW210PTIpIyHqb3hBNRV3ubumb8R9rCa5FOECQtGj3TSRlDHB9gsauxpoHbltP+p8MN
	qNe2ef2XshIlV1NF0EjeHOyp8SMkfsrfq9lFNV/9dH/OXNW64kJEM5kKB3VDFvLPWmM4cNY/NUJ
	yzy/NHHcvsG04LkDQuNte3PpVUCu7srPqTtahurgmD3frYhqqp8UMQtJIszIDkP8+IAXmwckayX
	RTlW2aRGl7QKRV5eVg+8mz1Nu5opB7NETWO3F+ckn2bmXXAQbbCZK969Q0g5YZvUigxckRgef/z
	vyjfp9XaUGi86omdyKBvA=
X-Google-Smtp-Source: AGHT+IHSn97ivXqqEi+3+TEBhok4L0zKY5jBJq8AwBEmyjMgjDaigOLXet9t8Pqm4XTXHvlHGh5HZw==
X-Received: by 2002:a05:6000:2891:b0:42b:39d0:638d with SMTP id ffacd0b85a97d-42cb1f9e35bmr3506384f8f.28.1763567146421;
        Wed, 19 Nov 2025 07:45:46 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:46 -0800 (PST)
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
Subject: [PATCH 17/26] sched/core: Annotate runqueues into meminspect
Date: Wed, 19 Nov 2025 17:44:18 +0200
Message-ID: <20251119154427.1033475-18-eugen.hristev@linaro.org>
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

Annotate runqueues into meminspect. Even if these are static, they
are defined percpu, and a later init call will instantiate them for each
cpu. Hence, we cannot annotate them in the usual way, but rather have
to call meminspect API at init time.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f1ebf67b48e2..a68367daddb4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -69,6 +69,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -8792,6 +8793,7 @@ void __init sched_init(void)
 		rq->core_cookie = 0UL;
 #endif
 		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
+		meminspect_lock_register_va(rq, sizeof(*rq));
 	}
 
 	set_load_weight(&init_task, false);
-- 
2.43.0


