Return-Path: <linux-arm-msm+bounces-50243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DFCA4E904
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA2C517DBA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1051627F4D4;
	Tue,  4 Mar 2025 17:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKNo/AJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51B27D79B;
	Tue,  4 Mar 2025 17:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107900; cv=none; b=k5gwbZImCtlBKVorkngEwIPBc+A1gz4xyb1NpwDsLUGoznHuUP8BxZjYr4x/qtZLLI2Z26mk70zFQSHnPROLpscvnh7xA7pFqjTJOFq2/A+aHjmpX6fgj3HQe2aqRRn9nzGAa/IwgzfTnlHGgch9OoW93ItrjkCZ0TdRNQhXTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107900; c=relaxed/simple;
	bh=VOr4C/YufA34Z7C2Wk93o9PgftV0cO+24SD6BSpr8zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sy8ksJ1rveNTEuVW8c8t1qSLsXPyK9QuZWczTIsRUbX6DQdTCfDxDV8zLfT1h7NxGSLINuXHnpfNEjKbXeNcfGGe3SThzBtIQSrTCyhq11fxVCaoHc7uIGHhZYAfUHHTT/SMEkopPavGlFuHTVT41M71K4EFvxI7lIuEwUuxVss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKNo/AJW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA7EC4CEE5;
	Tue,  4 Mar 2025 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107899;
	bh=VOr4C/YufA34Z7C2Wk93o9PgftV0cO+24SD6BSpr8zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKNo/AJWgngX+8gFX0PVeUl/icP5ndylf6Nh2y2ihfLcqgcQrdXCfiphCaUA4fGy1
	 aPfhXAEo6quMMzhOZcCG0yPsuMyZ0zBhChsfpaihVSXpofQCJRMBjLpI/EQ8Kspazd
	 RPr9QtKS60iWfIZgnjONqc5PcahrkWTyjmu67UYZtWLMqbi9T1pNAGGMy5yt0w3pcZ
	 u4C69I/VIuJu5o4sgRPGbL26w/EFDoLxzxKWe5R7rIWFMl6JmhOUjWDoocFUGwWpSy
	 1OvqVDpFUFWrbUehoOAdfBhjXIjX+XEOdGoBiUTV1nvLJUgKrj807LVgY/hfsZauot
	 tnovLTHqnYK3Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tpVhP-000000007bF-26pi;
	Tue, 04 Mar 2025 18:04:55 +0100
Date: Tue, 4 Mar 2025 18:04:55 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
Message-ID: <Z8cyt2n7qj4GkcJC@hovoldconsulting.com>
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>

On Tue, Mar 04, 2025 at 10:57:17AM +0000, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> both recording and playback. These patches fix issues by
> 1. Adjusting the fragment size that dsp can service.
> 2. schedule available playback buffers in time for dsp to not hit under runs 
> 3. remove some of the manual calculations done to get hardware pointer.
> 
> With these patches, am able to see Audio quality improvements.
> 
> Any testing would be appreciated.

This fixes the playback and capture issues with Pipewire, including the
heavily distorted, choppy playback when pavucontrol is open. Turns out
that the pavucontrol volume meters reduces the output sink quantum size
from the default 1024 to 256, which was too low with v2 but now seems to
work.

Unfortunately, this series still regresses Pulseaudio as capture is now
choppy (e.g. when recording using parecord).

During our off-list debugging sessions you suggested reducing the max
capture period size (that this series increases) to 6144 (same as min)
and that fixed the Pulseaudio capture issue. In v3 the, the max period
is again increased to 65536 which appears to break Pulseaudio capture.

> Changes since v2:
> 	- dropped patch which is causing regression with pluseaudio.
> 	- setup period sizes only for capture path
> 	- fix underruns/overruns in dsp pipelines.
> 	- add fixes tag
> 	- add patch to fix buffer alignment

Johan

