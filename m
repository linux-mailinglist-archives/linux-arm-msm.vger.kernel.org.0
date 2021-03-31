Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82723350AFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 01:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhCaXqq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 19:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhCaXqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 19:46:35 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E77C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:46:35 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id l6so298145qtq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LYa+AG9JR1t6qbABdQ1iCGfLaLvkJp9ZS13fKinSSac=;
        b=ctaBO5zR13LihBuEeHxc8Iu/QFRibysNpeKgX+kU2t+ibrAopqUh/O3Z5zJhzEYOLi
         WkpMisFcmDpdNyg8MIyTPoesZeAvkb7fNH+pnt2wcMh/PTFD+96gEIOvrHu7FMUWUjlK
         341Ow9vIocW+ba+vnYCmMKd3WL/8koWnxkGLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LYa+AG9JR1t6qbABdQ1iCGfLaLvkJp9ZS13fKinSSac=;
        b=Ol4+ZgNlgPWS/kScSXP+I4IhWYJS8uWpSpBNLYvQ/mUP+J4mhULxyRQHfdj5OEyFy3
         iM+HnapVqcbujR2slXF9Q04Gj+v7yKuX+Vom7TcY9U6AMWvJXDA/tEcVBduWWmy/Uf2+
         4CMBXFA/B2sXdS18QFzcgF5Jv2ERNfOl7dd6Xq/mEz5ovxW1X+31OCb9OSXvGv9ExIPM
         kZgORxCOBduqcTy7nKCMP23HU2sfDqxpPjP8JQTAyiFkUq8R4q/lKBteuzSvqoWI/21a
         ihaIGRv9GdTqxvYmE9zg2vKB1f9Kbva5z19T8XcBYwPvAmT34C1mdC90d80QpBKhLKG1
         mRNQ==
X-Gm-Message-State: AOAM530PTg2gx2FgUsCqZ2i0JLFZJjCT3HZhqFM1p+8qfuWkpF/pa77U
        JIEA8u5Hqd8RHtpMVIAYqIWsZK70U2RcUg==
X-Google-Smtp-Source: ABdhPJx+SQvifgGQNZX1yoXFT54cCyA7ZG9pFw5Ldt1Y3bZh2ty7kr+u/ehOFNya+x3mELwI+2WLhg==
X-Received: by 2002:ac8:1281:: with SMTP id y1mr4786426qti.188.1617234394357;
        Wed, 31 Mar 2021 16:46:34 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id b2sm2247186qtb.54.2021.03.31.16.46.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 16:46:34 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id l15so23092123ybm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:46:33 -0700 (PDT)
X-Received: by 2002:a25:4092:: with SMTP id n140mr8176109yba.276.1617234393416;
 Wed, 31 Mar 2021 16:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210331221630.488498-2-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-2-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 Mar 2021 16:46:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLjCFXi4cffyGqbF05nCFJr+wA_3+g2tkCVey5MxARcA@mail.gmail.com>
Message-ID: <CAD=FV=WLjCFXi4cffyGqbF05nCFJr+wA_3+g2tkCVey5MxARcA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm: Remove unused freed llist node
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

On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Unused since c951a9b284b907604759628d273901064c60d09f

Not terribly important, but checkpatch always yells at me when I don't
reference commits by saying:

commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")


> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
