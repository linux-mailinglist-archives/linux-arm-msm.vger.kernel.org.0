Return-Path: <linux-arm-msm+bounces-110953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nlllAr8WIGqavgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:57:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77533637407
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:57:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dOeD0Csh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110953-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110953-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B18743128691
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577FB45BD57;
	Wed,  3 Jun 2026 11:50:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C96477E37
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487444; cv=none; b=lQCoO70YdeQi/IvkruEejDDYRivfKCL6xPi0qDy9Mx3tNUQaZPqPTlPAANyeMQfOsQN6GCc0nsbkyoWSeCa6JFuW+3jpbm3AciyMEnIpXG65jyUW0PepyVWFPlHvyHLn9p8jNmc65jEmpBGeJWOjLlNgEh4ZyX+kfWv1GHIWV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487444; c=relaxed/simple;
	bh=mW4eQXqnfxaB0c/JC7r7EXwbppQQR/dLCcxN+G/JGWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/V+448MforbmgR6xqQscu3lFiL/Rj7PbyYKG8IvrbpdTOGQPH4RyQcmJfP/rAE/c67IVoM+vGE2WHEhaGC3+P0mG+F319NPvhoXjU0DVbtLBA6dPndc+Rp/JQXJeHNijS4bCIJvLbw85ND0bm5+tPcjV9D4O6hxv1M1nDGfO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOeD0Csh; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf55c39e16so2310395ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487442; x=1781092242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/cb7/Oh3wrVW6lTEgQSTGPGYUEEQIjXPznLNOjAVMo=;
        b=dOeD0Csh2J9hCpo1AaEEl1z+VNNAE/NsFnLdeIyzE78YecNEmFb8cAdZFGAhzJOLIe
         pwy93amfXkQO1ilD+mUH4EZfev+CYpfcU9ghQ1RFgFH2iDO6ilBUWt7ypt6qtFH8CG56
         +DL1sFCze48VV8uv1hyGALHt4A5hXzGRKg79Ho2Ysv5/FWB0cBiiob4baZOAlJZhMb4K
         I7KeofRucMuV/HIGtak77/KJ7OG5fKn1nmjMHY0/G7ofwiSKU3OY3NtCSjd+srx/jTLo
         dH4Cc8LccLrAxSphyy8bALrk7vgoruAmJVppb8m0jtBle1UsCGoXFVN6O1+zzw752QdA
         fZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487442; x=1781092242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/cb7/Oh3wrVW6lTEgQSTGPGYUEEQIjXPznLNOjAVMo=;
        b=ObD9vENeeJTxbFQOIusi0VtDU5Dthw0SRy8ClUAQAaCgqt6/St8vfXU1o5B//xw7IB
         l3LFlTwPwSgk+qduj/8t+2RfG2/ZTwFXdMnqsYDRuMmGGL5OK0bQKZS56lyKxQbELFi8
         jCTV6GOwOGJYg906BR0KISeI5FidikT/r6tLq4zEM2JtZPqysJAOqjlJjNQSshNE/h0m
         AWQqFE+KsgAt02yCTew9HJ8R7YErU5rQn8hFaGIum3CRJ8hywIknqeAm53T5HUe0INv0
         ZQkWsFY7bQ4B7sy5VJFr6ASWLnc4iKUOhQ8seAucmyo+q8x2Ebg+KwUCJKpM42Ij/Ex1
         aEGw==
X-Forwarded-Encrypted: i=1; AFNElJ8Px2qyjdtCsYsytqzfUJ5759KG7gG0H61APepXkAbkRwWQir9UqyUd6bJTGD2U4bub1mgnFkoBbdqSrgRA@vger.kernel.org
X-Gm-Message-State: AOJu0YxThoyHhieN+QZxk/tfVA7Tbnfkzu8juRxJg0+APoi5Pd+zeBFJ
	HwQAphLcrbpkMHkQLlLNnABJ2bx58VavOy6HAxMFQJbGJbbqqzBkey1w
