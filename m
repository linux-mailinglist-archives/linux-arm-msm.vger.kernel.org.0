Return-Path: <linux-arm-msm+bounces-72472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F04CAB483C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F4006189B844
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 05:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2ABC1DFE26;
	Mon,  8 Sep 2025 05:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwPmLzhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E036B;
	Mon,  8 Sep 2025 05:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310437; cv=none; b=ZpOyCkH0Yvk1IUDcQeqRZA5BEhloAtj6cw3TsfOSK+Ety0c3JeC8xZmDP4w4Na4dUMhe5XEkqVBIbP4xl3kkO/3I1b2AAS/8QkuzQK14zT3/Wb4BCLz86pIYkvCixzMXF373+27smahzUVV2mIdBhgnYygPjvLq2Cl415xMUGO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310437; c=relaxed/simple;
	bh=+DHv5K7x5Zki24ku10wUAB+lb3qUxD+Z6s1puPCmfY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bU8gUVtPmfatUb064t0TWfQMfhWyNOxBIpRXFmUrwHO1P0SnxYVZDX71Ht5jB0+aZCWHoDnBx3YQ/0O/KoYlY3VEdPyDIm8nt1IUoLC9mIGQV4QJblBK9wFqZUUe6d87HRVFisCM/vr6KjJR/tyGIWwwVTmT1kjYTNxmkfXfg/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwPmLzhw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681CAC4CEF5;
	Mon,  8 Sep 2025 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757310436;
	bh=+DHv5K7x5Zki24ku10wUAB+lb3qUxD+Z6s1puPCmfY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwPmLzhwd1dzRc6PwRyjdCCDbb225leQScVwdBe702q/6RYoAkLXW3g9ZA+8ZXJaH
	 HL6u6rZJwtonfy4K5YPBpK2MBANo4YKJN39xR82lLhStYUtdtgSiAUgEhygmdSqPJo
	 4D9Iynm+o279EbEXJwdslmSRGJrEwfb8mKm6vucWF3YTbPG/cSrmEfGfKCuT53LNOU
	 vl8Rl2pD7jItxhYWqiPjfbhWDXOsf27du7tzOe+I0gs5WII4E9vXbFTC+NMHZFpE+6
	 6Y91c5g6IhHZDyKyIWKpTRVcL4XPM1ZQlfdJv4LhCMorOkcntLoNM2DY8ArJ0VqIZ1
	 7LRlL4OC1L69A==
Date: Mon, 8 Sep 2025 11:17:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
Subject: Re: [PATCH v5 0/3] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aL5t33Ztwse6HoQP@vaman>
References: <20250905091301.2711705-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905091301.2711705-1-verhaegen@google.com>

On 05-09-25, 10:12, Joris Verhaegen wrote:
> The current compress offload timestamping API relies on struct
> snd_compr_tstamp, whose cumulative counters like copied_total are
> defined as __u32. On long-running high-resolution audio streams, these
> 32-bit counters can overflow, causing incorrect availability
> calculations.
> 
> This patch series transitions to a 64-bit safe API to solve the problem
> while maintaining perfect backward compatibility with the existing UAPI.
> The pointer operation is reworked to use a new timestamp struct with
> 64-bit fields for the cumulative counters, named snd_compr_tstamp64.
> ASoC drivers are updated to use the 64-bit structures. Corresponding
> ioctls are added to expose them to user-space.
> 
> The series is structured as follows:
> 
> Patch 1: Updates the pointer op, refactors the core logic and ASoC
> drivers to use it, and defines the new UAPI structs.
> 
> Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.
> 
> Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.
> 
> This series has been tested on a Pixel 9 device. All compress offload
> use cases, including long-running playback, were verified to work
> correctly with the new 64-bit API.

Acked-by: Vinod Koul <vkoul@kernel.org>

Please updated tinycompress changes with this once this is picked up by
Takashi-san

-- 
~Vinod

