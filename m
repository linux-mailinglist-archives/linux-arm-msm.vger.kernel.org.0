Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED691F7673
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 12:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgFLKCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 06:02:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:36352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgFLKCO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 06:02:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2E41207D8;
        Fri, 12 Jun 2020 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591956134;
        bh=l002a0NI7RcMCZFY1NEScRszB3jXR41FbOH3xKTIu0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cGQdHZmQx6Iz8xd3sx/auS+VvqT2rGKjwfQDZ8h/dBY2N2tzM5D3OjiRqCBIJdRNt
         k3ZsGLsKQ0VDgLNZVywYD8ZTtz+nDSJlguxS1fAIOQyJNqOCsAgLELeYzZMjTiVfh1
         0hwtFX08T7047fYPzwaBnokj2V2ZnBXqxMNnMqdI=
Date:   Fri, 12 Jun 2020 12:02:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Bernard Zhao <bernard@vivo.com>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        opensource.kernel@vivo.com, linux-kernel@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/msm: Fix memory leak in msm_submitqueue_create()
Message-ID: <20200612100205.GD3157576@kroah.com>
References: <acd53f06-845b-75e0-24c5-40c751d12945@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acd53f06-845b-75e0-24c5-40c751d12945@web.de>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 12, 2020 at 11:37:33AM +0200, Markus Elfring wrote:
> > In fucntin msm_submitqueue_create, the queue is a local
> > variable, in return -EINVAL branch, queue didn`t add to ctx`s
> > list yet, and also didn`t kfree, this maybe bring in potential
> > memleak.
> 
> I suggest to improve also this change description.
> How do you think about a wording variant like the following?
> 
>    Release the GPU submission queue object after an input parameter validation failed.
> 
> 
> Would you like to add the tag “Fixes” to the commit message?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=b791d1bdf9212d944d749a5c7ff6febdba241771#n183
> 
> 
> How do you think about to reorder any statements for this function implementation?
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
