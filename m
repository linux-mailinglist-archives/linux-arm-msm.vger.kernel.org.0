Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBA8134019
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 12:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgAHLRc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 06:17:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:55122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728045AbgAHLRc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 06:17:32 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F144320673;
        Wed,  8 Jan 2020 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578482251;
        bh=K5a1FOPcyRp0DCp/auw2go40HmDbbxw4Ibqe87jWEbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=THqQZPcVvjC+wUPF3+29t3zF6xnYfYeYidcDePpV7b32VACrK9oGbLXd/UyWldH9t
         tHrsowP1uTWquWgELlF37kxzuMxK1GRMcPT46tf5+Nxu9L+N4CxGNYaJCSEAmSq31E
         4F8KHd8A0ugKdG9epSYOsK+CeWK557snvitFzsZA=
Date:   Wed, 8 Jan 2020 07:24:36 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v5 0/4] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20200108062436.GA2276347@kroah.com>
References: <20191106083843.1718437-1-vkoul@kernel.org>
 <CANcMJZDqX6-+naGEbBiyM+1cZS6jfMoP9bm5Uk4ZuP_mw5aNWw@mail.gmail.com>
 <20200108040707.GU2818@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108040707.GU2818@vkoul-mobl>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 08, 2020 at 09:37:07AM +0530, Vinod Koul wrote:
> Hi John,
> 
> On 07-01-20, 11:51, John Stultz wrote:
> > On Wed, Nov 6, 2019 at 12:40 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > This series add support for Renesas USB controllers uPD720201 and uPD720202.
> > > These require firmware to be loaded and in case devices have ROM those can
> > > also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> > >
> > > This includes two patches from Christian which supported these controllers
> > > w/o ROM and later my patches for ROM support and multiple firmware versions.
> > >
> > 
> > Hey Vinod!
> >    In pushing this series to one of the Android trees for the db845c,
> > there was some concern raised that this series is adding a lot of
> > renesas specific logic to the more generic xhci-pci driver. There was
> > some question if instead that logic should be added to its own
> > file/module? Do you have any thoughts on this?
> 
> TBH I have not thought about that and in previous post neither Greg or
> Mathias gave a feedback that this was not acceptable...
> 
> We can think about splitting but apart from firmware load there is not
> much extra functionality that we need to add, the controller behaviour
> as a standard xhci-pci. So i am not sure if we gain much by splitting.
> 
> > Also, It seems there hasn't been much feedback on this for a few
> > months now. Is there a newer version of the patchset I should sync
> > with? Do you have plans to resubmit soon?
> 
> Well am still waiting for feedback :( I dont have any update on top of
> this, I can repost but I dont think that really serves a purpose.
> 
> I would really like to hear from Greg if this series is acceptable and
> if not what would he like to see changed.

Greg is not the xhci maintainer :)


