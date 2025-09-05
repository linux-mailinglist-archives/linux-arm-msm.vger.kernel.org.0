Return-Path: <linux-arm-msm+bounces-72231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98309B452E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D6FA65839
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053EC313521;
	Fri,  5 Sep 2025 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qIrU7gYy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C430F946
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063618; cv=none; b=dMxTZQ/G7cXEIXpoLnZd4dZyrXagFoah5N3KOGIT8B8/T4rEJl+l+COlBArxTCOE86kFlfMwV91Xz99jTATC1lTwkbwx33iVggBr7keVaHQiNmItjbYq7TqyVg507Cems6nutsgzlthu+w+J+Ge7KcFBfLBJwrF9NMMSGVDjphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063618; c=relaxed/simple;
	bh=WzkaNV8OtrI5d68Jyxcv4C4JfQgfogIX2PIoGse17I0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BQFLedVLMQzBuDTXY+h2S2wI5laXsx7RKQ1xq7vEK4uzQ6hLgyVw8J8PMRi9ehk9pgAXkLVJgYnxFDwkGPGpzNWdDwHEouQGCFZRKMjb2cOMJpmZcJZQjgu1fDOReUEqT/E/LD0fuUuzg9SxeD2svAkPTj9saGbdckTGmO6CLuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qIrU7gYy; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3df19a545c2so1216551f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063615; x=1757668415; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qe+QtpliqDAu4G9UaaRGSX2jMJxjWrnOYF63McD9Po4=;
        b=qIrU7gYyNNJ3tpKRwGAJeqkQYbwA+bY9+PXet7mxAAiBImV5JJc7PNm1KCD9Npzlzp
         d1hdxvqacJfeOyi4uS9QWoLChUAfWjBMa6vCNaP7Cr5wltKEThb5FnJUNNB71cNbC4Od
         WeLzBkSeyHcdrMz7B1+tmXluhL/R3ijrx/Pm099qQ8QOzt68CpzVjqyZCg9rwuKN/9Tk
         kTuYpqxJ7xn2twPH/ioE2Tvlqp96oeeDejWIjLExJnLPiLBRLlK8lhWPhF5AKdTzwH0j
         ezK8lJR3l6+UhfsdI2aynuDLVlfSH28YqNSripattjfHPzzXd2DWwy/jxqM9B7U1kfMa
         9MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063615; x=1757668415;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qe+QtpliqDAu4G9UaaRGSX2jMJxjWrnOYF63McD9Po4=;
        b=xD6T9RumfW/qAfY2qcU6xuqPRz3KohfR+1PP/fXfKQ87f4Y67AmAPunQGdEcxYt4Z1
         4R1I7SDujXDCkZTnUWvcJlX8mkl6jjFpWuGiK0hHdUtMpCKp3iqd265fjX/2F9XIq9Tw
         UpfDaQOiWfL4AIQURRO7v8LGNH9xDiD/d3OYRFXYjEgF8N7D6IA9Piutl/zr+2Z56o+T
         YpcUmiw0EH2NEPYzVQHXrk54ydMcdsu3fSonppizL6voCyjZ+44sUcaxIqh9xDE3APuP
         ppaTv+ElVNZkGXGZS1msBEkKARgeG8wS0GtIp0BPiSpSIxGgAWiv8s7xJo+1ujqpaWIa
         o+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXMnxJPIjYe8jpZQBxdDa3+Tm9KKgmTE1Q9W8bgbD0uyu6ufdQXG/G8GOt/lCJT2OzgiF9IfURAq3Zp0415@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGnbUMmkomzgtJmYTIPHui+TZJL62ZHeruoE+ZZPPeE6H0dev
	g7deN6BJc64C5luYrIxOlXX9A3sXTM7CtAfNsw2vZLKZw5KvjYeP4g+T3iPuSxJFTn43F7WZhfi
	qEXpAS11yjjV3Rsp7OA==
X-Google-Smtp-Source: AGHT+IH6GdtZv6WB+m8+2uS3LHU1bwHgtnfflqQnjRCwjq5u4fTUKo/2dMs3/H7tVXLO84nhyhg5xInyYI4bI6o=
X-Received: from wmbhg18.prod.google.com ([2002:a05:600c:5392:b0:45d:cfd2:c531])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:a3da:0:b0:3d2:2989:224 with SMTP id ffacd0b85a97d-3d229892c7dmr11529562f8f.7.1757063614797;
 Fri, 05 Sep 2025 02:13:34 -0700 (PDT)
