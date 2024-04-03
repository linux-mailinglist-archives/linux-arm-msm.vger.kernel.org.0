Return-Path: <linux-arm-msm+bounces-16243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFB1896BBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 12:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FBB61F211F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 10:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51F6137C2F;
	Wed,  3 Apr 2024 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCFu8d3W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E924137774
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712139018; cv=none; b=nkLjJDqKpwOCW+77fTV4ZgNubvCLRh827KIWhmWxW4oi2jonnEZym7aIRnsirBKzZe31r/Hwv4USAjm+KDlA+ytGURxlxX9LP7ZCkE9eN23earBbTkGkPkmaGk0o5Od+IVajqyWhbGh4cYDQJP26m0yutFD8U9C4/nRBsj4pCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712139018; c=relaxed/simple;
	bh=xE6QTbHFKdSfTxh3//5Pv1bJxOb959BsmtpGeNd3Olo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYnFW341X2dMCz/US6Va8Lk9VmCkvsvxuUscF91u54o/5v8aO8dEj/b2iOO3Kj1RSl8SL9UlU6D31wyu0LqORcgVHHGwGT7spAZg7kFMfE+XRxVdkSl/e4V03oRpWjRwzKsI5mj/8KQgVu4ccpNG67mq4zfc6WruUBKe0owtsao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BCFu8d3W; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61518d33293so20801077b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712139015; x=1712743815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rx+/ODJmMo86rpamIh1rOudX2tVZC9qd0xdyuh7u+G8=;
        b=BCFu8d3Wq0lTtUxJIp9yHcY1pClcdDtEI8J1B+waNcPk/dciwXxqn1s/V3Yncoa25a
         jLDhsDns+pCUSkP+dtSq6qb8oR4k6P52p+whclFfwINl0T27DpsiPeEaq/OISmJGX5rr
         EnAhC0M6SUedf9zqi1wctLhd8ME3ZNe0navo4aouzAO33F21GZzBb0mwGtQ1XgwlJvhG
         aYYzIS2h+zT1deqp2fzNKBLpIo0X3QZRc/zCGmzxb+9BW12irGjg56bAyXGMjLVAZeYf
         5F+1wKMuZMGzH+huC5KkPFesSki1Z/n+ZG/vkkF1IAUDKRSpH5kecaxvbLzB0VqCd50+
         AlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139015; x=1712743815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rx+/ODJmMo86rpamIh1rOudX2tVZC9qd0xdyuh7u+G8=;
        b=We8tBQ3LXK028q5NZcQYD82wwqf+YZxT7/7qwz/NFsctL1cu5leFvs3u2x3zxIgJBC
         R0LvYqU7X65la33rYP1s/654dKor8K8H7SFmm8/eHYrCooByGapalU9D5tgw6sfjUCNW
         CScV6JcjZOihCPD7Vow9QkfYlDe+8HVotEb7gf3LQDxe4hv2HPLGQjOekx8W+24XVqll
         GDbEJCy7k2fpzhYebcH2TU3sjC39mcg1o6QbiOeabKraGT+7j6qxd160C9d0QTUwaW/v
         j6pvX6lAj+RgwlEeAK/kcJr6IhHnirDz5Vlf8Ok20WtGakT1JAmhqCH6ZW973baj5ihK
         Diew==
X-Forwarded-Encrypted: i=1; AJvYcCW9uRgNjbuYjibw86y2C1egBgnHemquGppkLZYv84CMQ4pWUuhAZy0oGGu6aq/Id4HFvBcO6URBujbdJ6z5FlwChZs2a+AvKcJ0jUsW8w==
X-Gm-Message-State: AOJu0Yy1k1ri7FR5ODDlgT+NAD+W1etbTzMfsunVxtUHtRfSJAI+mziJ
	sWdzjjQrTHN/MvMImL1xnkSfpYAyb1YCjqg0Iq6M54HKBs+vFhU7Rms+VqknAjeg52b33/haIoN
	zz57a7oq1TaWA9Q/9lCaUMA/uweIunBrFI6H95A==
X-Google-Smtp-Source: AGHT+IGjh7gnnBb9kNyO5PIPLl2Il5vz8QX1R3iBfDYBjyvguAc/FohIsajpw5mGOtCvkRWDwc/PlH4RwAJFT54eBCo=
X-Received: by 2002:a25:ba42:0:b0:dcb:be59:25e1 with SMTP id
 z2-20020a25ba42000000b00dcbbe5925e1mr12992717ybj.30.1712139015113; Wed, 03
 Apr 2024 03:10:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-2-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-2-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 13:10:03 +0300
Message-ID: <CAA8EJpo-tZSOD+B+4znyBmFPVOjc6yocsVwYMXPN5d3WQfbr=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm/dsi: set video mode widebus enable bit
 when widebus is enabled
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> driver is doing in video mode. Fix that by actually enabling widebus for
> video mode.
>
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

You have ignored all the review comments that were provided for v1.
None of the tags were picked up either.

Have you posted this for internal review like I have explicitly asked you?

> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 2a7d980e12c3..f0b3cdc020a1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
>  #define DSI_VID_CFG0_HSA_POWER_STOP                            0x00010000
>  #define DSI_VID_CFG0_HBP_POWER_STOP                            0x00100000
>  #define DSI_VID_CFG0_HFP_POWER_STOP                            0x01000000
> +#define DSI_VID_CFG0_DATABUS_WIDEN                             0x02000000
>  #define DSI_VID_CFG0_PULSE_MODE_HSA_HE                         0x10000000

From the top of the file:

/* Autogenerated file, DO NOT EDIT manually!

>
>  #define REG_DSI_VID_CFG1                                       0x0000001c
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 9d86a6aca6f2..2a0422cad6de 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -754,6 +754,8 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>                 data |= DSI_VID_CFG0_TRAFFIC_MODE(dsi_get_traffic_mode(flags));
>                 data |= DSI_VID_CFG0_DST_FORMAT(dsi_get_vid_fmt(mipi_fmt));
>                 data |= DSI_VID_CFG0_VIRT_CHANNEL(msm_host->channel);
> +               if (msm_dsi_host_is_wide_bus_enabled(&msm_host->base))
> +                       data |= DSI_VID_CFG0_DATABUS_WIDEN;
>                 dsi_write(msm_host, REG_DSI_VID_CFG0, data);
>
>                 /* Do not swap RGB colors */
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

