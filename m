Return-Path: <linux-arm-msm+bounces-118894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GTtCD9mUVWqyqQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:46:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F37502A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:46:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=goRfGHv+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118894-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118894-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25A7930597BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDBA36F8E9;
	Tue, 14 Jul 2026 01:44:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3933036EAAB;
	Tue, 14 Jul 2026 01:44:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993496; cv=none; b=gLmWFPt/quH+Uwm5UJr5t1bJ11vzgDtWkqOHAfr1OSsNCmUyFBPhM6LcLd24BR/5OzooeEw2nLAHzNVJUq/oJSDeskXKJwfDRqwxS5CD/HQbk8+Embh3a+bJ4D3I+pBSXGk0eBvUAj0Gy6m+8uohR28w963QeQjywLFutaW/zLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993496; c=relaxed/simple;
	bh=vQgGAdjyWGBGa/vbmK7DRTIw+m+Y0mHEBkmVGwawDcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJ2A5C9O39rC5ac333uGaBPLIcpDak0UxGFTFTm+aBbnBdF3+Fhxa8oq5PZcX4pNs5DGJAfP3bFYgOv1Q0nHlHfQoVdmKGJ1+48GvdgFhj9vAngrlfXyLNSDfRRaJsQvX5VUGbUmxUbM7SKqVh3TYlXUMM4CEWSSbhg4jX/QbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=goRfGHv+; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=AP+EjHl4fkplBLEzqE85avbK3Q0+8lYsmdrsTbCkoWk=; b=goRfGHv+vWeowQz0+5fZt8Ltle
	GKIXWjiWFAKUKU9RH1zyyNe3b5KtXU8BBqnU42TgoVjzH59opvV3ShBT6caOiPlG6nOPXSzhszvYj
	hGdpo7+AZkSsYXrvIgRGXyuUN9gD1+OIu3HjTQPnnkzOkDFmsL7Q/ucz70QCmrYPPUQIBRn8Z0TEo
	DyIyUUz6k43skiuHqAiX2SSZbFmqx//1GcAVzyihOTO1CyLCZUAZWMv9MmAfgwg1dVYvk38fHRtuG
	5Lmr7YcwYE1BjZ1AUFMViwTfvdmYgwOuu2lca/4r/3783MAl0r02FARn4i5w66VpVcdhmFncvsdeh
	L/LI6gBQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCc-0000000AgsR-3Arg;
	Tue, 14 Jul 2026 01:44:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	patches@opensource.cirrus.com,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 13/14] ASoC: qcom: audioreach: use C-style "/*" comment
Date: Mon, 13 Jul 2026 18:44:44 -0700
Message-ID: <20260714014445.569992-14-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714014445.569992-1-rdunlap@infradead.org>
References: <20260714014445.569992-1-rdunlap@infradead.org>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118894-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:linux-sound@vger.kernel.org,m:rdunlap@infradead.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:ckeepax@opensource.cirrus.com,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[infradead.org,perex.cz,suse.com,gmail.com,lists.ozlabs.org,opensource.cirrus.com,linux.intel.com,linux.dev,kernel.org,vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA2F37502A1

Modify the "/**" to use "/*" instead since this is not a kernel-doc
comment. This avoids all kernel-doc warnings in this header file:

Warning: include/uapi/sound/snd_ar_tokens.h:61 Cannot find identifier on line:
 * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:           Sub Graph Instance Id
Warning: ../include/uapi/sound/snd_ar_tokens.h:62 Cannot find identifier on line: *
Warning: ../include/uapi/sound/snd_ar_tokens.h:63 Cannot find identifier on line:
 * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:             Performance mode of subgraph
Warning: include/uapi/sound/snd_ar_tokens.h:64 This comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org

 include/uapi/sound/snd_ar_tokens.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linext-2026-0710.orig/include/uapi/sound/snd_ar_tokens.h
+++ linext-2026-0710/include/uapi/sound/snd_ar_tokens.h
@@ -58,7 +58,7 @@ enum ar_event_types {
 #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
 #define SND_SOC_AR_TPLG_VOL_CTL			257
 
-/**
+/*
  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
  *
  * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:		Performance mode of subgraph

