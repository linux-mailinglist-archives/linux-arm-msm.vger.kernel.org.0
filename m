Return-Path: <linux-arm-msm+bounces-113267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cJTOLNh/MGp1TwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:42:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A14F68A720
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:42:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="fMKsOr/R";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113267-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113267-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 372473029629
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 22:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CA63BAD88;
	Mon, 15 Jun 2026 22:42:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C1F3BB69B;
	Mon, 15 Jun 2026 22:42:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563323; cv=none; b=CF7u58QQh2TbRXAqnXceAa2fxD9rxSROLwkv8g5q1IVFKuWd+MENGaqx3Da8KNwTC3mu+HryJbOpQvPUc97dsCfqQSMlwlumQiqjhixAWF3rOqr2DETJTnRQlJJfwQoo/Yc3NYIWZ3RAKoW7S7JpmI8RmlxMRI+v1bBG3ux1nRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563323; c=relaxed/simple;
	bh=8wwbxwls/n0YHUU6Pmwe5DAQt/KGmeHY7UlTJSUx3T0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIc06WAzvkaMGkVskMy+HVFH9gKO/ilTrBEFAdf3BLj/uq7UGfOJ8mnnDsY8XODrVevVU4p0rHvH3BinaEulogjyEDvlLR+n+d7n6FhcwAVEfzEnBsigTMJBDOT64x655TSt5eOayRaOj4lEvKVE6dcpz7RRRdZJc8wGcBwo2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMKsOr/R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED211F00A3D;
	Mon, 15 Jun 2026 22:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563321;
	bh=VlZoHOqLcq9eZ8sUnXm2cfrtLVT+guxPPU6aYlsSsJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fMKsOr/R3zWjepu2Q8v2xUfX3wo4vQ1aMqvEDl8edj+q37OSRUtMWgnVxtOAUUr7Q
	 D1mb6mKuNEcMn6ItSgqKvxrCn7BJwJ8Y5K6ghTcQMZ7dBC3/nkuquWA/WzX4yM2eEp
	 N78bdrqMAZx4sAnET109gzVlcaHlm4zt+0Vyf9Gb4ysSgiogtdlZ7c0sVnm8fuBqtF
	 vQ6qIhGkgU4GB10rxtsDFA8bq8xD2LL5Y3ODJwdvUHzID2rp09cmfyLHvInsQfIib2
	 eXCiZxf7Nrsui6Pmpki0jq9gNWOaLDNbG2ZoMJ+i7uAznv/y+bFKkSonCMNRGp43dl
	 ddEteFOfbC/Dw==
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
Subject: [PATCH 5/7] crypto: sun8i-ce - Remove crypto_rng interface
Date: Mon, 15 Jun 2026 15:41:29 -0700
Message-ID: <20260615224131.69370-6-ebiggers@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113267-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A14F68A720

Since the crypto_rng interface for hardware PRNGs is unused and is
redundant with hwrng and the actual Linux RNG, it's being phased out.
Most drivers for it were already removed.  Go ahead and remove the
sun8i-ce support which is one of the only remaining ones.

Note that the sun8i-ce support for hwrng remains in place.  That is the
interface that actually matters.

As usual for crypto_rng, this driver was also buggy: its ->generate()
function had a use-after-free vulnerability due to using
wait_for_completion_interruptible_timeout() without handling shutting
down the DMA operation if a signal is sent.  There's no point in fixing
this separately only to remove the code anyway, so this commit is marked
with Fixes and Cc stable.

Fixes: 5eb7e9468884 ("crypto: sun8i-ce - Add support for the PRNG")
Cc: stable@vger.kernel.org
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/allwinner/Kconfig              |   8 -
 drivers/crypto/allwinner/sun8i-ce/Makefile    |   1 -
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  63 -------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c | 159 ------------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  29 ----
 5 files changed, 260 deletions(-)
 delete mode 100644 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c

diff --git a/drivers/crypto/allwinner/Kconfig b/drivers/crypto/allwinner/Kconfig
index 06ea0e9fe6f2..17bf9ead6ef2 100644
--- a/drivers/crypto/allwinner/Kconfig
+++ b/drivers/crypto/allwinner/Kconfig
@@ -68,18 +68,10 @@ config CRYPTO_DEV_SUN8I_CE_HASH
 	select CRYPTO_SHA256
 	select CRYPTO_SHA512
 	help
 	  Say y to enable support for hash algorithms.
 
