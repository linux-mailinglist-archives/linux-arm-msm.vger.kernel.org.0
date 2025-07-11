Return-Path: <linux-arm-msm+bounces-64524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6589B01826
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD1605A1629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CFE27D782;
	Fri, 11 Jul 2025 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qrBUEqhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A414F27CB02
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 09:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226660; cv=none; b=hbw0A2q+eOPNYUPl6xj/0LsFW1iWXsCnnzcNIhMVEeEe6rzTnWMHUuYE+j35rL2Vt/imTyInOwjYMyFTLW++o3WhM8PzQvgmGMrpvFJWb5UqV7BxPmMZ9T0p1N7mJHSU5hrz6aw2DUnVGP7/2F3H4nsm+DMIPpaFUC8avw0N3tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226660; c=relaxed/simple;
	bh=tmeaFPZiRFFkwMdVxW7c7jSqi1d+sDYCXhN2nCh2uZY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DQacN8WbhAZlA8frr4kFUSLJ+s+mqo0qIpAlllab9WaHk7yBWx2Puvkwy/JG4iqjJoTssLplAua0vVInhZxLWbkssQy/jgZfrS9hPf8gREq/LDngsvPS5IZUENJMUdC1DgKEKup/ZONz4S1TMAHTj1INl0luCQIMm4sdHvzDf8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qrBUEqhF; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ae6f9b15604so68151966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752226656; x=1752831456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s24zxkMRC1OeCsWQ5Jm+L322PE3ZBEn4WYJVkxJHa58=;
        b=qrBUEqhF4eMMy0ucZScLyGFxGLY79K7kwoXTlHl5aOcbqCL5DsjqvyZm8nxJ6x1z2Y
         9u99Eda6Fjw2GmLOKwgxJjllCmqKod18SutedUJVYmBfPYJ9yXFzrPwP7mGIZrnBuG3L
         pSnHLq3xgIlo58ODp4Gp6E9RftFD8+lwInCh3hSLUndlFU5AWunoUG22Mhi/FnGRTTo2
         g5e0z70ql7WNS0OZq1ACH5PP8VC3jzW0qZd2UvTYvWfKpBnWkA727XiJP+jgPuY9WrWh
         6cquZItZ3iaAL2eIVYdS1VJEC6+3/ympJdThjh04a/yEAEzVmGZUyEO7eKL8mAvciD+w
         bAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752226656; x=1752831456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s24zxkMRC1OeCsWQ5Jm+L322PE3ZBEn4WYJVkxJHa58=;
        b=gd7JAUiJhTqZ9bNKJ0vqQSGFHAJzaNMrKH6JMDpHpUd3yIUMEjZJKp0D4mwYDLKkPi
         r15Ic/TiCVVbX5/RXT+3J2zqfDfQjpO3LZ4cbNtiMtbk5WwzwbNqSjTXs4siTEfvC6by
         GJ6nA4UOcVF7gdzopawnhQ7HKgBwIqG9iSEjHUY+4ma/iV4did+ud7R+OFkT3euduOt1
         /p8o0RGS4BxPWqfGD6j6M+3Ha88jZNctkLz223xfnbo5qZmAUiP4jztuURJQW08jJh1o
         ELI5stBnMiAIbF0DrYJkQhSmRT/4AI2lPS7NUTO/csIcqF7q/EoJz9cmylo83dzcr6iv
         nYRw==
X-Forwarded-Encrypted: i=1; AJvYcCVxqn+Zmr3XeQsf+qldcxgUgDFSNHylxenRG8j4v9AHpEezVFmqxRATj+HJoBzgGQ0wwkCpuqnn7tG4aRb+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3tG5Ys9eaQg/a8/WPQY2ahmA9HJLCVY6WWbxTqqHWPMsc0Gp
	Tol7WaveWxOr6I7twNteFce0gn7G/PKM9JnJCn8yWNsxlLWY/+BPef5XAPAbqfXEmrayvMSnoT0
	eSm4hfYiqu7Z/6OSIbw==
