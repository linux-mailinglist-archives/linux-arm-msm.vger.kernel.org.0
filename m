Return-Path: <linux-arm-msm+bounces-110950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2RK9BmcXIGrCvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:00:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C91637463
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:00:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mBJm5luJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110950-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110950-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF6D830757B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A49477992;
	Wed,  3 Jun 2026 11:50:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418047798E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487433; cv=none; b=YJ/jL4Vj9jjNdn9K3JwQ7GktnYl3vp3asXyWafoMgsFQWk/zY8Lg0brY39am3O4SNcw6pZP+dvc/XxKMxzuWhnbXaApIQsYMkO0te00RRIrmgJTCZXCdbAmoWdyg/OKVl39O5izquc7ZH9wn7bPeT4guwewu7dD0rmSApDIGBn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487433; c=relaxed/simple;
	bh=y6XRfj7uH/twihlvLPQECCeTMtp+zAXGvZHstWObMDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T06TInBn7938cR7NKIjDvqHO69cbAuQeqvhc8YO/wX5EEfQFd46nEk+a25kT8YTbDgdyvBy9Ov7KF7Ph3Ft9JrBkANRLZfqiOc3ab45ie5FRFr9xa8uexHyb9HvVMRJ9PsOGOcud7dqFt75/8CWOxpk7g3Xx6q58hDoGU0MqjW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBJm5luJ; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c132ac5ec2so14658475ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487431; x=1781092231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTIltzuE2Za37oaiI+Y4tpXxqTPpmM9bJbC/+luaF7g=;
        b=mBJm5luJPjy7IFMe57I7DY2wTQx3pdzo1JHNOOlEII937JEuw1tO0WFXQsSCWv8rFm
         bEumMFdTbTZvTvW3g2suqWKsHgH6D0Ie3i7gJ8rFilIt3YGO503t2j485mvMD/Itxoun
         qjc5Ie/cwjtiK0LaS9aJjkqkminJRSGBWcEwN2YMX0mWHh754NSEPRYQbb82hwJi9vME
         rwRVMJcLoafix7qKnjnhz+AbAVS1+javcWziPz/3jbKzzfpsFvw1PySDkBQDub9gNapG
         m+WcOaUWHRJmCSERRtQ/7fQbGXUTObuggOWYbUs3u5vGTba2Gv+ZzUov39eELyCmBHf1
         klUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487431; x=1781092231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTIltzuE2Za37oaiI+Y4tpXxqTPpmM9bJbC/+luaF7g=;
        b=nW+4XwbRkKkyB7Qn6OVmq4WGUd1h14dVlswsYll7iaMyJAmxLhS+mltypX7jvSBKWG
         QTfWduncEgPvEIT14vfo2euOpRoyFeFFDsdiQq/L9TXPZ6uUXvj3OlkmBPu7OrlygE3y
         RhrxlZA+DsEanNWjfpdQdWR7JLbAJTbAdf7VQIu9PwnIO1/5GKobw0hX4eAK7uQeqbhq
         jGID03zPMMZWHr75uOULzvtCp5nTySubXHWUB89OlyAKg02bqpToWrDaNbtDzOCOA6ga
         tO+0vbJara05yiFNX95ibQ/8Qv2c6daV10bebnMT9W36Fbp+jsGe1fxVqaCFjsMsD35t
         3SRA==
X-Forwarded-Encrypted: i=1; AFNElJ84AgBOb7umDL/A33GGdoJxAyqkSMFpvofcXmD0yz80JTRDZJ5tN2cSEYreNPRx2aAsuQBLCEzoEIGk+RO0@vger.kernel.org
X-Gm-Message-State: AOJu0YykErSGd83OKa06GRcCdQDni6r/5fU0lQkLmEFypyS4TmwlxUvl
	le0CCe9jqhQdxnbQbb+kvawQxd12l3aMn+egvCieAW2Y9Ql4WQsFG6aW
X-Gm-Gg: Acq92OG7a5M/oPRkEm0eQ+uZPE0cwrleITm2DMFsvN033+UDnkRrWZxKGYL8ceqyS4O
	iAF8ruJKHzCMSweD6FmR96xFVFHRklZefEPdlqBWFTe81jzyW1UDcYIxYF8cOXIWBflEP0XQDLS
	H3TsPfPBKpi06MtMTXWxFgS/asn66YkeKbvLeWQ1IPlJ2hQg7G59uMVNz7NlKgERVJ0N+DWUmOO
	z1Zk7SR0SOmcvxYSwVz+Aqo0AR8xoprMeJBf12rEFyL4PWxP4fMkauqw4adAcN6StGq4DynmuuL
	PqDK4wm/gEl5UtwWDK+JC6i0trjUKFNdUDu+q+6wQCjUMn/RFUtBwNrw4r3pO8c8WJfOc9U3P8x
	XCizWzi8x1RNHiixqEYX2spUN4E5fXetyXCSZLI4otpWN7Bsg0QnXrR45iLssoVJoCxxNadgfWA
	/FsD8FKoa/wsO/u+R2ZwG2SRWpLcBB3W2T/h90DoBPxH0e3FqIoBxN7FzLKCwc0TcbGpJP
