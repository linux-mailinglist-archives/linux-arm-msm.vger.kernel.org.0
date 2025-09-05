Return-Path: <linux-arm-msm+bounces-72228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA31B452DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291A6A63F68
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBB4303CAA;
	Fri,  5 Sep 2025 09:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5blnMG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB51C301484
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063604; cv=none; b=tJ9CrMk4INd5lBbq6h0Jqd7DTSaouJyDC9BkkPtSjJOKU9DLivqZ3/CszQZAYvLRWMfRBEkJKcaXpTg5AfwuUAjMVYlcQQQtv9MaIVEt+n6i0RfputqDrFSls1evi2xMSGfgKr3uQYhJfLPH38pitI78UbP6mrmAh9pxOf9bPP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063604; c=relaxed/simple;
	bh=Frd6GwooSdof8nNuNZxHvBdVaTZx4Y7N1yIn2UIPA8s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EceNp6CaCNz+nJlsvDRJImBOq9sn0jtwEvZxNYhScUbFUkgaD4TWO+Uevoznu4KF4uYWojCznN7m8f9AkR8ZlHCorBjo1FdPpsK1XkU/rZh3hh5uc4rm6wXLGYFuT0PEy6VmF7VCT6BgpjC+rkaAIaM2+S+FDgxuEaIBCt2jeVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5blnMG5; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3dabec38299so1212690f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063599; x=1757668399; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCARSp5yJZb29xruE4z/z8womRw9NZliJ8kFXxzlGko=;
        b=I5blnMG5b9nGG03OZgU/14VHGgsG45oXDEwDWGsMwCbUQLwyjmmVM39DiInNwmcNR4
         PMRjqC/TywLcXnoggEoF27zYHFIMCrbey72hBPsqgSr7vlyvQaH3TCX5GMuijzkpkIzd
         sWW4HwP74GU+B/cvu4FZ2Khiy3xTnAbQgNMT8MKJmvFKyqXfRBHKp3xgpUpuzXzmNeVM
         oZLbw1f0/9XrBnUKU2qL4FtsLV1Xm/S5SX/H8fy3Jaurv8IZu31KZdbPKfDivVFkvUBB
         1Pam51ZLMhp/49FQ1zVZ3S5fbr3JqTLQTdn1+67VqaGEpx6Faq5RFbsiUpDSTVhzUmu8
         4GCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063599; x=1757668399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCARSp5yJZb29xruE4z/z8womRw9NZliJ8kFXxzlGko=;
        b=lrxa/K4hOWM5hs9yFEAegHa10ekKqCoOktLVHsBcyNGm0UAq1279TgwB8uLo9GXUmx
         kzm9KxiGB/5voYm60cydOFO+eR0gwdDImYsRMv8p8Q+i1ALV/VCUtUHAlzoLXTxGaoNU
         NEaEzuNVWILhP80yp/oM1g8gX4WDtqpl2eWlm7ZIwGsCU6n4/ji+muAbC0a0o44L0JJ+
         H5U2Os/U83ucATGLlYTT+C9HhQtg+lzjfbro8gmT9K9JGjdMn2+qKVpfbP3D3FQKCioi
         7D2wzNJST7J1MDmX2MQX40O63IBr7GxyDEocCLLyMkXAuf/1rt872qvkdbN8YLQf1iA4
         6/xA==
X-Forwarded-Encrypted: i=1; AJvYcCUpo5Lec8FcJiC5Izobxa/6LDpOjEs0gfT4Oj8wLdPahgd4ru5s1qAhhw472OUWDiZrX80+HKFPpsU/xcMf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyam6mr3IK2GSNGiEPs5lIfz/j+dLUIbLKV8aN/K0myvslrzPUj
	EOKbhUbEvJHErC8MvIkG3bcckpyp3GGnCZiiILcxaRTYx1B8JD6CxF9piLRA+S5+9v1hQBeO4QC
	0Emirkb4pcCSCZ1ObmQ==
X-Google-Smtp-Source: AGHT+IFdjvd9YbF0LcsgygdwtjQqTzmMXnepimvtU+wFccNiQypo0RTmhnJrFKgdq8koqsxYDuFij8iqC4+bjOo=
X-Received: from wrbck9.prod.google.com ([2002:a5d:5e89:0:b0:3df:219:ab7f])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f84:b0:3e4:74dc:a3bb with SMTP id ffacd0b85a97d-3e474dcd583mr659094f8f.40.1757063599157;
 Fri, 05 Sep 2025 02:13:19 -0700 (PDT)
Date: Fri,  5 Sep 2025 10:12:54 +0100
In-Reply-To: <20250905091301.2711705-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905091301.2711705-1-verhaegen@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905091301.2711705-2-verhaegen@google.com>
Subject: [PATCH v5 1/3] ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
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
2.51.0.355.g5224444f11-goog


