Return-Path: <linux-arm-msm+bounces-113269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8FOFHVuAMGqMTwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:44:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1768A762
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:44:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=asPa6HK5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113269-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113269-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FED7312DF37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 22:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CB63BFE24;
	Mon, 15 Jun 2026 22:42:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A603BE148;
	Mon, 15 Jun 2026 22:42:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563324; cv=none; b=l0Bb/cb9s0J9Upue5HtsSXbuAGZJgEONMyhJJ2hJGvt6+Ddx4npBNTm5C9YHYRko9ujKAxPXOWB+y0yjU8YYkYObfAXYksawLDG0zX+hecDZ7diLE06uszz9zRcZ+cJ0NQF8iHWkZhD0dj0ZsDmAhmYKGBfnx1BvRyHIeI50/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563324; c=relaxed/simple;
	bh=13vJVQB6IBkAcMUDW/WNKRo0Rx7wM0bDmj2DeqK1Yyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXuFCe6aek2q5NL+AqOv40TdB/hcFNbV4zJ7LPBqbqQTjJs9Q7wJbsQy/DWLXZd7dODht4P2UihQa8TH2hYAX3//WW9qRpFSsAfoYl/R6/7j+c+VkRYg2q/moygEpoaUBgje6K3O83UP+RtME65WUe2jJ9gbIRzv62oX/yGHaVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asPa6HK5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32E11F00AC4;
	Mon, 15 Jun 2026 22:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563322;
	bh=wFVd4DO0kVmrUZvx8B6H/iLIvZyImm5GnP/psgO1KRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=asPa6HK5H1LtWqbFg6idUuryMLBNm0PHaGUAC0HEpuBsvtFDl0Iuns4d9giiRGgZn
	 WqT/W7gAnMZ4gTQe+jLm7luKruY60SleSXSWNHuG5t5HT5lRNZUvbsBdPZ223Gf874
	 VyVri6ey4stVTZ3r3vj4Y6tON1k+PXKkRejLu89MxQ93AuGtdAFcFRMEq+hfk9cUlS
	 Z5xjMXDDIn1plQvaf/UHfY5WELY0uBnYf1hIoxYSz1/uQQzBLajkrBNAPFFJVMcVG/
	 MfUH9gOlmABmGizg61od0MfOSuB3BTvKCkv52aM6rGODfknhfrUKVNcJFkPv+20HQE
	 q7RxhXHReEw8w==
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
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 7/7] crypto: caam - Remove crypto_rng interface
Date: Mon, 15 Jun 2026 15:41:31 -0700
Message-ID: <20260615224131.69370-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615224131.69370-1-ebiggers@kernel.org>
References: <20260615224131.69370-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113269-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:gaurav.jain@nxp.com,m:horia.geanta@nxp.com,m:pankaj.gupta@nxp.com,m:clabbe.montjoie@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:ebiggers@kernel.org,m:clabbemontjoie@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,gmail.com,oss.qualcomm.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0B1768A762

Since the crypto_rng interface for hardware PRNGs is unused and is
redundant with hwrng and the actual Linux RNG, it's being phased out.
Most drivers for it were already removed.  Go ahead and remove the CAAM
support which is one of the only remaining ones.

Note that the CAAM support for hwrng remains in place.  That is the
interface that actually matters.

Note that this code also had several issues, including dlen > 65535
causing corruption of the CAAM descriptor.

Cc: Gaurav Jain <gaurav.jain@nxp.com>
Cc: Horia Geantă <horia.geanta@nxp.com>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/caam/Kconfig    |   9 --
 drivers/crypto/caam/Makefile   |   1 -
 drivers/crypto/caam/caamprng.c | 241 ---------------------------------
 drivers/crypto/caam/intern.h   |  15 --
 drivers/crypto/caam/jr.c       |   2 -
 5 files changed, 268 deletions(-)
 delete mode 100644 drivers/crypto/caam/caamprng.c

