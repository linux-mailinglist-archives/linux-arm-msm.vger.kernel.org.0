Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2075A1DA9F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 07:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgETFct (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 01:32:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:40900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETFcs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 01:32:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3AA4206C3;
        Wed, 20 May 2020 05:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589952768;
        bh=7tEu4O1iMPzJPaYi3or7v6LTpc9n4YdaGJ9B5P21rKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AOnX2eEtKR8opNi+mBlx3JMw2exVc736Qy8loEWgXm3kMJbk+Wh5KjafcOlHxkrvO
         YsCrSNJ6NUfqVOPrwLbgGBoKcZzs75niXIPWWnicZ4QMf4m3db06WTOrPpvvjllBna
         xE11nJe3i4to4HoSi6Ppd4IIdogLyYO403kD+g/0=
Date:   Wed, 20 May 2020 07:32:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Dave Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Message-ID: <20200520053245.GA2154372@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <CAPM=9txXskVu_yD3DNuR0HgSUsE2v1Pv98dm=AHGvv_z2XKTAQ@mail.gmail.com>
 <93238096-5861-c140-b94f-6137977c3d65@codeaurora.org>
 <20200519174120.GC1158284@kroah.com>
 <ce0e69ef-116c-df95-c136-d4714e02e96e@codeaurora.org>
 <20200519181256.GA1215993@kroah.com>
 <f7ea166b-7ccb-22e2-7db0-bfd255ba0134@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7ea166b-7ccb-22e2-7db0-bfd255ba0134@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 12:26:01PM -0600, Jeffrey Hugo wrote:
> On 5/19/2020 12:12 PM, Greg Kroah-Hartman wrote:
> > > > Especially given the copyright owner of this code, that would be just
> > > > crazy and foolish to not have open userspace code as well.  Firmware
> > > > would also be wonderful as well, go poke your lawyers about derivative
> > > > work issues and the like for fun conversations :)
> > > 
> > > Those are the kind of conversations I try to avoid  :)
> > 
> > Sounds like you are going to now have to have them, have fun!
> 
> Honestly, I fail to see where you think there is a derivative work, so, I'm
> not really sure what discussions I need to revisit with our lawyers.

Given that we are not lawyers, why don't we leave those types of
discussions up to the lawyers, and not depend on people like me and you
for that?  :)

If your lawyers think that the code division is fine as-is, that's
great, I'd be glad to review it if they add their signed-off-by: on it
verifying that the api divide is approved by them.

thanks!

greg k-h
