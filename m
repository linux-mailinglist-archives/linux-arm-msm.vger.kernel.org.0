Return-Path: <linux-arm-msm+bounces-111946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o24rKIkGJ2p2qQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:14:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23158659979
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:14:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hmWHSAtx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111946-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111946-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C44E31F0B5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866DA381B1A;
	Mon,  8 Jun 2026 18:01:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A1F35A393;
	Mon,  8 Jun 2026 18:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941689; cv=none; b=BJNoE7bxkunKK+1eHAQUl7BVSq6Wi1uNrdjLx63wolJ9pDO5E/3NfJBLTA2zrYFGwoHfjd+9ylkeMca/OZpjPpsgdGjz2Tr9OL/UPMNLVnJ+go9Kq2vgzzwFseT93ApGbhp8iaD/eDjm55zshQIO4ASVS8sVqX/Bpzl5JOS6umw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941689; c=relaxed/simple;
	bh=GlOqjbz3inGV9Jfgnw21p2hHZaG0EcbvAo0Cw52DWpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAuIA5iXuqfvrRsnMY3kfuOvGvH60iiq3dfRzkhqXWqqDrGWYEBF6A7cO8ynKDKB79jJMY6hb9JxkiU2Iwc7mHwr8Rz6/2Sz6u+0JvMDzmQVM7rsXP658FMLGTe3TqC3Ax4mScdGRWDO4mcXj9lx2wpMGI1VUdSIWzN4asaKT7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmWHSAtx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49E01F00899;
	Mon,  8 Jun 2026 18:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780941688;
	bh=VrQ68f6nV/bENo0v3J/iZPKG/H3AUyXGEYgeAc35KaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hmWHSAtxNnI4cN5Ml9jOx+WQ6VsyS5M756UohBfiTsQuYbvUt2VArqdIyV+TqEaGx
	 XGuMWeQ0k0P+3oAJ9ah8FGCzIacIoCUhqFn+pb8+X+yy576PMNf8hCFTGeI7a+HgCi
	 JMNGkCVb75QoHQb2I18+R1iMSo66Db4u7yaEn5sxVXlvzg5Af58+Z9qn28Jl0iqbYj
	 adQgT4jnMsi6v4/pyhhqPYMQyjU9MTrJmile2SN35sLG433AUlvqlMw72LK0YdIYiL
	 jaotOP3u0SmJgwUqIwVHlscvMt+2+gyMhX95cPhFCK/94O5BdYnbbdNNaJjQCrL9d+
	 l1VlgHO1CU3yQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Olivia Mackall <olivia@selenic.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] crypto: qcom-rng - Allow zero as a random number
Date: Mon,  8 Jun 2026 17:58:46 +0000
Message-ID: <20260608175848.2045229-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
In-Reply-To: <20260608175848.2045229-1-ebiggers@kernel.org>
References: <20260608175848.2045229-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-111946-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:ebiggers@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23158659979

Zero is a valid random number and needs to be allowed.  Otherwise the
output is distinguishable from random.

Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/qcom-rng.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index f31a7fe07ba7..7058bd98f9e9 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -63,12 +63,10 @@ static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
 					 200, 10000);
 		if (ret)
 			return ret;
 
 		val = readl_relaxed(rng->base + PRNG_DATA_OUT);
-		if (!val)
-			return -EINVAL;
 
 		if ((max - currsize) >= WORD_SZ) {
 			memcpy(data, &val, WORD_SZ);
 			data += WORD_SZ;
 			currsize += WORD_SZ;
-- 
2.54.0.1064.gd145956f57-goog


