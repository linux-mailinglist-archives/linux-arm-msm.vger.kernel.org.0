Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8772740464F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 09:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352554AbhIIHjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 03:39:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:39324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232549AbhIIHjK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 03:39:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9399660F11;
        Thu,  9 Sep 2021 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631173081;
        bh=BLlfDPerQHZHqOIxgrdyUbnhgCPzfv2cz4NmxD+JzOo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QHmisJ7fUaWxVDE4dS5DkfSuEgfBmbBBJ82yIRyW68s92RMWQ1cM4yhSLvhLq6upp
         Mk+JjszqrK7ZS2St9jTTqI4vf/NkacU6VyHGugC+0DGhbbqoD/VEWeyQKRWAysupyH
         LE4RgbLBB09Kz8pMPve9TqjDR7zh38AEnMtH3+co=
Date:   Thu, 9 Sep 2021 08:18:59 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb/qcom,dwc3: add ipq4019 compatible
Message-ID: <YTmnU7mufgyhPLG8@kroah.com>
References: <20210908193329.87992-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908193329.87992-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 08, 2021 at 09:33:28PM +0200, David Heidelberg wrote:
> Prequisite for getting rid of another warnings when building ipq4019.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index e70afc40edb2..19641380f922 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,ipq4019-dwc3
>            - qcom,msm8996-dwc3
>            - qcom,msm8998-dwc3
>            - qcom,sc7180-dwc3
> -- 
> 2.33.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
