Return-Path: <linux-arm-msm+bounces-29987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68423964213
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 204082822D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD6218D622;
	Thu, 29 Aug 2024 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1+nHupM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740DD14B96F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927713; cv=none; b=glOs132CdZiqKGMMu1WZ9CQegK5amLtxNUxQAWlLBZBVT7Dp6+Y1fZVfuXbRYorpQ0psBN203lCQ+cnwiTxFj8KyATq1yZJcmIamufaS8QhVlvvznXY1wvt6t8q4VNwUSbufNLN4AZ6lDDXvxehwgin5Zt4xqlaH/4YI8zRyQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927713; c=relaxed/simple;
	bh=r5XlFHXqIDGAS4pJ7CA1OniqLCNWwc1Rol6XYS1Bq+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=td2tQ5IsqW/IsL4p0L16FyxAZdP0eQ1NImbz0rBqS1tUipQ6yrEjnvR+YBXBcaBjHmvX0ysRK1/tZHKttGnRxeuhVctzpOMpvfaNQUy86Uo49ydJz7ywnN8AsJ2E35TiUhc+kYY70lEDZunXK+txJw/7Mtpwi7PYUo2bvI/OfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1+nHupM; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6c91f9fb0acso4982157b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724927710; x=1725532510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq79Xl7SQIb+Lw9vp0M7UjB/SSF9XrLeMvRoawMdetU=;
        b=l1+nHupM8DuETNwKrZz4lnytIcJJMPLvmdncWzEJN73bD1BevyNtmmObri+LwHQJ6n
         6NUu3EA4z8CqjwpLTWWvQTKMgbcB/ZKM4OYkedSnfz4xaafCQyisn4rHx9btXZJCJRTY
         Yybizp3uP70c9HbiEXVLtBu7RqDeCJQ5soZEjA82UtqhuHqjbgmX6OwD3DAA14+xF0kd
         Kbxo+/P1jHpe+F4xiSdrn1iEKhhV92aorjyrAqDwampGwdwZvvmWi+bcbiQtzyRR4VEA
         XtAbJSVDrSbsm/yyOpHEXOFNE8m6s+h++NnKshdZ7weDC0yr+igpVz9VKRBEour8icme
         ytCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927710; x=1725532510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kq79Xl7SQIb+Lw9vp0M7UjB/SSF9XrLeMvRoawMdetU=;
        b=QK51oAgjv2hcNbyTHLk34NSbfXV9d1TslMQidX+IDKX/91sfGoGEh5cqLaOcqwYb7Z
         CT3/bsg3gccFb/RMaZFIdePqBR5ya0k11TmZ/LmHS6YhXzwXXouffNhzgdNh+41XcNRw
         prT+g3W9c8L5uRhx01oYC1TBv/CO2oPRY0pkq2+Xy5HvUy7UjEudPYgyhkTIk/orDXLS
         JNRJoqQ89/g1mU0AKTAWoZol257J/EGBkI4GqiQqIkYbqM7mb4ibJ2VGhRmbtS0BqIn9
         Z7xvn3leJlI5YE5ovADb5wjRjE6Ih+oYkQgS7MRRjdRgN7T0A9b0qmK3CQlKiCrSfmDr
         f43Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiLgeebb56t2W+pY13eHMS0xmTn+M5DKQRm2n2mfRx5MiDNNj828lsjuKnnI71ttinUVkzPvqJ5myPzx0J@vger.kernel.org
X-Gm-Message-State: AOJu0YxDpS/yqUNcgXoii++uTe6O/LdJdiyKDuscQDmg/lNFaCbraf9P
	qhPHTm4ZwzqPyroCrYzryVrAE1YLJnixXMPbZcw0govOUHVENMDb4co32E+yjXNiOsbRa4VOzOx
	dyJaWiAKkisH5V1Y8sGhx5PuD058GWx+X37oaig==
X-Google-Smtp-Source: AGHT+IHgylNA9acmi7Jpgg+5AiFrARVY6/x1pKrYQGxG1xaaobSbZE7WofyUs6wiOW9YFtPA4UP+FOrs9ipxDKVDuqE=
X-Received: by 2002:a05:690c:fc4:b0:615:2a14:4ea6 with SMTP id
 00721157ae682-6d275e33603mr28071377b3.8.1724927710370; Thu, 29 Aug 2024
 03:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 13:34:58 +0300
Message-ID: <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> Add support to DSI CTRL v2.8.0 with priority support

Proper description is missing

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Several tags are missing here.

Also, how is this patch related to quadpipe?

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf376..6388bb12696ff 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>         return ret;
>  }
>
> +#define DSI_VBIF_CTRL                  (0x01CC - 4)
> +#define DSI_VBIF_CTRL_PRIORITY         0x07
> +
>  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
>                                   u32 len)
>  {
>         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +       u32 reg;
>
>         dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
>         dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> +       if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
> +               reg = dsi_read(msm_host, DSI_VBIF_CTRL);
> +               reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
> +               dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> +       }
>         dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
>
>         /* Make sure trigger happens */
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