X-Google-Smtp-Source: AGHT+IEE+Iad30lp8vlVTMnoKWDJrzSh/Gl4mnzAn3kxLg1w2hmTp8NWUwAAAjRm4Pv+hBo2ock630z7qIlqeIc=
X-Received: from edon10.prod.google.com ([2002:aa7:d04a:0:b0:5fc:3251:d24f])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:d7d4:b0:ad8:a512:a9fc with SMTP id a640c23a62f3a-ae6fc3662f6mr256255866b.42.1752226655971;
 Fri, 11 Jul 2025 02:37:35 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:36:30 +0100
In-Reply-To: <20250711093636.28204-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711093636.28204-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711093636.28204-5-verhaegen@google.com>
Subject: [PATCH v2 4/4] ASoC: codecs: Implement 64-bit pointer operation
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

Implement the new .pointer64 compress operation for the various ASoC
drivers that support compress offload.

For drivers with complex but similar 32-bit and 64-bit logic
(wm_adsp, sof, uniphier), a shared internal function is used to handle
both requests, minimizing code duplication and improving maintainability.

For other drivers, internal counters and related variables are updated
to u64 to ensure the source of the timestamp data is overflow-safe.
The legacy .pointer operation is retained in all drivers to ensure
full backward compatibility.

Signed-off-by: Joris Verhaegen <verhaegen@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Reviewed-by: David Li <dvdli@google.com>
Reviewed-by: Miller Liang <millerliang@google.com>
---
 sound/soc/codecs/cs47l15.c                    |  1 +
 sound/soc/codecs/cs47l24.c                    |  1 +
 sound/soc/codecs/cs47l35.c                    |  1 +
 sound/soc/codecs/cs47l85.c                    |  1 +
 sound/soc/codecs/cs47l90.c                    |  1 +
 sound/soc/codecs/cs47l92.c                    |  1 +
 sound/soc/codecs/wm5102.c                     |  1 +
 sound/soc/codecs/wm5110.c                     |  1 +
 sound/soc/codecs/wm_adsp.c                    | 53 +++++++++++++++----
 sound/soc/codecs/wm_adsp.h                    |  3 ++
 .../intel/atom/sst-mfld-platform-compress.c   | 17 +++++-
 sound/soc/intel/atom/sst-mfld-platform.h      |  2 +
 sound/soc/intel/atom/sst/sst_drv_interface.c  | 43 +++++++++++++--
 sound/soc/qcom/qdsp6/q6asm-dai.c              | 41 ++++++++++----
 sound/soc/sof/compress.c                      | 44 +++++++++++----
 sound/soc/sprd/sprd-pcm-compress.c            | 28 +++++++---
 sound/soc/sprd/sprd-pcm-dma.h                 |  2 +-
 sound/soc/uniphier/aio-compress.c             | 40 +++++++++++---
 18 files changed, 232 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index 29a2bcfb3048..40e75af3367e 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1342,6 +1342,7 @@ static const struct snd_compress_ops cs47l15_compress_ops = {
 	.get_caps = &wm_adsp_compr_get_caps,
 	.trigger = &wm_adsp_compr_trigger,
 	.pointer = &wm_adsp_compr_pointer,
+	.pointer64 = &wm_adsp_compr_pointer64,
 	.copy = &wm_adsp_compr_copy,
 };
 
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index e2a839fae4fc..30c434a3fa53 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1189,6 +1189,7 @@ static const struct snd_compress_ops cs47l24_compress_ops = {
 	.get_caps	= wm_adsp_compr_get_caps,
 	.trigger	= wm_adsp_compr_trigger,
 	.pointer	= wm_adsp_compr_pointer,
+	.pointer64	= wm_adsp_compr_pointer64,
 	.copy		= wm_adsp_compr_copy,
 };
 
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index 85555c7a2e4b..8b416f452c45 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1624,6 +1624,7 @@ static const struct snd_compress_ops cs47l35_compress_ops = {
 	.get_caps = &wm_adsp_compr_get_caps,
 	.trigger = &wm_adsp_compr_trigger,
 	.pointer = &wm_adsp_compr_pointer,
+	.pointer64 = &wm_adsp_compr_pointer64,
 	.copy = &wm_adsp_compr_copy,
 };
 
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index d34f4e8c26d3..b8ef0a69a2c5 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2568,6 +2568,7 @@ static const struct snd_compress_ops cs47l85_compress_ops = {
 	.get_caps = &wm_adsp_compr_get_caps,
 	.trigger = &wm_adsp_compr_trigger,
 	.pointer = &wm_adsp_compr_pointer,
+	.pointer64 = &wm_adsp_compr_pointer64,
 	.copy = &wm_adsp_compr_copy,
 };
 
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index a9e703981f37..1ae44155e306 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2483,6 +2483,7 @@ static const struct snd_compress_ops cs47l90_compress_ops = {
 	.get_caps = &wm_adsp_compr_get_caps,
 	.trigger = &wm_adsp_compr_trigger,
 	.pointer = &wm_adsp_compr_pointer,
+	.pointer64 = &wm_adsp_compr_pointer64,
 	.copy = &wm_adsp_compr_copy,
 };
 
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 2c355c61acd8..0be338dabf25 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1950,6 +1950,7 @@ static const struct snd_compress_ops cs47l92_compress_ops = {
 	.get_caps = &wm_adsp_compr_get_caps,
 	.trigger = &wm_adsp_compr_trigger,
 	.pointer = &wm_adsp_compr_pointer,
+	.pointer64 = &wm_adsp_compr_pointer64,
 	.copy = &wm_adsp_compr_copy,
 };
 
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 9fc7a8325724..3f691f2f3269 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2013,6 +2013,7 @@ static const struct snd_compress_ops wm5102_compress_ops = {
 	.get_caps	= wm_adsp_compr_get_caps,
 	.trigger	= wm_adsp_compr_trigger,
 	.pointer	= wm_adsp_compr_pointer,
+	.pointer64	= wm_adsp_compr_pointer64,
 	.copy		= wm_adsp_compr_copy,
 };
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 212eca675f27..8470ade90bad 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2370,6 +2370,7 @@ static const struct snd_compress_ops wm5110_compress_ops = {
 	.get_caps	= wm_adsp_compr_get_caps,
 	.trigger	= wm_adsp_compr_trigger,
 	.pointer	= wm_adsp_compr_pointer,
+	.pointer64	= wm_adsp_compr_pointer64,
 	.copy		= wm_adsp_compr_copy,
 };
 
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 8a1d5cc75d6c..0c3cc08aa3a8 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -173,7 +173,7 @@ struct wm_adsp_compr {
 	struct snd_compressed_buffer size;
 
 	u32 *raw_buf;
-	unsigned int copied_total;
+	u64 copied_total;
 
 	unsigned int sample_rate;
 
@@ -1858,17 +1858,16 @@ static int wm_adsp_buffer_reenable_irq(struct wm_adsp_compr_buf *buf)
 				    buf->irq_count);
 }
 
