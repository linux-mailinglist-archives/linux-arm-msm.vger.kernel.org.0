Return-Path: <linux-arm-msm+bounces-27117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D893DED3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6CD2283B86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713A35B69E;
	Sat, 27 Jul 2024 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcmngQIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00665589B
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077387; cv=none; b=FpEZ7aEjqniD4ounJ3PHqQij4Hj46sLeWB7Z9746OobD11P3Xd33d/kMjNtcBo+//a7DZwa+eSOXte9nsvdfL8NKQJZJThG9XIU8RDpq5I8xa3MNU7yJ4iufrrUm5gDiJNiovVjpAO6Y/RGfKaA7gwTqoRi0MWaiTnt/jnUNNzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077387; c=relaxed/simple;
	bh=YuxfSJ4lv/oCw60ifWm2XJgjH+1otX685tSUrnHE5HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSIpx23YqDw7q98k8NQMQZyAvN6vpuhTu8hHO7hESjqVDfHEadI4ZXrg4MAQtsCar/BZCqRoIMACgEtpHuTwna/ZLloZdSt02LsOTyLCcI066OaK3quQN44zfiMVrmRZdOxN8FHaaCQMVUZVFjskfGTrU6uxspZxuhFLy1lxtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcmngQIF; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f03df8c8cdso20073461fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077383; x=1722682183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jcXVWcmcbsKQzq4sH6RxYyKF6535bLDAYqbqnjhWxI=;
        b=AcmngQIFof3i25Ga4cluGvIa/CDNymm5x3Y/wwYYexNmU2mdeRWy7Iv/lRwUq2st61
         +eT7JrCOmG5Fbu170QFPu5+Sf4X5TKEG1kcwLLLuNMdZA3oAICttx070x50ZEiNrhW2m
         RZTw98It6I6BqRLXpFvg+QsylxXL3Gl3j9jpih7E//0Uf+b4jeE1gNb87dHThtai/WFt
         FKYUHXkVPQ7SuaQFKr1Mt6YWZrLuoU86cJ2N+UjUWffLCJMCsxcN15AQS0G86YAX5S26
         hZLilaVl2rLCy14ilWonNW9hVfqSAF63velLpcS6jfdJ3hWAYAOXXuCO73R5v6ltKfdD
         EclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077383; x=1722682183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jcXVWcmcbsKQzq4sH6RxYyKF6535bLDAYqbqnjhWxI=;
        b=KMgowhCtkG7QBvtV+6h1h/J72+npeDtoWHbtxV7NfPlVDgEJlRtmkf4FSDAsn5j0na
         iGQPCj+mhL1nXh7/iwJwV0VA/5TXCB2H7LRBN4Z8cRXfoHFLh+WfUgPJzMWrCHIsSpgZ
         LUecFgfEi944GCDfECwM01cQVasTPsNOiw36SSifgKkIQ7EXfyhix1qkpRH6xgWIsmAn
         ufXdnYEhgw+O0kVINGOMYj82bxaKJweMV6Gt4KAoAnJI71c44uJKYY8ITrlKPUF+C5XC
         gMvsx7ARqyWK2iBqecgvlG4HwuOQBi/uuHZ5weeOWRmD6HWnp+v3KpR/QkT1E9I/4ZPp
         RRRg==
X-Forwarded-Encrypted: i=1; AJvYcCW4vaD97OBXi2aNyunz/mskKctzeJ2OXawbEwpV/IsR/HaX80sr6Lc+7TnGM7cD/6NGxKMQYMlnN+LQT/SZVCeE5ELrMrZtWvhoFHG1MQ==
X-Gm-Message-State: AOJu0YxPQHcdCNox/Jhq7uvY8h3hmrYLoaynt2sPoTTeN0xSkjdLKS+A
	8OShQ1ReoWJFnn8ld0gaFhM1ALUbmhzNPMBeiJqj6uwve+gw6RN3a0lvUmgBizI=
X-Google-Smtp-Source: AGHT+IHnIkK+HB2IdwYErth4W4SCHl2kIZXcIUCxD+QuK/EAVa9ImrPRHZ+ao6U85UaV4uncB6qJdg==
X-Received: by 2002:a2e:311:0:b0:2ee:df8f:652d with SMTP id 38308e7fff4ca-2f12f084567mr5772381fa.2.1722077383159;
        Sat, 27 Jul 2024 03:49:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d075489sm6626471fa.115.2024.07.27.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:42 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ASoC: codecs: wcd939x: Move max port number defines
 to enum
Message-ID: <h4f5c5ecsum3qdphmqvufmumqkrshrivn2qgkdgr243jgsoibn@zcngoula4vsy>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-7-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-7-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:49PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd939x.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

