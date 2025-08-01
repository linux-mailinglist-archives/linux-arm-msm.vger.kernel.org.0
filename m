Return-Path: <linux-arm-msm+bounces-67325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E54B17F3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1A527AA77B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774C12253F9;
	Fri,  1 Aug 2025 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AC6xRFRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3F2236FB
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040479; cv=none; b=utYnlQ3PasdZjtJOraSk5stJdnwL+u3IyETvNxgrrUbCN/kMN9pYj8jBfZifb5W3QfJALMYIeYMviXeWc4ygPmo4cnALptHC91WY/GfpPoc/ymoXpaGUTB0BEFShra2Pa1LtcvEb7rzcFeFKVmP+pmUm9QaiUn91Bqzn86xxuDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040479; c=relaxed/simple;
	bh=WsYd6864mwvd5jFI3i5nTHTgCW82zOMJotHg73Gn9v8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=guR9Mrg8BoD4r9VR3IOD0VJvOLgsA4wNTiPJEyDGNRyqVUq7kSLIYzuFwyCj1aG25GXfID7ZxhRb4CA3+Z6xQSHBnT2ufnLFg38wJrA4O5AMFURahQmfTLdw0bR4LywjAtpUYLW81tlo4wZEtaphmX0Hl1C0lX0Hd+Ip3V3M4QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AC6xRFRc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4538f375e86so16681045e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 02:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754040476; x=1754645276; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E+cl2IDaMY20eY/Exe5SGnYzjiyN45MuL0dq0Zp03p0=;
        b=AC6xRFRcv2rZnILHJw+GtWNIO/2nVgHKhSXyq+MD7z+Z1uHpZM9bp49YDo5YqvdSjh
         x2Gx0F0Ywfi5jMNIsAKCy0TBXogDrzK1O1UNKZXgefLpHe57ImbdhEsNFj+cWtwHY3UI
         2IMUetJB2r4V3KkeRX0nvAFoYuTFl0z143fp6Djib9mc7MC6mXCgb6o/Sci4B22dL6cx
         uoe52BZUK2rE2XppUGXdS+3QJHs9vq5W0A0Bkh0mJExFoc7IocxI3hDahLEhVmxLQq51
         cW+hVjvaoklhPPLH0qxTAqTUd+KKOqwwS64d3idrGW1eWN0MwYk0O8AqvzeOZkY8zNmv
         oPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040476; x=1754645276;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+cl2IDaMY20eY/Exe5SGnYzjiyN45MuL0dq0Zp03p0=;
        b=n5pavL7Jl/ED4Kdv+BdR5xcdurLYwO9toasXKHg6TNmxoRXpb768Bgeu8X2Dx54uJY
         tksNexO+Q1iYVOtVNHfLWl3XtJ5fv4Xg9ULbiwUZW1H4cjiD/9S+/g9AoA2ePIXJw4Wt
         mkxmdbCkGeLtsam73+5Y2HhJkHVXrBTL1EyuoZ4sw/ewO3dnFKXRIpoNaDLWB3dEPAC6
         WJTTAOOeMlvukZpnl3FfFv+1sGAw4VYUf1Jcr+D1CgG5NxvLUbbPUwkChvEzrvJ6+Q4N
         udYaNGJX/eJO3QX+5JTUecfFOK2utLRufM68ciOsqv4R2nhenBxA30C/g9WXDA6rLoz3
         phNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDcLhHKmLdVhC9UX70DkEFazILMUI591Ww5OwyUBst2XqFFK5Af1FCu98v8Tb9O2NDytASjOdhFdoOrPy7@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtI9CT5yW8/OoQ3EK/EzI4RhKn4gLRFBuXBAhCU2VEEkEggzO
	gExKSL7Mm1kacdH/IGGb6uiycked8+x2AYwQCql7V9HceFYfE58QwPqbaBzqt5J5albLYwtVy1S
	tYGrBqTqJsiEntA8XsQ==
