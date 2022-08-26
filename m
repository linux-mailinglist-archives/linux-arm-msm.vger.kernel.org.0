Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEE735A2F57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 20:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345283AbiHZSr5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 14:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345286AbiHZSrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 14:47:25 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A954624E
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 11:44:37 -0700 (PDT)
Received: from [192.168.1.101] (afbd60.neoplus.adsl.tpnet.pl [95.49.29.60])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 187F33F35F;
        Fri, 26 Aug 2022 20:44:35 +0200 (CEST)
Message-ID: <3e19dafa-5f7a-5bd2-9663-4fa9beff4ae1@somainline.org>
Date:   Fri, 26 Aug 2022 20:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add Inline Crypto Engine
 registers and clock
Content-Language: en-US
To:     Eric Biggers <ebiggers@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220826071244.185584-1-ebiggers@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220826071244.185584-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.08.2022 09:12, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add the registers and clock for the Inline Crypto Engine (ICE) to the
> device tree node for the UFS host controller on sm8450.  This makes
> ufs_qcom support inline encryption when CONFIG_SCSI_UFS_CRYPTO=y.
> 
> The address and size of the register range, and the minimum and maximum
> frequency of the ICE core clock, all match the values used downstream.
> 
> I've validated this on an SM8450 HDK using the 'encrypt' group of
> xfstests on ext4 with MOUNT_OPTIONS="-o inlinecrypt".
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
dt-bindings needs an update to allow the second reg.

For this patch, however:

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 4978c5ba5dd085..517b3a1fbe7c04 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3069,7 +3069,9 @@ system-cache-controller@19200000 {
>  		ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,sm8450-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
> -			reg = <0 0x01d84000 0 0x3000>;
> +			reg = <0 0x01d84000 0 0x3000>,
> +			      <0 0x01d88000 0 0x8000>;
> +			reg-names = "std", "ice";
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>  			phys = <&ufs_mem_phy_lanes>;
>  			phy-names = "ufsphy";
> @@ -3093,7 +3095,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  				"ref_clk",
>  				"tx_lane0_sync_clk",
>  				"rx_lane0_sync_clk",
> -				"rx_lane1_sync_clk";
> +				"rx_lane1_sync_clk",
> +				"ice_core_clk";
>  			clocks =
>  				<&gcc GCC_UFS_PHY_AXI_CLK>,
>  				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> @@ -3102,7 +3105,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  				<&rpmhcc RPMH_CXO_CLK>,
>  				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>  				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> -				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
> +				<&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>  			freq-table-hz =
>  				<75000000 300000000>,
>  				<0 0>,
> @@ -3111,7 +3115,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  				<75000000 300000000>,
>  				<0 0>,
>  				<0 0>,
> -				<0 0>;
> +				<0 0>,
> +				<75000000 300000000>;
>  			status = "disabled";
>  		};
>  
> 
> base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
