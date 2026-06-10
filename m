Return-Path: <linux-arm-msm+bounces-112535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id swo1Nw6lKWocbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:55:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7ED66C13F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:55:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=VmK1jSWl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112535-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112535-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B39B31998C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A40352F85;
	Wed, 10 Jun 2026 17:53:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC56D34E761
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:53:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114014; cv=none; b=K8lnFzcZth7pS2M6KJoP3gG4wqTRgelNX5L8fgEG4O6E/yMmHaNY0e8rLYDn9fUOIC6rCqndNv0VBggqO3xkME0qyafUGPGAJbQgM2hPG0DdCtAF0nmWskG34M/hr1Rf/NhV91CvDXQ3haZjzu4i2oFVNeOr2eDSUpCNNzftuh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114014; c=relaxed/simple;
	bh=p6rrNjzbXKhncoEPrd30ewgBUgvwvZlW5lIUleqXl90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHOCf7SYqOXGz9xDWP6jICX8fYqPJXwPZHA1N8EsKzbaPR8o9cEu47Zsua5umBm6OvSeW7Ibu3UKx53tsE+K/l/rUR4zY+Q0arbTshleVaxSxD7gzWlKcOhKQAaDteYc5JRMmq6gP17XEdXS9sYT8ZDlkub9hcCM6rz+8NmNdBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VmK1jSWl; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5357398f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114010; x=1781718810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EATPXEB1RDeFojesY+qsHCN5Elyd5D9oGU90SkPET0U=;
        b=VmK1jSWlZZldpo78YsiBmQ98Y3+hrUGA410fqi/2cZSBINUZMDagars1ggSvaaez/2
         LqFf+CMYdDgSB2GNVKGjI6jstM8auOZNUgoapRorOuS4ZwuqKipraJrZ0js95KnfoJ4h
         ccFjJhu11MLlD6MOZChKUOr8cPzEFFeZ1aJtlBODsZG+hIesyD6A3hNboQTHTOLDQJYD
         p6JJDI8m9mvttC1riYAgHbtpac3JGwJrQYv6raJHLQoLGg2eltixFFzgfkFbxzLKrqnh
         OkhM4Cdor4LwUBRRCTZevDjXKvJRWPmCdxhQ9UdpYjGNS2szxv6x9Xp+0VlQLq9+HCr8
         QWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114010; x=1781718810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EATPXEB1RDeFojesY+qsHCN5Elyd5D9oGU90SkPET0U=;
        b=A0Ec2ARrxfXgx68MT7MQ1STqGUwbEgmTSnIEr/djEBIKXY2dsAt+5P5Mpv+Ge7JDGe
         a5jZJMhlZTd0o9f4DpwyVZfyxFu/fwavOecxztI9CATW4o3guQoKqPHflhk/hc65/Dug
         CAUgYjDFUsGUxwYGBeCGzRYGOyME4bzSNkkYl5G1fkzTutYc+KnCDjGFG41anz1K9/Db
         rISWS1kADpDGCqGvraqpxq4Frzc+D2Hy9Etu7luMyOW3Hbv9MXkd9ovohdE8zI8Z5gTv
         rjOY8RlGHWjrYYv5j9xdqNVW6UxV9P+t8ViARU6HDNB/Fp3s0hNAi/1LicowAP9HDneE
         dtFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xlGdXIlXLIgWl2zl8RbZZoUFtBX5VG2X5YtlBdb2xZFfHJa1eaITPpndOh+QfjF2o1vrE7uLyKS++SqGb@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7pcKQCrwzZYiXVatvL6KiBmucu70XCnrafRSTfiK545KGmnL
	v/tRddvDjPurX0olxSJ4k4m+9zkzC1p79rTmlnd55aldRCsN0QE5GbQzGWUYdp+8bU0=
X-Gm-Gg: Acq92OGW2SfsVbRBNDNyeQW+8m0Ut1z73w86mYqiJ1G/bBnMk+wEptdwvBlHiYTIiuO
	AS+qmhoUod2S0Cx0TTtyZqKeSGQOUG/xulpgcmlEj10bXXwwOV1fNyLFwSqAD9d2ggPpAHUeAVQ
	n7m9wSuGEJftxmm0fbfmDZMcsNpR0QCl+PnYQf+8r1Vgy7O7Ah8HjPQLVueM5St3zkHFi+Q6e6N
	30A2KTQLwUbYPlfmaQ+1KSQk/KHPNQYC3QVC5dOgDznh8/0FPZbSo4e0RZEZyjRF2cBSZFhD1uc
	2GO9QEgfg1TdKXAMFRBznxWZy1ble3EhYf8NOxScCxzJvWULiubqrlwZJivr0o2akgSWr72L9dp
	TFesX5IvpuBll2oJavFC0hwHPhES4YlzHYyl0L3kR6H+xEZLemVqvcbEEptaSyH48cDW0V6YY1w
	w66en1SnqbWzAljpBsqNObHesKzxnqVfEX9lmP3T9dwLH1UA==
