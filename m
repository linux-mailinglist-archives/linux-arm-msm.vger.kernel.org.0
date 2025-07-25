Return-Path: <linux-arm-msm+bounces-66706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB5B11DC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 13:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8D6AAC85AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110002E7628;
	Fri, 25 Jul 2025 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QCAvnuqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF82E7652
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443798; cv=none; b=A40QmCOGiUFlwtBIA/dFAz0Urhg7PFP84wH6xcbHXjKOjfep7I2nbvw7DREAIldr2+aAN3X22dj6r9+bB2UG5cBUeBP8b36drxSZ21V4L7jmkIw8uh9JOm0Lah2jXTiZf6usu1o/mA5MII2zLQAJcA8VnpKPlU4U+5D5nHwom28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443798; c=relaxed/simple;
	bh=xYkxiSGB3HiyrpwMmesA1Pdc4KekDGsxkxYb8FOqOsg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CW/vJcYb7a4lJemlxbwt/PwTanxpkq6mrDXINvSLjq3/0f5Vxjj9H/bfd1wBGXOZuuVVAlQJo/RRBOeHpRUpdOssTzCvJWosRjJLla4A+lx6lBwrmh4WO962Et4ArAU+jcHk4K57ub0t8m/QW8VAzaXSqdR621ZYYQNyJSeY9zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QCAvnuqa; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b77738050fso274526f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753443794; x=1754048594; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+a+TqK/s3X4ICiheNo2EUiGxut07xdB8F6iCq61W8U=;
        b=QCAvnuqacFtjmtznrz5Pd1zL22ykpTdZFMU1I6Hzc1PUqlHTHDN+CAPtpAM6ixWSyN
         J08IWfFgU26wJuycDnfjMJidbQlCqYWoeEo8qYgmzzEWdDXWiALyyopvrW7nqYtWwLwC
         BHznZRmYr+ZG61nl80dluKe5Tt0CZN8E7XWdQUCETuFj88TMGt494LECKqnQ2Z08FeJ9
         jzZYLlGs9SmxqZtrZUv6eaYKGNF3ziAvoj2llJ2r8lMQoRsguX1ZBuIhmShYAB9PT4gu
         iRwa71mV/dpPjKmVZ8i+lKt2AVUxHno8VOOFM7S1iKPZCxV7leKn77MLGsiOUWzrS+M6
         0Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443794; x=1754048594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c+a+TqK/s3X4ICiheNo2EUiGxut07xdB8F6iCq61W8U=;
        b=jFhxTuRo55fiobJdG0ionE8o+LSSrCbkTSLg8qD9UaKtXCzH+CfaMPYdIv+F7Rrlw1
         KzI02AZUyCk8pyIbKAwdet8hvrZfRSTVf/WHS1WfL5yq+bvUnvtmgwU2dWTwgrGcRxfK
         +EP/GdwsRS1BCD9/ny+vILOyk/1U4tcxP1iHF2wp5x9382lwpsWIswqQIxUlBgnvJRNN
         9Oju+gZHcqj3Ex2jl/YWREHotmUeBMQa1xBTkq14QUt+vB5whTDWGC3/lU6vXL4FdniP
         93ZVbt2lJ0mgDzUQeu60DYKbv1/qf1FTkbLQBpa+cYAyThzTxMqHs6Az7ZqeQzt6L0wb
         yvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIHNtOXFVfODhRuqwMenMbAVzcxHDDEjfh49N+JcAe6o1gbtocAmRBIDVvSah215xiIuMcmXEPjvX7ohkX@vger.kernel.org
X-Gm-Message-State: AOJu0YzuSmI+Vlj3mbHw0BL02ZQB/bXQw/ImEX0OUJJ8XB6l1aXXlL6Q
	jJlDOaDfuJovguadQeCiNoNbO0r/XTy2iq8VOeOBXW4de/gmN0Wral+ehKUB+RKX42iiakxjIJT
	3EjirP1syOos03dH/Ug==
X-Google-Smtp-Source: AGHT+IEjxdJR1uJLIOVLqBDV0bDsdc/XTQjcc+CXgCRPq1R1chA9MEbontl1NBvD61YpGImuSVWX6wytCW9/eOc=
X-Received: from wrbee12.prod.google.com ([2002:a05:6000:210c:b0:3b7:6ea1:a86f])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1889:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b7765e614amr1746678f8f.1.1753443794521;
 Fri, 25 Jul 2025 04:43:14 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:42:44 +0100
In-Reply-To: <20250725114249.2086974-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250725114249.2086974-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250725114249.2086974-3-verhaegen@google.com>
Subject: [PATCH v3 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
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
2.50.1.470.g6ba607880d-goog


