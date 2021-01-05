Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AEC2EAF73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbhAEPxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:53:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:35806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729315AbhAEPxJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:53:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8627D2229C;
        Tue,  5 Jan 2021 15:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861949;
        bh=LSI1r/5CSEj435I4y7a6AZ0tkwIplTR3N3qiwuCac5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KrxGS0bRwfUx31d8a2RDsbOfxVYqSnAe3ADaG8rTYQKyJiKtccNo1Tf9PdOhLn08+
         7gQUZrLx1/wM/nYvL3hRWVhQdK3caa1moAQwLk+WiTQKRyKQn6XpkO/Da6+HQEJtyW
         G3BwNmu1BnD0+oN80CrexcEyS7EZ6i0iW2ikCZjxYgCBOGONo0S+NnIsRfKph5rryH
         uxCO5Fp+cmdbJlexDVaj4G+o3C/S9YbxMoLc/XQYaGBI4HkxKhoVf+lg89cemDdQNL
         se7fsRxjvs4UpphupS0TNq+IPLR7a7hwnlEXWevKsUZZe0+3En7JuPQIDhktXDU6HJ
         Gbux5y07138Mw==
Date:   Tue, 5 Jan 2021 21:22:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/18] ARM: dts: qcom: sdx55: Add support for TCSR
 Mutex
Message-ID: <20210105155225.GH2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-8-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-8-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> Add TCSR Mutex node to support Qualcomm Hardware Mutex block on SDX55
> platform.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index 927f43a7414c..e48ec7a1971b 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -166,6 +166,17 @@ sdhc_1: sdhci@8804000 {
>  			status = "disabled";
>  		};
>  
> +		tcsr_mutex_block: syscon@1f40000 {
> +			compatible = "syscon";
> +			reg = <0x1f40000 0x20000>;
> +		};
> +
> +		tcsr_mutex: hwlock {
> +			compatible = "qcom,tcsr-mutex";
> +			syscon = <&tcsr_mutex_block 0 0x1000>;
> +			#hwlock-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b210000 {
>  			compatible = "qcom,sdx55-pdc", "qcom,pdc";
>  			reg = <0x0b210000 0x30000>;
> -- 
> 2.25.1

-- 
~Vinod
