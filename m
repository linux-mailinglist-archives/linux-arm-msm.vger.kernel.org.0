Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2273350ADC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 01:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhCaXeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 19:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbhCaXdu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 19:33:50 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E1EC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:33:49 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c4so566252qkg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ryw7Sly4csIxLLkV0t8RVlRi+I4oygJP2r682A3Ebsg=;
        b=XSlzP164vpMabm8VK7gOUDGLcC28VMJkHMTe3WUhvTPmB2LjegZ4XUUKpBnAI+VfX/
         VRJtqvfUH0LXbIQVHPaQmE2CVoSwf73vC7/C2yAl6xriPwSE1pIYCMVoqb6ADYKZtt1H
         ma9YyWtCHNW6GLqQqFMelk3JxyalMU266gNcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ryw7Sly4csIxLLkV0t8RVlRi+I4oygJP2r682A3Ebsg=;
        b=cq8lImkW6cztk9XSm/j3xev29hBdth/wfyrmyjqE7FELeYSKvIQvUXTr2+2USAQKvz
         CYs1tgXjSlDBdMHamBh8SSAF/6iWbKesKowYxLQ+ue6fWeCpuko1jgexE14tODbRKp0r
         zH8CIORK3/Uo3beWRlvbPvtwFpWCq4zjiVKDa6isRzSWCO2K2e6DcVFlnAMONTIWI4Ze
         /6Gz9sZ4A/qF6ph7tAvqrw5kPKeyZjAPGEZOLkXPhie+OZg65kIeYYPmKNnmcKwANfOJ
         ayYaiMnbWT3c1V6nASXHOZiPaSf465V+LCIe6uvQhICSt/5Fm1T0Y57LHfrG/uGKBxrt
         sdmg==
X-Gm-Message-State: AOAM5329o/l027MTZMqUIDD04WticTY+O16LEHiv0XaBJfCgUBRz111r
        sKPK8HTndY/IaaDO/a7P/TFzG83VtHrMaA==
X-Google-Smtp-Source: ABdhPJz61KH92wOkSzUY+J6PaHlyXpemWLgtNuprLAkaw5TFDSkcWV/7DO7wjjI5evjfwS37t6Jvsw==
X-Received: by 2002:a37:a7cb:: with SMTP id q194mr5807683qke.350.1617233628762;
        Wed, 31 Mar 2021 16:33:48 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id p7sm2670451qkc.75.2021.03.31.16.33.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 16:33:48 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id a143so22991382ybg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 16:33:47 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr8190661ybp.476.1617233627357;
 Wed, 31 Mar 2021 16:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com> <20210331221630.488498-5-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-5-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 31 Mar 2021 16:33:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXoE-UsbfS1zOoKyaiVXPUBAnOr7T2ON4m6-i_43Dm6A@mail.gmail.com>
Message-ID: <CAD=FV=UXoE-UsbfS1zOoKyaiVXPUBAnOr7T2ON4m6-i_43Dm6A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm: Improved debugfs gem stats
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
> The last patch lost the breakdown of active vs inactive GEM objects in
> $debugfs/gem.  But we can add some better stats to summarize not just
> active vs inactive, but also purgable/purged to make up for that.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_fb.c  |  3 ++-
>  drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/msm/msm_gem.h | 11 ++++++++++-
>  3 files changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index d42f0665359a..887172a10c9a 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -33,6 +33,7 @@ static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
>  #ifdef CONFIG_DEBUG_FS
>  void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
>  {
> +       struct msm_gem_stats stats = {{0}};

nit: instead of "{{0}}", can't you just do:

struct msm_gem_stats stats = {};

...both here and for the other usage.

Other than that this seems good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
