Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1344A23D3B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 23:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHEV5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 17:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgHEV50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 17:57:26 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD43C061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2020 14:57:26 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id t7so20762269otp.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2020 14:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EW1xytv7V7gDtjoyC2+l+LNJutA6LsLNhSa7cNIEDgw=;
        b=g58fggaCpWJ8fV/7CT/RBrakbZOA/j2Fa6hXVlgy536iNIRtiT9JteFTdZw86bGzIW
         83wKiU5+B1Y/On+B5ugh2UKgLeMt+Er1aujK646TJnafUeAHXN92H3DXBvm6t3epbUki
         bsww+LL2RH8kFh6MmhSeZcrHNlUlO+fA/LkNkTdBV72HD1iUiGZc+27+Rhn7Tq8wIldc
         4FQvVUXkQfW2yVntxTeJ8fe7+Kqhl00eeoTp/2XLaHwhKqiU1kmSvutHH+2J9DwEumnN
         XA2WwC8dwZgkM1kRPUk6LepeVPBvWInffL7Z/YUXHIBkYBI+4HjMqbAl/0PbVMOln4aM
         fpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EW1xytv7V7gDtjoyC2+l+LNJutA6LsLNhSa7cNIEDgw=;
        b=XR/FuY0VfJK9waFO9XjG0ecYbaVRNsKGW+9HzNIf0lw2XBYdYxGZ4dS96LL04PneOg
         1gR30zSCNjZ//YNnUya+CSmzUnjEiej6X0ODmV3ZP/kWU27by2R0MVs7leY1aAUd3Oke
         o3bJMO+jjbQYa9u0u9rsg9wfN+9cpTTiHmR+L5hm4l7KZALNqQlJuyHNADkWTQCEA9BF
         Kidjcu7+1pENamNelbsMBYYajILKmmaiM4hyYprmVdgtXSRk4C4XLF+ug5EEC75C/skw
         YYoSr+Q2Pi8azjGCazSAn/g33bTRZCGdsYT08o657+kIFINa+qquTSzCxYPxEPHgWGtp
         OGBQ==
X-Gm-Message-State: AOAM532rUQJvblvm5+LA4Q5EsPV81ijoRtdEXBUAgPq9PCxFauobh72R
        blUa4nBvbFZYKszW1NtMTtpyepSLjf4wJ1wOrrhg+A==
X-Google-Smtp-Source: ABdhPJzBW5pD245rGtYcy2dRuaElWUSO+wS3GTkjkqWacA2ZZgSIt1aLNiPlWdINx/ZIfm6Z0QL6TEq/RfC5ZpgXOXU=
X-Received: by 2002:a05:6830:237b:: with SMTP id r27mr4305663oth.352.1596664645516;
 Wed, 05 Aug 2020 14:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com> <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org> <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
In-Reply-To: <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 5 Aug 2020 14:57:14 -0700
Message-ID: <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> >>> <sigh>
> >>> So this is where I bashfully admit I didn't get a chance to try this
> >>> patch series out, as I had success with a much older version of
> >>> Saravana's macro magic.
> >>>
> >>> But unfortunately, now that this has landed in mainline, I'm seeing
> >>> boot regressions on db845c. :( This is in the non-modular case,
> >>> building the driver in.
> >> Does that mean the modular version is working? Or you haven't tried
> >> that yet? I'll wait for your reply before I try to fix it. I don't
> >> have the hardware, but it should be easy to guess this issue looking
> >> at the code delta.
> > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > around 20200727, but I didn't track it down as, well, there's less way
> > to get debug output on the C630.
> >
> > In my testing, module or built-in doesn't matter, but reverting does
> > allow me to boot again.
> >
> Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> boots, however, module (on the c630 at least) doesn't boot whether it's
> a module or built-in.

You may need to set deferred_probe_timeout=30 to give things a bit
more grace time to load.
(I've mostly recently used qcom-pdc as a module with the android tree,
so the fw_devlink bits help there, but I need to re-check the state of
that upstream.)

I'll dbl check this and dig more on the issue with the patch in
question once I can get back in my office later today.

thanks
-john
