Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832CB6726F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 19:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjARSaR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 13:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjARSaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 13:30:16 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E593A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 10:30:15 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id v81so16859909vkv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 10:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4A0YJvhO9mTBEXJWnUYkahEQbqNSuIjy4Bxdd13jBXc=;
        b=N0b4sz+3oAEofBJM6TYF9uNRBuNRzsOWafUK3eDGO6uglW6efzFagX2W1H9opUiQ0Q
         tE+VMgdMK3/Xq+TF4DE9ip7d9IBLRP2pi9lqCBtrTXZ1YfWsWdRnrPXOSbO+CejI4GnS
         G8pzQi2xc7tZnwhmU8eS4njonMSOIXnFoltfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4A0YJvhO9mTBEXJWnUYkahEQbqNSuIjy4Bxdd13jBXc=;
        b=ChJZ6JYZT0qtacdjJeUniOspv0HyWX85W+0s6b2uHwWn4WDYYIOPDMvYwbo8unG0XR
         4B9L7f6woeArDUVzeXiRyjoWwgkbOnQufD+VKJ4eRCWrfopWWOmzik2jINktFGTIXq7y
         gbhL9TIHic0ZWJAfiXfpY5+IA7RfQVsnOUCv7jEAdkAMfD3ujoHgadGLsVMrmF2xJt6y
         TVCi4NYhB42LQH0AlLv7RZvJysCHKzpQMdexIzsbzBSPZirtfLWHHrPeL6WPeqtChDin
         PWqfn04sqKSyUaT7u4tcX33erRePO63bMlYHWe2DRZIKTvHGZDs5zWp8g9kVg9gFS2Vj
         e3ug==
X-Gm-Message-State: AFqh2kqpU8vSsuCJqewYGjogNMxmMJA0+bCJ999l211xUYZ/ztZUK6r9
        xducV8vQgDFaOAiuSZ1SgUY2jAmb04Vwgy8c
X-Google-Smtp-Source: AMrXdXtsd54jgVZgOQax2oTRLoPHTP0SDMe5qh5nq7xU4QBhkxywW3wRQ+b45V97RuAl3kA8i9lqxw==
X-Received: by 2002:a1f:a00c:0:b0:3bd:c428:c22b with SMTP id j12-20020a1fa00c000000b003bdc428c22bmr16668452vke.4.1674066613625;
        Wed, 18 Jan 2023 10:30:13 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id h138-20020a1f9e90000000b003bd94c3a733sm4167014vke.0.2023.01.18.10.30.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 10:30:12 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id j14so8806193ual.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 10:30:12 -0800 (PST)
X-Received: by 2002:ab0:2550:0:b0:419:c79a:b921 with SMTP id
 l16-20020ab02550000000b00419c79ab921mr961197uan.100.1674066612023; Wed, 18
 Jan 2023 10:30:12 -0800 (PST)
MIME-Version: 1.0
References: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com> <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Jan 2023 10:29:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeBBFTZBjZNhMUBO1uTNKBwcgZM6ehnw3BGmervE7jXA@mail.gmail.com>
Message-ID: <CAD=FV=VeBBFTZBjZNhMUBO1uTNKBwcgZM6ehnw3BGmervE7jXA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm/msm/dp: enhance dp controller isr
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
        dmitry.baryshkov@linaro.org, andersson@kernel.org,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Dec 27, 2022 at 6:16 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> dp_display_irq_handler() is the main isr handler with the helps
