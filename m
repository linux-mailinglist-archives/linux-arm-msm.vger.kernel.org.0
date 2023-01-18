Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 378F9672506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 18:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjARRct (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 12:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjARRcs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 12:32:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE5A3C22;
        Wed, 18 Jan 2023 09:32:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4211FB81E10;
        Wed, 18 Jan 2023 17:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAE4C433EF;
        Wed, 18 Jan 2023 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674063164;
        bh=oOkVe6NlLXFHyslawNIfffm6ZyWuGRm/7hrifYLK3ZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y8QQi2vGpv8BOZFAnm1Xv3oYZIMgLQa/c2f4G/MywRdETD4O2e6nTfzAK41AV94J6
         bT16BAhViuDbcG0PLjQQ7YmnevGXDBC16WOAZOxUae6wAk5mCEValFyxzwAwx8+L3K
         FAjYzZZFeVYlhjovyaLmPTImRYp9odnvqZL1OMOCiQAP7I6cJ57d3I5FinZ0ip76R1
         ehTeG5OqlNexYCz8j27GTU3fOPBSuEYBVRpM7RbZu5zmcdRyDdEbWB5J/EHAfg6uAK
         PqI2n342TRlWBj/HdfphQGOZdVHfPFCQ3zUT/gN8KvWy3AdtNFKNFoV5nGrFPJ9wUx
         Vz61aYiSXn+jQ==
Date:   Wed, 18 Jan 2023 11:32:42 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: dts: qcom: add device tree for DB845c working
 in dual DSI mode
Message-ID: <20230118173242.cjh5izohjros6wxd@builder.lan>
References: <20230118082048.2198715-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118082048.2198715-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 18, 2023 at 10:20:48AM +0200, Dmitry Baryshkov wrote:
> While we are testing the DB845c working in dual DSI mode (which is
> required for the 4k support), create a separate device tree using this
> configuration.
> 

I don't think it's right to change the DTB on your device depending on
your TV's ability to do 4k or not...

I ran into this problem when playing around with 4k-support on the RB3
as well a while back. I was not able to figure out a way to run the
lt9611 off two inputs for the lower resolutions and ended never posted
anything because I couldn't come up with any good solution.


Would it be possible somehow to describe the two ports in DT, but have
the display driver use one or both depending on the number of inputs
needed by the lt9611?

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Dependencies to be able to verify the 4k@30 mode:
> [1] https://lore.kernel.org/linux-arm-msm/20221229191856.3508092-1-dmitry.baryshkov@linaro.org/
> [2] https://lore.kernel.org/dri-devel/20230118081658.2198520-1-dmitry.baryshkov@linaro.org/
> 
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../boot/dts/qcom/sdm845-db845c-dual-dsi.dts  | 48 +++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 3e79496292e7..dc55c3b989a4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -139,6 +139,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-dual-dsi.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
> new file mode 100644
> index 000000000000..4a366dedc841
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-dual-dsi.dts
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023, Linaro Ltd.
> + */
> +
> +#include "sdm845-db845c.dts"
> +
> +&dsi0 {
> +	qcom,dual-dsi-mode;
> +	qcom,master-dsi;
> +};
> +
> +&dsi1 {
> +	vdda-supply = <&vreg_l26a_1p2>;
> +
> +	qcom,dual-dsi-mode;
> +
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_b>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi1_phy {
> +	vdds-supply = <&vreg_l1a_0p875>;
> +	status = "okay";
> +};
> +
> +&lt9611_codec {
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +
> +			lt9611_b: endpoint {
> +				remote-endpoint = <&dsi1_out>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.39.0
> 
