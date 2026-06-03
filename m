Return-Path: <linux-arm-msm+bounces-110947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W7q2BcEYIGrzvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:06:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4A06374F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:06:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NSQSBq5O;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110947-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110947-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8387C3038142
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802A346AF2C;
	Wed,  3 Jun 2026 11:50:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C139A061
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487423; cv=none; b=CkuisuwEGgwXsOiYZN35LAmVNApF9HzO32U3d54FBtywYzS62M8RP2DAVt5346Zz7QzQJ9GcKs1j6S1XOEEOmDBtGcDGs4K8t+V7682u187WEMu7C8tAiBzupF7l6xTz2mQJEjoHcMLwi8ElS2n7tXrdaF/payvvFZ1ZUvvd2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487423; c=relaxed/simple;
	bh=uwV6PO5DlFDznk+uJv/Pq9Nwi/vMbNemlLYmv9EURcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZT1Ml+nE3V6ItlgRE8XytJdaXGjdJr25lA8GYNTdDzT/ZpyukPoEi7ldxVnfKDj3Z1f31F+FvbtoKKOjSXhlcwQfsdk5rSCYYsufCVn2RiviNHu6vwE5qraQXAyTCN5lfhy7EfEIKHDTTKpI/PZpvP+yul4XlNcT0e+L1k5Ly9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSQSBq5O; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so27297255ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487420; x=1781092220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihPu9yJ7cbZM2Z9enb1eM3sg+iZi8+aG7UspBvf/VzQ=;
        b=NSQSBq5OXVbkWTbEEbBC5mSfCx8Z4f3jBsj/yYBmEtGmIDY2GOdjulDkdBDy/AU0tj
         BYiQHnw5JdFwNa+Eb8TJz1gv/uxMqyO/OY6CdSRLdXxdsYo1nkgA5qjZQimyKwKyMu38
         EkWCRyusjMVJrYXEI0niA5rkDYbXbCEP52Xz6GW4oIpk0GGBEVW4razDARgmYskabDWr
         qWr7b+eC6IK8W8uHZ55rUWfSblSQSkwJ941w9YvVfvP6gjW35XvmNSQNVW68t82woTEd
         MNIfa/5SOfsf//C621I/M43qfs0yRK4ok/GUr4CMC+HtJ2n+vU4JvH/b8Hh42oa2sSgS
         pFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487420; x=1781092220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ihPu9yJ7cbZM2Z9enb1eM3sg+iZi8+aG7UspBvf/VzQ=;
        b=RUD4p7oLHABYbj9kr935P30MbMFmKP8THUxJrvybyAylZOnN90CCH+QdSmAsX9mY7c
         ob5X4iMQwKuctAATUCz+WVcYMXNj0MGh6583iP4iuQ5pfJbiwCHvBYp/Oq8r18dflbHq
         MAt9a06TGZeJQF0+c1lzBZmUdGIxyEFrIRi7jIUdUn2RWK5SRfuaJ23s8TX7RKCY0UMe
         BXs0dUh9rzwl4RAZiNkoC57kMOdrCbkVRHTUgzTNXhKcBWW6LXJH21Ndk2TFV70fSIeC
         U/pfpxSoQhhXR2tWvz9ifw/a5udDgrq0JFnuS07zfbLJ4NRIj8RFC7D+gsL6u8WBLJ9a
         I+UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Sovr4ZQpsR6VP9tyR0lnotI2Dh0v2LskKeLi60PD+TZPiUJfmTb+2YPn0NV4KsAxErG3eAB0OHGmGAWzT@vger.kernel.org
X-Gm-Message-State: AOJu0YweoEZ7lq8tm6CAwMms3Cx4/FcyFelZOFrAAuR1ekYy4pJBgjhQ
	c4W10RFCJyxcIwIouanQ12h6wJMGeK650joVMnLNOElOOhDc7oT1ipX6PY2YEw==
X-Gm-Gg: Acq92OFlc5L4PUBPnYCvb4ynHXm7rZOw5R3g8AoN6bIGFIcqDr8/bpFo/XI2bQXSym4
	L3Jq/UmPmqC/cVnMGuIdBi+mm578O6mO7lTTYx6KSLaFZnrCY/S4EoP2TBAlIgp/NAqjDghk1oo
	1Ngv1JhDlDMh4dpCudwPnygHgtjezeCK0uZnJ/WV67AgSWRJfp9bcmFTdZXiPqnkSRGbO1q3XB1
	Aqd/XQgxgdwNClO1YJvGqmQq0oqUYLJN97fXA/IQMjY3s3rZQ+BHx5qpv/57o/hunOVVtWp5teG
	oqGzNBHaiEodr8I2jqBMGbExkzRQe1DuqnFPuzXSoDq+mwD4ZnhBt9zqNvPzv4FqCmnmsRxGJFV
	FVXd3q1fG6e1E3BZ9UUhPM52hMGdVVxFAcbRdrCSDHFkVLC0NI/rHVG+t5c35s7HL3lRJu1MBou
	9PM8VrpvHwCU+HPKEDrogWg6zCg4XUKA+nPMOQtbCaGhMA/sd+7sktTqxCtJ+leqxs5Kcp
X-Received: by 2002:a17:902:f706:b0:2c1:5667:2740 with SMTP id d9443c01a7336-2c163fad884mr31227115ad.21.1780487419974;
        Wed, 03 Jun 2026 04:50:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/9] ASoc: qcom: q6adm: Use guard() for mutex & spin locks
