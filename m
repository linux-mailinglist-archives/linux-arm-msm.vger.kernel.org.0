Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089DE1D43D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 05:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgEODBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 23:01:38 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:34966 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgEODBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 23:01:37 -0400
Received: by mail-oo1-f65.google.com with SMTP id c187so144288ooc.2;
        Thu, 14 May 2020 20:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fzt3fbDfPhMLsvVChoRsuRz5dmNGR0DOVOHIwVjbwCo=;
        b=mL4cYKK2sFj7olXwtcGYQfn1+Z7h0DR2lYKGpzhm4rKkf0dmqIB6d0hpu87RazerRu
         hBUxMUVyTxop+z5QBEY/iPd4eVBv+JPxJrNIFxS8F/S1Xny7VggovMKbW8uWDKxncwuQ
         AItsfksuSuITQ18n5log+gj+wmbibK9lYTVRqyF57p3/LMwszmbOfa3iNUF2+RgCj1z9
         hRshMe4eqHNYmtNxZxXd8aJ49p0h57ixAyOFtEZxIje2equV9gWCY9Y1vzh40LCJj1wq
         EY7+nCiucAKJe5Zxa6vyupbEemCNBP+h9eg62g76WMClqNS21jycAWP/yWMt6QPz8EtH
         Ocgg==
X-Gm-Message-State: AOAM531m1ab1jlxrZPBTr6hH3H6oSywa4iOu/NSKHdKJu2+bpWHTd3wT
        HyRmS3+oD6/YyIF1kkkjmw==
X-Google-Smtp-Source: ABdhPJx3IazIe047SWhLhbb8iub9o9mvI5+SddR6eHlIPjOIaHcBm7Kf5QHuVnMUBWQ/xZh8l1RlWg==
X-Received: by 2002:a4a:a448:: with SMTP id w8mr871623ool.78.1589511695032;
        Thu, 14 May 2020 20:01:35 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o21sm265756ook.8.2020.05.14.20.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 20:01:34 -0700 (PDT)
Received: (nullmailer pid 13459 invoked by uid 1000);
        Fri, 15 May 2020 03:01:33 -0000
Date:   Thu, 14 May 2020 22:01:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, rojay@codeaurora.org,
        skakit@codeaurora.org, mka@chromium.org
Subject: Re: [PATCH V6 3/3] dt-bindings: serial: Add binding for UART pin swap
Message-ID: <20200515030133.GA11479@bogus>
References: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
 <1588863647-17240-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588863647-17240-4-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 07, 2020 at 08:30:47PM +0530, Akash Asthana wrote:
> Add documentation to support RX-TX & CTS-RTS GPIO pin swap in HW.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/serial/serial.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
> index 53204d9..e657dd6 100644
> --- a/Documentation/devicetree/bindings/serial/serial.yaml
> +++ b/Documentation/devicetree/bindings/serial/serial.yaml
> @@ -67,6 +67,12 @@ properties:
>        (wired and enabled by pinmux configuration).  This depends on both the
>        UART hardware and the board wiring.
>  
> +  rx-tx-swap:
> +    description: RX and TX pins are swapped.
> +
> +  cts-rts-swap:
> +    description: CTS and RTS pins are swapped.

Need 'type: boolean' on both of these.

> +
>  if:
>    required:
>      - uart-has-rtscts
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