-int wm_adsp_compr_pointer(struct snd_soc_component *component,
-			  struct snd_compr_stream *stream,
-			  struct snd_compr_tstamp *tstamp)
+static int wm_adsp_compr_pointer_internal(struct snd_soc_component *component,
+					  struct snd_compr_stream *stream,
+					  struct snd_compr_tstamp *tstamp32,
+					  struct snd_compr_tstamp64 *tstamp64)
 {
 	struct wm_adsp_compr *compr = stream->runtime->private_data;
 	struct wm_adsp *dsp = compr->dsp;
 	struct wm_adsp_compr_buf *buf;
 	int ret = 0;
 
-	compr_dbg(compr, "Pointer request\n");
-
 	mutex_lock(&dsp->cs_dsp.pwr_lock);
 
 	buf = compr->buf;
@@ -1908,17 +1907,53 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 		}
 	}
 
-	tstamp->copied_total = compr->copied_total;
-	tstamp->copied_total += buf->avail * CS_DSP_DATA_WORD_SIZE;
-	tstamp->sampling_rate = compr->sample_rate;
+	if (tstamp32) {
+		tstamp32->copied_total = (u32)compr->copied_total;
+		tstamp32->copied_total += buf->avail * CS_DSP_DATA_WORD_SIZE;
+		tstamp32->sampling_rate = compr->sample_rate;
+	}
+	if (tstamp64) {
+		tstamp64->copied_total = compr->copied_total;
+		tstamp64->copied_total += buf->avail * CS_DSP_DATA_WORD_SIZE;
+		tstamp64->sampling_rate = compr->sample_rate;
+	}
 
 out:
 	mutex_unlock(&dsp->cs_dsp.pwr_lock);
 
 	return ret;
 }
