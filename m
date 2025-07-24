Return-Path: <linux-arm-msm+bounces-66560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F98AB10C62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD6385A7EF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CB42E5B10;
	Thu, 24 Jul 2025 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rEOHDd7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B12E3B18
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365394; cv=none; b=dn6aDvcxywNLYMGsqCid+a/u2RBhbm3c6QqmSrin0U/1H6LpwHezsINw7unBVgs0uNin2Q3sV7j8P/nhFkgFnY6GlAzViounGdeSy04IfFDf2ldYjRTPcBtXilgs1qAWmkIHvCYS5sFMx0H2WsiE6QamYh+vzywqqGQt3A8jih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365394; c=relaxed/simple;
	bh=ghY+GwpjKzXQo2zgURX2uB3oB2874ijEbWShVaN08k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BteS5ddZDzowvJQ1hia9Q4ZYPV/3ATo53E6YKIdUkjL7QofCilILhVcb3/N+2d9TsU7kQ4+YQi2FI1kpaGwneGLURWN9Bet7/kHU/1aJB2lUmdnH7l0Bup0PryExZhQoI+RpJQdt5dDIA2CSDF7nvOyGV1lQW/bljkrrt0YaB4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rEOHDd7Q; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso646868f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365390; x=1753970190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SReSPaHbR3saXb697Yp9wPF5rwCm4qBMUK6NGh7oWew=;
        b=rEOHDd7Q8N2mYG5T6Unnixnoe176QqAN/bsTATidQzaTXYl8x6Fl7kfvxRo+ZWK4pc
         qMPiNcCtEXI/oOonec1lsGzrOXHoDqJ3VDuKDkuiRI9iifVqADHi3VMHybE8rEeRnfT2
         craY5TpZD6e5/X0OKbBzvy6zU6R5MiPYMHWfNs9a8ertibJByaQ1NYIaJ6koM5ZnZ0Sn
         7NpwjIqHtMAAtK6Y5G8b20QQ9wWOoneaAVnyoKgbSWe+n7xqx4hzWKiNTIIeQU3fJn6l
         eshPWsHMwEdHl5/6TtzTyIIVGndSQqVeaTyF7w88+qvU/tpL7QZ0qI2fL+YnilChs3qE
         Y+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365390; x=1753970190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SReSPaHbR3saXb697Yp9wPF5rwCm4qBMUK6NGh7oWew=;
        b=PgtmnplF8kmZosDs9Ow78NtIu3uCCTfWs8lfifZJvw6yTSBN7baDhATqDBA9742DEd
         E74TowVFjM8jl542YanE8fxhtN724DsnU8fIbRD15CBUssC8CCHw/GO3LEt5wFbKCq4l
         remCEWOONkS4e0Dj2E+cSS5SO7tV3tYQOPFmcPG7jWWhufn53KAIUrTuTSYHxx3wHaNh
         mn0MfPu5w3yx2Yb+2gloC1W0ysotSCD/LkTOrGBP2Vft/RhAasXHwtuVSRdptp7hdkv+
         RpIaSHBBxqOkESQX6UzRIYVaCr/mKYyTb6h+6gF5ku89Hu9S7qIHJc+RA1TjUkSdY2ee
         IM7A==
X-Forwarded-Encrypted: i=1; AJvYcCWnkwkiqQMC39QwN2AHjMdrvZKcjt52+h/SJQ1BvCQx1wgWOr2bep0ybcwl27fhjhuHvITC9savcZYH1AUF@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+FVAtOoVlzssNNJH6rdRUU68L3n6y3tzlfxKh0AHf7+nrtrj
	ux6l25uLXBEaTHkoSHSKdaa0+8NSlUiOK/ZNfRxb7jIJW4/AnWc1UeeqiPwFepAZ+wQ=
X-Gm-Gg: ASbGncuahdDQyxI9qf3fO5yF0r2//EpytORQ2KVBGqC6b1dOpBceCOOMjyoswCy4fX7
	beyk8T5Gc6bEzup2MEjF3XiDTYdvrJwHoIdTuSEGUFJwgOHkfziUMp5GZ73RRnVUq1wW9u+ZkN+
	t6AcHyU7y8oWyfS5auIC9iS49/WGQD3ZYauxroOC5moKoCxTb/im/2W8haIXuMFEKSJAZenK2z3
	syz9F7zP4ceAgd3snLJqwQlipA++mNVAMZHKjO7QH5UEb2BJiC4E/5Rg/JQPb81cqeIaGR70F1B
	2fe1CqDXXNiPhrz5H2xvMbL8LJLNe8xGbymuxozsoF18DT8iAz+I224+ZDvzVHeUJ6C7t0G/Rwa
	eJ1pAuvRBl8W33eafaqY1QXCu/HPdOm45rqP2pjftEUnrT7K9cCG1QI7d1flDFZYrIQ9YsRn6SI
	dqf+BI+eeuZUNI
X-Google-Smtp-Source: AGHT+IE5OpzTZyLft1dF8PAF1zWD0A9y1GJkIKlmiY5JcqmC3+aHq3C9hKZiU8MWr3uj6ilv3EjyHA==
X-Received: by 2002:a05:6000:2c0c:b0:3b6:333:256f with SMTP id ffacd0b85a97d-3b768f27e15mr5395112f8f.58.1753365390310;
        Thu, 24 Jul 2025 06:56:30 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.29
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
Subject: [RFC][PATCH v2 09/29] genirq/irqdesc: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:52 +0300
Message-ID: <20250724135512.518487-10-eugen.hristev@linaro.org>
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
 - nr_irqs

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index b64c57b44c20..6d11b85be2b3 100644
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
@@ -140,6 +141,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 static unsigned int nr_irqs = NR_IRQS;
+KMEMDUMP_VAR_CORE(nr_irqs, sizeof(nr_irqs));
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.
-- 
2.43.0


