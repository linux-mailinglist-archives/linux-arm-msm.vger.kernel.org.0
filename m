Return-Path: <linux-arm-msm+bounces-24823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F170591E79F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F2291C2164A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E86A16F0DD;
	Mon,  1 Jul 2024 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7DRoX8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43E16E878
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 18:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719858644; cv=none; b=fji7vFoqM/i5ZGHpAvTd3pDSxzWrkoRj0T1FJlCSPQ9lE0GSiFC++boqKEtac+V1Hzg+0LA3wXHyKATTcZtVh1sh0H9gExf7wlQakt2cjBs7cHcB5zswz9chQqp4DkJXTONit0h+icbA7LuTUdblzG/RnCcz0Z7ET6//aLfYUjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719858644; c=relaxed/simple;
	bh=vDGLWmIXVVyB1exjrHzcvgHK5kCnv8kyZp7T/Bw4t/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfvDJq8JleATSQqDROjbv7yDMn1frdQY8xjvp1j4YlozyuVBH1BP7zdc5cSHCuKu5CBBtxwaCsYLT36JuhXoUZQESOQFxfVRszfR4k9kT2rT+tEjUAUv4sjxpwKTItvulXS2v2yxa+5OSMU4HaiiJE7Wgi7OTAj1IahxvakzxGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7DRoX8X; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5295eb47b48so4079676e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719858640; x=1720463440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sX/O4fr2+8PvQYguZGt7KddLq0tEWxhads05D+kvVqE=;
        b=E7DRoX8XUsuQKBE6sEK8C+sMH7d66MRgw/lYDSkPfgrvPydJc478nuv4PpfbRoFiSo
         xBpAmNRnd5p8xdDeo7CHJ335c2Cj5oNRAHxiQnHF6l5volPDRJ4m+VIX/aCivXEJgCnO
         aRCu1jl4Wu7+pYT+fQuQsyh0ghF2kvg6EnVGtcCvoG36yBvWwBJmm5dAZGytIS0JSR1n
         Z0U78MXtcmcKSuYWvI7t820HE88agjg/SLoPrnlCnwyAkKZ33tqOfik0P9+SM631vncM
         rHlg5KpbqSByTI3U93MSlPmA+WxbAWA7w1TPhTQW4KqB1oHhrH+RX2wvL4//merPEpT6
         oglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858640; x=1720463440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX/O4fr2+8PvQYguZGt7KddLq0tEWxhads05D+kvVqE=;
        b=Jur3VvUKsiQfwhASSpq1n0MLoSZ1ZvP6eYoGT5tVlDx0C318XBiah5nV9B9bgADDtI
         Ow30V/AY3gaDzaEQPtQXo2Nw3EWFdPwyy/IPuUJBNM7KHdzZCMcLZEvFxNNkDR7roTdV
         xZqsnLEqBBDvzKdZL4X3tdWihfxprg97cg9utKw/1u8QsWg7umZWbi+frxqCSUbkT0UH
         WwfEYW3409ikKIkLfH86vhpXHlCOiOY49yiQtfAOCIo6BHhd3I54SDg0aYa6/BoyK+yF
         LVvfNfH3lqQpYKD3UmF892U6NXkpmpXDTOoPlfxYSBz7b9cFuOH03lX1zX6prqtG5gz/
         9k/g==
X-Forwarded-Encrypted: i=1; AJvYcCVnLorF/+EtpIVn+acxpuqE6iAYiDQwE7rl6BXGjUrXOVGEskLO4I/g9A9FGkFWzAiTvA5bPLz00cgfI8ltojj455sXwZpNYioqRiDNyg==
X-Gm-Message-State: AOJu0YzVqF3FGqB+fyz8jgWWsqzc5KGqXS+/J2oxfUkeJxoRDHaSTdHj
	t12hmDyF2IcYOet8HSh2emadC9UP/3zeJ65som4+2sSyhNpbu+WOS1lM0YXKfqM=
X-Google-Smtp-Source: AGHT+IGYAOEefMGp+PasSD6aXVE+wt5WaW5Ihd9eWiI8BlyAfQBL2BD7FLoq6KyCw0TQKGNw5LYjtA==
X-Received: by 2002:a05:6512:3e28:b0:52c:a5cb:69e4 with SMTP id 2adb3069b0e04-52e826f12d1mr4520600e87.54.1719858640404;
        Mon, 01 Jul 2024 11:30:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab1089dsm1502831e87.86.2024.07.01.11.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:30:40 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:30:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL pointer
 in probe() dev_err
Message-ID: <kblpzus3lr6j6xnitmjk2qt2vpfbutqar2zdxrjbepcvey73no@j6f6whmsk2mj>
References: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>

On Fri, Jun 28, 2024 at 11:58:30AM GMT, Krzysztof Kozlowski wrote:
> The 'rx->dev' is assigned closer to the end of the probe() function, so
> the dev_err() must not use it - it is still NULL at this point.  Instead
> there is already a local 'dev' variable.
> 
> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

