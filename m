Return-Path: <linux-arm-msm+bounces-64521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B110B01821
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EC03767BFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4362627E058;
	Fri, 11 Jul 2025 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ebuAlyLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626822FDFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226637; cv=none; b=mRgE+/ixQk6fJcKDxQHwHPPeEbnSBtzh+3jmgVOA5861ANO5a/7+9x5Gz3o2X3i+wLB7B0XjgoyRKyh4RKKw6XUGco89WqpDy1e4jGRTB/wnuCvnguHwm+pEAywwfQNoc6hS9BHks72DB152dnh66Cj2L73vp1AciM8VBNFJNRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226637; c=relaxed/simple;
	bh=BF4pLdBjpwXhp9214H0A3l/lQbnRhG7cLFEFj657yF8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s4kVcgKX5Y4hHbrdFg9FAXjAyHAl8Mh3Wuce7cmX6iVmUYxfJ6f7AfG8XdO8Vg4zsiD8JCKyFtrFeHU4dnqDjV8mUxaQtjVtVl5Ne0MCj2iO23b5IqYfM6ISxz/y3ABmdJpGAHyNjktzFYtJ0FT1Izrb5mVshya79gTW6nxODoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ebuAlyLv; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6077833ae13so1579394a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 02:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752226633; x=1752831433; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBhpozoKO994tZaJby3EUAdOYCx2fn320yq/NpQfjfg=;
        b=ebuAlyLvQ9/mByoP9sjoRlXpDJoFV4kSmZV/3z9BXaA0j4eiL5jRndcJus51Mtt4hu
         OvxFtceeJvwgvPIb8demYbc5kK7uupB5c5JrEww8joWjvNxFsVr/RXwMa6kfz9B+viNh
         URq6/X47FXCZEtOCROfAUMsLFyS/gIvMr2x1BVUkIXnni/M06+euaMyRzGbXvc1/DgrG
         2fG847ARPT7gwqquCI/xVoh2IguMePkm/pZgPmHDVzfxRJBNUOCcipX5ZW+2zm12sMBQ
         67v0KiBad+l0eZiTJwHK5zly6zC6YazNJAHY67MLqVrMzaNdutuqKosz1L/Esxbnmx+L
         DJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226633; x=1752831433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBhpozoKO994tZaJby3EUAdOYCx2fn320yq/NpQfjfg=;
        b=ripU9IuBsDKZk3se2xOJ7jWfW9hU4EgSpNzT6IMBRXx0+NCxRnT2lZtEd2BscfnKDo
         gXS3U3TsAsMM75nC0nXAEWcifRVKB4qU3XOy5fsyaeQbPVz61VJ9w77/XUSutRBHISdN
         GiM3DySIUN0YOhyykNbNUiBUlqAz5r8z7Wi7nJOE/t8Gx8fCZEK5bKk7EPajQPClGzyG
         vAHKW0RXX7ifQnYjSZguK5NtZLAJVLBjWgtVlBRngmskM4lSQJwCj1uScR1IhSihNrol
         zcD0iVTTLi8IvAEghkbi0koOsAfiyvMPOKpEfsJ51ZbtrgogDRptQa10uFhk8R+J1tRy
         zypg==
X-Forwarded-Encrypted: i=1; AJvYcCUlZRJOsaHFlMCZ4CQ/IQPvPV0JiwszhwOwVlno5bDf9bhJ4vscTUVZnbTam8nRVB+Q0dONAM88gqvIBk6J@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4wPRGSBCNQAu5KI5d8/irAJeszZ6wvtmxQBVxcELXbBeu0v6
	BGy6Sb/pkf6tJvkNnuC5h0XR2nRMUXtpaPIOG9H8Ih96H5dDbLNBD+JmR/Np6Xhy5Z9MxgpMEtq
	QacG1EXnOloM0KXOBnQ==
X-Google-Smtp-Source: AGHT+IGIdc1uDMfWkRcYXH2QBFFa8MaZ4zaOUnOEybovNZBaLXnRsrqkGYBocqlyoisFxGvLN/JgmGhrEpyjbXY=
X-Received: from ejaw15.prod.google.com ([2002:a17:906:33cf:b0:ae4:a43:f265])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:970f:b0:ae0:da2d:44b9 with SMTP id a640c23a62f3a-ae6fbc2654fmr271916766b.7.1752226632845;
 Fri, 11 Jul 2025 02:37:12 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:36:27 +0100
In-Reply-To: <20250711093636.28204-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711093636.28204-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711093636.28204-2-verhaegen@google.com>
Subject: [PATCH v2 1/4] ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
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

The copied_total field in struct snd_compr_tstamp is a 32-bit
value that can overflow on long-running high-bitrate streams,
leading to incorrect calculations for buffer availablility.

