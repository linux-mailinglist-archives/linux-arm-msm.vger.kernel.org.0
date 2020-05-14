Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B21E1D2EA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgENLqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:46:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:36282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbgENLqR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:46:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C8CF20671;
        Thu, 14 May 2020 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589456776;
        bh=UtLC4FWAsNQWwvCkA9XvZziuOBZQynG4YRxwXmBREJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VpUXVPsjb6XXHHj8Jd5OYhOJjs7MFOWwmYR1ninaO5RdEQysSTdrsQnGrzQNlVeOn
         HG3jBh/tByOyLl2yHY4zpwz8hSKJ7L3p67eKfExi1BX2R/cIjAMxhXPR6RA68UJdBk
         UQyejP/bee3FZ201AfCKnIhMb6w5i27Gi37Uxq/0=
Date:   Thu, 14 May 2020 13:46:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 5/5] usb: xhci: provide a debugfs hook for erasing rom
Message-ID: <20200514114614.GA1893226@kroah.com>
References: <20200506060025.1535960-1-vkoul@kernel.org>
 <20200506060025.1535960-6-vkoul@kernel.org>
 <caa2c5f4-a858-d699-27af-7b0c22b4dc40@linux.intel.com>
 <20200513124554.GA1083139@kroah.com>
 <20200514092458.GA1591384@kroah.com>
 <20200514112618.GP14092@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514112618.GP14092@vkoul-mobl>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 04:56:18PM +0530, Vinod Koul wrote:
> On 14-05-20, 11:24, Greg Kroah-Hartman wrote:
> > On Wed, May 13, 2020 at 02:45:54PM +0200, Greg Kroah-Hartman wrote:
> 
> > > Ah, I misssed that, a follow-on patch can do this, right?
> > 
> > Actually, a whole new series with this changed is good, I didn't take
> > these for now, for some reason I thought I had.
> 
> Do you mind taking these except this patch (last). I will spin this
> later

Can you resend, they are not in my patch queue anymore.

thanks,

greg k-h
