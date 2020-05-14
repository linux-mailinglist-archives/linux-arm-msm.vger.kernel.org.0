Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46931D36A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 18:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgENQhh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 12:37:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:54028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgENQhh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 12:37:37 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B16A2206A5;
        Thu, 14 May 2020 16:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589474257;
        bh=BTxpmf1wFyq3nlMPhORBHOa3A6arfRq46Ns4lVg0b5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HFXx34midDW0QmV3w7Kh8mgS7t+fEHFQuOF6C01WJ8OYZWb2fEstIpWhem/umEcpz
         UDtNFocTlu6CyhS2JmNkTJzqynJxm+krhvioon4WFLvlZMGLxoHfwQKMr9rVorB9Zw
         8bgHB7klMda6W0BE/18YIrc2LKibaCx2Dl37VoyU=
Date:   Thu, 14 May 2020 18:37:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     arnd@arndb.de, manivannan.sadhasivam@linaro.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/8] qaic: Implement data path
Message-ID: <20200514163734.GB3154055@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-6-git-send-email-jhugo@codeaurora.org>
 <20200514141403.GB2643665@kroah.com>
 <2e569e9e-2e5f-a99e-384c-1aaf34d9999e@codeaurora.org>
 <20200514155645.GB2963499@kroah.com>
 <d34d726d-7911-824d-82ac-34358874b103@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d34d726d-7911-824d-82ac-34358874b103@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 10:12:03AM -0600, Jeffrey Hugo wrote:
> On 5/14/2020 9:56 AM, Greg KH wrote:
> > On Thu, May 14, 2020 at 09:06:53AM -0600, Jeffrey Hugo wrote:
> > > On 5/14/2020 8:14 AM, Greg KH wrote:
> > > > On Thu, May 14, 2020 at 08:07:43AM -0600, Jeffrey Hugo wrote:
> > > > > +struct qaic_execute {
> > > > > +	__u16		ver;    /* struct version, must be 1 */
> > > > 
> > > > No need for structures to be versioned.  If you change something, then
> > > > add a new ioctl if you really needed it.
> > > 
> > > Huh.  We had thought the botching ioctls document advised having a version,
> > > but as I double check that document, it infact does not.
> > > 
> > > Will remove.
> > 
> > Thanks, you can also remove the "reserved" variables as well as those
> > will not be needed either.
> 
> Are you sure?
> 
> Documentation/process/botching-up-ioctls.rst
> Starting at Line 38:
> 
> "Pad the entire struct to a multiple of 64-bits if the structure contains
> 64-bit types - the structure size will otherwise differ on 32-bit versus
> 64-bit. Having a different structure size hurts when passing arrays of
> structures to the kernel, or if the kernel checks the structure size, which
> e.g. the drm core does."
> 
> The "reserved" variables seem to be in line with that.

Padding is fine to use, but don't use that as a "I'm reserving this to
use it for later" type of thing which is how I read the structure
definitions.  I might be totally wrong, but you should be explicit here.

thanks,

greg k-h