This patch adds a 64-bit safe timestamping mechanism.
It introduces struct snd_compr_tstamp64 in the UAPI
header which uses __u64 for cumulative counters.

A new .pointer64 operation is added to the relevant ASoC and core
compress ops structures. Corresponding ASoC wrapper functions are also
added.

The core timestamping logic is refactored to use u64 for its
internal total_bytes_transferred counter, fixing the internal
state overflow. The logic now attempts to use the new .pointer64
op first, falling back to the legacy 32-bit path if the new op is
not implemented by a driver.

Signed-off-by: Joris Verhaegen <verhaegen@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Reviewed-by: David Li <dvdli@google.com>
Reviewed-by: Miller Liang <millerliang@google.com>
---
 include/sound/compress_driver.h       |  3 ++
 include/sound/soc-component.h         |  5 ++
 include/sound/soc-dai.h               |  6 +++
 include/uapi/sound/compress_offload.h | 19 +++++++
 sound/core/compress_offload.c         | 78 +++++++++++++++++++++------
 sound/soc/soc-component.c             | 20 +++++++
 sound/soc/soc-compress.c              | 21 ++++++++
 sound/soc/soc-dai.c                   | 14 +++++
 8 files changed, 150 insertions(+), 16 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index b55c9eeb2b54..a047ff14a420 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -136,6 +136,7 @@ struct snd_compr_stream {
  * @trigger: Trigger operations like start, pause, resume, drain, stop.
  * This callback is mandatory
  * @pointer: Retrieve current h/w pointer information. Mandatory
+ * @pointer64: Retrieve current h/w pointer information in 64 bit. Optional
  * @copy: Copy the compressed data to/from userspace, Optional
  * Can't be implemented if DSP supports mmap
  * @mmap: DSP mmap method to mmap DSP memory
@@ -162,6 +163,8 @@ struct snd_compr_ops {
 	int (*trigger)(struct snd_compr_stream *stream, int cmd);
 	int (*pointer)(struct snd_compr_stream *stream,
 			struct snd_compr_tstamp *tstamp);
+	int (*pointer64)(struct snd_compr_stream *stream,
+			 struct snd_compr_tstamp64 *tstamp);
 	int (*copy)(struct snd_compr_stream *stream, char __user *buf,
 		       size_t count);
 	int (*mmap)(struct snd_compr_stream *stream,
diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61534ac0edd1..07d9f0ff7b1c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -48,6 +48,9 @@ struct snd_compress_ops {
 	int (*pointer)(struct snd_soc_component *component,
 		       struct snd_compr_stream *stream,
 		       struct snd_compr_tstamp *tstamp);
+	int (*pointer64)(struct snd_soc_component *component,
+			 struct snd_compr_stream *stream,
+			 struct snd_compr_tstamp64 *tstamp);
 	int (*copy)(struct snd_soc_component *component,
 		    struct snd_compr_stream *stream, char __user *buf,
 		    size_t count);
@@ -500,6 +503,8 @@ int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream *cstream,
 int snd_soc_component_compr_ack(struct snd_compr_stream *cstream, size_t bytes);
 int snd_soc_component_compr_pointer(struct snd_compr_stream *cstream,
 				    struct snd_compr_tstamp *tstamp);
+int snd_soc_component_compr_pointer64(struct snd_compr_stream *cstream,
+				      struct snd_compr_tstamp64 *tstamp);
 int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 				 char __user *buf, size_t count);
 int snd_soc_component_compr_set_metadata(struct snd_compr_stream *cstream,
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index d19ab5572d2b..8ecfa966e28a 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -257,6 +257,9 @@ int snd_soc_dai_compr_ack(struct snd_soc_dai *dai,
 int snd_soc_dai_compr_pointer(struct snd_soc_dai *dai,
 			      struct snd_compr_stream *cstream,
 			      struct snd_compr_tstamp *tstamp);
+int snd_soc_dai_compr_pointer64(struct snd_soc_dai *dai,
+				struct snd_compr_stream *cstream,
+				struct snd_compr_tstamp64 *tstamp);
 int snd_soc_dai_compr_set_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata);
@@ -385,6 +388,9 @@ struct snd_soc_cdai_ops {
 			struct snd_soc_dai *);
 	int (*pointer)(struct snd_compr_stream *,
 			struct snd_compr_tstamp *, struct snd_soc_dai *);
+	int (*pointer64)(struct snd_compr_stream *cstream,
+			 struct snd_compr_tstamp64 *tstamp,
+			 struct snd_soc_dai *dai);
 	int (*ack)(struct snd_compr_stream *, size_t,
 			struct snd_soc_dai *);
 };
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index d62eb93af0ed..abd0ea3f86ee 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -56,6 +56,25 @@ struct snd_compr_tstamp {
 	__u32 sampling_rate;
 } __attribute__((packed, aligned(4)));
 
+/**
+ * struct snd_compr_tstamp64 - timestamp descriptor with fields in 64 bit
+ * @byte_offset: Byte offset in ring buffer to DSP
+ * @copied_total: Total number of bytes copied from/to ring buffer to/by DSP
+ * @pcm_frames: Frames decoded or encoded by DSP. This field will evolve by
+ *	large steps and should only be used to monitor encoding/decoding
+ *	progress. It shall not be used for timing estimates.
+ * @pcm_io_frames: Frames rendered or received by DSP into a mixer or an audio
+ * output/input. This field should be used for A/V sync or time estimates.
+ * @sampling_rate: sampling rate of audio
+ */
+struct snd_compr_tstamp64 {
+	__u32 byte_offset;
+	__u64 copied_total;
+	__u64 pcm_frames;
+	__u64 pcm_io_frames;
+	__u32 sampling_rate;
+} __attribute__((packed, aligned(4)));
+
 /**
  * struct snd_compr_avail - avail descriptor
  * @avail: Number of bytes available in ring buffer for writing/reading
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 840bb9cfe789..6a8873bd62ae 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -176,18 +176,65 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	return 0;
 }
 
+static int snd_compr_get_tstamp64(struct snd_compr_stream *stream,
+				  struct snd_compr_tstamp64 *tstamp)
+{
+	struct snd_compr_tstamp64 tstamp64_zero;
+
+	memset(tstamp, 0, sizeof(*tstamp));
+	memset(&tstamp64_zero, 0, sizeof(tstamp64_zero));
+
+	if (!stream->ops->pointer64)
+		return -EOPNOTSUPP;
+	stream->ops->pointer64(stream, tstamp);
+
+	/**
+	 * Even if pointer64 is non-null, the driver call may not have been implemented
+	 * (due to indirection in soc-component.c).
+	 * Check that the call was successful by verifying that tstamp is not all zero.
+	 */
+	if (memcmp(tstamp, &tstamp64_zero, sizeof(*tstamp)) == 0) {
+		pr_debug("no tstamp returned from pointer64\n");
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static void
+snd_compr_tstamp32_from_64(struct snd_compr_tstamp *tstamp32,
+			   const struct snd_compr_tstamp64 *tstamp64)
+{
+	tstamp32->byte_offset = tstamp64->byte_offset;
+	tstamp32->copied_total = (u32)tstamp64->copied_total;
+	tstamp32->pcm_frames = (u32)tstamp64->pcm_frames;
+	tstamp32->pcm_io_frames = (u32)tstamp64->pcm_io_frames;
+	tstamp32->sampling_rate = tstamp64->sampling_rate;
+}
+
 static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 		struct snd_compr_tstamp *tstamp)
 {
-	if (!stream->ops->pointer)
-		return -ENOTSUPP;
-	stream->ops->pointer(stream, tstamp);
-	pr_debug("dsp consumed till %d total %d bytes\n",
-		tstamp->byte_offset, tstamp->copied_total);
+	u64 copied_total64;
+	struct snd_compr_tstamp64 tstamp64;
+
+	/* Get 64 bit values if available. Otherwise, fallback to 32 bit. */
+	if (snd_compr_get_tstamp64(stream, &tstamp64) == 0) {
+		copied_total64 = tstamp64.copied_total;
+		snd_compr_tstamp32_from_64(tstamp, &tstamp64);
+	} else {
+		if (!stream->ops->pointer)
+			return -EOPNOTSUPP;
+		stream->ops->pointer(stream, tstamp);
+		copied_total64 = tstamp->copied_total;
+	}
+
+	pr_debug("dsp consumed till %u total %llu bytes\n", tstamp->byte_offset,
+		 copied_total64);
+
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
-		stream->runtime->total_bytes_transferred = tstamp->copied_total;
+		stream->runtime->total_bytes_transferred = copied_total64;
 	else
-		stream->runtime->total_bytes_available = tstamp->copied_total;
+		stream->runtime->total_bytes_available = copied_total64;
 	return 0;
 }
 
@@ -204,9 +251,9 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 		pr_debug("detected init and someone forgot to do a write\n");
 		return stream->runtime->buffer_size;
 	}
-	pr_debug("app wrote %lld, DSP consumed %lld\n",
-			stream->runtime->total_bytes_available,
-			stream->runtime->total_bytes_transferred);
+	pr_debug("app wrote %llu, DSP consumed %llu\n",
+		 stream->runtime->total_bytes_available,
+		 stream->runtime->total_bytes_transferred);
 	if (stream->runtime->total_bytes_available ==
 				stream->runtime->total_bytes_transferred) {
 		if (stream->direction == SND_COMPRESS_PLAYBACK) {
@@ -223,7 +270,7 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		avail->avail = stream->runtime->buffer_size - avail->avail;
 
-	pr_debug("ret avail as %lld\n", avail->avail);
+	pr_debug("ret avail as %llu\n", avail->avail);
 	return avail->avail;
 }
 
@@ -274,8 +321,7 @@ static int snd_compr_write_data(struct snd_compr_stream *stream,
 		      (app_pointer * runtime->buffer_size);
 
 	dstn = runtime->buffer + app_pointer;
-	pr_debug("copying %ld at %lld\n",
-			(unsigned long)count, app_pointer);
+	pr_debug("copying %lu at %llu\n", (unsigned long)count, app_pointer);
 	if (count < runtime->buffer_size - app_pointer) {
 		if (copy_from_user(dstn, buf, count))
 			return -EFAULT;
@@ -318,7 +364,7 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 	}
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail returned %ld\n", (unsigned long)avail);
+	pr_debug("avail returned %lu\n", (unsigned long)avail);
 	/* calculate how much we can write to buffer */
 	if (avail > count)
 		avail = count;
@@ -374,7 +420,7 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 	}
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail returned %ld\n", (unsigned long)avail);
+	pr_debug("avail returned %lu\n", (unsigned long)avail);
 	/* calculate how much we can read from buffer */
 	if (avail > count)
 		avail = count;
@@ -443,7 +489,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 #endif
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail is %ld\n", (unsigned long)avail);
+	pr_debug("avail is %lu\n", (unsigned long)avail);
 	/* check if we have at least one fragment to fill */
 	switch (runtime->state) {
 	case SNDRV_PCM_STATE_DRAINING:
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 25f5e543ae8d..7751f9fc2f1d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -656,6 +656,26 @@ int snd_soc_component_compr_pointer(struct snd_compr_stream *cstream,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_compr_pointer);
 
+int snd_soc_component_compr_pointer64(struct snd_compr_stream *cstream,
+				      struct snd_compr_tstamp64 *tstamp)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_soc_component *component;
+	int i, ret;
+
+	for_each_rtd_components(rtd, i, component) {
+		if (component->driver->compress_ops &&
+		    component->driver->compress_ops->pointer64) {
+			ret = component->driver->compress_ops->pointer64(
+				component, cstream, tstamp);
+			return soc_component_ret(component, ret);
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_compr_pointer64);
+
 int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 				 char __user *buf, size_t count)
 {
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 01d1d6bee28c..29a385d327be 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -475,6 +475,25 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 	return ret;
 }
 
+static int soc_compr_pointer64(struct snd_compr_stream *cstream,
+			       struct snd_compr_tstamp64 *tstamp)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	int ret;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	snd_soc_dpcm_mutex_lock(rtd);
+
+	ret = snd_soc_dai_compr_pointer64(cpu_dai, cstream, tstamp);
+	if (ret < 0)
+		goto out;
+
+	ret = snd_soc_component_compr_pointer64(cstream, tstamp);
+out:
+	snd_soc_dpcm_mutex_unlock(rtd);
+	return ret;
+}
+
 static int soc_compr_set_metadata(struct snd_compr_stream *cstream,
 				  struct snd_compr_metadata *metadata)
 {
@@ -513,6 +532,7 @@ static struct snd_compr_ops soc_compr_ops = {
 	.get_params	= soc_compr_get_params,
 	.trigger	= soc_compr_trigger,
 	.pointer	= soc_compr_pointer,
+	.pointer64	= soc_compr_pointer64,
 	.ack		= soc_compr_ack,
 	.get_caps	= snd_soc_component_compr_get_caps,
 	.get_codec_caps = snd_soc_component_compr_get_codec_caps,
@@ -528,6 +548,7 @@ static struct snd_compr_ops soc_compr_dyn_ops = {
 	.get_metadata	= soc_compr_get_metadata,
 	.trigger	= soc_compr_trigger_fe,
 	.pointer	= soc_compr_pointer,
+	.pointer64	= soc_compr_pointer64,
 	.ack		= soc_compr_ack,
 	.get_caps	= snd_soc_component_compr_get_caps,
 	.get_codec_caps = snd_soc_component_compr_get_codec_caps,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a210089747d0..5aadf661b65d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -784,6 +784,20 @@ int snd_soc_dai_compr_pointer(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_compr_pointer);
 
+int snd_soc_dai_compr_pointer64(struct snd_soc_dai *dai,
+				struct snd_compr_stream *cstream,
+				struct snd_compr_tstamp64 *tstamp)
+{
+	int ret = 0;
+
+	if (dai->driver->cops &&
+	    dai->driver->cops->pointer64)
+		ret = dai->driver->cops->pointer64(cstream, tstamp, dai);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_compr_pointer64);
+
 int snd_soc_dai_compr_set_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata)
-- 
2.50.0.727.gbf7dc18ff4-goog


