Return-Path: <linux-arm-msm+bounces-112533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f5bBE+WkKWoEbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:54:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3CE66C12E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:54:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=y4bSLr1e;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112533-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112533-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1FB530DF6C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55DA351C11;
	Wed, 10 Jun 2026 17:53:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AA5311C36
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:53:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114012; cv=none; b=MKDUZhZROHVgYl8PJ5UKV+f+go0o5j81jgo7+rE2I9dmPU5grJAjgetIK0lFnOoQoT7eAYAhErFgvc7ZF6Vm2wuRcFAQ3FpXA4gRzckmQ5s8ktiFqWAb0iWeXgCIUwIUxVcZZOutHvFq1diDF6VVapKdCE7lvttnscwjtRX71L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114012; c=relaxed/simple;
	bh=04KxwWaijKHOyDQFsfWuEYIn0hzv1gfGK6FAFg1/aAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4wT1fG1BNmsv2H2sWYznDd3Bhbb0ZkuBtQs8q3mNbyTmMwfysgz73gb7SJgwOQ3iVQranHMgAB/caVTa7D96P8UqP5EP9X37f7aU1qBgBe65WdfiipE5/zpBrX/sZ8m6cnyv8+CxyQRWB6Td6UyxAlMrJRE3ONwujfUNN6gejM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y4bSLr1e; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46013161068so3631591f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114009; x=1781718809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wGuO+lQk/MjIiPNsRYyx6BtR+pKFF6jcGfnBax9vYY=;
        b=y4bSLr1eTYGKwu7zSTFVwc13Y0jAJ4Ha4IkMCRmIMis2mVlym3lX5DH9Lvcvj3/jU1
         QKWhFS5G0JwvVhg3KPfT7D1f7TwXjkZ6GM+JUDp9XXE5Q91iRbZNV/1DxqvRT+bNFyfr
         sVw2AljPgVgewGzqpRNK6TkXFcIxVAbXf6jmlVRh9dE6kPBErMKay/VmspCHpvEJobS5
         Yd2wueLDpnkuBY4YxIZ4uYwry+wW7VBYo4QyiM9m+vyDUDcYNmixJNCgEe03+fFUsmvo
         xEk2i+OAzhaJNHJY88C1up4OJtqVU7RieNl/4Ir9+9mUoLXgkTkI5q7c4xqPHzw/tc9r
         PKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114009; x=1781718809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5wGuO+lQk/MjIiPNsRYyx6BtR+pKFF6jcGfnBax9vYY=;
        b=Pw9dOns1mqsZkPVzYwULFZTbtfNPh31IrPrXR+KUy4ivGrqkDh+WtnAJBs/WX20Wt6
         pH7mibNmMF11ppsXGM7AC4VOpx6FkTm7sUqCgywBzhmHiU+9qhaZ/CdhK4kTCpXOvo9o
         gbv0o5pIe9ZycFSCkvK8tJhaXbu2PPC9jNPwRHwtzylf8Hpyqb/B7PzLHeqDDnTZ9WeF
         5Yrut/sp9IVTzVwuWdcHLW8oTeUaDSmZmQatV4gQBCWqGvCLVd64m2IC4z7u3lMISJYc
         cuJqr6B+g0lylp3YcwT/QGQ4UVnmNyo0HqL9cWBO8tbvTA1mfp0aKrrHNNK3YJhvZ+6m
         85Tw==
X-Forwarded-Encrypted: i=1; AFNElJ9aT+OQUHDIJL+xslnyiR+wHJGooIV56XtvkBjINCrZkTTX0AA9t4hi6s+LLhUS28obPRRjT571omAqEwE+@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwE8Ua8tEwZ1y7DF3WCdJprFWJFyuUXsDmamOyJswNgZ3D7WJ
	4nMBrTsZ3321npAzfXlLpkBhO/mzk0OCl3Ml7YL36nCz/Wj48ARQrcnqvZbUfZWkkWk=
