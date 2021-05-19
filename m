Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D073898EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 23:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhESVyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 17:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhESVyw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 17:54:52 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7BCC0613CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 14:53:29 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id f9so20083845ybo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 14:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jd/bNwxn2oWSrAf9sSe4tPmoSQKVy+JtsHNGOQIE9iI=;
        b=J6Y530AZYNAlrFVMi7i3q0xCyUTQychAs7BdsD0/YERwsccLWVscdP3NroaENp4m9Q
         2mhhPBib3iTcw+sq088NZi7U2c/lVraSBD4+e/Sl237lWfwbVCy3T9R+gQBf68B6HcE0
         ni7G4pWVCbp/qfHKp1XvaVzt8uenTUTfQnoSns1WNlyX8wfFE9PED425khkG87mNCdbB
         Fiz5RDZcMV190aOAsuXCyuBD7xYnbz6WIKE/plzZnDF3LrA6wADXmx7InWdfIWlDBjy+
         R87KZ340bZm62ZTmsynT1GOyEtkGjIsrgagbiAZdqL5OJ1XWIsqCv/meHzIqRHo3vkM4
         AQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jd/bNwxn2oWSrAf9sSe4tPmoSQKVy+JtsHNGOQIE9iI=;
        b=HxWmLOpezKjgwUT7exh/z4LSrzCJbdLtS0/NHO78wmpcLRc+DrDmGkHjMgQY+I6Swx
         pDwQ3kbnMmEj9jL6CaI6NkokrYz8LPCsNQnTSiekLiRUR0IAiVkd3Xac010QqK+VpMEN
         6PdoJcKngU0xnuX1jYDbWyn1PBmLqEijK2RCeCbKOVsY1V+dYzRZlzYkY73gm9KarXpf
         dSZNfSS6Cd+yRuE33VjpSNKHjKKWQUStd8CRtfUbilsLe3vkzFCpAd2hlnTalG26Fb2D
         d7jPlVSmg0o/1r6oeQrZC84JAw92q0dXay7Cxf+ZZT2dWsKx1iVxJrf364Xic0HkoxfR
         TG4w==
X-Gm-Message-State: AOAM532vL9i/JtMeLLDHNuOa+GWr4Q5yF6ih29SHGhL1srDCE2ftGedO
        Aaq5WQYdoyKaGpgOE5HvdWiEw4gqUy7ZjifcUxzoYA==
X-Google-Smtp-Source: ABdhPJx+chv+0MSlRmJV0+qUwkBTi/rX1EuTqdg6Z+GDAwGpIFq9O5l3giqr2oaLO30TYH42ACRTUcWpWyXxR5qs/1Y=
X-Received: by 2002:a25:3f47:: with SMTP id m68mr2386868yba.228.1621461208826;
 Wed, 19 May 2021 14:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <aff4807e-e554-2e32-5789-dfaf65128a8e@connolly.tech> <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com>
In-Reply-To: <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 19 May 2021 14:52:53 -0700
Message-ID: <CAGETcx-2TySe=w1qAbtj2AJu6fNo_gaYnyP6GN150ShT1TvDfA@mail.gmail.com>
Subject: Re: fw_devlink breakage on SDM845 / a630 with DSI displays
To:     Rob Clark <robdclark@gmail.com>
Cc:     Caleb Connolly <caleb@connolly.tech>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 19, 2021 at 8:36 AM Rob Clark <robdclark@gmail.com> wrote:
>
> + some more folks and msm list..
>
> I suppose I didn't hit this because CONFIG_FBDEV_EMULATION is not
> normally enabled for CrOS.. but I'm not really to familiar with
> fw_devlink
>
> BR,
> -R
>
> On Wed, May 19, 2021 at 8:26 AM Caleb Connolly <caleb@connolly.tech> wrote:
> >
> >
> > Hi,
> >
> > Since -rc1 I've been hit by some DRM breakage in freedreno which happens
> > when fw_devlink=on. It seems to cause some clocks (rcg) to get stuck and
> > break DSI displays, here's a full log from the OnePlus 6:
> > https://paste.ubuntu.com/p/8kPx4nFGF5/ (that is with
> > "deferred_probe_timeout") The PocoPhone F1 also seems to be affected by
> > this.
> >
> > The display will still come up after pressing the power button a few
> > times, although it will be incredibly slow.
> >
> > It's worth noting that the issue only happens with
> > CONFIG_FBDEV_EMULATION is enabled, I've previously required this to see
> > kernel logs during boot and general boot splash with postmarketOS.
> > Without it the display will be stuck on the bootloader splash until I
> > press the power button and cause it to update once UI (like Phosh) has
> > started (though this has been the case for quite some time).
> >
> > I'd appreciate any help with debugging / resolving this issue, I'm
> > afraid I haven't been able to determine much from some brief digging.
> >

Hi Caleb,

Is this a device that's supported upstream? If so, can you please
point me to the DTS file that corresponds to this board?

Also, can you please change all the dev_dbg to dev_info in these
functions and give me the full boot log?
device_link_add()
device_links_check_suppliers()

Can you also tell what device are not probing with fw_devlink=on that
might be probing with fw_devlink=permissive?
You should be able to compare /<debugfs>/devices_deferred to figure that out.

Thanks,
Saravana
