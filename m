Return-Path: <linux-arm-msm+bounces-72229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E0B452D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29DA1189C49E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC43A30F939;
	Fri,  5 Sep 2025 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kano0pk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6430E82C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063609; cv=none; b=oVceKatVeHe/5EOoqyoERHTcnEZjkVhPeMmJRonTkttbGFg08a9QVyEhLNMwRkqBdGmkeYccpE1ICLAJsqFiYi6eQ1vUtKqHdMYWmcIX+THHkuAg0+QMufPvybuNjHr2RIT3BCAUcHwbyMslcRdnQBbU0k94kDxuMp0Yh3sYWYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063609; c=relaxed/simple;
	bh=iVtonefOAPJJXtXEymU00/Wa/QjhOPoMWLVIP8oLduE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tz+5VnBHGwdI+QbDtu7OQ/wycKZuYZk8fGrXd0MbxucLJCPUveFEktzPYiQ8P5KKRSHDmJbQMq0h5q6Vr2+Hd/5UYFL/Eo5+bqbSbBJ827M7MSYf8rjK/XfRhy/UlYf7gfvw4lH6Y/C2ptd3fRzkAcvO+Fujy1puQ1AYqXy+Rwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kano0pk1; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3dacc10dd30so1384507f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063606; x=1757668406; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDPGzsxAKKvH1GDMNj6CwOgMXSMzqp7fsMOzyvpH+nA=;
        b=kano0pk1+hMhCc4RkeuPGa4SbmPwSSP7TiBVaYCOdixCs5ysj+q3qvACCc+41dpg3j
         2I5GNWasURk4YxZTxh3Qal2+F2bTPF+vwV1VGCBNdj8gc8GvTG7sApZKlDr0k+gmgK7w
         GTNGtf0i4hWOQEo7Ww+CAKYmp/PRH98Hiw32Td+gu+DInKnUnQo9kZ9p98QPMpspAhaQ
         1KHNvs5yX/OrPN5T1r/uNuDHWVw9IVPkV4uRViuItzRoKeJcg0TERXSR8s1LKcDH5gCC
         fCUjBNKv3mkUjHB6UMEXXlP5FcJydlGoRBTiRFK96sAVGlIRz9W6GLaXDLxAr+Ewkiw0
         yDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063606; x=1757668406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDPGzsxAKKvH1GDMNj6CwOgMXSMzqp7fsMOzyvpH+nA=;
        b=YaqViGh1aT165Q4n+Zcj4FmF7rL6Iw3C35+1/7/wNvWuRCUsL/DLoHiroCAiBXIDUs
         IMIlBiGZ6AmkyW2DszH2oxo2Q503XT3nS/aXXXoezJgT3dHve3y3nXmmHHdZuLr4wrMT
         5dQJ61PLTzTGM/XK0pxMNwXV75Q2vh5WIC9fyKZ5ZxFFdgAJzsD1cbyZIbTlQnOmS9AC
         46KJ0tU6pAhdudSoevoUEHGMdGvt/N0jexEL2qsIwY6RcxfAISt5CKoXSaoHk0Ty2KKx
         +/iEH2pPcJjwoTHk3Ik4tJo3vHET97Q6p8B6wrL8w6y3lh9cbp0LR4dRlRAB+4/fJbzT
         Vy5g==
X-Forwarded-Encrypted: i=1; AJvYcCUyWe/DR/KhYI3qZiruX7WduMptyRhsaLwZcWH9JM1GS99id3sy6OvIespxHa9QbRgKxiRTRvTtZa+gtyGW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9FttlfusGWG8HLM6BVEywgP8ZCdMs7DY5vqjkNGfGUd5957ba
	L8xk9V9/4Y63qfJsM7hkaKkIuOGctBw2AU1bp1s3Ffj4jdss447k5GMjgDTOW5zAt+w8E9gQF/p
	0xZNWqLVxgcVeaTxt7A==
X-Google-Smtp-Source: AGHT+IEyDlexP0RAVrpJVCl0chgZCWyPtv6v1WIav3zbUk2uYgIv0ZwyKau6Sc8ZZDKm6Mlu1EdrYFeaxTOrcP8=
X-Received: from wmby11-n1.prod.google.com ([2002:a05:600c:c04b:10b0:45d:d179:882f])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5849:0:b0:3b7:9929:871c with SMTP id ffacd0b85a97d-3d1de5b09e9mr15575101f8f.37.1757063606306;
 Fri, 05 Sep 2025 02:13:26 -0700 (PDT)
Date: Fri,  5 Sep 2025 10:12:55 +0100
In-Reply-To: <20250905091301.2711705-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905091301.2711705-1-verhaegen@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905091301.2711705-3-verhaegen@google.com>
Subject: [PATCH v5 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
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
2.51.0.355.g5224444f11-goog


