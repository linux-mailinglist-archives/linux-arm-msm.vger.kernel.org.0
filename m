Return-Path: <linux-arm-msm+bounces-119108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AVOLC9POVmqoBQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:05:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F67598F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:05:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b="3/Skb14K";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119108-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119108-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2A043094F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CC88003D;
	Wed, 15 Jul 2026 00:05:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BE219E8;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073933; cv=none; b=hm3UyLZcsK4c4ajnoSDDnzQS0oAqd/glmqh3Tci+sTyUBVkQG8s7NFZOL/fzmS2w3LlK7p0ZVyXYqdWkM64cp51n6u493TJVnZw5gtj15QFJ+4079SfU+iWR9EmWREQ9In66Nr3gBBg6Fi0oKgqwObWHm1el/7eCfZoURpfIk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073933; c=relaxed/simple;
	bh=kcEZMM9dwwv/+5LXAHMwexp/Dz8ByaXsOxuHEAExciw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YzJqFhyS7Hj2QD7ovd4D/Cm8apnYQPAfuEPw9oeH89CwJSfBv3TqX/+uftcy4GppKv+SlmidEmc+Sl8o3Q6fdn3GL/ydfgOmHph0sHxgCFpjBgQ5LbU2X/RDwiPSvdX/MoCB2TAB4DMwupUTQSsgYar6d1Hvebp1SuXePPzSmuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3/Skb14K; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QfGvfC9/hXJmNDdXlodJG/Zikxj+nGFIjS0nGqw5KLc=; b=3/Skb14KpqKl8XgD2qSmCo5Omf
	kUwlHnGIkgJyvOZEx7MA+s2OXp6Px+wU8qKdoE9DSGSIX0JVf+fdPt/MNtQp7BY2/ZFs9PjW5+E1A
	Du7qQYNmqY6dsQ7mmh0mDWlXqBMNqMyHFVxm2cKwQa3YQYiPUfVPhEGtNGPKVVSJFcQFlDO6e18fP
	qG2B/hGW4XyUUoxHdRLXXlYDmr0jQ+r4bdESGIIMmC+A6F+ZLbdKYo53wVtIC2GiS3JSWmmBeuIO+
	iw9YZ+bcFAwNx5CPgvH8TeJWK0LhPN4aQRmOQCbPrgymVUNHap7lRae/3m5V3LiaITJKY1iXspsJ3
	ZI0V7i2g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn7x-0000000DTcu-3IAY;
	Wed, 15 Jul 2026 00:05:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 03/14 v2] ASoC: fsl_asrc: avoid kernel-doc warnings
Date: Tue, 14 Jul 2026 17:05:14 -0700
Message-ID: <20260715000525.739874-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715000525.739874-1-rdunlap@infradead.org>
References: <20260715000525.739874-1-rdunlap@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119108-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-sound@vger.kernel.org,m:rdunlap@infradead.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:ckeepax@opensource.cirrus.com,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,kernel.org,perex.cz,suse.com,lists.ozlabs.org,opensource.cirrus.com,linux.intel.com,linux.dev,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A12F67598F0

Use the struct keyword to describe structs in kernel-doc format. This
prevents kernel-doc warnings:

Warning: ../sound/soc/fsl/fsl_asrc.h:452 cannot understand function prototype: 'struct fsl_asrc_soc_data'
Warning: ../sound/soc/fsl/fsl_asrc.h:463 cannot understand function prototype: 'struct fsl_asrc_pair_priv'
Warning: ../sound/soc/fsl/fsl_asrc.h:475 cannot understand function prototype: 'struct fsl_asrc_priv'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/fsl_asrc.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/fsl_asrc.h
+++ linext-2026-0710/sound/soc/fsl/fsl_asrc.h
@@ -444,7 +444,7 @@ struct dma_block {
 };
 
 /**
- * fsl_asrc_soc_data: soc specific data
+ * struct fsl_asrc_soc_data - soc specific data
  *
  * @use_edma: using edma as dma device or not
  * @channel_bits: width of ASRCNCR register for each pair
@@ -457,7 +457,7 @@ struct fsl_asrc_soc_data {
 };
 
 /**
- * fsl_asrc_pair_priv: ASRC Pair private data
+ * struct fsl_asrc_pair_priv - ASRC Pair private data
  *
  * @config: configuration profile
  */
@@ -466,7 +466,7 @@ struct fsl_asrc_pair_priv {
 };
 
 /**
- * fsl_asrc_priv: ASRC private data
+ * struct fsl_asrc_priv - ASRC private data
  *
  * @asrck_clk: clock sources to driver ASRC internal logic
  * @soc: soc specific data

