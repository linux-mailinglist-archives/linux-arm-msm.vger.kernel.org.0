Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BE241A479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 03:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238395AbhI1BIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 21:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhI1BIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 21:08:18 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1108AC061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 18:06:40 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id q125so24402701qkd.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 18:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mERY1nGuxQ0QFsXPxpQrWeW9FJy4Jbni4FQPie6L/Ak=;
        b=ZS6GITD1DV/9jH7ykxZDXEiEqJy3yHDZiE22sWzK3RpQn2Q9005y2738tpQBOCeAFv
         unmwXoGyzquhJ0LKrVdV7E1LAu6fqVcOUjCcxDLaJ54cnlU8aTthRrIr3rgJWNHu6ozk
         lZP2tDRlV0K4paDqox/NavN4OObNqR/DfLaxzwBKNlOzxnx4uAM3wDeZROGRC7SlXqT5
         dO/T50rffba97gCQ7T/V4Cg0Dp5Kh8M6hqxOoNdt6bkjgQ4S/tWgn7jbZVOz2Om6EPx6
         J5ZtKRpPnG0JzJl6TCYtoeAjuvm71EYEWPGFylHGSKUlZlGwgTVoeZi1o3IYp0lRWhsS
         DVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mERY1nGuxQ0QFsXPxpQrWeW9FJy4Jbni4FQPie6L/Ak=;
        b=L10ltVYu+GBwS3DdgPTPMVNu+PaQI9+fc1ro7T8j7LGyPtTZpHW8zJq/ejiUWWiPHQ
         5hsw/vqoiyaMrhgB3zNRuRERrnnjRZPODShBUb3HHrdqL4VyIG581XyzXq4oFIZESLYt
         R4Rch33xZ18VzoawTOu7iWBwLRBgKoDuwUTmLlgJsRLcYwvN+stvM7Tp6yXQY3yU2mKA
         KFh838Mcazy8q9hN1168z4dBiLxc4AvpaTtFyCaxojI1FB8ZLuUL2OLtSHenLKco7M2Q
         3d7SqVwqyrkSN6ZwQUFbHV38cbWb4GCMTrgbglJ06eAZ1Nh6Jo42pDcdusQ1aKl1klX3
         pwiw==
X-Gm-Message-State: AOAM530A21aS1ae8RmWKDS7/9X2Q213RqjkhS3kcFVKFlC2kBBl2xEnS
        zejJnAyDIv59HdjbQRFQ5y73DLLRkCd47e/dWvPaICmXQEU+GA==
X-Google-Smtp-Source: ABdhPJx88Drvqsf7DG/Br0/p8AqE/XYpjfbYn9jUoGqGM//Bc5IpCKRsnGY0eLJ9AacfePn/3cR1HFvaiPb32OfVMss=
X-Received: by 2002:ae9:d842:: with SMTP id u63mr3115630qkf.44.1632791199135;
 Mon, 27 Sep 2021 18:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org> <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
 <8c1e44cf44f917d38fa7133b869047b0@codeaurora.org> <7512b299-106f-2ffa-6d4f-46dc195abb84@linaro.org>
 <8060e6fd83d521ed14785ea66386337b@codeaurora.org>
