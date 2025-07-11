Return-Path: <linux-arm-msm+bounces-64566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E40B01C1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D19354705C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B972980BF;
	Fri, 11 Jul 2025 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTLAhLTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328C28A1C5;
	Fri, 11 Jul 2025 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752237247; cv=none; b=RyNL4hW0m6TUWiXggvJf0OubyqsCxOZpFT4T1ExoN4Cbs/haz8hYKmAJ4WVEUO2DLg7LuFSX7bGuChBJyQrcBPO5+Bug5QsgmrC8BJsizrvX5VlcWQk2hDFCp6Mk3lTcWIKa5Ry2SKxmbBDIxoomkCCVUMBoq+OmBjCjeA2OHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752237247; c=relaxed/simple;
	bh=OaM04B/jvmRCFs9Pga6hG/UcJ4uI5yYpfmWIbmK2Zyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3bHI4lN8RyGcCxvsxc+7tnQCPgprisi3sw32ytD8DbZUNcdH51UGhK49Ytam8YnE9i8mZ2VSKFJ/ijGjVJbEQoVMRJ4tQDBGvi2CjJyc+NzxtpaqvuPT6RHY9G146t1UrjMqtFcrWqdo5+AK0tNqUVzhs3YClzwnPiBQshYyic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTLAhLTC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D88C4CEED;
	Fri, 11 Jul 2025 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752237247;
	bh=OaM04B/jvmRCFs9Pga6hG/UcJ4uI5yYpfmWIbmK2Zyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTLAhLTCRZXAC4B/2QKacwHAUGAi6WddnWYmmBZEgz/U07KVHiwt0PANdevA2fmRW
	 gWM2pmMus+RFmABeOsW5pGonIvo+KiacmI3KBi8rnrjRN94re/ZOvPYIzGBYXeRvzT
	 3269c/hfw6YgxKqV/Awqvy4tCE9NZwhyGtcY82Ee5wUEIiRFf63Vw4UcSpGevnYBeF
	 RuN1yBG0+m2E2XfP+2Nnf3S5jG/ZJpo0fFxVK8AIi6RgJiIbBHP41De+ubmZGo0oVx
	 br3pXXJLxUgerpY8f1BoD4YWU63zHnTMWLq4RxQi9r2mnnkoUlVHMRRlKd/PT1wHO8
	 sYlGlN6t2JKdQ==
Date: Fri, 11 Jul 2025 18:04:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: George Verhaegen <verhaegen@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aHEEu1eSSGRhITmW@vaman>
References: <20250711082441.4193295-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711082441.4193295-1-verhaegen@google.com>

On 11-07-25, 09:24, George Verhaegen wrote:
> From: Joris Verhaegen <verhaegen@google.com>
> 
> The current compress offload timestamping API relies on
> struct snd_compr_tstamp, whose cumulative counters like
> copied_total are defined as __u32. On long-running high-resolution
> audio streams, these 32-bit counters can overflow,
> causing incorrect availability calculations.

In your testing when did you observe the overflow condition?

> This patch series introduces a parallel, 64-bit safe API to solve
> this problem while maintaining perfect backward compatibility with the
> existing UAPI. A new pointer64 operation and corresponding ioctls
> are added to allow the kernel to track counters using u64 and expose
> these full-width values to user-space.

Please share patches for tinycompress support too, we need those to test
this

> The series is structured as follows:
> 
> Patch 1: Introduces the new internal pointer64 op, refactors the
> core logic to use it, and defines the new UAPI structs.
> 
> Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> 
> Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> 
> Patch 4: Implements the new .pointer64 operation in various ASoC
> drivers that support compress offload.
> 
> This series has been tested on a Pixel 9 device. All compress offload
> use cases, including long-running playback, were verified to work
> correctly with the new 64-bit API, and no regressions were observed
> when using the legacy API.
> 
> Thanks,
> George (Joris) Verhaegen
> 
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> 
> ---
> 
> Joris Verhaegen (4):
>   ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
>   ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
>   ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
>   ASoC: codecs: Implement 64-bit pointer operation
> 
>  include/sound/compress_driver.h               |   3 +
>  include/sound/soc-component.h                 |   5 +
>  include/sound/soc-dai.h                       |   6 +
>  include/uapi/sound/compress_offload.h         |  32 +++
>  sound/core/compress_offload.c                 | 210 ++++++++++++++----
>  sound/soc/codecs/cs47l15.c                    |   1 +
>  sound/soc/codecs/cs47l24.c                    |   1 +
>  sound/soc/codecs/cs47l35.c                    |   1 +
>  sound/soc/codecs/cs47l85.c                    |   1 +
>  sound/soc/codecs/cs47l90.c                    |   1 +
>  sound/soc/codecs/cs47l92.c                    |   1 +
>  sound/soc/codecs/wm5102.c                     |   1 +
>  sound/soc/codecs/wm5110.c                     |   1 +
>  sound/soc/codecs/wm_adsp.c                    |  53 ++++-
>  sound/soc/codecs/wm_adsp.h                    |   3 +
>  .../intel/atom/sst-mfld-platform-compress.c   |  17 +-
>  sound/soc/intel/atom/sst-mfld-platform.h      |   2 +
>  sound/soc/intel/atom/sst/sst_drv_interface.c  |  43 +++-
>  sound/soc/qcom/qdsp6/q6asm-dai.c              |  41 +++-
>  sound/soc/soc-component.c                     |  20 ++
>  sound/soc/soc-compress.c                      |  21 ++
>  sound/soc/soc-dai.c                           |  14 ++
>  sound/soc/sof/compress.c                      |  44 +++-
>  sound/soc/sprd/sprd-pcm-compress.c            |  28 ++-
>  sound/soc/sprd/sprd-pcm-dma.h                 |   2 +-
>  sound/soc/uniphier/aio-compress.c             |  40 +++-
>  26 files changed, 503 insertions(+), 89 deletions(-)
> 
> -- 
> 2.50.0.727.gbf7dc18ff4-goog

-- 
~Vinod

