Return-Path: <linux-arm-msm+bounces-119112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dy4hCufOVmqzBQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:05:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8502275990E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:05:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=LtPyVRC7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119112-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119112-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E83F93085E85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3261917CD;
	Wed, 15 Jul 2026 00:05:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077B249EB;
	Wed, 15 Jul 2026 00:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073934; cv=none; b=Za4MQWNl+p0Q6aQ3jjNcQeNBf2Mbi67xtu9kJYXyJP1mMj56Fah1uijHSNmgNybcL10+mmykTQpMPt446ZBlMvwwLY+gMQWFkPxOPR/anh+LwFhk7Au6lg5c97o6WNoypHYQ6/49wMeU0I+8qIUF6OyWPA4V63FYR04S7UMVelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073934; c=relaxed/simple;
	bh=R+zXM81A5iireYMWuE2ZqCa1la2+O9CZ4VLgvEAAL1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYBp6d58+ETJTeU4dsaH6kNFlKVX8uPgyhSd1fhb4Qxq5Y3j2e05El2EC31TivU1FGt82HQy9HJY2etSGwKOlnvr9cueV8RE089LBN4AiLQUNqm/O3++GlntAu5qaha1OxqyxLfusJY2Hkc293lv/QVY/hvRUf1GMDhM3WggxbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LtPyVRC7; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Cja07B7b6DLmEF/XlIxcOw/U7wRYtezoqU3BZOcxKts=; b=LtPyVRC7z5Fv1G5lhVKLjqm4e8
	MVr4ZI54qkkNx5HdipAEdhwX2uZfcQXpkFyRNWDJRSM0e0hufIbxD+rLA3isL3EYb22rUxyWngj6v
	AlVc/vz1b4bKWmLJ3e+h6xOinoCFzIWW7tqzc+w2k3u4jeHRzuEdBTo4MtMN5UjVSktSOqTGw5uuD
	Fg27N7ZottEv3SS0cbb51/Q2VrrLeU71Z9cT4femzmZyM74o8QTxhkF08i0DcoMJuCaKqVhKaSJAA
	j8SfLBRG3HvscvqwHpH2oM16+Y/ZRjbZsyUhQ0qwvHpaq+z2qSCDyO693Ys2P18cX3DYz5IcLuPTA
	qE5TW4HA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn80-0000000DTcu-365Y;
	Wed, 15 Jul 2026 00:05:32 +0000
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
Subject: [PATCH 08/14 v2] ASoC: fsl: p1022_ds: repair kernel-doc short descriptions
Date: Tue, 14 Jul 2026 17:05:19 -0700
Message-ID: <20260715000525.739874-9-rdunlap@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119112-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim,ozlabs.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8502275990E

The kernel-doc short description is assumed to be a function unless
indicated by a keyword. Add the missing keyword (struct, var) to avoid
kernel-doc warnings:

Warning: sound/soc/fsl/p1022_ds.c:62 cannot understand function prototype: 'struct machine_data'
Warning: sound/soc/fsl/p1022_ds.c:182 cannot understand function prototype: 'const struct snd_soc_ops p1022_ds_ops ='

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

 sound/soc/fsl/p1022_ds.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/p1022_ds.c
+++ linext-2026-0710/sound/soc/fsl/p1022_ds.c
@@ -55,7 +55,7 @@ static inline void guts_set_dmuxcr(struc
 static phys_addr_t guts_phys;
 
 /**
- * machine_data: machine-specific ASoC device data
+ * struct machine_data - machine-specific ASoC device data
  *
  * This structure contains data for a single sound platform device on an
  * P1022 DS.  Some of the data is taken from the device tree.
@@ -178,7 +178,7 @@ static int p1022_ds_machine_remove(struc
 }
 
 /**
- * p1022_ds_ops: ASoC machine driver operations
+ * var p1022_ds_ops - ASoC machine driver operations
  */
 static const struct snd_soc_ops p1022_ds_ops = {
 	.startup = p1022_ds_startup,

