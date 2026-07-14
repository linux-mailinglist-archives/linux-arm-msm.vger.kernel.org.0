Return-Path: <linux-arm-msm+bounces-118885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0jEvN7eUVWqeqQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2CA750265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=PgWO2t0h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118885-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118885-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D62033038F58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CFB36F8EE;
	Tue, 14 Jul 2026 01:44:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FDC367B94;
	Tue, 14 Jul 2026 01:44:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993491; cv=none; b=H/f04GKzIamvoGdv2leMsRs5yfzpJPGipWxoBgM0v0U58cieEmoo5oRIfrmqctjMABaJsX8MJ/wuN+n1wb9I6+m/joT0BV09vPYu70u4r5/wdfHCv5ROErQeUGKxaOjWLWJGGbzMRoyRMrrC0q0N7FD59/yawJZ+xqWqrUkL3+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993491; c=relaxed/simple;
	bh=BGI9jYYXipWaG2r9TpKnqA9V/sb7rt7SIFvUz68zcXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZaLUY3X6+QxP45rV/2al8NEAIq30YCVMGifcZaFbRvHkz3OcqVnt2Gu/9IFbniDJo+ufsVpY0FjWIEal3fLY2GNwyb4wlZgzBAhWdjl+COaMdtPGqrAWcgs7UXW6esLzNgwmamsSsykOqFXOjWzSLByzEoGjbQmgCj1l4QJqNlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PgWO2t0h; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4u3ACvzL8pxpd9iG+vgo00VNHiGf5hs+Js+oX4NbtWM=; b=PgWO2t0hR2dql3T2xki7G4X/Lt
	C4dyyJMqBu+oXIDsb2o0qxNCO++iNfS3lNcCh3fA2qGLuuSnSU5svpchYzAmRu3DzivDFOtIxO0jK
	LjlPX8MIsmwKS/Vc+ciRKKHizCMAV1Fadl5I1LHEdQ8912kms1kfx+8iUBic5V6OgyUo0aYG/sJ1D
	3e100Iy4FAUk7TAV7CnmCX0qqfZfkBRlgnBreoAfxFRask4LlwQqpom730NagwTDQubRLn+gfBVGG
	Oaf/jPs7hXAFwWr4O8S2NX+4eduCQ4YRuNjW9cnW4nkCud8wvJc36t3ZaSrrXEpg5oGW/4TiypjcT
	Opu0tKdg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCU-0000000AgsR-1i5n;
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
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 00/14] ASoC: clean up kernel-doc warnings
Date: Mon, 13 Jul 2026 18:44:31 -0700
Message-ID: <20260714014445.569992-1-rdunlap@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118885-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-sound@vger.kernel.org,m:rdunlap@infradead.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:ckeepax@opensource.cirrus.com,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,vger.kernel.org:from_smtp,suse.com:email,perex.cz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A2CA750265

Clean up a bunch of kernel-doc warnings in the ASoC code.

[PATCH 01/14] ASoC: codecs: NeoFidelity: repair the kernel-doc format
[PATCH 02/14] ASoC: fsl_asrc_common: fix all kernel-doc warnings
[PATCH 03/14] ASoC: fsl_asrc: avoid kernel-doc warnings
[PATCH 04/14] ASoC: fsl-dma: fix all kernel-doc warnings
[PATCH 05/14] ASoC: fsl_easrc: use struct keyword on structs
[PATCH 06/14] ASoC: fsl: mpc5200_dma: use the struct keyword for kernel-doc comments
[PATCH 07/14] ASoC: fsl: mpc5200_psc_i2s: avoid kernel-doc warnings
[PATCH 08/14] ASoC: fsl: p1022_ds: repair kernel-doc short descriptions
[PATCH 09/14] ASoC: uniphier: don't use "/**" for non-kernel-doc comment
[PATCH 10/14] ASoC: SDCA: correct enum names and add a missing struct field
[PATCH 11/14] ASoC: soc-acpi: fix all kernel-doc warnings
[PATCH 12/14] ASoC: Intel: Skylake: convert SKL_TKNS to kernel-doc format
[PATCH 13/14] ASoC: qcom: audioreach: use C-style "/*" comment
[PATCH 14/14] ASoC: wm8904: don't use "/**" for non-kernel-doc comments

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