diff --git a/drivers/crypto/caam/Kconfig b/drivers/crypto/caam/Kconfig
index 05210a0edb8a..ec57bf6aaf6c 100644
--- a/drivers/crypto/caam/Kconfig
+++ b/drivers/crypto/caam/Kconfig
@@ -143,24 +143,15 @@ config CRYPTO_DEV_FSL_CAAM_PKC_API
 	  signature and verification.
 
 config CRYPTO_DEV_FSL_CAAM_RNG_API
 	bool "Register caam device for hwrng API"
 	default y
-	select CRYPTO_RNG
 	select HW_RANDOM
 	help
 	  Selecting this will register the SEC4 hardware rng to
 	  the hw_random API for supplying the kernel entropy pool.
 
-config CRYPTO_DEV_FSL_CAAM_PRNG_API
-	bool "Register Pseudo random number generation implementation with Crypto API"
-	default y
-	select CRYPTO_RNG
-	help
-	  Selecting this will register the SEC hardware prng to
-	  the Crypto API.
-
 config CRYPTO_DEV_FSL_CAAM_BLOB_GEN
 	bool
 
 config CRYPTO_DEV_FSL_CAAM_RNG_TEST
 	bool "Test caam rng"
diff --git a/drivers/crypto/caam/Makefile b/drivers/crypto/caam/Makefile
index d2eaf5205b1c..a17e3cf14c61 100644
--- a/drivers/crypto/caam/Makefile
+++ b/drivers/crypto/caam/Makefile
@@ -18,11 +18,10 @@ caam-y := ctrl.o
 caam_jr-y := jr.o key_gen.o
 caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API) += caamalg.o
 caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI) += caamalg_qi.o
 caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_AHASH_API) += caamhash.o
 caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_RNG_API) += caamrng.o
-caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_PRNG_API) += caamprng.o
 caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_PKC_API) += caampkc.o pkc_desc.o
 caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_BLOB_GEN) += blob_gen.o
 
 caam-$(CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI) += qi.o
 caam-$(CONFIG_DEBUG_FS) += debugfs.o
