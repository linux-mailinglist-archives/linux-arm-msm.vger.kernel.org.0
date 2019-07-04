Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD975F6FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 13:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfGDLFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 07:05:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727436AbfGDLFn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 07:05:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21B7C205C9;
        Thu,  4 Jul 2019 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562238342;
        bh=X2GjQVgfm5IGcVPPAmmfYyV7Fd8h4Y53p31adVF3V0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=khw06mJcyJ5bzYXVtFXPcvfDvQXzSWj67ppq6pNZvhGUyNNRTNxea/ajmCIZ8XIAi
         OUdB2O07y0h3F1tLKVig+8x6quRESobDCVW4ccyLCt6cu1OxKUAtOb+yuBqTnpGBMO
         6qd+8qc2vy1B2d2s9uL3kXXj0sEw+fcqjHXc61lc=
Date:   Thu, 4 Jul 2019 13:05:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCHv5 1/2] dt-bindings: coresight: Change CPU phandle to
 required property
Message-ID: <20190704110540.GD1404@kroah.com>
References: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <2afedb941294af7ba0658496b4aca3759a4e43ff.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYkxvh+qUDvqG45o7qh61Noq=a=BJ4-p68ipdzxYt6n5bNA@mail.gmail.com>
 <8fb5947e-acf8-faff-5594-2a32151ebee7@codeaurora.org>
 <20190704070239.GB32707@kroah.com>
 <72dff807-7172-7882-83fc-d7ff4cafe39f@free.fr>
 <20190704081822.GD6438@kroah.com>
 <b8b0c6a8-3e43-7143-c1f4-6ce8c60db9d8@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b0c6a8-3e43-7143-c1f4-6ce8c60db9d8@free.fr>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 04, 2019 at 10:51:20AM +0200, Marc Gonzalez wrote:
> On 04/07/2019 10:18, Greg Kroah-Hartman wrote:
> 
> > Marc Gonzalez wrote:
> > 
> >> https://lore.kernel.org/patchwork/patch/1094935/
> > 
> > What can I do with a random url?
> 
> I dunno, click it?  ^_^
> 
> More seriously, patchwork provides individual patches, as well as
> patch series, in the same mbox format used by MUAs, e.g.
> 
> https://lore.kernel.org/patchwork/patch/1094935/mbox/
> https://lore.kernel.org/patchwork/series/400118/mbox/
> 
> Then 'git am' works exactly as expected.
> 
> I suspect you know all this, and it's too big a hassle vs your usual
> work flow, considering the volume of patches you handle.

And considering that at some times, while traveling, I can _only_ get
email, not web access, so I can't rely on patchwork.

thanks,

greg k-h
