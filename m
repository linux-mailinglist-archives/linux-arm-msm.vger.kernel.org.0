Return-Path: <linux-arm-msm+bounces-27115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DD093DECF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97BE5B21A7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1745FEE6;
	Sat, 27 Jul 2024 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EtzKeLmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD942A95
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077364; cv=none; b=eSa7wsUvFkhToo0BrTQmou3Umpo+nTtzzBixnAAByHsDMSfo3KcVwerG0Xx5hoIqbWYom4Hf66JxLEKiJIVN6jbbaclqzrvOEzJNOkkClyyzu2sNzSwBzeTrAPT41//dIt3ypW4whnRxWxgiyzBk2ykLQGOu4zn/RyMLrO+xgGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077364; c=relaxed/simple;
	bh=u29x3z9nNj7e32wU/R5WeTPNlM66fftlY+D73KLs8v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ds3PbznHZXl/ppbZ+ywOp+fHNrYhVNya7Y8ERtr2IbJnmpv+/agYYXI7kEeAcsx6+5tuQJxBkbLl+5rHtws8/zwUhweYof6ff2iJ4Msauh+r/peIG6ocRehZch0OBnvVhwUre3bxWObIJ/HXdoDUr0bIRKhkDlbVdWW6eh8eEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EtzKeLmI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so25253831fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077359; x=1722682159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=geCRQMjPSwcsby6sgvnZan39KM22MCRt7HcUFv8NB60=;
        b=EtzKeLmI4RGMVx/ApTQhGuvp/fn2CIVOrVqiU9bBrzT3jSeZscHSoRAMD5L5INdjl7
         bGPqC/ALiZbGGwhzxckvo3RVkd2ndbdTUaPdQNmL8skuv4B0XjrO18g8gfmrzT1lHxrW
         gqtLyL0vHxDlLsvDrtip2y7uqVYVFFupOQK531bzLYsychVfRcuy55a67Iv2ZRDJ3e4I
         0L6sdPH8+viSSxzc+pk0KTglW7uM+JJcY7FKIWOaITiyz0h5Xw0R5dIN/zzOXaJijgPi
         Zh3UUv93eyp7/MmSUxjodb1P31OmUs7OCjX/6o/a1uDQJzMvgWpo5Dgdmef9luZ+dakf
         BqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077359; x=1722682159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geCRQMjPSwcsby6sgvnZan39KM22MCRt7HcUFv8NB60=;
        b=GNdQxDgueL65AlKbT0UNhackKFvM/9+g6apV0vUmbAEOLYiN7JmQxMr1kP2GT5IGL4
         yqMXnmhViL7JucjX1uO+cXSAN+3sOh+pQ78RzMXDkqFyAr68HRZonBe1Ucy7paGEAFxO
         2aeuEIGxguop7KLcjClP0a8GFrceP8TcnOm22OMyp87ZWeI1HA1h579MSdYh6UeZ03X/
         V/MlSc8H/VHxJTrhRQZ4ILRzrH3AFH6hUiF10BmbpnXgpJ8AMAz8AbuMn+m3lMevjHjb
         de/A5HLFp/0v0vFBT/mOf0fLcoEtiI8eqF6nZMyh1/8UrUek6Tl5xXfzx/OXo2mhvyto
         vncA==
X-Forwarded-Encrypted: i=1; AJvYcCXxHaLNYNohcXCxhngvLtvHk8FC1U/m3CXzYN4G3hSeO6WwBiwG5eXMyi0XRimUmAKNm/iL4G+huvQjKHE/vcUjMOGpJIPi/hQgv+c5Wg==
X-Gm-Message-State: AOJu0YyV1XewfsqmGP7jymgbnabvzAxdgj/aYkx2RcMa+o9NPATtJnci
	/9x1S7k1iVt/5n42KG/kiRzWrxQATwUzr76GwGTZJg3EwjgLxG1zL6j0K45RcJI=
X-Google-Smtp-Source: AGHT+IGAakSUy6drg7IAUAowlVvqX75jk6w0OUsoc5NIprF+xI64fMmRUUrOeW29bqgdNpmn/JjE+A==
X-Received: by 2002:a2e:2d02:0:b0:2ef:20ae:d111 with SMTP id 38308e7fff4ca-2f12ebcaee1mr16162881fa.6.1722077359180;
        Sat, 27 Jul 2024 03:49:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf0f9ccsm6943211fa.14.2024.07.27.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:18 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] ASoC: codecs: wcd937x: Move max port number defines
 to enum
Message-ID: <lwgi3xhry2zz2filzdrivluexoyft6ohx5b6xfqsp3u3vx3qvg@hg6aq6tpmsmo>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-5-80a03f440c72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-5-80a03f440c72@linaro.org>

On Thu, Jul 25, 2024 at 01:23:47PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> WCD937X_MAX_SWR_PORTS is used in one of structures in the header, so
> entire enum must be moved to the top of the header file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd937x.h | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

