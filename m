Return-Path: <linux-arm-msm+bounces-27679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A02A094466A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 10:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B3FF1F24648
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B83516DEA7;
	Thu,  1 Aug 2024 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XnyxjlFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF913C8EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 08:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500467; cv=none; b=sYHrI8dDkRJYYADBY0vNXX60Am4f9DWU9Cq/Dd9iqLu1kn1cjlNUzzW7yAW/8ajt51R8pQuagih3nUJ61LW96swl4Sb4ENcRM6XvFL59rjQ/luMvcIfGe1077c2YFcmNdyQccLDMuW3xiHLl1uT4YXf6lpdMZvr6LOhzggIcRKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500467; c=relaxed/simple;
	bh=Z/R/jE3UetsT6jIzeeUL2oO4nHocrgIt0QNSJ9yXa1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfdgGw6dqk3ntDWq8vBeOqEQfo1AQ79J2xmrLz1hjZIBtO0x09EpcPOBRLqJrRug+08l+gKyQdCs9vfm0jXG0X3/jw4rrtpOOd3TPixPAssGnEWlP2/0MrBc6vxfwTas9Z63ahIPw7ir54DCdAE3yoEZjTfJbytDaL+OflXV9dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XnyxjlFg; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so85697191fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500463; x=1723105263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwtmoHKhwxmQ7ba/RVWyEJFACGd+bpfz3WwZuXqhvo4=;
        b=XnyxjlFgbVZt4olAK7yBuLYLCB/svNm+FWPUA5ZjttlNHgYRSFa8gEWMben7m07nR1
         XXWa66aWyFgKaAOgYZXQx38nrFdp7JH0uo4Xn6qsI290MzjU+nW+iNiDMpZVHbPBPIFA
         /aCK4OMg9zALOgf/pGI7RFSUZwjWe9kfPNYdsgZz0MQhFcy+kMhkznvbasMzEn7IXjYJ
         c+d7mZ4dHub7c+uDK+/Y5fT1WOYhi33Vb2wE7lmKziaOL9F45XAKovcwEb+GVw9w2stl
         xWvhTqI8kx2OgNrb6BhUkCCDmgBOifg87ylnZL7pgedJRzvv/jwGGcCuR6xyfrRLd0BN
         1Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500463; x=1723105263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwtmoHKhwxmQ7ba/RVWyEJFACGd+bpfz3WwZuXqhvo4=;
        b=p90MnSDnu/0rWRRCv/UF+YkMnQdYIyDcMojvcO8MHy3XJ7r5vxsv5CJPpWLfRkVVtr
         2aKR4NihDWmrd8CWztIHNI7n1V1u8UZR88EvhtAp6fthtk6PElOuvdOl4LgqSZpUNSRD
         JFvRGOQKh1CSWS2HJbZ+IbE/t2YvZKx5Li3GMKKuB/ctCVjWd3rmkpkIWBrCKphhm7bS
         oGCVDf7czaBqyItP3sHcL4G3rPT6hETn7388wAJFm4Oo8lZ0Wmf6p0pJu7J7giC1E8+p
         N1vebr5XdG0TMTrw6zFwhshC8kiR/0zd+iy3afmUZfI0l3oiesDOLOFJdIGwvMY9ZiYE
         0YMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiUgex2aWklHkWgbHYcI6mqeRDyGb0nj6u7O46r/tCJiDvzBe4YtAPRrQergStQy1KxkiMZYnXfKY2mqlGWhL/MbnIE1RdkwwVWgCbAA==
X-Gm-Message-State: AOJu0YxGciUdLSz0N/zTHHkf7BWDv648h6fIFlFRvX++AoPY41Lgv44z
	A03oodArghHoqG1kRtl7njnDXtSWiBj/JIS4P9MORfpNxwsJfyTj103syJjCMxc=
X-Google-Smtp-Source: AGHT+IH2rrp/DcZo+alL+PQQLhSzxuBc4O3JwWhJX/xYrbDZk4ReJ8Td8cb1JnBDOgBdEencF/BngA==
X-Received: by 2002:a2e:9b1a:0:b0:2ee:8d19:85af with SMTP id 38308e7fff4ca-2f1532d3daemr12584361fa.36.1722500461234;
        Thu, 01 Aug 2024 01:21:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d074b19sm22171011fa.110.2024.08.01.01.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:21:00 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:20:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v3 1/8] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Message-ID: <fm6wqsznxxxlofht2nouqtaryl7delloatc2v3b737unt7hqd4@l46iayvs64ru>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>

On Wed, Jul 31, 2024 at 05:25:25PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

