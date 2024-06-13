Return-Path: <linux-arm-msm+bounces-22582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDFB907182
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 14:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C3A71C24410
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521E11442EF;
	Thu, 13 Jun 2024 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJ/rhK5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1289D143C62
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282247; cv=none; b=a8mAIwMLwN3QiKqJvwOSFBX4DjO8X+0eq4tF/AgFONJuupnyopF9taGjBjVUFMTqcZGAg/dTdLl0hgrj6jmgSj2sY2ksXr7RJd2le/W4cHguq6y2KK86YdYkUaNzsgpm7tzEgy7mp6e15GYYg41KGXPYphTvzh2xNzXsG+vChi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282247; c=relaxed/simple;
	bh=HO+x80vOL45DfnbGDH+HE4l2kGlmP8xcQBK47SIOSDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdFzJsG5UmNjaj/GmsUDgY4dz4btJ1HME6z7uhHmFYEPK4rUpWh2cOGHQ7o0gw4e7okjf6kTTkKHifQXUPoD4lfXqfyBovFQCtY1YX5NCztOTpwMhFr25RePihzV7kWxbAPdkMYXAolj/ZGIvpycCUFpjRj96xgDiCuwLurqycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJ/rhK5L; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62cecde1db9so10399857b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282244; x=1718887044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lK324ZHK2UbYkaord9YynZkPLQSYfxb5dYuVjUssGuM=;
        b=yJ/rhK5Lg+rkWw8pq9YggxvBlPh8A/DOkCsY3uA/ktzMZgZYq+Yr/0NWUahCQMP55y
         A41T+7/FLd5ADX08KV5D2c+XpBCfcH2zIojMMrU1rfH1EuPJBej6dvln/02u84kpGc4Y
         RSJ8AGk5gJFAdRWE7vWEkN49G0p9CUUaAha0v5UlWEF02DAJtg3ETnq3Nz4o22RH4fou
         AiXMaIEnKrl3zgNsdYIjul6ybY5XEC+8VKCPApSvCtwaLJR0Bz6y/ftradFMQO4fQ9C2
         6f71NU6+8wmxDTe38KKrKwEGtfNHOCSAgdbnd2jzn5RlUOhv3R5MEkOiNbTqXbTVjlI3
         41Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282244; x=1718887044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lK324ZHK2UbYkaord9YynZkPLQSYfxb5dYuVjUssGuM=;
        b=FC3PZfcoMcObJCjGDQDV7OdSnVU19l6YiGrIY/hsY7po1EhIwhJXlL3mICAfaq7bsI
         X5VKieXcj9Q2VLSGkAHEeBzWF5sohXMwMWlvQ5pAjcou/jsd8omnDPF8W2yDBQ1Vm9l/
         oefNbwr8Xh2b3+ns1RIiTRMIB8bU0ihwKi9gY3G1kDIQIfeWGsOaTU9MNpa6NtFXez/o
         N5gDQWbv2DKNiEg/4rZa9mJ62laQcqSMVqSETq5tbJL3671dZ6JYS6N1xnLfu4Si2g05
         EjF+WlRaUVVxs6lb1u0sGQ4k/SQ4Q1M7dbVNJdypV8u3ifbXLRGF/Q+5ZPXKHyWUeHjk
         YVFA==
X-Forwarded-Encrypted: i=1; AJvYcCXWkJySL907O88F8xJ+5gqzewqkfxKImBHf6gip4nzm3wnpebrxFjrX6i62jw+hLlFzZdPJIuhDL2F8aMlTUf0ziAfviNElK+gZKcCJWQ==
X-Gm-Message-State: AOJu0Yz/AbWzs7P0/YguF0SzjOMegcOqKFmEQj5ejVXV1raC28c3wTEP
	Za+kTTVOPDRveyrn1z8tRm0elzM6HwZo6Tuu3+P9L/qC5i93Ht/EaK/5FAQtjwjxlffIBualyiR
	J5cBbzHw6D77d62VFMrUCo0QDGVhabb/iP/6oxg==
X-Google-Smtp-Source: AGHT+IHZvUBnLsMhW62XBAnxIb34bbF6VpwyWCJv6bXVbMOYQVTTwWrwK1vnVsv5FrvtFe2dwrIEhVqsavWTdlA/pfI=
X-Received: by 2002:a81:8a42:0:b0:62f:9e2d:3e5d with SMTP id
 00721157ae682-62fbdba5388mr40959977b3.43.1718282243851; Thu, 13 Jun 2024
 05:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
In-Reply-To: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 15:37:11 +0300
Message-ID: <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: q6apm-lpass-dai: close graph on prepare errors
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 15:13, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> There is an issue around with error handling and graph management with
> the exising code, none of the error paths close the graph, which result in
> leaving the loaded graph in dsp, however the driver thinks otherwise.
>
> This can have a nasty side effect specially when we try to load the same
> graph to dsp, dsp returns error which leaves the board with no sound and
> requires restart.
>
> Fix this by properly closing the graph when we hit errors between
> open and close.
>
> Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # X13s

> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)

[...]

> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

Note: this didn't go to linux-arm-msm, probably because of the use of
an outdated tree for submission. This commit is v6.10-rc1, it probably
should have been Mark's tree instead or linux-next.

> change-id: 20240613-q6apm-fixes-6a9c84852713
>
> Best regards,
> --
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>


-- 
With best wishes
Dmitry

