Return-Path: <linux-arm-msm+bounces-110946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4uXQI6sXIGrHvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:01:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E645637479
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:01:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bRx9x5wz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110946-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110946-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39796308E640
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1599746AF25;
	Wed,  3 Jun 2026 11:50:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0D46AF08
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487416; cv=none; b=NRcLyrRLdk5J4nRexkCFgmyQn2HbCYrkeRkoAWIno0VPZf8mh27ngwyQyA9KOrlhrc2KgKIINPj7+DFH7gvgZrRcixbTTmlTATKPUart2jI5SridsPOhQO085G+nvJ0SIkfznuzsRzBcOtqqvndDmj+u3eF5a9bN88MO8Gl1gr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487416; c=relaxed/simple;
	bh=9geJzNgf+WThNkg/OcdRMOvKScGM8OBuCVL+aiam9IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbaP+1R9dTDwwpUNbMFsvNImVpyd99RggVXAOr4P75gUdB3h/Ul2I6B2YpnOWVBW5Vtfyp8P7MChbl2BSaRetEb74SQ6WJr1AAoS+tnnL8It0HdJ00Rc2+BoLBZj+VDBM4WCO331/o2D5ddWBrIuKN3cq3GBKYvfqd2FSJduHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRx9x5wz; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf3781ca51so43154325ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487414; x=1781092214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pqU/kQ2HBq/qGDKu6bV8BUK3iXPtSyo8YwmhrKH15Y=;
        b=bRx9x5wzr5SVaeGqC02tnz3gOVViL4iKUMO6Qf10T5p8CA7XIx4vn84s8fCRS9qMCu
         UTGyWjnGate6VI9QrRqzZlHC2o+bFFdiYiSgN8Y+IlOcTcXHAX6YdLlGyb2gdCgqRlmQ
         6HD3WbyNhJO9tPMcADWWTL3Q0QYCkLsnrhJiC+c29hnAqv0GmQHVP8D5aJJzPi0Rhfq5
         cQ3rHpujGvlhQVeV05qnZYyPLZ75XjeA/uAW2bW/mKTN/Ec0fRFsgivJe3jBsCM6Gcw4
         in4zVQelXx7TvZ0Np8g/ugl7wblRJvlNC1QKm0SWVbCKFCpa+bSFmMgh6ZUx/qikK3BG
         lQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487414; x=1781092214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4pqU/kQ2HBq/qGDKu6bV8BUK3iXPtSyo8YwmhrKH15Y=;
        b=LF6E+VFPCU33ERcX3qz1I3/6UFg/lqRjUsG5y7y0hVH0ZXZ3cJu5RcNxfgDRVIXteQ
         AQeH4iCZfak/ze1lsoyMpWo5vqXPLRP2ZabzOmC4S/NzQcs/oJZ3RIWYcBwcOwbfaO0b
         bpsFULqIU9H5fSKt8+8vubR0KGFqkP1Obr/Uqc05Fi+ARZLgnwmGbrF30pa+3oLVOGQ3
         QK8nUiprtYno525K3FwV5JPzljzkpEFtDs0hsa/aWbVJNU3OteYJejXjtL8wUxRvi65S
         9REjuAH9oGwGpv/LtvoM8t+xAOKfaxTG/8SjcpPD9UzGxOBMpJTOR6MFi2Db8bulPyAK
         2CaA==
X-Forwarded-Encrypted: i=1; AFNElJ9pOta9EfBbQ6mknEWcNHtIAtCcexRKvUxYnlED2kFixujMoY4DQ+KTrFbBgxc/OpfB0ScL1kJKiD5y8ZY3@vger.kernel.org
X-Gm-Message-State: AOJu0YyiWNtyDyZWNX1J9g6Z3JWN/OJxbylCPrtPAaXwLr5zM09x0BBL
	Rmh+kE1Ac8cZSUp2m2oHv5KioUpBWtZDoi/AZ9IGTt/B1QzfTDYs1FJw
X-Gm-Gg: Acq92OGWD/cr6xoE8IZKOB2MKcJ9yZMpYxNPR5WnlMuvCKRU6f66dqxWb+RpQoBh4ML
	sqykMMJNcuhJWRO7NgIbyGCpnA7ozPIhFnwxkNMhL64yqFatPCydLiZSc7rSQPGmfVVqZnwmA2O
	Q+KKO7NeKlBE8PqHKklypIUF1vhDUb149jcAH4jpnopmavcSIWRicVFHSSX6pT9wA9rOHvwKlCV
	ntDj6quV4AtoBcnEC/8417Y6z5PJUYgFeDrgCZBxtWnNOc1YPRzsLFfacdwSoMkwKD1fzlH/bhO
	NHdE0AnLBxh7IvFJJyZEuUgvzqhks7EagEvqNns6fOLJtf1RYYZ5gNmaJKT7rsQ2myi4TLmJHW9
	0UcZ0U/4gm9qwr0AAxK/coUatbNu3GKAdy+8SE9gAG5a4aUft0a4PhIUzevgOgjR9q9Uy13gnaI
	VQ8O8NQ+Ik32xZOlT8slZqgnFjSd4lJu97PkI+fl7v8o69W7fLBDBzxcOWmMr9X00FxT/9
X-Received: by 2002:a17:903:298c:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c1644dbfbamr33614925ad.37.1780487414015;
        Wed, 03 Jun 2026 04:50:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:13 -0700 (PDT)
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
Subject: [PATCH 1/9] ASoC: qcom: audioreach: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:41 +0700
Message-ID: <20260603114949.149595-2-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-110946-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E645637479

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/audioreach.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index a13f753eff98..8b3d1410c788 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -585,7 +585,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
-	mutex_lock(cmd_lock);
+	guard(mutex)(cmd_lock);
 	result->opcode = 0;
 	result->status = 0;
 
@@ -597,7 +597,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 		rc = -EINVAL;
 
 	if (rc < 0)
-		goto err;
+		return rc;
 
 	if (rsp_opcode)
 		rc = wait_event_timeout(*cmd_wait, (result->opcode == hdr->opcode) ||
@@ -616,8 +616,6 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 		rc = 0;
 	}
 
-err:
-	mutex_unlock(cmd_lock);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
@@ -1387,7 +1385,7 @@ void audioreach_graph_free_buf(struct q6apm_graph *graph)
 {
 	struct audioreach_graph_data *port;
 
-	mutex_lock(&graph->lock);
+	guard(mutex)(&graph->lock);
 	port = &graph->rx_data;
 	port->num_periods = 0;
 	kfree(port->buf);
@@ -1397,7 +1395,6 @@ void audioreach_graph_free_buf(struct q6apm_graph *graph)
 	port->num_periods = 0;
 	kfree(port->buf);
 	port->buf = NULL;
-	mutex_unlock(&graph->lock);
 }
 EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
 
-- 
2.43.0


