Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7C21BB292
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 02:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgD1ANV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 20:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726204AbgD1ANU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 20:13:20 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A437C0610D5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 17:13:19 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id u12so19489534uau.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 17:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvypVPjjkDdEf4rqSOcbWTYmyeLWy22P3BzsyZ/YXko=;
        b=fCnXMl16w1WBH+d8NaQBmQ1cZhx6Rhxc1kswrfTBf92D1meg3f6c+Zw9YaH9tHu3m+
         gjp6FMgLsjq0DP/RW7EqhQA7TRpYeTuaoBAPeoe/PERzzPTmTYBNUY+9X4+te1WyAWkH
         uO/W+GpwZFWEkTPOdJz0N0W7Cv9hA2r4/hzH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvypVPjjkDdEf4rqSOcbWTYmyeLWy22P3BzsyZ/YXko=;
        b=MYtagXUOspn98ObkdDgtCnq11JmHn0lsZoNoNgpdp0zx2FGwGcYmCV8U+qDYcinx6K
         dWWcBg9ZV7aPG07NSnsuiRdH37vSnIZdHfBkJ3Yd1+3z/BZeW14zPAVNfdawFbywKFLp
         OJQg0yNDy4XEc1AwQT5KUrUrlb43+R64I914ys/nxgwAgohTgDFq/b2nzJ0T+WRjdOyY
         XvTZfqHBo4VLnlp2nnCoCSOEIxxhZQYysFfGo+OrKYgxssbt4fUEMmj0ug153QMrBreB
         8OzgpFsqwZS9Sec9pFm6UNGXHZd5kGo2j8VH6h3stURyaIju40Z+hPbpwvsreL8o3tD4
         O+Kg==
X-Gm-Message-State: AGi0PuZO95tFxc/rEF566KpwY4XABiufnQLhbuUSUO2osblHzxz7ND2V
        hvfai3rqx8ra29lA6snahjPMzZTNjtk=
X-Google-Smtp-Source: APiQypLz+zFEsTR9TFKZzaWYL09y1poIwGHIIiPqWtxWe6T7zFErsnT91N4JW//AOHeQd1ZCmGSSYA==
X-Received: by 2002:a9f:2b0a:: with SMTP id p10mr18706172uaj.10.1588032798035;
        Mon, 27 Apr 2020 17:13:18 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id f14sm3605174uab.17.2020.04.27.17.13.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 17:13:17 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id b6so5763549uak.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2020 17:13:16 -0700 (PDT)
X-Received: by 2002:a67:fc46:: with SMTP id p6mr20467045vsq.169.1588032796396;
 Mon, 27 Apr 2020 17:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200425175312.124892-1-swboyd@chromium.org> <20200425175312.124892-2-swboyd@chromium.org>