X-Gm-Gg: Acq92OF1V0khhUrMqtq4Wqa3wpyPWegN2aMQ3Sj6gCCvTuH7zB0GJMlF0KxMKm+O+Uy
	X8Jnfjk4+qI8uQZbo/8cfEF2xmfCTeWAwFNT7Q3FWnCU7IX12G/b15kvtQxkxSYH/aYmwBSdyAq
	n8i1B8C+QNuP6K7Mmw3atOapRJow+mV/OHQQBXg7q4wIJ1BEIz1uZYzZ3Oxu5NFnJjTl0l7Cmkd
	1lPpIBCTgiV517Kv+VZNf7IbVeqaCXaMAfmZh+wcua39JVm4gW11b9BKIxX7M2PJzcfFK2ByEZD
	QiERomoHBLfnKKwpUI6JmQNqN26/JclWMQHm1pfubMMhY2uV9mx/WueJoByGvG+wI5iTvVqe9B5
	0tvDWIp77D2/mBhjXZSJVWS9f9XINlXqIcd1lWs6xCtX6mC1urRpaECAkrkmkdPBlkJCtkT8oRe
	fHtsPw4pLenGQuc9RIVW7Ik6NEgRxv/svdXqbzQK6PhpsDcp9Ngl56T+cE2HKgGU5gFQKq
X-Received: by 2002:a17:902:bcc3:b0:2c0:bd40:17e5 with SMTP id d9443c01a7336-2c164b2c190mr16899325ad.19.1780487442382;
        Wed, 03 Jun 2026 04:50:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:41 -0700 (PDT)
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
Subject: [PATCH 8/9] ASoC: qdsp6: q6usb: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:48 +0700
Message-ID: <20260603114949.149595-9-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110953-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77533637407

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6usb.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 6381b289c55c..ee6de9635342 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -61,31 +61,28 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_usb_device *sdev;
 	int ret = -EINVAL;
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	/* No active chip index */
 	if (list_empty(&data->devices))
-		goto out;
+		return ret;
 
 	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
 
 	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
 	if (IS_ERR(q6usb_afe)) {
 		ret = PTR_ERR(q6usb_afe);
-		goto out;
+		return ret;
 	}
 
 	/* Notify audio DSP about the devices being offloaded */
 	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
 					  sdev->ppcm_idx[sdev->num_playback - 1]);
 
-out:
-	mutex_unlock(&data->mutex);
-
 	return ret;
 }
 
@@ -203,15 +200,14 @@ static int q6usb_update_offload_route(struct snd_soc_component *component, int c
 {
 	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
 	struct snd_soc_usb_device *sdev;
-	int ret = 0;
 	int idx = -1;
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 
 	if (list_empty(&data->devices) ||
 	    direction == SNDRV_PCM_STREAM_CAPTURE) {
-		ret = -ENODEV;
-		goto out;
+		route[0] = idx;
+		return -ENODEV;
 	}
 
 	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
@@ -227,11 +223,9 @@ static int q6usb_update_offload_route(struct snd_soc_component *component, int c
 				q6usb_get_pcm_id(component);
 	}
 
-out:
 	route[0] = idx;
-	mutex_unlock(&data->mutex);
 
-	return ret;
+	return 0;
 }
 
 static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
@@ -244,7 +238,7 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	data = dev_get_drvdata(usb->component->dev);
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 	if (connected) {
 		if (data->hs_jack)
 			snd_jack_report(data->hs_jack->jack, SND_JACK_USB);
@@ -257,7 +251,6 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 		if (data->hs_jack)
 			snd_jack_report(data->hs_jack->jack, 0);
 	}
-	mutex_unlock(&data->mutex);
 
 	return 0;
 }
@@ -284,12 +277,11 @@ static int q6usb_component_set_jack(struct snd_soc_component *component,
 {
 	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
 
-	mutex_lock(&data->mutex);
+	guard(mutex)(&data->mutex);
 	if (jack)
 		q6usb_component_enable_jack(data, jack);
 	else
 		q6usb_component_disable_jack(data);
-	mutex_unlock(&data->mutex);
 
 	return 0;
 }
-- 
2.43.0


