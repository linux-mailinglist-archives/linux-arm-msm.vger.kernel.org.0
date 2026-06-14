Return-Path: <linux-arm-msm+bounces-113047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eXJRBG3ILmrH2gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 17:27:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3E6681636
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 17:27:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=nkOd8rKE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113047-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113047-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E390F30028AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 15:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C3039989B;
	Sun, 14 Jun 2026 15:27:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3939935D
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 15:27:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781450858; cv=none; b=a917Kf85BFIaHtLdqw2cdoNiB4Gh/mBUvuk7/FcFDeEZLAts+JVw+phgXagYru9DdN1Ec09Dr+iUkxdmQ2ez55TwfguVIZeDScJ8+0PrJpEN1vL2ZlWXxhymYwud11xV0sDNo0lrjLFEQNpFcrgGl3X/UiTMbWwFGA0G5a6xHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781450858; c=relaxed/simple;
	bh=2kNkUgAdLJGKlXgq8oY9CHVL3t2dpNtXWG2IT1ZC6lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MwZ16aLoBnwJsYNFOT15AHVa8Bzkqt347J/EYFTM2z1qFFxC6u0q7bq1jeFwYklDzYHxPgOoHxKWM+e6t+dDzwxaQ3Vk5w5Oziy4JgqFJcMGxnneL7fuDNctUpruAYcXxcC/+8OEzYIu1hJIpxwWV3apFO8CUlJpFj0vLmsfLCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nkOd8rKE; arc=none smtp.client-ip=91.218.175.172
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781450845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eDCFtAvpueOIK9+mnyHt/B8LMjjjILaDNCbh2gVjU8Y=;
	b=nkOd8rKEIYIYcbpcac8X47XAi+crhIfm87m3OcSZoAgOnjCaPbUTERSfl6gLCo+yRXO3JC
	PRjTqzDgqw1R3GNrmd62VbL5l121K9kCB0j89g0yMFuwV0q0imWzespm0iE6wUkSe1kFe+
	0a4h7GPtb338dywM1VTaIRzgwvBhLUY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: qce - drop unused scatterlist traversal in qce_ahash_update
Date: Sun, 14 Jun 2026 17:26:07 +0200
Message-ID: <20260614152605.701754-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2258; i=thorsten.blum@linux.dev; h=from:subject; bh=2kNkUgAdLJGKlXgq8oY9CHVL3t2dpNtXWG2IT1ZC6lc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl6J3gZ35XscGM6GWyf819ddrP2TyvDj73pzH8FHv0TO NvIsySio5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACYycS/D/5AzoYXax+UZE9RP zmFhfRh2ZdPu/b9fybyTmbVTqYZpfRvDPyMeRYYui/kSh4xcF657f4jrtktU4Y3zi9cm6a7rXpK uzAoA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113047-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:thorsten.blum@linux.dev,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D3E6681636

Commit df12ef60c87b ("crypto: qce/sha - Do not modify scatterlist passed
along with request") removed the only use of sg_last, rendering the
scatterlist traversal useless. Remove it and its local variables.

Also remove the redundant hash_later check, inline the source offset,
and assign the number of complete blocks directly to req->nbytes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/qce/sha.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 1b37121cbcdc..13a1174d2175 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -187,10 +187,8 @@ static int qce_ahash_update(struct ahash_request *req)
 	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
 	struct qce_alg_template *tmpl = to_ahash_tmpl(req->base.tfm);
 	struct qce_device *qce = tmpl->qce;
-	struct scatterlist *sg_last, *sg;
-	unsigned int total, len;
+	unsigned int total;
 	unsigned int hash_later;
-	unsigned int nbytes;
 	unsigned int blocksize;
 
 	blocksize = crypto_tfm_alg_blocksize(crypto_ahash_tfm(tfm));
@@ -238,28 +236,8 @@ static int qce_ahash_update(struct ahash_request *req)
 	if (!hash_later)
 		hash_later = blocksize;
 
-	if (hash_later) {
-		unsigned int src_offset = req->nbytes - hash_later;
-		scatterwalk_map_and_copy(rctx->buf, req->src, src_offset,
-					 hash_later, 0);
-	}
-
-	/* here nbytes is multiple of blocksize */
-	nbytes = total - hash_later;
-
-	len = rctx->buflen;
-	sg = sg_last = req->src;
-
-	while (len < nbytes && sg) {
-		if (len + sg_dma_len(sg) > nbytes)
-			break;
-		len += sg_dma_len(sg);
-		sg_last = sg;
-		sg = sg_next(sg);
-	}
-
-	if (!sg_last)
-		return -EINVAL;
+	scatterwalk_map_and_copy(rctx->buf, req->src, req->nbytes - hash_later,
+				 hash_later, 0);
 
 	if (rctx->buflen) {
 		sg_init_table(rctx->sg, 2);
@@ -268,7 +246,8 @@ static int qce_ahash_update(struct ahash_request *req)
 		req->src = rctx->sg;
 	}
 
-	req->nbytes = nbytes;
+	/* hash only complete blocks */
+	req->nbytes = total - hash_later;
 	rctx->buflen = hash_later;
 
 	return qce->async_req_enqueue(tmpl->qce, &req->base);

