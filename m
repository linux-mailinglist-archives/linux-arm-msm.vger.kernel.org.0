Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8F2294878
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 08:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395095AbgJUGui (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 02:50:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:42444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395092AbgJUGui (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 02:50:38 -0400
Received: from localhost (unknown [122.179.16.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7EDF9221FC;
        Wed, 21 Oct 2020 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603263037;
        bh=ylP3DH3tY3xM8SDYc3rNdp/fQn48+oKGksLcmWHXyP8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SCnGUa5dYGw+bFVe+4u4NQx3ppKUYoobyTkAtTIjxKRLWNx8P7Fw+CnDOQb9X/XSR
         RdY8+0cXP2ixUcwX2BR0bjzDJGZbNbGMPw87HjsOazzeiH+vrN6u9CKrx7EYYRt5dT
         9GIqnKk2D0dmcN5Dp+kJXT1PiH3WXkjg3pzrb0fg=
Date:   Wed, 21 Oct 2020 12:20:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH] arm64: dts: sdm845: Add iommus property to qup
Message-ID: <20201021065033.GC9746@vkoul-mobl>
References: <20201020150301.3259814-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020150301.3259814-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn, Steve,

On 20-10-20, 08:03, Bjorn Andersson wrote:
> From: Stephen Boyd <swboyd@chromium.org>
> 
> The SMMU that sits in front of the QUP needs to be programmed properly
> so that the i2c geni driver can allocate DMA descriptors. Failure to do
> this leads to faults when using devices such as an i2c touchscreen where
> the transaction is larger than 32 bytes and we use a DMA buffer.

So I tried this and results in reboot for me when I use it in GSI
driver in RB3. I seem to already have the iommu properties [1] but values
are different

[1]: https://git.linaro.org/people/vinod.koul/kernel.git/commit/?h=topic/gsi3-db&id=385edef08d55432a40fc9a8ae1f49248d5417a92

> arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
> arm-smmu 15000000.iommu:         GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000006c0, GFSYNR2 0x00000000
> 
> Add the right SID and mask so this works.
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> [bjorn: Define for second QUP as well]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 8eb5a31346d2..7d635bc919cb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -811,6 +811,7 @@ qupv3_id_0: geniqup@8c0000 {
>  			clock-names = "m-ahb", "s-ahb";
>  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			iommus = <&apps_smmu 0x0 0x3>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> @@ -1119,6 +1120,7 @@ qupv3_id_1: geniqup@ac0000 {
>  			clock-names = "m-ahb", "s-ahb";
>  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
>  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			iommus = <&apps_smmu 0x6c0 0x3>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> -- 
> 2.28.0

-- 
~Vinod
