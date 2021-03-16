Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD15B33CDDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 07:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbhCPGPg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 02:15:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233182AbhCPGPG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 02:15:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9665650D2;
        Tue, 16 Mar 2021 06:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615875305;
        bh=2KvQFSd+A1txflrH0B43mlebUyCPAclI0WHaLnVfA04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XqG4NP3vygqVfWQUbA8sXGH+hwVi+OxhUtWJtnDP7qQY0DBC/Sgax6sk8xCQq/DDG
         TJmgC7gUA1+edz5MsMnYOOJAgv+UGZBr1wN1nqppoisvqe9aEjVgrXYYdJ8n11//bS
         VpgDDPBBwAaCORanqtfqoQ5CXfZGLvAEMk10OoJkcMo0gsqdJpqpFqgXiUDfGmclFl
         WXgu5R4e9PTPNaR1naYG8Hjx3wDpfJxddKHdAdydRF4tJlV+C2TndNf6SBhtUUwuLG
         tQE7eHw/MNSbk7uW7Z4krY0FY9xngDSs+s29oCmmQvunpQ3WsOMWsTW7S3GVKBx4wY
         fYjyeaonmznxQ==
Date:   Tue, 16 Mar 2021 11:45:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: add iommus to qups
Message-ID: <YFBM5Up5caWZCMSx@vkoul-mobl>
References: <20210310163024.393578-1-caleb@connolly.tech>
 <20210310163024.393578-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310163024.393578-3-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-03-21, 16:31, Caleb Connolly wrote:
> Hook up the SMMU for doing DMA over i2c. Some peripherals like
> touchscreens easily exceed 32-bytes per transfer, causing errors and
> lockups without this.

Why not squash this to patch 1..?

> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
> Fixes i2c on the OnePlus 7, without this touching the screen with more
> than 4 fingers causes the device to lock up and reboot.
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 03e05d98daf2..543417d74216 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -583,6 +583,7 @@ qupv3_id_0: geniqup@8c0000 {
>  			clock-names = "m-ahb", "s-ahb";
>  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			iommus = <&apps_smmu 0xc3 0x0>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> @@ -595,6 +596,7 @@ qupv3_id_1: geniqup@ac0000 {
>  			clock-names = "m-ahb", "s-ahb";
>  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
>  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			iommus = <&apps_smmu 0x603 0x0>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> @@ -617,6 +619,7 @@ qupv3_id_2: geniqup@cc0000 {
>  			clock-names = "m-ahb", "s-ahb";
>  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
>  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
> +			iommus = <&apps_smmu 0x7a3 0x0>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> -- 
> 2.29.2
> 

-- 
~Vinod
