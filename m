Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092281D5F4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2020 09:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgEPHBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 May 2020 03:01:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:42216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgEPHBg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 May 2020 03:01:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3C142065C;
        Sat, 16 May 2020 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589612494;
        bh=pT8e+7o3TercEeuJfTZj5CiH2h8xBjPmu+OZSlMXKoE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gFYicTCZOTybYHNii6SO9Ip7WlV4TNvEH1j2OckSYViR962JwC11BP1mzY8DL0W/d
         kmaF8iBegT3WqLVX8zd9zGxLbBryXbSMCGu8QHCkOJzLS9gxW92x9V5Qqz6/MX4MI5
         LXt/gyWFds9pprvUYuBKHAmHPnqzHndQMvj1MOPE=
Date:   Sat, 16 May 2020 09:01:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     arnd@arndb.de, manivannan.sadhasivam@linaro.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/8] qaic: Create char dev
Message-ID: <20200516070131.GB3964535@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-4-git-send-email-jhugo@codeaurora.org>
 <20200514141211.GA2643665@kroah.com>
 <0421a64a-10f3-08df-9ef1-14fdb570db0d@codeaurora.org>
 <20200514155615.GA2963499@kroah.com>
 <4be546d3-b571-0659-0140-f34ec88f95ff@codeaurora.org>
 <4683046a-c6b5-30a5-ef02-2f610523ae1c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4683046a-c6b5-30a5-ef02-2f610523ae1c@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 15, 2020 at 03:08:59PM -0600, Jeffrey Hugo wrote:
> 2. There are a limited number of dynamic minor numbers for misc devs (64),
> so if you are expecting more devices than that, a misc dev is not
> appropiate.  Also, these minors are shared with other misc dev users, so
> depending on the system configuration, you might have significantly less
> than 64 minors available for use.

I'm pretty sure we can have more than 64 misc devices, that limitation
should have been removed a while ago.  Try it and see :)

greg k-h
