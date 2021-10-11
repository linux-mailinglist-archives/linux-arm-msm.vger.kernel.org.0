Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80390429598
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 19:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhJKRau (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 13:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232866AbhJKRat (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 13:30:49 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97994C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 10:28:49 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so5594038ooh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 10:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4MH/pEzVgo/ojExwE7YAhFK3vsORj8Zyi8WpQdJ1rDI=;
        b=chTqXWqb1JnYIW5QmBJ/4Lj1qC9axFR7iY86cpbQ8wWU+FxIT7FcHYI9+Kha3r7NKH
         UsQM3Rx99zM+xxWEZjKvQyvBLE+3oWv9xSkcSCbJjmTs7noyF4yIzhqAoWnP4md48bgA
         dq7RYa2cyurSn2Ipo7LS654T2dlUDm3ALmhZsKA58z6gfvkkeJVvOfC4aDhPItap3c5a
         yY0YA7p26I+BA43xJ7tCA48sVATeAuhZ0ZJ/iIS4vabzBfqvQyIBRYvzLzVX51B5GmtP
         34x/I88wRRarwZHOCDXdgCj2jwh22v+nUEvIxfE3rUcIhDmdffWt93pVIF5ykfybH0J3
         9E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4MH/pEzVgo/ojExwE7YAhFK3vsORj8Zyi8WpQdJ1rDI=;
        b=14Jr8xlsEvANzs/e9RVfgpMofsQa7SgU5MyMaP9sqGBoOdAop+cZhf8dhmkCfrtIaX
         EbbIOWSLgzqPsVduoQNCjLM/J/XKu81FTNp90Dfg7oRRRQ2ZYERA4Yoqi6HBYRTO5P6i
         GVrazpRAtyGKD3ldlrGFBbq3zBD8JkOTV7PTMk7h1Sulol2mJwD08fH9PTWVWCMNm0KZ
         uueOiyyUTCH3lnzpDFg/tOMrbhaGMn83cAtANY30LP8gUHgWlwJH9sMBL7Y9qEtRL07A
         eWk0McbuXCpuTGJCjp+yUILxvrjnQXlwf0KETU/srVM5QtcMW/1V4QgMdsT62BivWprP
         +DAg==
X-Gm-Message-State: AOAM533VNg6l4kkbJVU8nbgbI36VH5+JcaD4QzLPLngcHBevk6zuWx2F
        XoXh+YPXlh/TaU3GYVqKtNOehQ==
X-Google-Smtp-Source: ABdhPJzd3YrNICV57tvx33jWscFS6h1B7SofDme+36l6NCXoCT53hk4WkFaKqNiPYHv/+98SM0aE2w==
X-Received: by 2002:a4a:5343:: with SMTP id n64mr20019128oob.30.1633973328783;
        Mon, 11 Oct 2021 10:28:48 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id i13sm1377807oig.35.2021.10.11.10.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 10:28:48 -0700 (PDT)
Date:   Mon, 11 Oct 2021 10:30:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     khsieh@codeaurora.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
Message-ID: <YWR0rrC4yoKtXXTL@ripper>
References: <YV0FlTyMEzlyNsN9@ripper>
 <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org>
 <YV3dddt/GOidTmlN@ripper>
 <9dc50145fb3e9b189fd38857b20f326a@codeaurora.org>
 <YV9TQEKPh4SXYFF/@ripper>
 <0c72f3fd8c49cdada09bb6ee366b53a6@codeaurora.org>
 <CAE-0n51bvKXmHj0X_cvR2fdk4-mh4SRsrEE33H0e1Q+p=7iPxA@mail.gmail.com>
 <ad244133bdba4570b0b45871fd136350@codeaurora.org>
 <YWB1cXoaGRXfGau1@ripper>
 <44ffcac32270a8ea72dcfc044e2b2585@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44ffcac32270a8ea72dcfc044e2b2585@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Oct 08:24 PDT 2021, khsieh@codeaurora.org wrote:

> On 2021-10-08 09:44, Bjorn Andersson wrote:
> > On Fri 08 Oct 09:07 PDT 2021, khsieh@codeaurora.org wrote:
> > 
> > > On 2021-10-07 15:34, Stephen Boyd wrote:
> > > > Quoting khsieh@codeaurora.org (2021-10-07 13:28:12)
> > > > > On 2021-10-07 13:06, Bjorn Andersson wrote:
> > > > > > On Thu 07 Oct 12:51 PDT 2021, khsieh@codeaurora.org wrote:
> > > > > >
> > > > > >> On 2021-10-06 10:31, Bjorn Andersson wrote:
> > > > > >> > On Wed 06 Oct 08:37 PDT 2021, khsieh@codeaurora.org wrote:
> > > > > >> >
> > > > > >> > > On 2021-10-05 19:10, Bjorn Andersson wrote:
> > > > > >> > > > On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:
> > > > > >> > > >
> > > > > >> > > > > On 2021-10-05 15:36, Stephen Boyd wrote:
> > > > > >> > > > > > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> > > > > >> > > > > > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> > > > > >> > > > > > >
> > > > > >> > > > > > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > > > >> > > > > > > > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > > > >> > > > > > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > > > >> > > > > > > > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > > > >> > > > > > > > > eDP this reduction improves the user experience dramatically - i.e.
> > > > > >> > > > > > > > > removes 9.9s of bland screen time at boot.
> > > > > >> > > > > > > > >
> > > > > >> > > > > > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > > > >> > > > > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > >> > > > > > > > > ---
> > > > > >> > > > > > > >
> > > > > >> > > > > > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > > > > >> > > > > > > > re-read the code a couple times to understand that it's waiting 100ms
> > > > > >> > > > > > > > times the 'delay' number. Whaaaaat?
> > > > > >> > > > > > > >
> > > > > >> > > > > > >
> > > > > >> > > > > > > I assume you're happy with the current 10s delay on the current
> > > > > >> > > > > > > devices, so I don't think we should push for this to be backported.
> > > > > >> > > > > > > I have no need for it to be backported on my side at least.
> > > > > >> > > > > > >
> > > > > >> > > > > >
> > > > > >> > > > > > Sure. Fixes tag != backported to stable trees but it is close.
> > > > > >> > > > > >
> > > > > >> > > > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > > >> > > > > > >
> > > > > >> > > > >   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
> > > > > >> > > > >
> > > > > >> > > > > This patch will prevent usb3 from working due to dp driver
> > > > > >> > > > > initialize phy
> > > > > >> > > > > earlier than usb3 which cause timeout error at power up usb3 phy
> > > > > >> > > > > when both
> > > > > >> > > > > edp and dp are enabled.
> > > > > >> > > >
> > > > > >> > > > Can you please help me understand what you mean here, I use this on my
> > > > > >> > > > sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
> > > > > >> > > > work? Or am I just lucky in some race condition?
> > > > > >> > > >
> > > > > >> > > > Thanks,
> > > > > >> > > > Bjorn
> > > > > >> > > >
> > > > > >> > > The problem is seen at sc7280.
> > > > > >> > > Apple dongle have both  hdmi and usb port.
> > > > > >> > > plug Apple dongle into type-c, then plug DP into apple's hdmi port
> > > > > >> > > and usb
> > > > > >> > > mouse into apple's usb port.
> > > > > >> > > If edp enabled at this time, then usb mouse will not work due to
> > > > > >> > > timeout at
> > > > > >> > > phy power up.
> > > > > >> > >
> > > > > >> >
> > > > > >> > Okay, so you're saying that if the DP driver invokes phy_power_on()
> > > > > >> > before the USB driver does, USB initialization fails (or at least USB
> > > > > >> > doesn't work)?
> > > > > >>
> > > > > >> if dp driver call qcom_qmp_phy_init() before usb3 call
> > > > > >> qcom_qmp_phy_init(),
> > > > > >> usb3 driver will timeout at readl_poll_timeout(status, val, (val &
> > > > > >> mask) ==
> > > > > >> ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().
> > > > > >
> > > > > > Thanks, I will try to reproduce this on my side. So the 10 seconds here
> > > > > > is strictly to give good enough time for the dwc3 driver to probe...
> > > > > >
> > > > > > Any idea why you're saying that this is specific to sc7280, what
> > > > > > changed
> > > > > > from sc7180?
> > > > >
> > > > > I did not have sc7180 with edp before so that i am not sure it will
> > > > > happen on sc7180 or not.
> > > > > The usb3 does not work when both edp and dp enabled I just seen at
> > > > > sc7280.
> > > > > Current at sc7280 EC is not boot up correctly when system power up.
> > > > > I have to manual reboot EC from linux kernel shell before DP/usb3 can
> > > > > work.
> > > > > I am not sure this contribute to this problem or not.
> > > > >
> > > >
> > > > Can you make the usb driver into a module and only load that module
> > > > later in boot after the DP driver calls qcom_qmp_phy_init()? That would
> > > > be an easy way to move usb probe after DP probe and expose this problem.
> > > 
> > > we need usb calls qcom_qmp_phy_init() before dp.
> > 
> > Why?
> I do not know the details.
> But I did see below scenario,
> 
> if dp driver call qcom_qmp_phy_init() before usb3 call
> qcom_qmp_phy_init(),
> usb3 driver will timeout at readl_poll_timeout(status, val, (val &
> mask) ==
> ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().

Sounds like a bug in the QMP driver, something that could easily be
reproduced by waiting for DP to be up before we bring up USB - either by
chance, or following Stephen's suggestion on purpose.

Someone will have to look into this, so that we don't need a 10 second
workaround in the (e)DP driver.

Regards,
Bjorn
