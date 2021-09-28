Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B736841A488
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 03:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238384AbhI1BVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 21:21:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44199 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234467AbhI1BVf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 21:21:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632791997; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7jI378hsNZpD6Y3mNfLpwTZ4XH4mVub+xTE9WL2zDZM=;
 b=MNKgGjhyj3xtTcdO9Jofz95OFtoF8aZZG2HJrYosy3/LB9oNFeIWontonEXyqhZaxHnsfNg7
 ZNjKVoBtQQ9C9wsG3wCX5dMb066WqLb1i0U9+JFvPe3rYncI/FAmH01IPgwlEWEorFdl80qo
 odHbi/HrF9Lx8jXXHusZDy9XasM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61526da1713d5d6f96fb65cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 01:19:29
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8093AC43460; Tue, 28 Sep 2021 01:19:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4ED70C4338F;
        Tue, 28 Sep 2021 01:19:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Sep 2021 18:19:26 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: do not install irq handler
 before power up the host
In-Reply-To: <CAA8EJpqvNJudg8-PActLEYf-BgmnJD3N7a4pMqb8VNf4hFiHdw@mail.gmail.com>
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
 <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
 <8c1e44cf44f917d38fa7133b869047b0@codeaurora.org>
 <7512b299-106f-2ffa-6d4f-46dc195abb84@linaro.org>
 <8060e6fd83d521ed14785ea66386337b@codeaurora.org>
 <CAA8EJpqvNJudg8-PActLEYf-BgmnJD3N7a4pMqb8VNf4hFiHdw@mail.gmail.com>
Message-ID: <1ebb9efd461e9a84027ea63f7141a208@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-27 18:06, Dmitry Baryshkov wrote:
> On Tue, 28 Sept 2021 at 03:22, <abhinavk@codeaurora.org> wrote:
>> 
>> On 2021-09-25 12:43, Dmitry Baryshkov wrote:
>> > On 21/09/2021 23:52, abhinavk@codeaurora.org wrote:
>> >> On 2021-09-21 10:47, Dmitry Baryshkov wrote:
>> >>> Hi,
>> >>>
>> >>> On Tue, 21 Sept 2021 at 20:01, <abhinavk@codeaurora.org> wrote:
>> >>>>
>> >>>> On 2021-09-21 09:22, Dmitry Baryshkov wrote:
>> >>>> > The DSI host might be left in some state by the bootloader. If this
>> >>>> > state generates an IRQ, it might hang the system by holding the
>> >>>> > interrupt line before the driver sets up the DSI host to the known
>> >>>> > state.
>> >>>> >
>> >>>> > Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
>> >>>> > so that we can be sure that the interrupt is delivered when the host is
>> >>>> > in the known state.
>> >>>> >
>> >>>> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
>> >>>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> >>>>
>> >>>> This is a valid change and we have seen interrupt storms in
>> >>>> downstream
>> >>>> happening
>> >>>> when like you said the bootloader leaves the DSI host in unknown
>> >>>> state.
>> >>>> Just one question below.
>> >>>>
>> >>>> > ---
>> >>>> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>> >>>> >  1 file changed, 12 insertions(+), 9 deletions(-)
>> >>>> >
>> >>>> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> >>>> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> >>>> > index e269df285136..cd842347a6b1 100644
>> >>>> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> >>>> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> >>>> > @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct
>> >>>> > mipi_dsi_host *host,
>> >>>> >               return ret;
>> >>>> >       }
>> >>>> >
>> >>>> > -     ret = devm_request_irq(&pdev->dev, msm_host->irq,
>> >>>> > -                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> >>>> > -                     "dsi_isr", msm_host);
>> >>>> > -     if (ret < 0) {
>> >>>> > -             DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
>> >>>> > -                             msm_host->irq, ret);
>> >>>> > -             return ret;
>> >>>> > -     }
>> >>>> > -
>> >>>> >       msm_host->dev = dev;
>> >>>> >       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>> >>>> >       if (ret) {
>> >>>> > @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host
>> >>>> > *host,
>> >>>> >       if (msm_host->disp_en_gpio)
>> >>>> >               gpiod_set_value(msm_host->disp_en_gpio, 1);
>> >>>> >
>> >>>> > +     ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
>> >>>> > +                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> >>>> > +                     "dsi_isr", msm_host);
>> >>>> > +     if (ret < 0) {
>> >>>> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
>> >>>> > +                             msm_host->irq, ret);
>> >>>> > +             return ret;
>> >>>> > +     }
>> >>>> > +
>> >>>> > +
>> >>>>
>> >>>> Do you want to move this to msm_dsi_host_enable()?
>> >>>> So without the controller being enabled it is still in unknown
>> >>>> state?
>> >>>
>> >>> msm_dsi_host_power_on() reconfigures the host registers, so the state
>> >>> is known at the end of the power_on().
>> >>>
>> >>>> Also do you want to do this after dsi0 and dsi1 are initialized to
>> >>>> account for
>> >>>> dual dsi cases?
>> >>>
>> >>> I don't think this should matter. The host won't generate 'extra'
>> >>> interrupts in such case, will it?
>> >>>
>> >> We have seen cases where misconfiguration has caused interrupts to
>> >> storm only
>> >> on one DSI in some cases. So yes, I would prefer this is done after
>> >> both are
>> >> configured.
>> >
>> > I've checked. The power_on is called from dsi_mgr_bridge_pre_enable()
>> > when both DSI hosts should be bound.
>> 
>> DSI being bound is enough? I thought the issue we are trying to 
>> address
>> is that
>> we need to have called msm_dsi_host_power_on() for both the hosts so
>> that both are
>> put in the known state before requesting the irq.
>> 
>> OR in other words move the irq_enable() to below location.
>> 
>> 341 static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>> 342 {
>> ********************************
>> 364     ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
>> is_bonded_dsi, msm_dsi->phy);
>> 365     if (ret) {
>> 366             pr_err("%s: power on host %d failed, %d\n", __func__, 
>> id, ret);
>> 367             goto host_on_fail;
>> 368     }
>> 369
>> 370     if (is_bonded_dsi && msm_dsi1) {
>> 371             ret = msm_dsi_host_power_on(msm_dsi1->host,
>> 372                             &phy_shared_timings[DSI_1], 
>> is_bonded_dsi, msm_dsi1->phy);
>> 373             if (ret) {
>> 374                     pr_err("%s: power on host1 failed, %d\n",
>> 375                                                     __func__, 
>> ret);
>> 376                     goto host1_on_fail;
>> 377             }
>> 378     }
>> 
>> < move the irq enable here >
>> **********************************
> 
> Ah, I see your point. What about moving to msm_dsi_host_enable() then?

Yes, I had suggested this a few replies ago. But only at the dsi_msgr we 
know if DSI1 is also done.
So you can do it right after it in below location?

427 	if (is_dual_dsi && msm_dsi1) {
428 		ret = msm_dsi_host_enable(msm_dsi1->host);
429 		if (ret) {
430 			pr_err("%s: enable host1 failed, %d\n", __func__, ret);
431 			goto host1_en_fail;
432 		}
433 	}

<enable_irq here? >

> 
>> >>>> >       msm_host->power_on = true;
>> >>>> >       mutex_unlock(&msm_host->dev_mutex);
>> >>>> >
>> >>>> > @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host
>> >>>> > *host)
>> >>>> >               goto unlock_ret;
>> >>>> >       }
>> >>>> >
>> >>>> > +     devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
>> >>>> > +
>> >>>> >       dsi_ctrl_config(msm_host, false, NULL, NULL);
>> >>>> >
>> >>>> >       if (msm_host->disp_en_gpio)
