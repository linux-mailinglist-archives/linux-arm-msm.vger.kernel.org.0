Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356A0454076
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 06:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbhKQF4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 00:56:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:45520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233348AbhKQF4D (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 00:56:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C206C60E08;
        Wed, 17 Nov 2021 05:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637128385;
        bh=FoIpIh0kWZhRl7ZuVuarWxUqjOzcP3NUPIm79CZvako=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gwIIQt3I/u+7T4N3Adz1s9U12jXTJFrI4PJo2KUxZbUOCP/FkjwkV7v/M+TvE8SGR
         Nvmw11cVlGkr8gXZaX453XRnGAacRSb9uRwM4dhvaelHlRrOtu1IROG+3HEM3dT0Y6
         SjzVOC7t4JOxt57jq3dvLsqLtlwJjKY7jkW4G1AdH1G2WKjyl294OA04uvVJoy2HDW
         4VKSxZDhIxf6+PF/E3R/4e687d7+Gvc9MoPgbaM3kF9XOO0M3DgfDUviSuW5hYa9FZ
         kbzOJHuP9/nls56zwWy5CMHdWJyg6mjUXqT1j8OrzJD8tHloZW2iZCRF7Df0ipxMgN
         UDSjprpO/vKCw==
Date:   Wed, 17 Nov 2021 11:23:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 02/22] arm64: dts: qcom: msm8996: Fix 'dma' nodes in
 dts
Message-ID: <YZSYvBEoDExaaGD5@matsya>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110105922.217895-3-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-11-21, 16:29, Bhupesh Sharma wrote:
> Preparatory patch for subsequent patch in this series which
> converts the qcom_bam_dma device-tree binding into YAML format.
> 
> Correct dma-controller node inside msm8996 dts, which
> leads to following errors with 'make dtbs_check':
> 
>      dma@164400: $nodename:0: 'dma@164400' does not match
>      '^dma-controller(@.*)?$'
> 
> Fix the same.


Looks like one more crept in, this is the only one.. I did fix a bunch
previously...

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 27683d7fdfe6..508cd9d06350 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -705,7 +705,7 @@ tsens1: thermal-sensor@4ad000 {
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> -		cryptobam: dma@644000 {
> +		cryptobam: dma-controller@644000 {
>  			compatible = "qcom,bam-v1.7.0";
>  			reg = <0x00644000 0x24000>;
>  			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.31.1

-- 
~Vinod
