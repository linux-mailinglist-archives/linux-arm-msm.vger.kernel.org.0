Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EF144F573
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 22:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236065AbhKMV0M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 16:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236035AbhKMV0M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 16:26:12 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C24C061200
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 13:23:19 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so19014842otg.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 13:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PgwFOxRbye665HPAHu5pKtfz1gVh/X9N9qhHERxK7Qc=;
        b=EhbkkVpKZ33C5U5LivBDvf64Xhlyt7NJtaOhq3LItqpkZZykiL+hKkW62GcXstACoa
         idT4ZaSM++SZPQxJFr6LOnvqsNNiCT72YF/By9JBbd+4DvNP0MdB80govrtvPZSRvOM/
         CXWU3y3duhKVC8HwoWO1+KXZEytz16tr81kJlyd7En+ZJDhsvcLPwWBWGVmJrPZ1HvPa
         me8ltNq/EUkVt0Ku2z36uAoLw1png1IxQz7c9CfQHv5DQNeBayO1JHKqbfNn1uUM5YAA
         0fquAI0VbVnERcVre4k9iUrP527i8GblEraGmXUVd0oot7N2XkMf5YuDVqdDf1V0vnNg
         njsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PgwFOxRbye665HPAHu5pKtfz1gVh/X9N9qhHERxK7Qc=;
        b=UkndV/mcznQGdi9HpLC3AjqkBoIKlfUcbiF0z97BEBHZz8RSgq1LxsFyKye6Hxn5a3
         TtAXbkoMvD8i++NPp6YOSHWOCl4J1xnvmuAnJqXOqHLr2Zd1lZIeOy7CJvrJ5WtttNo5
         qmQXNg6MchspHRhbJFqfaRUdgToNze8o3dOGtj9u4Cy6LH1Ag8MIOnxXm2/8HU+SuDxy
         tT+Ur/xspXP5mZukcd6TB3yaILhF0LflEvQDzkjIgm0/cvzKnrxBPmWhk+WoZH/OIvLA
         IU6Uf7BHR5JK6aNiL41rf9CTtLy7KwgqnnKS42GnW3s9FtuhMhRHjsEiVVBibfzfqnhk
         s3DQ==
X-Gm-Message-State: AOAM532Mx5k16GXJAHjKGx4RcK+ZQJqNcC9PKmw6hL1+xPG/F0ZsoIr7
        TbxNGeBY0Q69+aQDjCw6rY5jgw==
X-Google-Smtp-Source: ABdhPJw/WPzsbdAMiyWODFphyNDeI0fEqz0ppcNwT1aOcGe67xBZg3TpAzzUGNGDnVJN8+jOm3P55g==
X-Received: by 2002:a9d:f63:: with SMTP id 90mr17065550ott.268.1636838598630;
        Sat, 13 Nov 2021 13:23:18 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s205sm2179463oie.37.2021.11.13.13.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 13:23:18 -0800 (PST)
Date:   Sat, 13 Nov 2021 15:23:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 10/22] dt-bindings: qcom-qce: Add 'iommus' to optional
 properties
Message-ID: <YZAswXhDql3v2JqA@builder.lan>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-11-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110105922.217895-11-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Nov 04:59 CST 2021, Bhupesh Sharma wrote:

> Add the missing optional property - 'iommus' to the
> device-tree binding documentation for qcom-qce crypto IP.
> 
> This property describes the phandle(s) to apps_smmu node with sid mask.

"This property describes the iommu streams for crypto pipes" or
something along those lines - depending on what those streams actually
represent.

> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/crypto/qcom-qce.yaml          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index f35bdb9ee7a8..efe349e66ae7 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -32,6 +32,12 @@ properties:
>        - const: bus
>        - const: core
>  
> +  iommus:
> +    minItems: 1
> +    maxItems: 8
> +    description: |

No need for the '|' here...

> +      phandle to apps_smmu node with sid mask.
> +
>    interconnects:
>      maxItems: 1
>      description:
> @@ -70,4 +76,9 @@ examples:
>          clock-names = "iface", "bus", "core";
>          dmas = <&cryptobam 2>, <&cryptobam 3>;
>          dma-names = "rx", "tx";
> +        iommus = <&apps_smmu 0x584 0x0011>,
> +                 <&apps_smmu 0x586 0x0011>,
> +                 <&apps_smmu 0x594 0x0011>,
> +                 <&apps_smmu 0x596 0x0011>;
> +

Extra empty line here.

Regards,
Bjorn

>      };
> -- 
> 2.31.1
> 
