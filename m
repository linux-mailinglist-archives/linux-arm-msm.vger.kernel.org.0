Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4FD2F8A3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jan 2021 02:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbhAPBFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 20:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbhAPBFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 20:05:45 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D777C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 17:05:05 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id x26so6050008vsq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 17:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1jaH2X7S2VsQNxdRM32ntn9sMg9v7F6IuCY/DoxBE34=;
        b=e+5OdhvN0c0ih4PhNWYKwJ2k+cIHzWc5jrHXuJvOiu31HGIAUyaCuAMtXO5bq3D31R
         Jf7v14vECN/jHCOwVRbSxTJWPj9idoVpyqznPzX5kxH17Kt4/CVXq3IdYzadtU4e6RQx
         TcApMa222+2mnKQBn02Wpl7C7+M5K4lGlmQu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1jaH2X7S2VsQNxdRM32ntn9sMg9v7F6IuCY/DoxBE34=;
        b=MBpfoQvEwkT0qrQwdtizqdaoBpqYLY2yQct/+qO9MUg3A4Jnx6Z5N4Bskgjy6yFuWt
         P1illO57dylGt7npxDugTDNQswVjkV2ml4ewOnEZNDqUMRd8oqLnRKugImsBWNn09FFV
         5PVqdua+xLTErZuHPMWDrn/7+59+jAF6440aJPTGVJW+ZmODtaVLbHZOoHW/e1oKppsC
         34VThtVSYyyce+cycDk97XBcQQTKX767U64C2+gOsMr3xA1mHoxTwxn6MyFV6nud+obf
         GhU/yORi8UlGG2JZ6+cu3GCWw6cO3eG4eU4WRysUnfc2uen4L+iib+uvKEmbU5oyNYWF
         9SKw==
X-Gm-Message-State: AOAM531Q/veffwHWdRNi3LjdJ642jiqN3j39TSqYdcd10rX+qthBeGuR
        d6bj79VC+EVFdTc8+dyQTJMCwmZWiBZVaA==
X-Google-Smtp-Source: ABdhPJynXr/hyAeFOnV2JbN9tbMQ9981YFDyhfO/08qlaCdaA5IL2LSrpSoAoo1kP6Vl9pvcRq1OLw==
X-Received: by 2002:a67:11c3:: with SMTP id 186mr13220672vsr.3.1610759104249;
        Fri, 15 Jan 2021 17:05:04 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id h79sm1500527vkh.30.2021.01.15.17.05.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 17:05:02 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id w187so5043624vsw.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 17:05:02 -0800 (PST)
X-Received: by 2002:a05:6102:2361:: with SMTP id o1mr12707550vsa.34.1610759101867;
 Fri, 15 Jan 2021 17:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
 <20210108093339.v5.4.I7cf3019783720feb57b958c95c2b684940264cd1@changeid> <CACRpkdZJR142en_=rge5Gp7-MH6SzxjHmkCh_rUx=8j6SVZYSQ@mail.gmail.com>
In-Reply-To: <CACRpkdZJR142en_=rge5Gp7-MH6SzxjHmkCh_rUx=8j6SVZYSQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 15 Jan 2021 17:04:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WG5s81mh+S6Fhyz51nsui=EcsAVJd24uChrszKWHzauQ@mail.gmail.com>
Message-ID: <CAD=FV=WG5s81mh+S6Fhyz51nsui=EcsAVJd24uChrszKWHzauQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 8, 2021 at 4:36 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Doug,
>
> this is an impressive patch.
>
> We definitely need to touch base with Bjorn on this, preferably also
> Sboyd.
>
> On Fri, Jan 8, 2021 at 6:35 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
> > Fixes: 71266d9d3936 ("pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Some mechanics:

I just realized that I addressed everyone's comments but yours.  Doh!


> 1. Does this need to go into stable? Or is current (non-urgent) fine? Or fixes
>    for v5.10? I.e. required destination.

It probably ought to go into stable, but I'll leave it up to you which
version of Linux it lands in.  I don't personally know if anyone is
criticall waiting on this to land upstream.  For Chrome OS we're not
desperate for it because we've already landed a temporary revert of
Maulik's previous patch and the extra clearing of the masked
interrupts isn't causing any really visible problems for us.


> 2. If it does, should patches 1-3 also go into stable? And are they
> prerequisites?

Yeah, the last patch requires the previous ones, so they would all
need to go into stable together.

-Doug
