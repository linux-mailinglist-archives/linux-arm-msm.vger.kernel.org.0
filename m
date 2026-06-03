Return-Path: <linux-arm-msm+bounces-110948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QzN2ISAWIGp/vgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:55:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA326373E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:55:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZyJXfKWt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110948-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110948-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA75B30EAEEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4595147276A;
	Wed,  3 Jun 2026 11:50:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4146AF0A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487426; cv=none; b=EwzVfjKrp/XwFog8+obXj6T49e9jO6fSdDxGvbnzR6dcNKRvi0TqHOP7q7JkNN1/2dtXFKrQI9b3tyqgZBuZ1/PlsmGdHBr7Urgqt4IG16894Qc2htDAaQGeVADkil/BYU+oAHZ3nA+pL55Z6K10pfwtJL5Eo7zpMqQuCYq1h4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487426; c=relaxed/simple;
	bh=iRqMG9DN/p0d7WwrGgFPpJSCy0qf0D8Q2xI7Rv5LrNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpsX9nCHytxEZ6rd2pe0Tj/mvsgEdIWHB701BF58yFxoGEWgJCjg+h5n2QaOu8N1go8u3h+/A5crp/OexiMSnGkjdd26TBr0VCkwBITgc8zQo5aoBDQE3wBx4K1RzKD3fc4fc0u2rs6XXK/mMQQ6k6/eYWotH3T5Nu9CeKisn+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyJXfKWt; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf2247e38eso45355815ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487424; x=1781092224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsEQCBEsoTa7MTlBM/uxhWN3Fk4N0THbIr2xqO/n6O0=;
        b=ZyJXfKWtBp2WSReas1Z8Nunop+OgkCNxXlO5eBvjJgIjNHwKJMqAyMc2ykSaIlxAX+
         ehQph48+Cxyc45kO9GWblw76vWHfAw+w5ayAz+i7EfUYxhynVC3rEwh6v08M2M5aXWnV
         Pjffx1T7gl/ea41nTZ1yTcokJTvKopxScF6zNygsdTGjfELkH3gvY18TFu5cQxzBNU72
         nVfcm5LFHZAM2cYo7eTRuOsSNr8uhL9P2iRSzIBhDQn0LqktPRAFr8tDJ+lTjArkFrgl
         wfiN4B+ZvTXQw1RTR1FcS3tq76KQx1WzR9ABx1HkWOf+PUdDViSWN2+pIZ0V7gTCcVpo
         3pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487424; x=1781092224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsEQCBEsoTa7MTlBM/uxhWN3Fk4N0THbIr2xqO/n6O0=;
        b=HCid5Xsf/X+MiFRum9EqDdL/0LP6RHscjrKfLfSzVIbzr3oYiwCVlkLQrzhoY/WASo
         nSa8S8PqskikB/UlT0XukmOu1dIEejbLb7FFTzAo4NkeXP5Wx6o+9bff9jjJMsjAQY52
         18OZn0kspxrhJ+T7uhac+h45BmzGDqS3d7pW7jIlNX4URlxXFg9uQt9RSYpc8kpUYYRq
         e9XNaJ9ysDOuZQeB2wXW2A2FyclZn9+TxA9yic8D08/uISXq1j+NChIZKXkc701Pp22e
         oNPw4JmNi975faywNIhPy00doq5pfurZtXoz6ZlHTY/qKqgHd1Jj2HN6r3Zr724LUzXR
         0FWg==
X-Forwarded-Encrypted: i=1; AFNElJ8LOutr1ITB8BaYL8Fe2n0u/c6oZkKHBO9qz+kxEh9WbI/yqcX8TjMk9rbxQS4JVXGDPHclW4m413NRTwak@vger.kernel.org
X-Gm-Message-State: AOJu0YyXHOuIo1RpHESeFKr4naOnaFnFTn98wY0pl9UQ8qosJwXRCFJe
	ifsc4UszIJ4RQChE6xdhZaPzR0PBgoshwCXnd39LznqBTwIEB1Vz1OP8
X-Gm-Gg: Acq92OFUXRuC4qIYa+hmeu98WWlf46U0oc1RVFRTndnU+i8M3TJ5kcmAYvqUCm96oK/
	FkZiAg3lC9+QwTcDlWM5MHwhWADd6Jvsl5Cd1FxSf0celk0hrwh5NfQuqx29WizvjYLyS9jAsVQ
	zP30hxDUqxbcroIiCyVBrXWRipfkdSJTDPUnGGJDzuK4dIRhtBXwFok32KL7ZAfMa+O4wnoqUxv
	vQw25HiQjGYTpEhxCDjuxgU8IwE+ZN4d4rqQxe9kQBPS4SuLOF5a5jU0ICE04X9f1m60hcTUFLk
	2lMUoIfK5y8OUZQ+Sdr9C700AODpNE7mMGO9kvlJ8Q9E94nIWBSvgaBtHVKMnnp3XJLmRyPCTq0
	HnFZWmSEn8jb+vYAE56dKrM1vyDzXyyhdfh/B96IyB39rdSnxmuty4t9+vFmgxQDbhBuyB4+gXd
	KMteT0o5980MhtZlSq4K3vgpHiOoc1KhPfVHw1XAl+ZlraVCd6LveA7cAzzmOqRAcV1RFt
X-Received: by 2002:a17:903:2b03:b0:2c0:b319:fb43 with SMTP id d9443c01a7336-2c163d92b07mr31337955ad.21.1780487423940;
        Wed, 03 Jun 2026 04:50:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:23 -0700 (PDT)
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
Subject: [PATCH 3/9] ASoc: qcom: q6afe: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:43 +0700
Message-ID: <20260603114949.149595-4-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110948-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DA326373E4

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6afe.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 40237267fda0..81a93b6f7e4c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1035,7 +1035,7 @@ static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 	struct aprv2_ibasic_rsp_result_t *result;
 	int ret;
 
-	mutex_lock(&afe->lock);
+	guard(mutex)(&afe->lock);
 	if (port) {
 		wait = &port->wait;
 		result = &port->result;
@@ -1050,8 +1050,7 @@ static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 	ret = apr_send_pkt(afe->apr, pkt);
 	if (ret < 0) {
 		dev_err(afe->dev, "packet not transmitted (%d)\n", ret);
-		ret = -EINVAL;
-		goto err;
+		return -EINVAL;
 	}
 
 	ret = wait_event_timeout(*wait, (result->opcode == rsp_opcode),
@@ -1066,9 +1065,6 @@ static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 		ret = 0;
 	}
 
-err:
-	mutex_unlock(&afe->lock);
-
 	return ret;
 }
 
-- 
2.43.0


