Return-Path: <linux-arm-msm+bounces-51443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C54A616B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AA38164435
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 16:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DBA1FF7B5;
	Fri, 14 Mar 2025 16:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iy9tpTmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6112B9A5;
	Fri, 14 Mar 2025 16:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741970804; cv=none; b=K3ogztyNoCCC+X1jz4wRnYhW+DNZCW3wYCY2dYNdcgLiCeW4Fgounfoui8tR/K6cqcvNAhnRjyc3B0O28AmDZDdDGoqcfGuuSDxQobgMA2BSK11hIV/ag0UXTZVApRWOg41Ustrfuh9zD1DC3nc6mF6Fs1REKp/UL3xr3hBy5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741970804; c=relaxed/simple;
	bh=fv3iDtiDXFpq8gGd4TdoFu0Aau3u8SLRJFOBKl5H5HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4FzvoWraKfZZLA1JGQlirRT4UUU3k/7T6FHhbmOXGP0AfhOAo2RBKl4CBmqWMQL2UU6hAWtLf+uIDTYAnqmsTkePfkD7sRwDYub+EpdocqyMmDePuR1xGiVgv0mB7J+dj+fmsP+d03CEE7xNO7VxZjHWKXMaLsuNeg22CTz880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iy9tpTmp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA89C4CEE3;
	Fri, 14 Mar 2025 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741970803;
	bh=fv3iDtiDXFpq8gGd4TdoFu0Aau3u8SLRJFOBKl5H5HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iy9tpTmpwvaav5tAsDFi0yB0ASQ/omQACsI1ReeAofbBI0noNW/gIEa1DEc53LHF9
	 x6LHa3O8WMLi9vP0F6FNCjVwNGPERGAQIh/rG8M7oVlhbnku4Ilh32GO9qOeujQe66
	 SdfDVtEbA4BQ1Wy6GWWnBB3EbtBiNxvnudMKObLprEbPRFwoFZAUrU2uzRzxLgPpiX
	 5/eDEBZ9hFQ08FJsVyZTe6D3ysCq4WHoT/wX4C45FF+qciLZ+SpwASfP9YC3A/507K
	 7cHtfsgdaVAMrMC0yyLRX4r1ZxYtAWa4E/VMXRd7oSfLKNEhMO39E2G53pDqL4DSRc
	 MTqz+VWP7lMSg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tt8BH-000000000WT-0aB9;
	Fri, 14 Mar 2025 17:46:43 +0100
Date: Fri, 14 Mar 2025 17:46:43 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v4 4/5] ASoC: qdsp6: q6apm-dai: set 10 ms period and
 buffer alignment.
Message-ID: <Z9Rdc-EWhEH8IQPu@hovoldconsulting.com>
References: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
 <20250314143220.6215-5-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314143220.6215-5-srinivas.kandagatla@linaro.org>

On Fri, Mar 14, 2025 at 02:32:19PM +0000, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> DSP expects the periods to be aligned to fragment sizes, currently
> setting up to hw constriants on periods bytes is not going to work
> correctly as we can endup with periods sizes aligned to 32 bytes however
> not aligned to fragment size.
> 
> Update the constriants to use fragment size, and also set at step of
> 10ms for period size to accommodate DSP requirements of 10ms latency.
> 
> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")

For all of the patches, if the intention is that they should be
backported to stable they should have a CC stable tag here.

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 90cb24947f31..a636f9280645 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -231,7 +231,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>  	cfg.bit_width = prtd->bits_per_sample;
>  	cfg.fmt = SND_AUDIOCODEC_PCM;
>  	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
> -

nit: unrelated change

>  	if (prtd->state) {
>  		/* clear the previous setup if any  */
>  		q6apm_graph_stop(prtd->graph);

Johan

