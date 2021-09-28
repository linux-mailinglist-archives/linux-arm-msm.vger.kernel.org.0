Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1090E41A49A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 03:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238418AbhI1Bbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 21:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238415AbhI1Bbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 21:31:41 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71598C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 18:30:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y28so85147636lfb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 18:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KrU4mcR2whmxiXRhQHRPAuyUUPETbczQn4SCU8YII5M=;
        b=ophF6Rc3qLSan0TIuChN0sTXxr+ZlSKzyadwEr7dXoMWqF7yZxloP6QFCfAU6NpAsv
         GVrknMKb4B+JcNiGhPqPWntqDKbCI09oIexDveem3po6HBhHrMTCEbQJP8c0Ozxd+Fg0
         q4r7gi5QaI+Zd44UPbo///EwFzEeWNLP3spcmZUKtvSKi52mT2WpIFfxIvlIZlru14hg
         kBr9puxxld2359Qvu7+AGbyYL0eJk+1Hzrn9AJX4yOybdMW+7AO2xz7S6GPldCmnAfuA
         xJSfTnaMSOgqQRvfsPPI9hBXb01Ik7fbHt1GjiZbIVef33PeV1rPsdpVQZlMt4H7EM/8
         tzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KrU4mcR2whmxiXRhQHRPAuyUUPETbczQn4SCU8YII5M=;
        b=ZJPgROfF2odDjeYrgbFAGm0K9hY1kn4cqlP1jeknLyskoGzvvv9FXgct6vghfZeHwE
         Qi6WFHfgglq8NNUH+fBEz3g823bPYTkel6a9B+gMz1sKMCeXKW8YUjlh1HQuKw3j6qxe
         qxH1LOxx1GlgGWyWT+zk5lssMHfHQ317BbEQAj9xjifi/wsU+u1O2g8P4u4jEfO8XA9Y
         ckoGjX8TDWa1vsZq8FAIMnMIAy3bGSzozmBKulRJQJ91VDGbY+Tkaif2DyBRAIH9Q2Nv
         eL8w6slbna9NO6PRgTJcOXkh1CTTyYwMBO0JW60i94qhr+iiCf7towsXB44poe/pp8S7
         aD6w==
X-Gm-Message-State: AOAM530UKWWE3zVNSbFazosuWPCU8EV3tT3R8DLc1ueH36Q2kxDQrKvp
        tZc0TxfJcEkVcx2ZxRe2I5h1mA==
X-Google-Smtp-Source: ABdhPJzAn74BNArYTHSa0eSqtbNELw9W2HS6kA5Tc5R11KZ7+Y+GaNgLPrixucCYW0oDO1n55vwZdw==
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr3256702lji.67.1632792600405;
        Mon, 27 Sep 2021 18:30:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1753912lfj.145.2021.09.27.18.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 18:30:00 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: do not install irq handler
 before power up the host
To:     abhinavk@codeaurora.org
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
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
 <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
 <8c1e44cf44f917d38fa7133b869047b0@codeaurora.org>
 <7512b299-106f-2ffa-6d4f-46dc195abb84@linaro.org>
 <8060e6fd83d521ed14785ea66386337b@codeaurora.org>
 <CAA8EJpqvNJudg8-PActLEYf-BgmnJD3N7a4pMqb8VNf4hFiHdw@mail.gmail.com>
 <1ebb9efd461e9a84027ea63f7141a208@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <45473d71-5986-7299-336a-ed498160fce4@linaro.org>
