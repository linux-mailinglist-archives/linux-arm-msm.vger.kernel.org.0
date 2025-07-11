Return-Path: <linux-arm-msm+bounces-64504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5743B015E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCA61189C9E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 08:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C431F201034;
	Fri, 11 Jul 2025 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMq5odH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0978F1FF61E
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222333; cv=none; b=N2imRYABQb3MazuuL93KQpaqnCWMQ43RMhAbg2WiMXxNBtUR1w/+nIj/MRcgvOv45ontjBUA6hRm28rO+bwQJy5jv188kIv+ar/LABOCfmfJ+sh/4cuFkR16aKQtUgH9A05tZ8eNDNlfhhlSlxa2bzLuhpdR9nfF/E8kdjXs/qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222333; c=relaxed/simple;
	bh=n6dLC10d+kitIccOY3VPfg3CmhHlP4Yq5/nhKOKyNeY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XiHs1hBhYBwovVPEV3R/N2j6NTcD9d1nHS3d1X3fgICjpyjXBVHNOOHQylp+a9fqQOS7rxbLRw7elXlNooXnWzHzxZOZn1XCtEDzI7ZS6/iiHnmybGGY4b+uqwSOyosZwxWIbwlyQYsWYDjlvKHSgnzEO91zuHB5Zvad47Zeg4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMq5odH+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d64026baso9939725e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 01:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752222330; x=1752827130; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uPS4unWB2ZcBulBgsbUOEzWl0zbrAuljBCZj9zYhONY=;
        b=oMq5odH+MeS5IXn6pT2asCOx4XnablO/iWKRoL2gkg9eZd+x/bf6+JtJ8EPZumsrjf
         ppHAuHbDv/kZNyffFQRnsvl0oQ1pHWHuSR9n72nVSYdWBUlEbuZgyUgXNlYl4kgCCJt/
         9nSQZVbaa/IR8n8/yoUNcPy2U8sPDZ80+ExZhMUnPhDXWLbPUrAqXy4g4YZoZAm8rZgo
         tBl8MoY6AISztCmGOsR9Mnu30eJgkt6E0e6fiNcNSbZI5wBIWPCQupoaY5iIhLibu511
         39G/zeg2vjvNQ+Nyz1vsIb+9ZPMNjJiu2GqYO9K8FUBkiTukQY8PSV6kQdvhIcqHSl0Q
         y9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222330; x=1752827130;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPS4unWB2ZcBulBgsbUOEzWl0zbrAuljBCZj9zYhONY=;
        b=XegKMTwIpTVyISsNdMvLSsTw6bTLmXxqV3SWpNdiQndKRIdoTfiZ4Wuf5yoZT2hn/O
         /cfuWCwiK9YE9JKQtSkeD2nepzPQEso5xHU5OoSOA2FPm2PkaNBsFi+bBDKwvriSj3b2
         WOFVO1W1ClsxaC+tkR9E4iigMP2D0qXkwEsqIuf8rLp+p7wrBxbXWjIcc6gJkcAFqaEd
         iupw3rQs20eevw5ii82BaeR1VsANXzDxsi5clE8LoO6rmUHPG5zKYhgZUVO2BjAbtZL/
         qOlmvR15EoIeFaPFaUNF9QlBH7P9kWtCDW8wUJugOD6RooI5NugfvtHd5NMrKyU+SFaE
         n91A==
X-Forwarded-Encrypted: i=1; AJvYcCXMCZAeY9FBNiWfXlZaS4NN38RMwnBDllWhEYZNTOdmn1UA38m3rGaOg0kaM2y/Yz/fXHhJw4vqpJ2Op59S@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/tp1opb1Q7pdWfsJlaNsnxO7zG94XetJ+yGjbFz2zDOH08Az
	qdqZ0+JGwNbiXxVR9tE+Vemndl4VQPY/I/7uKgOmiHZPjve5V4h5XCELWOGm7focRGlB2T3/H9S
	25In4DKqEPhr912k4Fw==
X-Google-Smtp-Source: AGHT+IEnBWvD3yYNtRkBdA6/Yih7Va/FMD2Vu65hycrlK6/K05a3ktnefi7uyOtrMkeRanxj4iTfqvVTmG4Ou5k=
X-Received: from wmbel6.prod.google.com ([2002:a05:600c:3e06:b0:451:edc8:7816])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3491:b0:453:8a62:df34 with SMTP id 5b1f17b1804b1-454fe0f9436mr16161995e9.21.1752222330362;
 Fri, 11 Jul 2025 01:25:30 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:24:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711082441.4193295-1-verhaegen@google.com>
Subject: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
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
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Joris Verhaegen <verhaegen@google.com>

The current compress offload timestamping API relies on
struct snd_compr_tstamp, whose cumulative counters like
copied_total are defined as __u32. On long-running high-resolution
audio streams, these 32-bit counters can overflow,
causing incorrect availability calculations.

This patch series introduces a parallel, 64-bit safe API to solve
this problem while maintaining perfect backward compatibility with the
existing UAPI. A new pointer64 operation and corresponding ioctls
are added to allow the kernel to track counters using u64 and expose
these full-width values to user-space.

The series is structured as follows:

Patch 1: Introduces the new internal pointer64 op, refactors the
core logic to use it, and defines the new UAPI structs.

Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.

Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.

Patch 4: Implements the new .pointer64 operation in various ASoC
drivers that support compress offload.

This series has been tested on a Pixel 9 device. All compress offload
use cases, including long-running playback, were verified to work
correctly with the new 64-bit API, and no regressions were observed
when using the legacy API.

Thanks,
George (Joris) Verhaegen

Signed-off-by: Joris Verhaegen <verhaegen@google.com>

---

Joris Verhaegen (4):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
  ASoC: codecs: Implement 64-bit pointer operation

 include/sound/compress_driver.h               |   3 +
 include/sound/soc-component.h                 |   5 +
 include/sound/soc-dai.h                       |   6 +
 include/uapi/sound/compress_offload.h         |  32 +++
 sound/core/compress_offload.c                 | 210 ++++++++++++++----
 sound/soc/codecs/cs47l15.c                    |   1 +
 sound/soc/codecs/cs47l24.c                    |   1 +
 sound/soc/codecs/cs47l35.c                    |   1 +
 sound/soc/codecs/cs47l85.c                    |   1 +
 sound/soc/codecs/cs47l90.c                    |   1 +
 sound/soc/codecs/cs47l92.c                    |   1 +
 sound/soc/codecs/wm5102.c                     |   1 +
 sound/soc/codecs/wm5110.c                     |   1 +
 sound/soc/codecs/wm_adsp.c                    |  53 ++++-
 sound/soc/codecs/wm_adsp.h                    |   3 +
 .../intel/atom/sst-mfld-platform-compress.c   |  17 +-
 sound/soc/intel/atom/sst-mfld-platform.h      |   2 +
 sound/soc/intel/atom/sst/sst_drv_interface.c  |  43 +++-
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  41 +++-
 sound/soc/soc-component.c                     |  20 ++
 sound/soc/soc-compress.c                      |  21 ++
 sound/soc/soc-dai.c                           |  14 ++
 sound/soc/sof/compress.c                      |  44 +++-
 sound/soc/sprd/sprd-pcm-compress.c            |  28 ++-
 sound/soc/sprd/sprd-pcm-dma.h                 |   2 +-
 sound/soc/uniphier/aio-compress.c             |  40 +++-
 26 files changed, 503 insertions(+), 89 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


