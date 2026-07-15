Return-Path: <linux-arm-msm+bounces-119118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UsvEN/7OVmq9BQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:06:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E3759937
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b="f8SbXH/F";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119118-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119118-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A6493106D97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C453C78F2B;
	Wed, 15 Jul 2026 00:05:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B611E32CF;
	Wed, 15 Jul 2026 00:05:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073936; cv=none; b=ej8DzflJRKEqmHpxD6yCmUhoRPrgDJLh8KOCfBvwop5DMmoPV+FdRIaF0/foXJlzIiA+aiwRpGPdv8kfIbfofVeVhpiyXGXL3Xv/2zs9D44ynu8qCXErmMVd1U+/rkCyRKQkezw6v4hgvBz6PJMj2aW7VnzjLxuY0yfkOTI7tN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073936; c=relaxed/simple;
	bh=sFCzNsuzq80Sc3KOjjNDvzDtxfqB1kQyfhBrRf5iQHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/5TyLTcGD/OT7HF6zqYNRnBngskzbLCIwd0DVwzXWsu07r2dFx14f2KHT67m75v8Kh+fBujtOm0CU/+JtzIHjNdK9pcpFKTKvtEXLustfYRc6paU37lXYPH764W6nWQNWBb4F2JWO+19Dh15f92M/97y+M47zQiKhklpr/fvbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=f8SbXH/F; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=k7wS5NSRoXjGzDk9NchtsQuUMk6gxPBQtgSJKeJ9nKw=; b=f8SbXH/F+bjtIOd9IIfmqsgr78
	7HFeqK6vJ0Q8jldWeTHf2ywM0egej8z/jjjiklk/O+eHE6fCOcHUwrypv+OAXLBWtswq2lhskICLx
	qgkbTtPcMoIsfK7zDQWTI2owvKawLOOMA7ZaBe6Pq1mTvBMXq68r45Dq+Jw63HZeuGswFA4Ksx8k+
	OG+CB+GCXNQrnUc6nu7bLbx99mUUL5S25Wbgj3SGp8So5fjjGp863MPCObK1rHVu8KDPTit2K6BDv
	yvwPXnY9mv/jawAyMBJqqQg+r8ooq6M1auntD48SxcF5UROOd99UZDM1NED4m9y/JJzburV5xEFkq
	P1YSEFsQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn82-0000000DTcu-2AKD;
	Wed, 15 Jul 2026 00:05:34 +0000
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
Subject: [PATCH 11/14 v2] ASoC: soc-acpi: fix all kernel-doc warnings
Date: Tue, 14 Jul 2026 17:05:22 -0700
Message-ID: <20260715000525.739874-12-rdunlap@infradead.org>
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
	TAGGED_FROM(0.00)[bounces-119118-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 317E3759937

Add missing "struct" keyword to kernel-doc for structs.
Describe @mach_params in struct snd_soc_acpi_mach.
Don't document callback parameters with '@' as though they are kernel-doc.

These changes avoid all kernel-doc warnings in this header file.

Examples:
Warning: ../include/sound/soc-acpi.h:77 cannot understand function prototype: 'struct snd_soc_acpi_mach_params'
Warning: ../include/sound/soc-acpi.h:101 cannot understand function prototype: 'struct snd_soc_acpi_endpoint'
Warning: ../include/sound/soc-acpi.h:115 cannot understand function prototype: 'struct snd_soc_acpi_adr_device'
Warning: ../include/sound/soc-acpi.h:132 cannot understand function prototype: 'struct snd_soc_acpi_link_adr'
Warning: ../include/sound/soc-acpi.h:209 cannot understand function prototype: 'struct snd_soc_acpi_mach'

Warning: include/sound/soc-acpi.h:230 struct member 'mach_params' not described in 'snd_soc_acpi_mach'
Warning: include/sound/soc-acpi.h:230 Excess struct member 'card' description in 'snd_soc_acpi_mach'
Warning: include/sound/soc-acpi.h:230 Excess struct member 'mach' description in 'snd_soc_acpi_mach'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org

 include/sound/soc-acpi.h |   23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

--- linext-2026-0710.orig/include/sound/soc-acpi.h
+++ linext-2026-0710/include/sound/soc-acpi.h
@@ -57,7 +57,7 @@ static inline struct snd_soc_acpi_mach *
 #endif
 
 /**
- * snd_soc_acpi_mach_params: interface for machine driver configuration
+ * struct snd_soc_acpi_mach_params - interface for machine driver configuration
  *
  * @acpi_ipc_irq_index: used for BYT-CR detection
  * @platform: string used for HDAudio codec support
@@ -93,7 +93,7 @@ struct snd_soc_acpi_mach_params {
 };
 
 /**
- * snd_soc_acpi_endpoint - endpoint descriptor
+ * struct snd_soc_acpi_endpoint - endpoint descriptor
  * @num: endpoint number (mandatory, unique per device)
  * @aggregated: 0 (independent) or 1 (logically grouped)
  * @group_position: zero-based order (only when @aggregated is 1)
@@ -107,7 +107,7 @@ struct snd_soc_acpi_endpoint {
 };
 
 /**
- * snd_soc_acpi_adr_device - descriptor for _ADR-enumerated device
+ * struct snd_soc_acpi_adr_device - descriptor for _ADR-enumerated device
  * @adr: 64 bit ACPI _ADR value
  * @num_endpoints: number of endpoints for this device
  * @endpoints: array of endpoints
@@ -121,7 +121,7 @@ struct snd_soc_acpi_adr_device {
 };
 
 /**
- * snd_soc_acpi_link_adr - ACPI-based list of _ADR enumerated devices
+ * struct snd_soc_acpi_link_adr - ACPI-based list of _ADR enumerated devices
  * @mask: one bit set indicates the link this list applies to
  * @num_adr: ARRAY_SIZE of devices
  * @adr_d: array of devices
@@ -167,8 +167,8 @@ struct snd_soc_acpi_link_adr {
 #define SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME BIT(4)
 
 /**
- * snd_soc_acpi_mach: ACPI-based machine descriptor. Most of the fields are
- * related to the hardware, except for the firmware and topology file names.
+ * struct snd_soc_acpi_mach - ACPI-based machine descriptor. Most of the fields
+ * are related to the hardware, except for the firmware and topology file names.
  * A platform supported by legacy and Sound Open Firmware (SOF) would expose
  * all firmware/topology related fields.
  *
@@ -192,6 +192,7 @@ struct snd_soc_acpi_link_adr {
  * the initial selection in the snd_soc_acpi_mach table.
  * @pdata: intended for platform data or machine specific-ops. This structure
  *  is not constant since this field may be updated at run-time
+ * @mach_params: machine driver configuration
  * @sof_tplg_filename: Sound Open Firmware topology file name, if enabled
  * @tplg_quirk_mask: quirks to select different topology files dynamically
  * @get_function_tplg_files: This is an optional callback, if specified then instead of
@@ -199,11 +200,11 @@ struct snd_soc_acpi_link_adr {
  *	files to be loaded.
  *	Return value: The number of the files or negative ERRNO. 0 means that the single topology
  *		      file should be used, no function topology split can be used on the machine.
- *	@card: the pointer of the card
- *	@mach: the pointer of the machine driver
- *	@prefix: the prefix of the topology file name. Typically, it is the path.
- *	@tplg_files: the pointer of the array of the topology file names.
- *	@best_effort: ignore non supported links and try to build the card in best effort
+ *	card: the pointer of the card
+ *	mach: the pointer of the machine driver
+ *	prefix: the prefix of the topology file name. Typically, it is the path.
+ *	tplg_files: the pointer of the array of the topology file names.
+ *	best_effort: ignore non supported links and try to build the card in best effort
  *		      with supported links
  */
 /* Descriptor for SST ASoC machine driver */

