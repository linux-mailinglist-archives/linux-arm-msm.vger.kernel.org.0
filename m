Return-Path: <linux-arm-msm+bounces-118884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4hYgALaUVWqcqQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1D975025B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b="i/oKD2eo";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118884-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118884-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4F5F3034E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25F936F42A;
	Tue, 14 Jul 2026 01:44:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68083368958;
	Tue, 14 Jul 2026 01:44:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993491; cv=none; b=MC/Fuy1Heef0WC72yvbjOToWBjT7obO31GKtuXZ0VwY8QebEK6A+Cu0a/Zz7HLe7o1MARuu3jItrVSKcMY1wH9+/A7njrXDNSbkSI+YalWNGzuM7MMCBXk3y59dIiVmWlWxWn659fKWZoE+cpJC3h1IPx/P1KfBQi30yicmUuS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993491; c=relaxed/simple;
	bh=fRAt+Xt8yytECXFT75hKloSifnKXAFZDtUzW0DAtgaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wu8K7fUJMJ0MyuJq5UDiP8+BJeEB90X8dOcisQmyvFZBvLy9efm/5IifL/5s4k/NQGWJ5gOVmMgmqlZrEJFXMky8KqNar8p9ThOrznO4lDAfVu8oI18rsgs/7cWXkMwZa+QCR6XXTmVPdXB8jjm07P5kabgeFanddC1wz3/uDZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i/oKD2eo; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=C2OhovbADJqYH9SjFWe+bdXuuSMpvFMRbOlHjiIHQYE=; b=i/oKD2eokJkBPLHZYeSRVyfMCA
	C1gElCK6m9h0+HqyzwNzCF9xssaoYxSWHgXjhOq2UKaPUgefw8+CIC+vZxovYrcZ73wKb6ZNqgUKx
	ZWec8VnQ3mjTj3AznUjA1n64c4h9hl4ZsxjoyvUXU9IAnE1P8F06V8YvQAxsSNCm1JeNo5kjSWkNk
	H0MbDKY4EqsS1AnToyotbquHKUhFMTilM2rE10/em9CVXh1FG0sHUeKdVwLpksJxboJVRzdGLKrlb
	iZSB9ux538MDXL3OgH69BXa8cmyA89r4lbO8aNsbwjvw9hJdC59sr6CU/SdVJhyypXcMLyAgVTnh7
	3jXknlPg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCV-0000000AgsR-3SPs;
	Tue, 14 Jul 2026 01:44:47 +0000
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
Subject: [PATCH 01/14] ASoC: codecs: NeoFidelity: repair the kernel-doc format
Date: Mon, 13 Jul 2026 18:44:32 -0700
Message-ID: <20260714014445.569992-2-rdunlap@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118884-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A1D975025B

Don't use "/**" for a non-kernel-doc comment.
Use kernel-doc notation to document the parameters and return value of
ntpfw_load().

Fixes these warnings:
Warning: ../sound/soc/codecs/ntpfw.h:2 This comment starts with '/**', but isn't a kernel-doc comment.
 * ntpfw.h - Firmware helper functions for Neofidelity codecs
Warning: sound/soc/codecs/ntpfw.h:20 function parameter 'i2c' not described in 'ntpfw_load'
Warning: sound/soc/codecs/ntpfw.h:20 function parameter 'name' not described in 'ntpfw_load'
Warning: sound/soc/codecs/ntpfw.h:20 function parameter 'magic' not described in 'ntpfw_load'
Warning: sound/soc/codecs/ntpfw.h:20 No description found for return value of 'ntpfw_load'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>

 sound/soc/codecs/ntpfw.h |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- linext-2026-0710.orig/sound/soc/codecs/ntpfw.h
+++ linext-2026-0710/sound/soc/codecs/ntpfw.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
+/*
  * ntpfw.h - Firmware helper functions for Neofidelity codecs
  *
  * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
@@ -13,10 +13,11 @@
 /**
  * ntpfw_load - load firmware to amplifier over i2c interface.
  *
- * @i2c		Pointer to amplifier's I2C client.
- * @name	Firmware file name.
- * @magic	Magic number to validate firmware.
- * @return	0 or error code upon error.
+ * @i2c:	Pointer to amplifier's I2C client.
+ * @name:	Firmware file name.
+ * @magic:	Magic number to validate firmware.
+ *
+ * Returns:	0 or error code upon error.
  */
 int ntpfw_load(struct i2c_client *i2c, const char *name, const u32 magic);
 

