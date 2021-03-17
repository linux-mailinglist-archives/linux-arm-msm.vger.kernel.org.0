Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E8333F980
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 20:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbhCQTnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 15:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbhCQTnZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 15:43:25 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919C9C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 12:43:25 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id n24so10011133qkh.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5M2o/5txOfVVkT2R7LQazFbw4Qc4fveGxpdbp198xYU=;
        b=RKgCDWdDwNcrvndpEPh2z1A5LONc8q/kcoUvZhZMJbRafeyUDCMPQ9APb5VdSlrvO0
         M/apv7bxCnuXge+S6JbVEtTH/JvPNl2yiQQep2q7mXRp8oEs7rTo4fjJbDAvv3Ior9C9
         MoY4YdsqiJ0l8rOupxYVQbv4QcMBsxNfXvG20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5M2o/5txOfVVkT2R7LQazFbw4Qc4fveGxpdbp198xYU=;
        b=TcaqVQmYahrxvFiUnR2zbqYEPxkz7gVnQyjyYykswlDgJWyJ7kiY+vIUCnASNSltO2
         utY8mBxYObsGXZWeeQ6jeguO6T0Wgw40J2jfFlAClC0qk9n0Oe4A4NCBjDxKFBOtu5mU
         Nw1dRVa7KgSpAjQQiYTr2Ny5u9hsuCv7pdqpsRm484sONWkhwESIvaGHoU2Nl0fw2pzY
         rr6Q6/NaH1om5161MqffL4QdNuYN59PtySBcfTLLXFkTOFdd/Lq9/SR7kZ4jAJBYVaw8
         jEmko/I+dA0qynI4386zOTqXMX0DY3RXpkil0qfh3gZByEs4MHT84mActUAQdG/6kqGy
         +eMg==
X-Gm-Message-State: AOAM531E8gkDcttYrp+6PbPRCCFGbjT6kAM5uT/SVRZPYtiX0wdVHoAk
        EarEXt3X7+WeUyKMxuYqramCDAyFBQ5aow==
X-Google-Smtp-Source: ABdhPJyDXThQktzTTbSt53/udeieZ3j9qzoY9Tj2x47+6J1LBzQSFysYGZ/2Ett3pRhyc5kgLNWXoQ==
X-Received: by 2002:a37:6ca:: with SMTP id 193mr843790qkg.405.1616010204503;
        Wed, 17 Mar 2021 12:43:24 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id z7sm17967622qkf.136.2021.03.17.12.43.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 12:43:23 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id f145so110304ybg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 12:43:23 -0700 (PDT)
X-Received: by 2002:a25:2654:: with SMTP id m81mr6485146ybm.405.1616010202994;
 Wed, 17 Mar 2021 12:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210317164239.1007776-1-robdclark@gmail.com>
In-Reply-To: <20210317164239.1007776-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Mar 2021 12:43:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRXqtYNeqXZfSnhSRJcOS5QGauM=vg=XVQ6=EbWkdkDw@mail.gmail.com>
Message-ID: <CAD=FV=WRXqtYNeqXZfSnhSRJcOS5QGauM=vg=XVQ6=EbWkdkDw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Ratelimit invalid-fence message
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 17, 2021 at 9:40 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We have seen a couple cases where low memory situations cause something
> bad to happen, followed by a flood of these messages obscuring the root
> cause.  Lets ratelimit the dmesg spam so that next time it happens we
> don't loose the kernel traces leading up to this.

s/loose/lose


> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
