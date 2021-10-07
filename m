Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98369425FFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 00:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbhJGWgt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 18:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbhJGWgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 18:36:49 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E651BC061755
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 15:34:54 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id w6-20020a4aa446000000b002b5795cca03so2349271ool.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 15:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=xvLkmQK9Bybd4TfsJEOa13aU7h3LNEaMsTOh+C5eBTg=;
        b=RrC+LQ4p5RknyhummIEgUPYOa5Fz91+AtAnA3rEUlbkmAuwRbsdE6lfznJHa0LlbJD
         gHeKxZrbTLMQqWWXvsiNBMMeaRwgA2mRA/n0nVIfo+Vcylr2NHZLoSz93AavNudYmQay
         JhoZXgGqu43xpmqTbQ4Z52i8Am0AOPbAQSlwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=xvLkmQK9Bybd4TfsJEOa13aU7h3LNEaMsTOh+C5eBTg=;
        b=65x7t55ZwA/kFhovoYMR9eYyzFxsWS80sDs13AB0MaYPU1lBiTwiFVrCQDAFXo7j42
         R0S6C2gLCswPRgdIh133zLIFpmpkAVXJLTgTOusX8RRh2LxzfgYgqX6vKYvjtExWm7YF
         s8ilDOurvx8wp4/na/AYUdZvcKcUeQsOGkL772Z3Jo1UUuSWakwdoqWr4QLOPpdFJ2lf
         vKpj9Wdcm+0VF42qrV1W5dJp2RogHCa5EPKU3hsAMxau7n1SJVQ+cv8/xuIUpBzleVG1
         t4uW3+6PJNNgzPLYPVr1akoyyblUHnM+H/qzn62StZR7fzU/s2XsDB8u8O+aohy3Z69i
         cW7w==
X-Gm-Message-State: AOAM530zzC9vMb8T5U6aOT2gdAgBz/1m2Yh8/0jB6Sr0XSb3+hR6g4cP
        FUO5zDO3yiwxaGDZQxuAzZgsMH49WsTn+QS4NJt/MQ==
X-Google-Smtp-Source: ABdhPJxw5GB+L1Z2oveCShSFbqavZMVrh82r2Kmb+640p8VfkAcz3rr6nqKCzxe0QKBNen93cGn02/Y5v97GrzlGfSM=
X-Received: by 2002:a4a:e2d3:: with SMTP id l19mr5401226oot.1.1633646094225;
 Thu, 07 Oct 2021 15:34:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 18:34:53 -0400
MIME-Version: 1.0
In-Reply-To: <0c72f3fd8c49cdada09bb6ee366b53a6@codeaurora.org>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <YVzGVmJXEDH0HfIL@ripper> <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org> <YV0FlTyMEzlyNsN9@ripper>
 <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org> <YV3dddt/GOidTmlN@ripper>
 <9dc50145fb3e9b189fd38857b20f326a@codeaurora.org> <YV9TQEKPh4SXYFF/@ripper> <0c72f3fd8c49cdada09bb6ee366b53a6@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 7 Oct 2021 18:34:53 -0400
Message-ID: <CAE-0n51bvKXmHj0X_cvR2fdk4-mh4SRsrEE33H0e1Q+p=7iPxA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, khsieh@codeaurora.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-10-07 13:28:12)
> On 2021-10-07 13:06, Bjorn Andersson wrote:
> > On Thu 07 Oct 12:51 PDT 2021, khsieh@codeaurora.org wrote:
> >
> >> On 2021-10-06 10:31, Bjorn Andersson wrote:
> >> > On Wed 06 Oct 08:37 PDT 2021, khsieh@codeaurora.org wrote:
> >> >
> >> > > On 2021-10-05 19:10, Bjorn Andersson wrote:
> >> > > > On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:
> >> > > >
> >> > > > > On 2021-10-05 15:36, Stephen Boyd wrote:
> >> > > > > > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> >> > > > > > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> >> > > > > > >
> >> > > > > > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> >> > > > > > > > > Found in the middle of a patch from Sankeerth was the reduction of the
> >> > > > > > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> >> > > > > > > > > is initalized and HPD interrupt start to be serviced, so in the case of
> >> > > > > > > > > eDP this reduction improves the user experience dramatically - i.e.
> >> > > > > > > > > removes 9.9s of bland screen time at boot.
> >> > > > > > > > >
> >> > > > > > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> >> > > > > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> > > > > > > > > ---
> >> > > > > > > >
> >> > > > > > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> >> > > > > > > > re-read the code a couple times to understand that it's waiting 100ms
> >> > > > > > > > times the 'delay' number. Whaaaaat?
> >> > > > > > > >
> >> > > > > > >
> >> > > > > > > I assume you're happy with the current 10s delay on the current
> >> > > > > > > devices, so I don't think we should push for this to be backported.
> >> > > > > > > I have no need for it to be backported on my side at least.
> >> > > > > > >
> >> > > > > >
> >> > > > > > Sure. Fixes tag != backported to stable trees but it is close.
> >> > > > > >
> >> > > > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >> > > > > > >
> >> > > > >   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
> >> > > > >
> >> > > > > This patch will prevent usb3 from working due to dp driver
> >> > > > > initialize phy
> >> > > > > earlier than usb3 which cause timeout error at power up usb3 phy
> >> > > > > when both
> >> > > > > edp and dp are enabled.
> >> > > >
> >> > > > Can you please help me understand what you mean here, I use this on my
> >> > > > sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
> >> > > > work? Or am I just lucky in some race condition?
> >> > > >
> >> > > > Thanks,
> >> > > > Bjorn
> >> > > >
> >> > > The problem is seen at sc7280.
> >> > > Apple dongle have both  hdmi and usb port.
> >> > > plug Apple dongle into type-c, then plug DP into apple's hdmi port
> >> > > and usb
> >> > > mouse into apple's usb port.
> >> > > If edp enabled at this time, then usb mouse will not work due to
> >> > > timeout at
> >> > > phy power up.
> >> > >
> >> >
> >> > Okay, so you're saying that if the DP driver invokes phy_power_on()
> >> > before the USB driver does, USB initialization fails (or at least USB
> >> > doesn't work)?
> >>
> >> if dp driver call qcom_qmp_phy_init() before usb3 call
> >> qcom_qmp_phy_init(),
> >> usb3 driver will timeout at readl_poll_timeout(status, val, (val &
> >> mask) ==
> >> ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().
> >
> > Thanks, I will try to reproduce this on my side. So the 10 seconds here
> > is strictly to give good enough time for the dwc3 driver to probe...
> >
> > Any idea why you're saying that this is specific to sc7280, what
> > changed
> > from sc7180?
>
> I did not have sc7180 with edp before so that i am not sure it will
> happen on sc7180 or not.
> The usb3 does not work when both edp and dp enabled I just seen at
> sc7280.
> Current at sc7280 EC is not boot up correctly when system power up.
> I have to manual reboot EC from linux kernel shell before DP/usb3 can
> work.
> I am not sure this contribute to this problem or not.
>

Can you make the usb driver into a module and only load that module
later in boot after the DP driver calls qcom_qmp_phy_init()? That would
be an easy way to move usb probe after DP probe and expose this problem.
