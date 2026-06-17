Return-Path: <linux-arm-msm+bounces-113681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B9MwAe7lMmqo6wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 20:22:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67E69BEE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 20:22:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TOSta2CX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113681-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113681-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C804F303748B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022593793B8;
	Wed, 17 Jun 2026 18:21:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548A34B40F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 18:21:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781720517; cv=none; b=J2ENHm0AD3rH3BuEKNO/keBjrp47QXuJWkfP78Y8/FvyI56/PEqPOpSSAbQDJ2OMEzJJws33yyEjrik/5+sgaM6nq3YQDrVM5sTpARM8D7AUrI79cenBD4YIutdHlwlJ4ujJtkrEBD5fsQIoLVcTS7/lbAo6f9nT2GW7Ruh8jaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781720517; c=relaxed/simple;
	bh=YH8ddk1uOZv5MsVhQHXZldbqbgDr8aDpn69KDbJKBXo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tRE9IGUpYss2ddp9kNvPMIdZnrD38V87ZSOg0dMm8FmRZW2PyrIcZVAhX8XSazu1Gh5ATIiHwslR/QtEfTiAh1yhNIuW1bJlSq2ayzNOI4JAsCegWwcPdeHkzEOPY3a4siPM/gQLSjOvesF4jWcSbWP3845aRar+lxK9AkySO5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOSta2CX; arc=none smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bcc877b4cso244649eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781720516; x=1782325316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0iYXs1cU5u1YpR2ayFZC3+vq4V6UqvGux+DRBVroafs=;
        b=TOSta2CXuLwsYmh6xziVhj38C1zG1onTFN6LbYI3UifLpOO1UxdssTRCfIrMFal4dG
         BDBx8SNGVw1ZiE90pGVE+Vva9w0uqr4ErWqjhwZq0gDMwKDekbM8xIuTwF3bLAOGxLMa
         R18RRZpyF308Bz/NmRWoZ6OJ22caKrZFSTi2r3b70fAaFY92T6C6Awk8pJl+yZ9SS9T/
         hW2ZKvDBPDzfoW0JppzADBKFXE831RtS6j2FoV8L6OXxe4vXK2AdBJVxQfoQKj3E9JAz
         UQkPSTKibANZCsXksswylynXTpVkmxlSsFjiAYUq9TswofOLM0XVe+zA9rLpS2ZHLf7Z
         LmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781720516; x=1782325316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iYXs1cU5u1YpR2ayFZC3+vq4V6UqvGux+DRBVroafs=;
        b=pK7/9x3DxSnwGSrgMU3kUNYiNQ7mtgOdeb0hSDmI5n1ciXufYxIj9+Qg8QIH962qpj
         meyOajcOjUVbWOSYy2pvWCKeKeBvSkrRQM9NS1V4SSoBEvATst1yFfEUeZL6NMV7AmHB
         ezRKwVpKyJY9kDuTHfSHhNpcJf5cciQpIO0SmZI+z1vIFJ/lfe3piZqiikawc7MQgYXb
         P2jkqynl/rFTrVaSDXKl/MxgOB79wPA85ABPZxGrF9VHp/XBVnFusv3SuvJg5uZSrDz0
         7nzDoj7aidCztfRNmHiTcHVkSwuEhQDdHLx9sSEU2G8zglRufp0LwAT82kommKBeqdDB
         JJEg==
X-Forwarded-Encrypted: i=1; AFNElJ+kQGjdeGA/YY8x6+lQe507420KdM08QzxDF7Y4iyaiha4Aul+UCvPN3n2q/jUVfbEsN71Tx0Qk/LWi3rtV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfn0/d2RgvxhpOCZRQigBQHH6W0NpZYg+Pl+8956fPnuj4LhYj
	5voXaaOoPwJFWwuKJLxYp5pKe8B5CSsegWQgS5S8JDbx2gCdC81qAiem
X-Gm-Gg: AfdE7clIjyJnH5Vsn/jElQZbds8d9uTfABoE6gNkIWpWNy5vthENwvfduVJRynDIAiW
	lAIbvEZVp6Y/X/copYSkaxNiLuHHAccGAZtQuOjcpZGR/xq1VKU/fG3Nls78epFVaQ6nhLnN/eu
	LDp+tZ1+S52WMO8pbjxshMXUXYWBqIaTvREOfvOHqtygbOEX84KQ+tI+KShJ9SvDL16+E2Vgg3f
	+A03BA0Dy97dy5NwCoxM59cy24XNGRXBOoU0Id3ZGCeK0Xc6BjdnhNr36SXtWIqLi/w1Krl2EI1
	R/mN9wyA6jjM9orDcN3YIS/hiLpU/GgvaQcMe48hQ+kjJg6sGCixwnViiuw3kTXmuJn3VPUKPsW
	0NkYa4+mknS3VSnUzfsKJTTtHUE8s/pBotPpoYg//keZJ8RpmGnPGjfyH3ZkcsIAF3hgOp2DTst
	pP+LiN16Zwl4QAb3Qr3K+hDMPf5bhMRCmc
X-Received: by 2002:a05:7300:6cab:b0:30b:e3c7:27f0 with SMTP id 5a478bee46e88-30bf078f484mr61879eec.13.1781720515950;
        Wed, 17 Jun 2026 11:21:55 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1886:6b7a:3e78:272c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm23479792eec.30.2026.06.17.11.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 11:21:55 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm: initialize graph refcount before publishing
Date: Thu, 18 Jun 2026 02:21:50 +0800
Message-ID: <20260617182150.959983-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113681-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D67E69BEE1

q6apm_get_audioreach_graph() inserts a newly allocated graph into
graph_idr before initializing its refcount. Another caller looking up the
same graph id can find the graph and call kref_get() before kref_init().
Initialize the refcount before publishing the graph in the IDR.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2e5b25b8d00fd..1953e8ca8777b 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -65,6 +65,7 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
 	graph->apm = apm;
 	graph->info = info;
 	graph->id = graph_id;
+	kref_init(&graph->refcount);
 
 	graph->graph = audioreach_alloc_graph_pkt(apm, info);
 	if (IS_ERR(graph->graph)) {
@@ -85,8 +86,6 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
 	}
 	mutex_unlock(&apm->lock);
 
-	kref_init(&graph->refcount);
-
 	q6apm_send_cmd_sync(apm, graph->graph, 0);
 
 	return graph;
-- 
2.51.0


