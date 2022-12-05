Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C490643962
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 00:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiLEXVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 18:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiLEXVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 18:21:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AFA17AB4;
        Mon,  5 Dec 2022 15:21:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A94A461472;
        Mon,  5 Dec 2022 23:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABA9C433D6;
        Mon,  5 Dec 2022 23:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670282466;
        bh=VoYS6nkf8OD5lbUxlXWhVJUvZLl8dSesij0AjBK2dfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jd7oWhxwdoI0q2TPSi8QP5xKi9qzOmhjjRjQnThdmYExipVWRFtoF+e1p+MYoWcVU
         EKow5gf5EGV3eC+FYEumrHlCvEtIMoxAy4Mum/iIv36gMAOwGnHyR0d4Dqzp6GpFRH
         P8S7V4OBFDd5UEsHQDp2bZPtd+BTvmFIw3mt3dPeJIvurkV8rcnWHPJD/II8sXacmY
         nL20IAZb+8tpWYc1pKqF7ozArwpwht3T3EapT6u+BwBVcB6CxJwtNFtZwNPsxqFmKe
         bNPMZiv6b/VEFaeAY0pGOHgBG5h3dxAJElJS4r6utg/9m1PriVCCyRw+YOIwKSHVsF
         2mmq0e6txIstw==
Date:   Mon, 5 Dec 2022 17:21:03 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm670: add qfprom node
Message-ID: <20221205232103.bz4ar3dbmocfl3yv@builder.lan>
References: <20221205230116.2204-1-mailingradian@gmail.com>
 <20221205230116.2204-2-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205230116.2204-2-mailingradian@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 05, 2022 at 06:01:15PM -0500, Richard Acayan wrote:
> Some hardware quirks and capabilities can be determined by reading the
> fuse-programmable read-only memory. Add the QFPROM node so consumers
> know if they need to do anything extra to support the hardware.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index f93705bc549f..933ad2fabf3a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -731,6 +731,13 @@ gcc: clock-controller@100000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		qfprom: qfprom@780000 {
> +			compatible = "qcom,sdm670-qfprom", "qcom,qfprom";
> +			reg = <0 0x780000 0 0x1000>;

I suspect the qfprom block is inherited from SDM845, if so 0x780000
contains raw, uncorrected data, while 0x784000 contains ECC-corrected
versions of these. Please validate and use the same.

Also, please pad the address to 8 digits, to make it easier to check the
sort order.

Thanks,
Bjorn

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		sdhc_1: mmc@7c4000 {
>  			compatible = "qcom,sdm670-sdhci", "qcom,sdhci-msm-v5";
>  			reg = <0 0x007c4000 0 0x1000>,
> -- 
> 2.38.1
> 
