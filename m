Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C013C3EBB54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 19:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhHMRXE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 13:23:04 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46762 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhHMRXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 13:23:03 -0400
Received: by mail-ot1-f42.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso85133ott.13;
        Fri, 13 Aug 2021 10:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qtl1x9JJ0XKFoBsOFr6FS/aFXbYj3pnKTeinmcXne70=;
        b=feynS/pRwqQ6zrdK7e9IXH3MNDB480q7VPkHz/i0YLA+rM7cxLFM19bImUelTz7lTz
         GLrZ6FtHsv4KXxMtxd3SsiuV9x7KJSNQJwyEXcrEEO4dRv3z3yWnCc7UAWUgg/ey7Iae
         BFTk226DdoTtNe2/TveWmXh+5TtgSVcgll7jkQq97ATp+1/mWbfXVqhsPq3RbNnXC+qC
         VzvnNh9zflQ9+45z7aJRofycY5ahhWL7TVsprJdPgPK+xZJCKb1hxsfbtO6gXKY5g7iQ
         sZ1rfu6YEnCt+RT8SsHHJ365o8Ad8F63+/h3ZY4fNbY8CsMcRG+a1Pi2+L32qXVQat4e
         AvXQ==
X-Gm-Message-State: AOAM530iLIiNbeb5NmsZBhMPAG3knQeERg9XB+LbcvfrNLG44XI3aVnV
        mbJSXlsP83f+YnjE347oSxB68OpTmg==
X-Google-Smtp-Source: ABdhPJzY3LjdzZmYKwwt6RN5JSGv1PbqSVilzq53lfwv4e45NlgToI6abyIrp0oNLFt9px9/W8R+Fw==
X-Received: by 2002:a05:6830:30a8:: with SMTP id g8mr2982948ots.54.1628875356369;
        Fri, 13 Aug 2021 10:22:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w13sm436611otl.41.2021.08.13.10.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 10:22:35 -0700 (PDT)
Received: (nullmailer pid 3706545 invoked by uid 1000);
        Fri, 13 Aug 2021 17:22:34 -0000
Date:   Fri, 13 Aug 2021 12:22:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: usb: dwc3: add reference clock period
Message-ID: <YRaqWtSK7zNhKxSN@robh.at.kernel.org>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
 <22f62c59471e128b681a731997a9416ab2e91acf.1628085910.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22f62c59471e128b681a731997a9416ab2e91acf.1628085910.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 04, 2021 at 05:05:07PM +0300, Baruch Siach wrote:
> Document the snps,ref-clock-period property that describes reference
> clock period when it deviates from the default set value.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 41416fbd92aa..c8027d2852cd 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -252,6 +252,15 @@ properties:
>      minimum: 0
>      maximum: 0x3f
>  
> +  snps,ref-clock-period:
> +    description:
> +      Value for REFCLKPER field of GUCTL register for post-silicon reference

Why is post-silicon relevant here? Everything upstream should be for 
post-silicon. I've seen and done the hacks to make pre-silicon testing 
work and we don't need those upstream.

> +      clock period in nanoseconds, when the hardware set default does not match

If you have units, then use property unit suffix in the name.

> +      the actual clock.
> +    $ref: /schemas/types.yaml#/definitions/uint32

And then you can drop the type.

However, if the h/w block gets a ref clock why isn't it described in 
'clocks' and then you can just read why the frequency is and calculate 
the period.