X-Gm-Gg: Acq92OHihSTD8eWXFfuFFCdcMjSGEp+jE8mFl/t9oF9Qtt3bVkFurDh/ckXIUNeIuxB
	/yQ8OV0xYQselQJXEqYJYxOdzpJSjHiEUgjTmwPWgqwTsvVhXHIgoaFlGY/AgxJ+V/tSMlfavo0
	1yw1lTLk72Vc1DWvtPSgl652pULOOu1Vk4wUTRozn4Lnr7qrjBxnlJh+KK/k1aS9rtgrnnwob6/
	WC0NBToS/y9TPrfHz9frYV7aAMcd8GZ4oyQmnKj9aA+KvEK1OjNY+FYYDqgNhIUUCS5OROkXZEJ
	HlgF0MK+9UkJz9j3tsbBBAFA82xsvyKaxbN5lp9IrZhXNBUPjXgbl5Jrm6nfskWZEuxckvK5WXK
	5L7yYgLYNmTXGf+q3x1ImXpOyN3yC46SuZF16geIZQadOHu/N6d5Q6MPMqMS7hm47VCAz9GIwWw
	XCFTxuDRSp7uae7ksWNcjBuAbrR8TQC5y3PPbd+F3TWulU/tAtITjgY/uP
X-Received: by 2002:a5d:4252:0:b0:43d:7bc9:9b2c with SMTP id ffacd0b85a97d-46030510fbbmr27016713f8f.17.1781114009487;
        Wed, 10 Jun 2026 10:53:29 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm73553248f8f.9.2026.06.10.10.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:53:29 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jun 2026 19:53:10 +0200
Subject: [PATCH 1/2] clocksource/drivers/arm_arch_timer_mmio: Refactor for
 early init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-arm-arch-timer-mmio-early-v1-1-ac17218ec8b4@linaro.org>
References: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
In-Reply-To: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112533-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mark.rutland@arm.com,m:maz@kernel.org,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:sudeep.holla@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jack@jackmatthe.ws,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD3CE66C12E

In preparation of restoring support for using arm,armv7-timer-mem as an
early timer, refactor the driver to allow early initialization without
a device pointer. Replace uses of dev_() logging with pr_(), replace devm
helpers with manual cleanup or scope-based cleanup helpers where possible.
Create a new arch_timer_mmio_init() function that performs the
initialization and registration without a device pointer.

This is not very pretty, although given that the driver cannot be removed
at runtime due to .suppress_bind_attrs = true, at least the overhead for
the manual resource management is limited.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clocksource/arm_arch_timer_mmio.c | 139 +++++++++++++++++-------------
 1 file changed, 79 insertions(+), 60 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index d10362692fdd..5cb94051c4be 100644
--- a/drivers/clocksource/arm_arch_timer_mmio.c
+++ b/drivers/clocksource/arm_arch_timer_mmio.c
@@ -10,7 +10,9 @@
 
 #define pr_fmt(fmt) 	"arch_timer_mmio: " fmt
 
+#include <linux/cleanup.h>
 #include <linux/clockchips.h>
+#include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/of_irq.h>
@@ -191,17 +193,16 @@ static irqreturn_t arch_timer_mmio_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static struct arch_timer_mem_frame *find_best_frame(struct platform_device *pdev)
+static struct arch_timer_mem_frame *find_best_frame(struct arch_timer *at)
 {
 	struct arch_timer_mem_frame *frame, *best_frame = NULL;
-	struct arch_timer *at = platform_get_drvdata(pdev);
 	void __iomem *cntctlbase;
 	u32 cnttidr;
 
 	cntctlbase = ioremap(at->gt_block->cntctlbase, at->gt_block->size);
 	if (!cntctlbase) {
-		dev_err(&pdev->dev, "Can't map CNTCTLBase @ %pa\n",
-			&at->gt_block->cntctlbase);
+		pr_err("Can't map CNTCTLBase @ %pa\n",
+		       &at->gt_block->cntctlbase);
 		return NULL;
 	}
 
@@ -277,22 +278,21 @@ static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
 	clocksource_register_hz(&at->cs, at->rate);
 }
 
