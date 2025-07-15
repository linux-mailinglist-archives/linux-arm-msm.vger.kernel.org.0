Return-Path: <linux-arm-msm+bounces-65038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B74CDB05A66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 14:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD0A43BB9A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A3A2E03F5;
	Tue, 15 Jul 2025 12:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/WMW3aj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114AE2D836A;
	Tue, 15 Jul 2025 12:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752583199; cv=none; b=k3BqvNIU2P8jrzhSt30P2umlgr0P1aK+tkMTjV6ZjCsKgCctOrMxOVaRhi72M4i0lHo3Ar/Sl9zPBzWlCO/LuQmBndgIFUSv9IPwfGvRcBM4O1XgXneobk+QlnInVPRnKMS7RIebzfhjes1CHsjE43b5RfVsDbEyF/JfpJhbyig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752583199; c=relaxed/simple;
	bh=+pu90pMOXbQaEW9Hm/kqWZt7Rsk1N7XL4gsFDUuXDgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j52FALudz+9qrUJdAZqmM/4aY9F+/q+A8SF84vbmvAxZLrBYw67uuC4tmKH699CdARh9W3h3kj4H8iPd4lpbUnKSCzs1QV2dgj/iSC++w6vcHqkBjQNKb0LTCGFFXr4OCdzRT9kWOvj2XXQ0/MYWDWV3RAV15aqzMx2Y4GDxGUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/WMW3aj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3954EC4CEE3;
	Tue, 15 Jul 2025 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752583198;
	bh=+pu90pMOXbQaEW9Hm/kqWZt7Rsk1N7XL4gsFDUuXDgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/WMW3ajNFuEcGUS5cLW97Lm53LVFFJGyl6fCTT6uNS0KVjzfi73bLTLwGMrtIqbd
	 2PD7zzl5wx41pkiTd4E1MbCoFbyq6mYN3ZMrbph1XW/ogXdlYh6BhAPgbe7Q8370IR
	 QKKBvE9KcMVo7ez+Q61Lzj4C2+Wwdpj6EPFzjelBoTzO9VLP0NncA/0T4XLsnaNRC8
	 QYa33a6PxhIwcQAh6jnQMFtto5x9qx43OsmRQTlDbjSrz1E0l7StRXb1ihPod8JFl7
	 V+ZEtH41mxOGUgbsh+sZfjco3/H7VWG5NALXVHS/aWhARrQUp7PWLIA9WePeMzJel7
	 N9m+GRxBcgPDg==
Date: Tue, 15 Jul 2025 18:09:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Joris Verhaegen <verhaegen@google.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
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
Subject: Re: [PATCH v2 0/4] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aHZMG2XnCLoBuf9T@vaman>
References: <20250711093636.28204-1-verhaegen@google.com>
 <aHD7/9MZbcOmn+08@opensource.cirrus.com>
 <8734b2hpcu.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734b2hpcu.wl-tiwai@suse.de>

On 11-07-25, 14:41, Takashi Iwai wrote:
> On Fri, 11 Jul 2025 13:56:47 +0200,

> > Would it not be slightly simpler to just update all the in kernel
> > bits to use 64-bit and then only convert to 32-bit for the
> > existing 32-bit IOCTLs? Why do we need 32-bit callbacks into the
> > drivers for example?
> 
> Right, it's a usual pattern to have only the 64bit ops in the kernel
> driver side while providing the 32bit stuff converted in the core
> layer.  Having two different ops are rather confusing and
> superfluous after conversions.
> 
> If there are tons of users for this API, it'd be needed to convert
> gradually, and eventually drop the 32bit ops at the end.  But in this
> case, there doesn't seem so many relevant drivers, hence the
> conversion can be done in a shot as done in your patch 4.

I agree we should do that. Kernel can be 64bit only while we keep
maintaining the 32bit ioctls, cant drop that one

-- 
~Vinod

