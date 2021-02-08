Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020EA312AF6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 07:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhBHG5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 01:57:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:58112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229759AbhBHG5n (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 01:57:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A64964E6E;
        Mon,  8 Feb 2021 06:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612767422;
        bh=NHVThXsdsWsn5OLyJXfv1c5uwH4fZPLlA6iF/5+HU/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RYrQS+XhLjXw8uVV6RxZ6/YfJAbW72ULgHtvdBlnKXGCo39VU2WqGHI+B9hABmLTQ
         fhGfzGt5pKNUD95+O2gyk+ougVgvZpR998Jc8fXGEvONqYAfZZlSg19glIo5en9+AH
         rLj3zsykwgUwbcXfyYcWLbtTs/E+z+yfzG37syW4=
Date:   Mon, 8 Feb 2021 07:56:58 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
Message-ID: <YCDgupJbubjnu2+v@kroah.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 08, 2021 at 08:00:06AM +0200, Baruch Siach wrote:
> From: Balaji Prakash J <bjagadee@codeaurora.org>
> 
> DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
> to control the behavior of controller with respect to SOF and ITP.
> The reset values of these registers are aligned for 19.2 MHz
> reference clock source. This change will add option to override
> these settings for reference clock other than 19.2 MHz
> 
> Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.
> 
> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
> [ baruch: mention tested hardware ]
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../devicetree/bindings/usb/dwc3.txt          |  5 ++

Bindings should be split into a separate patch (1/2) so that the DT
maintainers can review it easier.

Also, always run checkpatch on your submissions before sending them out.

thanks,

greg k-h
