Return-Path: <linux-arm-msm+bounces-22583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF19071CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 14:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DD9CB2693E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CBB143759;
	Thu, 13 Jun 2024 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iU0cJ8RT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53FE12C47D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282419; cv=none; b=sPEteex4uTu2Me9Lm0H4MIOFzGG+ahFTogIbqKdxzUX5Rp484WW1TmK+LQbdEyrqzWCAcpFyVdrJWQQwNl9YlQc4CU/opQCm4PpKcO3/VnR3PYLE4DepkAj8joyPyyNwKHinGbilrmgkgWL9a+yj4y/sAxEKmWRW2MBsr6SR9Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282419; c=relaxed/simple;
	bh=1huBxxS455lFb9lb95aj5aHQLKb1A7Gghj5h9+l71k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT8IiYRjr5Cc8VHV1wlj/Tz10Uf+CUjg6fy2oR5UiFrZSqC9mZnVsErNuwQSN3Zaj5yRMfC/lqQC+zVAMYSfN0TJ5HswjxgTMUQoVPs9/2XNbdaJQ3n3/qkbT39PW5Rgt451dn40zOZ59rmY969CNHs4KRdq8wqrrIN/6YuBGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iU0cJ8RT; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so11637051fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 05:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282416; x=1718887216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3ih0pRkamLgGn89/coTp+mG03B+Ar2meens0mN7r6I=;
        b=iU0cJ8RTqcuLkRvseOLP+yFg2Y2Echz6G6ReydWdEBxcCy7vjfmMT/mVDQtat1UsQE
         LdZpvU/wNPRoUU4K1NCMAzEE7Uk6mjgD4ZgaGyqgJW6C1dYUiR+faC54BbGorGh/PGPG
         P8uuMFoB1bqOVz/FPvJDKlOEiRgV1fb3tmJ/qKiFzBlUSaHEMqlX34p7TPWmxW0axOjp
         y8a2FUVfiqwPfUvS1sAtENR5qljWhIJ7eqpzPgVCQKOOn255/GcyUq+YfhkEX4mMB4dk
         fK6NK5id/VPH7sriRUf8gsZ3z5KV88mZ14GPBkortKrIkurzbvZG5kZ0o4oqLUD63Rsz
         zEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282416; x=1718887216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3ih0pRkamLgGn89/coTp+mG03B+Ar2meens0mN7r6I=;
        b=Jh9nmKFluYG6fgKYLHsBQT7tZJJ4P5KYuwdgCu3+sv2/alotQgeKR7nmHpbTn1xEYa
         jRA4yRmQwUNCs+gz1fb6n7TZefhU0PnAoQQ1wc4McKKir2YGA06KUPdNSENEnNxhWH9k
         X1pfgox1DslrINeZnnAvzBwKfWP4AQhszwGoHmH9Me11GbeYmALKx9nCBIZeiYowTLTD
         AefxaQZNmI0JB0/vco0pZCvnIAwjN1rTmJyD0v/KZtCoMEoXvea4S7Ybok3vW9t1ksKE
         +7EXaOkE0FEL5IC5+cegE3ToLahSDU/FIEzY5eGb4rrNc0aDjc53MmJvzgio/175qtrD
         PQDw==
X-Forwarded-Encrypted: i=1; AJvYcCVtb9etQIU5Wd+VymF3Zz4wjeofxtFckeq2qwI8BX3H+V0rEEAfpEkNqetX568EY5Z1p/yxHuhRNyPRm69NqoL639mn4IsWZnaLNGVX4Q==
X-Gm-Message-State: AOJu0YwOyic97DGcyfHHpoEP3OSfCLiuI9EYZ6I0hgfUzxllPFrB3CVt
	5uZY37gPF84sYZ2C5BJ65mtrijSj2RPpHkEYUr2SbDR9Te0GSrV+8J5QcEAJvjI=
X-Google-Smtp-Source: AGHT+IEqq49c8cGicA+OdVdYsOlsGoIcr/1WK+4fWR/h8LRWQ3o9Z/xoaT075/lNiMhPVaQRL6RyNA==
X-Received: by 2002:a05:651c:1258:b0:2eb:dd0b:b9ec with SMTP id 38308e7fff4ca-2ebfc932783mr26945561fa.20.1718282415951;
        Thu, 13 Jun 2024 05:40:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c05d3csm2060981fa.43.2024.06.13.05.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 05:40:15 -0700 (PDT)
Date: Thu, 13 Jun 2024 15:40:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
Message-ID: <3q77jowqtvnlsrskzbmt627mgoebnkld2tswjaby6tfluadszn@v7vcgkgagyiy>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>

On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patchset adds support for.
> 	1. parse Display Port module tokens from ASoC topology
> 	2. add support to DP/HDMI Jack events.
> 	3. fixes a typo in function name in sm8250
> 
> Verified these patches on X13s along with changes to tplg in 
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> 
> x1e80100 is verified by Krzysztof with his changes in tplg 
> 
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits

Together with [1] and corresponding DT changes:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # X13s

Note, patch [1] is required to get the switching between Speakers and DP
work in a stable way, so I'd consider for it to be a dependency for this
series.

[1] https://lore.kernel.org/linux-sound/20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org/

> 
> Thanks,
> Srini
> 
> Changes since v2:
>  - remove hdmi references.
>  - added more DP jacks
>  - added some comments in code
>  - added x1e80100 patch to this series
> 
> Krzysztof Kozlowski (1):
>   ASoC: qcom: x1e80100: Add USB DisplayPort plug support
> 
> Srinivas Kandagatla (3):
>   ASoC: qcom: q6dsp: parse Display port tokens
>   ASoC: qcom: common: add Display port Jack function
>   ASoC: qcom: sc8280xp: add Display port Jack
> 
>  sound/soc/qcom/common.c         | 35 +++++++++++++++++++++++++++++++++
>  sound/soc/qcom/common.h         |  3 +++
>  sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++
>  sound/soc/qcom/sc8280xp.c       | 15 ++++++++++++++
>  sound/soc/qcom/x1e80100.c       | 20 +++++++++++++++++++
>  5 files changed, 99 insertions(+)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

