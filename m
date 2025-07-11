Return-Path: <linux-arm-msm+bounces-64523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED6FB01825
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2301617B63A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B2827A477;
	Fri, 11 Jul 2025 09:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ncTRiXyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DC627CCE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226651; cv=none; b=OFIsEuGw1S7+fkA7nJaZcdCnWLA4TiiR51fdWPb5dw0OIe3MzaSJzldTz4H5T6oBy3iGDgFT0CTfBW+VdzLm/tBbxSj6T6oT+zzuAIbJTr9iVoIZ6U+6fJ8EDO2wp+uAjXssLvxJRl44nR/B4r6IvaDVKHFN/mUw17migAEbIQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226651; c=relaxed/simple;
	bh=M1dujzqlrViBX5eAVMXNVdNoKPO5BUR0diMllLgPzjc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JsnBFjaQZpqv9RXZm+1xIGaqSAOwfOWFkCAGdHlxbw7pLSSJyzdTkdB+6lye3CTZ5cqfi4fiu1t/UiUPjlqZzTxV9Ob8qDFpZI3TFRlkqtYZdStiQ9KkY+ckT/0TLgEAxbdXRPn8Bm4q3g0xPXflol0hyn7WdH4YfupnI1zw6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ncTRiXyH; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so1000287f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752226648; x=1752831448; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WywIvLAv4IB9b6g8T96e6Qsk8BIfajnf2gbyC1P4AZo=;
        b=ncTRiXyH73I23H8AxSM5gLuUsBLk5YgNBE9QIYBtHQOjs5Dbt5ya03CH/Pucbmcy2+
         uTWjNXMTQFwUfkpI7wgUcLm0BUfhTpAHEpFH3ANNky4KbfTgs/P2Tkj1SLeiYRYX9/tM
         LgSU5fHoZwLaz6Vkk1foZ7Cbdh6iz5mPNeQLSHqCMFf5vX6RMuzMY1vtn1k1c5Yl1UBA
         Ith/8IS1KKCPjApt0t+7rifg0YoSbRa3NXQIA3YtTgcfaKpoRnNHkzGXjW97mfRGSLf8
         KkQCfymQUhsaTAmbFFY0KUwKPDQWej8c8QCKCSIBm9N7ssdmtkBfqLtV7kVmQqP90seL
         MWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226648; x=1752831448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WywIvLAv4IB9b6g8T96e6Qsk8BIfajnf2gbyC1P4AZo=;
        b=tqjjSVscTOetkUEz5fOBPcvjqk5wMD90XCaORL37iQZStUNbS5swQuy5rSzWmW1sUs
         9kOIcau/8tiEgWBtZ72pXJOzFW3JlF2KHiG5OTj9x2g05oBm02ZOGnDuMWOEAEP+qk9q
         qX7XD6kJU7lbtm8SY3KvbtSxzKOt/uXXNW6siwPlf9jyAFnQj4xyJF4GJsTEOzgn5Nqo
         MUD0TAKtpieChIvNBLvWzO7X9ft0B4zUq2jl/ROJqLDa2bwEoZHqEhEAAA+bSGLCy3R+
         ByR9tArOcp4J2iouAZ1BB3/ZsdTxOYmDnEplMyyFR0E4jsobDNVZkZIZPefGNlbmeY8M
         0qMA==
X-Forwarded-Encrypted: i=1; AJvYcCXYtuUE9ieNAm8vxcUEUA58nddOjOZQA4Qrlpqo0k+yPJiuvGt8LMmnVhJ2k9rQgs6dLvK6DhsavEe3Ca1b@vger.kernel.org
X-Gm-Message-State: AOJu0YwcleNhvodfoOx+9SXo6dnVo8sfvgnFg2vs5a0vUNv7UDowVUh8
	ahkLJP2xaJUOSTj8UwdafLP4ogQ56m6xEMX3BFNr+nDGrq8fC/NLvrAoz2DQhMSF6T6+0ex7HV8
	+D7HMZyPSxVgiuPpoqg==
