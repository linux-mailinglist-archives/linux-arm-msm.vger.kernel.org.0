Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3B02C5AB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 18:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391651AbgKZRfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 12:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391674AbgKZRfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 12:35:39 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061FFC0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 09:35:37 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id o25so3033252oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 09:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gOY/HezNek0HUVN6eUm3quDyWmYoOFo+0d2VCWNsFOQ=;
        b=uyts//qgDq6NIdz41iSPmW0NCMxG4s7vPE2JLlimI8k9Dta7Lp8XN3VJlMbLFtrINE
         ro3BRSTRMv8Umr3glOZq7WmCg6G9Mz1RUKqmM89Rmar/e78MeFdctXcDlc1ZAhFFjdLb
         7Jpkw0WgJOjL9h0qCLWS3Q8yAnWkuFza2aGB86HqlDhpyMfFFen/5YzijCvoCFHHzAj9
         RZ69xF5KjNsRdPkxSoNygXNdaYH/1Kfm9D7iozMjiT1iO4NflgDrIwbbUD5EHy43f8LP
         hndzJaxF4dK4CfHiTWjBHhtT8KvAx3h6t9woa85EBeKLkVa1tyNeLy5aBve1xDhEtYo9
         +yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gOY/HezNek0HUVN6eUm3quDyWmYoOFo+0d2VCWNsFOQ=;
        b=hw3JcOKUQbxvHut8HD5v7xCL9+kwPwAc0MOj1lbOyvDQdnXl3PHC2JCZi2aSikA8lp
         lWgYlZAnndPIyZxVUyzvDwyGa/3b1m6NLQdD0i5sTm7V+auTBCh0kU/ETFNVZyulXSk9
         ojGhtN4vp1zLjeLihJCaxnmLlzWkXaKW5n6Al9xNLsPSs3gkqh3XHNyIVD6VglSerciz
         zDke6HuT6V2bwebtuO+oqxwwL08YrMkvagD6qm+kxp5X6Uw0yL+hVsmP9A2FUfsc21BI
         4RWmF7GLz9LBQMZ+OsC9c/seyzgjFBWi4Qz0aK2FrswXvqj2hmv35zflpksDMPf9uVhV
         OHHA==
X-Gm-Message-State: AOAM530laHjSScsyhcIam4rI235w0Z6IKiexuZ8IkQeJCgrLComazkZb
        gMuY1DPzPYnMTj/As6rYSPCnqQ==
X-Google-Smtp-Source: ABdhPJx8msTvrsuwihO242PXv7u5F1/YsYDoAhSS6k0ZQZqFcGnBf3qEN5bVS8tSjAhdCenA2tCkyg==
X-Received: by 2002:aca:5413:: with SMTP id i19mr2773415oib.87.1606412136991;
        Thu, 26 Nov 2020 09:35:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm3186106otd.2.2020.11.26.09.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:35:35 -0800 (PST)
Date:   Thu, 26 Nov 2020 11:35:34 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PMX55 compatibles
Message-ID: <X7/nZg7tXb8F3rtk@builder.lan>
References: <20201126093018.1085594-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126093018.1085594-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 26 Nov 03:30 CST 2020, Vinod Koul wrote:

> Add PMX55 compatibles for PMIC found in SDX55 platform
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt       | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> index 97c3e0b7611c..bae558b87686 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> @@ -30,6 +30,7 @@ Supported regulator node names:
>  	PMI8998:	bob
>  	PM6150:         smps1 - smps5, ldo1 - ldo19
>  	PM6150L:        smps1 - smps8, ldo1 - ldo11, bob
> +	PMX55:		smps1 - smps7, ldo1 - ldo16
>  
>  ========================
>  First Level Nodes - PMIC
> @@ -47,6 +48,7 @@ First Level Nodes - PMIC
>  		    "qcom,pmi8998-rpmh-regulators"
>  		    "qcom,pm6150-rpmh-regulators"
>  		    "qcom,pm6150l-rpmh-regulators"
> +		    "qcom,pmx55-rpmh-regulators"
>  
>  - qcom,pmic-id
>  	Usage:      required
> -- 
> 2.26.2
> 