> of two sub isr, dp_aux_isr and dp_ctrl_isr, to service all DP
> interrupts on every irq triggered. Current all three isr does
> not return IRQ_HANDLED if there are any interrupts it had
> serviced. This patch fix this ambiguity by having all isr
> return IRQ_HANDLED if there are interrupts had been serviced
> or IRQ_NONE otherwise.
>
> Changes in v5:
> -- move complete into dp_aux_native_handler()
> -- move complete into dp_aux_i2c_handler()
> -- restore null ctrl check at isr
> -- return IRQ_NODE directly
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 95 ++++++++++++++++++++++++++-----------
>  drivers/gpu/drm/msm/dp/dp_aux.h     |  2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 ++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++--
>  5 files changed, 89 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index cc3efed..d01ff45 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -162,45 +162,84 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
>         return i;
>  }
>
> -static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
> +static irqreturn_t dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
>  {
> -       if (isr & DP_INTR_AUX_I2C_DONE)
> +       irqreturn_t ret = IRQ_NONE;
> +
> +       if (isr & DP_INTR_AUX_I2C_DONE) {
>                 aux->aux_error_num = DP_AUX_ERR_NONE;
> -       else if (isr & DP_INTR_WRONG_ADDR)
> +               ret = IRQ_HANDLED;
> +       } else if (isr & DP_INTR_WRONG_ADDR) {
>                 aux->aux_error_num = DP_AUX_ERR_ADDR;
> -       else if (isr & DP_INTR_TIMEOUT)
> +               ret = IRQ_HANDLED;
> +       } else if (isr & DP_INTR_TIMEOUT) {
>                 aux->aux_error_num = DP_AUX_ERR_TOUT;
> -       if (isr & DP_INTR_NACK_DEFER)
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (isr & DP_INTR_NACK_DEFER) {
>                 aux->aux_error_num = DP_AUX_ERR_NACK;
> +               ret = IRQ_HANDLED;
> +       }
> +
>         if (isr & DP_INTR_AUX_ERROR) {
>                 aux->aux_error_num = DP_AUX_ERR_PHY;
>                 dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> +               ret = IRQ_HANDLED;
>         }

The end result of the above is a weird mix of "if" and "else if" for
no apparent reason. All except one of them just updates the exact same
variable so doing more than one is mostly useless. If you made it
consistently with "else" then the whole thing could be much easier,
like this (untested):

static irqreturn_t dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
{
    if (isr & DP_INTR_AUX_ERROR) {
        aux->aux_error_num = DP_AUX_ERR_PHY;
        dp_catalog_aux_clear_hw_interrupts(aux->catalog);
    } else if (isr & DP_INTR_NACK_DEFER) {
        aux->aux_error_num = DP_AUX_ERR_NACK;
    } else if (isr & DP_INTR_AUX_I2C_DONE) {
        aux->aux_error_num = DP_AUX_ERR_NONE;
    } else if (isr & DP_INTR_WRONG_ADDR) {
        aux->aux_error_num = DP_AUX_ERR_ADDR;
    } else if (isr & DP_INTR_TIMEOUT) {
        aux->aux_error_num = DP_AUX_ERR_TOUT;
    } else {
        return IRQ_NONE;
    }

    complete(&aux->comp);

    return IRQ_HANDLED;
}

Note that I changed the order to make sure that the behavior was
exactly the same (previously later tests without the "if" would
override "aux_error_num" so I moved them first. Also previously
dp_catalog_aux_clear_hw_interrupts() would always be called for the
PHY error even if other errors were present so my new proposal
preserves this behavior.


> +
> +       if (ret == IRQ_HANDLED)
> +               complete(&aux->comp);
> +
> +       return ret;
>  }
>
> -static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
> +static irqreturn_t dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
>  {
> +       irqreturn_t ret = IRQ_NONE;
> +
>         if (isr & DP_INTR_AUX_I2C_DONE) {
>                 if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
>                         aux->aux_error_num = DP_AUX_ERR_NACK;
>                 else
>                         aux->aux_error_num = DP_AUX_ERR_NONE;
> -       } else {
> -               if (isr & DP_INTR_WRONG_ADDR)
> -                       aux->aux_error_num = DP_AUX_ERR_ADDR;
> -               else if (isr & DP_INTR_TIMEOUT)
> -                       aux->aux_error_num = DP_AUX_ERR_TOUT;
> -               if (isr & DP_INTR_NACK_DEFER)
> -                       aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
> -               if (isr & DP_INTR_I2C_NACK)
> -                       aux->aux_error_num = DP_AUX_ERR_NACK;
> -               if (isr & DP_INTR_I2C_DEFER)
> -                       aux->aux_error_num = DP_AUX_ERR_DEFER;
> -               if (isr & DP_INTR_AUX_ERROR) {
> -                       aux->aux_error_num = DP_AUX_ERR_PHY;
> -                       dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> -               }
> +
> +               return IRQ_HANDLED;

It's hard to see in "diff" form, but if you apply your patch and check
I think there's a bug. Specifically if DP_INTR_AUX_I2C_DONE is found
then we'll return IRQ_HANDLED without completing.

Also: same comment as with the above function, this is all cleaner if
you just consistently use "else if". Untested:

static irqreturn_t dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
{
    if (isr & DP_INTR_AUX_I2C_DONE) {
        if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
            aux->aux_error_num = DP_AUX_ERR_NACK;
        else
            aux->aux_error_num = DP_AUX_ERR_NONE;
    } else if (isr & DP_INTR_AUX_ERROR) {
        aux->aux_error_num = DP_AUX_ERR_PHY;
        dp_catalog_aux_clear_hw_interrupts(aux->catalog);
    } else     if (isr & DP_INTR_I2C_DEFER) {
        aux->aux_error_num = DP_AUX_ERR_DEFER;
    } else if (isr & DP_INTR_I2C_NACK) {
        aux->aux_error_num = DP_AUX_ERR_NACK;
    } else if (isr & DP_INTR_NACK_DEFER) {
        aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
    } else if (isr & DP_INTR_WRONG_ADDR) {
        aux->aux_error_num = DP_AUX_ERR_ADDR;
    } else if (isr & DP_INTR_TIMEOUT) {
        aux->aux_error_num = DP_AUX_ERR_TOUT;
    } else {
        return IRQ_NONE;
    }

    complete(&aux->comp);

    return IRQ_HANDLED;
}

>         }
> +
> +       if (isr & DP_INTR_WRONG_ADDR) {
> +               aux->aux_error_num = DP_AUX_ERR_ADDR;
> +               ret = IRQ_HANDLED;
> +       } else if (isr & DP_INTR_TIMEOUT) {
> +               aux->aux_error_num = DP_AUX_ERR_TOUT;
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (isr & DP_INTR_NACK_DEFER) {
> +               aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (isr & DP_INTR_I2C_NACK) {
> +               aux->aux_error_num = DP_AUX_ERR_NACK;
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (isr & DP_INTR_I2C_DEFER) {
> +               aux->aux_error_num = DP_AUX_ERR_DEFER;
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (isr & DP_INTR_AUX_ERROR) {
> +               aux->aux_error_num = DP_AUX_ERR_PHY;
> +               dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (ret == IRQ_HANDLED)
> +               complete(&aux->comp);
> +
> +       return ret;
>  }
>
>  static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
> @@ -409,14 +448,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>         return ret;
>  }
>
> -void dp_aux_isr(struct drm_dp_aux *dp_aux)
> +irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
>  {
>         u32 isr;
>         struct dp_aux_private *aux;
>
>         if (!dp_aux) {
>                 DRM_ERROR("invalid input\n");
> -               return;
> +               return IRQ_NONE;
>         }
>
>         aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> @@ -425,17 +464,15 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>
>         /* no interrupts pending, return immediately */
>         if (!isr)
> -               return;
> +               return IRQ_NONE;
>
>         if (!aux->cmd_busy)
> -               return;
> +               return IRQ_NONE;
>
>         if (aux->native)
> -               dp_aux_native_handler(aux, isr);
> +               return dp_aux_native_handler(aux, isr);
>         else
> -               dp_aux_i2c_handler(aux, isr);
> -
> -       complete(&aux->comp);
> +               return dp_aux_i2c_handler(aux, isr);

Personally, I wouldn't have done it this way. I guess that means I
disagree with Stephen. I'm not dead-set against this way and it's fine
if you want to continue with it. If I were doing it, though, then I
would always return IRQ_HANDLED IF dp_catalog_aux_get_irq() returned
anything non-zero. Why? Officially if dp_catalog_aux_get_irq() returns
something non-zero then you know for sure that there was an interrupt
for this device and officially you have "handled" it by acking it,
since dp_catalog_aux_get_irq() acks all the bits that it returns. That
means that even if dp_aux_native_handler() or dp_aux_i2c_handler()
didn't do anything with the interrupt you at least know that it was
for us (so if the IRQ is shared we properly report back to the IRQ
subsystem) and that it won't keep firing over and over (because we
acked it).

NOTE: I still like having the complete() call in
dp_aux_native_handler() and dp_aux_i2c_handler() and, to me, that part
of this patch is worthwhile. That makes it more obvious that the code
is truly expecting that complete to be called for all error cases as
well as transfer finished.

-Doug