+
+int wm_adsp_compr_pointer(struct snd_soc_component *component,
+			  struct snd_compr_stream *stream,
+			  struct snd_compr_tstamp *tstamp)
+{
+	struct wm_adsp_compr *compr = stream->runtime->private_data;
+	int ret = 0;
+
+	compr_dbg(compr, "Pointer request\n");
+
+	ret = wm_adsp_compr_pointer_internal(component, stream, tstamp, NULL);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(wm_adsp_compr_pointer);
 
+int wm_adsp_compr_pointer64(struct snd_soc_component *component,
+			    struct snd_compr_stream *stream,
+			    struct snd_compr_tstamp64 *tstamp)
+{
+	struct wm_adsp_compr *compr = stream->runtime->private_data;
+	int ret = 0;
+
+	compr_dbg(compr, "Pointer64 request\n");
+
+	ret = wm_adsp_compr_pointer_internal(component, stream, NULL, tstamp);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wm_adsp_compr_pointer64);
+
 static int wm_adsp_buffer_capture_block(struct wm_adsp_compr *compr, int target)
 {
 	struct wm_adsp_compr_buf *buf = compr->buf;
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 25210d404bf1..5027236bb92e 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -132,6 +132,9 @@ int wm_adsp_compr_handle_irq(struct wm_adsp *dsp);
 int wm_adsp_compr_pointer(struct snd_soc_component *component,
 			  struct snd_compr_stream *stream,
 			  struct snd_compr_tstamp *tstamp);
+int wm_adsp_compr_pointer64(struct snd_soc_component *component,
+			    struct snd_compr_stream *stream,
+			    struct snd_compr_tstamp64 *tstamp);
 int wm_adsp_compr_copy(struct snd_soc_component *component,
 		       struct snd_compr_stream *stream,
 		       char __user *buf, size_t count);
diff --git a/sound/soc/intel/atom/sst-mfld-platform-compress.c b/sound/soc/intel/atom/sst-mfld-platform-compress.c
index 89c9c5ad6b21..9fbd0d641059 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-compress.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-compress.c
@@ -210,7 +210,21 @@ static int sst_platform_compr_pointer(struct snd_soc_component *component,
 	stream->compr_ops->tstamp(sst->dev, stream->id, tstamp);
 	tstamp->byte_offset = tstamp->copied_total %
 				 (u32)cstream->runtime->buffer_size;
-	pr_debug("calc bytes offset/copied bytes as %d\n", tstamp->byte_offset);
+	pr_debug("calc bytes offset/copied bytes as %u\n", tstamp->byte_offset);
+	return 0;
+}
+
+static int sst_platform_compr_pointer64(struct snd_soc_component *component,
+					struct snd_compr_stream *cstream,
+					struct snd_compr_tstamp64 *tstamp)
+{
+	struct sst_runtime_stream *stream;
+
+	stream = cstream->runtime->private_data;
+	stream->compr_ops->tstamp64(sst->dev, stream->id, tstamp);
+	tstamp->byte_offset =
+		tstamp->copied_total % cstream->runtime->buffer_size;
+	pr_debug("calc bytes offset/copied bytes as %u\n", tstamp->byte_offset);
 	return 0;
 }
 
@@ -265,6 +279,7 @@ const struct snd_compress_ops sst_platform_compress_ops = {
 	.set_metadata = sst_platform_compr_set_metadata,
 	.trigger = sst_platform_compr_trigger,
 	.pointer = sst_platform_compr_pointer,
+	.pointer64 = sst_platform_compr_pointer64,
 	.ack = sst_platform_compr_ack,
 	.get_caps = sst_platform_compr_get_caps,
 	.get_codec_caps = sst_platform_compr_get_codec_caps,
diff --git a/sound/soc/intel/atom/sst-mfld-platform.h b/sound/soc/intel/atom/sst-mfld-platform.h
index 8b5777d3229a..bc21a36a4cc0 100644
--- a/sound/soc/intel/atom/sst-mfld-platform.h
+++ b/sound/soc/intel/atom/sst-mfld-platform.h
@@ -106,6 +106,8 @@ struct compress_sst_ops {
 
 	int (*tstamp)(struct device *dev, unsigned int str_id,
 			struct snd_compr_tstamp *tstamp);
+	int (*tstamp64)(struct device *dev, unsigned int str_id,
+			struct snd_compr_tstamp64 *tstamp);
 	int (*ack)(struct device *dev, unsigned int str_id,
 			unsigned long bytes);
 	int (*close)(struct device *dev, unsigned int str_id);
diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index 8bb27f86eb65..f6472ad29e47 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -325,8 +325,8 @@ static int sst_cdev_stream_partial_drain(struct device *dev,
 	return sst_drain_stream(ctx, str_id, true);
 }
 
-static int sst_cdev_tstamp(struct device *dev, unsigned int str_id,
-		struct snd_compr_tstamp *tstamp)
+static int sst_cdev_tstamp32(struct device *dev, unsigned int str_id,
+			     struct snd_compr_tstamp *tstamp)
 {
 	struct snd_sst_tstamp fw_tstamp = {0,};
 	struct stream_info *stream;
@@ -350,9 +350,41 @@ static int sst_cdev_tstamp(struct device *dev, unsigned int str_id,
 	tstamp->sampling_rate = fw_tstamp.sampling_frequency;
 
 	dev_dbg(dev, "PCM  = %u\n", tstamp->pcm_io_frames);
-	dev_dbg(dev, "Ptr Query on strid = %d  copied_total %d, decodec %d\n",
+	dev_dbg(dev, "Ptr Query on strid = %d  copied_total %u, decodec %u\n",
 		str_id, tstamp->copied_total, tstamp->pcm_frames);
-	dev_dbg(dev, "rendered %d\n", tstamp->pcm_io_frames);
+	dev_dbg(dev, "rendered %u\n", tstamp->pcm_io_frames);
+
+	return 0;
+}
+
+static int sst_cdev_tstamp64(struct device *dev, unsigned int str_id,
+			     struct snd_compr_tstamp64 *tstamp)
+{
+	struct snd_sst_tstamp fw_tstamp = {0,};
+	struct stream_info *stream;
+	struct intel_sst_drv *ctx = dev_get_drvdata(dev);
+	void __iomem *addr;
+
+	addr = (void __iomem *)(ctx->mailbox + ctx->tstamp) +
+		(str_id * sizeof(fw_tstamp));
+
+	memcpy_fromio(&fw_tstamp, addr, sizeof(fw_tstamp));
+
+	stream = get_stream_info(ctx, str_id);
+	if (!stream)
+		return -EINVAL;
+	dev_dbg(dev, "rb_counter %llu in bytes\n", fw_tstamp.ring_buffer_counter);
+
+	tstamp->copied_total = fw_tstamp.ring_buffer_counter;
+	tstamp->pcm_frames = fw_tstamp.frames_decoded;
+	tstamp->pcm_io_frames = div_u64(fw_tstamp.hardware_counter,
+			(u64)stream->num_ch * SST_GET_BYTES_PER_SAMPLE(24));
+	tstamp->sampling_rate = fw_tstamp.sampling_frequency;
+
+	dev_dbg(dev, "PCM  = %llu\n", tstamp->pcm_io_frames);
+	dev_dbg(dev, "Ptr Query on strid = %d  copied_total %llu, decodec %llu\n",
+		str_id, tstamp->copied_total, tstamp->pcm_frames);
+	dev_dbg(dev, "rendered %llu\n", tstamp->pcm_io_frames);
 
 	return 0;
 }
@@ -650,7 +682,8 @@ static struct compress_sst_ops compr_ops = {
 	.stream_drop = sst_cdev_stream_drop,
 	.stream_drain = sst_cdev_stream_drain,
 	.stream_partial_drain = sst_cdev_stream_partial_drain,
-	.tstamp = sst_cdev_tstamp,
+	.tstamp = sst_cdev_tstamp32,
+	.tstamp64 = sst_cdev_tstamp64,
 	.ack = sst_cdev_ack,
 	.get_caps = sst_cdev_caps,
 	.get_codec_caps = sst_cdev_codec_caps,
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index a400c9a31fea..d9917eca5f80 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -59,9 +59,9 @@ struct q6asm_dai_rtd {
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
@@ -1024,9 +1024,27 @@ static int q6asm_dai_compr_trigger(struct snd_soc_component *component,
 	return ret;
 }
 
-static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
-				   struct snd_compr_stream *stream,
-				   struct snd_compr_tstamp *tstamp)
+static int q6asm_dai_compr_pointer32(struct snd_soc_component *component,
+				     struct snd_compr_stream *stream,
+				     struct snd_compr_tstamp *tstamp)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6asm_dai_rtd *prtd = runtime->private_data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&prtd->lock, flags);
+
+	tstamp->copied_total = (u32) prtd->copied_total;
+	tstamp->byte_offset = prtd->copied_total % prtd->pcm_size;
+
+	spin_unlock_irqrestore(&prtd->lock, flags);
+
+	return 0;
+}
+
+static int q6asm_dai_compr_pointer64(struct snd_soc_component *component,
+				     struct snd_compr_stream *stream,
+				     struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
@@ -1050,11 +1068,12 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 	unsigned long flags;
 	u32 wflags = 0;
-	int avail, bytes_in_flight = 0;
+	u64 avail = 0;
+	u64 bytes_in_flight = 0;
 	void *dstn;
 	size_t copy;
 	u32 app_pointer;
-	u32 bytes_received;
+	u64 bytes_received;
 
 	bytes_received = prtd->bytes_received;
 
@@ -1065,8 +1084,7 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 	if (prtd->next_track)
 		bytes_received = ALIGN(prtd->bytes_received, prtd->pcm_count);
 
-	app_pointer = bytes_received/prtd->pcm_size;
-	app_pointer = bytes_received -  (app_pointer * prtd->pcm_size);
+	app_pointer = bytes_received % prtd->pcm_size;
 	dstn = prtd->dma_buffer.area + app_pointer;
 
 	if (count < prtd->pcm_size - app_pointer) {
@@ -1164,7 +1182,8 @@ static const struct snd_compress_ops q6asm_dai_compress_ops = {
 	.free		= q6asm_dai_compr_free,
 	.set_params	= q6asm_dai_compr_set_params,
 	.set_metadata	= q6asm_dai_compr_set_metadata,
-	.pointer	= q6asm_dai_compr_pointer,
+	.pointer	= q6asm_dai_compr_pointer32,
+	.pointer64	= q6asm_dai_compr_pointer64,
 	.trigger	= q6asm_dai_compr_trigger,
 	.get_caps	= q6asm_dai_compr_get_caps,
 	.get_codec_caps	= q6asm_dai_compr_get_codec_caps,
diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index d7b044f33d79..6eb0ceccde37 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -359,33 +359,59 @@ static int sof_compr_copy(struct snd_soc_component *component,
 		return sof_compr_copy_capture(rtd, buf, count);
 }
 
-static int sof_compr_pointer(struct snd_soc_component *component,
-			     struct snd_compr_stream *cstream,
-			     struct snd_compr_tstamp *tstamp)
+static int sof_compr_pointer_internal(struct snd_soc_component *component,
+				      struct snd_compr_stream *cstream,
+				      struct snd_compr_tstamp *tstamp32,
+				      struct snd_compr_tstamp64 *tstamp64)
 {
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct sof_compr_stream *sstream = cstream->runtime->private_data;
+	u64 pcm_io_frames;
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
-
-	tstamp->sampling_rate = sstream->sampling_rate;
-	tstamp->copied_total = sstream->copied_total;
-	tstamp->pcm_io_frames = div_u64(spcm->stream[cstream->direction].posn.dai_posn,
-					sstream->channels * sstream->sample_container_bytes);
+	pcm_io_frames =
+		div_u64(spcm->stream[cstream->direction].posn.dai_posn,
+			sstream->channels * sstream->sample_container_bytes);
+
+	if (tstamp32) {
+		tstamp32->sampling_rate = sstream->sampling_rate;
+		tstamp32->copied_total = (u32)sstream->copied_total;
+		tstamp32->pcm_io_frames = (u32)pcm_io_frames;
+	}
+	if (tstamp64) {
+		tstamp64->sampling_rate = sstream->sampling_rate;
+		tstamp64->copied_total = sstream->copied_total;
+		tstamp64->pcm_io_frames = pcm_io_frames;
+	}
 
 	return 0;
 }
 
+static int sof_compr_pointer32(struct snd_soc_component *component,
+			     struct snd_compr_stream *cstream,
+			     struct snd_compr_tstamp *tstamp)
+{
+	return sof_compr_pointer_internal(component, cstream, tstamp, NULL);
+}
+
+static int sof_compr_pointer64(struct snd_soc_component *component,
+			     struct snd_compr_stream *cstream,
+			     struct snd_compr_tstamp64 *tstamp)
+{
+	return sof_compr_pointer_internal(component, cstream, NULL, tstamp);
+}
+
 struct snd_compress_ops sof_compressed_ops = {
 	.open		= sof_compr_open,
 	.free		= sof_compr_free,
 	.set_params	= sof_compr_set_params,
 	.get_params	= sof_compr_get_params,
 	.trigger	= sof_compr_trigger,
-	.pointer	= sof_compr_pointer,
+	.pointer	= sof_compr_pointer32,
+	.pointer64	= sof_compr_pointer64,
 	.copy		= sof_compr_copy,
 };
 EXPORT_SYMBOL(sof_compressed_ops);
diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index 57bd1a0728ac..3dea3b00af77 100644
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
@@ -511,9 +511,24 @@ static int sprd_platform_compr_trigger(struct snd_soc_component *component,
 	return ret;
 }
 
-static int sprd_platform_compr_pointer(struct snd_soc_component *component,
-				       struct snd_compr_stream *cstream,
-				       struct snd_compr_tstamp *tstamp)
+static int sprd_platform_compr_pointer32(struct snd_soc_component *component,
+					 struct snd_compr_stream *cstream,
+					 struct snd_compr_tstamp *tstamp)
+{
+	struct snd_compr_runtime *runtime = cstream->runtime;
+	struct sprd_compr_stream *stream = runtime->private_data;
+	struct sprd_compr_playinfo *info =
+		(struct sprd_compr_playinfo *)stream->info_area;
+
+	tstamp->copied_total = (u32)stream->copied_total;
+	tstamp->pcm_io_frames = (u32)info->current_data_offset;
+
+	return 0;
+}
+
+static int sprd_platform_compr_pointer64(struct snd_soc_component *component,
+					 struct snd_compr_stream *cstream,
+					 struct snd_compr_tstamp64 *tstamp)
 {
 	struct snd_compr_runtime *runtime = cstream->runtime;
 	struct sprd_compr_stream *stream = runtime->private_data;
@@ -660,7 +675,8 @@ const struct snd_compress_ops sprd_platform_compress_ops = {
 	.free = sprd_platform_compr_free,
 	.set_params = sprd_platform_compr_set_params,
 	.trigger = sprd_platform_compr_trigger,
-	.pointer = sprd_platform_compr_pointer,
+	.pointer = sprd_platform_compr_pointer32,
+	.pointer64 = sprd_platform_compr_pointer64,
 	.copy = sprd_platform_compr_copy,
 	.get_caps = sprd_platform_compr_get_caps,
 	.get_codec_caps = sprd_platform_compr_get_codec_caps,
diff --git a/sound/soc/sprd/sprd-pcm-dma.h b/sound/soc/sprd/sprd-pcm-dma.h
index be5e385f5e42..31866a5df84b 100644
--- a/sound/soc/sprd/sprd-pcm-dma.h
+++ b/sound/soc/sprd/sprd-pcm-dma.h
@@ -46,7 +46,7 @@ struct sprd_compr_ops {
 	int (*stop)(int str_id);
 	int (*pause)(int str_id);
 	int (*pause_release)(int str_id);
-	int (*drain)(int received_total);
+	int (*drain)(u64 received_total);
 	int (*set_params)(int str_id, struct sprd_compr_params *params);
 };
 
diff --git a/sound/soc/uniphier/aio-compress.c b/sound/soc/uniphier/aio-compress.c
index 4a19d4908ffd..d450f5432d02 100644
--- a/sound/soc/uniphier/aio-compress.c
+++ b/sound/soc/uniphier/aio-compress.c
@@ -247,9 +247,9 @@ static int uniphier_aio_compr_trigger(struct snd_soc_component *component,
 	return ret;
 }
 
-static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
-				      struct snd_compr_stream *cstream,
-				      struct snd_compr_tstamp *tstamp)
+static int uniphier_aio_compr_pointer_internal(
+	struct snd_soc_component *component, struct snd_compr_stream *cstream,
+	struct snd_compr_tstamp *tstamp32, struct snd_compr_tstamp64 *tstamp64)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
@@ -258,6 +258,7 @@ static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
 	int bytes = runtime->fragment_size;
 	unsigned long flags;
 	u32 pos;
+	u64 copied_total;
 
 	spin_lock_irqsave(&sub->lock, flags);
 
@@ -266,18 +267,42 @@ static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
 	if (sub->swm->dir == PORT_DIR_OUTPUT) {
 		pos = sub->rd_offs;
 		/* Size of AIO output format is double of IEC61937 */
-		tstamp->copied_total = sub->rd_total / 2;
+		copied_total = sub->rd_total / 2;
 	} else {
 		pos = sub->wr_offs;
-		tstamp->copied_total = sub->rd_total;
+		copied_total = sub->rd_total;
+	}
+
+	if (tstamp32) {
+		tstamp32->copied_total = (u32)copied_total;
+		tstamp32->byte_offset = pos;
+	}
+	if (tstamp64) {
+		tstamp64->copied_total = copied_total;
+		tstamp64->byte_offset = pos;
 	}
-	tstamp->byte_offset = pos;
 
 	spin_unlock_irqrestore(&sub->lock, flags);
 
 	return 0;
 }
 
+static int uniphier_aio_compr_pointer32(struct snd_soc_component *component,
+					struct snd_compr_stream *cstream,
+					struct snd_compr_tstamp *tstamp)
+{
+	return uniphier_aio_compr_pointer_internal(component, cstream, tstamp,
+						   NULL);
+}
+
+static int uniphier_aio_compr_pointer64(struct snd_soc_component *component,
+					struct snd_compr_stream *cstream,
+					struct snd_compr_tstamp64 *tstamp)
+{
+	return uniphier_aio_compr_pointer_internal(component, cstream, NULL,
+						   tstamp);
+}
+
 static int aio_compr_send_to_hw(struct uniphier_aio_sub *sub,
 				char __user *buf, size_t dstsize)
 {
@@ -426,7 +451,8 @@ const struct snd_compress_ops uniphier_aio_compress_ops = {
 	.get_params     = uniphier_aio_compr_get_params,
 	.set_params     = uniphier_aio_compr_set_params,
 	.trigger        = uniphier_aio_compr_trigger,
-	.pointer        = uniphier_aio_compr_pointer,
+	.pointer        = uniphier_aio_compr_pointer32,
+	.pointer64      = uniphier_aio_compr_pointer64,
 	.copy           = uniphier_aio_compr_copy,
 	.get_caps       = uniphier_aio_compr_get_caps,
 	.get_codec_caps = uniphier_aio_compr_get_codec_caps,
-- 
2.50.0.727.gbf7dc18ff4-goog


