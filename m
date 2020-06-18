Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391ED1FF856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 17:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729227AbgFRP6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 11:58:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:59054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729225AbgFRP6b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 11:58:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF90F20732;
        Thu, 18 Jun 2020 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592495911;
        bh=+KZmL52GIm7EihsT05Q49pyQj6KTBxyDgCq04pwK7Sc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=slS5eq2eelDBTkTN+YE2koLjJkA1T4jOn/J3pc6Nhbp+B+9CaSiptkj9cRfkRkQ0X
         NdxAnrzSCZEjX3M7q5js+8XrRroVek9+HThygE7TBaIK7VwpoTjpNJlP3hlQeV/GT5
         GfWM9YsGTi4yBkUvXX3YY7zuWnboCdl/2RtzPwkk=
Date:   Thu, 18 Jun 2020 17:58:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Kaehlcke <mka@chromium.org>
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
Message-ID: <20200618155820.GA3076467@kroah.com>
References: <1591123192-565-1-git-send-email-sanm@codeaurora.org>
 <20200618081443.GA1043700@kroah.com>
 <20200618154555.GD4525@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618154555.GD4525@google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 18, 2020 at 08:45:55AM -0700, Matthias Kaehlcke wrote:
> Hi Greg,
> 
> On Thu, Jun 18, 2020 at 10:14:43AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jun 03, 2020 at 12:09:52AM +0530, Sandeep Maheswaram wrote:
> > > Export the symbol device_is_bound so that it can be used by the modules.
> > 
> > What modules need this?
> 
> drivers/usb/dwc3/dwc3-qcom.c (and probably other dwc3 'wrappers').

Why wasn't that said here?  No context is not good :(

> Short summary: QCOM dwc3 support is split in two drivers, the core dwc3
> driver and the QCOM specific parts. dwc3-qcom is probed first (through
> a DT entry or ACPI), dwc3_qcom_probe() then calls of_platform_populate()
> to probe the core part. After a successful return from _populate() the
> driver assumes that the core device is fully initialized. However the
> latter is not correct, the driver core doesn't propagate errors from
> probe() to platform_populate(). The dwc3-qcom driver would use
> device_is_bound() to make sure the core device was probed successfully.

why does the dwc3-qcom driver care?

And why is the driver split in a way that requires such "broken"
structures?  Why can't that be fixed instead?

thanks,

greg k-h
