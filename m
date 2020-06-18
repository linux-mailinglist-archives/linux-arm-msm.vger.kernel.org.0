Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2951FF9BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 18:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732022AbgFRQvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 12:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728703AbgFRQvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 12:51:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC0FC0613EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 09:51:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 64so3025826pfv.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ysQewDSw9pjMrTYmtr4DIZRhQJEHELerRdzz4gWr0zI=;
        b=Isl79jUuGROnOJxWpzGM1yzagFHHGRUUAOks6EttsjO63UiTCwl1X+56UA8ZYoWyy5
         5UgmnnO23gbW/Z/39XIaXrdFzWifiW6dMdwwTlzrYEM5DSXiQzLfx6AoM4oCwb2p6a17
         rlyGtTTzPmr4wAwf3s/p2fkaKVmMC9vKpvVig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ysQewDSw9pjMrTYmtr4DIZRhQJEHELerRdzz4gWr0zI=;
        b=RPtS7gLejOcv0OQEUHvzPKb17JtIOLEaVAxJwqDnE4rbKfauj8rwjC7x5dE6IAHZ6R
         MIjIoonkvFvgTXM4u3nfQpTrE5KPPSUPSodE5InE55PMEuW5hz8FaVrsUDh17clIpNv3
         //n8wRxBoUyZZSlxm5G1AdYjbCUJNXNZF5rhFs7YcMLZsiSGbNGj0F8zvlZRg0eXs5B8
         Y7HFJPL1VLLQ9zj1dJdkDaQgjlDYHTuG5EqiChmBndKTw8KZadEGMvW+1C7Zj//4o3tS
         MjLNHIyTcMQKjsVRn2TPdd+seCi0cd7Jmgcm9AzLN0T7UBm/P8i13Ea1ZXZggG5mnXL7
         vqxw==
X-Gm-Message-State: AOAM532jQ/oD7yr8Z8LbxhMQ//D8jjSlz/pQooRLETq3NEFnELCPGW7H
        6Gjh2Ez/V8tCbqstASQ67QyGxw==
X-Google-Smtp-Source: ABdhPJzL9RB7aKjHDGDCcpAUdTwKeWdNUobj7fic0ZPFWMk6a2ICKZMgXeYMIfXfiYPbzW3PfMxaAA==
X-Received: by 2002:a63:7453:: with SMTP id e19mr4059548pgn.450.1592499113560;
        Thu, 18 Jun 2020 09:51:53 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y7sm3090742pjm.54.2020.06.18.09.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 09:51:52 -0700 (PDT)
Date:   Thu, 18 Jun 2020 09:51:51 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH] driver core:Export the symbol device_is_bound
Message-ID: <20200618165151.GE4525@google.com>
References: <1591123192-565-1-git-send-email-sanm@codeaurora.org>
 <20200618081443.GA1043700@kroah.com>
 <20200618154555.GD4525@google.com>
 <20200618155820.GA3076467@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200618155820.GA3076467@kroah.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 18, 2020 at 05:58:20PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 18, 2020 at 08:45:55AM -0700, Matthias Kaehlcke wrote:
> > Hi Greg,
> > 
> > On Thu, Jun 18, 2020 at 10:14:43AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Jun 03, 2020 at 12:09:52AM +0530, Sandeep Maheswaram wrote:
> > > > Export the symbol device_is_bound so that it can be used by the modules.
> > > 
> > > What modules need this?
> > 
> > drivers/usb/dwc3/dwc3-qcom.c (and probably other dwc3 'wrappers').
> 
> Why wasn't that said here?  No context is not good :(

Agreed, this patch should probably have been part of a series to establish
the context.

> > Short summary: QCOM dwc3 support is split in two drivers, the core dwc3
> > driver and the QCOM specific parts. dwc3-qcom is probed first (through
> > a DT entry or ACPI), dwc3_qcom_probe() then calls of_platform_populate()
> > to probe the core part. After a successful return from _populate() the
> > driver assumes that the core device is fully initialized. However the
> > latter is not correct, the driver core doesn't propagate errors from
> > probe() to platform_populate(). The dwc3-qcom driver would use
> > device_is_bound() to make sure the core device was probed successfully.
> 
> why does the dwc3-qcom driver care?

Currently the dwc3-qcom driver uses the core device to determine if the
controller is used in peripheral mode and it runtime resumes the XHCI
device when it sees a wakeup interrupt.

The WIP patch to add interconnect support relies on the core driver
to determine the max speed of the controller.

> And why is the driver split in a way that requires such "broken"
> structures?  Why can't that be fixed instead?

It seems determining the mode could be easily changed by getting it through
the pdev, as in st_dwc3_probe(). Not sure about the other two parts,
determining the maximum speed can involve evaluating hardware registers,
which currently are 'owned' by the core driver.

Manu or Sandeep who know the hardware and the driver better than me might
have ideas on how to improve things.
