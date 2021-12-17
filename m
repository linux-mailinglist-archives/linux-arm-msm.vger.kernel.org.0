Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9DB47884B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Dec 2021 10:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234647AbhLQJ6X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Dec 2021 04:58:23 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:57760 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234606AbhLQJ6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Dec 2021 04:58:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95A05620D3;
        Fri, 17 Dec 2021 09:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACDEC36AE5;
        Fri, 17 Dec 2021 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639735102;
        bh=fulc/W776dWFoA7dIkj723RIpk0KZ9GyiQRx4gs6NwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JzlETfY3wid1h1GcHWWxftqymRosrGD5d7bs6XIzsbhcenJlwQwzEOMPqJl/pDggZ
         USrU4ZQy18Mtfimb42NbvulHcCvCRvf4t0cUTLn17mlMoikxCImJiKcnXF+ANq/EX3
         MolPtFdyi2dXjj3bJuPN39RkOyw4mDai8iwY9NqA=
Date:   Fri, 17 Dec 2021 10:58:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: dwc3-qcom: Fix registration when
 tx-fifo-resize exists
Message-ID: <YbxfO8MQtWrONKvh@kroah.com>
References: <e7ee9012055a4ba9afcb1ffbbeda25f113f171b6.1638701145.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7ee9012055a4ba9afcb1ffbbeda25f113f171b6.1638701145.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Dec 05, 2021 at 12:45:45PM +0200, Baruch Siach wrote:
> Commit cefdd52fa04 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
> property by default") added the tx-fifo-resize property. But when this
> property exists already, of_add_property() fails with -EEXIST, thus
> breaking core registration. This regresses the IPQ6018 platform that has
> tx-fifo-resize in its device-tree.
> 
> Don't fail when tx-fifo-resize exists.
> 
> Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
> Cc: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9abbd01028c5..bbd8e401a82c 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -667,7 +667,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  
>  	prop->name = "tx-fifo-resize";
>  	ret = of_add_property(dwc3_np, prop);
> -	if (ret) {
> +	if (ret && ret != -EEXIST) {
>  		dev_err(dev, "unable to add property\n");
>  		goto node_put;
>  	}
> -- 
> 2.33.0
> 

This commit does not apply to my tree at all.  What tree/branch did you
make it against?

thanks,

greg k-h
