Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1301D35AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 17:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgENP4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 11:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:58474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbgENP4s (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 11:56:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68A442065F;
        Thu, 14 May 2020 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589471807;
        bh=alRh8S2oFH3AY/Cppj/ULloTExfWN2O5qw9U5rSkHgc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VgsCstIa/QRzdeGDFOmyPLk3+AuGiEWkVSVS9kIpMnUzD9vorKgpP0Sj9lUPPy27N
         z+SNssN9IXdgMkF6o34qonzWCzkRHmrcapQ1EVkbHeIRR3OA+wl2q4mBtnLL0qhj8B
         X50LidEEMG7EAuRcWvSwaOV6Yc8EMunpLfpV5f/Q=
Date:   Thu, 14 May 2020 17:56:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     arnd@arndb.de, manivannan.sadhasivam@linaro.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/8] qaic: Implement data path
Message-ID: <20200514155645.GB2963499@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-6-git-send-email-jhugo@codeaurora.org>
 <20200514141403.GB2643665@kroah.com>
 <2e569e9e-2e5f-a99e-384c-1aaf34d9999e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e569e9e-2e5f-a99e-384c-1aaf34d9999e@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 09:06:53AM -0600, Jeffrey Hugo wrote:
> On 5/14/2020 8:14 AM, Greg KH wrote:
> > On Thu, May 14, 2020 at 08:07:43AM -0600, Jeffrey Hugo wrote:
> > > +struct qaic_execute {
> > > +	__u16		ver;    /* struct version, must be 1 */
> > 
> > No need for structures to be versioned.  If you change something, then
> > add a new ioctl if you really needed it.
> 
> Huh.  We had thought the botching ioctls document advised having a version,
> but as I double check that document, it infact does not.
> 
> Will remove.

Thanks, you can also remove the "reserved" variables as well as those
will not be needed either.

greg k-h
