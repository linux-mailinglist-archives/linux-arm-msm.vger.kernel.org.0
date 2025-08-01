Return-Path: <linux-arm-msm+bounces-67326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683EBB17F40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C195B17E3A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651912264C7;
	Fri,  1 Aug 2025 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sn/FGGZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BD02253F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040489; cv=none; b=qjhCPG3Fwlw/axOdhs+xX2GG6pXOaePEEzoxzJ+dtzuRbBGifUL0Iijtk8ZbTYt/LgZDSwplomw5i7R/GzcTK+FtrETd8P7Hu/LYE/Bal7BIQOzmUeFHIDM8bu3q/Mv1T/UZXCF5+KqzOTNwBU9U0E/XY+xTBw6OXqGehoFtEu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040489; c=relaxed/simple;
	bh=MQ9xWJ7wXL9+vIspTMGijgBLPAqquSykLWJTPJPFWag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kpLBdI/dEf9wWf9KjPMbhiFHd/+HMlD4P3EarU8qWcA1/fdzQ3f/TcZk24rQbzOnTqyl2lLvTgrKmfdTjusJBZW37Gt8yAEQ0ZR1Keew6Br4aWLrmNu5bcpcOSV3Iz0GoJWcI7p+JQatRz7amqIeTq6IVe3tCge4aD4Efref12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sn/FGGZH; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-af934ce738eso42276766b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754040484; x=1754645284; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEpoCd/5Vrc0UsMdfyCsoV/QsKkhoj2J2AvTx0q7Wms=;
        b=sn/FGGZH6ff45xL4KZfeCdakGpbtcA0eSaSeUns/xE2oczOj5HefIFjCtLLabLUDib
         aN5BSmLSAIjSNzmITsHhaqYTswS2IuNWTWqTxDY2ppvYBgiyDyVyE8t0S6P95TRY0GPZ
         3FvxOGnoDcasnESkIPa54sCvUBl5ckIfR9YBqjkqvrpeEaHgaVZt1bPOjXIm609Uv+FO
         ES4Sewfd52kYuRJf0rmniOqWq0oxU+vlx0mW8/3PuSV5kYXMU24GkGPfInYxxGU7QbKs
         I07Qiwms6NTyg4G0QmeI9GNfckHA0C72ftVofUR9uwcMdVxy+fZklF0IMYd/vyVccxop
         ensA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040484; x=1754645284;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEpoCd/5Vrc0UsMdfyCsoV/QsKkhoj2J2AvTx0q7Wms=;
        b=oIGo0YccU95jmCXb8L2uZuPzq0HgV89dJbfzTAbVfPHHcwm2x4bY75jlv9gdn5FsZF
         E+HpXD/CbK9s8LGiW9vjyyCfewKHFePVo1XiiFw0/EL9FB8O7PYYkm/ytzn5VydSKSsM
         37YPg8iBGr9z32LO+82IvtWlk4csGtpWi/ZobP+wwNU9kmpJTaCawL2XU98z3wp0QfRo
         Vk5DoZP1QIC43wrBS8hfuQdTU7mRwHL6TLmajDWUEwk0Td2BcSHZ/4xH4ywZFxMahPnn
         IEJHGEjvzjRsS19K8tZlFwbpzzihW98HXdcswBt8MXwNv7m5E+8A2wmzS2UN6HmV1Lly
         hlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOHRMk4cokMPFjY947KKsGhgm39M7dmWuH8D1xv2D6WhZNE9fZV8ILqCFSYo6ASawnl7V1O+u/Joagaclk@vger.kernel.org
X-Gm-Message-State: AOJu0YzAV0FsbnPZyrriVXyeXKxQ0Lr5nTId9xbF9kb5HiFscX0DXzJN
	K+q5tkILcqC9lhMGEIXDqRp09LcC9N9T4bENFWJIGLMa4bawBdHqAk+UPRyFNcbNX8sfgmzeshc
	oHiY5RQOYNBHqVpFV0Q==
