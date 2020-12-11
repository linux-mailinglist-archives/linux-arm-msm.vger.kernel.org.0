Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394382D7225
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 09:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437060AbgLKIr5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 03:47:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392446AbgLKIrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 03:47:23 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CF5C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 00:46:43 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id lt17so11259218ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 00:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sDdfQvMZJazL55A92kQ/VzvBdB6WU0HCnW0vsuFnegU=;
        b=XcXLc6NJhH7B/QDM8WKeCcU5W8Hmi1uswSnml+BVR+dijzpEOb0RGCFuN2OvZLJ2o8
         R3r/tcU6AevS0ttHcmsB+IIHTR291ZvTOReyU0u4HOwgLNKjgTAlPaEGWO5sqEXB62bP
         FYOYp9S8WsPYbvBV0koO+4aAThvsrODyEuah+dhZx42IkefQwMJbLWtL/fjGz+97offe
         p7PGZ8nh/msibYgl4fHYD2GGLf+AY5nCvHc86lZZcbddJ9+ysNrBgKns/BcFXkeR4hhv
         X2Cy4NiBUKtlXn+HrEl4yrHWQg/F8L7/vV4sx6/dPSGdj4igAvV6OINgaLdncIxI9ozL
         9fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sDdfQvMZJazL55A92kQ/VzvBdB6WU0HCnW0vsuFnegU=;
        b=Ncsvjy2E9uZwXekUVvMaDxZX7P1V/x9f3HANZw/M7maQ7q3ExbPv5OolCSUjShArOl
         By9+jPge/6CTNLrD0KUOUI/udw7+r7lMEYgrTflOwuBJihAPIG7b00xK657H7FNYmcZ2
         lajDb0yFxQ9gAuTWm/5c5vQbntq3HmqFixFp5shtg+WMrv/rR3CZRrjMgPL7W4DFxy6R
         Ydd99X8pJ5kOzywBbanSwr6L5EbrNqqTMLFWq/+vPGQWkDtbfioME8NKoFBiIVz/y642
         SOI+AcTlWSimXIk8MW/N0yL0ruFcJ7Js0TZ0qQjHA2+BCq3f189YHk8Y+eEEiP3zGkeO
         lapA==
X-Gm-Message-State: AOAM53277bJz+d13In2uTlru9f1Jd/r/1nBAzjwr+uzfQ5u6ZPmao0N8
        dmCGJm1nTG9wz3wqqtJbBLo7kq8vOivsonB61ZcC2EXoeqqemyqq
X-Google-Smtp-Source: ABdhPJwBcrWFMCBWLOQ2YDvVQUyai6oD/poEHkhd2GUPENNzm23TU68nI/28thF+plLvRXlQI1bvYsCNqQbPsS+b23U=
X-Received: by 2002:a17:906:40c1:: with SMTP id a1mr9852038ejk.520.1607676402010;
 Fri, 11 Dec 2020 00:46:42 -0800 (PST)
MIME-Version: 1.0
References: <1607670251-31733-1-git-send-email-hemantk@codeaurora.org>
 <1607670251-31733-4-git-send-email-hemantk@codeaurora.org> <X9MjXWABgdJIpyIw@kroah.com>
In-Reply-To: <X9MjXWABgdJIpyIw@kroah.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 11 Dec 2020 09:53:14 +0100
Message-ID: <CAMZdPi8-_G+k1RvGOOte2MFFPQQiB=41wx86OkW+KDu13gRGUg@mail.gmail.com>
Subject: Re: [PATCH v17 3/3] bus: mhi: Add userspace client interface driver
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Dec 2020 at 08:44, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 10, 2020 at 11:04:11PM -0800, Hemant Kumar wrote:
> > This MHI client driver allows userspace clients to transfer
> > raw data between MHI device and host using standard file operations.
> > Driver instantiates UCI device object which is associated to device
> > file node. UCI device object instantiates UCI channel object when device
> > file node is opened. UCI channel object is used to manage MHI channels
> > by calling MHI core APIs for read and write operations. MHI channels
> > are started as part of device open(). MHI channels remain in start
> > state until last release() is called on UCI device file node. Device
> > file node is created with format
> >
> > /dev/<mhi_device_name>
> >
> > Currently it supports QMI channel. libqmi is userspace MHI client which
> > communicates to a QMI service using QMI channel. libqmi is a glib-based
> > library for talking to WWAN modems and devices which speaks QMI protocol.
> > For more information about libqmi please refer
> > https://www.freedesktop.org/wiki/Software/libqmi/
>
> This says _what_ this is doing, but not _why_.
>
> Why do you want to circumvent the normal user/kernel apis for this type
> of device and move the normal network handling logic out to userspace?
> What does that help with?  What does the current in-kernel api lack that
> this userspace interface is going to solve, and why can't the in-kernel
> api solve it instead?
>
> You are pushing a common user/kernel api out of the kernel here, to
> become very device-specific, with no apparent justification as to why
> this is happening.

That would probably deserve re-wording indeed. This interface offers
access to the modem control channel(s), which can be QMI (added in
this patch), MBIM, or the old known AT protocol. Because there is no
WWAN subsystem, these control pipes are directly exposed to userspace
and accessed by tools like libqmi, ModemManager, minicom (for AT)
etc... However, the data path, transporting the network payload (IP)
is well routed to the Linux network via the mhi-net driver.

>
> Also, because you are going around the existing network api, I will need
> the networking maintainers to ack this type of patch.
