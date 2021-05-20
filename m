Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26B3389A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 02:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhETAIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 20:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhETAIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 20:08:11 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D60C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:06:50 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id b13so19028654ybk.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CcHNxQL99DiN5ybUKx3DoeX6zBxzSuTa/NazQoQDUSk=;
        b=vzDxhcOvPZD0gvcGCv5YMKX+TKVGl9eyotyaKhlOuGzpZ6Sm6/HroBoorHmHNqEIDr
         LiRCAw0LslmUkoRejOfCxzwCp1Jh/Y2CDlBgwwdrYvVvOeMtWlVvJCI8IZcRKly43nBz
         Q+q4XqocuF4JAPcQstgxSLMItuZMWvSWNJbLsE4wZVLgjvzRnRgUsCPfZT1NcCrzc3pI
         E/3G5Qq30KYNASM/aimmJTZBnUY74RSZVnCBXhe/RFAfhpqVxSvE/6ZVvA8bwOr7Cqrl
         OB2kxFykAg9I4a+f5JGK4VQjoEU+wYSzgV9ycaHZSR1gFt4HL3GSMiiWqIwcUVRnoPIo
         zhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CcHNxQL99DiN5ybUKx3DoeX6zBxzSuTa/NazQoQDUSk=;
        b=ktRHcrhhAzOehELMMvr0htxpIg12GdrjqSBvLhITl3AMleYTC3DmZ9dGEHXoyLmvER
         3lpLvb9J9ZOUe63wFQn3GMBZBIyUw9MPerjlbDhoy95KKCPIfvh2CBgqo2rahYUnFGey
         ln+922lwC/Ps4O37YPdDFIQ+LZkpdZgpbgRnYmASFGG0LBcHKyFVIiX2g9esQMb/mGL3
         6AU+EoAjcjoQWr8+RL0nhXn8GA74I0RvM68Yx4cGRfYzUqJvEXaYBjoA0CS46iHzS3/f
         oSU9XAfCpj7PiqfRvaNDnawXEGdbFy+X7hq163zdbnGllFOfxwy2BL+RVfkQYMd3aBsY
         +Vqw==
X-Gm-Message-State: AOAM531fYn3WzQitFSv6a/mqnrrjsv3iX1WLH+n8ON4YwAqFg4Zdcb8S
        B2x6CWUciMY0KiDpqY6bQ/PE//4m9raC3lOTXZxHiw==
X-Google-Smtp-Source: ABdhPJxFUekcPH6X1fmUJZGP7Xu4q5e+Q8pbIYxj7PSZo61SogAf45Y1CrWH4Hq7W+4Pf88lkSRsmU+bGTIGP+VHMOk=
X-Received: by 2002:a25:3f47:: with SMTP id m68mr3034512yba.228.1621469209335;
 Wed, 19 May 2021 17:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <aff4807e-e554-2e32-5789-dfaf65128a8e@connolly.tech>
 <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com>
 <CAGETcx-2TySe=w1qAbtj2AJu6fNo_gaYnyP6GN150ShT1TvDfA@mail.gmail.com> <968c8e20-82ef-cc3d-c809-f38d801699c8@connolly.tech>
In-Reply-To: <968c8e20-82ef-cc3d-c809-f38d801699c8@connolly.tech>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 19 May 2021 17:06:13 -0700
Message-ID: <CAGETcx97=+pOpfdMXDXgHOGQhj7whkc=zq7Hc27fE_BARXSGtQ@mail.gmail.com>
Subject: Re: fw_devlink breakage on SDM845 / a630 with DSI displays
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Rob Clark <robdclark@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 19, 2021 at 3:43 PM Caleb Connolly <caleb@connolly.tech> wrote:
>
> Hi Saravana,
>
> On 19/05/2021 10:52 pm, Saravana Kannan wrote:
> > On Wed, May 19, 2021 at 8:36 AM Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> + some more folks and msm list..
> >>
> >> I suppose I didn't hit this because CONFIG_FBDEV_EMULATION is not
> >> normally enabled for CrOS.. but I'm not really to familiar with
> >> fw_devlink
> >>
> >> BR,
> >> -R
> >>
> >> On Wed, May 19, 2021 at 8:26 AM Caleb Connolly <caleb@connolly.tech> wrote:
> >>>
> >>>
> >>> Hi,
> >>>
> >>> Since -rc1 I've been hit by some DRM breakage in freedreno which happens
> >>> when fw_devlink=on. It seems to cause some clocks (rcg) to get stuck and
> >>> break DSI displays, here's a full log from the OnePlus 6:
> >>> https://paste.ubuntu.com/p/8kPx4nFGF5/ (that is with
> >>> "deferred_probe_timeout") The PocoPhone F1 also seems to be affected by
> >>> this.
> >>>
> >>> The display will still come up after pressing the power button a few
> >>> times, although it will be incredibly slow.
> >>>
> >>> It's worth noting that the issue only happens with
> >>> CONFIG_FBDEV_EMULATION is enabled, I've previously required this to see
> >>> kernel logs during boot and general boot splash with postmarketOS.
> >>> Without it the display will be stuck on the bootloader splash until I
> >>> press the power button and cause it to update once UI (like Phosh) has
> >>> started (though this has been the case for quite some time).
> >>>
> >>> I'd appreciate any help with debugging / resolving this issue, I'm
> >>> afraid I haven't been able to determine much from some brief digging.
> >>>
> >
> > Hi Caleb,
> >
> > Is this a device that's supported upstream? If so, can you please
> > point me to the DTS file that corresponds to this board?
> The DTS can be found in
> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi (the two devices
> "enchilada" and "fajita" share almost all hardware in common).
> >
> > Also, can you please change all the dev_dbg to dev_info in these
> > functions and give me the full boot log?
> > device_link_add()
> > device_links_check_suppliers()
> I've uploaded a log here: https://paste.ubuntu.com/p/8ynFgRWbYW/
> For reference, the same but with fw_devlink=permissive:
> https://paste.ubuntu.com/p/F2853CphHb/
> >
> > Can you also tell what device are not probing with fw_devlink=on that
> > might be probing with fw_devlink=permissive?
> The devices in question are ae00000.mdss, ae94000.dsi and ae01000.mdp.
> > You should be able to compare /<debugfs>/devices_deferred to figure that out.
> devices_deferred is empty for me,

So, ae00000.mdss, ae94000.dsi and ae01000.mdp are probing for =on and
=permissive?

That's interesting. So maybe fw_devlink is somehow changing the probe
order that's causing this? AFAIK, fw_devlink shouldn't cause changes
to probe order (it used to, but I've fixed them all).

> however device_component contains
> (only) the following:
> oneplus6:/home/user# cat /sys/kernel/debug/device_component/ae00000.mdss
> master name                                            status
> -------------------------------------------------------------
> ae00000.mdss                                            bound
>
> device name                                            status
> -------------------------------------------------------------
> ae01000.mdp                                             bound
> ae94000.dsi                                             bound
> 5000000.gpu                                             bound

Sorry, I have no context on this and how to interpret it. I kinda know
a little about the component framework, but not much. Is this file the
same for =on and =permissive?

-Saravana
