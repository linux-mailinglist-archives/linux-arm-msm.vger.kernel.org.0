Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5C73A28F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 12:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhFJKFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 06:05:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:45728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229937AbhFJKFl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 06:05:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B32E561184;
        Thu, 10 Jun 2021 10:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623319413;
        bh=P+4fvz19UNgFMuHYNnQV49m2+gIWnRhS7jOvbkcZJN8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KrvsjIRCSAcWUhGHZsaQxWkkek9ie2X9+zA6p3hyUTMVzhA1niySok8zBDqE7JoWR
         fPnfSMYxipx7db9LIEXNXMfOoR6gRQuU7zy0rw+rmWznVSgfEV0dEhmmH3//DcqTrm
         2HyNRRXTByBPhEyOuxejokiKFA3AcaDMa7jpvbis=
Date:   Thu, 10 Jun 2021 12:03:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
Message-ID: <YMHjctQsGttUJ1QJ@kroah.com>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com>
 <87k0n9btnb.fsf@kernel.org>
 <YLo6W5sKaXvy51eW@kroah.com>
 <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org>
 <874ke62i0v.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ke62i0v.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 10, 2021 at 12:20:00PM +0300, Felipe Balbi wrote:
> > As mentioned above, these changes are currently present on end user
> > devices for the past few years, so its been through a lot of testing :).
> 
> all with the same gadget driver. Also, who uses USB on android devices
> these days? Most of the data transfer goes via WiFi or Bluetooth, anyway
> :-)

I used to think that too, until I saw some of the new crazy designs
where lots of SoC connections internally to the device run on USB.  Also
look at the USB offload stuff as one example of how the voice sound path
goes through the USB controller on the SoC on the latest Samsung Galaxy
phones that are shipping now :(

There's also devices with the modem/network connection going over USB,
along with other device types as well.  Android Auto is crazy with
almost everything hooked up directly with a USB connection to the host
system running Linux.

> I guess only developers are using USB during development to flash dev
> images heh.

I wish, we are reaching the point where the stability of the overall
Android system depends on how well the USB controller works.  We are a
product of our success...

thanks,

greg k-h
