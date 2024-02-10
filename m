Return-Path: <linux-arm-msm+bounces-10492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD708503AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726051F23B34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9454D33CF5;
	Sat, 10 Feb 2024 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="puTCHH0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B207E32C9C
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707557706; cv=none; b=NJI76W1hdggJrPTBRyB97gKU/2yppm4U+iyheTz1rjGiwIFdyZg8+Uv1SkKBOnk7Az0dDmFuJriECgtNPpYtjdxxeHoVn3wE5XU6K+RMeZZbIfvplnCZ2uWdoKg71ZvHoajMKKPd3B25nQFLj3gjHkV2AMqz/cSqQK7joRj7m18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707557706; c=relaxed/simple;
	bh=tmzDoFDruGWKlW0gRw0punnb+AqA3Cic+BMYx4XHUTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHWuMqmDFSsic0ZW9DvAXsuLHniPshQ/yjBHDRBiAws0PEXIxtw88FrGpntbGRUGxjjv+vBz6wFvU7zD8LRMx3ISxTDTiF1WL2HJGrqQYrR9y4llt4W1nUMWmE9R3UZ6ECJ30tLZ9av9r9zNwSN5XdTX5tZDkQVYuo3rmWLsTHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=puTCHH0Z; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6049b3deee8so16299577b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707557703; x=1708162503; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dEpHd/d4KaHqvCzlSHGoz778Kld92fS7hyAQuFB4M60=;
        b=puTCHH0Zy4x5wPtyYquFkyoSQwntGsCqpp9JI7xMBxvFi3c4+bVD1w7wSgXK6ff9aQ
         rMHm27cK0WVmMOcZHLJHQdXqtSNGnzdCKgd+hx0Kwy14gcz75dXAGHmi9eEjXjP6tM5K
         L2Azq9EaE3M9S6icc7iJOzdzhl9maG9Qz+gIaXUgEpBkuxc10FPHRAE2boZ/D4Al/DP0
         50g/XGMxWGA+TpBe29dSNhA62Gdduj44aGVn1sMeXRngmNDboi4BYL/+hzLz3wKWpXc6
         BvvUz3yQgEj0R6jCgW/lNTeEJrJTw9cf6lYY3RVrflAFAnBCpSzZ9Av9Q8Bw4EzNvgZm
         W5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707557703; x=1708162503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEpHd/d4KaHqvCzlSHGoz778Kld92fS7hyAQuFB4M60=;
        b=C3AV1QFu4/V1w0lxQdBynXCcZIUz/60DfrArVUEH6iW2Fq+r7sk/GGlEXmkPvcUNB0
         xjf+XhoZ8rGEtsjYKdliwFw2tUZaaugNu3Nipyc5iPi1cz72bqbJL1osxe9vndds4ItS
         57Oi7UxTNUctz0cqyLeUiGZc2uwqLhMdyfn4v/q7cpIaPSSemNhrrUpzig5gjbqTnsJj
         1gpV5MTlgb7UA6L5aEtt9UZQqciPLqIqqEiYVBXcK77FOP+qLQrA1Yd8pe3q8E1/wyp7
         DTTJSXuaR6NK5grNbUitXJPtTT6aZcyBC02gyH8+G34lmzqUTIDxP6ctI0LRU+aXmQAL
         0ILQ==
X-Gm-Message-State: AOJu0Yx8Mi0Zz6RsMWx5wE801zTwWdCQhvdNm7aR5QZFg7Ky/k7hQjAG
	X6Ad7x24KcIQCsf52bCSSb4TtebUn1SCLV8Hudg8XvYOHrlpD4v8V5oojsneO7XktKHOd2drM9S
	JU3IlzaX0K26N9nAFqK8dPIGp381+KJtYoWVaTIaFLSuS7c2g5rQ=
X-Google-Smtp-Source: AGHT+IHZINcqoh7VJSls55En0G8Ld122qNvqzCK+iubyY4zv7d+eyNOxvYn9XnVZowiNLIt/ZRqq4EI0fwYNf0FbWfI=
X-Received: by 2002:a0d:d102:0:b0:5ff:bb43:2a69 with SMTP id
 t2-20020a0dd102000000b005ffbb432a69mr1472175ywd.40.1707557703603; Sat, 10 Feb
 2024 01:35:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-2-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-2-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:34:52 +0200
Message-ID: <CAA8EJpq9cnS5_ghL=8V8TU7do2i_-+TQEHUxcSzWdOUO7wHa3w@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] drm/msm/dpu: allow certain formats for CDM for DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> CDM block supports formats other than H1V2 for DP. Since we are now
> adding support for CDM over DP, relax the checks to allow all other
> formats for DP other than H1V2.
>
> Changes in v2:
>         - Add fixes tag
>         - Move patch to top of series
>
> Fixes: 0afac0ba6024 ("drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block")
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