X-Google-Smtp-Source: AGHT+IEFW2c8DrOJXxM/pEGu/Zk7/Q2TM2c40KVL1RQYuNhiyI6hQCYywFePFABa7n7a+BI7NKD2lxFq89izcZ8=
X-Received: from ejctb12.prod.google.com ([2002:a17:907:8b8c:b0:ae3:50a2:7d29])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7b88:b0:ae0:d08b:e85 with SMTP id a640c23a62f3a-af93196d8f7mr206137366b.61.1754040483695;
 Fri, 01 Aug 2025 02:28:03 -0700 (PDT)
Date: Fri,  1 Aug 2025 10:27:14 +0100
In-Reply-To: <20250801092720.1845282-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801092720.1845282-2-verhaegen@google.com>
Subject: [PATCH v4 1/3] ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
From: Joris Verhaegen <verhaegen@google.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
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
	Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"

The copied_total field in struct snd_compr_tstamp is a 32-bit
value that can overflow on long-running high-bitrate streams,
leading to incorrect calculations for buffer availablility.

This patch adds a 64-bit safe timestamping mechanism.
A new UAPI struct, snd_compr_tstamp64, is added which uses 64-bit
types for byte counters. The relevant ops structures across the
ASoC and core compress code are updated to use this new struct.
ASoC drivers are updated to use u64 counters.

Internal timestamps being u64 now, a compatibility function is added
to convert the 64-bit timestamp back to the 32-bit format for legacy
ioctl callers.

Reviewed-by: Miller Liang <millerliang@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Signed-off-by: Joris Verhaegen <verhaegen@google.com>
---
 include/sound/compress_driver.h               |  2 +-
 include/sound/soc-component.h                 |  4 +-
 include/sound/soc-dai.h                       |  7 +--
 include/uapi/sound/compress_offload.h         | 19 +++++++
 sound/core/compress_offload.c                 | 52 +++++++++++++------
 sound/soc/codecs/wm_adsp.c                    |  4 +-
 sound/soc/codecs/wm_adsp.h                    |  2 +-
 .../intel/atom/sst-mfld-platform-compress.c   | 12 +++--
 sound/soc/intel/atom/sst-mfld-platform.h      |  2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c  |  9 ++--
 sound/soc/intel/avs/probes.c                  |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              | 26 ++++++----
 sound/soc/qcom/qdsp6/q6asm-dai.c              | 26 ++++++----
 sound/soc/soc-component.c                     |  2 +-
 sound/soc/soc-compress.c                      |  2 +-
 sound/soc/soc-dai.c                           |  2 +-
 sound/soc/sof/amd/acp-probes.c                |  2 +-
 sound/soc/sof/compress.c                      |  2 +-
 sound/soc/sof/intel/hda-probes.c              |  2 +-
 sound/soc/sof/sof-client-probes.c             |  2 +-
 sound/soc/sof/sof-client-probes.h             |  4 +-
 sound/soc/sprd/sprd-pcm-compress.c            |  6 +--
 sound/soc/sprd/sprd-pcm-dma.h                 |  4 +-
 sound/soc/uniphier/aio-compress.c             |  2 +-
 24 files changed, 125 insertions(+), 72 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index b55c9eeb2b54..9e3d801e45ec 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -161,7 +161,7 @@ struct snd_compr_ops {
 			struct snd_compr_metadata *metadata);
 	int (*trigger)(struct snd_compr_stream *stream, int cmd);
 	int (*pointer)(struct snd_compr_stream *stream,
-			struct snd_compr_tstamp *tstamp);
+		       struct snd_compr_tstamp64 *tstamp);
 	int (*copy)(struct snd_compr_stream *stream, char __user *buf,
 		       size_t count);
 	int (*mmap)(struct snd_compr_stream *stream,
diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61534ac0edd1..754627c6361a 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -47,7 +47,7 @@ struct snd_compress_ops {
 		       struct snd_compr_stream *stream, int cmd);
 	int (*pointer)(struct snd_soc_component *component,
 		       struct snd_compr_stream *stream,
-		       struct snd_compr_tstamp *tstamp);
+		       struct snd_compr_tstamp64 *tstamp);
 	int (*copy)(struct snd_soc_component *component,
 		    struct snd_compr_stream *stream, char __user *buf,
 		    size_t count);