Date:   Tue, 28 Sep 2021 04:29:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1ebb9efd461e9a84027ea63f7141a208@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2021 04:19, abhinavk@codeaurora.org wrote:
> On 2021-09-27 18:06, Dmitry Baryshkov wrote:
>> On Tue, 28 Sept 2021 at 03:22, <abhinavk@codeaurora.org> wrote:
>>>
>>> On 2021-09-25 12:43, Dmitry Baryshkov wrote:
>>> > On 21/09/2021 23:52, abhinavk@codeaurora.org wrote:
>>> >> On 2021-09-21 10:47, Dmitry Baryshkov wrote:
>>> >>> Hi,
>>> >>>
>>> >>> On Tue, 21 Sept 2021 at 20:01, <abhinavk@codeaurora.org> wrote:
>>> >>>>
>>> >>>> On 2021-09-21 09:22, Dmitry Baryshkov wrote:
>>> >>>> > The DSI host might be left in some state by the bootloader. If 
>>> this
>>> >>>> > state generates an IRQ, it might hang the system by holding the
>>> >>>> > interrupt line before the driver sets up the DSI host to the 
>>> known
>>> >>>> > state.
>>> >>>> >
>>> >>>> > Move the request/free_irq calls into 
>>> msm_dsi_host_power_on/_off calls,
>>> >>>> > so that we can be sure that the interrupt is delivered when 
>>> the host is
>>> >>>> > in the known state.
>>> >>>> >
>>> >>>> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector 
>>> support")
>>> >>>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> >>>>
>>> >>>> This is a valid change and we have seen interrupt storms in
>>> >>>> downstream
>>> >>>> happening
>>> >>>> when like you said the bootloader leaves the DSI host in unknown
>>> >>>> state.
>>> >>>> Just one question below.
>>> >>>>
>>> >>>> > ---
>>> >>>> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>>> >>>> >  1 file changed, 12 insertions(+), 9 deletions(-)
>>> >>>> >
>>> >>>> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> >>>> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> >>>> > index e269df285136..cd842347a6b1 100644
>>> >>>> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> >>>> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> >>>> > @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct
>>> >>>> > mipi_dsi_host *host,
>>> >>>> >               return ret;
>>> >>>> >       }
>>> >>>> >
>>> >>>> > -     ret = devm_request_irq(&pdev->dev, msm_host->irq,
>>> >>>> > -                     dsi_host_irq, IRQF_TRIGGER_HIGH | 
>>> IRQF_ONESHOT,
>>> >>>> > -                     "dsi_isr", msm_host);
>>> >>>> > -     if (ret < 0) {
>>> >>>> > -             DRM_DEV_ERROR(&pdev->dev, "failed to request 
>>> IRQ%u: %d\n",
>>> >>>> > -                             msm_host->irq, ret);
>>> >>>> > -             return ret;
>>> >>>> > -     }
>>> >>>> > -
>>> >>>> >       msm_host->dev = dev;
>>> >>>> >       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>> >>>> >       if (ret) {
>>> >>>> > @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct 
>>> mipi_dsi_host
>>> >>>> > *host,
>>> >>>> >       if (msm_host->disp_en_gpio)
>>> >>>> >               gpiod_set_value(msm_host->disp_en_gpio, 1);
>>> >>>> >
>>> >>>> > +     ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
>>> >>>> > +                     dsi_host_irq, IRQF_TRIGGER_HIGH | 
>>> IRQF_ONESHOT,
>>> >>>> > +                     "dsi_isr", msm_host);
>>> >>>> > +     if (ret < 0) {
>>> >>>> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to 
>>> request IRQ%u: %d\n",
>>> >>>> > +                             msm_host->irq, ret);
>>> >>>> > +             return ret;
>>> >>>> > +     }
>>> >>>> > +
>>> >>>> > +
>>> >>>>
>>> >>>> Do you want to move this to msm_dsi_host_enable()?
>>> >>>> So without the controller being enabled it is still in unknown
>>> >>>> state?
>>> >>>
>>> >>> msm_dsi_host_power_on() reconfigures the host registers, so the 
>>> state
>>> >>> is known at the end of the power_on().
>>> >>>
>>> >>>> Also do you want to do this after dsi0 and dsi1 are initialized to
>>> >>>> account for
>>> >>>> dual dsi cases?
>>> >>>
>>> >>> I don't think this should matter. The host won't generate 'extra'
>>> >>> interrupts in such case, will it?
>>> >>>
>>> >> We have seen cases where misconfiguration has caused interrupts to
>>> >> storm only
>>> >> on one DSI in some cases. So yes, I would prefer this is done after
>>> >> both are
>>> >> configured.
>>> >
>>> > I've checked. The power_on is called from dsi_mgr_bridge_pre_enable()
>>> > when both DSI hosts should be bound.
>>>
>>> DSI being bound is enough? I thought the issue we are trying to address
>>> is that
>>> we need to have called msm_dsi_host_power_on() for both the hosts so
>>> that both are
>>> put in the known state before requesting the irq.
>>>
>>> OR in other words move the irq_enable() to below location.
>>>
>>> 341 static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>> 342 {
>>> ********************************
>>> 364     ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
>>> is_bonded_dsi, msm_dsi->phy);
>>> 365     if (ret) {
>>> 366             pr_err("%s: power on host %d failed, %d\n", __func__, 
>>> id, ret);
>>> 367             goto host_on_fail;
>>> 368     }
>>> 369
>>> 370     if (is_bonded_dsi && msm_dsi1) {
>>> 371             ret = msm_dsi_host_power_on(msm_dsi1->host,
>>> 372                             &phy_shared_timings[DSI_1], 
>>> is_bonded_dsi, msm_dsi1->phy);
>>> 373             if (ret) {
>>> 374                     pr_err("%s: power on host1 failed, %d\n",
>>> 375                                                     __func__, ret);
>>> 376                     goto host1_on_fail;
>>> 377             }
>>> 378     }
>>>
>>> < move the irq enable here >
>>> **********************************
>>
>> Ah, I see your point. What about moving to msm_dsi_host_enable() then?
> 
> Yes, I had suggested this a few replies ago. But only at the dsi_msgr we 
> know if DSI1 is also done.
> So you can do it right after it in below location?
> 
> 427     if (is_dual_dsi && msm_dsi1) {
> 428         ret = msm_dsi_host_enable(msm_dsi1->host);
> 429         if (ret) {
> 430             pr_err("%s: enable host1 failed, %d\n", __func__, ret);
> 431             goto host1_en_fail;
> 432         }
> 433     }
> 
> <enable_irq here? >

If there is DSI1, it was also powered on/programmed at the time of 
msm_dsi_host_enable, so enabling IRQs from it should be safe. Do you see 
any pitfalls from enabling the irq from that function?

> 
>>
>>> >>>> >       msm_host->power_on = true;
>>> >>>> >       mutex_unlock(&msm_host->dev_mutex);
>>> >>>> >
>>> >>>> > @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct 
>>> mipi_dsi_host
>>> >>>> > *host)
>>> >>>> >               goto unlock_ret;
>>> >>>> >       }
>>> >>>> >
>>> >>>> > +     devm_free_irq(&msm_host->pdev->dev, msm_host->irq, 
>>> msm_host);
>>> >>>> > +
>>> >>>> >       dsi_ctrl_config(msm_host, false, NULL, NULL);
>>> >>>> >
>>> >>>> >       if (msm_host->disp_en_gpio)


-- 
With best wishes
Dmitry
