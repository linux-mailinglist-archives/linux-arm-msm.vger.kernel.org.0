Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E851C30B66B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 05:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhBBEW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 23:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbhBBEWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 23:22:53 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26A9C061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Feb 2021 20:22:13 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id m6so13497214pfk.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Feb 2021 20:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OnQNkjd4mkQ0QEf+L9w3boF0r8eBsim5MI3JySRYCIY=;
        b=IgxxB1ECYY6bdi3/vyvUj+1qNPMZSm6A3LWV3SzdJaVmt5wIEhpD0GZ19hPybannd4
         F0QNDL78kipKtbyieGWmYhPAZjTvmK/TETYFpBQMIChPgFzX/mnGevZi+Nku/flyzs0O
         BS9ZPfogMkuiYW+w+TBw8ULTNclfRqaTctWGTh5F486pI68hOPDwrYBVmJbSL/kyzLl7
         2qG320B/vQvbIdPja8iz3DGTkXk2a5ckoilKAXeffpzuX+o5TTZ4c/Nk4BZKXUmtZONm
         3sfYoqeQdJPMqDb3WeNIMwpy5hAprYh5S5riFIgJ/3Q37PEJYSQJECedK0lTJDFfwTcQ
         ly3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OnQNkjd4mkQ0QEf+L9w3boF0r8eBsim5MI3JySRYCIY=;
        b=nRlLKxkiYv0NMnJ8UEVAxAiBBq2vIZvnoQL/RL6GVyh7U1E8+Eq4C8eLQuK8SWtS2D
         4qQxb1EINUC5VqEE4cCQ7uYscr3WROyDuteaoRKQz05+oMh6BV8t4Ivc6X2snJpJbUbp
         ilZhtfpxUUrpBKMGY0LBZbvZCoTDgOExMXb40GrDdJFjSzE2jg0QhkWGZaEQO9K91uk0
         /ETWutURp+QTdR3TSwAuZLPMJwtpX+L2eeYYBI9jdU22FcYsuRdkBHu6XACgq9734xa3
         7j5BRlO4etm4mQSLUs3ZzLmmrh6ZaqvllqAOUdY76RQ4PlKtvXAAkTdWgqQUJJOlIioD
         hUMg==
X-Gm-Message-State: AOAM5311ed0KhWxz5c4GCq/JhGAYvKJ2hXu0aB3qzZLrQaNqOByHLtng
        m0OBg0FfH5ENWwFGOnVeGRMz
X-Google-Smtp-Source: ABdhPJxRDatZuxShf8dlB06+K8ASIaZrRN6JhfmDDLfhQjs8wFb5RXC92dCMPI7kn+QvQwOyshYHMA==
X-Received: by 2002:aa7:9f95:0:b029:1be:aeed:9672 with SMTP id z21-20020aa79f950000b02901beaeed9672mr19960994pfr.54.1612239733159;
        Mon, 01 Feb 2021 20:22:13 -0800 (PST)
Received: from work ([103.77.37.138])
        by smtp.gmail.com with ESMTPSA id 14sm20011747pfy.55.2021.02.01.20.22.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 20:22:12 -0800 (PST)
Date:   Tue, 2 Feb 2021 09:52:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>, kuba@kernel.org,
        davem@davemloft.net
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, netdev@vger.kernel.org
Subject: Re: [RESEND PATCH v18 0/3] userspace MHI client interface driver
Message-ID: <20210202042208.GB840@work>
References: <1609958656-15064-1-git-send-email-hemantk@codeaurora.org>
 <20210113152625.GB30246@work>
 <YBGDng3VhE1Yw6zt@kroah.com>
 <20210201105549.GB108653@thinkpad>
 <YBfi573Bdfxy0GBt@kroah.com>
 <20210201121322.GC108653@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201121322.GC108653@thinkpad>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Jakub, Dave

On Mon, Feb 01, 2021 at 05:43:22PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Feb 01, 2021 at 12:15:51PM +0100, Greg KH wrote:
> > On Mon, Feb 01, 2021 at 04:25:49PM +0530, Manivannan Sadhasivam wrote:
> > > Hi Greg,
> > > 
> > > On Wed, Jan 27, 2021 at 04:15:42PM +0100, Greg KH wrote:
> > > > On Wed, Jan 13, 2021 at 08:56:25PM +0530, Manivannan Sadhasivam wrote:
> > > > > Hi Greg,
> > > > > 
> > > > > On Wed, Jan 06, 2021 at 10:44:13AM -0800, Hemant Kumar wrote:
> > > > > > This patch series adds support for UCI driver. UCI driver enables userspace
> > > > > > clients to communicate to external MHI devices like modem. UCI driver probe
> > > > > > creates standard character device file nodes for userspace clients to
> > > > > > perform open, read, write, poll and release file operations. These file
> > > > > > operations call MHI core layer APIs to perform data transfer using MHI bus
> > > > > > to communicate with MHI device. 
> > > > > > 
> > > > > > This interface allows exposing modem control channel(s) such as QMI, MBIM,
> > > > > > or AT commands to userspace which can be used to configure the modem using
> > > > > > tools such as libqmi, ModemManager, minicom (for AT), etc over MHI. This is
> > > > > > required as there are no kernel APIs to access modem control path for device
> > > > > > configuration. Data path transporting the network payload (IP), however, is
> > > > > > routed to the Linux network via the mhi-net driver. Currently driver supports
> > > > > > QMI channel. libqmi is userspace MHI client which communicates to a QMI
> > > > > > service using QMI channel. Please refer to
> > > > > > https://www.freedesktop.org/wiki/Software/libqmi/ for additional information
> > > > > > on libqmi.
> > > > > > 
> > > > > > Patch is tested using arm64 and x86 based platform.
> > > > > > 
> > > > > 
> > > > > This series looks good to me and I'd like to merge it into mhi-next. You
> > > > > shared your reviews on the previous revisions, so I'd like to get your
> > > > > opinion first.
> > > > 
> > > > If you get the networking people to give you an ack on this, it's fine
> > > > with me.
> > > > 
> > > 
> > > As discussed in previous iteration, this series is not belonging to networking
> > > subsystem. The functionality provided by this series allows us to configure the
> > > modem over MHI bus and the rest of the networking stuff happens over the
> > > networking subsystem as usual.
> > 
> > Great, then it should be easy to get their acceptance :)
> > 
> > > This holds the same with USB and serial modems which we are having over decades
> > > in mainline.
> > 
> > I don't see the connection here, sorry.
> > 
> 
> For instance USB_NET_CDC_MBIM driver creates the /dev/cdc-wdmX chardev node for
> configuring the modems which supports MBIM protocol over USB. Like that, this
> driver creates /dev/mhiX_MBIM chardev node for configuring the modem over MHI
> bus instead of USB. The question arised why we are creating a chardev node for
> each supported configuration (channels in the case of MHI) and why can't we use
> the existing /dev/cdc-wdmZ interfaces? The anwser is there is no standard
> subsystem for WWAN and all the drivers represent a chardev which gets used by
> the userspace tools such a Network manager for establishing connection.
> 
> And /dev/cdc-wdmX is restricted to the USB CDC devices.
> 
> Hope this clarifies!
> 

Jakub, Dave, Adding you both to get your reviews on this series. I've
provided an explanation above and in the previous iteration [1].

Thanks,
Mani

[1] https://lkml.org/lkml/2020/12/12/16

> Thanks,
> Mani
> 
> > thanks,
> > 
> > greg k-h
