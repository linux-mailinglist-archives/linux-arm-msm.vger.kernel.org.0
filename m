Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A0830EC3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 06:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhBDFyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 00:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbhBDFyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 00:54:17 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25146C061786
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 21:53:37 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id j25so2624314oii.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 21:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NQEoj3DyDWokFAcyDU8p8YsOVdnIb4zToBI0nVhbNx4=;
        b=Jz31lhz8A3hydQGpprqs4dFv3Ba/suWBsbpVwkGUzi6czH5E4cSO/3df7DDS0j5m2E
         hMTfvqyMn4uq1rhC1fOzPVRrk4mmCy3btK3HxvX94VlKTi62eArHBut5GGHQziJMIcbc
         By8kXEsizJcvGAn0OhbAddR+r6mQTPtQHDFkPxRGgs7q3i7OYo7avwPAZ+CNBG6Zl/k3
         mdp9MoKF+EbtX+pvL9JJz2jI5EHFWIMW+tV5tPIO2oCI/46821pFo3I328qjEOBaSQeu
         0tKKwkKki0mElr+cMapQnHobwTic/N8vNe/InbbUnVu+DdFSUqHAMW8zwtNH162WWWGv
         w9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NQEoj3DyDWokFAcyDU8p8YsOVdnIb4zToBI0nVhbNx4=;
        b=iA+kjImra6nLTIuBl73n3SWebGR7fh7QgeipHfE7CcRUldujC4KLePmyB6pn+qeoRQ
         HWR8au/0ycM1lVG9Ddf1x6SehFQVuPYefOUrUEE0efRShWyFRFvEP30Kek1ngwFEuZ7Y
         S+xtUl4AgPuo0W90PSHfaC3DpilPI8ZgzfWB/D/NoYVEwg3Se8T61jg0Vy3OcAx+GPM7
         cknFscL6Saif32aViLxKXb9jI8m1e6PiQ3qAWeyH1kV2uv7TKOeJReqQA/gbTJuyZXVb
         hPVO0IUaoh0SL/b3HKbXKHO2EJxzweAB/Ardtdt5hsuCz+vBynWNEXsxilBnG1TQmb3U
         pjiw==
X-Gm-Message-State: AOAM531njQzsQZDJJEsobGMGCivTn3DoxB5HphKQ1Tq75unOc275MDVD
        icgmgq1G7NS6f40mLUduWZ4yBA==
X-Google-Smtp-Source: ABdhPJxCTqK2aD9g0iKF41lhpXvA8z5S60R5eiZqR/Y/4vjqoXIzwmTLzewljBXiMyUdnGjE5cDzsg==
X-Received: by 2002:aca:c60d:: with SMTP id w13mr4286563oif.26.1612418016593;
        Wed, 03 Feb 2021 21:53:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q195sm951787oic.15.2021.02.03.21.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 21:53:35 -0800 (PST)
Date:   Wed, 3 Feb 2021 23:53:33 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jakub Kicinski <kuba@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        David Miller <davem@davemloft.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Network Development <netdev@vger.kernel.org>
Subject: Re: [RESEND PATCH v18 0/3] userspace MHI client interface driver
Message-ID: <YBuL3bdxFmRwLtdo@builder.lan>
References: <YBGDng3VhE1Yw6zt@kroah.com>
 <20210201105549.GB108653@thinkpad>
 <YBfi573Bdfxy0GBt@kroah.com>
 <20210201121322.GC108653@thinkpad>
 <20210202042208.GB840@work>
 <20210202201008.274209f9@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <835B2E08-7B84-4A02-B82F-445467D69083@linaro.org>
 <20210203100508.1082f73e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMZdPi8o44RPTGcLSvP0nptmdUEmJWFO4HkCB_kjJvfPDgchhQ@mail.gmail.com>
 <20210203104028.62d41962@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203104028.62d41962@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 03 Feb 12:40 CST 2021, Jakub Kicinski wrote:

> On Wed, 3 Feb 2021 19:28:28 +0100 Loic Poulain wrote:
> > On Wed, 3 Feb 2021 at 19:05, Jakub Kicinski <kuba@kernel.org> wrote:
> > > On Wed, 03 Feb 2021 09:45:06 +0530 Manivannan Sadhasivam wrote:  
> > > > The current patchset only supports QMI channel so I'd request you to
> > > > review the chardev node created for it. The QMI chardev node created
> > > > will be unique for the MHI bus and the number of nodes depends on the
> > > > MHI controllers in the system (typically 1 but not limited).  
> > >
> > > If you want to add a MHI QMI driver, please write a QMI-only driver.
> > > This generic "userspace client interface" driver is a no go. Nobody will
> > > have the time and attention to police what you throw in there later.  
> > 
> > Think it should be seen as filtered userspace access to MHI bus
> > (filtered because not all channels are exposed), again it's not
> > specific to MHI, any bus in Linux offers that (i2c, spi, usb, serial,
> > etc...). It will not be specific to QMI, since we will also need it
> > for MBIM (modem control path), AT commands, and GPS (NMEA frames), all
> > these protocols are usually handled by userspace tools and not linked
> > to any internal Linux framework, so it would be better not having a
> > dedicated chardev for each of them.
> 
> The more people argue for this backdoor interface the more distrustful
> of it we'll become. Keep going at your own peril.

With things such as USBDEVFS, UIO, spi-dev and i2c-dev already exposing
various forms of hardware directly to userspace in an identical fashion,
can you please explain why you believe this would be inappropriate for
MHI devices?

Thanks,
Bjorn
