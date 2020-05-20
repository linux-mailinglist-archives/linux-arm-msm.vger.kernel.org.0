Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1021DA98C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 06:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgETE7F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 00:59:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:58802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgETE7E (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 00:59:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 233742075F;
        Wed, 20 May 2020 04:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589950744;
        bh=0uBprx3zgrPmKIHQh5K/KhY5RQol9LDmQGYsEkv3dF8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DD2y4B3oJ/agfWo6rHk87iOaHbnRZ5FQsZK++7S2VyoZVu3SlZFvn//cXTzp+VoI3
         GS96rGLP9TNws7d0NoeaphWlmVS9YPrJp+Mu3SxuGTuHXuEMlTT4nLF3APmJvoQ4aK
         hD+vImzBwT2oM691xBNpGhFh1lJcGGpb3lPQCkGU=
Date:   Wed, 20 May 2020 06:59:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Olof Johansson <olof.johansson@gmail.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Dave Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Message-ID: <20200520045900.GA2105777@kroah.com>
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:
> > Ok, that's a decision you are going to have to push upward on, as we
> > really can't take this without a working, open, userspace.
> 
> Uh wut.
> 
> So the merge criteria for drivers/accel (atm still drivers/misc but I
> thought that was interim until more drivers showed up) isn't actually
> "totally-not-a-gpu accel driver without open source userspace".
> 
> Instead it's "totally-not-a-gpu accel driver without open source
> userspace" _and_ you have to be best buddies with Greg. Or at least
> not be on the naughty company list. Since for habanalabs all you
> wanted is a few test cases to exercise the ioctls. Not the entire
> userspace.

Habanalabs now has their full library opensourced that their tools use
directly, so that's not an argument anymore.

My primary point here is the copyright owner of this code, because of
that, I'm not going to objet to allowing this to be merged without open
userspace code.

thanks,

greg k-h
