Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE65637122F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 09:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhECH7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 03:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECH7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 03:59:03 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2962C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 00:58:10 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id b21so2392357plz.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 00:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h/pLGb0tqO1qSY3pRwFuWV0h2NnBYnqoQ/p3iVQEvO4=;
        b=IvnO5voXCEyuoitoWHXTVHiN6sztPocTFKSLlSNCwDL/6vZzPhfyyBn7/n2u10AbGh
         DFPhEiIUiLv6ptpvwQA6LxQScM8W/tuQffjMv7IStwnl1pvBx0UxhAievT9QK8bXiT49
         epr3kLcmQ/9B/I4EN4G2QiTKibYN/fj+1pk0SSynKAMl18F2Dk9FBv/6f5IUD9N28gpg
         1n6HY+0MzB73zc16dndUp90KBS21PlxcurTEDG2jn4+S33B92aWPcd8bL524vOWbECQ7
         GQxZj193Zq9TafODANXtClfDtryitEmFx0n0LTYFsPwmDyun5QZvH3q6bvlhGeybadaj
         +sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h/pLGb0tqO1qSY3pRwFuWV0h2NnBYnqoQ/p3iVQEvO4=;
        b=qxahInSXvILjXmh5RNjceBipG64HWiZvgupN7jbkobil0hNgTul4PGYUdR/BheBsgT
         alcjVhRAdc1nKFWQj5L9nf8b78zEVuP2AP/+mHW6sEbURHINtfawaou9Rt0E/ndkGJyI
         oxqQY88YV+ZNrgjzQziqbPAzMLXixhGeGKicA3D4O5gsN1YBqdArk8+HyYZAUhRK1Y7o
         SDtvHLN+tAE/DrN8OMjLsE1V1K5NGJelAuHhDyQ09+/Cr/e7QRugSkW17hI/F9vJZ4UM
         yBNxwfbJ29A1IU3xknuyLGPbz+2BxlkLSkA8ZYD7SWU/+635tjtd907TEYsIvFq9bNID
         pU8A==
X-Gm-Message-State: AOAM530Vvrc4Y73jATaYRLDAj/vO7iaFgFm2zKXa7QhBLgBWjJroejxY
        JC1V4m+CGhN0kPyzbRHRgzPBLvNzysoVRjxAtVi6TbdMNuaCdQ==
X-Google-Smtp-Source: ABdhPJzkxBrm3VjwhPeaKGGStiJihV5bnxo5q3SIXOVp1FRnVfTGsbDimlYMiiWq3aPIZwhY4wnHpnt8VObk3hUuPjI=
X-Received: by 2002:a17:902:db84:b029:ee:888c:cc2 with SMTP id
 m4-20020a170902db84b02900ee888c0cc2mr19177642pld.49.1620028690384; Mon, 03
 May 2021 00:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 3 May 2021 10:06:46 +0200
Message-ID: <CAMZdPi_bEu=n7_DRkW=bGBHqvUhebHLdVaG5RT5cu71Cx6SUpw@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: core: Fix power down latency
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manivannan and Hemant,

On Mon, 3 May 2021 at 09:55, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> On graceful power-down/disable transition, when an MHI reset is
> performed, the MHI device loses its context, including interrupt
> configuration. However, the current implementation is waiting for
> event(irq) driven state change to confirm reset has been completed,
> which never happens, and causes reset timeout, leading to unexpected
> high latency of the mhi_power_down procedure (up to 45 seconds).
>
> Fix that by moving to the recently introduced poll_reg_field method,
> waiting for the reset bit to be cleared, in the same way as the
> power_on procedure.
>
> Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Should be considered for 5.13-rc* since it's a fix.

Regards,
Loic

> ---
>  drivers/bus/mhi/core/pm.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index e2e59a3..704a5e2 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -465,23 +465,15 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>
>         /* Trigger MHI RESET so that the device will not access host memory */
>         if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
> -               u32 in_reset = -1;
> -               unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
> -
>                 dev_dbg(dev, "Triggering MHI Reset in device\n");
>                 mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>
>                 /* Wait for the reset bit to be cleared by the device */
> -               ret = wait_event_timeout(mhi_cntrl->state_event,
> -                                        mhi_read_reg_field(mhi_cntrl,
> -                                                           mhi_cntrl->regs,
> -                                                           MHICTRL,
> -                                                           MHICTRL_RESET_MASK,
> -                                                           MHICTRL_RESET_SHIFT,
> -                                                           &in_reset) ||
> -                                       !in_reset, timeout);
> -               if (!ret || in_reset)
> -                       dev_err(dev, "Device failed to exit MHI Reset state\n");
> +               ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
> +                                MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
> +                                25000);
> +               if (ret)
> +                       dev_err(dev, "Device failed to clear MHI Reset\n");
>
>                 /*
>                  * Device will clear BHI_INTVEC as a part of RESET processing,
> --
> 2.7.4
>
