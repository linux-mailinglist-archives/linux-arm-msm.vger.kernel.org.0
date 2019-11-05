Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9E73EF548
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 07:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730479AbfKEGCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 01:02:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:44170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730520AbfKEGCz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 01:02:55 -0500
Received: from localhost (unknown [106.201.60.252])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6400120818;
        Tue,  5 Nov 2019 06:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572933774;
        bh=Adr963WRlh5HjK13+m1iekOv9cCt3ddxETiP+Guxcp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=umHTxwaFvOaVM+nKqOg3CVVW9K7zsMx7qvTi1pIVZPGZ1WpX75tmC5cMnW7wAePnU
         j7RNOfS9eYGa+9nDFB4Zgfdun3F+v4xUJbRdaNLQzhEwdsNrl5xbt0dwNMBG0rXXAf
         jV/3LxzOxwwUDZtvayjhoCO+AWYRTIkqd1gzLBIU=
Date:   Tue, 5 Nov 2019 11:32:49 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy
 compatible string
Message-ID: <20191105060249.GX2695@vkoul-mobl.Dlink>
References: <20191024074802.26526-1-vkoul@kernel.org>
 <20191024074802.26526-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024074802.26526-3-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-10-19, 13:18, Vinod Koul wrote:
> Document "qcom,sdm845-qmp-ufs-phy" compatible string for QMP UFS PHY
> found on SM8150.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Kishon,

Can you pick this and 3rd patch please

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

-- 
~Vinod
