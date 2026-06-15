Return-Path: <linux-arm-msm+bounces-113268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FjNqNUyAMGqKTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:44:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9668A758
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:44:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=W5lxvnLC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113268-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113268-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61E9B3079603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 22:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC003BF69A;
	Mon, 15 Jun 2026 22:42:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4783BBFA0;
	Mon, 15 Jun 2026 22:42:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563324; cv=none; b=X47FNr9hEjzg0DQs8lCd8uqCJoV6nRVt0w7kCl1h2DHUPbAuqstTLF1JhK5MLAkI+sBmniyjrtpaQCvU+S8Wd1xYmwcqNVie0ANAAEiTb+Z7qTgaxw2p56DZJOKwiUsrKwbI00Ejs0s4d2OvK09egYTiJA0ILYkK/sF3iQoFWnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563324; c=relaxed/simple;
	bh=/GFGqZUO4VRFT6v15ScmaU8t3Fm+OWbl2vb9RoJm5j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/c4nlmyc67snnE0iIct9S9kzBurDHaiNjpsS8/2OVZNntsynr43d3apNEJfe/87zwU0JZMB/WwtIHPXLYlZgpmgWtQAALkmebOLXqHAOsGQb0sJgigj6oXEvF7bJjwraVxU48EujcKjR1mBcQ5joSSEzZpwZWXTokWOH/o9Tb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5lxvnLC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB261F00A3E;
	Mon, 15 Jun 2026 22:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563321;
	bh=Sd/vVHQ250KnzmpO3H7crmawV/j0FgrIf7r6zRGR688=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W5lxvnLCbPWSxIHyvbTX4O6XlgHv06TUvWvEStDvig9d1YqBayrtcaG8MVS+RBv4D
	 yXBGEnzSZ20sMYXEPMqaszUTrxQY9SLWpVGawoI484cNAZSU50ypvjAhElEGYzHfPC
	 t3c6MKCAJ8TA+ZYgOsX1hc3e0vWkaDIVIXSqC5Xl+0THUXFrAwhPwuCgvMQ8CW2C73
	 gmhwQ5c2Nj9juXBY4XfdHseUzGtdS4Ty7xDN2WBbCGaoAlU4z3jHjCiMQDjAtM1nC6
	 zxoZI5nq65ipSSBwS1JyYRSPvbym1Pd9zuzQAGJAUZmUYqrzxTikcDqpPhaRujk247
	 6Tk29Rj3bL9Yg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-kernel@vger.kernel.org,
	Gaurav Jain <gaurav.jain@nxp.com>,
	=?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 6/7] crypto: sun8i-ss - Remove crypto_rng interface
Date: Mon, 15 Jun 2026 15:41:30 -0700
Message-ID: <20260615224131.69370-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615224131.69370-1-ebiggers@kernel.org>
References: <20260615224131.69370-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113268-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:gaurav.jain@nxp.com,m:horia.geanta@nxp.com,m:pankaj.gupta@nxp.com,m:clabbe.montjoie@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:ebiggers@kernel.org,m:stable@vger.kernel.org,m:clabbemontjoie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,gmail.com,oss.qualcomm.com,kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AB9668A758

Since the crypto_rng interface for hardware PRNGs is unused and is
redundant with hwrng and the actual Linux RNG, it's being phased out.
Most drivers for it were already removed.  Go ahead and remove the
sun8i-ss support which is one of the only remaining ones.

As usual for crypto_rng, this driver was also buggy: its ->generate()
function had a use-after-free vulnerability due to using
wait_for_completion_interruptible_timeout() without handling shutting
down the DMA operation if a signal is sent.  Also, it had a buffer
overread bug in the line 'memcpy(ctx->seed, d + dlen, ctx->slen);'.
There's no point in fixing these bugs separately only to remove the code
anyway, so this commit is marked with Fixes and Cc stable.

Fixes: ac2614d721de ("crypto: sun8i-ss - Add support for the PRNG")
Cc: stable@vger.kernel.org
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/allwinner/Kconfig              |   8 -
 drivers/crypto/allwinner/sun8i-ss/Makefile    |   1 -
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  45 -----
 .../crypto/allwinner/sun8i-ss/sun8i-ss-prng.c | 177 ------------------
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h  |  23 ---
 5 files changed, 254 deletions(-)
 delete mode 100644 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c

