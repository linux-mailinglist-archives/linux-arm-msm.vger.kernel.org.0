Return-Path: <linux-arm-msm+bounces-24824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D114191E7A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86C321F24F56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E0C16C844;
	Mon,  1 Jul 2024 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFIjr89o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA4F16F85D
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719858657; cv=none; b=CmGDMpxMZo6YHz5Zmr9/f9abyppRyi6J0N4B3QpiAL4HuXsBZfwOKt7YK6RUv3Q9X+Os0NanQdevbwDeyGdyub/zL2f6Y+OPM2FJ0HsmkXcZaA6imhEzlKfTl7uBwTO9FJdNExJDGDWLo6wnuvqSuvM7dDCx79W7Zzzj4W7MYoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719858657; c=relaxed/simple;
	bh=0iOo5cayNGx4g6/tnzEHTcEtMgyyP/qKsGpTDFnROBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFQccf/VXs9L2xxZsPflsozIjDCGvGh8nH1vqtKnZZiaGcTqbUGCam50LNoOmEGD/up0wMxoVQPR7PlxmhBipknpASE8ng+cvWAI4bW2WX+9bo1YtKKZ/fWR20JdM1LOi+t3zH+23AZkLFhkoA2zAUKGHNU30CnBcteQpXIaVh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFIjr89o; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52caebc6137so2690920e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719858654; x=1720463454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1bORojp7LGodQMmR0GktDpziQrjk5mFTyAYpRSH12Y=;
        b=jFIjr89oC+1oyenQh5iN8GAUc7ehO8rkJX/BQ694a6yS8cBS6ffE0ImvjlymXgI8cE
         huTWo2uNQp1cpzloSGjkavT2T1dCP4t7MFxpjMRYYS0hqvsNbGYRx8fmSkC3LHQrLhx0
         fr1g5sVCnfqmS6yawXLjpmuV+xbfqLHzmKW8QdCxY3qwN3UDikg3IHU9xzc9I/zTFgQw
         jIOGkGlfMLIxcGYj8WeVXbnExxCdv62btM4Tu5z0b3CeLhETIdr4wl+KdlnYUZE6Txsf
         1Ki1pIY+AuSjVFv+/Gyt5qxcV0mmDHuNlj/Bg8GfZdcZ/xd5t4XyrMi7kVl0bFTIwAJz
         2qsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858654; x=1720463454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1bORojp7LGodQMmR0GktDpziQrjk5mFTyAYpRSH12Y=;
        b=YPtpNGm7LXU6bVNtYO7R3czM+k15qyXdor/bO1RQpSJXkzW7MqZd1Pd8Xdv8Nk5/v4
         nzGhlDgQUO0dymT1rK6LOgbuYsK6himGupPHZHBG82FB449IpmADwbJKV4UZ0+AEEnCY
         DYlb1tt8Wm4SbaH6tEFNZ2ovQOJ7RrVPiBc3Eqh/EadR6KMsOl282LfTM/6/H0MWFrjk
         jymzxVXbIOAxt9KDvn8iiT/RYXLvBpor429/G1uKG/5KpMDb3FciyEycLgFzPKXS9eWj
         IDBpBnIFcd+9/Q+VBEjGoHbhuHwEw6Gd1T0OKN9OkEh4Nfe0LlHqQoA0m5clOfNiSl7V
         Dxbw==
X-Forwarded-Encrypted: i=1; AJvYcCXItaYoywgypTOH/z24uy8gJ+M6LNUYIMzk9Tdf3yZP6KRW76d3uXMBNBSpFjWE7BbkuhKfHYGyD9b0WkcwnEsAyWHBJcM7KSQeB5YgWw==
X-Gm-Message-State: AOJu0YynVkPV+N/621kt4mSmbYRBNyTKjmRAwwlGC9majEvmtF8C05Qo
	8N26U0P7xNNnc0PqHGU+fFalaxgG7NZxEmZUBx4dkHGfREoimy0XVmfKrdx1apE=
X-Google-Smtp-Source: AGHT+IGio8w2qPHnHjpAdv9Xq1wSVEaXIaQHK0Jse0W5DVm/JwaGTZCVvQ9Jvyo2ZGxv4pHSbq62yQ==
X-Received: by 2002:a05:6512:b8e:b0:52c:8210:13bc with SMTP id 2adb3069b0e04-52e8273e3acmr4380491e87.64.1719858652604;
        Mon, 01 Jul 2024 11:30:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0b9f0sm1480819e87.12.2024.07.01.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:30:52 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:30:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-wsa-macro: Fix using NULL
 pointer in probe() dev_err
Message-ID: <slpv56feowlalqd2olti5bnxluovcvjs4k7koszhukfxvgycz3@4mm2n27e372l>
References: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
 <20240628095831.207942-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628095831.207942-2-krzysztof.kozlowski@linaro.org>

On Fri, Jun 28, 2024 at 11:58:31AM GMT, Krzysztof Kozlowski wrote:
> The 'wsa->dev' is assigned closer to the end of the probe() function, so
> the dev_err() must not use it - it is still NULL at this point.  Instead
> there is already a local 'dev' variable.
> 
> Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