-config CRYPTO_DEV_SUN8I_CE_PRNG
-	bool "Support for Allwinner Crypto Engine PRNG"
-	depends on CRYPTO_DEV_SUN8I_CE
-	select CRYPTO_RNG
-	help
-	  Select this option if you want to provide kernel-side support for
-	  the Pseudo-Random Number Generator found in the Crypto Engine.
-
 config CRYPTO_DEV_SUN8I_CE_TRNG
 	bool "Support for Allwinner Crypto Engine TRNG"
 	depends on CRYPTO_DEV_SUN8I_CE
 	select HW_RANDOM
 	help
diff --git a/drivers/crypto/allwinner/sun8i-ce/Makefile b/drivers/crypto/allwinner/sun8i-ce/Makefile
index 0842eb2d9408..ea708b427e2e 100644
--- a/drivers/crypto/allwinner/sun8i-ce/Makefile
+++ b/drivers/crypto/allwinner/sun8i-ce/Makefile
@@ -1,5 +1,4 @@
 obj-$(CONFIG_CRYPTO_DEV_SUN8I_CE) += sun8i-ce.o
 sun8i-ce-y += sun8i-ce-core.o sun8i-ce-cipher.o
 sun8i-ce-$(CONFIG_CRYPTO_DEV_SUN8I_CE_HASH) += sun8i-ce-hash.o
-sun8i-ce-$(CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG) += sun8i-ce-prng.o
 sun8i-ce-$(CONFIG_CRYPTO_DEV_SUN8I_CE_TRNG) += sun8i-ce-trng.o
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index f3b58ed6aed0..c6402e87f8a0 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -10,11 +10,10 @@
  * You could find a link for the datasheet in Documentation/arch/arm/sunxi.rst
  */
 
 #include <crypto/engine.h>
 #include <crypto/internal/hash.h>
-#include <crypto/internal/rng.h>
 #include <crypto/internal/skcipher.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -47,11 +46,10 @@ static const struct ce_variant ce_h3_variant = {
 	.ce_clks = {
 		{ "bus", 0, 200000000 },
 		{ "mod", 50000000, 0 },
 		},
 	.esr = ESR_H3,
