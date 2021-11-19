Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4027C4579A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 00:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbhKSXla (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 18:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235994AbhKSXla (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 18:41:30 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29A9C06173E
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Nov 2021 15:38:27 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id w4so641544ilv.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Nov 2021 15:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wxVf84QwnEj8Uc7joyd4EzO/U0Oo8kpz6vj1F+hcMLk=;
        b=JoaU0znIPwQg4L/KYolJbJCVzydlY40vwNvIaoWmJqcQcJ8eG1h8jr3q4as59wc+1i
         sKIlfZ78zXnJFtr3OoqfN1viwrus/BmPq/Y6dYdUzqH6wclOo+fktpZoRnWrKKMylQ97
         8D4ReJ3enlh7d4svPfS8hp3F0IZsEnpSYjVFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wxVf84QwnEj8Uc7joyd4EzO/U0Oo8kpz6vj1F+hcMLk=;
        b=W2F6sVFvbRwexuIELFbjtzb9uW9FuH69uw+cYVsbhXOtSkT5acaFBDuQz0rICgJADf
         9QlFcuqVX4O25TzWNLq5x2kpUhZxP5xX/feuAcOqK6HvoIuLsKIY4sayedtld7i74OhX
         T5V2szQX+a3MLZ06oYBR96C6fUpI6nFu9b024Hi48Np3fuMY22nXtfrUztsVNonJ6lPd
         CU6ruU8VT5TjcGTuRWaMMabLbF2FkhAzKRMxpTjH4CIHcwn3o1eC1ChLl76KINzsDnxg
         ZsWCG3QN6wjNjkZSstxrEP3okUIccyGBhX87q188vJOU83gLlIwOmSmnqU4yuxhU9zXO
         oO4w==
X-Gm-Message-State: AOAM530MQZdvpG0HLrwFM6iB1hYLVHq60oHJXVLXG7ELEck+IGyTD4QI
        7eq+igXY0WB90PYmU92e10yKmvAwIKSx7A==
X-Google-Smtp-Source: ABdhPJw2y2TDZMU3uS7NZrqOUE1JOd0RnownvXxBHKR2eluKZKDOTSA8TemtTEIdVwUNlCcMe/3aCg==
X-Received: by 2002:a05:6e02:17ca:: with SMTP id z10mr7461080ilu.238.1637365106896;
        Fri, 19 Nov 2021 15:38:26 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id k8sm928844ilu.23.2021.11.19.15.38.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 15:38:26 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id w22so14892264ioa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Nov 2021 15:38:26 -0800 (PST)
X-Received: by 2002:a05:6638:190f:: with SMTP id p15mr31409196jal.82.1637365106040;
 Fri, 19 Nov 2021 15:38:26 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com>
In-Reply-To: <20211119225157.984706-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 19 Nov 2021 15:38:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XiaMAeTj24zg0bPfSK5hGCjuap0ZDa6ixAKrSUQgJtVQ@mail.gmail.com>
Message-ID: <CAD=FV=XiaMAeTj24zg0bPfSK5hGCjuap0ZDa6ixAKrSUQgJtVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gpu: Fix idle_work time
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 19, 2021 at 2:47 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was supposed to be a relative timer, not absolute.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
