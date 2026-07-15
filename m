Return-Path: <linux-arm-msm+bounces-119119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IxsNBwHPVmq/BQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:06:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1D75993B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:06:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=bYNBBQs5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119119-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119119-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 782B8310A533
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AE342BC47;
	Wed, 15 Jul 2026 00:05:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE001FBEA8;
	Wed, 15 Jul 2026 00:05:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073937; cv=none; b=S+4LNHF++2xfednv7a+ZA6JZmo3XHe3M5qqh4tuKcsRU9qZ3XZt2uJmUbe4InVUOwQumIB7hrwC5cDltahIIx32aRcu0CUprvK+CfXofvUzmgcyQdQfrtIWIIW3zuvf/siUNXXB90jh6goLFcCyRGEk2XrwZWta6dsIEjGmbvsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073937; c=relaxed/simple;
	bh=U83S2woNGtFhLp3p3PANoIUGkLIv6kFssqnSQls2TMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cn+FahLbNAPFvtnEBQfh5XbAr7LDZFFzIQswwiYn2V9vbI6/nH9GK+WZAz4RmsWIs4YOi40Q6jOJqV/cJ/fXpitiGDvqd+ZzMef1XeexzuFOvmxYSzqRgaTVlW/vEjSNR3ADjAubT7ieW6xcJpiW94qutKUdEtG8ozC2FZQ3iHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bYNBBQs5; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KehD+od9M3/491YsSC+zOVYJlf8gVJUUtBT8uZjzCCM=; b=bYNBBQs5+Yha0dEBm+IY8p4fRq
	E8cdh9931nDjqCxW1b8rOR6M9x++iayLmRvwIYm2LhSk4gQmbvUZjn/lTo4g7NfW6Hn2xJ6cEKtPs
	jsZUxhxDetbW7Qz0AqoKMiG8auE5kzOCbbt5c4MYCKH3uwc2CzGB+K/LRSCBCBKMxnL6cF0wbLYcx
	yI+WHfT2t9Jf/yZCZr5CZSs9bUR/2XZGRctX+TIsEoE0XqEBAZHTGsmrcz3OcM+cLnNj5bo1EMV1C
	vAWcyOfzB1B4kLZ4yQy8lbwcvWPkeKZO0pf+VAxW7NVXBYtn4+ph9Sv64cfYv9NeEy2TATK52MmdT
	4Ups8mEg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn83-0000000DTcu-2vNk;
	Wed, 15 Jul 2026 00:05:35 +0000
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
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 13/14 v2] ASoC: qcom: audioreach: use C-style "/*" comment
Date: Tue, 14 Jul 2026 17:05:24 -0700
Message-ID: <20260715000525.739874-14-rdunlap@infradead.org>
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
	TAGGED_FROM(0.00)[bounces-119119-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-sound@vger.kernel.org,m:rdunlap@infradead.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:ckeepax@opensource.cirrus.com,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,kernel.org,perex.cz,suse.com,lists.ozlabs.org,opensource.cirrus.com,linux.intel.com,linux.dev,vger.kernel.org,oss.qualcomm.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81B1D75993B

Modify the "/**" to use "/*" instead since this is not a kernel-doc
comment. This avoids all kernel-doc warnings in this header file:

Warning: include/uapi/sound/snd_ar_tokens.h:61 Cannot find identifier on line:
 * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:           Sub Graph Instance Id
Warning: ../include/uapi/sound/snd_ar_tokens.h:62 Cannot find identifier on line: *
Warning: ../include/uapi/sound/snd_ar_tokens.h:63 Cannot find identifier on line:
 * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:             Performance mode of subgraph
Warning: include/uapi/sound/snd_ar_tokens.h:64 This comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
v2: add Rev-by: Srinivas

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
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

