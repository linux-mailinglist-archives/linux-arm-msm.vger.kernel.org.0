Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9777B27A075
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 12:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgI0KWX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 06:22:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbgI0KWX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 06:22:23 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 733EE23977;
        Sun, 27 Sep 2020 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601202143;
        bh=KhAdw/ZTKrRgzHe5/P6pk9WN1sJloxgQS3BIvo6PEpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KnOhlH8KrSLdcGeobeCftfmEXKyp009LF7TqzVD43U1dqRuPdiZZyUUPGVa67v6ea
         BcncX8L4bHaL1bb9SX7UpIRh9/5kV0H9QWzL2zYuHPtdHnINF+QvynHT0W18z473uV
         aFKHnK6T6UUPi9DlHvASDaljIdnRa10j03IH41lw=
Date:   Sun, 27 Sep 2020 12:22:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/18] bus: mhi: core: Fix the building of MHI module
Message-ID: <20200927102233.GA87283@kroah.com>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
 <20200921160815.28071-20-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921160815.28071-20-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 09:38:15PM +0530, Manivannan Sadhasivam wrote:
> The Kbuild rule to build MHI should use the append operator. This fixes
> the below warning reported by Kbuild test bot.
> 
> WARNING: modpost: missing MODULE_LICENSE() in
> drivers/bus/mhi/core/main.o
> WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/pm.o
> WARNING: modpost: missing MODULE_LICENSE() in
> drivers/bus/mhi/core/boot.o
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

What commit caused this problem?  Can you add a Fixes: line for it?

thanks,

greg k-h
