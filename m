Return-Path: <linux-arm-msm+bounces-47273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46AA2DAB3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6108F7A21C8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A8E182BD;
	Sun,  9 Feb 2025 03:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="Ua0RKQyO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AC41BDCF;
	Sun,  9 Feb 2025 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739072927; cv=none; b=tPCL4L4GysvkNy6CcltHGbOXMv/TyGPZc8SsOS27GVGY8oL7eiJx2SxfQQKWrbaXH43SV0zWbzT9rq4/v2keF9xL9fiscMBt8Xfios4QENX2R4v7BUS/PtP/YGrPGSBDtu8iIw6XSKsDmvBdyWGAg1tX2IUV87+wziMK0wHuRaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739072927; c=relaxed/simple;
	bh=Ic8Nual4Xw1g6kb4I2rOetEHmVrR1/wPufL+tPhpbc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9PQTaXdhx/NZn8h/ytrsQCAcyyEuZAWNFV8tQo9ld71NPDqkqhZt1yUj5je1Um1Ls/khQCUiNw8K8RkiKDf6BPQlS/9Cl07TsGCm92y8hHYx+kclHVdRrcizp8cGbP+mfQin67XrD6/+SjSJiQdd4gFuZimWqRkuz5eaXgrHDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=Ua0RKQyO; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YrD815h4Zz9sZv;
	Sun,  9 Feb 2025 04:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1739072609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gqoZcM4nfDwbCLWIhNBrMzj0yt+yJ0Y4yVQAT7915pA=;
	b=Ua0RKQyOc2Ls0JEfvaVdqF3BIMlp0kOToonnRrXBi4AMObu54PEl/drQd27U1eBrFoYzdy
	XT2nIK7r8O+hI5TFeEZtsPkwuMvIrxU18eijwVBYE4an4rvxsyd9cC/V2QJ2eNxve9c7a0
	cyKkObbPDpSMkAFiHcotMhs0qzi4utYNKwnxkU6VVnCb+uScm797iweUaUBGlznPeWwDyW
	C3A6owfQOD6aFaGdATm4JF58DiCM1ScCm7eH5VVzvmuXXvc/U6LDRga6og2fFXdRstok5j
	Ou/FTnP6y2Il0vwa3q+COl03OM5svCBh1zcnTkkin2oa2JwJ7G90GBlnToArig==
Date: Sat, 8 Feb 2025 22:43:26 -0500
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: q6dsp: q6apm: change kzalloc to kcalloc
Message-ID: <lcaqr52jf5texgoro2mm5kegykgwaifq45m6gkln47tg7fjv4r@4cxw374tspnj>
References: <s6duijftssuzy34ilogc5ggfyukfqxmbflhllyzjlu4ki3xoo4@ci57esahvmxn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s6duijftssuzy34ilogc5ggfyukfqxmbflhllyzjlu4ki3xoo4@ci57esahvmxn>

I wanted to check in on this. Anything I need to change?

Thanks,
Ethan

On 25/01/19 08:32PM, Ethan Carter Edwards wrote:
> We are replacing any instances of kzalloc(size * count, ...) with
> kcalloc(count, size, ...) due to risk of overflow [1].
> 
> [1] https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
> Link: https://github.com/KSPP/linux/issues/162
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 2a2a5bd98110..11e252a70f69 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -230,7 +230,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
>  		return 0;
>  	}
>  
> -	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_KERNEL);
> +	buf = kcalloc(periods, sizeof(struct audio_buffer), GFP_KERNEL);
>  	if (!buf) {
>  		mutex_unlock(&graph->lock);
>  		return -ENOMEM;
> -- 
> 2.48.0
> 

