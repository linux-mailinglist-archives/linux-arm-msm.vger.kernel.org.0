Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABFF2099CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 08:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389998AbgFYGXf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 02:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389859AbgFYGXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 02:23:35 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D73DC0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 23:23:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j1so2570155pfe.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 23:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/l5lZUAwAOiLrNXEv1gvSMAQqUbQiJYKCiZiNEaYUM8=;
        b=U0hJmRHWVGxpMRi8vUYCo71xeUUnavayuQF7tn8jVEa5OmqrLq0l8OCVSkL4Dfl+v8
         dCv8RrNBQSSLW2Kluh2RQ7/4qOe7ruDjrfo2MbTZSs6ai2a9Od2OouoWgYFX/0uQI0Tw
         ww8sIZ4UKYuXN9wnsQ5H0ikJqIZLCnfSkGK+wJtI2cYbXUqLWCU6iRFetUK4GM4gWmlr
         3VDSdfqHN4ngxdlffOyDZKFG7I3rdXwJrHbyAttp5SW7APOM8/KZTCa9F9H8SkUzvtwv
         yOu+8Sf5kEfz+U95YblnReoeMblfWBA5vmlTWN/yFt94TWCxTPP93GSGAPXQxvXC7ZBh
         rE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/l5lZUAwAOiLrNXEv1gvSMAQqUbQiJYKCiZiNEaYUM8=;
        b=hKoFzSmkadh/fFq/YUFvtCquXUcTilwumvOUkeUoOjtp9GVKKPdIkSPzPUHth7jgJH
         6HwbS5Vo4YO5O2NtluPGQTkDI1GwfohE82k+y8wSueMZjbDSpbB67wN4vYlKzZECIfeH
         OhICm+x31W1Ek2KJ0FRuggIlNpw6F2a0flyTl8J5VWZqdVumRl+8m4l6R1a7X+8m8LKV
         AsIf+hMFm/VKDeyR588GnChCY0D6UvXs16BNWoP4GAeY/P3bR9dzAZ3suR30LutzsEIb
         /A9klviaP9QfiFPPwDRaYx608Cj1ZUuMWF7rPB1Ahd1UBZgTitlBv48omjY7BcmsVwJl
         jo2A==
X-Gm-Message-State: AOAM531qkgcg0boVZm7djDM33SDObXr84lp2Dyep2A6Qhve8wLFZUlDG
        bHkNfUu1S43lQFNR29ZqCFslFd9+1Q==
X-Google-Smtp-Source: ABdhPJzWDZNU4b7m/1RZxdo/B/wqAes/B5eEk3KQ8pd3S3r5nMg/dgAmTM438eteq25dwOTXwJa8Og==
X-Received: by 2002:a63:d208:: with SMTP id a8mr24550351pgg.351.1593066214532;
        Wed, 24 Jun 2020 23:23:34 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id y12sm22058672pfm.158.2020.06.24.23.23.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 23:23:33 -0700 (PDT)
Date:   Thu, 25 Jun 2020 11:53:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v3 3/4] docs: Add documentation for user space client
 interface
Message-ID: <20200625062327.GA6965@Mani-XPS-13-9360>
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
 <1591899224-3403-4-git-send-email-hemantk@codeaurora.org>
 <20200619063948.GC3245@Mani-XPS-13-9360>
 <7b64f78e-40c7-7c65-3832-4bbc5da93674@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b64f78e-40c7-7c65-3832-4bbc5da93674@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 24, 2020 at 06:52:20PM -0700, Hemant Kumar wrote:
> Hi Mani,
> 
> On 6/18/20 11:39 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jun 11, 2020 at 11:13:43AM -0700, Hemant Kumar wrote:
> > > MHI user space client driver is creating device file node
> > > for user application to perform file operations. File
> > > operations are handled by MHI core driver. Currently
> > > Loopback MHI channel is supported by this driver.
> > > 
> > > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > > ---
> > >   Documentation/mhi/index.rst |  1 +
> > >   Documentation/mhi/uci.rst   | 19 +++++++++++++++++++
> > >   2 files changed, 20 insertions(+)
> > >   create mode 100644 Documentation/mhi/uci.rst
> > > 
> > > diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
> > > index 1d8dec3..c75a371 100644
> > > --- a/Documentation/mhi/index.rst
> > > +++ b/Documentation/mhi/index.rst
> > > @@ -9,6 +9,7 @@ MHI
> > >      mhi
> > >      topology
> > > +   uci
> > >   .. only::  subproject and html
> > > diff --git a/Documentation/mhi/uci.rst b/Documentation/mhi/uci.rst
> > > new file mode 100644
> > > index 0000000..a5c5c4f
> > > --- /dev/null
> > > +++ b/Documentation/mhi/uci.rst
> > > @@ -0,0 +1,19 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=================================
> > > +User space Client Interface (UCI)
> > 
> > Stick to 'Userspace' everywhere.
> Done.
> > 
> > > +=================================
> > > +
> > > +UCI driver enables user space clients to communicate to external MHI devices
> > > +like modem and WLAN. It creates standard character device file nodes for user
> > 
> > UCI driver creates a single char device, isn't it?
> No, it is created per device name. For example Loopback has its own char
> device file node. if we add another channel for a new mhi device new device
> file node would be created.

Okay, then please add a line saying that there will be separate chardev nodes
for each channel specified.

> > 
> > > +space clients to perform open, read, write, pool and close file operations.
> > > +
> > 
> > poll? Btw, you need to mention explicitly how this char device can be used.
> > You are just mentioning standard file operations.
> Will fix poll.My idea was indeed to mention generic file operations so that
> we dont have to be specific with use case. Any userspace entity who wants to
> communicate over mhi can use the driver. Reason we have this driver is to
> abstract the mhi core specific details. Even for loopback use case,
> userspace can echo to device file node on one channel and get a same in
> response from another channel back. I can add more examples of
> other user space drivers use case if that helps.

Yes, just add couple of examples.

> > 
> > > +Device file node is created with format:-
> > > +
> > > +/dev/mhi_<controller_name>_<mhi_device_name>
> > > +
> > > +controller_name is the name of underlying bus used to transfer data.
> > 
> > underlying controller instance.
> Done.
> > 
> > > +mhi_device_name is the name of the MHI channel being used by MHI client
> > 
> > What do you mean by MHI client here? Are you referring to userspace client?
> yes. i can say "MHI client in userspace"?

Okay. The naming conventions used in MHI are a bit weird. So from the start
itself I stuck with some fixed names and client is one of them. The term client
itself refers to both client device and a driver used to talk to the device in
the host. So we should explicitly mention if it is a userspace client driver
or the client device.

Thanks,
Mani

> > 
> > > +to send or receive data using MHI protocol. MHI channels are statically
> > > +defined by MHI specification. Driver currently supports LOOPBACK channel
> > > +index 0 (Host to device) and 1 (Device to Host).
> > 
> > s/index/identifier
> Done.
> > 
> > And explain a bit on how this LOOPBACK channel is getting used.
> Done.
> > 
> > Thanks,
> > Mani
> > 
> > > -- 
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > > 
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
