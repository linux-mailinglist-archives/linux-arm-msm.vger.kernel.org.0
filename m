Return-Path: <linux-arm-msm+bounces-24209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D69177A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8337A281BD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEE213C810;
	Wed, 26 Jun 2024 04:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BgZalXMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C2139D04
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719377546; cv=none; b=MOMk9ZyDWKI3p2ivjfpH7JkjqBJba5DvAJvcRMXnjkB3GjOsUiq+QAngsNqCzDUJGLAeiRta2+O851ctQSNNalEJYFkvK2AM50bOoe0URi06QbpR4lchBeBwpMFkZs+EDnqg5VZES0O9JWLak9Jwz2Xf9Qn902LSjj1HulabsdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719377546; c=relaxed/simple;
	bh=UH7Guk0ZViEtNHLe2Rm6vPoD2ZtesweQWurg2zPQG0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3hgJVd6kO8BQSIvA07ypu4EQacUmoW7tSJPWR18dccdrbqLUasNlWDUKMmyUuMPAeQmzmohhwxd85FgLLixe9gRuLnbu9C/56kpDCexMxsk0sdEDpbxGKpwwyJ7tBco6OkeoTm19/bVTx25x+Njkx4qrVHx1JZLFhyt7Hu4sKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BgZalXMG; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ce9ba0cedso3421189e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 21:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719377543; x=1719982343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHtEVEj8JBWiO4kzFiIiv1rmTa0ntU60eMALIMv5KOs=;
        b=BgZalXMGqmsF1ttSDo91MGRGTVeRXbdmHms+95r7kn8GCK7E0/uVLqhvvTNcdv03z4
         1c54dx4oUmsOf/CHofFgHJkQGjtEcij8dMNWHyQb9TYE11y9WClbH5XnjjLl3nmt7T/P
         CsfYxJ+yvQCAq8JUeanEP8fXmMOQGuXOAo+Mviivd5X1eRQ1w5m8e5/tXTBWw2E08Uzy
         wRDGa1K/aLQzkT6PK0nvEli/2YwM98zdQq6dQTaYrnzHoiiD0mknsndoUtWN0afnx00c
         fCoG1r8CXWIGtOtyZAVYo4YFUvP0qQVq26hmfO45BOOo3HOLH5pGPVxdDeJX1PALY2Ef
         0Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719377543; x=1719982343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHtEVEj8JBWiO4kzFiIiv1rmTa0ntU60eMALIMv5KOs=;
        b=vP0YOgEyBBIgTixylsbJStky9rfrUc6BysaxHwwWtUHT4GR6MmZzmgh3oX6VMNTXya
         QonkecYdNzNaWU9tZEZNm84AcD+bU3jSKsmTU+s5hmcMK2NXkHhTfcJCcZ4cNFSbkmsu
         NNj958cBZhAVfgPAb4Vj81I/2rg86ejMf7CTrNO9NUC5a/HEtsA6mFaSApw6Slyb/jQW
         1sm4Jho82saM6hfh5zL5aKyAiYZcxefBPZXWQkxYjnOOiXpVQofJnFmZlMMq0+vKxyFZ
         jcGbiqbC5UB93+0Lnr3j14Ry8eiqeWDLKEEKrRv6LhbpkW+xTgQBFbouRxuEw/E+8kzj
         ojiw==
X-Forwarded-Encrypted: i=1; AJvYcCVBdzNZ9+9nGUpLGbIo2cJvbi4x44kl1N7bMJ/7VZzUhI6KAyTKJK4xIGMHkSo2cCksGpqBDEd2f/MrQw2toKrOsJIGcY0oLiI542C1UA==
X-Gm-Message-State: AOJu0YyaEdDI2JduOvmOb5Q11hSoy7Ig7bn2G5Qk1hTyM5U+v57QsREi
	RThddZ+XD4ZsKS5xws1EZRCanrc5rigqEZIuci0xI9xsazpwNlR7vMVJhyeKC/A=
X-Google-Smtp-Source: AGHT+IG2adZQtvwyPskuS7BzV1Hv7koYS1cTyuzBuEl/nHq624PyB5bLw8U2WyHXv+Od7Ngz+ahDJg==
X-Received: by 2002:ac2:5e79:0:b0:52c:8909:bd35 with SMTP id 2adb3069b0e04-52ce182bc95mr6906334e87.10.1719377543219;
        Tue, 25 Jun 2024 21:52:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cf3361cc7sm324288e87.65.2024.06.25.21.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:52:22 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-macro: Use enum for handling
 codec version
Message-ID: <fyuovswhhso2ishvullvj473xnstqcpc2czqiqy5lfaafy2cix@kfifmubk7gy3>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
 <20240625165736.722106-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625165736.722106-2-krzysztof.kozlowski@linaro.org>

On Tue, Jun 25, 2024 at 06:57:36PM GMT, Krzysztof Kozlowski wrote:
> Replace 'int' with proper 'enum lpass_codec_version' in every place
> which handles the parsed codec version (not raw register values!) to be
> explicit about contents of the variable.  This makes code easier to read
> and compilers could check missing switch cases.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.c | 8 ++++----
>  sound/soc/codecs/lpass-macro-common.h | 4 ++--
>  sound/soc/codecs/lpass-rx-macro.c     | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

