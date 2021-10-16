Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1774303C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 18:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhJPQdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 12:33:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:52100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230526AbhJPQdo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 12:33:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DEBB6109E;
        Sat, 16 Oct 2021 16:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634401896;
        bh=1Guiab883qyByx7tJNaCujwIVNnfBIN3+AL//FDIewM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XV3xTGX/D7OriQ8vXqDgWuVKrd2TQLz9HHwZIvULkytyCqRt5w7WwHXnT+pqzGQUq
         86nb8OIutr5oxRMalBCn55As1fQRwm1lkIJjpb5Epy8ViW4Vznuqyo1rdTpc1unxTC
         VABtCuTnT/1EIxXwBl4r97C8thZ1WjSyb/IPuJiWwQmwJ1dxnjV3GJLbfR7aieDf5L
         OXSx6+NeDIGlx9RA6+rmhhuknhRLIp7Kz0SfClemAe6BuFthbP10KDmv27I8A6J4Rq
         Hv/37QSzA7DRq5ifCKSy3rXFAwSLypa/ciyxBNGqKsbTaVvEzxA10pw9sk9mElkHTU
         CtkNqT6rn8vSg==
Date:   Sat, 16 Oct 2021 22:01:28 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 2/3] bus: mhi: Add inbound buffers allocation flag
Message-ID: <20211016163128.GC4048@thinkpad>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
 <20211016065734.28802-3-manivannan.sadhasivam@linaro.org>
 <YWqByX6rdfuA1h1F@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWqByX6rdfuA1h1F@kroah.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 16, 2021 at 09:39:53AM +0200, Greg KH wrote:
> On Sat, Oct 16, 2021 at 12:27:33PM +0530, Manivannan Sadhasivam wrote:
> > From: Loic Poulain <loic.poulain@linaro.org>
> > 
> > Currently, the MHI controller driver defines which channels should
> > have their inbound buffers allocated and queued. But ideally, this is
> > something that should be decided by the MHI device driver instead,
> > which actually deals with that buffers.
> > 
> > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > if buffers have to be allocated and queued by the MHI stack.
> 
> This is a horrible api.  Now one has to go and look up why "0" was added
> to a function as a parameter.
> 
> If you don't want to allocate the buffer, then make a function of that
> name and call that.  As you only have one "flag", don't try to make
> something generic here that is obviously not generic at all.
> 

This is the only API that can be used by the client drivers to pass the
configurations to the MHI stack. So we wanted to have a flags parameter that
could be extended in the future also.

Regarding "0", the default behaviour is to not pre allocate the buffer at all.
So it made less sense to add a separate flag or an API for that.

Thanks,
Mani

> You all can do better than this.
> 
> thanks,
> 
> greg k-h
