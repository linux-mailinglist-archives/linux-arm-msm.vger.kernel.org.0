Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866C81D43E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 05:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgEODKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 23:10:46 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42446 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgEODKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 23:10:45 -0400
Received: by mail-ot1-f68.google.com with SMTP id m18so795105otq.9;
        Thu, 14 May 2020 20:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=satk6u22dpbc73y0fCNGBups5k0IDQTUclEtwsGIwFY=;
        b=hycZH147PsVU3nPsskBa0KEawdINGuHNcnVHCGEf5pDkzqaZw8WadosHzNE+ZfuFYU
         3nipe+tK6xQGhY7AaEhDJpoZ+n/jhasbAQ6cOhoYdSWomGOOQ84QQdDh+l4Oty6mPapG
         cw4Cqqj+XtLS8d8k94/JkdgBc1VA2emhXxlUnOV1HrRQ+e+y8fz6m5WVNUrVSKCUDAuj
         uOaC0+4QEVh6ZSHJAv87JBknxRfF8Ct0y7xKcOkPciyn1nnrvk/vOZE6gV3jX4WE9ANh
         Xxhn+wpSEeNihePUssiR/YwI4kurym6aYOLBzGWPhSL4Pn7bO8rWmcveTOtxhgYHEKQT
         lbyQ==
X-Gm-Message-State: AOAM530Q/kthxDctz6GeWw9DmVZpApq+UzwJ8xu5h7ojsVCNizBbjtAg
        WN85HQByA26KkOYFo3GdpA==
X-Google-Smtp-Source: ABdhPJzV9kaQXKl6yL5gJAxk/H6tfOxArW47aEseyEx9jXzvLnsk+fLxjrjwNKiocZDIePjTlsZzeg==
X-Received: by 2002:a9d:1ee7:: with SMTP id n94mr759604otn.26.1589512244486;
        Thu, 14 May 2020 20:10:44 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d10sm257313ote.10.2020.05.14.20.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 20:10:43 -0700 (PDT)
Received: (nullmailer pid 26194 invoked by uid 1000);
        Fri, 15 May 2020 03:10:42 -0000
Date:   Thu, 14 May 2020 22:10:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, jackp@codeaurora.org
Subject: Re: [RFC 3/3] dt-bindings: usb: dwc3: Add entry for tx-fifo-resize
Message-ID: <20200515031042.GA25107@bogus>
References: <1588888768-25315-1-git-send-email-wcheng@codeaurora.org>
 <1588888768-25315-4-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588888768-25315-4-git-send-email-wcheng@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 02:59:28PM -0700, Wesley Cheng wrote:
> Re-introduce the comment for the tx-fifo-resize setting for the DWC3
> controller.

Why?

> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 9946ff9..489f5da 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -105,7 +105,7 @@ Optional properties:
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
>  
> - - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
> + - tx-fifo-resize: determines if the FIFO *has* to be reallocated.
>   - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
>  			register, undefined length INCR burst type enable and INCRx type.
>  			When just one value, which means INCRX burst mode enabled. When
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
