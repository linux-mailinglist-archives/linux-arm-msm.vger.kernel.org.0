Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A7F394D1C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 18:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhE2Q0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 May 2021 12:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhE2Q0t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 May 2021 12:26:49 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861F8C061760
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 May 2021 09:25:12 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id d21so7540613oic.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 May 2021 09:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jFAfU25Qj+cRqC0XFUI+YM1/RbEp8mIA/HiLs0SBEww=;
        b=g9Yqyl1WpDSv/0jO/8xVebd6wKxwc1+dm5MG4cr1gcfh4MVIFuW2eIp16PL+ioaq6b
         5L5ImayrkmN0Piha2bK33MCQU3H32blsZiLieEi1ooIigoVz+L6cfTU1HGSLnvcxtrHv
         v08QobuUW7y4BwxG3lspItWjIKotSoSKQQyQAOqiJ/4/y0PAXxzBosA0FMd3d6T6Dg1U
         Q0JeBHx1LmMoXg//RBbtD375VoYoI5ABs73doALxcRvCAFKoXvWLD/gsfON7XmFt52F1
         R1wxRFB5cLaFR8fnh9e+VBZYKGjaFuzlgwE6AX8eMdU1BLkzT+Hn0O574yFETWeYl7VQ
         x1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jFAfU25Qj+cRqC0XFUI+YM1/RbEp8mIA/HiLs0SBEww=;
        b=ey02VyBf2NWkCUFNphFcPElrcFgTz10fxJr+9zESmZX7jft/2hWQ3HD3iXRAwDSuxe
         nxzKqZ8SYBDMQMRAYzUoUtH5/06kV/v/aJt2a6EHloeFE8OW4a1NBj5wRryzXRvuGp5x
         1EKOEIiSo04ejXwF+Od3YVslzTTvwmpJQOS+L8q//mXD3uVgykrHBPRQ21YYDp9ulDVz
         EAKofgCAY6sLOPTaCZx8faeD8fVquyD7GecLXP1uHhi3nSoXZzDizKutk4c7f2kLVY8y
         J4xn3g8h0x2zTg6eb/o7rhdwXCJ3OMPRbpj0rZDKWgAytCYxIHXuBvawpZZkSoQgK0ES
         LCDQ==
X-Gm-Message-State: AOAM533eg9lo0MRSvJiUN5qQvm7yOBrD3GJQ5wveR0usrTSOu4RqFZ5U
        RQn72zhyF57OJzNNTjiafR0oqQ==
X-Google-Smtp-Source: ABdhPJzBeIa8BbBikxQvxrQptxn7sm9GORyImFhfYm4PvpYKjjqs0wQnZEDwWHVXmVQL8iJtsNq8vw==
X-Received: by 2002:aca:488f:: with SMTP id v137mr9350654oia.173.1622305511911;
        Sat, 29 May 2021 09:25:11 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e21sm1750706oii.23.2021.05.29.09.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:25:11 -0700 (PDT)
Date:   Sat, 29 May 2021 11:25:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     vkoul@kernel.org, kishon@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp: Add binding for SDX55
 PCIe PHY
Message-ID: <YLJq5R4uMYRDppmv@builder.lan>
References: <20210427065400.18958-1-manivannan.sadhasivam@linaro.org>
 <20210427065400.18958-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427065400.18958-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 27 Apr 01:53 CDT 2021, Manivannan Sadhasivam wrote:

> Add devicetree binding for PCIe PHY found in Qcom SDX55 platform.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> index 626447fee092..d5162d58a479 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -43,6 +43,7 @@ properties:
>        - qcom,sm8350-qmp-ufs-phy
>        - qcom,sm8350-qmp-usb3-phy
>        - qcom,sm8350-qmp-usb3-uni-phy
> +      - qcom,sdx55-qmp-pcie-phy
>        - qcom,sdx55-qmp-usb3-uni-phy
>  
>    reg:
> @@ -301,6 +302,7 @@ allOf:
>              enum:
>                - qcom,sdm845-qhp-pcie-phy
>                - qcom,sdm845-qmp-pcie-phy
> +              - qcom,sdx55-qmp-pcie-phy
>                - qcom,sm8250-qmp-gen3x1-pcie-phy
>                - qcom,sm8250-qmp-gen3x2-pcie-phy
>                - qcom,sm8250-qmp-modem-pcie-phy
> -- 
> 2.25.1
> 
