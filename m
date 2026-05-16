Return-Path: <linux-arm-msm+bounces-108016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GByBNvO2CGp42QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 20:26:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8855D181
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 20:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C291300F9D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 18:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A931B325716;
	Sat, 16 May 2026 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u7zLm/Sv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5714322DB7;
	Sat, 16 May 2026 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956016; cv=none; b=qMbneqXS5eulrC21a4fQryHpcaOauX2KdIwtZNxsqBjnBnBjizc2BicK9uZUUvdL1cVQbmnUFT5o92HRC83pICDHP6W8FOvXNcrCwn2e4lg+hpNgtq+g8PCg86OD/QjWDKefeKtskKi5jOOONp+Byu+ixn3wAyrEWFEqRCwr3JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956016; c=relaxed/simple;
	bh=5NRjr8zzHkUcqAAMbm7x3LPu9+T/wt4SCXaf51TXES0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=emUYVu+/SPiiaXQVGh6+OM+kQ0gDPvoOTmqzV0vLjOtCIDGXtRVtFEEv4oa00b+qP5HeflClPqDgYEpkRbAlhoyHHDf7C6o/iX/ONF2cp9fM87v1mSXU4028ccEJNtvseh0eROE614kh22soLSXnmk398dTxUNsQv8qn+A/ordc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u7zLm/Sv; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778956002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XPNmsPEY/N3T861BKhzCvLefPxnkkzhoF4rkecCN/kc=;
	b=u7zLm/SvcUJhO8FwJdzSEdx7tQP9dmfrqyvieZTwi1uHBHCdPJFVKAKP1qWAfYBFXmaRzW
	BhnXslUGf+1trAb5F7ERw/lx79jB8CR/m2yR1Q+82lfvrzlcUUIrJAS7fbNqNWLD4ju97V
	O8Wwqb039zoRcExDr/8YB2Tm9rl8BMw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Kees Cook <kees@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] crypto: drivers - remove of_match_ptr from OF match tables
Date: Sat, 16 May 2026 20:23:36 +0200
Message-ID: <20260516182337.874311-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579; i=thorsten.blum@linux.dev; h=from:subject; bh=5NRjr8zzHkUcqAAMbm7x3LPu9+T/wt4SCXaf51TXES0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkc27Q4jQ3T2drOJcjPvbFt2eVFqUnWlx6vXTHrr1mUZ Mz36fuudJSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEljMz/BVdp3zkeWOVAFfM 7moe6TsbXFMvXazsKMtIvjG3xtNy0TdGhrsH+ToYeR4Zqh5Jc0l6voFBelfsKtcjdV7hB9rOTFb ZzAYA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 3FA8855D181
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108016-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Drop of_match_ptr() because OF matching is stubbed out when CONFIG_OF=n.

Indent bcm_spu_pdriver.driver and its members while at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Drop omap-des.c because it doesn't compile with CONFIG=n and requires
  other fixes first
- v1: https://lore.kernel.org/lkml/20260516114941.741140-2-thorsten.blum@linux.dev/
---
 drivers/crypto/bcm/cipher.c | 6 +++---
 drivers/crypto/qcom-rng.c   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/bcm/cipher.c b/drivers/crypto/bcm/cipher.c
index 2bce15dc0aa8..240b40ae9cd6 100644
--- a/drivers/crypto/bcm/cipher.c
+++ b/drivers/crypto/bcm/cipher.c
@@ -4698,9 +4698,9 @@ static void bcm_spu_remove(struct platform_device *pdev)
 
 static struct platform_driver bcm_spu_pdriver = {
 	.driver = {
-		   .name = "brcm-spu-crypto",
-		   .of_match_table = of_match_ptr(bcm_spu_dt_ids),
-		   },
+		.name = "brcm-spu-crypto",
+		.of_match_table = bcm_spu_dt_ids,
+	},
 	.probe = bcm_spu_probe,
 	.remove = bcm_spu_remove,
 };
diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 0685ba122e8a..150e5802e351 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -265,7 +265,7 @@ static struct platform_driver qcom_rng_driver = {
 	.remove =  qcom_rng_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.of_match_table = of_match_ptr(qcom_rng_of_match),
+		.of_match_table = qcom_rng_of_match,
 		.acpi_match_table = ACPI_PTR(qcom_rng_acpi_match),
 	}
 };

