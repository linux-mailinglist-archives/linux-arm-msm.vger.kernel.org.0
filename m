Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0F727A071
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 12:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgI0KRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 06:17:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:33814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgI0KRY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 06:17:24 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 700E823977;
        Sun, 27 Sep 2020 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601201844;
        bh=WQfdJU34CeoKI2kcq/q/WjnyCwp6YUggBarSfxLkLs0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eFQZ1zvz0QQfjyIJIlRASclRMACESA8bLb8hsA0q+dSxzYgXq3W5DUoN994/WpORU
         FPIJr8O5fqtUxPquOn4MTEXOivjne8olR2em5aDiCZ/Chd5lSy12sEPRrR9/7r6MDn
         GGuU8t7Jzo/Rb2YuIQJ7ewjtfHgW7NxlAEJZgNXg=
Date:   Sun, 27 Sep 2020 12:17:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] bus: mhi: core: Move MHI_MAX_MTU to external header
 file
Message-ID: <20200927101734.GA85724@kroah.com>
References: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
 <20200927033652.11789-6-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927033652.11789-6-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 27, 2020 at 09:06:52AM +0530, Manivannan Sadhasivam wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> Currently this macro is defined in internal MHI header as
> a TRE length mask. Moving it to external header allows MHI
> client drivers to set this upper bound for the transmit
> buffer size.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/core/internal.h | 1 -
>  include/linux/mhi.h             | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)

If no one is using this change, then please don't make it until someone
needs it.

So submit it when you have a user please.

thanks,

greg k-h