Date: Fri,  5 Sep 2025 10:12:56 +0100
In-Reply-To: <20250905091301.2711705-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905091301.2711705-1-verhaegen@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905091301.2711705-4-verhaegen@google.com>
Subject: [PATCH v5 3/3] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
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

The previous patch introduced a 64-bit timestamp ioctl
(SNDRV_COMPRESS_TSTAMP64). To provide a consistent API, this patch
adds a corresponding 64-bit version of the SNDRV_COMPRESS_AVAIL ioctl.

A new struct snd_compr_avail64 is added to the UAPI, which includes
the 64-bit timestamp. The existing ioctl implementation is refactored
to handle both the 32-bit and 64-bit variants.

Reviewed-by: Miller Liang <millerliang@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Signed-off-by: Joris Verhaegen <verhaegen@google.com>
---
 include/uapi/sound/compress_offload.h | 11 +++++++
 sound/core/compress_offload.c         | 43 +++++++++++++++++----------
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 70b8921601f9..26f756cc2e62 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -84,6 +84,16 @@ struct snd_compr_avail {
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
@@ -231,6 +241,7 @@ struct snd_compr_task_status {
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
 #define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
+#define SNDRV_COMPRESS_AVAIL64		_IOR('C', 0x23, struct snd_compr_avail64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 445220fdb6a0..da514fef45bc 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -203,13 +203,10 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 }
 
 static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
-		struct snd_compr_avail *avail)
+				   struct snd_compr_avail64 *avail)
 {
-	struct snd_compr_tstamp64 tstamp64 = { 0 };
-
 	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp(stream, &tstamp64);
-	snd_compr_tstamp32_from_64(&avail->tstamp, &tstamp64);
+	snd_compr_update_tstamp(stream, &avail->tstamp);
 	/* Still need to return avail even if tstamp can't be filled in */
 
 	if (stream->runtime->total_bytes_available == 0 &&
@@ -237,28 +234,43 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		avail->avail = stream->runtime->buffer_size - avail->avail;
 
-	pr_debug("ret avail as %llu\n", avail->avail);
+	pr_debug("ret avail as %zu\n", (size_t)avail->avail);
 	return avail->avail;
 }
 
 static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
 {
-	struct snd_compr_avail avail;
+	struct snd_compr_avail64 avail;
 
 	return snd_compr_calc_avail(stream, &avail);
 }
 
-static int
-snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
+static void snd_compr_avail32_from_64(struct snd_compr_avail *avail32,
+				      const struct snd_compr_avail64 *avail64)
 {
-	struct snd_compr_avail ioctl_avail;
+	avail32->avail = avail64->avail;
+	snd_compr_tstamp32_from_64(&avail32->tstamp, &avail64->tstamp);
+}
+
+static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
+				 unsigned long arg, bool is_32bit)
+{
+	struct snd_compr_avail64 ioctl_avail64;
+	struct snd_compr_avail ioctl_avail32;
 	size_t avail;
+	const void *copy_from = &ioctl_avail64;
+	size_t copy_size = sizeof(ioctl_avail64);
 
 	if (stream->direction == SND_COMPRESS_ACCEL)
 		return -EBADFD;
 
-	avail = snd_compr_calc_avail(stream, &ioctl_avail);
-	ioctl_avail.avail = avail;
+	avail = snd_compr_calc_avail(stream, &ioctl_avail64);
+	ioctl_avail64.avail = avail;
+	if (is_32bit) {
+		snd_compr_avail32_from_64(&ioctl_avail32, &ioctl_avail64);
+		copy_from = &ioctl_avail32;
+		copy_size = sizeof(ioctl_avail32);
+	}
 
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
@@ -269,8 +281,7 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
 		break;
 	}
 
-	if (copy_to_user((__u64 __user *)arg,
-				&ioctl_avail, sizeof(ioctl_avail)))
+	if (copy_to_user((__u64 __user *)arg, copy_from, copy_size))
 		return -EFAULT;
 	return 0;
 }
@@ -1336,7 +1347,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 	case SNDRV_COMPRESS_TSTAMP64:
 		return snd_compr_tstamp(stream, arg, false);
 	case SNDRV_COMPRESS_AVAIL:
-		return snd_compr_ioctl_avail(stream, arg);
+		return snd_compr_ioctl_avail(stream, arg, true);
+	case SNDRV_COMPRESS_AVAIL64:
+		return snd_compr_ioctl_avail(stream, arg, false);
 	case SNDRV_COMPRESS_PAUSE:
 		return snd_compr_pause(stream);
 	case SNDRV_COMPRESS_RESUME:
-- 
2.51.0.355.g5224444f11-goog


