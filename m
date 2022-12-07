Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0300C645F8A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 18:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiLGRAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 12:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiLGQ75 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 11:59:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A278862E97;
        Wed,  7 Dec 2022 08:59:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4205D61B46;
        Wed,  7 Dec 2022 16:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1358DC433D6;
        Wed,  7 Dec 2022 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670432391;
        bh=W8J5N1BsxMFjfZ42EvdJp9Vq5tH6Mw6JOypp7rTrmnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cgqEwXT9MB2Fq3nwC2731i4+LHABp8ABms3rFlleeGcsLX0rDryxydnF1w8U0yl+u
         2aNiSFFwzbNtg5o2oUQ1Qn6z2y1YZV5W/b6KOd+R6/pgBEEL6kXz4Rd8UoUObMmFE0
         yR+zaCqjSQDm0q5lhhiAuwBVNDG9XFEtfw/i6DQqCCmwjiRo4oJrjlVZ+OUhYjxkb3
         DjdffCNCz0Ua2dfdBykC2xkO+IgDrXY9UyFKO6h7kPYLbmFOFtZd6BaJYhEjiHwUS3
         RzP1UaWg2PyLlohYN7JhBGSPzKP7gt6Nho0H6B21A1SfgIgxU2O1M8V7TmCs2psV8O
         c0kbbD5F5WkVw==
Date:   Wed, 7 Dec 2022 10:59:49 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm670: add qfprom node
Message-ID: <20221207165949.isr6fjibobbqk4b5@builder.lan>
References: <20221206231729.164453-1-mailingradian@gmail.com>
 <20221206231729.164453-2-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221206231729.164453-2-mailingradian@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 06, 2022 at 06:17:30PM -0500, Richard Acayan wrote:
> Some hardware quirks and capabilities can be determined by reading the
> fuse-programmable read-only memory. Add the QFPROM node so consumers
> know if they need to do anything extra to support the hardware.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

PS. Please include a "vN" in the []-part of subject when resubmitting
patches. In this case passing -v 2 to git format-patch would do the
trick for you.

I will pick this up after the upcoming merge window.

Thanks,
Bjorn

> ---
> Changes since v1:
>  - offset address by 0x4000 and zero-pad regs
> 
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index f93705bc549f..c78156e03d93 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -731,6 +731,13 @@ gcc: clock-controller@100000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		qfprom: qfprom@784000 {
> +			compatible = "qcom,sdm670-qfprom", "qcom,qfprom";
> +			reg = <0 0x00784000 0 0x1000>;
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