In-Reply-To: <8060e6fd83d521ed14785ea66386337b@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 28 Sep 2021 04:06:27 +0300
Message-ID: <CAA8EJpqvNJudg8-PActLEYf-BgmnJD3N7a4pMqb8VNf4hFiHdw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: do not install irq handler
 before power up the host
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Sept 2021 at 03:22, <abhinavk@codeaurora.org> wrote:
>
> On 2021-09-25 12:43, Dmitry Baryshkov wrote:
> > On 21/09/2021 23:52, abhinavk@codeaurora.org wrote:
> >> On 2021-09-21 10:47, Dmitry Baryshkov wrote:
> >>> Hi,
> >>>
> >>> On Tue, 21 Sept 2021 at 20:01, <abhinavk@codeaurora.org> wrote:
> >>>>
> >>>> On 2021-09-21 09:22, Dmitry Baryshkov wrote:
> >>>> > The DSI host might be left in some state by the bootloader. If this
> >>>> > state generates an IRQ, it might hang the system by holding the
> >>>> > interrupt line before the driver sets up the DSI host to the known
> >>>> > state.
> >>>> >
> >>>> > Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
> >>>> > so that we can be sure that the interrupt is delivered when the host is
> >>>> > in the known state.
> >>>> >
> >>>> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> >>>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>
> >>>> This is a valid change and we have seen interrupt storms in
> >>>> downstream
> >>>> happening
> >>>> when like you said the bootloader leaves the DSI host in unknown
> >>>> state.
> >>>> Just one question below.
> >>>>
> >>>> > ---
> >>>> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
> >>>> >  1 file changed, 12 insertions(+), 9 deletions(-)
> >>>> >
> >>>> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> > index e269df285136..cd842347a6b1 100644
> >>>> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >>>> > @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct
> >>>> > mipi_dsi_host *host,
> >>>> >               return ret;
> >>>> >       }
> >>>> >
> >>>> > -     ret = devm_request_irq(&pdev->dev, msm_host->irq,
> >>>> > -                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> >>>> > -                     "dsi_isr", msm_host);
> >>>> > -     if (ret < 0) {
> >>>> > -             DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
> >>>> > -                             msm_host->irq, ret);
> >>>> > -             return ret;
> >>>> > -     }
> >>>> > -
> >>>> >       msm_host->dev = dev;
> >>>> >       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
> >>>> >       if (ret) {
> >>>> > @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host
> >>>> > *host,
> >>>> >       if (msm_host->disp_en_gpio)
> >>>> >               gpiod_set_value(msm_host->disp_en_gpio, 1);
> >>>> >
> >>>> > +     ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
> >>>> > +                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> >>>> > +                     "dsi_isr", msm_host);
> >>>> > +     if (ret < 0) {
> >>>> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
> >>>> > +                             msm_host->irq, ret);
> >>>> > +             return ret;
> >>>> > +     }
> >>>> > +
> >>>> > +
> >>>>
> >>>> Do you want to move this to msm_dsi_host_enable()?
> >>>> So without the controller being enabled it is still in unknown
> >>>> state?
> >>>
> >>> msm_dsi_host_power_on() reconfigures the host registers, so the state
> >>> is known at the end of the power_on().
> >>>
> >>>> Also do you want to do this after dsi0 and dsi1 are initialized to
> >>>> account for
> >>>> dual dsi cases?
> >>>
> >>> I don't think this should matter. The host won't generate 'extra'
> >>> interrupts in such case, will it?
> >>>
> >> We have seen cases where misconfiguration has caused interrupts to
> >> storm only
> >> on one DSI in some cases. So yes, I would prefer this is done after
> >> both are
> >> configured.
> >
> > I've checked. The power_on is called from dsi_mgr_bridge_pre_enable()
> > when both DSI hosts should be bound.
>
> DSI being bound is enough? I thought the issue we are trying to address
> is that
> we need to have called msm_dsi_host_power_on() for both the hosts so
> that both are
> put in the known state before requesting the irq.
>
> OR in other words move the irq_enable() to below location.
>
> 341 static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
> 342 {
> ********************************
> 364     ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
> is_bonded_dsi, msm_dsi->phy);
> 365     if (ret) {
> 366             pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
> 367             goto host_on_fail;
> 368     }
> 369
> 370     if (is_bonded_dsi && msm_dsi1) {
> 371             ret = msm_dsi_host_power_on(msm_dsi1->host,
> 372                             &phy_shared_timings[DSI_1], is_bonded_dsi, msm_dsi1->phy);
> 373             if (ret) {
> 374                     pr_err("%s: power on host1 failed, %d\n",
> 375                                                     __func__, ret);
> 376                     goto host1_on_fail;
> 377             }
> 378     }
>
> < move the irq enable here >
> **********************************

Ah, I see your point. What about moving to msm_dsi_host_enable() then?

> >>>> >       msm_host->power_on = true;
> >>>> >       mutex_unlock(&msm_host->dev_mutex);
> >>>> >
> >>>> > @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host
> >>>> > *host)
> >>>> >               goto unlock_ret;
> >>>> >       }
> >>>> >
> >>>> > +     devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
> >>>> > +
> >>>> >       dsi_ctrl_config(msm_host, false, NULL, NULL);
> >>>> >
> >>>> >       if (msm_host->disp_en_gpio)


-- 
With best wishes
Dmitry
