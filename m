Return-Path: <linux-arm-msm+bounces-31388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA935972B19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 09:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 719A51F25280
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 07:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB61A181B8D;
	Tue, 10 Sep 2024 07:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLaJL4I2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD118005B;
	Tue, 10 Sep 2024 07:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954329; cv=none; b=h41rRnr4F0l6jGQJqYNSudHMFcPPBRxVv9fDlujbmpFSzNe/qmD7m3t+dTj1BizpWTs8ebO9OnBBVZxo4io5C0IOp0LkxJQOOiWPoOz7632ivF6sUy+rrjjMUbGRxZFlt9XU3+Wa18RZoOTDSRkoIouLNVFOqYVcMHZaUeNHVsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954329; c=relaxed/simple;
	bh=A3iT3UI6JBnawx1kR183QC48x7S8QfaDWO3AeTsDm8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=colSTFLFcZFSI6zwzhEsmUPN04lopJg02bQ9Uh/8f1hPwyZCxk8RaRuS3MC1lcDnNQU+nDzszPBKLuytrArT0LQwYDTgyI6K6xZhqrLeaxoaWqYh/mUNQV7nJCvz9l9bwS1jKrNtAfi4WEbjQP3RkwrWo4Q1QhOTRmfxOjrQn5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLaJL4I2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7164FC4CEC6;
	Tue, 10 Sep 2024 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725954329;
	bh=A3iT3UI6JBnawx1kR183QC48x7S8QfaDWO3AeTsDm8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLaJL4I2aJXLRPZC/BfopQSW1B9zauaDiNO8jVrQ/9KX7TebFEuzyroiZdz6Odtav
	 nQg68cJj+lOxNHfW6mwWO38ctNPzJRFVzw2m45P3nwilhOc2vipK7XyA1HjrOeM83/
	 Zt+WBy2/BHiOyfV2JmL9megPEo85W6n/ZjyZVmHHpMlGQrSOPm7O7MHU+9i74KjxNd
	 smEgNXg3I3pJ9TmatdNkCeq7PaDJ528tIVEdUqyYdnHL4m54SDJzVgUez/dbTU1hjX
	 qJJm9YBjKgc0fXEm/Zd90ikgvExXGOkxHX9PDIMjgsZWKEdfjIwgPWWCweZi473giv
	 psu5nJuzCMjRA==
Date: Tue, 10 Sep 2024 09:45:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>, 
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, 
	kernel@quicinc.com, quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: wcd938x-sdw: Add static
 channel mapping support
Message-ID: <jkczvc3lclyr74mecvy5dr737sjyiotepamsoz35wtnmx3cigi@vuvyovfecbvc>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
 <20240909105547.2691015-2-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909105547.2691015-2-quic_mohs@quicinc.com>

On Mon, Sep 09, 2024 at 04:25:44PM +0530, Mohammad Rafi Shaik wrote:
> Add static channel mapping between master and slave rx/tx ports.
> 

I see ongoing discussion, so if these property stay, grow the
description here to explain how this describes hardware or which part of
hardware you are covering.

> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)

Best regards,
Krzysztof


