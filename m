Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C8D52285F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 02:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236821AbiEKAUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 20:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236317AbiEKAUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 20:20:49 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D22311C25
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 17:20:47 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2f7b815ac06so3896517b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6vpXpw5XZq/WrbDVmy+tJWQcUF77jv1N0UbvJAonvnU=;
        b=w7tblpXNjCpAdHrXR8Vsnj84FjFr91Zp7XFGp6hW6GdlcUctB8YZYvWN7+FqJhUsWp
         Lfa9hz5DunLQMwkY2ijmdSDjEK+cvJE4bQLfuudysuE6TGFtxDwybpYoyjbSd0rfiLCB
         ysPvqVgG3peWvDc+qujiXzaPwuf10GS1B55GhkPDJucFdnHiVI5R7+wLSoL9lW8bnBVP
         z7GHP9+5NduIv82dOfKwrJYFFZZiOkMLJfZCowmQJFAVpkHmm0div0lp7B2unJ4Af4v5
         bQnCGd3mcPkUpVgnxRgKCOIeTv14KQTG8EzBpPW8feDLdK1iMlzNYQcSBnRl3CzFdszT
         yvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vpXpw5XZq/WrbDVmy+tJWQcUF77jv1N0UbvJAonvnU=;
        b=OPQXrpyc/cbOpTL2GHrm5lP2Q4TnBfV9UIpVADON5n7gE7NEblyhE9sh4agz4PXjDA
         +vEk/XFyA/GEWWIW3BfPP6aU8IBq5n2okLWR18i5P9oddb950y7ZEHmMHNctata9BBAy
         LVexrinH60ZEmRnHxP7HeWS9OvF9xGpj/Jr9p8XkbqqFd/VMtUwNW2Fnoav/JReE8FQT
         qe1L0/Bb+ruXIoE6StFN7PVx3OGBx+WR3Rpco4KqFXvwAClxm6Z2/rNDKwnEEFuIpYkV
         y3IL4bGbiXoMC8fDJC8RVaDzUh7I0bfeTw2Cr3TFDz1SLF00QJY9SLgB3CFNG99qYna9
         7seA==
X-Gm-Message-State: AOAM533VhkfQJwtj15erNiRRZAQjlz+Vh+0aOz+breHYAst9Aqk1MmFy
        Vzf+WRCjZUpXAvuyIWKbwEcxc74X+ujMQoNzBD1/ow==
X-Google-Smtp-Source: ABdhPJxvhAkk2Km4fbuCctbq2xFMtEja6/plgDD2L2i2wt+jmqVRruARk+Pto0kZ1tDyHEnHY8br6RxGTF6LJx15PkY=
X-Received: by 2002:a0d:db8f:0:b0:2fb:958c:594f with SMTP id
 d137-20020a0ddb8f000000b002fb958c594fmr1290258ywe.490.1652228446267; Tue, 10
 May 2022 17:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org> <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
In-Reply-To: <20220510122726.v3.1.Ia91f4849adfc5eb9da1eb37ba79aa65fb3c95a0f@changeid>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 11 May 2022 03:20:35 +0300
Message-ID: <CAA8EJpoWA3sFDpAESp7XoZ279uTk25cxTcr9Chjp=0vrBaNmtA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
To:     Douglas Anderson <dianders@chromium.org>
Cc:     dri-devel@lists.freedesktop.org,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Robert Foss <robert.foss@linaro.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 10 May 2022 at 22:29, Douglas Anderson <dianders@chromium.org> wrote:
>
> While working on the DP AUX bus code I found a few small things that
> should be fixed. Namely the non-devm version of
> of_dp_aux_populate_ep_devices() was missing an export. There was also
> an extra blank line in a kerneldoc and a kerneldoc that incorrectly
> documented a return value. Fix these.
>
> Fixes: aeb33699fc2c ("drm: Introduce the DP AUX bus")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> None of these seem critical, so my plan is to land this in
> drm-misc-next and not drm-misc-fixes. This will avoid merge conflicts
> with future patches.
>
> Changes in v3:
> - Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
>
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> index dccf3e2ea323..552f949cff59 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -66,7 +66,6 @@ static int dp_aux_ep_probe(struct device *dev)
>   * @dev: The device to remove.
>   *
>   * Calls through to the endpoint driver remove.
> - *
>   */
>  static void dp_aux_ep_remove(struct device *dev)
>  {
> @@ -120,8 +119,6 @@ ATTRIBUTE_GROUPS(dp_aux_ep_dev);
>  /**
>   * dp_aux_ep_dev_release() - Free memory for the dp_aux_ep device
>   * @dev: The device to free.
> - *
> - * Return: 0 if no error or negative error code.
>   */
>  static void dp_aux_ep_dev_release(struct device *dev)
>  {
> @@ -256,6 +253,7 @@ int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
>
>         return 0;
>  }
> +EXPORT_SYMBOL_GPL(of_dp_aux_populate_ep_devices);
>
>  static void of_dp_aux_depopulate_ep_devices_void(void *data)
>  {
> --
> 2.36.0.550.gb090851708-goog
>


-- 
With best wishes
Dmitry
