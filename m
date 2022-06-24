Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEC655A3CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 23:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbiFXVkX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 17:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbiFXVkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 17:40:23 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215CF87B45
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 14:40:22 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z11so5186181edp.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FZYod/LHle/jfmWY/zvHrx8O3LfygSNaaLJbeeaZy9Y=;
        b=DJ9UIKSaDy12f3GUuM7BXgQfiPoT1tdOHJpXBuuYiRAnyaqQSjwsLm4lUs+FHTrtk2
         LQVknHtWZmBnM1asHoNucamNkZ4o/mp0QAs9srJymrFPcXvA+B0Yu3ZssKtFcdl2HwJG
         gplTqpsHbl802WvWckpxCq4yTxwUI5B06ZJy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FZYod/LHle/jfmWY/zvHrx8O3LfygSNaaLJbeeaZy9Y=;
        b=dq0Lc8R72B4lqPD+KSv8noyRvJX6Nzx3PpA8TKG4713q7BVF2bnK1XomopXbr+zdU3
         ni1dmAIRp1ZJBQgBAW7qn0ZAI0ELyA8qgixp73EBrwyKHU5s94XZCkCAtjeQcZ4pQZld
         BfB74hEX3My+NTBZDmU1vYfdBY6VJ7FDGowpT/ipzO1ACLPzTvq2C/mUlyHFTCqQ+sPK
         WjK6J5+s1Wwmti498sREX7qBeeieGL/J5Kla/ftyZTVdOM7ud1Ogo3ky0NWUeSNM6iA2
         A1SHqdNHUfQqbBoN/OlsTHJalxyc27DXEORmTsW3rMdtwZsQZndRCq4LFoYIDOjEVG8y
         v7lw==
X-Gm-Message-State: AJIora87SaaE5+JR+8Dc0DnIigeNgZWqCqf73flXSM3GIr5NaDFc3nIp
        YoFKC1K/pRwkiO5mt9mnVKjHBTT3Bgtmf7C9pt0=
X-Google-Smtp-Source: AGRyM1tOzIJx4kyJOiKeNdj98mDhKaX2qB7qYBbS1pY4l65itzMynS1vPhNyCAlOk+qAwPRGuIRT5A==
X-Received: by 2002:a05:6402:2684:b0:435:dcaf:29b3 with SMTP id w4-20020a056402268400b00435dcaf29b3mr1464225edd.358.1656106820547;
        Fri, 24 Jun 2022 14:40:20 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id bg6-20020a170906a04600b00722e31fcf42sm1711147ejb.184.2022.06.24.14.40.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 14:40:19 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id k129so591441wme.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 14:40:18 -0700 (PDT)
X-Received: by 2002:a7b:c392:0:b0:39c:4d27:e698 with SMTP id
 s18-20020a7bc392000000b0039c4d27e698mr1150788wmj.57.1656106818114; Fri, 24
 Jun 2022 14:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com> <1656090912-18074-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1656090912-18074-2-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jun 2022 14:40:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XD0Nb8GiaqEM52rEkUeVjuo46hBv9YUizdDu9zOH6QfA@mail.gmail.com>
Message-ID: <CAD=FV=XD0Nb8GiaqEM52rEkUeVjuo46hBv9YUizdDu9zOH6QfA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/msm/dp: move struc of msm_display_info to msm_drv.h
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jun 24, 2022 at 10:15 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> With current implementation, communication between interface driver and
> upper mdss encoder layer are implemented through function calls. This
> increase code complexity. Since struct msm_display_info contains msm
> generic display information, it can be expended to contains more useful
> information, such as widebus and dcs, in future to serve as communication
> channel purpose between interface driver and upper mdss encoder layer so
> that existing function calls can be eliminated.
> This patch more struct msm_display_info to msm_drv.h to be visible by
> whole msm scope.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 20 --------------------
>  drivers/gpu/drm/msm/msm_drv.h               | 19 +++++++++++++++++++
>  2 files changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 781d41c..6b604c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -19,26 +19,6 @@
>  #define IDLE_TIMEOUT   (66 - 16/2)
>
>  /**
> - * struct msm_display_info - defines display properties
> - * @intf_type:          DRM_MODE_ENCODER_ type
> - * @capabilities:       Bitmask of display flags
> - * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
> - * @h_tile_instance:    Controller instance used per tile. Number of elements is
> - *                      based on num_of_h_tiles
> - * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> - *                              used instead of panel TE in cmd mode panels
> - * @dsc:               DSC configuration data for DSC-enabled displays
> - */
> -struct msm_display_info {
> -       int intf_type;
> -       uint32_t capabilities;
> -       uint32_t num_of_h_tiles;
> -       uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> -       bool is_te_using_watchdog_timer;
> -       struct msm_display_dsc_config *dsc;

So in the structure you're "moving" there's this member called "dsc".


> -};
> -
> -/**
>   * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
>   * @encoder:   encoder pointer
>   * @crtc:      crtc pointer
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index fdbaad5..f9c263b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -106,11 +106,30 @@ struct msm_drm_thread {
>         struct kthread_worker *worker;
>  };
>
> +<<<<<<< HEAD

The above doesn't look like valid C to me.


>  /* DSC config */
>  struct msm_display_dsc_config {
>         struct drm_dsc_config *drm;
>  };
>
> +/**
> + * struct msm_display_info - defines display properties
> + * @intf_type:          DRM_MODE_ENCODER_ type
> + * @capabilities:       Bitmask of display flags
> + * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
> + * @h_tile_instance:    Controller instance used per tile. Number of elements is
> + *                      based on num_of_h_tiles
> + * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
> + *                              used instead of panel TE in cmd mode panels
> + */
> +struct msm_display_info {
> +       int intf_type;
> +       uint32_t capabilities;
> +       uint32_t num_of_h_tiles;
> +       uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> +       bool is_te_using_watchdog_timer;

...but then when you "move" the structure to its new location, which
should be a noop, then <poof> the "dsc" variable vanishes (along with
the kernel doc description of it before the structure).

-Doug
