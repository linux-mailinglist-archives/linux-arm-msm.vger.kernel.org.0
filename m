Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1674C1C1C97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 20:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbgEASHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 14:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729138AbgEASH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 14:07:29 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9D5C061A0C;
        Fri,  1 May 2020 11:07:29 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id re23so8145908ejb.4;
        Fri, 01 May 2020 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u7uWdnXzReMILuWMuJCMVWJ56cZtnobswX6oBH/1+LI=;
        b=vekpM1d56g5fDbCG1IleQHXSiKBdPaYjvbDBn8cEraD0huZTUU0MxRbSdEavQx1Cw6
         EfJ1ajFUGwUjFXkD1gx6qod2jw0GuCJt+K/gaLGFmOmikqEmXlXKAIVA9vZcK0mFbTh8
         yFZyTENfGNSgrpjh0/iLYg3NfLkd7DC/BlT9PotgkO9H6qyhIIgAA3O/vj7dr3oFpyP9
         /GG4sdRG/BtNvbeZokPrWxkUFJF0xSXcU/KH2ys2+PjRGFIgS9gY2wPSXDEIewMNPHFh
         Eg0rDnSqahbXmyU0i/FwPAdU4WNkffDNX0IugVwNMGQhQn/RXBLXvpDHafy6WGRTwWT6
         k2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u7uWdnXzReMILuWMuJCMVWJ56cZtnobswX6oBH/1+LI=;
        b=tJyny85eRSHkH6wJ+5PQ2YMJojLAI5X7zqaxTn3NiwZJbkrRziCPYqaxpLcEdRzMlI
         SX35jySeG5Y21b/WbI+bJ/op8Cb6lte937rYxyjX4n+mSlWuNrdwLvsVDgkdQO5UBsfM
         TG3T+lg5rnIdaCLnDfrx7F42ttJqdS4yiP1D+Ejo1JbZKDp+RcnXxolNdti9mxT05z4g
         fiMBlZ8VLKJ8OYldGXClUI2mrGym2iInmb9+hrimaKUP627ORUrnZK9hu1Tz4XnqCjzO
         ZEBgl2t6S7rsq0afpbK/beDO+RCAF1NwP90kiVqVUdne3l/rVn7c+9WJtMXMQxqZAqmh
         pcpw==
X-Gm-Message-State: AGi0PuaYC9bgZ5Q2ieZNVBPoiNGY0bhLTu+MHJZsy74yHwSOtj8RnJ4B
        kqIn0NrO2yDqTIyhhCeo4FAHssJQO+HvXj9f1bk=
X-Google-Smtp-Source: APiQypKGvYoGXVQMOaMMGuLG6ZVr8NMMUDLLVypjF+0BH0k/Zjptcxe8gMGO+JVPHbaw6NNSXzHRZRexKuHsnVIIv94=
X-Received: by 2002:a17:906:970e:: with SMTP id k14mr4444610ejx.202.1588356447735;
 Fri, 01 May 2020 11:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200430192427.4104899-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200430192427.4104899-1-bjorn.andersson@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 1 May 2020 11:07:32 -0700
Message-ID: <CAF6AEGsq8RPX7ttqdMh1rXFUqCmVKWNVfez12sV+5PRaz2X8Uw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix undefined "rd_full" link error
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 30, 2020 at 12:25 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> rd_full should be defined outside the CONFIG_DEBUG_FS region, in order
> to be able to link the msm driver even when CONFIG_DEBUG_FS is disabled.
>
> Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

thanks,

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_rd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index 732f65df5c4f..fea30e7aa9e8 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -29,8 +29,6 @@
>   * or shader programs (if not emitted inline in cmdstream).
>   */
>
> -#ifdef CONFIG_DEBUG_FS
> -
>  #include <linux/circ_buf.h>
>  #include <linux/debugfs.h>
>  #include <linux/kfifo.h>
> @@ -47,6 +45,8 @@ bool rd_full = false;
>  MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
>  module_param_named(rd_full, rd_full, bool, 0600);
>
> +#ifdef CONFIG_DEBUG_FS
> +
>  enum rd_sect_type {
>         RD_NONE,
>         RD_TEST,       /* ascii text */
> --
> 2.24.0
>
