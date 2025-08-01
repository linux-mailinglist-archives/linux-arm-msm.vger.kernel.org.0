Return-Path: <linux-arm-msm+bounces-67327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38728B17F42
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A271C26178
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B70222A807;
	Fri,  1 Aug 2025 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q5rYz8b7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3EC2264D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040494; cv=none; b=LH3NroVrTfPGR9qDE6MrDLT2F6VG0LWk8Z2nNNnVyckttA4yqBVLF6Q3W3+vUnpSMHhk71uSyeHFs6NlM4vMps+DSTL/1PluyPnahTnpwoIwFZcBtDaGslJVFiuDv7oLHfQT62f6cVRfDGGiDpElLBiA/NEdIom7QhWiTZXTez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040494; c=relaxed/simple;
	bh=iEUlnm6UcU71O3qhqf8+Qaoj6tGlW/0LywzXO/lxfGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U6+9PwbO8ScEm3UFwo9TDPuAtUDVuH/LEsbizX00cGY1ZCb8nw4dGSHNPrzMWXaE3nrpFLGl+N0VyAhWyoQ9smaCssKSEgoVBoYo4rB53U56lsZi2b2oNCeNdiiyEe41ySrNxSApwUKVs4eImduJvlh4E9ls51TJK86OlOAUoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q5rYz8b7; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b783265641so1140038f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754040491; x=1754645291; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CE0yUTi8vaWBOP+ptSGUlpWi9dFsFhf4ychTYVoaqcU=;
        b=Q5rYz8b7Jgp5EoZjF9iPxAT1GSJlQk00ZkDVh8Up7g86KVUqQ5JjW9AdKveHcPCtF0
         9SwNKGEaHUyj0CCXzenQIFbZBgucls7MWfRj57jFojo0sXYI0SGSb8IgcWTflUxeuT8L
         KkobWrc2T8D/8p+EREcQxOTyEHio3V8/GW8OemfNVySmXHh36CbLi6ns+xBe5/j/hEJf
         Gq4G9K4JWueyU2Uo+sWjYb4EAJJ8GuMW7AgKQafqcXVUSe1zyMbun1wkPOW9VcjaiiJt
         dTXq9Rgnimr/VwXU1L7DRrVMh4jfHzp+sIP/Vc26osegum99mlcyNw6komZIVmrR+Trd
         sx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040491; x=1754645291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CE0yUTi8vaWBOP+ptSGUlpWi9dFsFhf4ychTYVoaqcU=;
        b=snRgTTvJd1lx4QYXGqWaCQrEsWHljfefoQ6JdEI8/d9x6X4OTuwMAys+f7Yt8FmVos
         mkFD9adum0k/9l4iAlYUF0dsgl1ReLSChZfIl9F2nlo/Dd5fh3KBerbKeRkIY7tvut9M
         bra5k8KnmDLFrtPF1I5JKBFmmGENoCPUvak8u4p3w/FduDmiFevZOVaXYsJjueB+mK05
         eD1wrVsgv3i5yk5Rv+E9einU1SO0MU+u/mWz3Z1q02T74sskkiikbUYQ/4CDlnF8LYrV
         rU9rOmOjVcdJrFZ7xygpMcc9m6HfuWw2s5TK3i3w+W975bEqvXvff1rFzX0FBGQ7TQyG
         zNTw==
X-Forwarded-Encrypted: i=1; AJvYcCXcy3bE6TtFV+GD8jtpA8EihylARpaFZlz+BkXSjLZ7vYlY3GLnXunuPxec34ruT+Fs0FrHpT3ZFj9tCC8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ZBiFMtqzj35yipqUwfKjGmt5N7n3nszviHKdoDgomEHXcC0F
	8QzaZwU3YjDLPddbhuo/3foA6taY+t0K15Nec5ZaSgYQaruFJzPZlv4Y5cHnyYgqXU2A6TlILOh
	PoAHLbk93CEvbCwX/ow==
X-Google-Smtp-Source: AGHT+IGclLlFV2GkuMwBDGhI/am9e4aUyiArGDfT6eX1AfmQulH6DcrQSI5ElTu2oPPFAXeEXjf99dWLtJ2pyZY=
X-Received: from wrpa8.prod.google.com ([2002:adf:eec8:0:b0:3b7:8342:dc50])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2311:b0:3b4:9b82:d44c with SMTP id ffacd0b85a97d-3b794fc3115mr8167881f8f.22.1754040490843;
 Fri, 01 Aug 2025 02:28:10 -0700 (PDT)
Date: Fri,  1 Aug 2025 10:27:15 +0100
In-Reply-To: <20250801092720.1845282-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801092720.1845282-3-verhaegen@google.com>
Subject: [PATCH v4 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
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

The previous patch introduced the internal infrastructure for handling
64-bit timestamps. This patch exposes this capability to user-space.

Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
applications to fetch the overflow-safe struct snd_compr_tstamp64.

The ioctl dispatch table is updated to handle the new command by
calling a new snd_compr_tstamp64 handler, while the legacy path is
renamed to snd_compr_tstamp32 for clarity.

This patch bumps the SNDRV_COMPRESS_VERSION to 0.4.0.

Reviewed-by: Miller Liang <millerliang@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Signed-off-by: Joris Verhaegen <verhaegen@google.com>
---
 include/uapi/sound/compress_offload.h |  5 +++--
 sound/core/compress_offload.c         | 19 +++++++++++++------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index abd0ea3f86ee..70b8921601f9 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -13,8 +13,7 @@
 #include <sound/asound.h>
 #include <sound/compress_params.h>
 
-
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes
@@ -208,6 +207,7 @@ struct snd_compr_task_status {
  * Note: only codec params can be changed runtime and stream params cant be
  * SNDRV_COMPRESS_GET_PARAMS: Query codec params
  * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
+ * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
  * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
  * This also queries the tstamp properties
  * SNDRV_COMPRESS_PAUSE: Pause the running stream
@@ -230,6 +230,7 @@ struct snd_compr_task_status {
 						 struct snd_compr_metadata)
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
+#define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index d3164aa07158..445220fdb6a0 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -736,18 +736,23 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 	return retval;
 }
 
-static inline int
-snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
+static inline int snd_compr_tstamp(struct snd_compr_stream *stream,
+				   unsigned long arg, bool is_32bit)
 {
 	struct snd_compr_tstamp64 tstamp64 = { 0 };
 	struct snd_compr_tstamp tstamp32 = { 0 };
+	const void *copy_from = &tstamp64;
+	size_t copy_size = sizeof(tstamp64);
 	int ret;
 
 	ret = snd_compr_update_tstamp(stream, &tstamp64);
 	if (ret == 0) {
-		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
-		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
-				   &tstamp32, sizeof(tstamp32)) ?
+		if (is_32bit) {
+			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
+			copy_from = &tstamp32;
+			copy_size = sizeof(tstamp32);
+		}
+		ret = copy_to_user((void __user *)arg, copy_from, copy_size) ?
 			      -EFAULT :
 			      0;
 	}
@@ -1327,7 +1332,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 
 	switch (cmd) {
 	case SNDRV_COMPRESS_TSTAMP:
-		return snd_compr_tstamp(stream, arg);
+		return snd_compr_tstamp(stream, arg, true);
+	case SNDRV_COMPRESS_TSTAMP64:
+		return snd_compr_tstamp(stream, arg, false);
 	case SNDRV_COMPRESS_AVAIL:
 		return snd_compr_ioctl_avail(stream, arg);
 	case SNDRV_COMPRESS_PAUSE:
-- 
2.50.1.565.gc32cd1483b-goog