-	.prng = CE_ALG_PRNG,
 	.trng = CE_ID_NOTSUPP,
 };
 
 static const struct ce_variant ce_h5_variant = {
 	.alg_cipher = { CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
@@ -64,11 +62,10 @@ static const struct ce_variant ce_h5_variant = {
 	.ce_clks = {
 		{ "bus", 0, 200000000 },
 		{ "mod", 300000000, 0 },
 		},
 	.esr = ESR_H5,
-	.prng = CE_ALG_PRNG,
 	.trng = CE_ID_NOTSUPP,
 };
 
 static const struct ce_variant ce_h6_variant = {
 	.alg_cipher = { CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
@@ -78,19 +75,17 @@ static const struct ce_variant ce_h6_variant = {
 	},
 	.op_mode = { CE_OP_ECB, CE_OP_CBC
 	},
 	.cipher_t_dlen_in_bytes = true,
 	.hash_t_dlen_in_bits = true,
-	.prng_t_dlen_in_bytes = true,
 	.trng_t_dlen_in_bytes = true,
 	.ce_clks = {
 		{ "bus", 0, 200000000 },
 		{ "mod", 300000000, 0 },
 		{ "ram", 0, 400000000 },
 		},
 	.esr = ESR_H6,
-	.prng = CE_ALG_PRNG_V2,
 	.trng = CE_ALG_TRNG_V2,
 };
 
 static const struct ce_variant ce_h616_variant = {
 	.alg_cipher = { CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
@@ -100,21 +95,19 @@ static const struct ce_variant ce_h616_variant = {
 	},
 	.op_mode = { CE_OP_ECB, CE_OP_CBC
 	},
 	.cipher_t_dlen_in_bytes = true,
 	.hash_t_dlen_in_bits = true,
-	.prng_t_dlen_in_bytes = true,
 	.trng_t_dlen_in_bytes = true,
 	.needs_word_addresses = true,
 	.ce_clks = {
 		{ "bus", 0, 200000000 },
 		{ "mod", 300000000, 0 },
 		{ "ram", 0, 400000000 },
 		{ "trng", 0, 0 },
 		},
 	.esr = ESR_H6,
-	.prng = CE_ALG_PRNG_V2,
 	.trng = CE_ALG_TRNG_V2,
 };
 
 static const struct ce_variant ce_a64_variant = {
 	.alg_cipher = { CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
@@ -127,11 +120,10 @@ static const struct ce_variant ce_a64_variant = {
 	.ce_clks = {
 		{ "bus", 0, 200000000 },
 		{ "mod", 300000000, 0 },
 		},
 	.esr = ESR_A64,
-	.prng = CE_ALG_PRNG,
 	.trng = CE_ID_NOTSUPP,
 };
 
 static const struct ce_variant ce_d1_variant = {
 	.alg_cipher = { CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
@@ -146,11 +138,10 @@ static const struct ce_variant ce_d1_variant = {
 		{ "mod", 300000000, 0 },
 		{ "ram", 0, 400000000 },
 		{ "trng", 0, 0 },
 		},
 	.esr = ESR_D1,
-	.prng = CE_ALG_PRNG,
 	.trng = CE_ALG_TRNG,
 };
 
 static const struct ce_variant ce_r40_variant = {
 	.alg_cipher = { CE_ALG_AES, CE_ALG_DES, CE_ALG_3DES,
@@ -163,11 +154,10 @@ static const struct ce_variant ce_r40_variant = {
 	.ce_clks = {
 		{ "bus", 0, 200000000 },
 		{ "mod", 300000000, 0 },
 		},
 	.esr = ESR_R40,
-	.prng = CE_ALG_PRNG,
 	.trng = CE_ID_NOTSUPP,
 };
 
 static void sun8i_ce_dump_task_descriptors(struct sun8i_ce_flow *chan)
 {
@@ -612,29 +602,10 @@ static struct sun8i_ce_alg_template ce_algs[] = {
 	.alg.hash.op = {
 		.do_one_request = sun8i_ce_hash_run,
 	},
 },
 #endif
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG
-{
-	.type = CRYPTO_ALG_TYPE_RNG,
-	.alg.rng = {
-		.base = {
-			.cra_name		= "stdrng",
-			.cra_driver_name	= "sun8i-ce-prng",
-			.cra_priority		= 300,
-			.cra_ctxsize		= sizeof(struct sun8i_ce_rng_tfm_ctx),
-			.cra_module		= THIS_MODULE,
-			.cra_init		= sun8i_ce_prng_init,
-			.cra_exit		= sun8i_ce_prng_exit,
-		},
-		.generate               = sun8i_ce_prng_generate,
-		.seed                   = sun8i_ce_prng_seed,
-		.seedsize               = PRNG_SEED_SIZE,
-	}
-},
-#endif
 };
 
 static int sun8i_ce_debugfs_show(struct seq_file *seq, void *v)
 {
 	struct sun8i_ce_dev *ce __maybe_unused = seq->private;
@@ -691,18 +662,10 @@ static int sun8i_ce_debugfs_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "\tFallback due to alignment: %lu\n",
 				   ce_algs[i].stat_fb_srcali);
 			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
 				   ce_algs[i].stat_fb_maxsg);
 			break;
-#endif
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			seq_printf(seq, "%s %s reqs=%lu bytes=%lu\n",
-				   ce_algs[i].alg.rng.base.cra_driver_name,
-				   ce_algs[i].alg.rng.base.cra_name,
-				   ce_algs[i].stat_req, ce_algs[i].stat_bytes);
-			break;
 #endif
 		}
 	}
 #if defined(CONFIG_CRYPTO_DEV_SUN8I_CE_TRNG) && \
     defined(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)
@@ -928,29 +891,10 @@ static int sun8i_ce_register_algs(struct sun8i_ce_dev *ce)
 					ce_algs[i].alg.hash.base.halg.base.cra_name);
 				ce_algs[i].ce = NULL;
 				return err;
 			}
 			break;
-#endif
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			if (ce->variant->prng == CE_ID_NOTSUPP) {
-				dev_info(ce->dev,
-					 "DEBUG: Algo of %s not supported\n",
-					 ce_algs[i].alg.rng.base.cra_name);
-				ce_algs[i].ce = NULL;
-				break;
-			}
-			dev_info(ce->dev, "Register %s\n",
-				 ce_algs[i].alg.rng.base.cra_name);
-			err = crypto_register_rng(&ce_algs[i].alg.rng);
-			if (err) {
-				dev_err(ce->dev, "Fail to register %s\n",
-					ce_algs[i].alg.rng.base.cra_name);
-				ce_algs[i].ce = NULL;
-			}
-			break;
 #endif
 		default:
 			ce_algs[i].ce = NULL;
 			dev_err(ce->dev, "ERROR: tried to register an unknown algo\n");
 		}
@@ -975,17 +919,10 @@ static void sun8i_ce_unregister_algs(struct sun8i_ce_dev *ce)
 		case CRYPTO_ALG_TYPE_AHASH:
 			dev_info(ce->dev, "Unregister %d %s\n", i,
 				 ce_algs[i].alg.hash.base.halg.base.cra_name);
 			crypto_engine_unregister_ahash(&ce_algs[i].alg.hash);
 			break;
-#endif
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_PRNG
-		case CRYPTO_ALG_TYPE_RNG:
-			dev_info(ce->dev, "Unregister %d %s\n", i,
-				 ce_algs[i].alg.rng.base.cra_name);
-			crypto_unregister_rng(&ce_algs[i].alg.rng);
-			break;
 #endif
 		}
 	}
 }
 
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
deleted file mode 100644
index d0a1ac66738b..000000000000
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
+++ /dev/null
@@ -1,159 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * sun8i-ce-prng.c - hardware cryptographic offloader for
- * Allwinner H3/A64/H5/H2+/H6/R40 SoC
- *
- * Copyright (C) 2015-2020 Corentin Labbe <clabbe@baylibre.com>
- *
- * This file handle the PRNG
- *
- * You could find a link for the datasheet in Documentation/arch/arm/sunxi.rst
- */
-#include "sun8i-ce.h"
-#include <linux/dma-mapping.h>
-#include <linux/pm_runtime.h>
-#include <crypto/internal/rng.h>
-
-int sun8i_ce_prng_init(struct crypto_tfm *tfm)
-{
-	struct sun8i_ce_rng_tfm_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	memset(ctx, 0, sizeof(struct sun8i_ce_rng_tfm_ctx));
-	return 0;
-}
-
-void sun8i_ce_prng_exit(struct crypto_tfm *tfm)
-{
-	struct sun8i_ce_rng_tfm_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	kfree_sensitive(ctx->seed);
-	ctx->seed = NULL;
-	ctx->slen = 0;
-}
-
-int sun8i_ce_prng_seed(struct crypto_rng *tfm, const u8 *seed,
-		       unsigned int slen)
-{
-	struct sun8i_ce_rng_tfm_ctx *ctx = crypto_rng_ctx(tfm);
-
-	if (ctx->seed && ctx->slen != slen) {
-		kfree_sensitive(ctx->seed);
-		ctx->slen = 0;
-		ctx->seed = NULL;
-	}
-	if (!ctx->seed)
-		ctx->seed = kmalloc(slen, GFP_KERNEL | GFP_DMA);
-	if (!ctx->seed)
-		return -ENOMEM;
-
-	memcpy(ctx->seed, seed, slen);
-	ctx->slen = slen;
-
-	return 0;
-}
-
-int sun8i_ce_prng_generate(struct crypto_rng *tfm, const u8 *src,
-			   unsigned int slen, u8 *dst, unsigned int dlen)
-{
-	struct sun8i_ce_rng_tfm_ctx *ctx = crypto_rng_ctx(tfm);
-	struct rng_alg *alg = crypto_rng_alg(tfm);
-	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_dev *ce;
-	dma_addr_t dma_iv, dma_dst;
-	int err = 0;
-	int flow = 3;
-	unsigned int todo;
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
-	u32 common, sym;
-	void *d;
-
-	algt = container_of(alg, struct sun8i_ce_alg_template, alg.rng);
-	ce = algt->ce;
-
-	if (ctx->slen == 0) {
-		dev_err(ce->dev, "not seeded\n");
-		return -EINVAL;
-	}
-
-	/* we want dlen + seedsize rounded up to a multiple of PRNG_DATA_SIZE */
-	todo = dlen + ctx->slen + PRNG_DATA_SIZE * 2;
-	todo -= todo % PRNG_DATA_SIZE;
-
-	d = kzalloc(todo, GFP_KERNEL | GFP_DMA);
-	if (!d) {
-		err = -ENOMEM;
-		goto err_mem;
-	}
-
-	dev_dbg(ce->dev, "%s PRNG slen=%u dlen=%u todo=%u multi=%u\n", __func__,
-		slen, dlen, todo, todo / PRNG_DATA_SIZE);
-
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-	algt->stat_req++;
-	algt->stat_bytes += todo;
-#endif
-
-	dma_iv = dma_map_single(ce->dev, ctx->seed, ctx->slen, DMA_TO_DEVICE);
-	if (dma_mapping_error(ce->dev, dma_iv)) {
-		dev_err(ce->dev, "Cannot DMA MAP IV\n");
-		err = -EFAULT;
-		goto err_iv;
-	}
-
-	dma_dst = dma_map_single(ce->dev, d, todo, DMA_FROM_DEVICE);
-	if (dma_mapping_error(ce->dev, dma_dst)) {
-		dev_err(ce->dev, "Cannot DMA MAP DST\n");
-		err = -EFAULT;
-		goto err_dst;
-	}
-
-	err = pm_runtime_resume_and_get(ce->dev);
-	if (err < 0)
-		goto err_pm;
-
-	mutex_lock(&ce->rnglock);
-	chan = &ce->chanlist[flow];
-
-	cet = &chan->tl[0];
-	memset(cet, 0, sizeof(struct ce_task));
-
-	cet->t_id = cpu_to_le32(flow);
-	common = ce->variant->prng | CE_COMM_INT;
-	cet->t_common_ctl = cpu_to_le32(common);
-
-	/* recent CE (H6) need length in bytes, in word otherwise */
-	if (ce->variant->prng_t_dlen_in_bytes)
-		cet->t_dlen = cpu_to_le32(todo);
-	else
-		cet->t_dlen = cpu_to_le32(todo / 4);
-
-	sym = PRNG_LD;
-	cet->t_sym_ctl = cpu_to_le32(sym);
-	cet->t_asym_ctl = 0;
-
-	cet->t_key = desc_addr_val_le32(ce, dma_iv);
-	cet->t_iv = desc_addr_val_le32(ce, dma_iv);
-
-	cet->t_dst[0].addr = desc_addr_val_le32(ce, dma_dst);
-	cet->t_dst[0].len = cpu_to_le32(todo / 4);
-
-	err = sun8i_ce_run_task(ce, 3, "PRNG");
-	mutex_unlock(&ce->rnglock);
-
-	pm_runtime_put(ce->dev);
-
-err_pm:
-	dma_unmap_single(ce->dev, dma_dst, todo, DMA_FROM_DEVICE);
-err_dst:
-	dma_unmap_single(ce->dev, dma_iv, ctx->slen, DMA_TO_DEVICE);
-
-	if (!err) {
-		memcpy(dst, d, dlen);
-		memcpy(ctx->seed, d + dlen, ctx->slen);
-	}
-err_iv:
-	kfree_sensitive(d);
-err_mem:
-	return err;
-}
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 71f5a0cd3d45..468d99bf5bf6 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -13,11 +13,10 @@
 #include <linux/debugfs.h>
 #include <linux/crypto.h>
 #include <linux/hw_random.h>
 #include <crypto/internal/hash.h>
 #include <crypto/md5.h>