In-Reply-To: <20200425175312.124892-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Apr 2020 17:13:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WDmk9+e+ZXaUdhegwLCszCZXCQaiMQa_vkKsE+s6XZ0Q@mail.gmail.com>
Message-ID: <CAD=FV=WDmk9+e+ZXaUdhegwLCszCZXCQaiMQa_vkKsE+s6XZ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() and
 find_free_tcs() APIs
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Apr 25, 2020 at 10:53 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> These APIs do very little. Let's replace all the callsites with the
> normal operations that would be done on top of the tcs_in_use bitmap
> This simplifies and reduces the code size.
>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 109 ++++++++++++------------------------
>  1 file changed, 37 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 571aa1012f23..3f4951840365 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -172,22 +172,6 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>         }
>  }
>
> -/**
> - * tcs_is_free() - Return if a TCS is totally free.
> - * @drv:    The RSC controller.
> - * @tcs_id: The global ID of this TCS.
> - *
> - * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
> - *
> - * Context: Must be called with the drv->lock held.
> - *
> - * Return: true if the given TCS is free.
> - */
> -static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
> -{
> -       return !test_bit(tcs_id, drv->tcs_in_use);
> -}
> -
>  /**
>   * tcs_invalidate() - Invalidate all TCSes of the given type (sleep or wake).
>   * @drv:  The RSC controller.
> @@ -484,7 +468,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  }
>
>  /**
> - * check_for_req_inflight() - Look to see if conflicting cmds are in flight.
> + * check_for_req_inflight_and_find_free() - Find an available tcs for a req
>   * @drv: The controller.
>   * @tcs: A pointer to the tcs_group used for ACTIVE_ONLY transfers.
>   * @msg: The message we want to send, which will contain several addr/data
> @@ -492,33 +476,37 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>   *
>   * This will walk through the TCSes in the group and check if any of them
>   * appear to be sending to addresses referenced in the message. If it finds
> - * one it'll return -EBUSY.
> + * one it'll return -EBUSY because the hardware can't handle more than
> + * one of the same address being changed at the same time.
>   *
> - * Only for use for active-only transfers.
> + * Only for use with active-only transfers.
>   *
>   * Must be called with the drv->lock held since that protects tcs_in_use.
>   *
> - * Return: 0 if nothing in flight or -EBUSY if we should try again later.
> + * Return: offset` of free slot if nothing in flight and a free slot is found

Why the back tick after "offset"?


> + *         or -EBUSY if we should try again later.
>   *         The caller must re-enable interrupts between tries since that's
> - *         the only way tcs_is_free() will ever return true and the only way
> + *         the only way tcs_in_use will ever be updated and the only way
>   *         RSC_DRV_CMD_ENABLE will ever be cleared.
>   */
> -static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
> -                                 const struct tcs_request *msg)
> +static int check_for_req_inflight_and_find_free(struct rsc_drv *drv,
> +       const struct tcs_group *tcs, const struct tcs_request *msg)
>  {
>         unsigned long curr_enabled;
>         u32 addr;
> -       int i, j, k;
> -       int tcs_id = tcs->offset;
> -
> -       for (i = 0; i < tcs->num_tcs; i++, tcs_id++) {
> -               if (tcs_is_free(drv, tcs_id))
> -                       continue;
> +       int j, k;
> +       int i = tcs->offset;
> +       unsigned long max = tcs->offset + tcs->num_tcs;
> +       int first_free = i;

The way "first_free" is calculated definitely adds complexity to this
function.  Are we sure it's justified compared to just calling
find_next_zero_bit() if the function doesn't return -EBUSY?  If you
really like it this way I won't object too strongly, but I'm not
convinced that it makes the code size smaller (vs. jumping to a common
implementation in the kernel) and it seems unlikely to have any
real-world speed impact.


> -               curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
> +       for_each_set_bit_from(i, drv->tcs_in_use, max) {
> +               /* Find a free tcs to use in this group */
> +               if (first_free == i)
> +                       first_free = i + 1; /* Maybe the next one is free? */
>
> +               curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i);
>                 for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
> -                       addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
> +                       addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, i, j);
>                         for (k = 0; k < msg->num_cmds; k++) {
>                                 if (addr == msg->cmds[k].addr)
>                                         return -EBUSY;
> @@ -526,28 +514,11 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>                 }
>         }
>
> -       return 0;
> -}
> +       if (first_free >= max)
> +               return -EBUSY;
>
> -/**
> - * find_free_tcs() - Find free tcs in the given tcs_group; only for active.
> - * @tcs: A pointer to the active-only tcs_group (or the wake tcs_group if
> - *       we borrowed it because there are zero active-only ones).
> - *
> - * Must be called with the drv->lock held since that protects tcs_in_use.
> - *
> - * Return: The first tcs that's free.
> - */
> -static int find_free_tcs(struct tcs_group *tcs)
> -{
> -       int i;
> -
> -       for (i = 0; i < tcs->num_tcs; i++) {
> -               if (tcs_is_free(tcs->drv, tcs->offset + i))
> -                       return tcs->offset + i;
> -       }
> -
> -       return -EBUSY;
> +       set_bit(first_free, drv->tcs_in_use);

Function is not documented to also set the bit.  Do we really gain
anything by setting it in this function, or can it just stay with the
caller?  I'd hate to call this function
check_for_req_inflight_and_find_free_and_claim_it().


> +       return first_free;
>  }
>
>  /**
> @@ -580,17 +551,14 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>          * The h/w does not like if we send a request to the same address,
>          * when one is already in-flight or being processed.
>          */
> -       ret = check_for_req_inflight(drv, tcs, msg);
> -       if (ret)
> -               goto unlock;
> -
> -       ret = find_free_tcs(tcs);
> -       if (ret < 0)
> +       tcs_id = check_for_req_inflight_and_find_free(drv, tcs, msg);
> +       if (tcs_id < 0) {
> +               ret = tcs_id;
>                 goto unlock;
> -       tcs_id = ret;
> +       }
>
> +       ret = 0;

nit: Cleaner to just init to 0 when the function is declared now?


-Doug
