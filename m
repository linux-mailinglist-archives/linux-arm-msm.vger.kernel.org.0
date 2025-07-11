Return-Path: <linux-arm-msm+bounces-64506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B1B015EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B15027BBBA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 08:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E218B20D4E1;
	Fri, 11 Jul 2025 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q/jCYJrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C28202C2D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222357; cv=none; b=Q+BrY0JmXrkpze+mDsfxLmjzSqZqqnNNReg7WOHaPGgb3lozvHFLrtNfZcuoDTEtE/zLhBRPD4P5xn1R7fprQ/8ho8ydSOQPeUiwPVhY3/kfyqFWIyy/6LA8ejGv6/+fXlEuz4KcFMgRvPZkygtk1xMMc2608zAcOFqwBsXvQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222357; c=relaxed/simple;
	bh=6a+4TCE/XMdBY8XCQGqf4jLOM9sFzs2NSof6bp+3vgQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HFQmmM2r8u69ZcNPI0a/lUBGDl4oJgvjCuOL3CEO1yEgNAgreuKbpiFgICrL5Pl8UnL29YSgBqyMgHHYBa4TvJdLM5uT0KyFH4Kc72Dj9YAVJ5xEBWqDbd3BgS4DD9EATsN9fb67ij05FzZsmNcFzk/+k45/+028cYo2Uq7aCRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q/jCYJrc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso10560195e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752222354; x=1752827154; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8L1+KbxtaiQj6sn8lQLye+giidcKEKOPXNRznqTkxqk=;
        b=Q/jCYJrcpxR8y58eEanFNCTeYjhGS88FN0wkH9CC8U59cFx2BRTyCdpxMrTMjsS9tH
         Dp0GOvz03wFsRXHzdYd05RPzacnsCEnt6TQZp2G7cq//IakiI/zsHiqYWBLNKAe1PHIG
         N6TI9cVoYmWXim3/w9I2zo8CypWtBqQp2eYDTGxD1Wddq3Co+qHlNxaI/XsuGnBlRryY
         Pfu3Js7k3cTIBcKJxaiuqXp2OvW0cgz3NIR0mFako4vroeM/3Ab/62PC2rJivj2/LzYd
         UvY/6mx3IDPcwIMeWs43vYFQfonI2Ip9knPh3QD/Flq9sZmUKxiBNIFEs5OI648eGYud
         x64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222354; x=1752827154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8L1+KbxtaiQj6sn8lQLye+giidcKEKOPXNRznqTkxqk=;
        b=TqB5CfR5LTS4oHzZ21d+DolGlnMppy8jJoXjOmsDAbLrMZBMaCsBIFG+bJCiwgUbW5
         6ubTpeDSa7Ontx+IMTAur7eZ2mWLjusG0aP8MD2V4t/kmNDjktfL3akHXryXoCKFrVyu
         oH2KsjM4qG5GfIwtgDvram55nlsgLz+ukPcDeX1IbDxdhj6M3pHArY1V8ldz+hp9xY7U
         cK1X84IugpsVn0Wx1K8E1hPEpxopSUK5YmHZKy8BPaCX1WhKYQchvEYmB5lobrhluNIz
         +AlvtlT+6odFI3l2c3wocNKBaM67ZlZaKMwNMNj9/KWh2GISYubKr3B+nWrjWTYtn230
         JPxA==
X-Forwarded-Encrypted: i=1; AJvYcCVaqpITV9+NrQkEGRpi07U0QAxvnAl8G2n6bIGndXpUfgknf597F7hl7ljbAzOUkCCuU0X8oN+CHrsuKV/M@vger.kernel.org
X-Gm-Message-State: AOJu0YyurI7/N/SaO7uUPT3RqauEl5xWQ426LoDYJTTXf8IgrMUbVFCP
	kvQkkfr0PHfG2QcGTt6PivR2wQqcDkhRwBl2zW1mrYT9MfhcMd3MFGnSy3O1dLPGnrafPpeq1hF
	q1kJKWz9652+2lyDxIQ==
X-Google-Smtp-Source: AGHT+IEhhhO+Ek1toZERYmrZMeqyTAhmBuFzPDQDq9WLvA9pxxXLVvjyXL3kguu3RptTS4+kf0xbW/3oRFlCSYQ=
X-Received: from wmbeq14.prod.google.com ([2002:a05:600c:848e:b0:453:6ee6:e62a])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e83:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-454db8d8d06mr65138905e9.16.1752222354317;
 Fri, 11 Jul 2025 01:25:54 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:24:34 +0100
In-Reply-To: <20250711082441.4193295-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711082441.4193295-3-verhaegen@google.com>
Subject: [PATCH v1 2/4] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
From: George Verhaegen <verhaegen@google.com>
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

From: Joris Verhaegen <verhaegen@google.com>

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


