Return-Path: <linux-arm-msm+bounces-118896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kwY/FqGUVWqUqQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD1575023B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=Wpf+mTGC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118896-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118896-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3F2E301D4DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044A1367B94;
	Tue, 14 Jul 2026 01:45:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC036F42A;
	Tue, 14 Jul 2026 01:44:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993499; cv=none; b=sBnEDLIRy+2qs3bADGvKjtUtfz1mrX3KF50D31nvPeNH/soyXhnY+oc6bHsnNTMPC0heEPbX0FFCHr3xOs4TnLAWwKhPphmUvkcUvJhk+/TbpSR0J6U1qkOJehuUgi07zoMaInjmEySFLNCH4y4zrhqL60UKyS9cpYpHPB1sD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993499; c=relaxed/simple;
	bh=i66z+a6ewiQugyyGHpBicAqvKoR+eH1+SIZvYWsO96Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ko9qr6Q9/sKCOIr6c74Iow5pSZne33ilotGoY3NMjPyR+QgAzxJM5iBvKX+H2swa2ii6lxaT/B3E4KRhBlJmR6vqhSIH6YtZ0yQS6UvwNuO7Mwrpcud349+oQJE/vvg3GPf3Bs3wUVgd8kZE0EVP4ARgZw8l9eD6hQRbkQy+HRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Wpf+mTGC; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3c6jVXUi+55jepOtFloOQNLKIS9Pd9AodNsSEPjbFmU=; b=Wpf+mTGC04w9/6knISjuoyn4ng
	6GeE7czqqKRqbFnOCE+gpMDAEUQe57zEK3y6msSTZLW6ARFKL508dCaZ3+yVix6iWinpEkqa0s1Ii
	7TvIf1+H+CgxiUTjJL9i96wsCySCJwyWq943ItF21FtwqOD3/xAWX1CEB1mWHRnGXnofoI+BnH8eu
	qGvoaYGJ/d/WqQT2KCC3vALwCk1TEz66dgbY8P/OTJMfDIxBGkGmdd2nLye/dxD6I7lCP4g1zOCsw
	HSsvX+xB6/dtCZB+BbvmvUaJzidiLKuiNk4dt/JKW2+4ApCkVtYzW657BLHN2/4GzZ7QkaCntpcez
	uFj4btqA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCb-0000000AgsR-09IW;
	Tue, 14 Jul 2026 01:44:53 +0000
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
Subject: [PATCH 10/14] ASoC: SDCA: correct enum names and add a missing struct field
Date: Mon, 13 Jul 2026 18:44:41 -0700
Message-ID: <20260714014445.569992-11-rdunlap@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118896-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim,vger.kernel.org:from_smtp,linux.dev:email,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACD1575023B

Add a kernel-doc comment for @is_volatile in struct sdca_control.
Correct 2 malformed enum names to match the enums.
Fixes 3 warnings:

Warning: include/sound/sdca_function.h:306 expecting prototype for enum sdca_set_index_range. Prototype was for enum sdca_fdl_set_index_range instead

Warning: include/sound/sdca_function.h:829 struct member 'is_volatile' not described in 'sdca_control'

Warning: include/sound/sdca_function.h:1152 expecting prototype for enum sdca_xu_reset_machanism. Prototype was for enum sdca_xu_reset_mechanism instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: patches@opensource.cirrus.com

 include/sound/sdca_function.h |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/include/sound/sdca_function.h
+++ linext-2026-0710/include/sound/sdca_function.h
@@ -298,7 +298,7 @@ enum sdca_xu_controls {
 };
 
 /**
- * enum sdca_set_index_range - Column definitions UMP SetIndex
+ * enum sdca_fdl_set_index_range - Column definitions UMP SetIndex
  */
 enum sdca_fdl_set_index_range {
 	SDCA_FDL_SET_INDEX_SET_NUMBER			= 0,
@@ -803,6 +803,8 @@ struct sdca_control_range {
  * @mode: Access mode of the Control.
  * @layers: Bitmask of access layers of the Control.
  * @deferrable: Indicates if the access to the Control can be deferred.
+ * @is_volatile: Indicates the Control registers are forced to be treated
+ *  as volatile.
  * @has_default: Indicates the Control has a default value to be written.
  * @has_reset: Indicates the Control has a defined reset value.
  * @has_fixed: Indicates the Control only supports a single value.
@@ -1144,7 +1146,7 @@ struct sdca_entity_hide {
 };
 
 /**
- * enum sdca_xu_reset_machanism - SDCA FDL Resets
+ * enum sdca_xu_reset_mechanism - SDCA FDL Resets
  */
 enum sdca_xu_reset_mechanism {
 	SDCA_XU_RESET_FUNCTION				= 0x0,