diff --git a/drivers/crypto/caam/caamprng.c b/drivers/crypto/caam/caamprng.c
deleted file mode 100644
index 6e4c1191cb28..000000000000
--- a/drivers/crypto/caam/caamprng.c
+++ /dev/null
@@ -1,241 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Driver to expose SEC4 PRNG via crypto RNG API
- *
- * Copyright 2022 NXP
- *
- */
-
-#include <linux/completion.h>
-#include <crypto/internal/rng.h>
-#include <linux/dma-mapping.h>
-#include <linux/kernel.h>
-#include "compat.h"
-#include "regs.h"
-#include "intern.h"
-#include "desc_constr.h"
-#include "jr.h"
-#include "error.h"
-
-/*
- * Length of used descriptors, see caam_init_desc()
- */
-#define CAAM_PRNG_MAX_DESC_LEN (CAAM_CMD_SZ +				\
-			    CAAM_CMD_SZ +				\
-			    CAAM_CMD_SZ + CAAM_PTR_SZ_MAX)
-
-/* prng per-device context */
-struct caam_prng_ctx {
-	int err;
-	struct completion done;
-};
-
-struct caam_prng_alg {
-	struct rng_alg rng;
-	bool registered;
-};
-
-static void caam_prng_done(struct device *jrdev, u32 *desc, u32 err,
-			  void *context)
-{
-	struct caam_prng_ctx *jctx = context;
-
-	jctx->err = err ? caam_jr_strstatus(jrdev, err) : 0;
-
-	complete(&jctx->done);
-}
-
-static u32 *caam_init_reseed_desc(u32 *desc)
-{
-	init_job_desc(desc, 0);	/* + 1 cmd_sz */
-	/* Generate random bytes: + 1 cmd_sz */
-	append_operation(desc, OP_TYPE_CLASS1_ALG | OP_ALG_ALGSEL_RNG |
-			OP_ALG_AS_FINALIZE);
-
-	print_hex_dump_debug("prng reseed desc@: ", DUMP_PREFIX_ADDRESS,
-			     16, 4, desc, desc_bytes(desc), 1);
-
-	return desc;
-}
-
-static u32 *caam_init_prng_desc(u32 *desc, dma_addr_t dst_dma, u32 len)
-{
-	init_job_desc(desc, 0);	/* + 1 cmd_sz */
-	/* Generate random bytes: + 1 cmd_sz */
-	append_operation(desc, OP_ALG_ALGSEL_RNG | OP_TYPE_CLASS1_ALG);
-	/* Store bytes: + 1 cmd_sz + caam_ptr_sz  */
-	append_fifo_store(desc, dst_dma,
-			  len, FIFOST_TYPE_RNGSTORE);
-
-	print_hex_dump_debug("prng job desc@: ", DUMP_PREFIX_ADDRESS,
-			     16, 4, desc, desc_bytes(desc), 1);
-
-	return desc;
-}
-
-static int caam_prng_generate(struct crypto_rng *tfm,
-			     const u8 *src, unsigned int slen,
-			     u8 *dst, unsigned int dlen)
-{
-	unsigned int aligned_dlen = ALIGN(dlen, dma_get_cache_alignment());
-	struct caam_prng_ctx ctx;
-	struct device *jrdev;
-	dma_addr_t dst_dma;
-	u32 *desc;
-	u8 *buf;
-	int ret;
-
-	if (aligned_dlen < dlen)
-		return -EOVERFLOW;
-
-	buf = kzalloc(aligned_dlen, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	jrdev = caam_jr_alloc();
-	ret = PTR_ERR_OR_ZERO(jrdev);
-	if (ret) {
-		pr_err("Job Ring Device allocation failed\n");
-		kfree(buf);
-		return ret;
-	}
-
-	desc = kzalloc(CAAM_PRNG_MAX_DESC_LEN, GFP_KERNEL);
-	if (!desc) {
-		ret = -ENOMEM;
-		goto out1;
-	}
-
-	dst_dma = dma_map_single(jrdev, buf, dlen, DMA_FROM_DEVICE);
-	if (dma_mapping_error(jrdev, dst_dma)) {
-		dev_err(jrdev, "Failed to map destination buffer memory\n");
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	init_completion(&ctx.done);
-	ret = caam_jr_enqueue(jrdev,
-			      caam_init_prng_desc(desc, dst_dma, dlen),
-			      caam_prng_done, &ctx);
-
-	if (ret == -EINPROGRESS) {
-		wait_for_completion(&ctx.done);
-		ret = ctx.err;
-	}
-
-	dma_unmap_single(jrdev, dst_dma, dlen, DMA_FROM_DEVICE);
-
-	if (!ret)
-		memcpy(dst, buf, dlen);
-out:
-	kfree(desc);
-out1:
-	caam_jr_free(jrdev);
-	kfree(buf);
-	return ret;
-}
-
-static void caam_prng_exit(struct crypto_tfm *tfm) {}
-
-static int caam_prng_init(struct crypto_tfm *tfm)
-{
-	return 0;
-}
-
-static int caam_prng_seed(struct crypto_rng *tfm,
-			 const u8 *seed, unsigned int slen)
-{
-	struct caam_prng_ctx ctx;
-	struct device *jrdev;
-	u32 *desc;
-	int ret;
-
-	if (slen) {
-		pr_err("Seed length should be zero\n");
-		return -EINVAL;
-	}
-
-	jrdev = caam_jr_alloc();
-	ret = PTR_ERR_OR_ZERO(jrdev);
-	if (ret) {
-		pr_err("Job Ring Device allocation failed\n");
-		return ret;
-	}
-
-	desc = kzalloc(CAAM_PRNG_MAX_DESC_LEN, GFP_KERNEL);
-	if (!desc) {
-		caam_jr_free(jrdev);
-		return -ENOMEM;
-	}
-
-	init_completion(&ctx.done);
-	ret = caam_jr_enqueue(jrdev,
-			      caam_init_reseed_desc(desc),
-			      caam_prng_done, &ctx);
-
-	if (ret == -EINPROGRESS) {
-		wait_for_completion(&ctx.done);
-		ret = ctx.err;
-	}
-
-	kfree(desc);
-	caam_jr_free(jrdev);
-	return ret;
-}
-
-static struct caam_prng_alg caam_prng_alg = {
-	.rng = {
-		.generate = caam_prng_generate,
-		.seed = caam_prng_seed,
-		.seedsize = 0,
-		.base = {
-			.cra_name = "stdrng",
-			.cra_driver_name = "prng-caam",
-			.cra_priority = 500,
-			.cra_ctxsize = sizeof(struct caam_prng_ctx),
-			.cra_module = THIS_MODULE,
-			.cra_init = caam_prng_init,
-			.cra_exit = caam_prng_exit,
-		},
-	}
-};
-
-void caam_prng_unregister(void *data)
-{
-	if (caam_prng_alg.registered)
-		crypto_unregister_rng(&caam_prng_alg.rng);
-}
-
-int caam_prng_register(struct device *ctrldev)
-{
-	struct caam_drv_private *priv = dev_get_drvdata(ctrldev);
-	u32 rng_inst;
-	int ret = 0;
-
-	/* Check for available RNG blocks before registration */
-	if (priv->era < 10)
-		rng_inst = (rd_reg32(&priv->jr[0]->perfmon.cha_num_ls) &
-			    CHA_ID_LS_RNG_MASK) >> CHA_ID_LS_RNG_SHIFT;
-	else
-		rng_inst = rd_reg32(&priv->jr[0]->vreg.rng) & CHA_VER_NUM_MASK;
-
-	if (!rng_inst) {
-		dev_dbg(ctrldev, "RNG block is not available... skipping registering algorithm\n");
-		return ret;
-	}
-
-	ret = crypto_register_rng(&caam_prng_alg.rng);
-	if (ret) {
-		dev_err(ctrldev,
-			"couldn't register rng crypto alg: %d\n",
-			ret);
-		return ret;
-	}
-
-	caam_prng_alg.registered = true;
-
-	dev_info(ctrldev,
-		 "rng crypto API alg registered %s\n", caam_prng_alg.rng.base.cra_driver_name);
-
-	return 0;
-}
diff --git a/drivers/crypto/caam/intern.h b/drivers/crypto/caam/intern.h
index a88da0d31b23..6e48bf7d6054 100644
--- a/drivers/crypto/caam/intern.h
+++ b/drivers/crypto/caam/intern.h
@@ -210,25 +210,10 @@ static inline int caam_rng_init(struct device *dev)
 
 static inline void caam_rng_exit(struct device *dev) {}
 
 #endif /* CONFIG_CRYPTO_DEV_FSL_CAAM_RNG_API */
 
-#ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_PRNG_API
-
-int caam_prng_register(struct device *dev);
-void caam_prng_unregister(void *data);
-
-#else
-
-static inline int caam_prng_register(struct device *dev)
-{
-	return 0;
-}
-
-static inline void caam_prng_unregister(void *data) {}
-#endif /* CONFIG_CRYPTO_DEV_FSL_CAAM_PRNG_API */
-
 #ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI
 
 int caam_qi_algapi_init(struct device *dev);
 void caam_qi_algapi_exit(void);
 
diff --git a/drivers/crypto/caam/jr.c b/drivers/crypto/caam/jr.c
index 0ef00df9730e..bddeaaaca487 100644
--- a/drivers/crypto/caam/jr.c
+++ b/drivers/crypto/caam/jr.c
@@ -38,11 +38,10 @@ static void register_algs(struct caam_drv_private_jr *jrpriv,
 
 	caam_algapi_init(dev);
 	caam_algapi_hash_init(dev);
 	caam_pkc_init(dev);
 	jrpriv->hwrng = !caam_rng_init(dev);
-	caam_prng_register(dev);
 	caam_qi_algapi_init(dev);
 
 algs_unlock:
 	mutex_unlock(&algs_lock);
 }
@@ -53,11 +52,10 @@ static void unregister_algs(void)
 
 	if (--active_devs != 0)
 		goto algs_unlock;
 
 	caam_qi_algapi_exit();
-	caam_prng_unregister(NULL);
 	caam_pkc_exit();
 	caam_algapi_hash_exit();
 	caam_algapi_exit();
 
 algs_unlock:
-- 
2.54.0


