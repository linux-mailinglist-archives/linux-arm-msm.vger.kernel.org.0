Return-Path: <linux-arm-msm+bounces-64507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F24B015F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2701188B101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 08:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD55201034;
	Fri, 11 Jul 2025 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kvCUSic8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6E217736
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222368; cv=none; b=kjyK88bzqO9r0PcDfBud0VViLRZvvZr1AvgcTDjiiJIo7yzsjHVTTA3NA34p/rNJV6bQUY+32f40Dvcq+F9HkSCdzGeJAzkN3uWtlvN6/vkIKzY9p0G/A4eTK9tVs6GEfq1JSIX0KCn26kAheCCXs+ra9o96yyNyCBxq6ZsJjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222368; c=relaxed/simple;
	bh=iUqDZ6dWJYus360rBT7JdCA1UZ5cAnvzIOD4c4yrCBw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uRBRiqhEX1Rk4mQIMTWRjW31qKNazllagWjUobrKt6PFRvSPsgpJhnckdxD8WCSRR7cklhgwnSQjXrIH6TEdhqeIwfgdUjN0bXLZSGxL+LY39XqF/0SS8P1m0/qUePrCRIZIahmuLnhGlSXMu3VN73UyqzbOeuGXMqcAhdylyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kvCUSic8; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-606aea61721so1579593a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752222365; x=1752827165; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OI8EJdj4iWn/1u1hrxV7gJL9a9iP26e/+tYZeBGEhqQ=;
        b=kvCUSic81zc9q861RSTTsima44l0XOS9iyAsCHHBYqJGtI2Hq73VitXwtAMGwAW8j+
         +ScXQ5/Upuq/knPMRN+GrkH40PtUYZu6F6I08eBRr4YMTXzLfQH0VO45w9Lomaovkh79
         5C2Wt2mKlV/b6DI+Man4t3si55OSsWvksHhi2sOhHkjlyFxEYTh4TzWZFcBrTYT0QkgJ
         TNFTk+IiGNbU8RiTReQmjot6610BvdH6W/qW8mwF4hLHrOLxRXUmZGbnpxVPrqz7zO5R
         copcDkhPOvLJHRTLLKSxyLj221AOfTmWZ6WG/oRW5Mjduz5buQqNpA4Y43yaUKyNp8k6
         /Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222365; x=1752827165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OI8EJdj4iWn/1u1hrxV7gJL9a9iP26e/+tYZeBGEhqQ=;
        b=ps5x58AWrLAnOQPZh+/bp/eMLxlNTVvy3mlRmmHLgoCfvR4FWVqdi6zykU7imfsIAH
         6EErb5FEYfMyO/DG8fxGtKU2Vck+gnSjR216teUdJh7ELdZ/aGfscCvmTDABdZr/YCBx
         fQLsGFvS2QM4zbEu0xflh9knbqVwlDnDcpry5Om+qSr4Pf7KCv5lcAHjH9djGIU8V0eW
         MMi60Xobfz0LpYSmxS4qCDmwYLLvEsZs9r2cVOs8+chB46DTOSdfOF5AvGqShm04Kgsi
         Q6B6C1cljcPVDQTH5IFsO6U+bUkuWoj09zJECC7WEYyu0JIYioEJV2hy8RAgOHa83SFv
         CiJA==
X-Forwarded-Encrypted: i=1; AJvYcCW8bC3WBqwLTl5TKs69U5gIjLLaJLtk7eQoMMTdxyuCz5rOZKZoObMdiFLrAQFIRs/J0U4EGUX3camWLjf6@vger.kernel.org
X-Gm-Message-State: AOJu0YyM10WAOOdunJh4pIYTByGVtK4lDHMU1/6amdjWAu7qtk6WcsL3
	VmHHab26D8QyQzOSd2MwwB3LDyiLzTLQmMjNBpPYypAJZNeAw1OiPM8aklP3Mr5k5FK85SkAMTO
	zHDYRz26722vOCyLiNA==
X-Google-Smtp-Source: AGHT+IHI8PTrj97CrFmguJmIDyCYPUtRTqpUv31CiuHbIgrvImgMyuw2xI5mKz+ZrzTXQ83FPflouczIPb1Ff4c=
X-Received: from edbdc17.prod.google.com ([2002:a05:6402:3111:b0:60e:395c:9cd1])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13c1:b0:60b:9cf8:b218 with SMTP id 4fb4d7f45d1cf-611e7614a78mr1823302a12.7.1752222364829;
 Fri, 11 Jul 2025 01:26:04 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:24:35 +0100
In-Reply-To: <20250711082441.4193295-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711082441.4193295-4-verhaegen@google.com>
Subject: [PATCH v1 3/4] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
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