X-Received: by 2002:a05:6000:713:b0:460:1a52:8a13 with SMTP id ffacd0b85a97d-460301825femr38896171f8f.0.1781114010356;
        Wed, 10 Jun 2026 10:53:30 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm73553248f8f.9.2026.06.10.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:53:29 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jun 2026 19:53:11 +0200
Subject: [PATCH 2/2] clocksource/drivers/arm_arch_timer_mmio: Restore
 support for early init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-arm-arch-timer-mmio-early-v1-2-ac17218ec8b4@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112535-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,jackmatthe.ws:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B7ED66C13F

Some single-core Qualcomm modem platforms (e.g. MDM9625, MDM9607) have an
obscure timer setup where the global Arm MMIO timer (arm,armv7-timer-mem)
is used as the only available timer for the CPU. This setup used to work
fine until commit 0f67b56d84b4 ("clocksource/drivers/arm_arch_timer_mmio:
Switch over to standalone driver") when the early timer initialization
using TIMER_OF_DECLARE() was removed when moving to the standalone MMIO
driver.

We need some timer early to run properly, so without another timer in the
system the only choice is to make the MMIO timer available early again
using TIMER_OF_DECLARE(). Use the refactoring in the previous commit to
reuse most of the initialization code in the new standalone driver and
probe one timer early if required. ACPI-based systems and platforms with a
CPU-local CP15 timer continue to probe the timer late as before.

Reported-by: Jack Matthews <jack@jackmatthe.ws>
Closes: https://lore.kernel.org/r/46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws/
Fixes: 0f67b56d84b4 ("clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
I couldn't find any existing (fully-supported) platform upstream that
relies on this, so I omitted Cc stable. MDM9607 does have most of the
necessary drivers upstream, it's just missing the DT (I would like to
upstream that once ready).
---
 drivers/clocksource/arm_arch_timer_mmio.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index 5cb94051c4be..d128dff7067f 100644
--- a/drivers/clocksource/arm_arch_timer_mmio.c
+++ b/drivers/clocksource/arm_arch_timer_mmio.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -409,6 +410,8 @@ static struct arch_timer *arch_timer_mmio_init(struct arch_timer_mem *gt_block,
 	return_ptr(at);
 }
 
+static struct device_node *arch_timer_mmio_early_np;
+
 static int arch_timer_mmio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -417,6 +420,10 @@ static int arch_timer_mmio_probe(struct platform_device *pdev)
 	int ret;
 
 	if (np) {
+		/* Check if timer was already probed early */
+		if (np == arch_timer_mmio_early_np)
+			return 0;
+
 		gt_block = devm_kzalloc(&pdev->dev, sizeof(*gt_block),
 					GFP_KERNEL);
 		if (!gt_block)
@@ -436,6 +443,46 @@ static int arch_timer_mmio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id arch_timer_cp15_match[] __initconst = {
+	{ .compatible = "arm,armv7-timer", },
+	{ .compatible = "arm,armv8-timer", },
+	{}
+};
+
+static bool __init arch_timer_mmio_has_cp15(void)
+{
+	struct device_node *np __free(device_node) =
+		of_find_matching_node(NULL, arch_timer_cp15_match);
+
+	return np && of_device_is_available(np);
+}
+
+static int __init arch_timer_mmio_of_early_init(struct device_node *np)
+{
+	struct arch_timer *at;
+	int ret;
+
+	if (arch_timer_mmio_early_np || arch_timer_mmio_has_cp15())
+		return -EPROBE_DEFER;
+
+	struct arch_timer_mem *gt_block __free(kfree) = kzalloc_obj(*gt_block);
+	if (!gt_block)
+		return -ENOMEM;
+
+	ret = of_populate_gt_block(np, gt_block);
+	if (ret)
+		return ret;
+
+	at = arch_timer_mmio_init(gt_block, np);
+	if (IS_ERR(at))
+		return PTR_ERR(at);
+	retain_and_null_ptr(gt_block);
+
+	arch_timer_mmio_early_np = np;
+	return 0;
+}
+TIMER_OF_DECLARE(armv7_arch_timer_mem, "arm,armv7-timer-mem", arch_timer_mmio_of_early_init);
+
 static const struct of_device_id arch_timer_mmio_of_table[] = {
 	{ .compatible = "arm,armv7-timer-mem", },
 	{}

-- 
2.54.0


