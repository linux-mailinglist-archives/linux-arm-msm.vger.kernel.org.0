Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFFF6A920C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387813AbfIDStZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 14:49:25 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38470 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387798AbfIDStZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 14:49:25 -0400
Received: by mail-pf1-f194.google.com with SMTP id h195so7258079pfe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 11:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2H3HisLujaVicuITcjgTa2Qn1mYPOOWBUaK61tDHU4Y=;
        b=Jl/nK0kDu7dwkYyM8BLtIIaFLIl7vL3JOIfGN7jCb2NdFcw/iAhzudSkvNNFPsbg8c
         cQ+YWTAhOGXZgQoI08agkLLta0Qt7YQrQ7O2uL4HmO5IZbeSgulwU24dEq6FQEyXTvEs
         dVzr5EIqm9iDQVyu+h4aAXdlhstmolVUJ/VL2SWe6HitXj2BsfSYgl31YnetMwOmi3/M
         tIB0bnQutx0hSjdA/Z2Ak3HPPMyXNbxWcF7+gFDDWF/RkyK5PBMgYblAnbY3yjyMQNvH
         cYYWgDKm98S7WkE3tbVRNcJDjqPIddRCHWvLzTprfJDWLFsXFK2QJdUeR4FIvdEAxGcd
         nr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2H3HisLujaVicuITcjgTa2Qn1mYPOOWBUaK61tDHU4Y=;
        b=YujzRHG6Vm+TfO7p69CUuAWE5bfvJt53CNbcQFMFRQJubeOqcEsfc9Nm+TB6QIr4hu
         j/GkKO2l+27sjafK0TRYTm3h15x22lfOuchGsN8vFrUCrhlkJqxUqGi9hVilMQ+UMtCY
         HckxhMNoJTuBesSmtX86XaJVVNIRQ6LDanXNv6qEBey+SLnpMcLSHYJFXa5i/FT7RgMt
         oTLmp1J30H9PgN8ch2Zq59HorVryeUFwZnaY/zn36mZqgM+B6EptYZS2M30ObnLAHUOS
         K+fsXRnRGNxqrqf42c7DDnZzgAZPnlZAvNtXzAsjnV9h4GAalYPZh8aZPHoKwa1j5MD1
         Y1kg==
X-Gm-Message-State: APjAAAUyLH50Rd3T6nv8JfpxCm+6vJ8SlJk4HwTtnTZGJBLIn1ewb0bK
        F0pmQQEMNpTZGoTZMV7LoCAEOg==
X-Google-Smtp-Source: APXvYqziqAT7n5Kfgw9qR5cEOsU0qgImjdF/7laCJroo74mFI8nu2IfeQSI8j/XIK6gejcX5l0HwbQ==
X-Received: by 2002:a63:6c7:: with SMTP id 190mr36016327pgg.7.1567622964777;
        Wed, 04 Sep 2019 11:49:24 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x12sm9283245pff.49.2019.09.04.11.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 11:49:24 -0700 (PDT)
Date:   Wed, 4 Sep 2019 11:49:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy
 compatible string
Message-ID: <20190904184921.GG574@tuxbook-pro>
References: <20190904100835.6099-1-vkoul@kernel.org>
 <20190904100835.6099-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904100835.6099-3-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Sep 03:08 PDT 2019, Vinod Koul wrote:

> Document "qcom,sdm845-qmp-ufs-phy" compatible string for QMP UFS PHY
> found on SM8150.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index 085fbd676cfc..eac9ad3cbbc8 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -14,7 +14,8 @@ Required properties:
>  	       "qcom,msm8998-qmp-pcie-phy" for PCIe QMP phy on msm8998,
>  	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
>  	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
> -	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845.
> +	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
> +	       "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150.
>  
>  - reg:
>    - index 0: address and length of register set for PHY's common
> @@ -57,6 +58,8 @@ Required properties:
>  			"aux", "cfg_ahb", "ref", "com_aux".
>  		For "qcom,sdm845-qmp-ufs-phy" must contain:
>  			"ref", "ref_aux".
> +		For "qcom,sm8150-qmp-ufs-phy" must contain:
> +			"ref", "ref_aux".
>  
>   - resets: a list of phandles and reset controller specifier pairs,
>  	   one for each entry in reset-names.
> @@ -83,6 +86,8 @@ Required properties:
>  			"phy", "common".
>  		For "qcom,sdm845-qmp-ufs-phy": must contain:
>  			"ufsphy".
> +		For "qcom,sm8150-qmp-ufs-phy": must contain:
> +			"ufsphy".
>  
>   - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
>   - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
> -- 
> 2.20.1
> 
