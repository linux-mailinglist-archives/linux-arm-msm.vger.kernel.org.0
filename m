Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B425B2EAF7A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbhAEPyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:54:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:36050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbhAEPyf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:54:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD6302229C;
        Tue,  5 Jan 2021 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609862034;
        bh=qesOvb2T0LmmS8+xTZ6enKDKGL3uHz/gVHtZR92G63k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k2UeYGkk3pJwY4k3NrF2PiX2vxXxy5n7ZQ/rYmvh8OdlLBHvBq0P/cK5RU+8+6Ct7
         ZCJOJIUpH33aIW5iam3TsAzbyQisCDIp5Of6D56ZEKrpCASspuKZjatwcl1iMEjs3H
         AkDew95dcdLMeT3x51Xcuqc7wRSeUqM5iH8/z8NQZgILUvmK1Y8La6JP2ddfhnifU0
         ZpFLM3n1OyShf1aXXfaxROxMcwtIKry8QQ0pcSulo8/KwTUvU6u7EqcV1OSLNoo5nD
         nZrgetIihyqa2jej+vOxFV6oLH4oUGCpZ2qAfmZ22Hjm1SwTuWbtMYV+WP6a+xvpMS
         NeHUVv4rj1m1Q==
Date:   Tue, 5 Jan 2021 21:23:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/18] dt-bindings: mmc: sdhci-msm: Document the SDX55
 compatible
Message-ID: <20210105155350.GJ2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> The SDHCI controller on SDX55 is based on MSM SDHCI v5 IP. Hence,
> document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> index 3b602fd6180b..31f4a5628595 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> @@ -21,6 +21,7 @@ Required properties:
>  		"qcom,sdm845-sdhci", "qcom,sdhci-msm-v5"
>  		"qcom,qcs404-sdhci", "qcom,sdhci-msm-v5"
>  		"qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> +		"qcom,sdx55-sdhci", "qcom,sdhci-msm-v5";

Keep this sorted?

With that:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

>  	NOTE that some old device tree files may be floating around that only
>  	have the string "qcom,sdhci-msm-v4" without the SoC compatible string
>  	but doing that should be considered a deprecated practice.
> -- 
> 2.25.1

-- 
~Vinod
