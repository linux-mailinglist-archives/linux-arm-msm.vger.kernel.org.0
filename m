Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063FE154C1D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 20:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgBFTY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 14:24:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:59550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727738AbgBFTY2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 14:24:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D211F20659;
        Thu,  6 Feb 2020 19:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581017068;
        bh=Zp8OE5o5eZFyNVg5lP65tBnz3oUxVU4TkySEXhH+pTE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WlsrsrxM4UbQ7/Enn10hE3kLLvWcRbBx/+RtGv3BdR7jlcQYnYbI8U670eWiHqqj8
         0+806ZfPfRMVpUQgmCGEiUj2q9Uc4wiKyZEKgEWulr4Bblll52CeeU9Sh3Uqt6ZmQd
         CuC+xk7bf6G5+AQRXn9DdYe1FEzj51fMwgAsTDuM=
Date:   Thu, 6 Feb 2020 17:56:06 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200206165606.GA3894455@kroah.com>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 31, 2020 at 07:19:55PM +0530, Manivannan Sadhasivam wrote:
> +static void mhi_release_device(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> +
> +	if (mhi_dev->ul_chan)
> +		mhi_dev->ul_chan->mhi_dev = NULL;

That looks really odd.  Why didn't you just drop the reference you
should have grabbed here for this pointer?  You did properly increment
it when you saved it, right?  :)

> +
> +	if (mhi_dev->dl_chan)
> +		mhi_dev->dl_chan->mhi_dev = NULL;

Same here.

thanks,

greg k-h