@@ -499,7 +499,7 @@ int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream *cstream,
 					   struct snd_compr_codec_caps *codec);
 int snd_soc_component_compr_ack(struct snd_compr_stream *cstream, size_t bytes);
 int snd_soc_component_compr_pointer(struct snd_compr_stream *cstream,
-				    struct snd_compr_tstamp *tstamp);
+				    struct snd_compr_tstamp64 *tstamp);
 int snd_soc_component_compr_copy(struct snd_compr_stream *cstream,
 				 char __user *buf, size_t count);
 int snd_soc_component_compr_set_metadata(struct snd_compr_stream *cstream,
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index d19ab5572d2b..38ee6e158102 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -256,7 +256,7 @@ int snd_soc_dai_compr_ack(struct snd_soc_dai *dai,
 			  size_t bytes);
 int snd_soc_dai_compr_pointer(struct snd_soc_dai *dai,
 			      struct snd_compr_stream *cstream,
-			      struct snd_compr_tstamp *tstamp);
+			      struct snd_compr_tstamp64 *tstamp);
 int snd_soc_dai_compr_set_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata);
@@ -383,8 +383,9 @@ struct snd_soc_cdai_ops {
 			struct snd_compr_metadata *, struct snd_soc_dai *);
 	int (*trigger)(struct snd_compr_stream *, int,
 			struct snd_soc_dai *);