-static int arch_timer_mmio_frame_register(struct platform_device *pdev,
-					  struct arch_timer_mem_frame *frame)
+static int arch_timer_mmio_frame_register(struct arch_timer *at,
+					  struct arch_timer_mem_frame *frame,
+					  struct device_node *np)
 {
-	struct arch_timer *at = platform_get_drvdata(pdev);
-	struct device_node *np = pdev->dev.of_node;
 	int ret, irq;
 	u32 rate;
 
-	if (!devm_request_mem_region(&pdev->dev, frame->cntbase, frame->size,
-				     "arch_mem_timer"))
+	if (!request_mem_region(frame->cntbase, frame->size, "arch_mem_timer"))
 		return -EBUSY;
 
-	at->base = devm_ioremap(&pdev->dev, frame->cntbase, frame->size);
+	at->base = ioremap(frame->cntbase, frame->size);
 	if (!at->base) {
-		dev_err(&pdev->dev, "Can't map frame's registers\n");
-		return -ENXIO;
+		pr_err("Can't map frame's registers @ %pa\n", &frame->cntbase);
+		ret = -ENXIO;
+		goto err_release_region;
 	}
 
 	/*
@@ -310,49 +310,56 @@ static int arch_timer_mmio_frame_register(struct platform_device *pdev,
 		at->rate = arch_timer_get_rate();
 
 	irq = at->access == VIRT_ACCESS ? frame->virt_irq : frame->phys_irq;
-	ret = devm_request_irq(&pdev->dev, irq, arch_timer_mmio_handler,
-			       IRQF_TIMER | IRQF_NO_AUTOEN, "arch_mem_timer",
-			       &at->evt);
+	ret = request_irq(irq, arch_timer_mmio_handler,
+			  IRQF_TIMER | IRQF_NO_AUTOEN, "arch_mem_timer",
+			  &at->evt);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to request mem timer irq\n");
-		return ret;
+		pr_err("Failed to request mem timer irq for frame @ %pa\n",
+		       &frame->cntbase);
+		goto err_iounmap;
 	}
 
 	/* Afer this point, we're not allowed to fail anymore */
 	arch_timer_mmio_setup(at, irq);
 	return 0;
+
+err_iounmap:
+	iounmap(at->base);
+err_release_region:
+	release_mem_region(frame->cntbase, frame->size);
+	return ret;
 }
 
