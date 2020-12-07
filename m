Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720942D12A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 14:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgLGNzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 08:55:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:53670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbgLGNzL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 08:55:11 -0500
Date:   Mon, 7 Dec 2020 14:55:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607349270;
        bh=RKKTuSyE3VLcEVuJMn517hFL2sJvSMPQLR1pCq6wI1c=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=OWllYt/v/LCcdhxJjxTp+RAn6OnZPK815Kso48vBa8+Bc+c7TF4msHv8aB9ngrA3n
         G1wivtVJ/QA7PcnxvfZTe6Iu34OEvV+iKBQDfNikVn4hFUNeEALc9cgOXvUXW+sika
         tXmMVXXOggKMWsxL5R1uOSfaJnbM4lt8PgwMvPzk=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, saravanak@google.com
Subject: Re: [PATCH 3/3] Serial: Separate out earlycon support
Message-ID: <X840XDgspqwuPt1C@kroah.com>
References: <1607330847-15522-1-git-send-email-akashast@codeaurora.org>
 <1607330847-15522-4-git-send-email-akashast@codeaurora.org>
 <X83x0BZmGYtQSMUU@kroah.com>
 <ab693e13-0478-5301-5ccb-9d8b1191afa1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab693e13-0478-5301-5ccb-9d8b1191afa1@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 07, 2020 at 05:52:32PM +0530, Akash Asthana wrote:
> Hi Greg,
> 
> On 12/7/2020 2:41 PM, Greg KH wrote:
> > On Mon, Dec 07, 2020 at 02:17:27PM +0530, Akash Asthana wrote:
> > > Separate out earlycon support from serial driver and remove it's
> > > dependency on QUP wrapper driver.
> > > 
> > > This enable us to manage earlycon independently and we can re-use the
> > > same earlycon driver for android project which currently uses
> > > downstream version of QUP drivers.
> > What do you mean by "downstream" here?
> > 
> > > Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> > > ---
> > >   drivers/tty/serial/Kconfig              |   9 +
> > >   drivers/tty/serial/Makefile             |   1 +
> > >   drivers/tty/serial/qcom_geni_earlycon.c | 649 ++++++++++++++++++++++++++++++++
> > >   drivers/tty/serial/qcom_geni_serial.c   |  97 -----
> > So you are replacing 97 lines of code with 649 lines?  How is this
> > benefiting anyone?
> > 
> > confused,
> 
> We have 2 versions of QUP driver, upstream version(Present in linus tree,
> mostly used for chromium project) and downstream version(belong to vendor
> part of code in GKI design, used for all the other project).

Why do you have 2 different versions?  Why not merge them both into the
kernel tree?  That seems like madness to try to support 2.  And why
would we care about any out-of-tree code?  This is increasing our
complexity for code that isn't even being merged here, not anything you
would do if you were the maintainer of it, right?

> There is need to enable geni earlycon in Google provided boot image for GKI
> to facilitate the debug until real console(belong to vendor code) is up.

Then submit the code for that here please.

> Currently it won't be possible because geni earlycon cannot be enabled
> independently, it depends on upstream QUP wrapper driver
> (soc/qcom/qcom-geni-se.c) and upstream serial
> driver(serial/qcom_geni_serial.c).
> 
> With this patch I am trying to break any dependency btw earlycon hook and
> QUP kernel drivers, so it can be managed independently.

Please submit the code that depends on this change, and we will be glad
to review it.

thanks,

greg k-h
