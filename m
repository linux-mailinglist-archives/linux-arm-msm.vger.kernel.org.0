Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1F81F4084
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 18:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgFIQTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 12:19:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:40380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgFIQTH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 12:19:07 -0400
Received: from localhost (unknown [122.171.156.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA8DC20774;
        Tue,  9 Jun 2020 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591719547;
        bh=rvAHvEibYz1tZdQIA/llKxglupAm3AZPm3CtQ+GmM/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FdoAj2OTopFQLxflu9h3hiqwerW2jivX6kpyV1x6Po4yqJnoJ6otofXs0/ayMvUGG
         Gli4HUPBGzNsHxgfvEuCuTx6E4ZcfAaK44dt1qfKnljwiFRnwMORyM0oWP2mkLBDK9
         hmnc06FkZ1h3DdrwWYUu7P8PaBrb3KgnlnbN8XiU=
Date:   Tue, 9 Jun 2020 21:49:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v7 3/3] ARM: dts: qcom: ipq4019: add USB devicetree nodes
Message-ID: <20200609161903.GE1084979@vkoul-mobl>
References: <20200503201823.531757-1-robert.marko@sartura.hr>
 <20200503201823.531757-3-robert.marko@sartura.hr>
 <20200504073914.GQ1375924@vkoul-mobl>
 <CA+HBbNEiB+o4KxonAu4-ra+P11Yb649v6AFaPjFc8JQDQ8T=CA@mail.gmail.com>
 <CA+HBbNFsZ-v_2cMhDNGnQXTFaqsjGzB+1rAS3=_CLQhd0N4OKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNFsZ-v_2cMhDNGnQXTFaqsjGzB+1rAS3=_CLQhd0N4OKQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robert,

On 09-06-20, 16:45, Robert Marko wrote:
> HI,
> Vinod can you maybe pick this?

Sorry can't do.. this needs to go thru Bjorn..

We are in merge window so it is too late for that.
Bjorn can pick this for 5.9...

> 
> It would be great to have nodes in 5.8 along the driver
> 
> Thank
> Robert
> 
> On Fri, May 29, 2020 at 11:36 AM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > On Mon, May 4, 2020 at 9:39 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 03-05-20, 22:18, Robert Marko wrote:
> > > > From: John Crispin <john@phrozen.org>
> > > >
> > > > Since we now have driver for the USB PHY, lets add the necessary nodes to DTSI.
> > >
> > > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > >
> > > Bjorn, I have picked the phy and dt binding, feel free to apply this one
> > >
> > > Thanks
> > > --
> > > ~Vinod
> >
> > Any chance of this landing into 5.7?
> > Driver and bindings have been merged, but I don't see DT nodes queued.
> >
> > Regards,
> > Robert

-- 
~Vinod
