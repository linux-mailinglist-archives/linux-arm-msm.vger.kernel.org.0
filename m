Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D64F37EF44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 01:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240758AbhELXB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 19:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390091AbhELVtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 17:49:24 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE886C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 14:47:53 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id h16so6972111pfk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 May 2021 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=N1sUYuNRtWpe5/0gBwMIZwmUciYoDGABR1xIt9TC6eM=;
        b=YBGOjbBK1Lv4SSzr9vR844bjr8N+oPqsqXVS9OppNQix8L7AGlck8c67Q0v7jQAPyH
         DOR//BlEIdfW067JNJ+TpdoSm3UTAMOB8+NX4ZlPQOgUNxI73rhKhy5odLsOIYbfpmpe
         gar7Q7vsFCcqYajv4wWlR+Mdk9RmkFd583Ty8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=N1sUYuNRtWpe5/0gBwMIZwmUciYoDGABR1xIt9TC6eM=;
        b=ntMCNCnOYrj+DzJHrjLq1AU907SA9oSlpl5Nr5+zRwXJj/TIS/9dnnHwqJhaO15zIL
         6eX9YHD9zYvvSAyi3jS8YOzv7pIwWvWEzi79Ge+uEQEzDy3QHmZwsR11Z8nlIGYLwxB7
         KO1Wh7d6+JI64SKhuXjmXD5w1h33N4JQ1NCob02THWMzVftus+Kt+xXoQbMzYH2U/wfN
         PC15+qwgyjMqhtuSXMs62Y/BtlDmjm5iFCnMfOwuy2Pp3e9hO58iIhZx0KI3YFTFt4hR
         chwI5S2oITmY3jZsY6Nkux2LOSh600pub1sTqOxzOKgFS1Hn5F8p+450vnhBznbqqRrL
         FlzA==
X-Gm-Message-State: AOAM530UI4fXD9JPiFnCtMjIk0/k2Rk/coPBN7Yd3a6pbNVqYUdAfB4S
        uTej74A4NURrb7tevnHCgsDDLg==
X-Google-Smtp-Source: ABdhPJzyYEFFCFF3ZAAPgV0TudErY54r0ya7cQySaETLzoT/B5u7qP3W8ckLBKfcjrYik66Ir6w+9g==
X-Received: by 2002:a05:6a00:14cb:b029:2be:1466:5a28 with SMTP id w11-20020a056a0014cbb02902be14665a28mr18204262pfu.55.1620856073353;
        Wed, 12 May 2021 14:47:53 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:a89e:5bb2:e8e0:4428])
        by smtp.gmail.com with UTF8SMTPSA id t26sm611645pfg.12.2021.05.12.14.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 14:47:52 -0700 (PDT)
Date:   Wed, 12 May 2021 14:47:50 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 2/5] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YJxNBm0WiMqjJ2Cg@google.com>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-3-git-send-email-sanm@codeaurora.org>
 <87r1iuk9vs.fsf@kernel.org>
 <184ddea9-643f-91ea-6d1f-5bdd26373e53@codeaurora.org>
 <87h7jkhxmw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h7jkhxmw.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 03, 2021 at 02:20:23PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Sandeep Maheswaram <sanm@codeaurora.org> writes:
> >> Sandeep Maheswaram <sanm@codeaurora.org> writes:
> >>> Avoiding phy powerdown when wakeup capable devices are connected
> >>> by checking phy_power_off flag.
> >>> Phy should be on to wake up the device from suspend using wakeup capable
> >>> devices such as keyboard and mouse.
> >>>
> >>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> >>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> >>> ---
> >>>   drivers/usb/dwc3/core.c | 7 +++++--
> >>>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> >>> index b6e53d8..bb414c3 100644
> >>> --- a/drivers/usb/dwc3/core.c
> >>> +++ b/drivers/usb/dwc3/core.c
> >>> @@ -1738,7 +1738,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >>>   		dwc3_core_exit(dwc);
> >>>   		break;
> >>>   	case DWC3_GCTL_PRTCAP_HOST:
> >>> -		if (!PMSG_IS_AUTO(msg)) {
> >>> +		if (!PMSG_IS_AUTO(msg) && dwc->phy_power_off) {
> >> should be able to detect this generically, no? Shouldn't
> >> device_may_wakeup() be valid here and give you the answer you want?
> >
> > I think  device_may_wakeup() gives whether the controller is wake up 
> > capable or not.
> 
> Yes, but it's a bit more than that. Looking at devices.rst we read:
> 
> If :c:func:`device_may_wakeup(dev)` returns ``true``, the device should be
> prepared for generating hardware wakeup signals to trigger a system wakeup event
> when the system is in the sleep state.  For example, :c:func:`enable_irq_wake()`
> might identify GPIO signals hooked up to a switch or other external hardware,
> and :c:func:`pci_enable_wake()` does something similar for the PCI PME signal.
> 
> So, if there is a condition where $this device has to, somehow, deal
> with wakeup, it should be configured accordingly. This ->phy_power_off
> flag is telling us the same thing.
> 
> > But we want to keep phy powered on only when some wakeup capable devices 
> > (eg:keyboard ,mouse ) are connected to controller.
> 
> Understood, it could be that we're missing some method for propagating
> that state (i.e. keyboard with PM support) up to the parent device, but
> that's no excuse to bypass driver boundaries. Wouldn't you agree?

I'm not sure if device_may_wakeup() is really the right tool for the
job. This is the current implementation:

static inline bool device_may_wakeup(struct device *dev)
{
	return dev->power.can_wakeup && !!dev->power.wakeup;
}

IIUC power.can_wakeup specifies whether the device is wakeup
capable, primarily in physical terms and indicating that the
driver is ready to handle wakeups, and power.wakeup represents
the policy which can be changed by userspace.

Supposing the hub is generally wakeup capable that flag
shouldn't be changed. Neither should be the policy based on
what is connected to the bus.
