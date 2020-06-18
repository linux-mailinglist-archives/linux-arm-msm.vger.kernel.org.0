Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C531FFA55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 19:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbgFRReC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 13:34:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:51222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728384AbgFRReB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 13:34:01 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33A4D20CC7;
        Thu, 18 Jun 2020 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592501641;
        bh=7bAYDoSOKsBXo7n+wl8FVmIDDBqoaqP8Khk8lB2kWbw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IsVqhHWvB+5h5r2AmLQfAAPGjIwHflWGk9qU0oGIBdUY39MQAAvYb63cEqW/DbA7i
         PwtopF2osGqrc6slvKKcFEO2iDgSBydUV0yezMnwA97T2c2twNAKlVlAfsuQean/Nj
         uzgCBhmYsOlL1BBWc+d9HWmOaBcXzH+kGg+1lTJs=
Received: by mail-ot1-f42.google.com with SMTP id m2so5152992otr.12;
        Thu, 18 Jun 2020 10:34:01 -0700 (PDT)
X-Gm-Message-State: AOAM531820zNfHIJGb1fh/OnrRVy/ES95lkYuJt1tD5fnB1sNwsPcyE1
        yppRv3VzcHrJ6+X2o4bZkoVYrF8QNBLtZgsmlA==
X-Google-Smtp-Source: ABdhPJznBot1zRIf3mT//QAyCMg0HJbDF/5FGHU2eV3Y2WUSQryP8tTu3KPxwVMnn5BGgo6zOJop1+ZTJc4C4J62cVM=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr4268091otr.107.1592501640510;
 Thu, 18 Jun 2020 10:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <1591123192-565-1-git-send-email-sanm@codeaurora.org>
 <20200618081443.GA1043700@kroah.com> <20200618154555.GD4525@google.com>
 <20200618155820.GA3076467@kroah.com> <20200618165151.GE4525@google.com>
In-Reply-To: <20200618165151.GE4525@google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 18 Jun 2020 11:33:49 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+5NCvvpKd-69QvgqK6wzbc53=MTt-TcVop23hjT6Rs_g@mail.gmail.com>
Message-ID: <CAL_Jsq+5NCvvpKd-69QvgqK6wzbc53=MTt-TcVop23hjT6Rs_g@mail.gmail.com>
Subject: Re: [PATCH] driver core:Export the symbol device_is_bound
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 18, 2020 at 10:51 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Thu, Jun 18, 2020 at 05:58:20PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Jun 18, 2020 at 08:45:55AM -0700, Matthias Kaehlcke wrote:
> > > Hi Greg,
> > >
> > > On Thu, Jun 18, 2020 at 10:14:43AM +0200, Greg Kroah-Hartman wrote:
> > > > On Wed, Jun 03, 2020 at 12:09:52AM +0530, Sandeep Maheswaram wrote:
> > > > > Export the symbol device_is_bound so that it can be used by the modules.
> > > >
> > > > What modules need this?
> > >
> > > drivers/usb/dwc3/dwc3-qcom.c (and probably other dwc3 'wrappers').
> >
> > Why wasn't that said here?  No context is not good :(
>
> Agreed, this patch should probably have been part of a series to establish
> the context.
>
> > > Short summary: QCOM dwc3 support is split in two drivers, the core dwc3
> > > driver and the QCOM specific parts. dwc3-qcom is probed first (through
> > > a DT entry or ACPI), dwc3_qcom_probe() then calls of_platform_populate()
> > > to probe the core part. After a successful return from _populate() the
> > > driver assumes that the core device is fully initialized. However the
> > > latter is not correct, the driver core doesn't propagate errors from
> > > probe() to platform_populate(). The dwc3-qcom driver would use
> > > device_is_bound() to make sure the core device was probed successfully.
> >
> > why does the dwc3-qcom driver care?
>
> Currently the dwc3-qcom driver uses the core device to determine if the
> controller is used in peripheral mode and it runtime resumes the XHCI
> device when it sees a wakeup interrupt.
>
> The WIP patch to add interconnect support relies on the core driver
> to determine the max speed of the controller.
>
> > And why is the driver split in a way that requires such "broken"
> > structures?  Why can't that be fixed instead?
>
> It seems determining the mode could be easily changed by getting it through
> the pdev, as in st_dwc3_probe(). Not sure about the other two parts,
> determining the maximum speed can involve evaluating hardware registers,
> which currently are 'owned' by the core driver.
>
> Manu or Sandeep who know the hardware and the driver better than me might
> have ideas on how to improve things.

We never should have had this split either in the DT binding nor
driver(s) as if the SoC wrapper crap and licensed IP block are
independent things. The thing to do here is either make the DWC3 code
a library which drivers call (e.g. SDHCI) or add hooks into the DWC3
driver for platform specifics (e.g. Designware PCI). Neither is a
simple solution though.

Rob
