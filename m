Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95EAF33E162
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 23:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhCPW2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 18:28:31 -0400
Received: from mail-il1-f177.google.com ([209.85.166.177]:37976 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhCPW2a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 18:28:30 -0400
Received: by mail-il1-f177.google.com with SMTP id f10so14220731ilq.5;
        Tue, 16 Mar 2021 15:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KZF2IUAZVdcUGG23s3R2g6WJv4TZQM/Lti0qI3yptWc=;
        b=LocLgHjLfH5OrNjgVJWTVT4z4gSaL3S8J/TC79XbgnWrx5i69gzABLe7+BQ9wa1PUs
         KYSA1tYA4HekDtsIcxXXa0PfoPmUhXXRGm7frhAlod0EHBbCj0DWRk+jLYaJ7+2cYYcB
         n2ZpAjOXOLefM3K72Hoz7KWBUl17AuN+bDNMorHtRexA8MXG8J8hASJDcJbN6X9OT2ad
         MDGuCUL0PB3LgmiqGNYjOeOZWKfv0ZMxzrcMZzyLn6KCVW4iwdiurApWt33Yx2agSSJg
         h/1RzsIWdFJfVfFQ2lfRn6F4gk4gXHeS/vlhG8Ig7eLBAgYip8eJlCZ1BS4p33s4Q/yu
         26iQ==
X-Gm-Message-State: AOAM533EBGwRiK2bUPZrZeFowY9p+8eT5NqBdwi+gd6vRIRDaDMUKHiG
        et8iQiTviOtxHwTX/I2WoQ==
X-Google-Smtp-Source: ABdhPJwh3xw/09JpuwcCGh+7MpZW+l36DoUCtfOz7o2ub5/Q7DpAbPKwpLRdckE8SGmnfOuRX2FMTA==
X-Received: by 2002:a05:6e02:178e:: with SMTP id y14mr5303720ilu.175.1615933709855;
        Tue, 16 Mar 2021 15:28:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c18sm10296673ild.37.2021.03.16.15.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:28:29 -0700 (PDT)
Received: (nullmailer pid 3798476 invoked by uid 1000);
        Tue, 16 Mar 2021 22:28:25 -0000
Date:   Tue, 16 Mar 2021 16:28:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 2/8] dt-bindings: crypto : Add new compatible strings for
 qcom-qce
Message-ID: <20210316222825.GA3792517@robh.at.kernel.org>
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
 <20210310052503.3618486-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310052503.3618486-3-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 10, 2021 at 10:54:57AM +0530, Bhupesh Sharma wrote:
> Newer qcom chips support newer versions of the qce IP, so add
> new compatible strings for qcom-qce (in addition to the existing
> "qcom,crypto-v5.1").
> 
> With [1], Thara tried to add the support for new compatible strings,
> but we couldn't conclude on the approach to be used. Since we have
> a number of new qcom arm64 SoCs available now, several of which
> support the same crypto IP version, so it makes more sense to use
> the IP version for the compatible string, rather than using the soc
> name as the compatible string.
> 
> [1]. https://lore.kernel.org/linux-arm-msm/20201119155233.3974286-7-thara.gopinath@linaro.org/
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: bhupesh.linux@gmail.com
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> index 07ee1b12000b..217b37dbd58a 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> @@ -2,7 +2,11 @@ Qualcomm crypto engine driver
>  
>  Required properties:
>  
> -- compatible  : should be "qcom,crypto-v5.1"
> +- compatible  : Supported versions are:
> +		- "qcom,crypto-v5.1", for ipq6018
> +		- "qcom,crypto-v5.4", for sdm845, sm8150

2 SoCs sharing 1 version doesn't convince me on using version numbers. 
Having 4 versions for 5 SoCs further convinces me you should stick with 
SoC specific compatibles as *everyone* else does (including most QCom 
bindings).

> +		- "qcom,crypto-v5.5", for sm8250
> +		- "qcom,crypto-v5.6", for sm8350
>  - reg         : specifies base physical address and size of the registers map
>  - clocks      : phandle to clock-controller plus clock-specifier pair
>  - clock-names : "iface" clocks register interface
> -- 
> 2.29.2
> 
