Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB071E8644
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 20:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgE2SIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 14:08:18 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:41172 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgE2SIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 14:08:17 -0400
Received: by mail-il1-f193.google.com with SMTP id d1so3362966ila.8;
        Fri, 29 May 2020 11:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vXEj89uVqbm2TR9qCfeBSA0llFUWe8uVgOJllH027m8=;
        b=B7WrIELh3mR5jbnUBA2JBaYxIu7jNi3O9hWfw8fN4f6tvTTJYclOkJJBXWipEuGysg
         T0ubf0PP9IqPMuT+DHj7UJId4LIqUv2HG4UzUAgCftuW+rOkOkkHT1rxgoK8TlTFvjIn
         1WTTsix+gT+rNUDOrL6ElQwft286QdMNAHsuwAKHR8vzngFFVShiZXf5jsKv3lg8KTTu
         kSaTwCSvuawriN6VSzY1VBRcTKoGMIocQvI+WvOuOKg4bL19H+LDEaQV6W78K9pgj/wR
         /+wMiEiFo0RWWpxhXNa2uRK7FNYE/lL/AmrEE+pDezII5ncv3jY9oABgigoiHf0/N+HX
         1SQw==
X-Gm-Message-State: AOAM531ebOYWbbh8KG3ldLY1MLZ78LQ94PCRxJQNdKXG47dVX8T16THx
        7KssyRxawuTc4TUdZgNXYw==
X-Google-Smtp-Source: ABdhPJzEuT+GCqhaaGqsGyzPWNzhk6k8IvDy8BrKUjIrFcXYbS75zuPpQOxpA1OMHxuq9Oiq92dpVA==
X-Received: by 2002:a92:d989:: with SMTP id r9mr8473339iln.30.1590775696702;
        Fri, 29 May 2020 11:08:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id z3sm4149669ior.45.2020.05.29.11.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 11:08:15 -0700 (PDT)
Received: (nullmailer pid 2674973 invoked by uid 1000);
        Fri, 29 May 2020 18:08:14 -0000
Date:   Fri, 29 May 2020 12:08:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 1/5] dt-bindings: clock: add ipq6018 a53 pll compatible
Message-ID: <20200529180814.GA2672742@bogus>
References: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org>
 <1590582292-13314-2-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590582292-13314-2-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 27, 2020 at 05:54:48PM +0530, Sivaprakash Murugesan wrote:
> cpus on ipq6018 are clocked by a53 pll, add device compatible for a53
> pll found on ipq6018 devices.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> * [V6]
>     re-ordered compatible string, dropped Rob's review tag for this change.

Not really significant enough to drop it, but if you really want me to 
stare at this again...

>  .../devicetree/bindings/clock/qcom,a53pll.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> index 20d2638..a4f2d01 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
> @@ -15,6 +15,7 @@ description:
>  
>  properties:
>    compatible:
> +    const: qcom,ipq6018-a53pll
>      const: qcom,msm8916-a53pll
>  
>    reg:
> @@ -23,6 +24,14 @@ properties:
>    '#clock-cells':
>      const: 0
>  
> +  clocks:
> +    items:
> +      - description: board XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
>  required:
>    - compatible
>    - reg
> @@ -38,3 +47,12 @@ examples:
>          reg = <0xb016000 0x40>;
>          #clock-cells = <0>;
>      };
> +  #Example 2 - A53 PLL found on IPQ6018 devices
> +  - |
> +    a53pll_ipq: clock@b116000 {

clock-controller@...

> +        compatible = "qcom,ipq6018-a53pll";
> +        reg = <0x0b116000 0x40>;
> +        #clock-cells = <0>;
> +        clocks = <&xo>;
> +        clock-names = "xo";
> +    };
> -- 
> 2.7.4
> 
