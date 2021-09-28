Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F03541A42E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 02:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238253AbhI1AYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 20:24:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21925 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238321AbhI1AYk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 20:24:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632788582; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=cvG6f6/AwEQrbt3Nv5yZaMyVOIQyNeNi/VJHXNZmoqI=;
 b=AQacct8d9eUl8I0AoFR/1+SgrTj+SIhGa8jokv4q7BL8h1RZ1Idx9Cx2CeZF6ha3PU6fUKIu
 2HL7jSQ1/skT8WYQjFYvrv6TB48OrglCAv+rrGGT9qFTSebFFQcF0n/vvDAzG2fU4gqMCuTj
 4k9xPsQF47UIrQibLHpnNU9KV7M=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6152605d519bd8dcf0e5906d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 00:22:53
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DE9F6C43619; Tue, 28 Sep 2021 00:22:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8339DC4338F;
        Tue, 28 Sep 2021 00:22:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 27 Sep 2021 17:22:51 -0700
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
In-Reply-To: <7512b299-106f-2ffa-6d4f-46dc195abb84@linaro.org>
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
 <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
 <8c1e44cf44f917d38fa7133b869047b0@codeaurora.org>
 <7512b299-106f-2ffa-6d4f-46dc195abb84@linaro.org>
Message-ID: <8060e6fd83d521ed14785ea66386337b@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-25 12:43, Dmitry Baryshkov wrote:
> On 21/09/2021 23:52, abhinavk@codeaurora.org wrote:
>> On 2021-09-21 10:47, Dmitry Baryshkov wrote:
>>> Hi,
>>> 
>>> On Tue, 21 Sept 2021 at 20:01, <abhinavk@codeaurora.org> wrote:
>>>> 
>>>> On 2021-09-21 09:22, Dmitry Baryshkov wrote:
>>>> > The DSI host might be left in some state by the bootloader. If this
>>>> > state generates an IRQ, it might hang the system by holding the
>>>> > interrupt line before the driver sets up the DSI host to the known
>>>> > state.
>>>> >
>>>> > Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
>>>> > so that we can be sure that the interrupt is delivered when the host is
>>>> > in the known state.
>>>> >
>>>> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
>>>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> 
>>>> This is a valid change and we have seen interrupt storms in 
>>>> downstream
>>>> happening
>>>> when like you said the bootloader leaves the DSI host in unknown 
>>>> state.
>>>> Just one question below.
>>>> 
>>>> > ---
>>>> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>>>> >  1 file changed, 12 insertions(+), 9 deletions(-)
>>>> >
>>>> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> > index e269df285136..cd842347a6b1 100644
>>>> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> > @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct
>>>> > mipi_dsi_host *host,
>>>> >               return ret;
>>>> >       }
>>>> >
>>>> > -     ret = devm_request_irq(&pdev->dev, msm_host->irq,
>>>> > -                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>>>> > -                     "dsi_isr", msm_host);
>>>> > -     if (ret < 0) {
>>>> > -             DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
>>>> > -                             msm_host->irq, ret);
>>>> > -             return ret;
>>>> > -     }
>>>> > -
>>>> >       msm_host->dev = dev;
>>>> >       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>>> >       if (ret) {
>>>> > @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host
>>>> > *host,
>>>> >       if (msm_host->disp_en_gpio)
>>>> >               gpiod_set_value(msm_host->disp_en_gpio, 1);
>>>> >
>>>> > +     ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
>>>> > +                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>>>> > +                     "dsi_isr", msm_host);
>>>> > +     if (ret < 0) {
>>>> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
>>>> > +                             msm_host->irq, ret);
>>>> > +             return ret;
>>>> > +     }
>>>> > +
>>>> > +
>>>> 
>>>> Do you want to move this to msm_dsi_host_enable()?
>>>> So without the controller being enabled it is still in unknown 
>>>> state?
>>> 
>>> msm_dsi_host_power_on() reconfigures the host registers, so the state
>>> is known at the end of the power_on().
>>> 
>>>> Also do you want to do this after dsi0 and dsi1 are initialized to
>>>> account for
>>>> dual dsi cases?
>>> 
>>> I don't think this should matter. The host won't generate 'extra'
>>> interrupts in such case, will it?
>>> 
>> We have seen cases where misconfiguration has caused interrupts to 
>> storm only
>> on one DSI in some cases. So yes, I would prefer this is done after 
>> both are
>> configured.
> 
> I've checked. The power_on is called from dsi_mgr_bridge_pre_enable()
> when both DSI hosts should be bound.

DSI being bound is enough? I thought the issue we are trying to address 
is that
we need to have called msm_dsi_host_power_on() for both the hosts so 
that both are
put in the known state before requesting the irq.

OR in other words move the irq_enable() to below location.

341 static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
342 {
********************************
364 	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], 
is_bonded_dsi, msm_dsi->phy);
365 	if (ret) {
366 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
367 		goto host_on_fail;
368 	}
369
370 	if (is_bonded_dsi && msm_dsi1) {
371 		ret = msm_dsi_host_power_on(msm_dsi1->host,
372 				&phy_shared_timings[DSI_1], is_bonded_dsi, msm_dsi1->phy);
373 		if (ret) {
374 			pr_err("%s: power on host1 failed, %d\n",
375 							__func__, ret);
376 			goto host1_on_fail;
377 		}
378 	}

< move the irq enable here >
**********************************

> 
>> 
>>>> 
>>>> >       msm_host->power_on = true;
>>>> >       mutex_unlock(&msm_host->dev_mutex);
>>>> >
>>>> > @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host
>>>> > *host)
>>>> >               goto unlock_ret;
>>>> >       }
>>>> >
>>>> > +     devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
>>>> > +
>>>> >       dsi_ctrl_config(msm_host, false, NULL, NULL);
>>>> >
>>>> >       if (msm_host->disp_en_gpio)
