Return-Path: <linux-arm-msm+bounces-64522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F4B01823
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3841CA0126
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEA527BF84;
	Fri, 11 Jul 2025 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kc9uqdnH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269D827E077
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226643; cv=none; b=I78CaDUm2tcum33scfCDKSYP/SRUtXMqEQofstLEx5ZKh9B/vUs/V8VfFyK53k5RcVMAl1OGNAihVc3Uro7ChS90AeoDNpCsE073JkXDAj2mW/RhubBSNSf9jL+sWXZkFN2idxfXP3cYqENsjsojrVs6O2qzxgmkBk0VbIvhmQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226643; c=relaxed/simple;
	bh=atnTHiewC1xCmy/qyvfr5dfWTSiO6aJ9sJe0l5ek+ro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FSBDZRsMqQ+z0/LHOX1VpeFp4gfOOEhatdsIGFLfpPsI2BpDxjhpyr5aQ0NXaM8Jr21QowRbIloyV1jcqWZr/qJurPWCD3fLjbPLJFMuMoLMBlW4HHnV70YS4O/yzJHzDl/84xbUzvys1QOUYfaLWzihZdjCXTzfJVhACL+2U9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kc9uqdnH; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so11234755e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752226640; x=1752831440; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyMo9zKfU1sUBA0BOjzI2p8EGc7Cd9FXwBdhaBOmmwY=;
        b=kc9uqdnHdA2TWjwCvrJI/3gHSyLP2JqdO01j7n8tfiB1eFe85bXsXvCTxHOH5/jAgg
         pFTgsOgL9cZeDW58YMy0kBPzowK/T6QDd1dmLKhNW6a/aGAnx0+ougUstogenbPh3yth
         whOvzwkx5KZJFq+pyb2jnAeePxLAMF4cgD0ND1W55QxwxL9u1oWD5LcqzDouPH2xDem0
         mw29uZUpB1JzRp4fvj1dRhNwC9vTDgqmNOU1e03M8hFss3BGWd+6NfSM5wo/vsJvOL1g
         07yLU72l0uHN6EOiX1Ws27EUM6lReGLK75cRsLFKmuEQQpVnKQxLeZazGCJqAgY+n7TA
         Ss9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226640; x=1752831440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyMo9zKfU1sUBA0BOjzI2p8EGc7Cd9FXwBdhaBOmmwY=;
        b=Y02Q/uu3R4N5Amu+Pyvm1fqmCfYaU2PlnhKcIsTB2V/nG/Po7HktaAgo3/BpiF1pWR
         WX3NSKuEJsE+gVXewickgUBAnORafVXI3RM/U03Sqt1+PmshlzyIwceQiJJFaXiO2DSy
         +reVqvJQRNbHoxh6iJrelHNi6wmsPb1qAgwIOCZM744EnB8H6oli2GG6oGHw7dJlvRC9
         +yRNBPr0+bn3M3a2OI9AJxFS2kncebl8CeYBolLTnvGYKkEsBDxT/lfIoL2wP6+5XShL
         TpcbDMgMwMz6rST2rsC1HIuQu9NEnx49lvWykXPlShZaLxkqsr1NHeq/0rQNidw+rdAc
         Gc3A==
X-Forwarded-Encrypted: i=1; AJvYcCUe+uJbQsFI4+8IRoGq4oDkSzYQTzh31QeA8BTTxyfToe0TFSew0UMdMmvL/9g6BO3dejZnPr8jB49bmX8u@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpYyVSddxQ/6Cp2/gPSXa0O50eMG+Z2nfVqPfDcHqtvvKbvdW
	gvSwtBO1wl5QR8fCP9QzyMwGU8LUS3uHc3Jk9Qm+WPZEc6IQp81jFDlxFK/gMz8GfHnggOa/EEv
	e5fBN1Q6UdG/dia3KIA==
X-Google-Smtp-Source: AGHT+IGkFa1awjG9LOYkbAB1rrv/t1xS4FURqpEoi3ZhrWLDYJ7bMjZ3iWrbqN63RoLLbaFSUEG6qVEShxpv5T8=
X-Received: from wmth6.prod.google.com ([2002:a05:600c:8b66:b0:442:f4a3:b8f5])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6305:b0:450:cfcb:5c9b with SMTP id 5b1f17b1804b1-454ec15a964mr20354655e9.1.1752226640523;
 Fri, 11 Jul 2025 02:37:20 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:36:28 +0100
In-Reply-To: <20250711093636.28204-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711093636.28204-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711093636.28204-3-verhaegen@google.com>
Subject: [PATCH v2 2/4] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
From: Joris Verhaegen <verhaegen@google.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Joris Verhaegen <verhaegen@google.com>, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	David Li <dvdli@google.com>, Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"

