Return-Path: <linux-arm-msm+bounces-118891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nY3CCtCUVWqtqQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D8875028D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:45:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b="NhEpc/OX";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118891-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118891-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 291D93050A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 01:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F5536F428;
	Tue, 14 Jul 2026 01:44:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC270369D66;
	Tue, 14 Jul 2026 01:44:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993495; cv=none; b=CdconlIYZZtrAZDmCb6JjOoAtYPOAxo5yvTMPYS4ir8LQ/VgnQI/iB4ryAIOC14dMbl7/xFwTRSG/3yNrT/p/Y+crJ5UgaT7EYGzleXAjWNgBDI7JFYoEc86r9IVEpw0ptaoy70GAci3GAT81XZQzl+7qGTh66J88BiK+ts7Kvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993495; c=relaxed/simple;
	bh=e43bH6Sg4Ire0glE8cXgrmx4npbU7zr03wNu5QhEUHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n67aApoEkiyNd6wx6fcQ04k3jii9u3ue9uvGD692sV3AJctB2wN/Qayq986scGGCOjOiFZI4nq1tuilZBiiR0r6D80skL/0CVjT6m46J9DmsafNvPlnsDJ8U1cwwAkXng92VtvL9T4H8rM5L1KgKRNXHErCbXv6IxGIkXi34IAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NhEpc/OX; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vnfsYfktu5U5dXFqu4+zHIXwtmVyfE56yQqIND2vx9A=; b=NhEpc/OXBnVTiaG6aq9cgKgQH7
	hQGD4GwkZohSHaeAQoKkVTwm0++E6a81Z6VKtJFaP0hjJ0BKhlAoGG4YeDCLNLLJa7CeLL8CBvSmb
	ZK6GJBCk2sbqtu/WliRu86KNn8fAL4olrntazUBuZCmAMDIEkJiNN0M1vX5SwoL7cUPCE2tCJWCjr
	krLfX/xyRJBM4x8yduerKNK6CxRVpdlmEp4yrhborp/yc+/SWw4PTr3J2rRF0mdpOqEgrx1adGvs6
	gCK74LJ2b0uSyGE7VpBtfAsVeds2DxDCgwDT7UxjqzN/1jGmpXBkFiqvypQSP6yBFanvhhv3HqGW1
	2Hc0nfcA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCX-0000000AgsR-2GAy;
	Tue, 14 Jul 2026 01:44:49 +0000
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
Subject: [PATCH 04/14] ASoC: fsl-dma: fix all kernel-doc warnings
Date: Mon, 13 Jul 2026 18:44:35 -0700
Message-ID: <20260714014445.569992-5-rdunlap@infradead.org>
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
	TAGGED_FROM(0.00)[bounces-118891-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ozlabs.org:email,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5D8875028D

Don't use "/**" for non-kernel-doc comments to avoid kernel-doc warnings:

Warning: ../sound/soc/fsl/fsl_dma.h:95 This comment starts with '/**', but isn't a kernel-doc comment.
 *  List Descriptor for extended chaining mode DMA operations.
Warning: ../sound/soc/fsl/fsl_dma.h:110 This comment starts with '/**', but isn't a kernel-doc comment.
 *  Link Descriptor for basic and extended chaining mode DMA operations.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/fsl_dma.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/fsl_dma.h
+++ linext-2026-0710/sound/soc/fsl/fsl_dma.h
@@ -92,7 +92,7 @@ static inline u32 CCSR_DMA_ECLNDAR_ADDR(
 #define CCSR_DMA_ATR_SNOOP      	0x00050000
 #define CCSR_DMA_ATR_ESAD_MASK  	0x0000000F
 
-/**
+/*
  *  List Descriptor for extended chaining mode DMA operations.
  *
  *  The CLSDAR register points to the first (in a linked-list) List
@@ -107,7 +107,7 @@ struct fsl_dma_list_descriptor {
 	u8 res[8];      	/* Reserved */
 } __attribute__ ((aligned(32), packed));
 
-/**
+/*
  *  Link Descriptor for basic and extended chaining mode DMA operations.
  *
  *  A Link Descriptor points to a single DMA buffer.  Each link descriptor

