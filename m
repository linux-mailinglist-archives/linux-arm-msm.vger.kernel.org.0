Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F48154C1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 20:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgBFTYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 14:24:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:59610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727738AbgBFTYb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 14:24:31 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EFCC214AF;
        Thu,  6 Feb 2020 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581017070;
        bh=f3WSrBRt4neMzmFchTxB0zWtEqWohhIm/xmnMbJHO6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mX9t0N4vGqxU6i9e6zLffb2bedMM0ROmHksy4YAYQan0dVukyyPakv7UQWjDds+PA
         Tm/x7pfRV+VKY9jHODmxm9pSr1p4z1W7G1CBg5+ubLQ7D022gdyQ962ihuyredViui
         Ft1newux/Da6H01uQKjlb+PybQxF52U0/m7ruqHM=
Date:   Thu, 6 Feb 2020 17:57:55 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200206165755.GB3894455@kroah.com>
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
> --- /dev/null
> +++ b/drivers/bus/mhi/core/init.c
> @@ -0,0 +1,407 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + *
> + */
> +
> +#define dev_fmt(fmt) "MHI: " fmt

This should not be needed, right?  The bus/device name should give you
all you need here from what I can tell.  So why is this needed?

thanks,

greg k-h
