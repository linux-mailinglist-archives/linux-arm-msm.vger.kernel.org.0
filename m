Return-Path: <linux-arm-msm+bounces-119115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0EnQJe3OVmq4BQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:06:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF9759921
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:06:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=fME9jogK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119115-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119115-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B073A30E7F61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40F52C9D;
	Wed, 15 Jul 2026 00:05:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438372F84F;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073934; cv=none; b=t1LNAcvZfH3Gv52EPYIyWININkgQSJqmVdXM6m/NBsOmeYdvfB6Tal5IUBcfxpc4vKUNCq9N9sWna22p7Bq30quLr8KduV6ivETCi3M4eMrmD61VByyQ1+81C6djj4qnFbIcfvBsGy2uNt3XtsHrS+I3boI10l1VYTleRNOn3sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073934; c=relaxed/simple;
	bh=947KOaoRSB2wBj2Q5Wa75LwqRqHpU5xHnksU5oDlzAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQYR8V4LAbCxtnhG9lEcyX8x+gxkGg1psX4K/65ac5WYBdAlM1VELV+QtlzUfVaAwSzh+JtVLxiZrpHutNdlvpz4QZcLoa/77kS6rTWpgs7ZsyXioYlqRnqKxQ6Hrb1x0+WfIa5aY3p+ORD7/JhM/rGvxffp0DJlEwci2BcVxBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fME9jogK; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6LEb67q5/JkYZPKqcsplxK8kOatO/+OxOClDLJ4Zb/Y=; b=fME9jogKjb3zt4rtxtFeXVoQKY
	tvqklxgtHF+XIxR1AmO3oDOBZmmG6VtXBPeDfdLEeQ7TNzI4Y9SSqwTg+ZiMdPSS3XDVteqdLCGVO
	HQZoWjJMxmMaHUOsgGW3TkhUdltedeSVKgsWVU5CqSSt6tPNDIWNuH9VwGlrs0SWybWzAu4gt5yIg
	c60iMuh+wD6q4agDumdJrTsAgEw7szHA0K2x+yZ2uQwx+snbJ9pxACrAbzSGsLaxsMVkR8jViYRV2
	4sk5MuDCWkii9+PISt2sWmFLtGf+I/Uk6P33HHAk4SLObiGMSzZ5WSmFiQntEnXnpZqQPCli9At5H
	6CH9n/Iw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn7w-0000000DTcu-08Si;
	Wed, 15 Jul 2026 00:05:28 +0000
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
Subject: [PATCH 00/14 v2] ASoC: clean up kernel-doc warnings
Date: Tue, 14 Jul 2026 17:05:11 -0700
Message-ID: <20260715000525.739874-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
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
	TAGGED_FROM(0.00)[bounces-119115-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vger.kernel.org:from_smtp,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cirrus.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37FF9759921

Clean up a bunch of kernel-doc warnings in the ASoC code.

v2: add Mark and Liam to the cover letter email

[PATCH 01/14 v2] ASoC: codecs: NeoFidelity: repair the kernel-doc format
[PATCH 02/14 v2] ASoC: fsl_asrc_common: fix all kernel-doc warnings
[PATCH 03/14 v2] ASoC: fsl_asrc: avoid kernel-doc warnings
[PATCH 04/14 v2] ASoC: fsl-dma: fix all kernel-doc warnings
[PATCH 05/14 v2] ASoC: fsl_easrc: use struct keyword on structs
[PATCH 06/14 v2] ASoC: fsl: mpc5200_dma: use the struct keyword for kernel-doc comments
[PATCH 07/14 v2] ASoC: fsl: mpc5200_psc_i2s: avoid kernel-doc warnings
[PATCH 08/14 v2] ASoC: fsl: p1022_ds: repair kernel-doc short descriptions
[PATCH 09/14 v2] ASoC: uniphier: don't use "/**" for non-kernel-doc comment
[PATCH 10/14 v2] ASoC: SDCA: correct enum names and add a missing struct field
[PATCH 11/14 v2] ASoC: soc-acpi: fix all kernel-doc warnings
[PATCH 12/14 v2] ASoC: Intel: Skylake: convert SKL_TKNS to kernel-doc format
[PATCH 13/14 v2] ASoC: qcom: audioreach: use C-style "/*" comment
[PATCH 14/14 v2] ASoC: wm8904: don't use "/**" for non-kernel-doc comments

 include/sound/sdca_function.h       |    6 
 include/sound/soc-acpi.h            |   23 +--
 include/sound/wm8904.h              |    4 
 include/uapi/sound/snd_ar_tokens.h  |    2 
 include/uapi/sound/snd_sst_tokens.h |  165 +++++++++++++-------------
 sound/soc/codecs/ntpfw.h            |   11 -
 sound/soc/fsl/fsl_asrc.h            |    6 
 sound/soc/fsl/fsl_asrc_common.h     |    8 -
 sound/soc/fsl/fsl_dma.h             |    4 
 sound/soc/fsl/fsl_easrc.h           |    4 
 sound/soc/fsl/mpc5200_dma.h         |    4 
 sound/soc/fsl/mpc5200_psc_i2s.c     |    8 +
 sound/soc/fsl/p1022_ds.c            |    4 
 sound/soc/uniphier/aio.h            |    2 
 14 files changed, 136 insertions(+), 115 deletions(-)

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: patches@opensource.cirrus.com
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org

