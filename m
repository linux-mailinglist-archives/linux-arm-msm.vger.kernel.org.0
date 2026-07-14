Return-Path: <linux-arm-msm+bounces-118886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XDOWCr+UVWqjqQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B53BB750270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=SfWUes0N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118886-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118886-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A4943043FF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CD6370D43;
	Tue, 14 Jul 2026 01:44:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1573655C5;
	Tue, 14 Jul 2026 01:44:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993492; cv=none; b=hVZIJqCK58mq6950dWgDSRARphAeyj40qgPmJVW18C/O+YHyQMoaMClr2Nexi9U2I7dT1Bxn1DRvPr/GlgJor9IXPE5aTuD+TS2WcfV5XG8kRJol+umHvYxGb7gc3S51HjxFNkvk3ZmhdyzbmUTz17GKMZfKAmIt0igrQ7P3yRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993492; c=relaxed/simple;
	bh=nF3rCVtY+OL+cdV3goVWBWxrvEkZhz8Rqy+0ysgbjL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FK91Nwhao6ZRTMFyzHMElWV9cvKaXNI84oI5hwgW6oTtthVSp9o3u/PLGR/OIdzZl5l53BWny9iQNJ/MQcdQoXJsS1rez2WSsRgmch5gtSXBjZMVmFXlg2bL0n4WaTxus8KoUngxBFfjiZNG7l3aYxhBLjoyQpVHQ8oQf6Apg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SfWUes0N; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+vBVSAe41gLF0/LGe0VpsCrXwVXYW7rQ7Wb7b1sitdE=; b=SfWUes0Nc11TcnAEjLJ0+AVRtx
	7ubgOaeU6TwFcloAiOllAJO+VBV6QqTl7DOlxXbdB45DOfO567bZrAOX85c0ifY1vP52RdlTXNvWN
	yd0ex3V+Fyv9sl3lWcTNziorPecUZYB5OvrY64wss5VJcN0EOrHraB0QZqcV8gT18bxvzLPcFUQmK
	dWzi0laly4DiKm3OhZmjkRUEJ8V8e3fuKCqxHayAgHgttzpassTMyUBAkjRkkckf600I8ORzQb+wG
	y5EOcTQXNoRPB/NMWl2wRBw7xe/Yan4JHPaaNRDFnOAFKVtpZvVJHq0wck2hfBfzvz/55LRWZ70+D
	9EiuaXKw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCY-0000000AgsR-0Pgv;
	Tue, 14 Jul 2026 01:44:50 +0000
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
Subject: [PATCH 05/14] ASoC: fsl_easrc: use struct keyword on structs
Date: Mon, 13 Jul 2026 18:44:36 -0700
Message-ID: <20260714014445.569992-6-rdunlap@infradead.org>
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
	TAGGED_FROM(0.00)[bounces-118886-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-sound@vger.kernel.org,m:rdunlap@infradead.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:ckeepax@opensource.cirrus.com,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ozlabs.org:email,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B53BB750270

Use the documented format for kernel-doc of structs to prevent
kernel-doc warnings:

Warning: ../sound/soc/fsl/fsl_easrc.h:606 cannot understand function prototype: 'struct fsl_easrc_ctx_priv'
Warning: ../sound/soc/fsl/fsl_easrc.h:641 cannot understand function prototype: 'struct fsl_easrc_priv'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/fsl_easrc.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/fsl_easrc.h
+++ linext-2026-0710/sound/soc/fsl/fsl_easrc.h
@@ -584,7 +584,7 @@ struct fsl_easrc_slot {
 };
 
 /**
- * fsl_easrc_ctx_priv: EASRC context private data
+ * struct fsl_easrc_ctx_priv - EASRC context private data
  *
  * @in_params: input parameter
  * @out_params:  output parameter
@@ -625,7 +625,7 @@ struct fsl_easrc_ctx_priv {
 };
 
 /**
- * fsl_easrc_priv: EASRC private data
+ * struct fsl_easrc_priv - EASRC private data
  *
  * @slot: slot setting
  * @firmware_hdr:  the header of firmware