diff --git a/drivers/crypto/allwinner/Kconfig b/drivers/crypto/allwinner/Kconfig
index 17bf9ead6ef2..d86ae005fbe2 100644
--- a/drivers/crypto/allwinner/Kconfig
+++ b/drivers/crypto/allwinner/Kconfig
@@ -103,18 +103,10 @@ config CRYPTO_DEV_SUN8I_SS_DEBUG
 	help
 	  Say y to enable sun8i-ss debug stats.
 	  This will create /sys/kernel/debug/sun8i-ss/stats for displaying
 	  the number of requests per flow and per algorithm.
 
-config CRYPTO_DEV_SUN8I_SS_PRNG
-	bool "Support for Allwinner Security System PRNG"
-	depends on CRYPTO_DEV_SUN8I_SS
-	select CRYPTO_RNG
-	help
-	  Select this option if you want to provide kernel-side support for
-	  the Pseudo-Random Number Generator found in the Security System.
-
 config CRYPTO_DEV_SUN8I_SS_HASH
 	bool "Enable support for hash on sun8i-ss"
 	depends on CRYPTO_DEV_SUN8I_SS
 	select CRYPTO_MD5
 	select CRYPTO_SHA1
diff --git a/drivers/crypto/allwinner/sun8i-ss/Makefile b/drivers/crypto/allwinner/sun8i-ss/Makefile
index aabfd893c817..2d6458a42e58 100644
--- a/drivers/crypto/allwinner/sun8i-ss/Makefile
+++ b/drivers/crypto/allwinner/sun8i-ss/Makefile
@@ -1,4 +1,3 @@
 obj-$(CONFIG_CRYPTO_DEV_SUN8I_SS) += sun8i-ss.o
 sun8i-ss-y += sun8i-ss-core.o sun8i-ss-cipher.o
-sun8i-ss-$(CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG) += sun8i-ss-prng.o
 sun8i-ss-$(CONFIG_CRYPTO_DEV_SUN8I_SS_HASH) += sun8i-ss-hash.o
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index 59c9bc45ec0f..0b22fcddb882 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -9,11 +9,10 @@
  *
  * You could find a link for the datasheet in Documentation/arch/arm/sunxi.rst
  */
 
 #include <crypto/engine.h>
-#include <crypto/internal/rng.h>
 #include <crypto/internal/skcipher.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -281,29 +280,10 @@ static struct sun8i_ss_alg_template ss_algs[] = {
 	},
 	.alg.skcipher.op = {
 		.do_one_request = sun8i_ss_handle_cipher_request,
 	},
 },
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG
-{
-	.type = CRYPTO_ALG_TYPE_RNG,
-	.alg.rng = {
-		.base = {
-			.cra_name		= "stdrng",
-			.cra_driver_name	= "sun8i-ss-prng",
-			.cra_priority		= 300,
-			.cra_ctxsize = sizeof(struct sun8i_ss_rng_tfm_ctx),
-			.cra_module		= THIS_MODULE,
-			.cra_init		= sun8i_ss_prng_init,
-			.cra_exit		= sun8i_ss_prng_exit,
-		},
-		.generate               = sun8i_ss_prng_generate,
-		.seed                   = sun8i_ss_prng_seed,
-		.seedsize               = PRNG_SEED_SIZE,
-	}
-},
-#endif
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_HASH
 {	.type = CRYPTO_ALG_TYPE_AHASH,
 	.ss_algo_id = SS_ID_HASH_MD5,
 	.alg.hash.base = {
 		.init = sun8i_ss_hash_init,
@@ -499,18 +479,10 @@ static int sun8i_ss_debugfs_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "\tFallback due to alignment: %lu\n",
 				   ss_algs[i].stat_fb_align);
 			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
 				   ss_algs[i].stat_fb_sgnum);
 			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
-				   ss_algs[i].alg.rng.base.cra_driver_name,
-				   ss_algs[i].alg.rng.base.cra_name,
-				   ss_algs[i].stat_req, ss_algs[i].stat_bytes);
-			break;
-#endif
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			seq_printf(seq, "%s %s reqs=%lu fallback=%lu\n",
 				   ss_algs[i].alg.hash.base.halg.base.cra_driver_name,
 				   ss_algs[i].alg.hash.base.halg.base.cra_name,
@@ -709,20 +681,10 @@ static int sun8i_ss_register_algs(struct sun8i_ss_dev *ss)
 					ss_algs[i].alg.skcipher.base.base.cra_name);
 				ss_algs[i].ss = NULL;
 				return err;
 			}
 			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			err = crypto_register_rng(&ss_algs[i].alg.rng);
