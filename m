Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E75943BB19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 21:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235634AbhJZTmc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 15:42:32 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:39791 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbhJZTmb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 15:42:31 -0400
Received: by mail-ot1-f53.google.com with SMTP id e59-20020a9d01c1000000b00552c91a99f7so223686ote.6;
        Tue, 26 Oct 2021 12:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7p/ufL2M3OnUPk5rBVBJ5fuMyPDL6fxEt0PgZdd2ydI=;
        b=DOtGX5tqpoO6e5IXE7virPwvX9OJGQ1wQwQ6LXuFCYgsLaBGB44krrazVg9E/8POqH
         iBEgI7fhnaW3KDPMBMgSY94p7Wl3orhWvnmzxYCnNwkIXss6kNcWwZNQR4m8eTJYZbep
         JHrYtIanhe1x97UB/YrPCtAv4TvZNP+C26NrZyCOwpfDiL4SI/rD+pTxHEwqnJdigqb5
         tWxbHa4I1T/wYFkGuoe1c6ZzmgTTrUsVjd+XPgchjWG/+D/+LnH7g/tEEAXWVTFbUHVD
         Jhp6zqFT7KR5vKaDmr9hR2l1h3/qAiHqkrWeMgDRRkG5RKswDyksE1idZeS2K4GUJhKL
         p6HQ==
X-Gm-Message-State: AOAM533Rq0Vzk5qLIg3RrWR4dTHntwHOep5pzUVQvb/0Bov/COh4nUQ6
        J1q8/3Zwzsa6mkbJg0Z5Cw==
X-Google-Smtp-Source: ABdhPJwm5YTwFVKDIKl1Y/ODwgAATttreV8BXjct1QcFbTppCC+u0nIG7wzvIOqw1AsBKqxu7YpiCw==
X-Received: by 2002:a05:6830:25d1:: with SMTP id d17mr17898464otu.197.1635277204356;
        Tue, 26 Oct 2021 12:40:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l24sm4085964oop.4.2021.10.26.12.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:40:03 -0700 (PDT)
Received: (nullmailer pid 3105620 invoked by uid 1000);
        Tue, 26 Oct 2021 19:40:02 -0000
Date:   Tue, 26 Oct 2021 14:40:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 08/20] dt-bindings: qcom-qce: Add 'interconnects' and
 move 'clocks' to optional properties
Message-ID: <YXhZkloL9BP5o2hA@robh.at.kernel.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-9-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013105541.68045-9-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 13, 2021 at 04:25:29PM +0530, Bhupesh Sharma wrote:
> Add 'interconnects' and 'interconnect-names' as optional properties
> to the device-tree binding documentation for qcom crypto IP.
> 
> These properties describe the interconnect path between crypto and main
> memory and the interconnect type respectively.

And why are 'clocks' now optional? Seems like it should be 2 patches 
given the long subject with a conjunction.

> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index b7ae873dc943..954f762090f3 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -32,6 +32,14 @@ properties:
>        - const: bus
>        - const: core
>  
> +  interconnects:
> +    maxItems: 1
> +    description: |
> +      Interconnect path between qce crypto and main memory.
> +
> +  interconnect-names:
> +    const: memory
> +
>    dmas:
>      items:
>        - description: DMA specifiers for tx dma channel.
> @@ -45,8 +53,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - clocks
> -  - clock-names
>    - dmas
>    - dma-names
>  
> -- 
> 2.31.1
> 
> 