X-Received: by 2002:a17:903:b8d:b0:2c0:cbd8:5ff9 with SMTP id d9443c01a7336-2c163fa8268mr32192965ad.21.1780487431250;
        Wed, 03 Jun 2026 04:50:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:30 -0700 (PDT)
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
Subject: [PATCH 5/9] ASoC: qcom: q6asm: Use guard() for mutex & spin locks
Date: Wed,  3 Jun 2026 18:49:45 +0700
Message-ID: <20260603114949.149595-6-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110950-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55C91637463

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6asm.c | 164 +++++++++++++++--------------------
 1 file changed, 71 insertions(+), 93 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index de0bd8fd08ee..d058468c4afa 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -297,12 +297,12 @@ static int q6asm_apr_send_session_pkt(struct q6asm *a, struct audio_client *ac,
 	struct apr_hdr *hdr = &pkt->hdr;
 	int rc;
 
-	mutex_lock(&ac->cmd_lock);
+	guard(mutex)(&ac->cmd_lock);
 	ac->result.opcode = 0;
 	ac->result.status = 0;
 	rc = apr_send_pkt(a->adev, pkt);
 	if (rc < 0)
-		goto err;
+		return rc;
 
 	if (rsp_opcode)
 		rc = wait_event_timeout(a->mem_wait,
@@ -323,8 +323,6 @@ static int q6asm_apr_send_session_pkt(struct q6asm *a, struct audio_client *ac,
 		rc = -EINVAL;
 	}
 
-err:
-	mutex_unlock(&ac->cmd_lock);
 	return rc;
 }
 
@@ -371,11 +369,8 @@ static int __q6asm_memory_unmap(struct audio_client *ac,
 static void q6asm_audio_client_free_buf(struct audio_client *ac,
 					struct audio_port_data *port)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&ac->lock, flags);
-	port->num_periods = 0;
-	spin_unlock_irqrestore(&ac->lock, flags);
+	scoped_guard(spinlock_irqsave, &ac->lock)
+		port->num_periods = 0;
 	kfree(port->buf);
 	port->buf = NULL;
 }
