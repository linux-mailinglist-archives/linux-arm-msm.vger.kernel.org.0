Return-Path: <linux-arm-msm+bounces-58020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC52FAB7A70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B34D67ACC63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 00:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610464B1E62;
	Thu, 15 May 2025 00:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZhGiCOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3405A10E3;
	Thu, 15 May 2025 00:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747268280; cv=none; b=mmRE+UdBahi6GrmOwaIBEHjkHCXYOqOWMvynZoOPzNSxqwjQX8exHRBfuOE/GdNVnYTsC8slF/bp1vruKoMwDJIyPBzywPFrfr0+5ybuyPtJSlzE7Zk53S/t5EO6ProExlCag7fDm731EzV3brU1Wdi8znLke7ktLN+jJkoR2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747268280; c=relaxed/simple;
	bh=ppDSPmOlcI1EuIFNI/saJdi1z4iWtdBVsF+tyMghoG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dj5kIqJmIKA9IgugNh71dxY+4XDxa0HGTjWWUWdBX8rGzG9jmPz0UtnqIPeHa66/mPy/dAXEtiQ8MCOFeUC+fZxJ2c+vkfOl+CWf+BkESdMIlp+7JJrNmpJmG3VhUwzO9e8xRkLaukVtk1Rwsbc6N5pyvn3G8X36HcsP9d2hSj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZhGiCOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0B1C4CEE9;
	Thu, 15 May 2025 00:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747268279;
	bh=ppDSPmOlcI1EuIFNI/saJdi1z4iWtdBVsF+tyMghoG8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RZhGiCOrdqbR8qAu7bNRM4kd3gnHsJDc10HaqGtlzktXawW7VpvKwYrXS3AyCn5LL
	 +MeRVMYW2qmBqq7WzM5r8g8q2s1KfmB5K3SAyFVYqBXZZraqLm/VkJQBepoHY5YI3L
	 sbgFBNNXNkjboNPZWWOQlzsa9fnGlU2KV8n58TlrJUj8nr/1grACy9X9cioyRNzUhp
	 4MqT33rInfCmvzkQKxuCQZMY3HwcxjXmzl8eO32OMwxrpthaX4+5ResGIfFYTaWI6R
	 fCnMKucvI6xbJCX8Yrw5ooqAgGF9hJaUgiRxL1+vFZ4+4Dq92xv5F9aU8FfwOpTJHl
	 9+60FCifOc2Lg==
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30aa8a259e0so381544a91.1;
        Wed, 14 May 2025 17:17:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0J3wdJ6G/Rs5lNgwSo4SVaqVD6+KTAtoGGUC/TgUT8fVQjfbkpqN1T+aw/XaKR5kpYfDvku2TmqlYEIHm@vger.kernel.org, AJvYcCV1ZPm0DN+dHBO5eZ6HsNv5cROHHdPgQjTrf6qmX6f9xjVITDprb3mKqS0JkzBRC7OTlUT6uuc9BuuffWH0@vger.kernel.org
X-Gm-Message-State: AOJu0YyzvTF56OQPqjcnJxGJhlAwsHuOSQqylKHJFPCiG9AHXOmOx1RD
	qWQVSAd3rmhjTSZusTTpS8wqAezeW7AZ1tJVfJrT+GJssBxqbco7Q/7nBiG017P4uWAZTGDkdWi
	XxHKuOmqKK70lxuc3jFi5b8pDaQI=
X-Google-Smtp-Source: AGHT+IGNsbGjJq8Dz2ZQCS8Wh8/6+oFoCFbOfcGLbDjKt3An0usGoL8I1l5+JBXpJFUekYaPxio/w2jC/odyt4ldbKs=
X-Received: by 2002:a17:90a:d64f:b0:30a:2196:e654 with SMTP id
 98e67ed59e1d1-30e517853e7mr1036498a91.15.1747268279075; Wed, 14 May 2025
 17:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com> <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Thu, 15 May 2025 03:17:48 +0300
X-Gmail-Original-Message-ID: <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
X-Gm-Features: AX0GCFuaEv9cpS42k1XF87YPo9WSvjg8iXOg6oOZGPtLNGJgkjMpQbVPpysTOVE
Message-ID: <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback maxlinewidth
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 02:52, Jessica Zhang
<jessica.zhang@oss.qualcomm.com> wrote:
>
> Since the max mixer width is not a strict hardware limit, use the actual

Is it? What is the actual max width that the mixer can support?

> hardware limit (the writeback maxlinewidth) to filter modes.
>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 8ff496082902..0a198896f656 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>         struct msm_drm_private *priv = dev->dev_private;
>         struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>
> -       /*
> -        * We should ideally be limiting the modes only to the maxlinewidth but
> -        * on some chipsets this will allow even 4k modes to be added which will
> -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
> -        * and source split support added lets limit the modes based on max_mixer_width
> -        * as 4K modes can then be supported.
> -        */
> -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
> +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
>                         dev->mode_config.max_height);
>  }
>
>
> --
> 2.49.0
>

