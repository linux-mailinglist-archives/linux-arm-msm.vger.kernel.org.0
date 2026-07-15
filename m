Return-Path: <linux-arm-msm+bounces-119121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0kLeDt/OVmqvBQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:05:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60B7598FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:05:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=OYUnvyqJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119121-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119121-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DAC63044953
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 00:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875B917B50F;
	Wed, 15 Jul 2026 00:05:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5071FBC8E;
	Wed, 15 Jul 2026 00:05:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073938; cv=none; b=d4ZDXyEUvoFqwsPpNrlSiAwKBBqhPXAbGzB8s6ZW1Yj6IeYU1s5/BaOggv3ZBMQBghfc028z93N4eMpp2PWfLKb/cKo6b04xWe2rANcR/mn2Cich1mDgOGUUVjuhRQhBDffHhDxlxTrFssrPndZiBr2Jf35t+Yw/d2CPVBUhVc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073938; c=relaxed/simple;
	bh=aYdNQrNEzqCckxgYnvn2gyahgp8+LWvEVHbyGPXSlag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIcBEUKrZkiSQsUM4gh6oFWYlZExpQOHg/MhqN9OiZVXNcVo0x+dppKoy+NFSjUMmcF6QFlcOV63/n/aNaL8mUZDGvRGQDvF35fqemMwgn0a+X61IHsO4OQldlfIabXQmKGicyDn8tnPbq4keCZODtTXhrXMzeAz1MbwgWhYzOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OYUnvyqJ; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nF4+mwdE2wybCU4qYqinVHZqrLYvL5Hm7DQFRIiGdR0=; b=OYUnvyqJWqpJUQ4RgvwM6o5hJt
	++BvrS3j6lZWBJXlXNf4NtxorHn+urKkabUXLei/Isf1sBLQIeRZzEj/OqJ7ZIH+pMDdmHQD8OJVb
	ivYVZkuCoWM6SX6RrqSrLYWv/RI0r3gNqVNOLMaDSZCL/2vDB982NZInPVeifjJsgGC2dtvcgxMM8
	2XSiiOjaDUqU6SXWtcCeEAhB+Cmqn9ZRWEtofXCjFNTWptblk9Rfo446Aq0wxYBHvq1IjSrkeFn38
	40lRGfmo4oSU1dS0tHow/G3lg47MbXsQrVShJXtJqGX28jRfFLom40nztGAu4c7XrwzrpbVRouQo0
	TMvlpCSg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn83-0000000DTcu-0O9Z;
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
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 12/14 v2] ASoC: Intel: Skylake: convert SKL_TKNS to kernel-doc format
Date: Tue, 14 Jul 2026 17:05:23 -0700
Message-ID: <20260715000525.739874-13-rdunlap@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119121-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:from_mime,infradead.org:mid,infradead.org:email,infradead.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E60B7598FE

Convert enum SKL_TKNS to kernel-doc format:
- use '@' instead of '%' for enum items
- add missing enum values
- correct a few enum names in the comments
- remove the comment for %SKL_TKN_U16_PIN_INST_ID since it is undefined
- fix a few typos

Warning: include/uapi/sound/snd_sst_tokens.h:11 Cannot find identifier on line:
 * %SKL_TKN_UUID:               Module UUID
Warning: ../include/uapi/sound/snd_sst_tokens.h:12 Cannot find identifier on line: *
Warning: ../include/uapi/sound/snd_sst_tokens.h:13 Cannot find identifier on line:
 * %SKL_TKN_U8_BLOCK_TYPE:      Type of the private data block.Can be:
Warning: include/uapi/sound/snd_sst_tokens.h:14 This comment starts with '/**', but isn't a kernel-doc comment.
 *                              tuples, bytes, short and words

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org

 include/uapi/sound/snd_sst_tokens.h |  165 +++++++++++++-------------
 1 file changed, 87 insertions(+), 78 deletions(-)

