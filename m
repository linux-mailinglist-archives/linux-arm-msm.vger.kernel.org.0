Return-Path: <linux-arm-msm+bounces-110949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DrNkF9AXIGrMvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E7637484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:02:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lcui2KWM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110949-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110949-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 588EA30C3019
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D7546AF3F;
	Wed,  3 Jun 2026 11:50:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB646AF37
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487429; cv=none; b=b+Cih6VuV/CL7uCr14JcupXjhRLivctHZ87Lc80HEWMsrMWOnbU75ee2wRppmerZ1PMpQfvCN8jIVCCsnanevvRuY5Q5vzxKQ0HRicTfYEKc/jeejXjqxyWBOAQL0ZP7CXqlWRzaf028Onf/h18WMOS+FS0GJElbLYQQzBZXNZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487429; c=relaxed/simple;
	bh=he35cP/gvA5xSZMWrFOaF04BmRJcyzkN8tKIS3U8k/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLH62+bxppZMjgY5cJnfiILBegH4Ri/CAU+dOwJkgYXxg1lKYrzqAivgCCiW7uHHc3QKjfxSDVCsAog+/l7rtFmwgmLdiobz1e81OvtR5Sp6YrKH14wy/pk8iHZ6EL6L6Mr06GiqpFYmcK6fAsk6WWQ1TP0/k4vamZiquM5ZKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcui2KWM; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf22d29dabso40630875ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487428; x=1781092228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cxTSMgNqZwdOR4PrDlBQXp8DTW1iK+QB/aZTwgHd9A=;
        b=lcui2KWM+W7k3FGtUD2BlL15BckvNeHwmrakJQ9XApwJx+Bew0FSNpyLkU6FArwJlQ
         GQ6E98UyCyzRv9+dDIDY9PKZZewc/yqiFvOHlk3+5Nm5GlxCXzzL7EYU75vsRu1ceTFM
         oceD8kZgutOUncKSzL1BAfVTCFVLfzvjrg4RMitJeC7G+tMefI/MFV4tpLvuZ2iWmAhw
         WxZxz+TG3+50fl7dxdZcXrV+4MWZ2vMU89mat4WKyWphZkKdLRIn9rrlZIsaJadDPsTz
         opnpXh/YMACuSb3610PI9a0ok48wr/RO0K2Vtke0auk2GOLPY7VYFztJex97BH8K6082
         O1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487428; x=1781092228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7cxTSMgNqZwdOR4PrDlBQXp8DTW1iK+QB/aZTwgHd9A=;
        b=crqUSroydNY9eRH/auNprW+nF0JyS6VRRL2R16ETTnV23Bttgzf9c7mFY4ok8FEZrr
         NwGmH1Cpc0aT1hykl2tIL4dm/jyB0Nn6qzdjitaAW2GWLTdMDr6pfpmvLvx+owjIFhw+
         Gjif4ZZTc6qhisCZHWcQq2TpIw1sK4pnL3ALoHsd6iQ6wnvTMX4Qx1yObzQcEbH5C1Wi
         eJ6jx+JHh5GJ5f3LY/Earox8L3yg/ia0o5CVOUEu7NidKM6dCgTQTFdQ/uWg7KOjTfEP
         TKqCketRLiWLa10FyLMbfhL80xScYIesyMW5jUc1nZHlRe0+Ye1S4/eoVeljJUK+UPOw
         kFug==
X-Forwarded-Encrypted: i=1; AFNElJ+HFeNSwDmaLnxlA2kjUSgeGyhOZO3lz0Y8u3T20UnxfYvc3qokXMV0hOqrYT+Mtud28CXgsfqQG2/Nn1g8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzskj0+Y9wp6c+k7/lvKAjtWLinMStCyHhoQ3jDqZWkjb9suMz8
	Du38RPRUPoy+6YPYC1efPBX5D2rIb+2taArzH6ceg27U/8K6FL+zFPiO
