Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B6746D082
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 11:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhLHKIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 05:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhLHKIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 05:08:36 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCF0C061A72
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 02:05:04 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id b13so1221325plg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 02:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3VlG0X5C2WeyX62N3377xKRJt9eBMbxFbqphE60v0Zo=;
        b=JF0JorBuS7waBsNX1Vyr42oERYkJrVZRUdV0jvc7XdomrqGUOY/GNfu1KwU47VEu0v
         hjeoibKSHTTwr7sL2XFbFfX8xZFpRJVijBSi1bli8YlzzstbmrLOrGAZk21mKBeUNyEn
         O+drSal5sw7Ao083EyjuGm9oobIpuflPwGIjhD0viNvtn/d1akVcl6L1b/0sJ+9xOUfk
         +kegVX6NWT0Zb65YMhyx4YTsJy6ZTQvNFKImtiuA74bi7MV9SfQqj5ANnjBqThbyFt6u
         R0GNGLTtRNRiuu1/t1FwFT5tU6g9xTJ6y8YR4Sh40HNZPoxKWYwmTKKFcWseAwjjknlz
         AJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3VlG0X5C2WeyX62N3377xKRJt9eBMbxFbqphE60v0Zo=;
        b=klDIMP8pyhqX4eY3Ej0HyijVCnIFfChwAddz0Dlqfa7vjPE8tBH9eAP7SQaurAlKst
         GIMcvFj9/Cejr8s4Nx1p0tfcpRTuxWjqHs1BMuXTN2ntjn6ebnYqUKxpRLB8e8R12SfR
         plq5PfcUj3cCgT9MjS/CZ1UCLaAE4p8LJ8Q/utqTVwrsX0fqHDGJsgLHB10HrVeS7QYV
         rNSvH7xDd1OzRQh/5lL/3eeYmGdvpsWJbTQxGqx4JM0TTuMJ5KVuvg1kij8KZAWICXKI
         hdzbgYUumpsNufpLEc46O9oy+5UfMpRerWJXnwsoCglrGH6xt9vOkbDg1ZOhi8EpR3Pe
         3MOg==
X-Gm-Message-State: AOAM532ikazAuVo+waDjw/GSwxRQAjzE+lwPvrMgjk/OdM8R/7gT9MfU
        ULZN38Pou8ap3hQDf6lCTNApxNk0/c8DaShP
X-Google-Smtp-Source: ABdhPJx5Ac6tG/98nAHlbbqQTdRfRG3D54wN5oyRq6vR/bzlWA1R+wqlFKh/I3S7dhraNdFJWGHzIg==
X-Received: by 2002:a17:902:9a4a:b0:146:8ce2:672 with SMTP id x10-20020a1709029a4a00b001468ce20672mr13552754plv.29.1638957903838;
        Wed, 08 Dec 2021 02:05:03 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g22sm3183890pfj.29.2021.12.08.02.05.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Dec 2021 02:05:03 -0800 (PST)
Date:   Wed, 8 Dec 2021 18:04:57 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] irqchip: Add Qualcomm MPM controller driver
Message-ID: <20211208100453.GP10105@dragon>
References: <20211202122122.23548-1-shawn.guo@linaro.org>
 <20211202122122.23548-4-shawn.guo@linaro.org>
 <87wnkikqve.wl-maz@kernel.org>
 <20211206131530.GN10105@dragon>
 <87wnkh26ar.wl-maz@kernel.org>
 <20211207094835.GO10105@dragon>
 <87mtlc1zzz.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtlc1zzz.wl-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 07, 2021 at 10:16:32AM +0000, Marc Zyngier wrote:
> On Tue, 07 Dec 2021 09:48:36 +0000,
> Shawn Guo <shawn.guo@linaro.org> wrote:
> > 
> > On Mon, Dec 06, 2021 at 01:48:12PM +0000, Marc Zyngier wrote:
> > > > > > +static int qcom_mpm_enter_sleep(struct qcom_mpm_priv *priv)
> > > > > > +{
> > > > > > +	int i, ret;
> > > > > > +
> > > > > > +	for (i = 0; i < priv->reg_stride; i++)
> > > > > > +		qcom_mpm_write(priv, MPM_REG_STATUS, i, 0);
> > > > > > +
> > > > > > +	/* Notify RPM to write vMPM into HW */
> > > > > 
> > > > > What do you mean by 'into HW'? We just did that, right? or are these
> > > > > registers just fake and most of the stuff is in the RPM?
> > > > 
> > > > I have a note about this in commit log.
> > > > 
> > > > - All the register settings are done by APSS on an internal memory
> > > >   region called vMPM, and RPM will flush them into hardware after it
> > > >   receives a mailbox/IPC notification from APSS.
> > > > 
> > > > So yes, these registers are fake/virtual in memory, and RPM will
> > > > actually flush the values into the MPM hardware block.
> > > 
> > > Then why are you using MMIO accessors all over the place if this is
> > > just RAM? Who *owns* this memory? Is it normal DRAM? Or some flops
> > > exposed by a device? Why isn't the state simply communicated over the
> > > mailbox instead?
> > 
> > It's a piece of internal memory (SRAM) which can be access by AP and
> > RPM.  The communication mechanism is defined by SoC/RPM design, and we
> > can do nothing but following the procedure.
> 
> Then the procedure needs to be documented:

Maulik, I'm trying my best to answer Marc's questions based on my
limited knowledges about the hardware.  Please clarify if there is
anything incorrect.

> - Who owns the memory at any given time?

The memory is owned by APSS when system is awake, and owned by RPM when
APSS gets power collapsed.  RPM is on the always-on domain and will be
managing resources and monitoring wake-up interrupts during sleep, with
the help of MPM.  MPM is not a core/master but a hardware
controller/block.

> - What are the events that trigger a change of ownership?

When APSS is about to get power collapsed, it sends a mailbox
notification to RPM, and RPM will take the ownership.  And when APSS is
woken up by a MPM pin/interrupt, APSS takes back the ownership.

> - What are the messages exchanged between these entities?

The messages exchanged are documented as "vMPM register layout" in the
beginning of the driver.  Basically, they are values of MPM registers
related to wake-up interrupt configurations, which will be directly
dumped into physical MPM registers by RPM, when RPM gets the ownership.
On wake-up, RPM will copy STATUS registers into vMPM memory and return
the ownership back to APSS.

> - What is the synchronisation mechanism between the various processing
>   entities (MPM. RPM, APSS...)?

A hardware IPC/mailbox channel is being used by APSS to tell RPM to take
over the ownership.  On wake-up, the wake-up event itself would be the
synchronisation.

> - Is the per-interrupt tracking a HW requirement or a SW
>   implementation choice? Could this instead be a one-shot operation
>   iterating over the whole state?

I do not quite sure what "per-interrupt tracking" means.  The HW
requirement is just that, when RPM takes the ownership of vMPM memory
region, the memory contains the MPM register values, that RPM can
directly dump into MPM registers.

> All this needs to be explained so that it is maintainable, because I'm
> getting tired of drivers that mimic the QC downstream code without
> justification nor documentation to support the implementation.

I really appreciate all your review comments and questions which are
driving for good and maintainable code!

Shawn 