--- linext-2026-0710.orig/include/uapi/sound/snd_sst_tokens.h
+++ linext-2026-0710/include/uapi/sound/snd_sst_tokens.h
@@ -9,43 +9,47 @@
 #define __SND_SST_TOKENS_H__
 
 /**
- * %SKL_TKN_UUID:               Module UUID
+ * enum SKL_TKNS - SST tokens definitions
  *
- * %SKL_TKN_U8_BLOCK_TYPE:      Type of the private data block.Can be:
+ * @SKL_TKN_UUID:               Module UUID
+ *
+ * @SKL_TKN_U8_BLOCK_TYPE:      Type of the private data block.Can be:
  *                              tuples, bytes, short and words
  *
- * %SKL_TKN_U8_IN_PIN_TYPE:     Input pin type,
+ * @SKL_TKN_U8_NUM_BLOCKS:      FIXME
+ *
+ * @SKL_TKN_U8_IN_PIN_TYPE:     Input pin type,
  *                              homogenous=0, heterogenous=1
  *
- * %SKL_TKN_U8_OUT_PIN_TYPE:    Output pin type,
+ * @SKL_TKN_U8_OUT_PIN_TYPE:    Output pin type,
  *                              homogenous=0, heterogenous=1
- * %SKL_TKN_U8_DYN_IN_PIN:      Configure Input pin dynamically
+ * @SKL_TKN_U8_DYN_IN_PIN:      Configure Input pin dynamically
  *                              if true
  *
- * %SKL_TKN_U8_DYN_OUT_PIN:     Configure Output pin dynamically
+ * @SKL_TKN_U8_DYN_OUT_PIN:     Configure Output pin dynamically
  *                              if true
  *
- * %SKL_TKN_U8_IN_QUEUE_COUNT:  Store the number of Input pins
+ * @SKL_TKN_U8_IN_QUEUE_COUNT:  Store the number of Input pins
  *
- * %SKL_TKN_U8_OUT_QUEUE_COUNT: Store the number of Output pins
+ * @SKL_TKN_U8_OUT_QUEUE_COUNT: Store the number of Output pins
  *
- * %SKL_TKN_U8_TIME_SLOT:       TDM slot number
+ * @SKL_TKN_U8_TIME_SLOT:       TDM slot number
  *
- * %SKL_TKN_U8_CORE_ID:         Stores module affinity value.Can take
+ * @SKL_TKN_U8_CORE_ID:         Stores module affinity value. Can take
  *                              the values:
  *                              SKL_AFFINITY_CORE_0 = 0,
  *                              SKL_AFFINITY_CORE_1,
  *                              SKL_AFFINITY_CORE_MAX
  *
- * %SKL_TKN_U8_MOD_TYPE:        Module type value.
+ * @SKL_TKN_U8_MOD_TYPE:        Module type value.
  *
- * %SKL_TKN_U8_CONN_TYPE:       Module connection type can be a FE,
+ * @SKL_TKN_U8_CONN_TYPE:       Module connection type can be a FE,
  *                              BE or NONE as defined :
  *                              SKL_PIPE_CONN_TYPE_NONE = 0,
  *                              SKL_PIPE_CONN_TYPE_FE = 1 (HOST_DMA)
  *                              SKL_PIPE_CONN_TYPE_BE = 2 (LINK_DMA)
  *
- * %SKL_TKN_U8_DEV_TYPE:        Type of device to which the module is
+ * @SKL_TKN_U8_DEV_TYPE:        Type of device to which the module is
  *                              connected
  *                              Can take the values:
  *                              SKL_DEVICE_BT = 0x0,
@@ -56,43 +60,43 @@
  *                              SKL_DEVICE_HDAHOST = 0x5,
  *                              SKL_DEVICE_NONE
  *
- * %SKL_TKN_U8_HW_CONN_TYPE:    Connection type of the HW to which the
+ * @SKL_TKN_U8_HW_CONN_TYPE:    Connection type of the HW to which the
  *                              module is connected
  *                              SKL_CONN_NONE = 0,
  *                              SKL_CONN_SOURCE = 1,
  *                              SKL_CONN_SINK = 2
  *
- * %SKL_TKN_U16_PIN_INST_ID:    Stores the pin instance id
+ * @SKL_TKN_U16_MOD_INST_ID:    Stores the module instance id
  *
- * %SKL_TKN_U16_MOD_INST_ID:    Stores the mdule instance id
+ * @SKL_TKN_U16_BLOCK_SIZE:     FIXME
  *
- * %SKL_TKN_U32_MAX_MCPS:       Module max mcps value
+ * @SKL_TKN_U32_MAX_MCPS:       Module max mcps value
  *
- * %SKL_TKN_U32_MEM_PAGES:      Module resource pages
+ * @SKL_TKN_U32_MEM_PAGES:      Module resource pages
  *
- * %SKL_TKN_U32_OBS:            Stores Output Buffer size
+ * @SKL_TKN_U32_OBS:            Stores Output Buffer size
  *
- * %SKL_TKN_U32_IBS:            Stores input buffer size
+ * @SKL_TKN_U32_IBS:            Stores input buffer size
  *
- * %SKL_TKN_U32_VBUS_ID:        Module VBUS_ID. PDM=0, SSP0=0,
+ * @SKL_TKN_U32_VBUS_ID:        Module VBUS_ID. PDM=0, SSP0=0,
  *                              SSP1=1,SSP2=2,
  *                              SSP3=3, SSP4=4,
  *                              SSP5=5, SSP6=6,INVALID
  *
- * %SKL_TKN_U32_PARAMS_FIXUP:   Module Params fixup mask
- * %SKL_TKN_U32_CONVERTER:      Module params converter mask
- * %SKL_TKN_U32_PIPE_ID:        Stores the pipe id
+ * @SKL_TKN_U32_PARAMS_FIXUP:   Module Params fixup mask
+ * @SKL_TKN_U32_CONVERTER:      Module params converter mask
+ * @SKL_TKN_U32_PIPE_ID:        Stores the pipe id
  *
- * %SKL_TKN_U32_PIPE_CONN_TYPE: Type of the token to which the pipe is
- *                              connected to. It can be
+ * @SKL_TKN_U32_PIPE_CONN_TYPE: Type of the token to which the pipe is
+ *                              connected. It can be
  *                              SKL_PIPE_CONN_TYPE_NONE = 0,
  *                              SKL_PIPE_CONN_TYPE_FE = 1 (HOST_DMA),
  *                              SKL_PIPE_CONN_TYPE_BE = 2 (LINK_DMA),
  *
- * %SKL_TKN_U32_PIPE_PRIORITY:  Pipe priority value
- * %SKL_TKN_U32_PIPE_MEM_PGS:   Pipe resource pages
+ * @SKL_TKN_U32_PIPE_PRIORITY:  Pipe priority value
+ * @SKL_TKN_U32_PIPE_MEM_PGS:   Pipe resource pages
  *
- * %SKL_TKN_U32_DIR_PIN_COUNT:  Value for the direction to set input/output
+ * @SKL_TKN_U32_DIR_PIN_COUNT:  Value for the direction to set input/output
  *                              formats and the pin count.
  *                              The first 4 bits have the direction
  *                              value and the next 4 have
@@ -104,23 +108,23 @@
  *                              and output made by reading direction
  *                              token.
  *
- * %SKL_TKN_U32_FMT_CH:         Supported channel count
+ * @SKL_TKN_U32_FMT_CH:         Supported channel count
  *
- * %SKL_TKN_U32_FMT_FREQ:       Supported frequency/sample rate
+ * @SKL_TKN_U32_FMT_FREQ:       Supported frequency/sample rate
  *
- * %SKL_TKN_U32_FMT_BIT_DEPTH:  Supported container size
+ * @SKL_TKN_U32_FMT_BIT_DEPTH:  Supported container size
  *
- * %SKL_TKN_U32_FMT_SAMPLE_SIZE:Number of samples in the container
+ * @SKL_TKN_U32_FMT_SAMPLE_SIZE:Number of samples in the container
  *
- * %SKL_TKN_U32_FMT_CH_CONFIG:  Supported channel configurations for the
+ * @SKL_TKN_U32_FMT_CH_CONFIG:  Supported channel configurations for the
  *                              input/output.
  *
- * %SKL_TKN_U32_FMT_INTERLEAVE: Interleaving style which can be per
+ * @SKL_TKN_U32_FMT_INTERLEAVE: Interleaving style which can be per
  *                              channel or per sample. The values can be :
  *                              SKL_INTERLEAVING_PER_CHANNEL = 0,
  *                              SKL_INTERLEAVING_PER_SAMPLE = 1,
  *
- * %SKL_TKN_U32_FMT_SAMPLE_TYPE:
+ * @SKL_TKN_U32_FMT_SAMPLE_TYPE:
  *                              Specifies the sample type. Can take the
  *                              values: SKL_SAMPLE_TYPE_INT_MSB = 0,
  *                              SKL_SAMPLE_TYPE_INT_LSB = 1,
@@ -128,104 +132,109 @@
  *                              SKL_SAMPLE_TYPE_INT_UNSIGNED = 3,
  *                              SKL_SAMPLE_TYPE_FLOAT = 4
  *
- * %SKL_TKN_U32_CH_MAP:         Channel map values
- * %SKL_TKN_U32_MOD_SET_PARAMS: It can take these values:
+ * @SKL_TKN_U32_FMT_CH_MAP:     Channel map values
+ * @SKL_TKN_U32_PIN_MOD_ID:     FIXME
+ * @SKL_TKN_U32_PIN_INST_ID:    FIXME
+ * @SKL_TKN_U32_MOD_SET_PARAMS: It can take these values:
  *                              SKL_PARAM_DEFAULT, SKL_PARAM_INIT,
  *                              SKL_PARAM_SET, SKL_PARAM_BIND
  *
- * %SKL_TKN_U32_MOD_PARAM_ID:   ID of the module params
+ * @SKL_TKN_U32_MOD_PARAM_ID:   ID of the module params
  *
- * %SKL_TKN_U32_CAPS_SET_PARAMS:
+ * @SKL_TKN_U32_CAPS_SET_PARAMS:
  *                              Set params value
  *
- * %SKL_TKN_U32_CAPS_PARAMS_ID: Params ID
+ * @SKL_TKN_U32_CAPS_PARAMS_ID: Params ID
  *
- * %SKL_TKN_U32_CAPS_SIZE:      Caps size
+ * @SKL_TKN_U32_CAPS_SIZE:      Caps size
  *
- * %SKL_TKN_U32_PROC_DOMAIN:    Specify processing domain
+ * @SKL_TKN_U32_PROC_DOMAIN:    Specify processing domain
  *
- * %SKL_TKN_U32_LIB_COUNT:      Specifies the number of libraries
+ * @SKL_TKN_U32_LIB_COUNT:      Specifies the number of libraries
  *
- * %SKL_TKN_STR_LIB_NAME:       Specifies the library name
+ * @SKL_TKN_STR_LIB_NAME:       Specifies the library name
  *
- * %SKL_TKN_U32_PMODE:		Specifies the power mode for pipe
+ * @SKL_TKN_U32_PMODE:		Specifies the power mode for pipe
  *
- * %SKL_TKL_U32_D0I3_CAPS:	Specifies the D0i3 capability for module
+ * @SKL_TKL_U32_D0I3_CAPS:	Specifies the D0i3 capability for module (typo)
+ * @SKL_TKN_U32_D0I3_CAPS:      Specifies the D0i3 capability for module
  *
- * %SKL_TKN_U32_DMA_BUF_SIZE:	DMA buffer size in millisec
+ * @SKL_TKN_U32_DMA_BUF_SIZE:	DMA buffer size in millisec
  *
- * %SKL_TKN_U32_PIPE_DIR:       Specifies pipe direction. Can be
+ * @SKL_TKN_U32_PIPE_DIRECTION: Specifies pipe direction. Can be
  *                              playback/capture.
  *
- * %SKL_TKN_U32_NUM_CONFIGS:    Number of pipe configs
+ * @SKL_TKN_U32_NUM_CONFIGS:    Number of pipe configs
  *
- * %SKL_TKN_U32_PATH_MEM_PGS:   Size of memory (in pages) required for pipeline
+ * @SKL_TKN_U32_PATH_MEM_PGS:   Size of memory (in pages) required for pipeline
  *                              and its data
  *
- * %SKL_TKN_U32_PIPE_CONFIG_ID: Config id for the modules in the pipe
+ * @SKL_TKN_U32_PIPE_CONFIG_ID: Config id for the modules in the pipe
  *                              and PCM params supported by that pipe
  *                              config. This is used as index to fill
  *                              up the pipe config and module config
  *                              structure.
  *
- * %SKL_TKN_U32_CFG_FREQ:
- * %SKL_TKN_U8_CFG_CHAN:
- * %SKL_TKN_U8_CFG_BPS:         PCM params (freq, channels, bits per sample)
+ * @SKL_TKN_U32_CFG_FREQ:       FIXME
+ * @SKL_TKN_U8_CFG_CHAN:        FIXME
+ * @SKL_TKN_U8_CFG_BPS:         PCM params (freq, channels, bits per sample)
  *                              supported for each of the pipe configs.
  *
- * %SKL_TKN_CFG_MOD_RES_ID:     Module's resource index for each of the
+ * @SKL_TKN_CFG_MOD_RES_ID:     Module's resource index for each of the
  *                              pipe config
  *
- * %SKL_TKN_CFG_MOD_FMT_ID:     Module's interface index for each of the
+ * @SKL_TKN_CFG_MOD_FMT_ID:     Module's interface index for each of the
  *                              pipe config
  *
- * %SKL_TKN_U8_NUM_MOD:         Number of modules in the manifest
+ * @SKL_TKN_U8_NUM_MOD:         Number of modules in the manifest
  *
- * %SKL_TKN_MM_U8_MOD_IDX:      Current index of the module in the manifest
+ * @SKL_TKN_MM_U8_MOD_IDX:      Current index of the module in the manifest
  *
- * %SKL_TKN_MM_U8_NUM_RES:      Number of resources for the module
+ * @SKL_TKN_MM_U8_NUM_RES:      Number of resources for the module
  *
- * %SKL_TKN_MM_U8_NUM_INTF:     Number of interfaces for the module
+ * @SKL_TKN_MM_U8_NUM_INTF:     Number of interfaces for the module
  *
- * %SKL_TKN_MM_U32_RES_ID:      Resource index for the resource info to
+ * @SKL_TKN_MM_U32_RES_ID:      Resource index for the resource info to
  *                              be filled into.
  *                              A module can support multiple resource
- *                              configuration and is represnted as a
+ *                              configuration and is represented as a
  *                              resource table. This index is used to
  *                              fill information into appropriate index.
  *
- * %SKL_TKN_MM_U32_CPS:         DSP cycles per second
+ * @SKL_TKN_MM_U32_CPS:         DSP cycles per second
  *
- * %SKL_TKN_MM_U32_DMA_SIZE:    Allocated buffer size for gateway DMA
+ * @SKL_TKN_MM_U32_DMA_SIZE:    Allocated buffer size for gateway DMA
  *
- * %SKL_TKN_MM_U32_CPC:         DSP cycles allocated per frame
+ * @SKL_TKN_MM_U32_CPC:         DSP cycles allocated per frame
  *
- * %SKL_TKN_MM_U32_RES_PIN_ID:  Resource pin index in the module
+ * @SKL_TKN_MM_U32_RES_PIN_ID:  Resource pin index in the module
  *
- * %SKL_TKN_MM_U32_INTF_PIN_ID: Interface index in the module
+ * @SKL_TKN_MM_U32_INTF_PIN_ID: Interface index in the module
  *
- * %SKL_TKN_MM_U32_PIN_BUF:     Buffer size of the module pin
+ * @SKL_TKN_MM_U32_PIN_BUF:     Buffer size of the module pin
  *
- * %SKL_TKN_MM_U32_FMT_ID:      Format index for each of the interface/
+ * @SKL_TKN_MM_U32_FMT_ID:      Format index for each of the interface/
  *                              format information to be filled into.
  *
- * %SKL_TKN_MM_U32_NUM_IN_FMT:  Number of input formats
- * %SKL_TKN_MM_U32_NUM_OUT_FMT: Number of output formats
+ * @SKL_TKN_MM_U32_NUM_IN_FMT:  Number of input formats
+ * @SKL_TKN_MM_U32_NUM_OUT_FMT: Number of output formats
  *
- * %SKL_TKN_U32_ASTATE_IDX:     Table Index for the A-State entry to be filled
+ * @SKL_TKN_U32_ASTATE_IDX:     Table Index for the A-State entry to be filled
  *                              with kcps and clock source
  *
- * %SKL_TKN_U32_ASTATE_COUNT:   Number of valid entries in A-State table
+ * @SKL_TKN_U32_ASTATE_COUNT:   Number of valid entries in A-State table
  *
- * %SKL_TKN_U32_ASTATE_KCPS:    Specifies the core load threshold (in kilo
+ * @SKL_TKN_U32_ASTATE_KCPS:    Specifies the core load threshold (in kilo
  *                              cycles per second) below which DSP is clocked
  *                              from source specified by clock source.
  *
- * %SKL_TKN_U32_ASTATE_CLK_SRC: Clock source for A-State entry
+ * @SKL_TKN_U32_ASTATE_CLK_SRC: Clock source for A-State entry
+ *
+ * @SKL_TKN_U32_FMT_CFG_IDX:    Format config index
  *
- * %SKL_TKN_U32_FMT_CFG_IDX:    Format config index
+ * @SKL_TKN_MAX:                Max value for enum SKL_TKNS
  *
- * module_id and loadable flags dont have tokens as these values will be
+ * module_id and loadable flags don't have tokens as these values will be
  * read from the DSP FW manifest
  *
  * Tokens defined can be used either in the manifest or widget private data.

