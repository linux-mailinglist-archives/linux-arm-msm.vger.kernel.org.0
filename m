Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942862EAF71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbhAEPwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:52:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:35726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727895AbhAEPwl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:52:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFEDE2070C;
        Tue,  5 Jan 2021 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861920;
        bh=EUvF9koFFptHC3ISfE3MmErKzO5wDuE1REOI4TNv9e4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c7nn6ux4Y0QNFf44ALmDXWB6WvIOsKbS+KYNALGOllUo7TqeUOZlN3AINZMA7f8FQ
         SjEv97Az4vQ0wcrvjP1Tfuuvc9y2scV/CZZGHqCJpmK7KITwXqVbvSvB97rA2A+CcG
         5/HPA15pn7rpWRoNOGvpfwPl7Fbxjp/QE6X43DQJ51lsbymRY7CSpuI9P4VRXTAZmH
         o1eLuUwJddC8YPer8yjM3CVlGYyGQIo/6tiMlwQr8txNeYWrq8GWt8uaWEIA0PLF9N
         ktPMRatWi+XIxXQ5QCtBaRNZ6n71DjRLUbXyckx7Dn0pU1GS6pP7uCkyetZKMHcE67
         M55zo3krW5VAQ==
Date:   Tue, 5 Jan 2021 21:21:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/18] ARM: dts: qcom: sdx55: Add Shared memory
 manager support
Message-ID: <20210105155157.GG2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-9-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-9-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> Add smem node to support shared memory manager on SDX55 platform.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index e48ec7a1971b..622a63b0058f 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -177,6 +177,12 @@ tcsr_mutex: hwlock {
>  			#hwlock-cells = <1>;
>  		};
>  
> +		smem {
> +			compatible = "qcom,smem";
> +			memory-region = <&smem_mem>;
> +			hwlocks = <&tcsr_mutex 3>;
> +		};
> +
>  		pdc: interrupt-controller@b210000 {
>  			compatible = "qcom,sdx55-pdc", "qcom,pdc";
>  			reg = <0x0b210000 0x30000>;
> -- 
> 2.25.1

-- 
~Vinod