X-Google-Smtp-Source: AGHT+IEmEE9dNv4iiepa6OEju/MJzJFG2hiRPgxw7iu3SiyhF7OruOUvPAPmCsUrMtbUZ8nFQRE0HzcU37l0TXw=
X-Received: from wmbea14.prod.google.com ([2002:a05:600c:674e:b0:43d:9035:df36])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:18a3:b0:3a8:6262:6ef5 with SMTP id ffacd0b85a97d-3b5f2db15bemr1466223f8f.10.1752226648115;
 Fri, 11 Jul 2025 02:37:28 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:36:29 +0100
In-Reply-To: <20250711093636.28204-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711093636.28204-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711093636.28204-4-verhaegen@google.com>
Subject: [PATCH v2 3/4] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
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

Previous patches introduced ioctl for fetching a 64-bit timestamp via
SNDRV_COMPRESS_TSTAMP64. To provide a consistent API, a 64-bit
version of SNDRV_COMPRESS_AVAIL ioctl is required.

Define a new struct snd_compr_avail64, which embeds the 64-bit
timestamp struct, and define the corresponding SNDRV_COMPRESS_AVAIL64
ioctl command in the UAPI header.

Signed-off-by: Joris Verhaegen <verhaegen@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Reviewed-by: David Li <dvdli@google.com>
Reviewed-by: Miller Liang <millerliang@google.com>
---
 include/uapi/sound/compress_offload.h | 11 ++++
 sound/core/compress_offload.c         | 88 +++++++++++++++++++++------
 2 files changed, 79 insertions(+), 20 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 2758d9ee3d91..48525a87d98f 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -85,6 +85,16 @@ struct snd_compr_avail {
 	struct snd_compr_tstamp tstamp;
 } __attribute__((packed, aligned(4)));
 
+/**
+ * struct snd_compr_avail64 - avail descriptor with tstamp in 64 bit format
+ * @avail: Number of bytes available in ring buffer for writing/reading
+ * @tstamp: timestamp information
+ */
+struct snd_compr_avail64 {
+	__u64 avail;
+	struct snd_compr_tstamp64 tstamp;
+} __attribute__((packed, aligned(4)));
+
 enum snd_compr_direction {
 	SND_COMPRESS_PLAYBACK = 0,
 	SND_COMPRESS_CAPTURE,
@@ -232,6 +242,7 @@ struct snd_compr_task_status {
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
 #define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
+#define SNDRV_COMPRESS_AVAIL64		_IOR('C', 0x23, struct snd_compr_avail64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 40c1e69961b7..78ba86e0d74f 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -257,12 +257,11 @@ static int snd_compr_update_tstamp64(struct snd_compr_stream *stream,
 	return 0;
 }
 
-static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
-		struct snd_compr_avail *avail)
+static size_t snd_compr_calc_avail_internal(struct snd_compr_stream *stream,
+					    struct snd_compr_avail *avail32,
+					    struct snd_compr_avail64 *avail64)
 {
-	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp32(stream, &avail->tstamp);
-	/* Still need to return avail even if tstamp can't be filled in */
+	u64 avail;
 
 	if (stream->runtime->total_bytes_available == 0 &&
 			stream->runtime->state == SNDRV_PCM_STATE_SETUP &&
@@ -284,33 +283,68 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 		}
 	}
 
