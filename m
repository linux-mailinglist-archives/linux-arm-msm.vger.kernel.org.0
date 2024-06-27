Return-Path: <linux-arm-msm+bounces-24469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F13EC91A804
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2135E1C21470
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585E11591F0;
	Thu, 27 Jun 2024 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkzLdkXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB155193072
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495487; cv=none; b=Qhy4lyfQDOPz/20l9D6N9M/0Dh6wvQC0SIO45lphZEHyVZqYX6LD+yOvIwodDOPiWQK0RMkCic8Q7CnVEKN52hgmaFO41yl002tLfMLViD4Xc4tGn8nDOcLNTfhP+n+f1ydZBVSC1869vT8nkKOmilOGrTARPeLP/v1iXEYCkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495487; c=relaxed/simple;
	bh=zlWbv23yLnjGiL+Hwn58YyoDm6gTItwlsW44BzEfxBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HR3xY6at51Z2SMFI6amr+RraZ5slQqWsiD+atBvNmiIr35IL3bwNTFlUcrAReIrTlK+Rhe+odkrXk8uESjgHjKKhzUoJTvQ84117L459feDu8ioClMj0VgDTEAEhLaBjDZNiHzlh2IfqxalfFN5Hiw0mhpXAIaDPqQwP4fAw/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkzLdkXK; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ce674da85so4974283e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495484; x=1720100284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1nVtFcR4qXFe32k9YlzAMOipXNA9mfmYhrI52Tfj7Q=;
        b=wkzLdkXKrkVzMZfTFpyu1RlIjx9xu4fQn3lGWfIJdb5tkNVCKLljBDjxejWRbf2vbW
         TUY9oD5DQsdt9MKEF/bwej77Ey5VqET/aeRXi2vxFlW2ZH19w/SULSa1O4zXekMWcCMZ
         HzFigy2ccgGMGwrPOh9FiracemwRs643TH/Qm5RTCzeLZ4JvaYavY48yWViOihKfL7rn
         6roJryirzb9qAMcqxH57Qeij19ShiP/AoVSy2OZChyUtBhikXWO7ROGGd9iMpS/0iq3H
         QMY27Ux7c40G4i5pzB+9KLC7xM0cnfjP+p/qS5mAsytCU64QhVYi4wVAnXVjymToHitY
         0vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495484; x=1720100284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1nVtFcR4qXFe32k9YlzAMOipXNA9mfmYhrI52Tfj7Q=;
        b=sqzxPwgtY1zOHzhu8Qr6Zh5izBpgAQaL/FgefB9bpMjb8Hd+amJvsKZxS4HEYO/Ro2
         JktEmO7+TE9NaSk+YfHd6tpT26XRbgHlTmVjWf1d4WA7RjDJoUkCBoya71cwmm7wPWdl
         JTsBeipQxg01HDqnqWR7aUvDgaTSKohiYCOarSHL9ZoC27T4xmxXy8AwQ1CMREhTDdzp
         gNLgmS/6ml7R6r8HvAWvCvuN38YHANxsOzuMxtUtLeZ2pVI7IFlTduj0ECvg/YPGOHfh
         T9JebN0F+Jx9zk063bkbWOQqyf+Kk6uz8juKfd7r9F41wCYhSYsdmQ1hxn7qGjz06J+Z
         9Gig==
X-Forwarded-Encrypted: i=1; AJvYcCUE9WqmEaHrYLiF0FOJf/xSr1EYEIAoMIsHOU6I8zq+0jKhzVnmeIAtpgb4kP1hukyCGCRh8dumHXuu4L5AZkDzPl8TaJdWWJZfdxDCEQ==
X-Gm-Message-State: AOJu0YxYs6mP7SyoLwzwC9KyU+J4P27v+5ZODmoFeHFgQnoyMLZbFEPb
	q4dDyz4EKMd2JecIX34UbkQDNJbCE7ANBaoNDDS3PnVotZfUudt958SrMdD3NBI=
X-Google-Smtp-Source: AGHT+IGt/T6ryAQ5fIZrriDIODzgzCJHjaJBSRs8dHehQYvz1xIxu8NpVbr7FP8bm81xWv9Zq+eRdw==
X-Received: by 2002:ac2:5607:0:b0:52c:e0e1:9ae3 with SMTP id 2adb3069b0e04-52ce18614d1mr10442288e87.57.1719495483953;
        Thu, 27 Jun 2024 06:38:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7130543bsm207833e87.136.2024.06.27.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:38:03 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:38:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
Message-ID: <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v1-4-bd8987d2b332@linaro.org>

On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> This is required for correct port mapping between soundwire device and
> master ports.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa884x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index a9767ef0e39d..72ff71bfb827 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>  	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>  	wsa884x->sconfig.type = SDW_STREAM_PDM;
>  
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA884X_MAX_SWR_PORTS))
> +		dev_info(dev, "Static Port mapping not specified\n");

Same comment. Either dev_warn (if it's something to warn about) or
dev_info.

Or, as your commit message mentions that it is required, it should be an
error if the port mapping is not specified.

> +
>  	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
>  	pdev->prop.simple_clk_stop_capable = true;
>  	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

