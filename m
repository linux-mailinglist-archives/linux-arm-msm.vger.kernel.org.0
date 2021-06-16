Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49FB3AA49F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 21:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbhFPTwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 15:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232973AbhFPTwc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 15:52:32 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5B5C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 12:50:25 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id f84so4787793ybg.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BpX9RM0RjvziEsUJ9dN6VkWdrmA2dwEqdbPgY+OwBX8=;
        b=I+Uk2LYreWGOIqUEWgwS83Kcrwxt3UM3mmGjY4XKDdC6832nGuhlC6IuNbRMCfYZ4W
         8e0AdMRGqZymy4Wca8gh/As9vnVjgEbDd+gy+VdWZtg1XqfpHHuPqiiscOR1l3xooRm4
         3ewG69U7PwFYRhIb+KPDjorkf9ygTJ8hlzbvxgfGzZWXaR50CdswnDxuTV8pyrtbFE89
         3fZavwnhKgMG0glzc4pnSTIa6urgUkHEybZ3QGfG7JefuOHRoRCUqA6xLiUueRmAwv1u
         +okFc7xh7WUDDg7d5qQIdGSjZiCFy1wCS7QfdpZAlvqnZuUja8YLAOh3WASR8SXW4jGH
         jX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BpX9RM0RjvziEsUJ9dN6VkWdrmA2dwEqdbPgY+OwBX8=;
        b=sG5bgl8pk7SvQyxV07kraEht1EKtTvcIVW5gdkDB9+v9Tz1oHjNR77B2WVyKvkzsXI
         24H5RYWJGyqzz4ikmzZTWhg4coEdh4xWq++TUt05AJ6MI4h2U98f/0EbJFZZv+57dbxX
         YWXojAwflLEs5iPoPw3O7Zj/WVA2OoMFasAEltyPiuY5DmIUruCr0pXWED5RCZvCB0zx
         hxQLGhmzNgNAvscqXZDEEW0DOlmaSLKitKF0LYCmfDkJWIOU9ZKxZ1OlKUPemHYzUQ0l
         piHY4CD6zMIDGh04efmlO76qCuzRjCbirD3cs6WTmIRsVS7mxyW6qDNlPc26D9P14zHm
         6EoA==
X-Gm-Message-State: AOAM530OwMcKwenaV939gB7yeFE//gUcXPzNW25lOFBrn9Qm3D1DjGIc
        JS6aj1+O5oiDigRHRlFNiBCSDQCdMe5vgJXo9ByHFA==
X-Google-Smtp-Source: ABdhPJzcZeL/uuAARY7WI4xBIJbEfSPdfecmPJ7tP3ZA3aVqSYxc+jd/ac1897LQxU+A+m6UBRI1M2EgQV3Ot1/i5yI=
X-Received: by 2002:a25:824f:: with SMTP id d15mr1123250ybn.96.1623873024699;
 Wed, 16 Jun 2021 12:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <aff4807e-e554-2e32-5789-dfaf65128a8e@connolly.tech>
 <CAF6AEGvnL9mOp3vKuSvz=KDijtFVMdKCF4BXSLxXeoR38O-SUg@mail.gmail.com>
 <CAGETcx-2TySe=w1qAbtj2AJu6fNo_gaYnyP6GN150ShT1TvDfA@mail.gmail.com>
 <968c8e20-82ef-cc3d-c809-f38d801699c8@connolly.tech> <CAGETcx97=+pOpfdMXDXgHOGQhj7whkc=zq7Hc27fE_BARXSGtQ@mail.gmail.com>
 <8c46f015-117a-790c-a788-13b4850bdd02@connolly.tech>
In-Reply-To: <8c46f015-117a-790c-a788-13b4850bdd02@connolly.tech>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 16 Jun 2021 12:49:48 -0700
Message-ID: <CAGETcx-zz3BzwfLESoV2Jx6cJvS3xjc=nFJkUKYX3atOVui5Rw@mail.gmail.com>
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

On Fri, Jun 11, 2021 at 3:53 PM Caleb Connolly <caleb@connolly.tech> wrote:
>
> Hi all,
>
> This issue is still occurring on -rc5, breaking display output on the
> OnePlus 6, 6T and PocoPhone F1 unless fw_devlink=permissive is set.
>
> I'm not quite sure how I should go about debugging and resolving this,
> I'd greatly appreciate any ideas / recommendations as I would really
> like to make sure 5.13 doesn't release with broken displays on these
> devices.

Since (as you mentioned earlier) no device probe itself is getting
blocked permanently by fw_devlink=on, this seems like a race condition
between the drivers. I'd suggest using initcall_debug=1 and enabling
any other logs you need in drivers/base/dd.c to see what order the
devices probe between the working and not-working case. That'd be a
good place to start. Once you identify any ordering difference, we
should have a better idea of what might need fixing.

-Saravana
P.S: You are mixing top posting and inline replies. Please try not to do that.