-static int of_populate_gt_block(struct platform_device *pdev,
-				struct arch_timer *at)
+static int of_populate_gt_block(struct device_node *np, struct arch_timer_mem *gt_block)
 {
 	struct resource res;
 
-	if (of_address_to_resource(pdev->dev.of_node, 0, &res))
+	if (of_address_to_resource(np, 0, &res))
 		return -EINVAL;
 
-	at->gt_block->cntctlbase = res.start;
-	at->gt_block->size = resource_size(&res);
+	gt_block->cntctlbase = res.start;
+	gt_block->size = resource_size(&res);
 
-	for_each_available_child_of_node_scoped(pdev->dev.of_node, frame_node) {
+	for_each_available_child_of_node_scoped(np, frame_node) {
 		struct arch_timer_mem_frame *frame;
 		u32 n;
 
 		if (of_property_read_u32(frame_node, "frame-number", &n)) {
-			dev_err(&pdev->dev, FW_BUG "Missing frame-number\n");
+			pr_err(FW_BUG "Missing frame-number for %pOF\n",
+			       frame_node);
 			return -EINVAL;
 		}
 		if (n >= ARCH_TIMER_MEM_MAX_FRAMES) {
-			dev_err(&pdev->dev,
-				FW_BUG "Wrong frame-number, only 0-%u are permitted\n",
-			       ARCH_TIMER_MEM_MAX_FRAMES - 1);
+			pr_err(FW_BUG "Wrong frame-number %u for %pOF, only 0-%u are permitted\n",
+			       n, frame_node, ARCH_TIMER_MEM_MAX_FRAMES - 1);
 			return -EINVAL;
 		}
 
-		frame = &at->gt_block->frame[n];
+		frame = &gt_block->frame[n];
 
 		if (frame->valid) {
-			dev_err(&pdev->dev, FW_BUG "Duplicated frame-number\n");
+			pr_err(FW_BUG "Duplicated frame-number %u for %pOF\n",
+			       n, frame_node);
 			return -EINVAL;
 		}
 
@@ -371,50 +378,62 @@ static int of_populate_gt_block(struct platform_device *pdev,
 	return 0;
 }
 
-static int arch_timer_mmio_probe(struct platform_device *pdev)
+static struct arch_timer *arch_timer_mmio_init(struct arch_timer_mem *gt_block,
+					       struct device_node *np)
 {
+	struct arch_timer *at __free(kfree) = kzalloc_obj(*at);
 	struct arch_timer_mem_frame *frame;
-	struct arch_timer *at;
-	struct device_node *np;
 	int ret;
 
-	np = pdev->dev.of_node;
-
-	at = devm_kmalloc(&pdev->dev, sizeof(*at), GFP_KERNEL | __GFP_ZERO);
 	if (!at)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
+
+	at->gt_block = gt_block;
+
+	frame = find_best_frame(at);
+	if (!frame) {
+		pr_err("Unable to find a suitable frame in timer @ %pa\n",
+			&at->gt_block->cntctlbase);
+		return ERR_PTR(-EINVAL);
+	}
+
+	ret = arch_timer_mmio_frame_register(at, frame, np);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pr_info("mmio timer running at %lu.%02luMHz (%s)\n",
+		(unsigned long)at->rate / 1000000,
+		(unsigned long)(at->rate / 10000) % 100,
+		at->access == VIRT_ACCESS ? "virt" : "phys");
+
+	return_ptr(at);
+}
+
+static int arch_timer_mmio_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct arch_timer_mem *gt_block;
+	struct arch_timer *at;
+	int ret;
 
 	if (np) {
-		at->gt_block = devm_kmalloc(&pdev->dev, sizeof(*at->gt_block),
-					    GFP_KERNEL | __GFP_ZERO);
-		if (!at->gt_block)
+		gt_block = devm_kzalloc(&pdev->dev, sizeof(*gt_block),
+					GFP_KERNEL);
+		if (!gt_block)
 			return -ENOMEM;
-		ret = of_populate_gt_block(pdev, at);
+		ret = of_populate_gt_block(np, gt_block);
 		if (ret)
 			return ret;
 	} else {
-		at->gt_block = dev_get_platdata(&pdev->dev);
-	}
-
-	platform_set_drvdata(pdev, at);
-
-	frame = find_best_frame(pdev);
-	if (!frame) {
-		dev_err(&pdev->dev,
-			"Unable to find a suitable frame in timer @ %pa\n",
-			&at->gt_block->cntctlbase);
-		return -EINVAL;
+		gt_block = dev_get_platdata(&pdev->dev);
 	}
 
-	ret = arch_timer_mmio_frame_register(pdev, frame);
-	if (!ret)
-		dev_info(&pdev->dev,
-			 "mmio timer running at %lu.%02luMHz (%s)\n",
-			 (unsigned long)at->rate / 1000000,
-			 (unsigned long)(at->rate / 10000) % 100,
-			 at->access == VIRT_ACCESS ? "virt" : "phys");
+	at = arch_timer_mmio_init(gt_block, np);
+	if (IS_ERR(at))
+		return PTR_ERR(at);
 
-	return ret;
+	platform_set_drvdata(pdev, at);
+	return 0;
 }
 
 static const struct of_device_id arch_timer_mmio_of_table[] = {

-- 
2.54.0


