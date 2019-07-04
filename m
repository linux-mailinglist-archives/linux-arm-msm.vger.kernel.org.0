Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 571B15F470
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 10:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfGDISZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 04:18:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:39888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbfGDISZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 04:18:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4173620693;
        Thu,  4 Jul 2019 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562228304;
        bh=UeYtLQxzdmwhfH9GJRF3txc6Hp4+NVNVV1h+wH9zNLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zqQKPvTwzowYgDTm2mEztindHizh8BRoAbAsYALovpvP69cYxlxk567QkQsnSu3Cb
         uFGTfZdxYBK5aV9V9ILwmly2LN10tMb7G93Bqv7dXzkk92xIMTbyg1DzRxSa832pxt
         1tpIpeeMS0z1Y3jnb+93mRUNqViTnIKllbvPQIT0=
Date:   Thu, 4 Jul 2019 10:18:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCHv5 1/2] dt-bindings: coresight: Change CPU phandle to
 required property
Message-ID: <20190704081822.GD6438@kroah.com>
References: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <2afedb941294af7ba0658496b4aca3759a4e43ff.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYkxvh+qUDvqG45o7qh61Noq=a=BJ4-p68ipdzxYt6n5bNA@mail.gmail.com>
 <8fb5947e-acf8-faff-5594-2a32151ebee7@codeaurora.org>
 <20190704070239.GB32707@kroah.com>
 <72dff807-7172-7882-83fc-d7ff4cafe39f@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72dff807-7172-7882-83fc-d7ff4cafe39f@free.fr>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 04, 2019 at 10:08:24AM +0200, Marc Gonzalez wrote:
> [ Trimming recipients list ]
> 
> On 04/07/2019 09:02, Greg Kroah-Hartman wrote:
> 
> > On Thu, Jul 04, 2019 at 12:13:40PM +0530, Sai Prakash Ranjan wrote:
> >
> >> On 7/4/2019 1:32 AM, Mathieu Poirier wrote:
> >>
> >>> Hi Greg,
> >>>
> >>> On Thu, 27 Jun 2019 at 12:15, Sai Prakash Ranjan wrote:
> >>>>
> >>>> Do not assume the affinity to CPU0 if cpu phandle is omitted.
> >>>> Update the DT binding rules to reflect the same by changing it
> >>>> to a required property.
> >>>>
> >>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >>>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> >>>
> >>> I'm all good with this patch - can you pick this up for the coming
> >>> merge window?  If not I'll simply keep it in my tree for 5.4.
> >>>
> >>> Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>
> >> I think you missed adding Greg, adding him now ;)
> > 
> > I don't see any patch here for me to actually take :(
> 
> I see what you're doing here ^_^
> 
> https://lore.kernel.org/patchwork/patch/1094935/

What can I do with a random url?

Please send patches as emails, if you want me to be able to actually
take it.

greg k-h