@@ -427,7 +422,6 @@ static int __q6asm_memory_map_regions(struct audio_client *ac, int dir,
 	struct audio_port_data *port = NULL;
 	struct audio_buffer *ab = NULL;
 	struct apr_pkt *pkt;
-	unsigned long flags;
 	uint32_t num_regions, buf_sz;
 	int i, pkt_size;
 
@@ -464,17 +458,17 @@ static int __q6asm_memory_map_regions(struct audio_client *ac, int dir,
 	cmd->num_regions = num_regions;
 	cmd->property_flag = 0x00;
 
-	spin_lock_irqsave(&ac->lock, flags);
-	port = &ac->port[dir];
+	scoped_guard(spinlock_irqsave, &ac->lock) {
+		port = &ac->port[dir];
 
-	for (i = 0; i < num_regions; i++) {
-		ab = &port->buf[i];
-		mregions->shm_addr_lsw = lower_32_bits(ab->phys);
-		mregions->shm_addr_msw = upper_32_bits(ab->phys);
-		mregions->mem_size_bytes = buf_sz;
-		++mregions;
+		for (i = 0; i < num_regions; i++) {
+			ab = &port->buf[i];
+			mregions->shm_addr_lsw = lower_32_bits(ab->phys);
+			mregions->shm_addr_msw = upper_32_bits(ab->phys);
+			mregions->mem_size_bytes = buf_sz;
+			++mregions;
+		}
 	}
-	spin_unlock_irqrestore(&ac->lock, flags);
 
 	return q6asm_apr_send_session_pkt(a, ac, pkt, ASM_CMDRSP_SHARED_MEM_MAP_REGIONS);
 }
@@ -495,38 +489,32 @@ int q6asm_map_memory_regions(unsigned int dir, struct audio_client *ac,
 			     size_t period_sz, unsigned int periods)
 {
 	struct audio_buffer *buf;
-	unsigned long flags;
 	int cnt;
 	int rc;
 
-	spin_lock_irqsave(&ac->lock, flags);
-	if (ac->port[dir].buf) {
-		dev_err(ac->dev, "Buffer already allocated\n");
-		spin_unlock_irqrestore(&ac->lock, flags);
-		return 0;
-	}
-
-	buf = kzalloc_objs(*buf, periods, GFP_ATOMIC);
-	if (!buf) {
-		spin_unlock_irqrestore(&ac->lock, flags);
-		return -ENOMEM;
-	}
+	scoped_guard(spinlock_irqsave, &ac->lock) {
+		if (ac->port[dir].buf) {
+			dev_err(ac->dev, "Buffer already allocated\n");
+			return 0;
+		}
 
+		buf = kzalloc_objs(*buf, periods, GFP_ATOMIC);
+		if (!buf)
+			return -ENOMEM;
 
-	ac->port[dir].buf = buf;
+		ac->port[dir].buf = buf;
 
-	buf[0].phys = phys;
-	buf[0].size = period_sz;
+		buf[0].phys = phys;
+		buf[0].size = period_sz;
 
-	for (cnt = 1; cnt < periods; cnt++) {
-		if (period_sz > 0) {
-			buf[cnt].phys = buf[0].phys + (cnt * period_sz);
-			buf[cnt].size = period_sz;
+		for (cnt = 1; cnt < periods; cnt++) {
+			if (period_sz > 0) {
+				buf[cnt].phys = buf[0].phys + (cnt * period_sz);
+				buf[cnt].size = period_sz;
+			}
 		}
+		ac->port[dir].num_periods = periods;
 	}
-	ac->port[dir].num_periods = periods;
-
-	spin_unlock_irqrestore(&ac->lock, flags);
 
 	rc = __q6asm_memory_map_regions(ac, dir, period_sz, periods, 1);
 	if (rc < 0) {
@@ -542,14 +530,12 @@ static void q6asm_audio_client_release(struct kref *ref)
 {
 	struct audio_client *ac;
 	struct q6asm *a;
-	unsigned long flags;
 
 	ac = container_of(ref, struct audio_client, refcount);
 	a = ac->q6asm;
 
-	spin_lock_irqsave(&a->slock, flags);
-	a->session[ac->session] = NULL;
-	spin_unlock_irqrestore(&a->slock, flags);
+	scoped_guard(spinlock_irqsave, &a->slock)
+		a->session[ac->session] = NULL;
 
 	kfree(ac);
 }
@@ -842,7 +828,6 @@ struct audio_client *q6asm_audio_client_alloc(struct device *dev, q6asm_cb cb,
 {
 	struct q6asm *a = dev_get_drvdata(dev->parent);
 	struct audio_client *ac;
-	unsigned long flags;
 
 	ac = q6asm_get_audio_client(a, session_id + 1);
 	if (ac) {
@@ -854,9 +839,8 @@ struct audio_client *q6asm_audio_client_alloc(struct device *dev, q6asm_cb cb,
 	if (!ac)
 		return ERR_PTR(-ENOMEM);
 
-	spin_lock_irqsave(&a->slock, flags);
-	a->session[session_id + 1] = ac;
-	spin_unlock_irqrestore(&a->slock, flags);
+	scoped_guard(spinlock_irqsave, &a->slock)
+		a->session[session_id + 1] = ac;
 	ac->session = session_id + 1;
 	ac->cb = cb;
 	ac->dev = dev;
@@ -880,20 +864,19 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
 	struct apr_hdr *hdr = &pkt->hdr;
 	int rc;
 
-	mutex_lock(&ac->cmd_lock);
+	guard(mutex)(&ac->cmd_lock);
 	ac->result.opcode = 0;
 	ac->result.status = 0;
 
 	rc = apr_send_pkt(ac->adev, pkt);
 	if (rc < 0)
-		goto err;
+		return rc;
 
 	rc = wait_event_timeout(ac->cmd_wait,
 				(ac->result.opcode == hdr->opcode), 5 * HZ);
 	if (!rc) {
 		dev_err(ac->dev, "CMD %x timeout\n", hdr->opcode);
-		rc =  -ETIMEDOUT;
-		goto err;
+		return -ETIMEDOUT;
 	}
 
 	if (ac->result.status > 0) {
@@ -904,9 +887,6 @@ static int q6asm_ac_send_cmd_sync(struct audio_client *ac, struct apr_pkt *pkt)
 		rc = 0;
 	}
 
-
-err:
-	mutex_unlock(&ac->cmd_lock);
 	return rc;
 }
 
@@ -1402,7 +1382,6 @@ int q6asm_read(struct audio_client *ac, uint32_t stream_id)
 	struct audio_port_data *port;
 	struct audio_buffer *ab;
 	struct apr_pkt *pkt;
-	unsigned long flags;
 	int pkt_size = APR_HDR_SIZE + sizeof(*read);
 	int rc = 0;
 
@@ -1413,25 +1392,25 @@ int q6asm_read(struct audio_client *ac, uint32_t stream_id)
 	pkt = p;
 	read = p + APR_HDR_SIZE;
 
-	spin_lock_irqsave(&ac->lock, flags);
-	port = &ac->port[SNDRV_PCM_STREAM_CAPTURE];
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, stream_id);
-	ab = &port->buf[port->dsp_buf];
-	pkt->hdr.opcode = ASM_DATA_CMD_READ_V2;
-	read->buf_addr_lsw = lower_32_bits(ab->phys);
-	read->buf_addr_msw = upper_32_bits(ab->phys);
-	read->mem_map_handle = port->mem_map_handle;
+	scoped_guard(spinlock_irqsave, &ac->lock) {
+		port = &ac->port[SNDRV_PCM_STREAM_CAPTURE];
+		q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, stream_id);
+		ab = &port->buf[port->dsp_buf];
+		pkt->hdr.opcode = ASM_DATA_CMD_READ_V2;
+		read->buf_addr_lsw = lower_32_bits(ab->phys);
+		read->buf_addr_msw = upper_32_bits(ab->phys);
+		read->mem_map_handle = port->mem_map_handle;
 
-	read->buf_size = ab->size;
-	read->seq_id = port->dsp_buf;
-	pkt->hdr.token = port->dsp_buf;
+		read->buf_size = ab->size;
+		read->seq_id = port->dsp_buf;
+		pkt->hdr.token = port->dsp_buf;
 
-	port->dsp_buf++;
+		port->dsp_buf++;
 
-	if (port->dsp_buf >= port->num_periods)
-		port->dsp_buf = 0;
+		if (port->dsp_buf >= port->num_periods)
+			port->dsp_buf = 0;
+	}
 
-	spin_unlock_irqrestore(&ac->lock, flags);
 	rc = apr_send_pkt(ac->adev, pkt);
 	if (rc == pkt_size)
 		rc = 0;
@@ -1515,7 +1494,6 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	struct asm_data_cmd_write_v2 *write;
 	struct audio_port_data *port;
 	struct audio_buffer *ab;
-	unsigned long flags;
 	struct apr_pkt *pkt;
 	int pkt_size = APR_HDR_SIZE + sizeof(*write);
 	int rc = 0;
@@ -1527,30 +1505,30 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	pkt = p;
 	write = p + APR_HDR_SIZE;
 
-	spin_lock_irqsave(&ac->lock, flags);
-	port = &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
-	q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, stream_id);
+	scoped_guard(spinlock_irqsave, &ac->lock) {
+		port = &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
+		q6asm_add_hdr(ac, &pkt->hdr, pkt_size, false, stream_id);
 
-	ab = &port->buf[port->dsp_buf];
-	pkt->hdr.token = port->dsp_buf | (len << ASM_WRITE_TOKEN_LEN_SHIFT);
-	pkt->hdr.opcode = ASM_DATA_CMD_WRITE_V2;
-	write->buf_addr_lsw = lower_32_bits(ab->phys);
-	write->buf_addr_msw = upper_32_bits(ab->phys);
-	write->buf_size = len;
-	write->seq_id = port->dsp_buf;
-	write->timestamp_lsw = lsw_ts;
-	write->timestamp_msw = msw_ts;
-	write->mem_map_handle =
-	    ac->port[SNDRV_PCM_STREAM_PLAYBACK].mem_map_handle;
+		ab = &port->buf[port->dsp_buf];
+		pkt->hdr.token = port->dsp_buf | (len << ASM_WRITE_TOKEN_LEN_SHIFT);
+		pkt->hdr.opcode = ASM_DATA_CMD_WRITE_V2;
+		write->buf_addr_lsw = lower_32_bits(ab->phys);
+		write->buf_addr_msw = upper_32_bits(ab->phys);
+		write->buf_size = len;
+		write->seq_id = port->dsp_buf;
+		write->timestamp_lsw = lsw_ts;
+		write->timestamp_msw = msw_ts;
+		write->mem_map_handle =
+		    ac->port[SNDRV_PCM_STREAM_PLAYBACK].mem_map_handle;
 
-	write->flags = wflags;
+		write->flags = wflags;
 
-	port->dsp_buf++;
+		port->dsp_buf++;
 
-	if (port->dsp_buf >= port->num_periods)
-		port->dsp_buf = 0;
+		if (port->dsp_buf >= port->num_periods)
+			port->dsp_buf = 0;
+	}
 
-	spin_unlock_irqrestore(&ac->lock, flags);
 	rc = apr_send_pkt(ac->adev, pkt);
 	if (rc == pkt_size)
 		rc = 0;
-- 
2.43.0


