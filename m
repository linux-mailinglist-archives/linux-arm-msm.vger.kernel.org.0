Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E603517C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbhDARmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbhDARlD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:41:03 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069ACC0225AB
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:34:43 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id f12so1747653qtq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bgQ3XZ5ITKRGojF0eSgHx7BZvQ88/ghBhXwnDbKAV2I=;
        b=YhJ7jkjScY7JdQhF/7Tt22mZk21tl8MbMM81VDTVwMeS/bumy1w9WGLvBQENfwcpeB
         2ljIOmE/0b06jnmE6dkboTDAy94ze0X9i8gyWwaN4XMFw6NveMfupfnjzjWCFGiD4kIO
         Z5Pg/KYuMKdSJP55scpo50bf+0976bJPooquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bgQ3XZ5ITKRGojF0eSgHx7BZvQ88/ghBhXwnDbKAV2I=;
        b=QWY6QmxLPUvHmxKp5LK6iMnHz2SPgYk3UbQypNO83iTbniMbmYwlEABXlbcZwCp4Tu
         6rbK79a8TrSUxSgo6TbzX7Ba/7bR9m1ZEF2oSVWvIX1bZD7E0w/KM2cUj/nfpb5ZOvNr
         yC6NIxY/HfDJFnKXSQBhTczeVVw4IUa6DNAKcjNkxWKFylAL1XFWv9jgZ4/5OOVxkuzV
         7OH06aX7W6ojJZZCG8laKCxfzA+D1gc6JQoEFo1VGflLk9k2i3LiIEK1FuMielYXuIBP
         7AkzzVCrEwKKl9vlzgJyEk/Xqt753fEpuh1V8nKIpml5juCVdamhwslzCLaC0CRtvJFX
         4VeQ==
X-Gm-Message-State: AOAM530SPYiIwiemH5LhJ/ntSDvpqWo93SZOb0EqyKLW/PDJzwdaufRo
        jD0j6wvOy5QIECZvGn70dH+rpUtshOlsNA==
X-Google-Smtp-Source: ABdhPJwOrUHBIhgFTFspoJ1fGjQM0P9wUQwKWhYNY4Jr4oeB0D6Jttbieag6ZlWDfVO+VuUhw4a8hg==
X-Received: by 2002:ac8:4e51:: with SMTP id e17mr7624932qtw.204.1617291281296;
        Thu, 01 Apr 2021 08:34:41 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id j15sm3776785qtr.34.2021.04.01.08.34.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 08:34:40 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id w8so2217320ybt.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:34:40 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr12794123ybp.476.1617291280047;
 Thu, 01 Apr 2021 08:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-2-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-2-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Apr 2021 08:34:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1QUHYw-QkZO-bn+sS_K=KYRe83DfSqVow2RGFXu6nqg@mail.gmail.com>
Message-ID: <CAD=FV=V1QUHYw-QkZO-bn+sS_K=KYRe83DfSqVow2RGFXu6nqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm: Remove unused freed llist node
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

On Wed, Mar 31, 2021 at 6:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Unused since commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
