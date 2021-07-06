Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43293BDCD4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 20:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhGFSRI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 14:17:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231215AbhGFSRI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 14:17:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDAAE61A46;
        Tue,  6 Jul 2021 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625595268;
        bh=c8mTR3dw92ELjAYryh6ij/p+ALq3v67hVJ9FZSFbzAs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HqkrI1KGkzaT+Qa28LyYizfGrQA+ptqa4CeReM87Rx9vJOJbgary3RV8oq+MKXCoe
         n1M6FZEn3+NfKjj/VFiZWph5m01s84L2QUjPPKbBvXAhIATEKsSPnADy0F0s6gIXtY
         3jwotCm61iO9Xfa4qPQTSw1mxcTWn6meJ1TV9d1Q=
Date:   Tue, 6 Jul 2021 20:14:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        robh+dt@kernel.org, frowand.list@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com
Subject: Re: [PATCH v12 6/6] dt-bindings: usb: dwc3: Update dwc3 TX fifo
 properties
Message-ID: <YOSdgDZH5Uw9Y8yj@kroah.com>
References: <1625218655-14180-1-git-send-email-wcheng@codeaurora.org>
 <1625218655-14180-7-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625218655-14180-7-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 02, 2021 at 02:37:35AM -0700, Wesley Cheng wrote:
> Update the tx-fifo-resize property with a better description, while
> adding the tx-fifo-max-num, which is a new parameter allowing
> adjustments for the maximum number of packets the txfifo resizing logic
> can account for while resizing the endpoints.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 41416fb..078fb78 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -289,10 +289,21 @@ properties:
>      maximum: 16
>  
>    tx-fifo-resize:
> -    description: Determines if the FIFO *has* to be reallocated
> -    deprecated: true

So this is NOT deprecated?  Are we allowed to "bring back" things people
thought were going away?

thanks,

greg k-h
