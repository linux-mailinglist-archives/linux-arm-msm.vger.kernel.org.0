Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B252B466B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 15:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730091AbgKPOxz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 09:53:55 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42163 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbgKPOxz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 09:53:55 -0500
Received: by mail-oi1-f194.google.com with SMTP id w145so19052521oie.9;
        Mon, 16 Nov 2020 06:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YlpjPvTQYT+rqdni5qJzLiGhROd+f/379cy54KdKCm0=;
        b=UdOkcRVeKkKulfhfAgp40GpUXlbmHBzCKUguCuO95nYxA9ASiDUEYr5CPA89WxW7cQ
         +x/J/dZKZgjB2EW/GDwWBuJUDYK52ndSDmdS/xv43ypAUIcJIWe/UM+eTMjkCtZJusIT
         Tzz4PIXxThWvx5YTrXOGE2kcgoF2YZ0rCEEOhx5SLQfXGb3bjkRrF7ORhO/i58pXwOH5
         n5ICp68r0HYnFk+A0QQLe4US9qUiBJhb1F10Sll5VId95k5PrYnk9fvC/PNOM2GOMXAs
         8HNhVKgOx5AQZciY0lljJ4N1de+Q/vnPRs4UCKR4pf/Tg4yCmn5UdnLpSFbQw5TuYANv
         DOyA==
X-Gm-Message-State: AOAM532EYrqPmk8ImgS/XBsRfzZyXEsCFT+TCQbhuPZgFfHJN6wpdKdY
        b/b3ebLFT26YTc1L4RTxTXUY/Q+HNw==
X-Google-Smtp-Source: ABdhPJysYAvyeMCmUOQIRzey6h9TQ6Yjr9KAi3Sw8KNdrUru374RMQwgv+i8cZ3MEKgNmhT2nujfMg==
X-Received: by 2002:aca:1e13:: with SMTP id m19mr4492399oic.176.1605538434197;
        Mon, 16 Nov 2020 06:53:54 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 64sm4702013otq.26.2020.11.16.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:53:53 -0800 (PST)
Received: (nullmailer pid 1634415 invoked by uid 1000);
        Mon, 16 Nov 2020 14:53:52 -0000
Date:   Mon, 16 Nov 2020 08:53:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: add vendor bindings for OnePlus
Message-ID: <20201116145352.GB1625774@bogus>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-5-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-5-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 12, 2020 at 04:21:54PM +0000, Caleb Connolly wrote:
> Used by the OnePlus 6/T device trees
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/arm/oneplus/oneplus-boards.yaml  | 25 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
>  2 files changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml b/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml
> new file mode 100644
> index 000000000000..a4d9bbd5681f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/oneplus/oneplus-boards.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OnePlus based boards
> +
> +maintainers:
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: SDM845 based boards

There should be a sdm845 fallback compatible. Also, board level 
compatibles are documented in a per SoC family schema (qcom.yaml) which 
should already define the fallback.

> +        items:
> +          - enum:
> +              - oneplus,enchilada               # OnePlus 6
> +              - oneplus,fajita                  # OnePlus 6T
> +          - const: oneplus,oneplus6             # OnePlus 6 and derivatives

With a SoC fallback, having this as a 3rd compatible probably isn't too 
useful. 3 levels of compatible is mainly done when there's a SoM plus 
baseboard.

> +
> +required:
> +  - compatible
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 2735be1a8470..372c1136081e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -768,6 +768,8 @@ patternProperties:
>      description: OLIMEX Ltd.
>    "^olpc,.*":
>      description: One Laptop Per Child
> +  "^oneplus,.*":
> +    description: One Plus Technology (Shenzhen) Co., Ltd.
>    "^onion,.*":
>      description: Onion Corporation
>    "^onnn,.*":
> -- 
> 2.29.2
> 
> 