-	avail->avail = stream->runtime->total_bytes_available -
-			stream->runtime->total_bytes_transferred;
+	avail = stream->runtime->total_bytes_available -
+		stream->runtime->total_bytes_transferred;
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
-		avail->avail = stream->runtime->buffer_size - avail->avail;
+		avail = stream->runtime->buffer_size - avail;
+
+	if (avail32)
+		avail32->avail = avail;
+	if (avail64)
+		avail64->avail = avail;
+
+	pr_debug("ret avail %llu as %zu\n", avail, (size_t)avail);
+	return avail;
+}
+
+static size_t snd_compr_calc_avail32(struct snd_compr_stream *stream,
+				     struct snd_compr_avail *avail)
+{
+	memset(avail, 0, sizeof(*avail));
+	snd_compr_update_tstamp32(stream, &avail->tstamp);
+	/* Still need to return avail even if tstamp can't be filled in */
 
-	pr_debug("ret avail as %llu\n", avail->avail);
-	return avail->avail;
+	return snd_compr_calc_avail_internal(stream, avail, NULL);
+}
+
+static size_t snd_compr_calc_avail64(struct snd_compr_stream *stream,
+				     struct snd_compr_avail64 *avail)
+{
+	memset(avail, 0, sizeof(*avail));
+	snd_compr_update_tstamp64(stream, &avail->tstamp);
+	/* Still need to return avail even if tstamp can't be filled in */
+
+	return snd_compr_calc_avail_internal(stream, NULL, avail);
 }
 
 static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
 {
 	struct snd_compr_avail avail;
 
-	return snd_compr_calc_avail(stream, &avail);
+	return snd_compr_calc_avail32(stream, &avail);
 }
 
-static int
-snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
+static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
+				 unsigned long arg, bool is_64bit)
 {
-	struct snd_compr_avail ioctl_avail;
-	size_t avail;
+	union {
+		struct snd_compr_avail avail32;
+		struct snd_compr_avail64 avail64;
+	} ioctrl_avail_u;
+	size_t avail, ioctrl_avail_size;
 
 	if (stream->direction == SND_COMPRESS_ACCEL)
 		return -EBADFD;
 
-	avail = snd_compr_calc_avail(stream, &ioctl_avail);
-	ioctl_avail.avail = avail;
+	if (is_64bit) {
+		avail = snd_compr_calc_avail64(stream, &ioctrl_avail_u.avail64);
+		ioctrl_avail_u.avail64.avail = avail;
+		ioctrl_avail_size = sizeof(ioctrl_avail_u.avail64);
+	} else {
+		avail = snd_compr_calc_avail32(stream, &ioctrl_avail_u.avail32);
+		ioctrl_avail_u.avail32.avail = avail;
+		ioctrl_avail_size = sizeof(ioctrl_avail_u.avail32);
+	}
 
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
@@ -321,12 +355,24 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
 		break;
 	}
 
-	if (copy_to_user((__u64 __user *)arg,
-				&ioctl_avail, sizeof(ioctl_avail)))
+	if (copy_to_user((__u64 __user *)arg, &ioctrl_avail_u,
+			 ioctrl_avail_size))
 		return -EFAULT;
 	return 0;
 }
 
+static int snd_compr_ioctl_avail32(struct snd_compr_stream *stream,
+				   unsigned long arg)
+{
+	return snd_compr_ioctl_avail(stream, arg, false);
+}
+
+static int snd_compr_ioctl_avail64(struct snd_compr_stream *stream,
+				   unsigned long arg)
+{
+	return snd_compr_ioctl_avail(stream, arg, true);
+}
+
 static int snd_compr_write_data(struct snd_compr_stream *stream,
 	       const char __user *buf, size_t count)
 {
@@ -1393,7 +1439,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 	case _IOC_NR(SNDRV_COMPRESS_TSTAMP64):
 		return snd_compr_tstamp64(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_AVAIL):
-		return snd_compr_ioctl_avail(stream, arg);
+		return snd_compr_ioctl_avail32(stream, arg);
+	case _IOC_NR(SNDRV_COMPRESS_AVAIL64):
+		return snd_compr_ioctl_avail64(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_PAUSE):
 		return snd_compr_pause(stream);
 	case _IOC_NR(SNDRV_COMPRESS_RESUME):
-- 
2.50.0.727.gbf7dc18ff4-goog


