Return-Path: <linux-arm-msm+bounces-118888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mRz8EseUVWqqqQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F8475027C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=Jj6nb2bx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118888-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118888-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3CC630488F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192EB371065;
	Tue, 14 Jul 2026 01:44:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C2636A36C;
	Tue, 14 Jul 2026 01:44:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993493; cv=none; b=gba2wgdhCjqq3pEKNN2BY7xK75qtzMWFWc2qdMEBlWljJGcqx1lPGGGWtvVLiDdZJc/bLAsv8PbI/P6eJrB+5i/Naq3EPys3Rszui0hTMdwfqfeCMD/g7ZUD8VSSLTkG6KZ/n9N44OPmiEUtP4f4xQ6xc6mgl/Xp1ljvtsXVQYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993493; c=relaxed/simple;
	bh=gbFcTGaUSPVxDs9pUWGtvwlNznz8e03E1MYQMYCbwyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t94PiEoZJNgayZ25ExKmPD1+lw7KjCNiZx/dxnbdIUo0REEGNnMOpKGVJRTDr+7k9liizH0S1vQXvzN7358GR+t6rVP28AT7z6uNt3WEwu1lsgkHnlzJYyWsS6qFRth/0L5cSmfX6LDgteOlQOKbbofxRCVJDURkFHlrBJRpUrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Jj6nb2bx; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EuZa5Q5a/jMFskrp99UmUL5HrkAt4TSwEVsuVrrXQfg=; b=Jj6nb2bxcG7Hyhh+d25tyJ8cPK
	d35Wl10kucMNZd5o0G2RG95HKtMP4hmBvHbWuPfaaQHP1LTQ6DKSHRzjWcjFz2NGPmqVXffLFCbOJ
	nqDvzUVQ3hxx0A+YTP4R6OdoK7tsWyKvd2he3toD+fBnkR4XGDKlXlohanY4+1/jy9Gny0fMVzE93
	/bNNNZ/vtL3XF3DnXxAaZUq8x3oXCob8FJX8fP3KyCPqSXt5g/k5G+IMk+nGA9/VO5/VHTbf/JcjV
	HJyks112h2ZNpXBeKOyjtiXoWpO9cIFGRduhyt/ulGsSgD088nKhYrQabAcwEq5Wl298VM0t5wTek
	9oyfnNJw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCZ-0000000AgsR-1F5Q;
	Tue, 14 Jul 2026 01:44:51 +0000
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
Subject: [PATCH 07/14] ASoC: fsl: mpc5200_psc_i2s: avoid kernel-doc warnings
Date: Mon, 13 Jul 2026 18:44:38 -0700
Message-ID: <20260714014445.569992-8-rdunlap@infradead.org>
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
	TAGGED_FROM(0.00)[bounces-118888-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D7F8475027C

Add missing kernel-doc for function parameters.
Use kernel-doc format for function return value descriptions.
Use the "var" keyword to describe a data definition.

These changes avoid all kernel-doc warnings in this file:

Warning: ../sound/soc/fsl/mpc5200_psc_i2s.c:123 cannot understand function prototype: 'const struct snd_soc_dai_ops psc_i2s_dai_ops ='
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:87 function parameter 'cpu_dai' not described in 'psc_i2s_set_sysclk'
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:87 No description found for return value of 'psc_i2s_set_sysclk'
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:106 function parameter 'cpu_dai' not described in 'psc_i2s_set_fmt'
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:106 No description found for return value of 'psc_i2s_set_fmt'
Warning: sound/soc/fsl/mpc5200_psc_i2s.c:123 cannot understand function prototype: 'const struct snd_soc_dai_ops psc_i2s_dai_ops ='

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/mpc5200_psc_i2s.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- linext-2026-0710.orig/sound/soc/fsl/mpc5200_psc_i2s.c
+++ linext-2026-0710/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -79,9 +79,12 @@ static int psc_i2s_hw_params(struct snd_
  * and we don't care about the frequency.  Return an error if the direction
  * is not SND_SOC_CLOCK_IN.
  *
+ * @cpu_dai: DAI runtime data pointer
  * @clk_id: reserved, should be zero
  * @freq: the frequency of the given clock ID, currently ignored
  * @dir: SND_SOC_CLOCK_IN (clock slave) or SND_SOC_CLOCK_OUT (clock master)
+ *
+ * Returns: %0 on success or %-EINVAL on failure.
  */
 static int psc_i2s_set_sysclk(struct snd_soc_dai *cpu_dai,
 			      int clk_id, unsigned int freq, int dir)
@@ -101,7 +104,10 @@ static int psc_i2s_set_sysclk(struct snd
  * This driver only supports I2S mode.  Return an error if the format is
  * not SND_SOC_DAIFMT_I2S.
  *
+ * @cpu_dai: DAI runtime data pointer
  * @format: one of SND_SOC_DAIFMT_xxx
+ *
+ * Returns: %0 on success or %-EINVAL on failure.
  */
 static int psc_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int format)
 {
@@ -119,7 +125,7 @@ static int psc_i2s_set_fmt(struct snd_so
  */
 
 /**
- * psc_i2s_dai_template: template CPU Digital Audio Interface
+ * var psc_i2s_dai_ops - template CPU Digital Audio Interface
  */
 static const struct snd_soc_dai_ops psc_i2s_dai_ops = {
 	.hw_params	= psc_i2s_hw_params,

