Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082F8413BC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 22:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235149AbhIUUxw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 16:53:52 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46412 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234658AbhIUUxt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 16:53:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632257540; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4hzrYlo6qNpsGGd2SNul6VPV1cWIjJEHbydaYkAosQU=;
 b=iES+Pp7zpFZT3FI4zyxSYP6et5ofL3dqV1wTpMXyN5aanmDu3jaKKJxp3HHUXCoaJRmIkfsq
 urfbgheH1QMSuyqP3fFDUIuLIC9JWOeZcFlCD+siykMTj8yxCLcI8dc6mHMLi7H55C6zhTj2
 lgLX0l0gTURifrGlwS+edCjEm5c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 614a4604bd6681d8ed4866e6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 20:52:20
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8AE21C43616; Tue, 21 Sep 2021 20:52:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93695C4338F;
        Tue, 21 Sep 2021 20:52:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Sep 2021 13:52:17 -0700
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
In-Reply-To: <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
 <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
Message-ID: <8c1e44cf44f917d38fa7133b869047b0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 10:47, Dmitry Baryshkov wrote:
> Hi,
> 
> On Tue, 21 Sept 2021 at 20:01, <abhinavk@codeaurora.org> wrote:
>> 
>> On 2021-09-21 09:22, Dmitry Baryshkov wrote:
>> > The DSI host might be left in some state by the bootloader. If this
>> > state generates an IRQ, it might hang the system by holding the
>> > interrupt line before the driver sets up the DSI host to the known
>> > state.
>> >
>> > Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
>> > so that we can be sure that the interrupt is delivered when the host is
>> > in the known state.
>> >
>> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> 
>> This is a valid change and we have seen interrupt storms in downstream
>> happening
>> when like you said the bootloader leaves the DSI host in unknown 
>> state.
>> Just one question below.
>> 
>> > ---
>> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>> >  1 file changed, 12 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> > index e269df285136..cd842347a6b1 100644
>> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> > @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct
>> > mipi_dsi_host *host,
>> >               return ret;
>> >       }
>> >
>> > -     ret = devm_request_irq(&pdev->dev, msm_host->irq,
>> > -                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> > -                     "dsi_isr", msm_host);
>> > -     if (ret < 0) {
>> > -             DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
>> > -                             msm_host->irq, ret);
>> > -             return ret;
>> > -     }
>> > -
>> >       msm_host->dev = dev;
>> >       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>> >       if (ret) {
>> > @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host
>> > *host,
>> >       if (msm_host->disp_en_gpio)
>> >               gpiod_set_value(msm_host->disp_en_gpio, 1);
>> >
>> > +     ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
>> > +                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> > +                     "dsi_isr", msm_host);
>> > +     if (ret < 0) {
>> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
>> > +                             msm_host->irq, ret);
>> > +             return ret;
>> > +     }
>> > +
>> > +
>> 
>> Do you want to move this to msm_dsi_host_enable()?
>> So without the controller being enabled it is still in unknown state?
> 
> msm_dsi_host_power_on() reconfigures the host registers, so the state
> is known at the end of the power_on().
> 
>> Also do you want to do this after dsi0 and dsi1 are initialized to
>> account for
>> dual dsi cases?
> 
> I don't think this should matter. The host won't generate 'extra'
> interrupts in such case, will it?
> 
We have seen cases where misconfiguration has caused interrupts to storm 
only
on one DSI in some cases. So yes, I would prefer this is done after both 
are
configured.

>> 
>> >       msm_host->power_on = true;
>> >       mutex_unlock(&msm_host->dev_mutex);
>> >
>> > @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host
>> > *host)
>> >               goto unlock_ret;
>> >       }
>> >
>> > +     devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
>> > +
>> >       dsi_ctrl_config(msm_host, false, NULL, NULL);
>> >
>> >       if (msm_host->disp_en_gpio)
