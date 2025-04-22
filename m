Return-Path: <linux-arm-msm+bounces-54943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CD0A9678C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 075B816E2F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817B427F4DA;
	Tue, 22 Apr 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1a7hL/R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD127EC64
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321547; cv=none; b=teFJ3yjqxBrcSb7PheYQ0PilIB/45ydkVtVH1eIgF50Ugm4vt5ddbodMNgx1RCtZZDwcIaSxLV9G/IwYitk89AAsM/NulxyOKJ7simvdwYg62Y6afd2M1481MM7/4ks9tnubyvVn+aJ89o80g1HmcQiszv2vxOZxV4EKvq7cu9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321547; c=relaxed/simple;
	bh=4jPx8WFc9syd9FZTvpteAC1u4ZAz1jUbRb8VNBeqebI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvMnzPmQlCfboMZinS8mRN8lMWaMyls8rAOs2eoynk01C9r5mWivcwcwLv+3Vfbd0on8r1R0uj1Yz4KC5Xq5BprUwt3X8Pp1E6r51yE3+svvQLrj5/pjmIwzmrGD5ugvIzIgrn8hFq/5Cu4kkvSUMulolGbH/IXlLI72HAgo0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1a7hL/R; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso42517135e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321544; x=1745926344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05bSEWwjsFQoObkjxJQo+JCFAb3Ry4oW7GBGxZnV2N0=;
        b=B1a7hL/RbR/mHHAwFin0SsqhT35t2zsp1Y10DdcQWhryPS3mHpR8CoHFA8mlw8WsCN
         vKoGwMxR/qQuaLoxGXhUoUYhpkC9i4C1q7ElszkIvXaWHBYlukDORSeMYqIn8/5A7IXq
         abmubrCtkWqJjwFtog7f9V2TPf43ijQnS1GlOn57q6gGK7nxMwVoJpAj01dQ8xGnVvoD
         KNQ+BWNNMKEBt1R881SJ4NFO7NXIhd1u0RGlyG6KFCWp3PZFiMQvcd+NKrJaW/Gw46M6
         g0g3Po+yUsAaDaH4fdA7NcjsMe6LIoCSynAELyecJnwuMuDqeL8GH7+QZVF24dofPRmP
         DcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321544; x=1745926344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05bSEWwjsFQoObkjxJQo+JCFAb3Ry4oW7GBGxZnV2N0=;
        b=RKZqB40PtGtPbKa25ZkDSRmqAkCfckvk4xZfPlvCZ34nZJY62/zbnPsscf7VC108nf
         Ef9pSK+ceDbHZI2Wy2B6TtsiUJtH/MjovYQ9sR07/xZm8CUByFTyKg6B8Mqs6Vc2wA6r
         gko9wrcDty2MIaqJ2tJJ7JWBhCJzejijQkdxTkyVHt7Zb9oDAkJzkYowa8eHCVr5B4D5
         Nj29SIhupHTjYgXvdG9xVcy2EsCKATehuMPJEOulzMkYTqiehMmsxTl/QTvOzxUMjCbB
         ZBu6ht0Y5Omslwz+/JOYBCdaFOhg6CBiZnTeS/548cIUaeu22GmzkcNLBkpDP/C+Qu0A
         HEtw==
X-Forwarded-Encrypted: i=1; AJvYcCVxvPk6MdxLBGDPz+Rx2s5aTqQuKoGe8RiUyhvwVtJ3dfK7ZgsPN0UEJyOvTBV7eybpHp+CD8FntlZrFZrX@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYIrcqMHaNygSYiwxH+RTGzZheOaMjnTxy+wv/XZ1Xpqvvd/A
	wQRkDSq19ELH8krey/HZOQCQBbFzCYYBL1DXAHgRyJ1HELl3jCCOnyhmI+N1NjY=
X-Gm-Gg: ASbGnct5IBp+FpKtNZA0PkP2BiXZFX4c52g+9T0YDMfsdqOi3c1+s9MQWxwZiv4Fk0Z
	NkQIHjG4IxR3fXfuQGufdMpwZ1OeG1bNA5Ltb1zfP7SbABiEogLc9OoBSq9BULsD0IJrlVGwtn6
	HVX7nSEBtFAL9SLZlJJv4PIN+K35gGurndcpbsH9y8C7Q/IwheFhu0R+N8q0Md3yj6UFNNatkWZ
	bVNc3/862rzCvv4bXQaeY57iIifjOS2+Fi7W+vYCgXGopJaRQ4XyPPWRebUtHCj9EDQpiAa9rxq
	MGJD+x2VYLHp+awoh4tATbYsIV7CXxIH4swdFioUJlrMDAIHkTKs
X-Google-Smtp-Source: AGHT+IGsfI8qZKkHCIu00QTSDHfliRxo6YWhSw3Jfq+3jp8jtX+qjyzyKnnSEeessnTrVraohm79QQ==
X-Received: by 2002:a05:600c:3d08:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-4406aba7ecdmr157805795e9.15.1745321543774;
        Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:23 -0700 (PDT)
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
Subject: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:51 +0300
Message-ID: <20250422113156.575971-10-eugen.hristev@linaro.org>
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

Add function to register irq info into kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/irqnr.h | 1 +
 kernel/irq/irqdesc.c  | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/irqnr.h b/include/linux/irqnr.h
index e97206c721a0..136f0572ad78 100644
--- a/include/linux/irqnr.h
+++ b/include/linux/irqnr.h
@@ -9,6 +9,7 @@ unsigned int irq_get_nr_irqs(void) __pure;
 unsigned int irq_set_nr_irqs(unsigned int nr);
 extern struct irq_desc *irq_to_desc(unsigned int irq);
 unsigned int irq_get_next_irq(unsigned int offset);
+void irq_kmemdump_register(void);
 
 #define for_each_irq_desc(irq, desc)                                      \
 	for (unsigned int __nr_irqs__ = irq_get_nr_irqs(); __nr_irqs__;   \
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 287830739783..ae29165b1f1f 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -12,6 +12,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
+#include <linux/kmemdump.h>
 #include <linux/maple_tree.h>
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
@@ -164,6 +165,12 @@ unsigned int irq_set_nr_irqs(unsigned int nr)
 }
 EXPORT_SYMBOL_GPL(irq_set_nr_irqs);
 
+void irq_kmemdump_register(void)
+{
+	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
+}
+EXPORT_SYMBOL_GPL(irq_kmemdump_register);
+
 static DEFINE_MUTEX(sparse_irq_lock);
 static struct maple_tree sparse_irqs = MTREE_INIT_EXT(sparse_irqs,
 					MT_FLAGS_ALLOC_RANGE |
-- 
2.43.0