-#include <crypto/rng.h>
 #include <crypto/sha1.h>
 #include <crypto/sha2.h>
 
 /* CE Registers */
 #define CE_TDQ	0x00
@@ -56,13 +55,11 @@
 #define CE_ALG_SHA224           18
 #define CE_ALG_SHA256           19
 #define CE_ALG_SHA384           20
 #define CE_ALG_SHA512           21
 #define CE_ALG_TRNG		48
-#define CE_ALG_PRNG		49
 #define CE_ALG_TRNG_V2		0x1c
-#define CE_ALG_PRNG_V2		0x1d
 
 /* Used in ce_variant */
 #define CE_ID_NOTSUPP		0xFF
 
 #define CE_ID_CIPHER_AES	0
@@ -94,14 +91,10 @@
 #define ESR_R40	2
 #define ESR_H5	3
 #define ESR_H6	4
 #define ESR_D1	5
 
-#define PRNG_DATA_SIZE (160 / 8)
-#define PRNG_SEED_SIZE DIV_ROUND_UP(175, 8)
-#define PRNG_LD BIT(17)
-
 #define CE_DIE_ID_SHIFT	16
 #define CE_DIE_ID_MASK	0x07
 
 #define MAX_SG 8
 
@@ -134,31 +127,26 @@ struct ce_clock {
  * @op_mode:	list of supported block modes
  * @cipher_t_dlen_in_bytes:	Does the request size for cipher is in
  *				bytes or words
  * @hash_t_dlen_in_bytes:	Does the request size for hash is in
  *				bits or words
- * @prng_t_dlen_in_bytes:	Does the request size for PRNG is in
- *				bytes or words
  * @trng_t_dlen_in_bytes:	Does the request size for TRNG is in
  *				bytes or words
  * @ce_clks:	list of clocks needed by this variant
  * @esr:	The type of error register
- * @prng:	The CE_ALG_XXX value for the PRNG
  * @trng:	The CE_ALG_XXX value for the TRNG
  */
 struct ce_variant {
 	char alg_cipher[CE_ID_CIPHER_MAX];
 	char alg_hash[CE_ID_HASH_MAX];
 	u32 op_mode[CE_ID_OP_MAX];
 	bool cipher_t_dlen_in_bytes;
 	bool hash_t_dlen_in_bits;
-	bool prng_t_dlen_in_bytes;
 	bool trng_t_dlen_in_bytes;
 	bool needs_word_addresses;
 	struct ce_clock ce_clks[CE_MAX_CLOCKS];
 	int esr;
-	unsigned char prng;
 	unsigned char trng;
 };
 
 struct sginfo {
 	__le32 addr;
@@ -325,20 +313,10 @@ struct sun8i_ce_hash_reqctx {
 	u8 result[CE_MAX_HASH_DIGEST_SIZE] __aligned(CRYPTO_DMA_ALIGN);
 	u8 pad[2 * CE_MAX_HASH_BLOCK_SIZE];
 	struct ahash_request fallback_req; // keep at the end
 };
 
-/*
- * struct sun8i_ce_prng_ctx - context for PRNG TFM
- * @seed:	The seed to use
- * @slen:	The size of the seed
- */
-struct sun8i_ce_rng_tfm_ctx {
-	void *seed;
-	unsigned int slen;
-};
-
 /*
  * struct sun8i_ce_alg_template - crypto_alg template
  * @type:		the CRYPTO_ALG_TYPE for this template
  * @ce_algo_id:		the CE_ID for this template
  * @ce_blockmode:	the type of block operation CE_ID
@@ -355,11 +333,10 @@ struct sun8i_ce_alg_template {
 	u32 ce_blockmode;
 	struct sun8i_ce_dev *ce;
 	union {
 		struct skcipher_engine_alg skcipher;
 		struct ahash_engine_alg hash;
-		struct rng_alg rng;
 	} alg;
 	unsigned long stat_req;
 	unsigned long stat_fb;
 	unsigned long stat_bytes;
 	unsigned long stat_fb_maxsg;
@@ -396,13 +373,7 @@ int sun8i_ce_hash_final(struct ahash_request *areq);
 int sun8i_ce_hash_update(struct ahash_request *areq);
 int sun8i_ce_hash_finup(struct ahash_request *areq);
 int sun8i_ce_hash_digest(struct ahash_request *areq);
 int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq);
 
-int sun8i_ce_prng_generate(struct crypto_rng *tfm, const u8 *src,
-			   unsigned int slen, u8 *dst, unsigned int dlen);
-int sun8i_ce_prng_seed(struct crypto_rng *tfm, const u8 *seed, unsigned int slen);
-void sun8i_ce_prng_exit(struct crypto_tfm *tfm);
-int sun8i_ce_prng_init(struct crypto_tfm *tfm);
-
 int sun8i_ce_hwrng_register(struct sun8i_ce_dev *ce);
 void sun8i_ce_hwrng_unregister(struct sun8i_ce_dev *ce);
-- 
2.54.0