-			if (err) {
-				dev_err(ss->dev, "Fail to register %s\n",
-					ss_algs[i].alg.rng.base.cra_name);
-				ss_algs[i].ss = NULL;
-			}
-			break;
-#endif
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			id = ss_algs[i].ss_algo_id;
 			ss_method = ss->variant->alg_hash[id];
 			if (ss_method == SS_ID_NOTSUPP) {
@@ -762,17 +724,10 @@ static void sun8i_ss_unregister_algs(struct sun8i_ss_dev *ss)
 		case CRYPTO_ALG_TYPE_SKCIPHER:
 			dev_info(ss->dev, "Unregister %d %s\n", i,
 				 ss_algs[i].alg.skcipher.base.base.cra_name);
 			crypto_engine_unregister_skcipher(&ss_algs[i].alg.skcipher);
 			break;
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			dev_info(ss->dev, "Unregister %d %s\n", i,
-				 ss_algs[i].alg.rng.base.cra_name);
-			crypto_unregister_rng(&ss_algs[i].alg.rng);
-			break;
-#endif
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_HASH
 		case CRYPTO_ALG_TYPE_AHASH:
 			dev_info(ss->dev, "Unregister %d %s\n", i,
 				 ss_algs[i].alg.hash.base.halg.base.cra_name);
 			crypto_engine_unregister_ahash(&ss_algs[i].alg.hash);
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
deleted file mode 100644
index a923cfc6553f..000000000000
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
+++ /dev/null
@@ -1,177 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * sun8i-ss-prng.c - hardware cryptographic offloader for
- * Allwinner A80/A83T SoC
- *
- * Copyright (C) 2015-2020 Corentin Labbe <clabbe@baylibre.com>
- *
- * This file handle the PRNG found in the SS
- *
- * You could find a link for the datasheet in Documentation/arch/arm/sunxi.rst
- */
-#include "sun8i-ss.h"
-#include <linux/dma-mapping.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/pm_runtime.h>
-#include <crypto/internal/rng.h>
-
-int sun8i_ss_prng_seed(struct crypto_rng *tfm, const u8 *seed,
-		       unsigned int slen)
-{
-	struct sun8i_ss_rng_tfm_ctx *ctx = crypto_rng_ctx(tfm);
-
-	if (ctx->seed && ctx->slen != slen) {
-		kfree_sensitive(ctx->seed);
-		ctx->slen = 0;
-		ctx->seed = NULL;
-	}
-	if (!ctx->seed)
-		ctx->seed = kmalloc(slen, GFP_KERNEL);
-	if (!ctx->seed)
-		return -ENOMEM;
-
-	memcpy(ctx->seed, seed, slen);
-	ctx->slen = slen;
-
-	return 0;
-}
-
-int sun8i_ss_prng_init(struct crypto_tfm *tfm)
-{
-	struct sun8i_ss_rng_tfm_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	memset(ctx, 0, sizeof(struct sun8i_ss_rng_tfm_ctx));
-	return 0;
-}
-
-void sun8i_ss_prng_exit(struct crypto_tfm *tfm)
-{
-	struct sun8i_ss_rng_tfm_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	kfree_sensitive(ctx->seed);
-	ctx->seed = NULL;
-	ctx->slen = 0;
-}
-
-int sun8i_ss_prng_generate(struct crypto_rng *tfm, const u8 *src,
-			   unsigned int slen, u8 *dst, unsigned int dlen)
-{
-	struct sun8i_ss_rng_tfm_ctx *ctx = crypto_rng_ctx(tfm);
-	struct rng_alg *alg = crypto_rng_alg(tfm);
-	struct sun8i_ss_alg_template *algt;
-	unsigned int todo_with_padding;
-	struct sun8i_ss_dev *ss;
-	dma_addr_t dma_iv, dma_dst;
-	unsigned int todo;
-	int err = 0;
-	int flow;
-	void *d;
-	u32 v;
-
-	algt = container_of(alg, struct sun8i_ss_alg_template, alg.rng);
-	ss = algt->ss;
-
-	if (ctx->slen == 0) {
-		dev_err(ss->dev, "The PRNG is not seeded\n");
-		return -EINVAL;
-	}
-
-	/* The SS does not give an updated seed, so we need to get a new one.
-	 * So we will ask for an extra PRNG_SEED_SIZE data.
-	 * We want dlen + seedsize rounded up to a multiple of PRNG_DATA_SIZE
-	 */
-	todo = dlen + PRNG_SEED_SIZE + PRNG_DATA_SIZE;
-	todo -= todo % PRNG_DATA_SIZE;
-
-	todo_with_padding = ALIGN(todo, dma_get_cache_alignment());
-	if (todo_with_padding < todo || todo < dlen)
-		return -EOVERFLOW;
-
-	d = kzalloc(todo_with_padding, GFP_KERNEL);
-	if (!d)
-		return -ENOMEM;
-
-	flow = sun8i_ss_get_engine_number(ss);
-
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG
-	algt->stat_req++;
-	algt->stat_bytes += todo;
-#endif
-
-	v = SS_ALG_PRNG | SS_PRNG_CONTINUE | SS_START;
-	if (flow)
-		v |= SS_FLOW1;
-	else
-		v |= SS_FLOW0;
-
-	dma_iv = dma_map_single(ss->dev, ctx->seed, ctx->slen, DMA_TO_DEVICE);
-	if (dma_mapping_error(ss->dev, dma_iv)) {
-		dev_err(ss->dev, "Cannot DMA MAP IV\n");
-		err = -EFAULT;
-		goto err_free;
-	}
-
-	dma_dst = dma_map_single(ss->dev, d, todo, DMA_FROM_DEVICE);
-	if (dma_mapping_error(ss->dev, dma_dst)) {
-		dev_err(ss->dev, "Cannot DMA MAP DST\n");
-		err = -EFAULT;
-		goto err_iv;
-	}
-
-	err = pm_runtime_resume_and_get(ss->dev);
-	if (err < 0)
-		goto err_pm;
-	err = 0;
-
-	mutex_lock(&ss->mlock);
-	writel(dma_iv, ss->base + SS_IV_ADR_REG);
-	/* the PRNG act badly (failing rngtest) without SS_KEY_ADR_REG set */
-	writel(dma_iv, ss->base + SS_KEY_ADR_REG);
-	writel(dma_dst, ss->base + SS_DST_ADR_REG);
-	writel(todo / 4, ss->base + SS_LEN_ADR_REG);
-
-	reinit_completion(&ss->flows[flow].complete);
-	ss->flows[flow].status = 0;
-	/* Be sure all data is written before enabling the task */
-	wmb();
-
-	writel(v, ss->base + SS_CTL_REG);
-
-	wait_for_completion_interruptible_timeout(&ss->flows[flow].complete,
-						  msecs_to_jiffies(todo));
-	if (ss->flows[flow].status == 0) {
-		dev_err(ss->dev, "DMA timeout for PRNG (size=%u)\n", todo);
-		err = -EFAULT;
-	}
-	/* Since cipher and hash use the linux/cryptoengine and that we have
-	 * a cryptoengine per flow, we are sure that they will issue only one
-	 * request per flow.
-	 * Since the cryptoengine wait for completion before submitting a new
-	 * one, the mlock could be left just after the final writel.
-	 * But cryptoengine cannot handle crypto_rng, so we need to be sure
-	 * nothing will use our flow.
-	 * The easiest way is to grab mlock until the hardware end our requests.
-	 * We could have used a per flow lock, but this would increase
-	 * complexity.
-	 * The drawback is that no request could be handled for the other flow.
-	 */
-	mutex_unlock(&ss->mlock);
-
-	pm_runtime_put(ss->dev);
-
-err_pm:
-	dma_unmap_single(ss->dev, dma_dst, todo, DMA_FROM_DEVICE);
-err_iv:
-	dma_unmap_single(ss->dev, dma_iv, ctx->slen, DMA_TO_DEVICE);
-
-	if (!err) {
-		memcpy(dst, d, dlen);
-		/* Update seed */
-		memcpy(ctx->seed, d + dlen, ctx->slen);
-	}
-err_free:
-	kfree_sensitive(d);
-
-	return err;
-}
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
index 3fc86225edaf..289fb22abfa2 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
@@ -6,11 +6,10 @@
  * Copyright (C) 2016-2019 Corentin LABBE <clabbe.montjoie@gmail.com>
  */
 #include <crypto/aes.h>
 #include <crypto/des.h>
 #include <crypto/engine.h>
-#include <crypto/rng.h>
 #include <crypto/skcipher.h>
 #include <linux/atomic.h>
 #include <linux/debugfs.h>
 #include <linux/crypto.h>
 #include <crypto/internal/hash.h>
@@ -25,11 +24,10 @@
 
 #define SS_ALG_AES		0
 #define SS_ALG_DES		(1 << 2)
 #define SS_ALG_3DES		(2 << 2)
 #define SS_ALG_MD5		(3 << 2)
-#define SS_ALG_PRNG		(4 << 2)
 #define SS_ALG_SHA1		(6 << 2)
 #define SS_ALG_SHA224		(7 << 2)
 #define SS_ALG_SHA256		(8 << 2)
 
 #define SS_CTL_REG		0x00
@@ -66,24 +64,19 @@
 #define SS_ID_HASH_MAX	4
 
 #define SS_FLOW0	BIT(30)
 #define SS_FLOW1	BIT(31)
 
-#define SS_PRNG_CONTINUE	BIT(18)
-
 #define MAX_SG 8
 
 #define MAXFLOW 2
 
 #define SS_MAX_CLOCKS 2
 
 #define SS_DIE_ID_SHIFT	20
 #define SS_DIE_ID_MASK	0x07
 
-#define PRNG_DATA_SIZE (160 / 8)
-#define PRNG_SEED_SIZE DIV_ROUND_UP(175, 8)
-
 #define MAX_PAD_SIZE 4096
 
 /*
  * struct ss_clock - Describe clocks used by sun8i-ss
  * @name:       Name of clock needed by this variant
@@ -211,20 +204,10 @@ struct sun8i_cipher_tfm_ctx {
 	u32 keylen;
 	struct sun8i_ss_dev *ss;
 	struct crypto_skcipher *fallback_tfm;
 };
 
-/*
- * struct sun8i_ss_prng_ctx - context for PRNG TFM
- * @seed:	The seed to use
- * @slen:	The size of the seed
- */
-struct sun8i_ss_rng_tfm_ctx {
-	void *seed;
-	unsigned int slen;
-};
-
 /*
  * struct sun8i_ss_hash_tfm_ctx - context for an ahash TFM
  * @fallback_tfm:	pointer to the fallback TFM
  * @ss:			pointer to the private data of driver handling this TFM
  */
@@ -272,11 +255,10 @@ struct sun8i_ss_alg_template {
 	u32 ss_algo_id;
 	u32 ss_blockmode;
 	struct sun8i_ss_dev *ss;
 	union {
 		struct skcipher_engine_alg skcipher;
-		struct rng_alg rng;
 		struct ahash_engine_alg hash;
 	} alg;
 	unsigned long stat_req;
 	unsigned long stat_fb;
 	unsigned long stat_bytes;
@@ -298,15 +280,10 @@ int sun8i_ss_skdecrypt(struct skcipher_request *areq);
 int sun8i_ss_skencrypt(struct skcipher_request *areq);
 
 int sun8i_ss_get_engine_number(struct sun8i_ss_dev *ss);
 
 int sun8i_ss_run_task(struct sun8i_ss_dev *ss, struct sun8i_cipher_req_ctx *rctx, const char *name);
-int sun8i_ss_prng_generate(struct crypto_rng *tfm, const u8 *src,
-			   unsigned int slen, u8 *dst, unsigned int dlen);
-int sun8i_ss_prng_seed(struct crypto_rng *tfm, const u8 *seed, unsigned int slen);
-int sun8i_ss_prng_init(struct crypto_tfm *tfm);
-void sun8i_ss_prng_exit(struct crypto_tfm *tfm);
 
 int sun8i_ss_hash_init_tfm(struct crypto_ahash *tfm);
 void sun8i_ss_hash_exit_tfm(struct crypto_ahash *tfm);
 int sun8i_ss_hash_init(struct ahash_request *areq);
 int sun8i_ss_hash_export(struct ahash_request *areq, void *out);
-- 
2.54.0