X-Google-Smtp-Source: AGHT+IF1iql6p9ZiBFX2YHY0VuHnMfPg0tt54Mz6D7ndvI/Hg7HtnMzULqTKeUWs76Q9xfAXEqpzcIP6cwznc6Q=
X-Received: from wmbei11.prod.google.com ([2002:a05:600c:3f0b:b0:456:217f:2625])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8812:b0:456:2397:817 with SMTP id 5b1f17b1804b1-458930ecbccmr68523175e9.13.1754040476070;
 Fri, 01 Aug 2025 02:27:56 -0700 (PDT)
Date: Fri,  1 Aug 2025 10:27:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801092720.1845282-1-verhaegen@google.com>
Subject: [PATCH v4 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
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
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

The current compress offload timestamping API relies on struct
snd_compr_tstamp, whose cumulative counters like copied_total are
defined as __u32. On long-running high-resolution audio streams, these
32-bit counters can overflow, causing incorrect availability
calculations.

This patch series transitions to a 64-bit safe API to solve the problem
while maintaining perfect backward compatibility with the existing UAPI.
The pointer operation is reworked to use a new timestamp struct with
64-bit fields for the cumulative counters, named snd_compr_tstamp64.
ASoC drivers are updated to use the 64-bit structures. Corresponding
ioctls are added to expose them to user-space.

The series is structured as follows:

Patch 1: Updates the pointer op, refactors the core logic and ASoC
drivers to use it, and defines the new UAPI structs.

Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.

Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.

This series has been tested on a Pixel 9 device. All compress offload
use cases, including long-running playback, were verified to work
correctly with the new 64-bit API.

Thanks,
Joris (George) Verhaegen

Signed-off-by: Joris Verhaegen <verhaegen@google.com>

---
Changes in v2:
  - Corrected author and Signed-off-by to be consistent (Mark Brown).
Changes in v3:
  - Rework pointer op to return 64-bit timestamp, rather than adding a
    parallel pointer64 op (Charles Keepax, Takashi Iwai, Vinod Koul)
  - Bump the protocol version for ABI change (Takashi Iwai)
  -Fix linker error on Intel Atom (lkp@intel.com)
  -Rebase on latest for-next sound tree (Takashi Iwai)
  -Avoid changing return error code for ioctl (internal)
  -ASoC: Replace u64 % u32 by do_div(u64, u32) (internal)
  -ASoC: sprd: change current_data_offset to u64 (internal)
Changes in v4:
  -Fix compiler error on Intel AVS (lkp@intel.com)

Joris Verhaegen (3):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl

 include/sound/compress_driver.h               |   2 +-
 include/sound/soc-component.h                 |   4 +-
 include/sound/soc-dai.h                       |   7 +-
 include/uapi/sound/compress_offload.h         |  35 +++++-
 sound/core/compress_offload.c                 | 100 ++++++++++++------
 sound/soc/codecs/wm_adsp.c                    |   4 +-
 sound/soc/codecs/wm_adsp.h                    |   2 +-
 .../intel/atom/sst-mfld-platform-compress.c   |  12 ++-
 sound/soc/intel/atom/sst-mfld-platform.h      |   2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c  |   9 +-
 sound/soc/intel/avs/probes.c                  |   2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  26 +++--
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  26 +++--
 sound/soc/soc-component.c                     |   2 +-
 sound/soc/soc-compress.c                      |   2 +-
 sound/soc/soc-dai.c                           |   2 +-
 sound/soc/sof/amd/acp-probes.c                |   2 +-
 sound/soc/sof/compress.c                      |   2 +-
 sound/soc/sof/intel/hda-probes.c              |   2 +-
 sound/soc/sof/sof-client-probes.c             |   2 +-
 sound/soc/sof/sof-client-probes.h             |   4 +-
 sound/soc/sprd/sprd-pcm-compress.c            |   6 +-
 sound/soc/sprd/sprd-pcm-dma.h                 |   4 +-
 sound/soc/uniphier/aio-compress.c             |   2 +-
 24 files changed, 173 insertions(+), 88 deletions(-)

-- 
2.50.1.565.gc32cd1483b-goog