>
> Thanks,
> On 20/05/2021 1:17 am, Caleb Connolly wrote:
> >
> >
> > On 20/05/2021 1:06 am, Saravana Kannan wrote:
> >> On Wed, May 19, 2021 at 3:43 PM Caleb Connolly <caleb@connolly.tech> wrote:
> >>>
> >>> Hi Saravana,
> >>>
> >>> On 19/05/2021 10:52 pm, Saravana Kannan wrote:
> >>>> On Wed, May 19, 2021 at 8:36 AM Rob Clark <robdclark@gmail.com> wrote:
> >>>>>
> >>>>> + some more folks and msm list..
> >>>>>
> >>>>> I suppose I didn't hit this because CONFIG_FBDEV_EMULATION is not
> >>>>> normally enabled for CrOS.. but I'm not really to familiar with
> >>>>> fw_devlink
> >>>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>> On Wed, May 19, 2021 at 8:26 AM Caleb Connolly <caleb@connolly.tech> wrote:
> >>>>>>
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> Since -rc1 I've been hit by some DRM breakage in freedreno which happens
> >>>>>> when fw_devlink=on. It seems to cause some clocks (rcg) to get stuck and
> >>>>>> break DSI displays, here's a full log from the OnePlus 6:
> >>>>>> https://paste.ubuntu.com/p/8kPx4nFGF5/ (that is with
> >>>>>> "deferred_probe_timeout") The PocoPhone F1 also seems to be affected by
> >>>>>> this.
> >>>>>>
> >>>>>> The display will still come up after pressing the power button a few
> >>>>>> times, although it will be incredibly slow.
> >>>>>>
> >>>>>> It's worth noting that the issue only happens with
> >>>>>> CONFIG_FBDEV_EMULATION is enabled, I've previously required this to see
> >>>>>> kernel logs during boot and general boot splash with postmarketOS.
> >>>>>> Without it the display will be stuck on the bootloader splash until I
> >>>>>> press the power button and cause it to update once UI (like Phosh) has
> >>>>>> started (though this has been the case for quite some time).
> >>>>>>
> >>>>>> I'd appreciate any help with debugging / resolving this issue, I'm
> >>>>>> afraid I haven't been able to determine much from some brief digging.
> >>>>>>
> >>>>
> >>>> Hi Caleb,
> >>>>
> >>>> Is this a device that's supported upstream? If so, can you please
> >>>> point me to the DTS file that corresponds to this board?
> >>> The DTS can be found in
> >>> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi (the two devices
> >>> "enchilada" and "fajita" share almost all hardware in common).
> >>>>
> >>>> Also, can you please change all the dev_dbg to dev_info in these
> >>>> functions and give me the full boot log?
> >>>> device_link_add()
> >>>> device_links_check_suppliers()
> >>> I've uploaded a log here: https://paste.ubuntu.com/p/8ynFgRWbYW/
> >>> For reference, the same but with fw_devlink=permissive:
> >>> https://paste.ubuntu.com/p/F2853CphHb/
> >>>>
> >>>> Can you also tell what device are not probing with fw_devlink=on that
> >>>> might be probing with fw_devlink=permissive?
> >>> The devices in question are ae00000.mdss, ae94000.dsi and ae01000.mdp.
> >>>> You should be able to compare /<debugfs>/devices_deferred to figure that out.
> >>> devices_deferred is empty for me,
> >>
> >> So, ae00000.mdss, ae94000.dsi and ae01000.mdp are probing for =on and
> >> =permissive?
> >>
> >> That's interesting. So maybe fw_devlink is somehow changing the probe
> >> order that's causing this? AFAIK, fw_devlink shouldn't cause changes
> >> to probe order (it used to, but I've fixed them all).
> > Yeah, they always successfully probe, it seems like fw_devlink is
> > exposing some racy behaviour somewhere.
> >
> > The issue happens when initialising the display for framebuffer device
> > emulation - with framebuffer emulation disabled it all mostly works as
> > expected. With the caveat that there is nothing on the display until the
> > device has finished booting AND the user causes a refresh by pressing
> > the power button a few times.
> >
> > Perhaps this early framebuffer driver is causing confusion as it has
> > different dependencies than the main driver?
> >>
> >>> however device_component contains
> >>> (only) the following:
> >>> oneplus6:/home/user# cat /sys/kernel/debug/device_component/ae00000.mdss
> >>> master name                                            status
> >>> -------------------------------------------------------------
> >>> ae00000.mdss                                            bound
> >>>
> >>> device name                                            status
> >>> -------------------------------------------------------------
> >>> ae01000.mdp                                             bound
> >>> ae94000.dsi                                             bound
> >>> 5000000.gpu                                             bound
> >>
> >> Sorry, I have no context on this and how to interpret it. I kinda know
> >> a little about the component framework, but not much. Is this file the
> >> same for =on and =permissive?
> > Apologies, I assumed it had something to do with fw_devlink. It's the
> > same for both cases yeah.
> >>
> >> -Saravana
> >>
> >
>
> --
> Kind Regards,
> Caleb
>
