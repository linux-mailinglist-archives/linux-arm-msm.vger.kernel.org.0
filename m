Return-Path: <linux-arm-msm+bounces-16244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770A896BD3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 12:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B82D1C20BB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 10:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4794E6FE00;
	Wed,  3 Apr 2024 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euKDnMaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D6137C45
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712139249; cv=none; b=KltAdRsUrENb3Si068cgwxPNt5lugbY/Lcb1r/nmBwwrlOQZcE7J8g/MLvxftzu+6xW4BHKxzj7009JmbjRW0jJ3G+PG4haGYOHhBXjQ220qysVV5th2lmKQW5Y5wxcTTzH2tNtpiBzEg6ta1NOebEXbpWeKRbwbsFC2AAs77VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712139249; c=relaxed/simple;
	bh=3crVOf3j6XXd5qfELYtReh1hJW9lY+2vJMFodoivKjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnKaGZOLX39ezM13AflCrt9Y7CKmjYCBuT1ek0xtCzAYSdMn4a8aVtUbuf+gSkzujH+AoqXxauSWA7QG6X5kzrEuxHZ5HWM/L/O+ciQ6WzJIIqQ5hA9zCmjhIjHRFjLcVzdDKfWR146SAWLbXeUuF4xpG5gSTYfF0rRVdzcB94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euKDnMaH; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso5624055276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712139246; x=1712744046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wKOQs+TmUwBWd9nBZ5bd0FjYKLI0xx+jqXHAXa7eWSs=;
        b=euKDnMaHwcN3zWvvauMzOICwUjY5hSA5y7z93Q/KLnciIaf0T4Y3bkymauS2a3kbQT
         q9piTRrHQCYbe7qDF0DYGJy+fBFhmZ5zVIX8ufxtiDByogG4aOTt8Bps4dQHmsCNGpwQ
         RqUxSz8g5SFcuVmBP5YSDrOBZ6f5vlBKZkn5u8EXDIJyM6pyO3O2mTaq6ReVMOTxfPTN
         vtoGV2cFALP+svMen6kDnXZrCR0D6u5yLBLVtaii7ZF0Z41BunQbJCddSs+lttg2kaOr
         JWSDWyqtwVuJSHSf2BhsqoZsbP3kfwWkaP7c/EmPo3aeuudbUjwlG2x6H8mJTMbFZCxy
         qRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139246; x=1712744046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKOQs+TmUwBWd9nBZ5bd0FjYKLI0xx+jqXHAXa7eWSs=;
        b=QIDfb8/eHGripFRB66bzoDX2/xncODpjkBOjDnchyvKnnbzAxYIItXOWvfMizI69Xg
         j501BsjTfNGJWWguFYkHmdEvB6nzQSS3jcJUbZXDqG2SMA/nN3I9n0eJ3eOagbKEIwPi
         4GU70kAB5VStMoNUc8pSdQMXKbXhjBpO+6/hgop3iFjrNz1iCqBtmX1m5I+IhAd2uo62
         /oLYmXtp2lii+Nz/GujOdCEcJJOa04y68qYrvThOUJSH6WJdUGXUFABhJ/FsMNWITepk
         UWSh7CzONVFEh4l2NaGnrFTR2iOa6t7keXMpzSrOnKTH466fBFrCfIjLXh+WRMVNSiYt
         eE6g==
X-Forwarded-Encrypted: i=1; AJvYcCVTo5c3RWhwAX0rLVXWA2WNv4kQkrfly4oFtHuY9A4at4IPWseOc9g/lyExrRMQHAMnt091EbLwohGlTAfasGttpOKc3TKDsUV31qauaA==
X-Gm-Message-State: AOJu0Yzx89QZDKlGVmeeMtL/1cWa7XXwjipltkSkLkNFAGv99OHVeMoO
	H9js2b++tP4F10Rb93wVkZIMqipbB7Y3ML2Qzlgmvv24DYAqZnPSnlMkrl7eAiaaA4eZeHNoOfX
	zolWH9adt8GAgOgv8bPgmw+UuL2guuFIMTNAcNQ==
X-Google-Smtp-Source: AGHT+IGzKMz9/iFfBLaO0Exy3dYLERLc70CKCeB/qcA5U78i+AFMpSfiHPfV1+G4P61zpg9KKbLtmi5hXn167JObpzo=
X-Received: by 2002:a25:b195:0:b0:dca:59a7:896b with SMTP id
 h21-20020a25b195000000b00dca59a7896bmr14271207ybj.50.1712139246514; Wed, 03
 Apr 2024 03:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 13:13:55 +0300
Message-ID: <CAA8EJpo1YoLWCPz1TXiV_3YOjOxwxV7Jdq6uhX=15LfWHVBmHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
 (fix video mode DSC)
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
> Video mode DSC won't work if this field is not set correctly. Set it to fix
> video mode DSC (for slice_per_pkt==1 cases at least).
>
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

You S-o-b is missing

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 2a0422cad6de..80ea4f1d8274 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -858,6 +858,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         u32 slice_per_intf, total_bytes_per_intf;
>         u32 pkt_per_line;
>         u32 eol_byte_num;
> +       u32 bytes_per_pkt;
>
>         /* first calculate dsc parameters and then program
>          * compress mode registers
> @@ -865,6 +866,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>
>         total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +       bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
>
>         eol_byte_num = total_bytes_per_intf % 3;
>
> @@ -902,6 +904,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>                 dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
>                 dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>         } else {
> +               reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
>                 dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>         }
>  }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