-	int (*pointer)(struct snd_compr_stream *,
-			struct snd_compr_tstamp *, struct snd_soc_dai *);
+	int (*pointer)(struct snd_compr_stream *stream,
+		       struct snd_compr_tstamp64 *tstamp,
+		       struct snd_soc_dai *dai);
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
index a66f258cafaa..d3164aa07158 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -176,14 +176,25 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	return 0;
 }
 
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
-		struct snd_compr_tstamp *tstamp)
+				   struct snd_compr_tstamp64 *tstamp)
 {
 	if (!stream->ops->pointer)
 		return -ENOTSUPP;
 	stream->ops->pointer(stream, tstamp);
-	pr_debug("dsp consumed till %d total %d bytes\n",
-		tstamp->byte_offset, tstamp->copied_total);
+	pr_debug("dsp consumed till %u total %llu bytes\n", tstamp->byte_offset,
+		 tstamp->copied_total);
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		stream->runtime->total_bytes_transferred = tstamp->copied_total;
 	else
@@ -194,8 +205,11 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 		struct snd_compr_avail *avail)
 {
+	struct snd_compr_tstamp64 tstamp64 = { 0 };
+
 	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp(stream, &avail->tstamp);
+	snd_compr_update_tstamp(stream, &tstamp64);
+	snd_compr_tstamp32_from_64(&avail->tstamp, &tstamp64);
 	/* Still need to return avail even if tstamp can't be filled in */
 
 	if (stream->runtime->total_bytes_available == 0 &&
@@ -204,9 +218,9 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
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
@@ -223,7 +237,7 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		avail->avail = stream->runtime->buffer_size - avail->avail;
 
-	pr_debug("ret avail as %lld\n", avail->avail);
+	pr_debug("ret avail as %llu\n", avail->avail);
 	return avail->avail;
 }
 
@@ -274,8 +288,7 @@ static int snd_compr_write_data(struct snd_compr_stream *stream,
 		      (app_pointer * runtime->buffer_size);
 
 	dstn = runtime->buffer + app_pointer;
-	pr_debug("copying %ld at %lld\n",
-			(unsigned long)count, app_pointer);
+	pr_debug("copying %lu at %llu\n", (unsigned long)count, app_pointer);
 	if (count < runtime->buffer_size - app_pointer) {
 		if (copy_from_user(dstn, buf, count))
 			return -EFAULT;
@@ -318,7 +331,7 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 	}
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail returned %ld\n", (unsigned long)avail);
+	pr_debug("avail returned %lu\n", (unsigned long)avail);
 	/* calculate how much we can write to buffer */
 	if (avail > count)
 		avail = count;
@@ -374,7 +387,7 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 	}
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail returned %ld\n", (unsigned long)avail);
+	pr_debug("avail returned %lu\n", (unsigned long)avail);
 	/* calculate how much we can read from buffer */
 	if (avail > count)
 		avail = count;
@@ -443,7 +456,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 #endif
 
 	avail = snd_compr_get_avail(stream);
-	pr_debug("avail is %ld\n", (unsigned long)avail);
+	pr_debug("avail is %lu\n", (unsigned long)avail);
 	/* check if we have at least one fragment to fill */
 	switch (runtime->state) {
 	case SNDRV_PCM_STATE_DRAINING:
@@ -726,13 +739,18 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 static inline int
 snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
 {
-	struct snd_compr_tstamp tstamp = {0};
+	struct snd_compr_tstamp64 tstamp64 = { 0 };
+	struct snd_compr_tstamp tstamp32 = { 0 };
 	int ret;
 
-	ret = snd_compr_update_tstamp(stream, &tstamp);
-	if (ret == 0)
+	ret = snd_compr_update_tstamp(stream, &tstamp64);
+	if (ret == 0) {
+		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
 		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
-			&tstamp, sizeof(tstamp)) ? -EFAULT : 0;
+				   &tstamp32, sizeof(tstamp32)) ?
+			      -EFAULT :
+			      0;
+	}
 	return ret;
 }
 
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 8a1d5cc75d6c..f197034fd594 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -173,7 +173,7 @@ struct wm_adsp_compr {
 	struct snd_compressed_buffer size;
 
 	u32 *raw_buf;
-	unsigned int copied_total;
+	u64 copied_total;
 
 	unsigned int sample_rate;
 
@@ -1860,7 +1860,7 @@ static int wm_adsp_buffer_reenable_irq(struct wm_adsp_compr_buf *buf)
 
 int wm_adsp_compr_pointer(struct snd_soc_component *component,
 			  struct snd_compr_stream *stream,
-			  struct snd_compr_tstamp *tstamp)
+			  struct snd_compr_tstamp64 *tstamp)
 {
 	struct wm_adsp_compr *compr = stream->runtime->private_data;
 	struct wm_adsp *dsp = compr->dsp;
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 25210d404bf1..8035fda71f8d 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -131,7 +131,7 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 int wm_adsp_compr_handle_irq(struct wm_adsp *dsp);
 int wm_adsp_compr_pointer(struct snd_soc_component *component,
 			  struct snd_compr_stream *stream,
-			  struct snd_compr_tstamp *tstamp);
+			  struct snd_compr_tstamp64 *tstamp);
 int wm_adsp_compr_copy(struct snd_soc_component *component,
 		       struct snd_compr_stream *stream,
 		       char __user *buf, size_t count);
diff --git a/sound/soc/intel/atom/sst-mfld-platform-compress.c b/sound/soc/intel/atom/sst-mfld-platform-compress.c
index 89c9c5ad6b21..9dfb0a814b94 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-compress.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-compress.c
@@ -18,6 +18,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/compress_driver.h>
+#include <asm/div64.h>
 #include "sst-mfld-platform.h"
 
 /* compress stream operations */
