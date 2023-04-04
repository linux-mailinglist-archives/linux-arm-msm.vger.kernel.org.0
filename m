Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6CAF6D6D2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 21:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235857AbjDDTaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 15:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235874AbjDDTaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 15:30:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842DF49DF;
        Tue,  4 Apr 2023 12:30:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A877963391;
        Tue,  4 Apr 2023 19:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDA5C433D2;
        Tue,  4 Apr 2023 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680636609;
        bh=RG89+5kPRUwR9k9Bvna0hUHCqED7uHCr7Ee16EjKvzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t8/FYXxo9PXl5a4jGlYCVjomNpM/ycB4LKHZz8UlGCtFiVznb+sLvVQrkEOfzGOgX
         qD2QZsQZcgkAjlRWuFoTEiXXoH3AnWfk11dBSno6wNVx6mXfKHMRFJ5VqCjx+9XU4c
         XDyEgTab4Hzrw4W/EEex4QdnyTWNu56sOzWfwzxGhLI0qBqMs66VjthL2Txj14Rycz
         4VrGi2VnHF68+58MIhsS+iDwkXa3ef3GQG6owdXNcTD7z7ilxTFvF7aYHMRZpc3bgy
         OkQMR+kJcjUSkM3mW2wT9QMVuSfjORvfs2/cT4xRJUyqagENZ9Ccyb5m5aaGeNXGmq
         gnJVMxC1r1Taw==
Date:   Tue, 4 Apr 2023 12:33:02 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sdm845: add framebuffer
 reserved memory
Message-ID: <20230404193302.ukwdf2cuqr33rbus@ripper>
References: <20230315111947.3807083-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315111947.3807083-1-caleb.connolly@linaro.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 15, 2023 at 11:19:45AM +0000, Caleb Connolly wrote:
> The bootloader configures a framebuffer in memory to display splash
> screens or other information. This configuration is overriden when the
> display pipeline probes, but never unmapped from the SMMU.

Are you saying that as the SMMU driver clears the register content, this
mapping remains?

> To prevent
> issues from the kernel trying to allocate in this region and to allow
> using the framebuffer for debugging, many devices already reserve this
> region.
> 

What kind of issues do you see?

Regards,
Bjorn

> All devices follow MTP and use the same address for this region, Cheza
> is a likely exception though I'm not able to validate that.
> 
> Some devices only reserve the size needed to store the actual
> framebuffer, this is incorrect as on all devices I've checked the full
> 0x2400000 bytes are mapped.
> 
> This patch moves the framebuffer region to sdm845.dtsi and removes it
> from each individual device. This ensures that the correct size is
> always reserved and prevents having the add the region for each
> individual device.
> 
> This patch specifically ensures that this region is now reserved on the
> OnePlus 6, where it wasn't before.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> 
> Changes since v1:
>  * Offer more context and justification for this change
>  * Make sure Cheza doesn't inherit the node.
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi              | 6 ------
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts     | 5 -----
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts           | 5 -----
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi       | 6 ------
>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                        | 5 +++++
>  arch/arm64/boot/dts/qcom/sdm850.dtsi                        | 2 ++
>  7 files changed, 7 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index f942c5afea9b..6a1c674a015b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -93,12 +93,6 @@ spss_mem: memory@99000000 {
>  			no-map;
>  		};
>  
> -		/* Framebuffer region */
> -		memory@9d400000 {
> -			reg = <0x0 0x9d400000 0x0 0x2400000>;
> -			no-map;
> -		};
> -
>  		/* rmtfs lower guard */
>  		memory@f0800000 {
>  			reg = <0 0xf0800000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index d37a433130b9..7c2457948a32 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -55,11 +55,6 @@ vreg_s4a_1p8: pm8998-smps4 {
>  	};
>  
>  	reserved-memory {
> -		memory@9d400000 {
> -			reg = <0x0 0x9d400000 0x0 0x02400000>;
> -			no-map;
> -		};
> -
>  		memory@a1300000 {
>  			compatible = "ramoops";
>  			reg = <0x0 0xa1300000 0x0 0x100000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index b54e304abf71..4f6b1053c15b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -60,11 +60,6 @@ key-vol-up {
>  	};
>  
>  	reserved-memory {
> -		framebuffer_region@9d400000 {
> -			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
> -			no-map;
> -		};
> -
>  		ramoops: ramoops@b0000000 {
>  			compatible = "ramoops";
>  			reg = <0 0xb0000000 0 0x00400000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 4984c7496c31..7e273cc0158d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -79,12 +79,6 @@ vreg_s4a_1p8: pm8998-smps4 {
>  	};
>  
>  	reserved-memory {
> -		/* SONY was cool and didn't diverge from MTP this time, yay! */
> -		cont_splash_mem: memory@9d400000 {
> -			reg = <0x0 0x9d400000 0x0 0x2400000>;
> -			no-map;
> -		};
> -
>  		ramoops@ffc00000 {
>  			compatible = "ramoops";
>  			reg = <0x0 0xffc00000 0x0 0x100000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index e0fda4d754fe..191c2664f721 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -98,12 +98,6 @@ spss_mem: memory@97f00000 {
>  			no-map;
>  		};
>  
> -		/* Cont splash region set up by the bootloader */
> -		cont_splash_mem: framebuffer@9d400000 {
> -			reg = <0 0x9d400000 0 0x2400000>;
> -			no-map;
> -		};
> -
>  		rmtfs_mem: memory@f6301000 {
>  			compatible = "qcom,rmtfs-mem";
>  			reg = <0 0xf6301000 0 0x200000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 479859bd8ab3..ecec2ee46683 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -865,6 +865,11 @@ spss_mem: spss@97b00000 {
>  			no-map;
>  		};
>  
> +		cont_splash_mem: framebuffer@9d400000 {
> +			reg = <0 0x9d400000 0 0x2400000>;
> +			no-map;
> +		};
> +
>  		mdata_mem: mpss-metadata {
>  			alloc-ranges = <0 0xa0000000 0 0x20000000>;
>  			size = <0 0x4000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
> index da9f6fbe32f6..b787575c77a5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
> @@ -7,6 +7,8 @@
>  
>  #include "sdm845.dtsi"
>  
> +/delete-node/ &cont_splash_mem;
> +
>  &cpu4_opp_table {
>  	cpu4_opp33: opp-2841600000 {
>  		opp-hz = /bits/ 64 <2841600000>;
> -- 
> 2.39.2
> 