The previous patch introduced the internal infrastructure for handling
64-bit timestamps. This patch exposes this capability to user-space.

Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
applications to fetch the overflow-safe struct snd_compr_tstamp64.

The ioctl dispatch table is updated to handle the new command by
calling a new snd_compr_tstamp64 handler, while the legacy path is
renamed to snd_compr_tstamp32 for clarity.

Signed-off-by: Joris Verhaegen <verhaegen@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Reviewed-by: David Li <dvdli@google.com>
Reviewed-by: Miller Liang <millerliang@google.com>
---
 include/uapi/sound/compress_offload.h |  2 ++
 sound/core/compress_offload.c         | 50 +++++++++++++++++++++++----
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index abd0ea3f86ee..2758d9ee3d91 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -208,6 +208,7 @@ struct snd_compr_task_status {
  * Note: only codec params can be changed runtime and stream params cant be
  * SNDRV_COMPRESS_GET_PARAMS: Query codec params
  * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
+ * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
  * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
  * This also queries the tstamp properties
  * SNDRV_COMPRESS_PAUSE: Pause the running stream
@@ -230,6 +231,7 @@ struct snd_compr_task_status {
 						 struct snd_compr_metadata)
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
+#define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 6a8873bd62ae..40c1e69961b7 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -211,8 +211,8 @@ snd_compr_tstamp32_from_64(struct snd_compr_tstamp *tstamp32,
 	tstamp32->sampling_rate = tstamp64->sampling_rate;
 }
 
-static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
-		struct snd_compr_tstamp *tstamp)
+static int snd_compr_update_tstamp32(struct snd_compr_stream *stream,
+				     struct snd_compr_tstamp *tstamp)
 {
 	u64 copied_total64;
 	struct snd_compr_tstamp64 tstamp64;
@@ -238,11 +238,30 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 	return 0;
 }
 
+static int snd_compr_update_tstamp64(struct snd_compr_stream *stream,
+				     struct snd_compr_tstamp64 *tstamp)
+{
+	int retval = snd_compr_get_tstamp64(stream, tstamp);
+
+	if (retval != 0)
+		return retval;
+
+	pr_debug("dsp consumed till %u total %llu bytes\n", tstamp->byte_offset,
+		 tstamp->copied_total);
+
+	if (stream->direction == SND_COMPRESS_PLAYBACK)
+		stream->runtime->total_bytes_transferred = tstamp->copied_total;
+	else
+		stream->runtime->total_bytes_available = tstamp->copied_total;
+
+	return 0;
+}
+
 static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 		struct snd_compr_avail *avail)
 {
 	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp(stream, &avail->tstamp);
+	snd_compr_update_tstamp32(stream, &avail->tstamp);
 	/* Still need to return avail even if tstamp can't be filled in */
 
 	if (stream->runtime->total_bytes_available == 0 &&
@@ -769,19 +788,34 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 	return retval;
 }
 
-static inline int
-snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
+static inline int snd_compr_tstamp32(struct snd_compr_stream *stream,
+				     unsigned long arg)
 {
 	struct snd_compr_tstamp tstamp = {0};
 	int ret;
 
-	ret = snd_compr_update_tstamp(stream, &tstamp);
+	ret = snd_compr_update_tstamp32(stream, &tstamp);
 	if (ret == 0)
 		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
 			&tstamp, sizeof(tstamp)) ? -EFAULT : 0;
 	return ret;
 }
 
+static inline int snd_compr_tstamp64(struct snd_compr_stream *stream,
+				     unsigned long arg)
+{
+	struct snd_compr_tstamp64 tstamp = { 0 };
+	int ret;
+
+	ret = snd_compr_update_tstamp64(stream, &tstamp);
+	if (ret == 0)
+		ret = copy_to_user((struct snd_compr_tstamp64 __user *)arg,
+				   &tstamp, sizeof(tstamp)) ?
+			      -EFAULT :
+			      0;
+	return ret;
+}
+
 static int snd_compr_pause(struct snd_compr_stream *stream)
 {
 	int retval;
@@ -1355,7 +1389,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 
 	switch (_IOC_NR(cmd)) {
 	case _IOC_NR(SNDRV_COMPRESS_TSTAMP):
-		return snd_compr_tstamp(stream, arg);
+		return snd_compr_tstamp32(stream, arg);
+	case _IOC_NR(SNDRV_COMPRESS_TSTAMP64):
+		return snd_compr_tstamp64(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_AVAIL):
 		return snd_compr_ioctl_avail(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_PAUSE):
-- 
2.50.0.727.gbf7dc18ff4-goog


