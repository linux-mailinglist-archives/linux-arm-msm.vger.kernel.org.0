Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA394528DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 04:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237307AbhKPEB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 23:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237355AbhKPEBW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 23:01:22 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5201AC1F14FE
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:43:24 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id u74so38523016oie.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 16:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AR+MJXQt1hZ4ak+KffeN9j/qO8HcFtJTxsTibtq8SN0=;
        b=OcKmfLQ8A9BF4S3di4lz4OZXJGUTA4mbSUlF7s+b0wJ+grSJIRm0i7Ca1yMgwNY2g8
         70uW5S/5kzyfc1VQ8Ov++7/+Wf/wwIurMBsGC3VDQ7uOz30vQJ8ca0/iDQhvQA8YU7oX
         rWRos7i6GY4nzLNbDZkm+x0eFcNMhKjkB3BMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AR+MJXQt1hZ4ak+KffeN9j/qO8HcFtJTxsTibtq8SN0=;
        b=sVhj8CAsihp2TGK4ZMQoZ/Zo4ojNMC6LoXyS337NuZ7B5liAdi1MHOl/g6zi+p4EGY
         1d3c3h5T+Ybb+Sn/MIv6cu65sL14RJ3G00fi6gSxPnI0sTClrBXqEdaQTqJ9qOl0OtHW
         26ptmQTuCbQq4/GlH+ij5cEyTLHyTJ6B3gcbimk9xP2MixBdV8Mi92l00T+Utb/yor9i
         bZt6E01QzISXyX3/lg2Ykju+MmneaiR5XMQp2Lim6MyAZOtierbVH+aPbGuxHp8kEQ4+
         za9aqx9GBnRHx/uiku82fEiFYemSJ5kSWNoB9MMOpEYz085ozr0AOCjkMY5cDSpMcJpj
         56gQ==
X-Gm-Message-State: AOAM532gSf0bqoMFCbwHfkbcjJRAJIr5AuNfT+GnjJ6EvHIl2FTvb7pz
        xiJyzMSQi5BeJyOq9CShmVv21hKUtALPu9ksV/Aipw==
X-Google-Smtp-Source: ABdhPJz9z5atxroq/GjxihboHlC2x5PboGmywHnjxtnAjxqEQZyoBJQEvr8K/IKhil58m74mic8cKR+6S4n+PtT7tBE=
X-Received: by 2002:aca:2319:: with SMTP id e25mr49152738oie.164.1637023403674;
 Mon, 15 Nov 2021 16:43:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 16:43:23 -0800
MIME-Version: 1.0
In-Reply-To: <20211110120512.150940-1-deng.changcheng@zte.com.cn>
References: <20211110120512.150940-1-deng.changcheng@zte.com.cn>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 15 Nov 2021 16:43:23 -0800
Message-ID: <CAE-0n50=P06ByQrG0FixVK4cGW--Vgt6uwGsLUu792SPhqzqXQ@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/msm/dp: remove unneeded variable
To:     cgel.zte@gmail.com, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        abhinavk@codeaurora.org, deng.changcheng@zte.com.cn,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting cgel.zte@gmail.com (2021-11-10 04:05:12)
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> Fix the following coccicheck review:
> ./drivers/gpu/drm/msm/dp/dp_debug.c: Unneeded variable
>
> Remove unneeded variable used to store return value.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f6247e80e9d..c5c75273d1e5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -365,7 +365,6 @@ static const struct file_operations test_active_fops = {
>
>  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)

Would be nice to make it void as well and then cleanup the caller. Can
you do that too?

>  {
> -       int rc = 0;
>         struct dp_debug_private *debug = container_of(dp_debug,
>                         struct dp_debug_private, dp_debug);
>