X-Gm-Gg: Acq92OFW4Y3ATlPrZX6DpFXeK0TrDAtGo+qtPovJowDEAUpswx6P53ZXzDxl9AIMshF
	R5v0O/z75guB4aytWQqloMReoAiyEiHUa0gmvBjvqo9/9FCYDP1wA87iAIA8TYcieGCYWpgrPP7
	vFrXTyagx8cwwYyh9xZ+6pDwh7O9OJ6IhKA2T6z0Trp5Az1lYJ1DWhSAeyRtTtqe+HDIGNXzV+M
	us7aJ/gkgd7bQpejh/8qKtnlCCmMpbXidRxDXpjUN2SvrebUwv8LvxQcYMeBuY1P/5ILnkonK00
	e6VvC8BzL6Kkzu/G4oj1XTZtiIfS1zB9bl50QPfg9s9YjZ6JZ5kkWAjBkkgCLi8hEp/4YOYSjz+
	nGeBdGq80aWLu07i2POgf9RoseVN61klTQ9pRUzp7eaqPVEInQmxkd6wtjSPQ4eQ2xRVUylsVdj
	tSXHGUjc2fP38wad0e7yBF/SvbNLWINPJr3yMpjADZipcFZ3ODl067Jy98y6Pe+EyJBq9R
X-Received: by 2002:a17:902:e14c:b0:2b9:ec37:2977 with SMTP id d9443c01a7336-2c1644dbfd2mr18979195ad.38.1780487427507;
        Wed, 03 Jun 2026 04:50:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:27 -0700 (PDT)
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
Subject: [PATCH 4/9] ASoC: qcom: q6apm: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:44 +0700
Message-ID: <20260603114949.149595-5-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110949-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF2E7637484

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/q6apm.c | 107 ++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 59 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2ab378fb5032..17c44587b084 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -44,9 +44,8 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
 	struct audioreach_graph *graph;
 	int id;
 
-	mutex_lock(&apm->lock);
-	graph = idr_find(&apm->graph_idr, graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		graph = idr_find(&apm->graph_idr, graph_id);
 
 	if (graph) {
 		kref_get(&graph->refcount);
@@ -74,16 +73,15 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
 		return ERR_CAST(err);
 	}
 
-	mutex_lock(&apm->lock);
-	id = idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL);
-	if (id < 0) {
-		dev_err(apm->dev, "Unable to allocate graph id (%d)\n", graph_id);
-		kfree(graph->graph);
-		kfree(graph);
-		mutex_unlock(&apm->lock);
-		return ERR_PTR(id);
+	scoped_guard(mutex, &apm->lock) {
+		id = idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL);
+		if (id < 0) {
+			dev_err(apm->dev, "Unable to allocate graph id (%d)\n", graph_id);
+			kfree(graph->graph);
+			kfree(graph);
+			return ERR_PTR(id);
+		}
 	}
-	mutex_unlock(&apm->lock);
 
 	kref_init(&graph->refcount);
 
@@ -131,9 +129,8 @@ static void q6apm_put_audioreach_graph(struct kref *ref)
 
 	audioreach_graph_mgmt_cmd(graph, APM_CMD_GRAPH_CLOSE);
 
