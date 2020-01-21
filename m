Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8EDE143739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 07:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgAUGqO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 01:46:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:54080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgAUGqO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 01:46:14 -0500
Received: from localhost (unknown [171.76.119.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D63221734;
        Tue, 21 Jan 2020 06:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579589173;
        bh=5lyKz2WJ66jauwJC9zB1qdVzSeZVINSbDiBMl95z2Vg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jyusqERheasz+lFPzj8XPdjRzmL2K/rflgqSZd7Ce/1VQchUJvGzwoUC3g7ZMTWdV
         uvC/2I9IIEmELOA2cSxVVQeVxchtNN+29wzPKWjMdj6tiOD4Nsm9CH02V/5bnSOfuc
         twKgIBHY0tgz6uHQx+TxZMQc/XSC/REWWEzEyIbE=
Date:   Tue, 21 Jan 2020 12:16:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20200121064608.GA2841@vkoul-mobl>
References: <20200113084005.849071-1-vkoul@kernel.org>
 <CANcMJZC1w+J=cdp0OiR5XDn9fFSPht70Jaf9F5S5BryFxVXVoQ@mail.gmail.com>
 <CAAd0S9Aaw8G+=EivfC-g4Lt3Xf_kpjFh6WwQk2E8pFxJUmteKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd0S9Aaw8G+=EivfC-g4Lt3Xf_kpjFh6WwQk2E8pFxJUmteKQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

hey Christian,

On 13-01-20, 21:33, Christian Lamparter wrote:
> On Mon, Jan 13, 2020 at 9:10 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > > These require firmware to be loaded and in case devices have ROM those can
> > > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > >
> > > This includes two patches from Christian which supported these controllers
> > > w/o ROM and later my patches for ROM support and multiple firmware versions,
> > > debugfs hook for rom erase and export of xhci-pci functions.
> > >
> >
> > Thanks so much for updating these! They are working ok for me in my
> > testing on db845c.
> >
> > Tested-by: John Stultz <john.stultz@linaro.org>
> 
> Nice! I'll definitely give this series another try on my WNDR4700 too
> (PowerPC Arch)
> this weekend.
> 
> and from me: Thanks!

Did you get around to test these?

-- 
~Vinod
