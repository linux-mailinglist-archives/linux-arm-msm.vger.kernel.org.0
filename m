Return-Path: <linux-arm-msm+bounces-74027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B775B82F2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 07:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE8CC482CFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D726C27147D;
	Thu, 18 Sep 2025 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZNfOIMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0D24678E;
	Thu, 18 Sep 2025 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172144; cv=none; b=YUTdl+/S27ENwmFYvycSo/Zx8MQH0NjYUdpEd1b6/RwrSU/z0ex3JeJ0/SsvXj1pYar/wPX3RskJ9nGvIkqEJRhJEjzQdsdd/bMREkao54VBb3yBtOeTuUT50k+2zR4pPmD6Y+OflDNITrcY3EKgyyN8q5RswoQL+wrBJMy/g+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172144; c=relaxed/simple;
	bh=XDnouAeMgkL9tfgAX5X+dRYYplXVyaHHls78QzjPx7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+7sZiy1xJNmFNHG5HukzSJWpNE0IZcE17aq+q8uIBpZT/Jx7gmHpN4CXgZeCs2gN93/x+H5J7aEAirAhKRy3h4tzh26Q26k2Wmuy4q10K2UQtZNS70MGGbg2zc7KFN4lBMXN3+7Yl07+OWFO8/m+lzT/7P+fDeNi08pvgeTqzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZNfOIMc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4ACC4CEE7;
	Thu, 18 Sep 2025 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758172144;
	bh=XDnouAeMgkL9tfgAX5X+dRYYplXVyaHHls78QzjPx7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZNfOIMcGeBPB5gegvZ0KS3lDG1ZYDat8OG3wv0u0iAVtQ/NjChRybw0VgZbHxkNG
	 6J9sLeRhGbD8FOYhSSQAlgINCfwkUTnGFpHoFxQAhL54aq4XnXDNTbg4dx+tl16Hn8
	 qpfH40nSK+ad/OL/sfRFoxjySQjFsxMiTgrz1QDXTVFVcOfky8HfeuT14bY/LC5cyw
	 X3/P/brFMtHRayHEsUa7Y583SXBBeI7zc84J4xzK2UrRcTK7YYYd8B/RYpHk6+3qmz
	 gjaZaZ8TyCL6iMAIvmOw/3E0QMgAJgbcY2HPdaE235ajTGvtRKlGqJ0Z5PHZN5bFvi
	 3LvIVTZjWFMDg==
Date: Thu, 18 Sep 2025 10:39:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Patrick Lai <plai@qti.qualcomm.com>,
	Annemarie Porter <annemari@quicinc.com>,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel@oss.qualcomm.com,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v3 2/3] ALSA: compress_offload: increase
 SNDRV_COMPRESS_VERSION minor version by 1
Message-ID: <aMuT7DF56V1BUW4e@vaman>
References: <20250917-opus_codec_rfc_v1-v3-0-7737ad40132e@linaro.org>
 <20250917-opus_codec_rfc_v1-v3-2-7737ad40132e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-opus_codec_rfc_v1-v3-2-7737ad40132e@linaro.org>

On 17-09-25, 08:32, Alexey Klimov wrote:
> Since addition of raw opus codec support we need to update
> compress API minor version by one.
> Bump the SNDRV_COMPRESS_VERSION to 0.4.1.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