Date: Wed,  3 Jun 2026 18:49:42 +0700
Message-ID: <20260603114949.149595-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603114949.149595-1-phucduc.bui@gmail.com>
References: <20260603114949.149595-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110947-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E4A06374F9

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6adm.c | 52 +++++++++++++-----------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index db0ae71f2983..44c268c3e529 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -92,9 +92,8 @@ static struct q6copp *q6adm_find_copp(struct q6adm *adm, int port_idx,
 {
 	struct q6copp *c;
 	struct q6copp *ret = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
+	guard(spinlock_irqsave)(&adm->copps_list_lock);
 	list_for_each_entry(c, &adm->copps_list, node) {
 		if ((port_idx == c->afe_port) && (copp_idx == c->copp_idx)) {
 			ret = c;
@@ -103,8 +102,6 @@ static struct q6copp *q6adm_find_copp(struct q6adm *adm, int port_idx,
 		}
 	}
 
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
-
 	return ret;
 
 }
@@ -116,14 +113,13 @@ static int q6adm_apr_send_copp_pkt(struct q6adm *adm, struct q6copp *copp,
 	uint32_t opcode = pkt->hdr.opcode;
 	int ret;
 
-	mutex_lock(&adm->lock);
+	guard(mutex)(&adm->lock);
 	copp->result.opcode = 0;
 	copp->result.status = 0;
 	ret = apr_send_pkt(adm->apr, pkt);
 	if (ret < 0) {
 		dev_err(dev, "Failed to send APR packet\n");
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	/* Wait for the callback with copp id */
@@ -146,8 +142,6 @@ static int q6adm_apr_send_copp_pkt(struct q6adm *adm, struct q6copp *copp,
 		ret = -EINVAL;
 	}
 
-err:
-	mutex_unlock(&adm->lock);
 	return ret;
 }
 
@@ -172,17 +166,16 @@ static void q6adm_free_copp(struct kref *ref)
 {
 	struct q6copp *c = container_of(ref, struct q6copp, refcount);
 	struct q6adm *adm = c->adm;
-	unsigned long flags;
 	int ret;
 
 	ret = q6adm_device_close(adm, c, c->afe_port, c->copp_idx);
 	if (ret < 0)
 		dev_err(adm->dev, "Failed to close copp %d\n", ret);
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
-	clear_bit(c->copp_idx, &adm->copp_bitmap[c->afe_port]);
-	list_del(&c->node);
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
+	scoped_guard(spinlock_irqsave, &adm->copps_list_lock) {
+		clear_bit(c->copp_idx, &adm->copp_bitmap[c->afe_port]);
+		list_del(&c->node);
+	}
 	kfree(c);
 }
 
@@ -306,9 +299,8 @@ static struct q6copp *q6adm_find_matching_copp(struct q6adm *adm,
 {
 	struct q6copp *c;
 	struct q6copp *ret = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
+	guard(spinlock_irqsave)(&adm->copps_list_lock);
 
 	list_for_each_entry(c, &adm->copps_list, node) {
 		if ((port_id == c->afe_port) && (topology == c->topology) &&
@@ -318,7 +310,6 @@ static struct q6copp *q6adm_find_matching_copp(struct q6adm *adm,
 			kref_get(&c->refcount);
 		}
 	}
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
 
 	return ret;
 }
@@ -384,7 +375,6 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 {
 	struct q6adm *adm = dev_get_drvdata(dev->parent);
 	struct q6copp *copp;
-	unsigned long flags;
 	int ret = 0;
 
 	if (port_id < 0) {
@@ -399,15 +389,13 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 		return copp;
 	}
 
-	spin_lock_irqsave(&adm->copps_list_lock, flags);
-	copp = q6adm_alloc_copp(adm, port_id);
-	if (IS_ERR(copp)) {
-		spin_unlock_irqrestore(&adm->copps_list_lock, flags);
-		return ERR_CAST(copp);
-	}
+	scoped_guard(spinlock_irqsave, &adm->copps_list_lock) {
+		copp = q6adm_alloc_copp(adm, port_id);
+		if (IS_ERR(copp))
+			return ERR_CAST(copp);
 
-	list_add_tail(&copp->node, &adm->copps_list);
-	spin_unlock_irqrestore(&adm->copps_list_lock, flags);
+		list_add_tail(&copp->node, &adm->copps_list);
+	}
 
 	kref_init(&copp->refcount);
 	copp->topology = topology;
@@ -518,7 +506,7 @@ int q6adm_matrix_map(struct device *dev, int path,
 		kref_put(&copp->refcount, q6adm_free_copp);
 	}
 
-	mutex_lock(&adm->lock);
+	guard(mutex)(&adm->lock);
 	adm->result.status = 0;
 	adm->result.opcode = 0;
 
@@ -526,7 +514,7 @@ int q6adm_matrix_map(struct device *dev, int path,
 	if (ret < 0) {
 		dev_err(dev, "routing for stream %d failed ret %d\n",
 		       payload_map.session_id, ret);
-		goto fail_cmd;
+		return ret;
 	}
 	ret = wait_event_timeout(adm->matrix_map_wait,
 				 adm->result.opcode == pkt->hdr.opcode,
@@ -534,17 +522,13 @@ int q6adm_matrix_map(struct device *dev, int path,
 	if (!ret) {
 		dev_err(dev, "routing for stream %d failed\n",
 		       payload_map.session_id);
-		ret = -ETIMEDOUT;
-		goto fail_cmd;
+		return -ETIMEDOUT;
 	} else if (adm->result.status > 0) {
 		dev_err(dev, "DSP returned error[%d]\n",
 			adm->result.status);
-		ret = -EINVAL;
-		goto fail_cmd;
+		return -EINVAL;
 	}
 
-fail_cmd:
-	mutex_unlock(&adm->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(q6adm_matrix_map);
-- 
2.43.0


