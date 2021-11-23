Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD46A459AEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 05:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhKWEGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 23:06:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:44512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230018AbhKWEGu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 23:06:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1B5460230;
        Tue, 23 Nov 2021 04:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637640222;
        bh=R+h3QJow3TtoFMCwVJ9/RCeEtoHcvYiLQy1VjPYetMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YnT5RXeGcfK5dwjEnnH/lBDH2HNlBGxFqcCQFVkaGFF+71v345TeW74TR0oGX5IhJ
         66s6FQEs8+0L2C+QK/86oxQYfHADr/LcYKGjkz6eyExSW+98N7EHUMXz5c1icMa8ov
         fcziecs8EX/Yrdcy4a0DDOPMb54aSBgErWz7QoKSVHZBXCAH4OzRIhMKfoU4HVvfZP
         /eDBsSd6toLW2GA9CtIJ+4oxfSCEFzMewp2rlzYAfn5bBFE6ImxUhBiN0vDW7y6Nwn
         4iBTwqR2VsiKp9vCHDWIyFbpwRwhQSIDbZw2BVWu17A5jbx56qS2wVCe5xqHRBw7th
         xW1HNJ6Ww2UWA==
Date:   Tue, 23 Nov 2021 09:33:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Katherine Perez <kaperez@linux.microsoft.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: sm8350: fix tlmm base address
Message-ID: <YZxoGp33Seaa2WEG@matsya>
References: <20211122190552.74073-1-kaperez@linux.microsoft.com>
 <20211122190552.74073-3-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122190552.74073-3-kaperez@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-11-21, 11:05, Katherine Perez wrote:
> TLMM controller base address is incorrect and will hang on some platforms.
> Fix by giving the correct address.

Thanks, recheck the spec this looks correct. We should have tlmm reg
space here and not tlmm base which also contains xpu region (thus hang)

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Fixes: b7e8f433a673 ("arm64: dts: qcom: Add basic devicetree support for SM8350 SoC")

> 
> Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index d134280e2939..624d294612d8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -960,9 +960,9 @@ spmi_bus: spmi@c440000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> -		tlmm: pinctrl@f100000 {
> +		tlmm: pinctrl@f000000 {
>  			compatible = "qcom,sm8350-tlmm";
> -			reg = <0 0x0f100000 0 0x300000>;
> +			reg = <0 0x0f000000 0 0x300000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
> -- 
> 2.31.1

-- 
~Vinod