@@ -202,15 +203,16 @@ static int sst_platform_compr_trigger(struct snd_soc_component *component,
 
 static int sst_platform_compr_pointer(struct snd_soc_component *component,
 				      struct snd_compr_stream *cstream,
-				      struct snd_compr_tstamp *tstamp)
+				      struct snd_compr_tstamp64 *tstamp)
 {
 	struct sst_runtime_stream *stream;
+	u64 temp_copied_total = tstamp->copied_total;
 
-	stream  = cstream->runtime->private_data;
+	stream = cstream->runtime->private_data;
 	stream->compr_ops->tstamp(sst->dev, stream->id, tstamp);
-	tstamp->byte_offset = tstamp->copied_total %
-				 (u32)cstream->runtime->buffer_size;
-	pr_debug("calc bytes offset/copied bytes as %d\n", tstamp->byte_offset);
+	tstamp->byte_offset =
+		do_div(temp_copied_total, cstream->runtime->buffer_size);
+	pr_debug("calc bytes offset/copied bytes as %u\n", tstamp->byte_offset);
 	return 0;
 }
 
diff --git a/sound/soc/intel/atom/sst-mfld-platform.h b/sound/soc/intel/atom/sst-mfld-platform.h
index 8b5777d3229a..a0e33f7f01c5 100644
--- a/sound/soc/intel/atom/sst-mfld-platform.h
+++ b/sound/soc/intel/atom/sst-mfld-platform.h
@@ -105,7 +105,7 @@ struct compress_sst_ops {
 	int (*stream_pause_release)(struct device *dev,	unsigned int str_id);
 
 	int (*tstamp)(struct device *dev, unsigned int str_id,
-			struct snd_compr_tstamp *tstamp);
+		      struct snd_compr_tstamp64 *tstamp);
 	int (*ack)(struct device *dev, unsigned int str_id,
 			unsigned long bytes);
 	int (*close)(struct device *dev, unsigned int str_id);
diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index 8bb27f86eb65..2646c4632ca1 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -326,7 +326,7 @@ static int sst_cdev_stream_partial_drain(struct device *dev,
 }
 
 static int sst_cdev_tstamp(struct device *dev, unsigned int str_id,
-		struct snd_compr_tstamp *tstamp)
+			   struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_sst_tstamp fw_tstamp = {0,};
 	struct stream_info *stream;
@@ -349,10 +349,11 @@ static int sst_cdev_tstamp(struct device *dev, unsigned int str_id,
 			(u64)stream->num_ch * SST_GET_BYTES_PER_SAMPLE(24));
 	tstamp->sampling_rate = fw_tstamp.sampling_frequency;
 
