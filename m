Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C0E198D40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 09:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgCaHoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 03:44:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:58396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726397AbgCaHoF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 03:44:05 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C580206DB;
        Tue, 31 Mar 2020 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585640644;
        bh=gcID3GWYJF4NliAjI/RygRsNu+nFMEJc51AHKH/1rTo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ONQSHuUEmZ+odhOK6BHWTMjvoJJyQFhIkoDZb+4JR7DmTpAaX+uogyNRfTqsr7SFM
         iccP3zHdv6Bd5jRabUeqXtD1iADQvZpYV5NpZsBt974HT5Rx7z3OP/AaQwCaMy0G1P
         26nnVA/LXu6PVS9nsXxZFlNICiSvFelI+4PoLPZc=
Date:   Tue, 31 Mar 2020 08:44:00 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
Message-ID: <20200331074400.GB25612@willie-the-truck>
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
 <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
 <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
 <CAD=FV=WXTN6xxqtL6d6MHxG8Epuo6FSQERRPfnoSCskhjh1KeQ@mail.gmail.com>
 <890456524e2df548ba5d44752513a62c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <890456524e2df548ba5d44752513a62c@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 31, 2020 at 01:06:11PM +0530, Sai Prakash Ranjan wrote:
> On 2020-03-30 23:54, Doug Anderson wrote:
> > On Sat, Mar 28, 2020 at 12:35 AM Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> > > 
> > > > Of course the fact that in practice we'll *always* see the warning
> > > > because there's no way to tear down the default DMA domains, and even
> > > > if all devices *have* been nicely quiesced there's no way to tell, is
> > > > certainly less than ideal. Like I say, it's not entirely clear-cut
> > > > either way...
> > > >
> > > 
> > > Thanks for these examples, good to know these scenarios in case we
> > > come
> > > across these.
> > > However, if we see these error/warning messages appear everytime then
> > > what will be
> > > the credibility of these messages? We will just ignore these messages
> > > when
> > > these issues you mention actually appears because we see them
> > > everytime
> > > on
> > > reboot or shutdown.
> > 
> > I would agree that if these messages are expected to be seen every
> > time, there's no way to fix them, and they're not indicative of any
> > problem then something should be done.  Seeing something printed at
> > "dev_error" level with an exclamation point (!) at the end makes me
> > feel like this is something that needs immediate action on my part.
> > 
> > If we really can't do better but feel that the messages need to be
> > there, at least make them dev_info and less scary like:
> > 
> >   arm-smmu 15000000.iommu: turning off; DMA should be quiesced before
> > now
> > 
> > ...that would still give you a hint in the logs that if you saw a DMA
> > transaction after the message that it was a bug but also wouldn't
> > sound scary to someone who wasn't seeing any other problems.
> > 
> 
> We can do this if Robin is OK?

It would be nice if you could figure out which domains are still live when
the SMMU is being shut down in your case and verify that it *is* infact
benign before we start making the message more friendly. As Robin said
earlier, rogue DMA is a real nightmare to debug.

Will