-	mutex_lock(&apm->lock);
-	graph = idr_remove(&apm->graph_idr, graph->id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		graph = idr_remove(&apm->graph_idr, graph->id);
 
 	kfree(graph->graph);
 	kfree(graph);
@@ -254,20 +251,16 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 	else
 		data = &graph->tx_data;
 
-	mutex_lock(&graph->lock);
+	guard(mutex)(&graph->lock);
 
 	data->dsp_buf = 0;
 
-	if (data->buf) {
-		mutex_unlock(&graph->lock);
+	if (data->buf)
 		return 0;
-	}
 
 	buf = kzalloc_objs(struct audio_buffer, periods);
-	if (!buf) {
-		mutex_unlock(&graph->lock);
+	if (!buf)
 		return -ENOMEM;
-	}
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		data = &graph->rx_data;
@@ -287,8 +280,6 @@ int q6apm_alloc_fragments(struct q6apm_graph *graph, unsigned int dir, phys_addr
 	}
 	data->num_periods = periods;
 
-	mutex_unlock(&graph->lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(q6apm_alloc_fragments);
@@ -457,23 +448,22 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 
 	write_buffer = (void *)pkt + GPR_HDR_SIZE;
 
-	mutex_lock(&graph->lock);
-	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
-
-	write_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
-	write_buffer->buf_addr_msw = upper_32_bits(ab->phys);
-	write_buffer->buf_size = len;
-	write_buffer->timestamp_lsw = lsw_ts;
-	write_buffer->timestamp_msw = msw_ts;
-	write_buffer->mem_map_handle = graph->info->mem_map_handle;
-	write_buffer->flags = wflags;
+	scoped_guard(mutex, &graph->lock) {
+		ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
 
-	graph->rx_data.dsp_buf++;
+		write_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
+		write_buffer->buf_addr_msw = upper_32_bits(ab->phys);
+		write_buffer->buf_size = len;
+		write_buffer->timestamp_lsw = lsw_ts;
+		write_buffer->timestamp_msw = msw_ts;
+		write_buffer->mem_map_handle = graph->info->mem_map_handle;
+		write_buffer->flags = wflags;
 
-	if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
-		graph->rx_data.dsp_buf = 0;
+		graph->rx_data.dsp_buf++;
 
-	mutex_unlock(&graph->lock);
+		if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
+			graph->rx_data.dsp_buf = 0;
+	}
 
 	return gpr_send_port_pkt(graph->port, pkt);
 }
@@ -493,21 +483,20 @@ int q6apm_read(struct q6apm_graph *graph)
 
 	read_buffer = (void *)pkt + GPR_HDR_SIZE;
 
-	mutex_lock(&graph->lock);
-	port = &graph->tx_data;
-	ab = &port->buf[port->dsp_buf];
-
-	read_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
-	read_buffer->buf_addr_msw = upper_32_bits(ab->phys);
-	read_buffer->mem_map_handle = graph->info->mem_map_handle;
-	read_buffer->buf_size = ab->size;
+	scoped_guard(mutex, &graph->lock) {
+		port = &graph->tx_data;
+		ab = &port->buf[port->dsp_buf];
 
-	port->dsp_buf++;
+		read_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
+		read_buffer->buf_addr_msw = upper_32_bits(ab->phys);
+		read_buffer->mem_map_handle = graph->info->mem_map_handle;
+		read_buffer->buf_size = ab->size;
 
-	if (port->dsp_buf >= port->num_periods)
-		port->dsp_buf = 0;
+		port->dsp_buf++;
 
-	mutex_unlock(&graph->lock);
+		if (port->dsp_buf >= port->num_periods)
+			port->dsp_buf = 0;
+	}
 
 	return gpr_send_port_pkt(graph->port, pkt);
 }
@@ -545,12 +534,12 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		if (!graph->ar_graph)
 			break;
 		client_event = APM_CLIENT_EVENT_DATA_WRITE_DONE;
-		mutex_lock(&graph->lock);
-		token = hdr->token & APM_WRITE_TOKEN_MASK;
+		scoped_guard(mutex, &graph->lock) {
+			token = hdr->token & APM_WRITE_TOKEN_MASK;
 
-		done = data->payload;
-		phys = graph->rx_data.buf[token].phys;
-		mutex_unlock(&graph->lock);
+			done = data->payload;
+			phys = graph->rx_data.buf[token].phys;
+		}
 		/* token numbering starts at 0 */
 		atomic_set(&graph->rx_data.hw_ptr, token + 1);
 		if (lower_32_bits(phys) == done->buf_addr_lsw &&
@@ -569,10 +558,10 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 		if (!graph->ar_graph)
 			break;
 		client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
-		mutex_lock(&graph->lock);
-		rd_done = data->payload;
-		phys = graph->tx_data.buf[hdr->token].phys;
-		mutex_unlock(&graph->lock);
+		scoped_guard(mutex, &graph->lock) {
+			rd_done = data->payload;
+			phys = graph->tx_data.buf[hdr->token].phys;
+		}
 		/* token numbering starts at 0 */
 		atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);
 
-- 
2.43.0