-	dev_dbg(dev, "PCM  = %u\n", tstamp->pcm_io_frames);
-	dev_dbg(dev, "Ptr Query on strid = %d  copied_total %d, decodec %d\n",
+	dev_dbg(dev, "PCM  = %llu\n", tstamp->pcm_io_frames);
+	dev_dbg(dev,
+		"Ptr Query on strid = %d  copied_total %llu, decodec %llu\n",
 		str_id, tstamp->copied_total, tstamp->pcm_frames);
-	dev_dbg(dev, "rendered %d\n", tstamp->pcm_io_frames);
+	dev_dbg(dev, "rendered %llu\n", tstamp->pcm_io_frames);
 
 	return 0;
 }
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index a42736b9aa55..b5b4b0754b71 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -213,7 +213,7 @@ static int avs_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
 }
 
 static int avs_probe_compr_pointer(struct snd_compr_stream *cstream,
-				   struct snd_compr_tstamp *tstamp, struct snd_soc_dai *dai)
+				   struct snd_compr_tstamp64 *tstamp, struct snd_soc_dai *dai)
 {
 	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
 	struct snd_soc_pcm_stream *pstream;
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 2cd522108221..09da26f712a6 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -11,6 +11,7 @@
 #include <sound/soc-dapm.h>
 #include <linux/spinlock.h>
 #include <sound/pcm.h>
+#include <asm/div64.h>
 #include <asm/dma.h>
 #include <linux/dma-mapping.h>
 #include <sound/pcm_params.h>
@@ -65,9 +66,9 @@ struct q6apm_dai_rtd {
 	unsigned int pcm_size;
 	unsigned int pcm_count;
 	unsigned int periods;
-	unsigned int bytes_sent;
-	unsigned int bytes_received;
-	unsigned int copied_total;
+	uint64_t bytes_sent;
+	uint64_t bytes_received;
+	uint64_t copied_total;
 	uint16_t bits_per_sample;
 	snd_pcm_uframes_t queue_ptr;
 	bool next_track;
@@ -575,15 +576,17 @@ static int q6apm_dai_compr_get_codec_caps(struct snd_soc_component *component,
 
 static int q6apm_dai_compr_pointer(struct snd_soc_component *component,
 				   struct snd_compr_stream *stream,
-				   struct snd_compr_tstamp *tstamp)
+				   struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	unsigned long flags;
+	uint64_t temp_copied_total;
 
 	spin_lock_irqsave(&prtd->lock, flags);
 	tstamp->copied_total = prtd->copied_total;
-	tstamp->byte_offset = prtd->copied_total % prtd->pcm_size;
+	temp_copied_total = tstamp->copied_total;
+	tstamp->byte_offset = do_div(temp_copied_total, prtd->pcm_size);
 	spin_unlock_irqrestore(&prtd->lock, flags);
 
 	return 0;
@@ -760,21 +763,24 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 	size_t copy;
 	u32 wflags = 0;
 	u32 app_pointer;
-	u32 bytes_received;
+	uint64_t bytes_received;
+	uint64_t temp_bytes_received;
 	uint32_t bytes_to_write;
-	int avail, bytes_in_flight = 0;
+	uint64_t avail, bytes_in_flight = 0;
 
 	bytes_received = prtd->bytes_received;
+	temp_bytes_received = bytes_received;
 
 	/**
 	 * Make sure that next track data pointer is aligned at 32 bit boundary
 	 * This is a Mandatory requirement from DSP data buffers alignment
 	 */
-	if (prtd->next_track)
+	if (prtd->next_track) {
 		bytes_received = ALIGN(prtd->bytes_received, prtd->pcm_count);
+		temp_bytes_received = bytes_received;
+	}
 
-	app_pointer = bytes_received/prtd->pcm_size;
-	app_pointer = bytes_received -  (app_pointer * prtd->pcm_size);
+	app_pointer = do_div(temp_bytes_received, prtd->pcm_size);
 	dstn = prtd->dma_buffer.area + app_pointer;
 
 	if (count < prtd->pcm_size - app_pointer) {
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index a400c9a31fea..b616ce316d2f 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -14,6 +14,7 @@
 #include <sound/pcm.h>
 #include <linux/spinlock.h>
 #include <sound/compress_driver.h>
+#include <asm/div64.h>
 #include <asm/dma.h>
 #include <linux/dma-mapping.h>
 #include <sound/pcm_params.h>
@@ -59,9 +60,9 @@ struct q6asm_dai_rtd {
 	unsigned int pcm_count;
 	unsigned int pcm_irq_pos;       /* IRQ position */
 	unsigned int periods;
-	unsigned int bytes_sent;
-	unsigned int bytes_received;
-	unsigned int copied_total;
+	uint64_t bytes_sent;
+	uint64_t bytes_received;
+	uint64_t copied_total;
 	uint16_t bits_per_sample;
 	uint16_t source; /* Encoding source bit mask */
 	struct audio_client *audio_client;
@@ -1026,16 +1027,18 @@ static int q6asm_dai_compr_trigger(struct snd_soc_component *component,
 
 static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
 				   struct snd_compr_stream *stream,
-				   struct snd_compr_tstamp *tstamp)
+				   struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 	unsigned long flags;
+	uint64_t temp_copied_total;
 
 	spin_lock_irqsave(&prtd->lock, flags);
 
 	tstamp->copied_total = prtd->copied_total;
-	tstamp->byte_offset = prtd->copied_total % prtd->pcm_size;
+	temp_copied_total = tstamp->copied_total;
+	tstamp->byte_offset = do_div(temp_copied_total, prtd->pcm_size);
 
 	spin_unlock_irqrestore(&prtd->lock, flags);
 
@@ -1050,23 +1053,26 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 	unsigned long flags;
 	u32 wflags = 0;
-	int avail, bytes_in_flight = 0;
+	uint64_t avail, bytes_in_flight = 0;
 	void *dstn;
 	size_t copy;
 	u32 app_pointer;
-	u32 bytes_received;
+	uint64_t bytes_received;
+	uint64_t temp_bytes_received;
 
 	bytes_received = prtd->bytes_received;
+	temp_bytes_received = bytes_received;
 
 	/**
 	 * Make sure that next track data pointer is aligned at 32 bit boundary
 	 * This is a Mandatory requirement from DSP data buffers alignment
 	 */
-	if (prtd->next_track)
+	if (prtd->next_track) {
 		bytes_received = ALIGN(prtd->bytes_received, prtd->pcm_count);
+		temp_bytes_received = bytes_received;
+	}
 
-	app_pointer = bytes_received/prtd->pcm_size;
-	app_pointer = bytes_received -  (app_pointer * prtd->pcm_size);
+	app_pointer = do_div(temp_bytes_received, prtd->pcm_size);
 	dstn = prtd->dma_buffer.area + app_pointer;
 
 	if (count < prtd->pcm_size - app_pointer) {
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 25f5e543ae8d..7976953b20f0 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -637,7 +637,7 @@ int snd_soc_component_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 EXPORT_SYMBOL_GPL(snd_soc_component_compr_ack);
 
 int snd_soc_component_compr_pointer(struct snd_compr_stream *cstream,
-				    struct snd_compr_tstamp *tstamp)
+				    struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 01d1d6bee28c..7b81dffc6a93 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -457,7 +457,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 }
 
 static int soc_compr_pointer(struct snd_compr_stream *cstream,
-			     struct snd_compr_tstamp *tstamp)
+			     struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	int ret;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a210089747d0..ff82effa48e5 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -772,7 +772,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_compr_ack);
 
 int snd_soc_dai_compr_pointer(struct snd_soc_dai *dai,
 			      struct snd_compr_stream *cstream,
-			      struct snd_compr_tstamp *tstamp)
+			      struct snd_compr_tstamp64 *tstamp)
 {
 	int ret = 0;
 
diff --git a/sound/soc/sof/amd/acp-probes.c b/sound/soc/sof/amd/acp-probes.c
index 0d0f8ec4aed8..ce51ed108a47 100644
--- a/sound/soc/sof/amd/acp-probes.c
+++ b/sound/soc/sof/amd/acp-probes.c
@@ -108,7 +108,7 @@ static int acp_probes_compr_trigger(struct sof_client_dev *cdev,
 
 static int acp_probes_compr_pointer(struct sof_client_dev *cdev,
 				    struct snd_compr_stream *cstream,
-				    struct snd_compr_tstamp *tstamp,
+				    struct snd_compr_tstamp64 *tstamp,
 				    struct snd_soc_dai *dai)
 {
 	struct acp_dsp_stream *stream = cstream->runtime->private_data;
diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index d7b044f33d79..90b932ae3bab 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -361,7 +361,7 @@ static int sof_compr_copy(struct snd_soc_component *component,
 
 static int sof_compr_pointer(struct snd_soc_component *component,
 			     struct snd_compr_stream *cstream,
-			     struct snd_compr_tstamp *tstamp)
+			     struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
diff --git a/sound/soc/sof/intel/hda-probes.c b/sound/soc/sof/intel/hda-probes.c
index c645346c2c84..b06933cebc45 100644
--- a/sound/soc/sof/intel/hda-probes.c
+++ b/sound/soc/sof/intel/hda-probes.c
@@ -112,7 +112,7 @@ static int hda_probes_compr_trigger(struct sof_client_dev *cdev,
 
 static int hda_probes_compr_pointer(struct sof_client_dev *cdev,
 				    struct snd_compr_stream *cstream,
-				    struct snd_compr_tstamp *tstamp,
+				    struct snd_compr_tstamp64 *tstamp,
 				    struct snd_soc_dai *dai)
 {
 	struct hdac_ext_stream *hext_stream = hda_compr_get_stream(cstream);
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index aff9ce980429..71930a922c29 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -137,7 +137,7 @@ static int sof_probes_compr_trigger(struct snd_compr_stream *cstream, int cmd,
 }
 
 static int sof_probes_compr_pointer(struct snd_compr_stream *cstream,
-				    struct snd_compr_tstamp *tstamp,
+				    struct snd_compr_tstamp64 *tstamp,
 				    struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = snd_soc_component_get_drvdata(dai->component);
diff --git a/sound/soc/sof/sof-client-probes.h b/sound/soc/sof/sof-client-probes.h
index da04d65b8d99..8713b69cda4b 100644
--- a/sound/soc/sof/sof-client-probes.h
+++ b/sound/soc/sof/sof-client-probes.h
@@ -4,7 +4,7 @@
 #define __SOF_CLIENT_PROBES_H
 
 struct snd_compr_stream;
-struct snd_compr_tstamp;
+struct snd_compr_tstamp64;
 struct snd_compr_params;
 struct sof_client_dev;
 struct snd_soc_dai;
@@ -24,7 +24,7 @@ struct sof_probes_host_ops {
 	int (*trigger)(struct sof_client_dev *cdev, struct snd_compr_stream *cstream,
 		       int cmd, struct snd_soc_dai *dai);
 	int (*pointer)(struct sof_client_dev *cdev, struct snd_compr_stream *cstream,
-		       struct snd_compr_tstamp *tstamp,
+		       struct snd_compr_tstamp64 *tstamp,
 		       struct snd_soc_dai *dai);
 };
 
diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index 57bd1a0728ac..4b6ebfa5b033 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -85,9 +85,9 @@ struct sprd_compr_stream {
 	int info_size;
 
 	/* Data size copied to IRAM buffer */
-	int copied_total;
+	u64 copied_total;
 	/* Total received data size from userspace */
-	int received_total;
+	u64 received_total;
 	/* Stage 0 IRAM buffer received data size */
 	int received_stage0;
 	/* Stage 1 DDR buffer received data size */
@@ -513,7 +513,7 @@ static int sprd_platform_compr_trigger(struct snd_soc_component *component,
 
 static int sprd_platform_compr_pointer(struct snd_soc_component *component,
 				       struct snd_compr_stream *cstream,
-				       struct snd_compr_tstamp *tstamp)
+				       struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_compr_runtime *runtime = cstream->runtime;
 	struct sprd_compr_stream *stream = runtime->private_data;
diff --git a/sound/soc/sprd/sprd-pcm-dma.h b/sound/soc/sprd/sprd-pcm-dma.h
index be5e385f5e42..c5935a1367e6 100644
--- a/sound/soc/sprd/sprd-pcm-dma.h
+++ b/sound/soc/sprd/sprd-pcm-dma.h
@@ -19,7 +19,7 @@ struct sprd_compr_playinfo {
 	int total_time;
 	int current_time;
 	int total_data_length;
-	int current_data_offset;
+	u64 current_data_offset;
 };
 
 struct sprd_compr_params {
@@ -46,7 +46,7 @@ struct sprd_compr_ops {
 	int (*stop)(int str_id);
 	int (*pause)(int str_id);
 	int (*pause_release)(int str_id);
-	int (*drain)(int received_total);
+	int (*drain)(u64 received_total);
 	int (*set_params)(int str_id, struct sprd_compr_params *params);
 };
 
diff --git a/sound/soc/uniphier/aio-compress.c b/sound/soc/uniphier/aio-compress.c
index 4a19d4908ffd..b18af98a552b 100644
--- a/sound/soc/uniphier/aio-compress.c
+++ b/sound/soc/uniphier/aio-compress.c
@@ -249,7 +249,7 @@ static int uniphier_aio_compr_trigger(struct snd_soc_component *component,
 
 static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
 				      struct snd_compr_stream *cstream,
-				      struct snd_compr_tstamp *tstamp)
+				      struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
-- 
2.50.1.565.gc32cd1483b-goog


