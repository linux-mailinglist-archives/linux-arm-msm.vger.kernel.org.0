Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B192E2EAF66
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbhAEPuU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:50:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:35250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbhAEPuT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:50:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 811012070C;
        Tue,  5 Jan 2021 15:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861779;
        bh=BRbXc+tefTc5fzCuotAm47ZG5qqaGtNSzJbUNjjoa08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L6lYJqgrIygjoybYtpKUdchXgwBslyJ0aJeVlqenDeJ6XddeYQOIUWWyWNSfRyJRu
         Jyh7ID5RnoVuulqsnX0D1G5afNhJcfCxkV3Tpik58Qw2awrCMCUyIQfzPEU+5L7rLo
         VlaAb8hbcuzfs4yE+sSsu5esBMt94Eec2JR6VMa5Sx23GsROYhl/Ei5Z7FUPPLe/BK
         UPp2ZQavd14nLSuaoQFLEwKbZm8EHz9YieSeuwl0pA1iHDg+Qd2ONd/33A5c7gdeUW
         1m1NYcz4K4kncq9GnpN3eAN4hWu3yePYjdMr6Ag1nvHuQ7q4Iidmiwm/HIYbuYgL20
         8XQRq6CD4cB9g==
Date:   Tue, 5 Jan 2021 21:19:35 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/18] dt-bindings: arm-smmu: Add binding for Qcom
 SDX55 SMMU
Message-ID: <20210105154935.GB2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-6-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-6-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> Add devicetree binding for Qualcomm SDX55 SMMU.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 3b63f2ae24db..cc48d90de5fe 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -37,6 +37,7 @@ properties:
>                - qcom,sdm845-smmu-500
>                - qcom,sm8150-smmu-500
>                - qcom,sm8250-smmu-500
> +              - qcom,sdx55-smmu-500

Keep this sorted?

With that:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

>            - const: arm,mmu-500
>        - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
>          items:
> -- 
> 2.25.1

-- 
~Vinod
