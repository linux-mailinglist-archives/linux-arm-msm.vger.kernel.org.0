Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDC9445CED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 01:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbhKEANz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 20:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbhKEANy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 20:13:54 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF7DDC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 17:11:15 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id f10so7928772ilu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 17:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4KsnJxBGTyLgNC9LQFVaGBTTSMsAvFSllk79LexRwJA=;
        b=nFhNJs/6zLfX/HDdX03yOBZsFn//RbfnTbfvj+8xfIcqZA01a8sEJdr7u7Hg2yFwIx
         UQ8Wr+wzrwqo1ljEOyT7Z0fOU4gCqarwPqUzj1f018BbkV8CPIPaNqLH+1IHHrzBv5SB
         u/PfIRUb4ABRnF3OXo6a4xpOLivk43cyxfPcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4KsnJxBGTyLgNC9LQFVaGBTTSMsAvFSllk79LexRwJA=;
        b=4zQSc3kiU27g290DunWIWPPlBE4z+xp6hJxRlP1cIwejRnOtuO/wRowFaH8IC9jj7r
         3Z+s/RFSeUSFWpJ8/7OytzZziMiij6S93my9tB89/RwBLvsrbid77VQ2iuR/ZVf/FvJT
         ISCcWSKPF6D2RfIChnrDZbCtG8AX3U7kesV802mJ6/Mlk1a9jUSO4jNWHHKGW/yS3mwK
         upIFKpQpKz67jC5/3SQWxdBZqjVtdWCbM+Gpcyos7W5H7OD6A93yn0VMk2BiqYJ26kFK
         3ivIpjQ68yb8WTo50RhTzYj4CNKAFfx9B+8oSLWM7VwFUnGKhN6tCs6bZEfTc4xZhiuF
         WjbA==
X-Gm-Message-State: AOAM531zNrRYJJKkEmNC+/q4n8ZbOZ5BHo/G0aKPbHq20cYYAOTVq9VH
        8ctibFps4VL/T6gXFFWWYieENOTJ8qoSgQ==
X-Google-Smtp-Source: ABdhPJx4Mje1+bUfYjGZC1pCpGlPWqfmK1bbma7ug9gswxxW2SU/Gu8H6yFm18B8AZ7CmU397/Byzw==
X-Received: by 2002:a05:6e02:1749:: with SMTP id y9mr31679482ill.232.1636071074959;
        Thu, 04 Nov 2021 17:11:14 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id o16sm3528274iow.29.2021.11.04.17.11.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 17:11:14 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id k1so7904766ilo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 17:11:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a85:: with SMTP id k5mr18841136ilv.27.1636071073597;
 Thu, 04 Nov 2021 17:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211104222840.781314-1-robdclark@gmail.com>
In-Reply-To: <20211104222840.781314-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 4 Nov 2021 17:11:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xfv+X+X+KBM5yiJ0CdqyAPDKfOgsoZETb_7kmaHR1ztg@mail.gmail.com>
Message-ID: <CAD=FV=Xfv+X+X+KBM5yiJ0CdqyAPDKfOgsoZETb_7kmaHR1ztg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Nov 4, 2021 at 3:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
