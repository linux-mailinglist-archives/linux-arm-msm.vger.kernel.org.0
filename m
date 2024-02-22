Return-Path: <linux-arm-msm+bounces-12243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F086047A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 22:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 873041F277FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729ED73F39;
	Thu, 22 Feb 2024 21:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hUhSj7t5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84C73F35
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708636262; cv=none; b=kdlUjEiCiGSQOtW81GFYxPHDP/4mGbWxz6SlqPSzujQoajcwv2oEPgtGWpvcrTZOuqJXkfBD/myQvnFPnIsqgjHx4rCk7/VYIWDpgqlO+zgUIYAIBKvk5T5/tp8Qa4o4vfHfqu0vc2gH47KkypCD0aMyfHDAGEgtAjSf9UgNOBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708636262; c=relaxed/simple;
	bh=Vo93ylUz9WSkVl0RJYZwmOg31LIkpT6PvHkpqP7mgm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fb88XwlqEXEOCTrDwy1Yy0DdZUJU0wXgujeRoZlpnO94745PQrAJ+UjX6bRURWU9c0EmZsUsGgI1Uu2om5EAoci3qI/w79ytGhXjkFMp0z5/U2QjWCB+l9k+7kQBTfGpet4GbS2+D5+ATRvvX8OmDNS2uDLIDkOVWaAoHon2uBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hUhSj7t5; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc73148611so157182276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 13:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708636259; x=1709241059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pkCYglSSRXX0GiB1gOdgF7fLOHHbF1/C5DnjQjUjWpM=;
        b=hUhSj7t5GEy68Dkhx7NKg7BT6h2bh/Mx72wr66bVOLgEIOCLYdIkzsf2Eiz/0DD2DF
         00oAnmGOutU4MqBCT4rybu+tdZ5ZJZXI6NUkm1b5tZRRSAEnrVJaT3j0JbaBzoHMxyKu
         J4UacgGRjO/u/tD0fXeUL07Su3nxS4onSxqAY+HG/CTnCPyAo9lxZ5jT8x72oUkQ5wGo
         EIXSUepO7zh/t9n2QULfE/2gSeDkxmWabZTo/udBD67CFKYYsqi0sOdVwMDSFEPcnt0N
         HxoFQHKjP3mPXQXr/NuM7KMWSiCO4IAW4dylPhgxGP2N7opFQyBJu5DJZrXme78mena+
         7MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708636259; x=1709241059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkCYglSSRXX0GiB1gOdgF7fLOHHbF1/C5DnjQjUjWpM=;
        b=jCiFrNgPSUuCTPPrMiGRJW5BoCIWmMr3j965xpxWMvKQVntO/X/nIAOdEmGYCon5pM
         LvYhsmVHlQAYJLs5fpLSHUupWDkxVuCLf0L2XYYdxcAlqBLm0W2UYEI/OgH65QA4w3xe
         iRAknMiimqjvtWB5pSbMHcwn3aNXZxuDPRcmu0iETRD+oXQpKCVuLKdk3GdNRWZ7Z46m
         DDC1xmbJ2yphyFaiwoXCKWly84veiqREa40P5DR6kpFrmoIU8N+MSAeZuqSBoqF9J1nE
         qRAJgHdM2oQyNfvx3SY9/W8zd1rP8fA5ynLARBRFK20/UBlJDtMZm//MOSNroWRBjANE
         0XBg==
X-Forwarded-Encrypted: i=1; AJvYcCU/y4UTlV961g7f+VgUMxAZKaaCE6PsmqFazz+orkbEjEFw3WvaYH7L9Cg5DqZTro1pR+p9Da6MEgONljLiBiD+5s5k3AYJW2cSkyzzMQ==
X-Gm-Message-State: AOJu0YxufJUUoQ6Rk2xmdZAtnmSU5/Uq2glQlaiVHokKOTZ0WutD3zXu
	OoePs3bjvPM2Oxuu2wtbS9qxm+QLsJhHLVYIZpAZdLyf0sgWWfU9b6HDdvKPpv8CQPz+9+s4gh7
	ahxSJQPnFNZo3J4E4trnkTXbQ1BbKnW4jaTordw==
X-Google-Smtp-Source: AGHT+IHwJkpERffkN3VWKbN/6atXOQ33nEsq/sgXRDlWA2N8ix01nl3hWBFMaZvbIXKA9vuRKkf9w2wT34E6I2Z7bFE=
X-Received: by 2002:a5b:2ce:0:b0:dc6:c367:f0e4 with SMTP id
 h14-20020a5b02ce000000b00dc6c367f0e4mr343701ybp.52.1708636259455; Thu, 22 Feb
 2024 13:10:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org> <20240217150228.5788-5-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-5-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:10:48 +0200
Message-ID: <CAA8EJppsaMD91AOnFx8J8fHzZj_dCrOeM-HQfNukwCsrw7UYXA@mail.gmail.com>
Subject: Re: [PATCH 4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, Rob Clark <robdclark@chromium.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We need to bail out before adding/removing devices if we are going to
> -EPROBE_DEFER. Otherwise boot can get stuck in a probe deferral loop due
> to a long-standing issue in driver core (see fbc35b45f9f6 ("Add
> documentation on meaning of -EPROBE_DEFER")).
>
> Deregistering the altmode child device can potentially also trigger bugs
> in the DRM bridge implementation, which does not expect bridges to go
> away.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Link: https://lore.kernel.org/r/20231213210644.8702-1-robdclark@gmail.com
> [ johan: rebase on 6.8-rc4, amend commit message and mention DRM ]
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soc/qcom/pmic_glink.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

