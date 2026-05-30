Return-Path: <linux-arm-msm+bounces-110340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIKEFxxHGmrP2ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 04:10:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDF960AE4E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 04:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB25F3069D27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 02:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17653148A7;
	Sat, 30 May 2026 02:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdrX/Q8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59D2C21C4;
	Sat, 30 May 2026 02:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780106831; cv=none; b=mNv8eDgfbGuZIVdwvwflD9rDf4HtxRJATYNqEy5+CMbimxNrq2R/S+8fnpd01EG28efFFgkcXQT9SUIs+NwqnREk5btgVkuIZfIqLetIwuhK/X58ZWMidq9euiAVkraWDaWUtAIJERYgpZfYu8RK1KREUxa79pn1CRN+P7HBSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780106831; c=relaxed/simple;
	bh=VYOIDtqd4ucDLDzEURmfG+r+wD9zt0qWUndPEy33i3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+uz1EgNsjumBAUmh0Q+T6XH4d0mpoDIimBDZpt4FgkZhpEKD/i2J/rLtPIFhgVlvLRa6CJeQpqo6FdcqROcyjGc1ZHVtXkq2oiFwpY8Qm/ZtYw3LqvvzB/M3VLF4NYx2ZUQ3z73GCfBOXUNeo6OsMEvAaZglKUG+Ojm5jqIz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdrX/Q8n; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572761F0089A;
	Sat, 30 May 2026 02:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780106830;
	bh=BAk+/NT38mB/njzldbjiOKe+YbzIHJjolZLkTM2lZpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PdrX/Q8n46fAd3ekIrXqV9vvz0fL8KXJuZmSPCng+qVdyuDdRPb20ntsVZsEomczR
	 H7j1k5YByEll9Q1lj13Sp1c46a/3+DsZpZkrM4EY2oDKN/dG3e4rB/hQ2fJevFvfEC
	 DKdUBiZhEIVbkZM5bTw0FdpHEwqR6uv+SJlWlcfWYwhqIGzWaXutnh9QXRvpuwuCrC
	 OE5SisJS+68l4efImuJeDIdH/5D7qJ2UnS59RESjqRDYw8h36Oupb/ONVvi7EfC0W6
	 JjmWqkS1paaAWdZ8nYo/Pn4KNstmdyfh5HTyIaeKbJJMvjwnJmq3IFXPVaGuPDfPVv
	 hW4oo/Zjo42vw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] crypto: qcom-rng - Allow zero as a random number
Date: Fri, 29 May 2026 19:03:30 -0700
Message-ID: <20260530020332.143058-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530020332.143058-1-ebiggers@kernel.org>
References: <20260530020332.143058-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110340-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BBDF960AE4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Zero is a valid random number and needs to be allowed.  Otherwise the
output is distinguishable from random.

Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/qcom-rng.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index f31a7fe07ba7..b7f3b9695dac 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -63,13 +63,10 @@ static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
 					 200, 10000);
 		if (ret)
 			return ret;
 
 		val = readl_relaxed(rng->base + PRNG_DATA_OUT);
-		if (!val)
-			return -EINVAL;
-
 		if ((max - currsize) >= WORD_SZ) {
 			memcpy(data, &val, WORD_SZ);
 			data += WORD_SZ;
 			currsize += WORD_SZ;
 		} else {
-- 
2.54.0


