Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 473344FB323
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 07:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244701AbiDKFMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 01:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244695AbiDKFMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 01:12:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A133F3EF03;
        Sun, 10 Apr 2022 22:10:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 39398612A3;
        Mon, 11 Apr 2022 05:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1289C385A3;
        Mon, 11 Apr 2022 05:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649653819;
        bh=q78ZDZwdpAzo4ScfDXq/qnr6Aww85RpMmeyGFIznRiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tsU8diH2xPD2CeHwPFKqZFrRhd40dPmoor1s4QYNtfeAjVI590UD5oxFPn7e19qYH
         C1gtSd650AZuRWoJz7OashO/lqSAT8dRnursifwFnqOmwzgrfPV6OFnIvjQoSRxQxM
         0nYVVZPW2ywOVX1BBHd8US5d0Fss2+kYg1U/cqZ8xnJAaazRvHVmMLSvkuhWxAwF2x
         qELQo4iLDQd/Nd9XA50KRwvn7PoXsbkmNBwqG/m9MaSBNlQBV/+xNU9I2UBPfIr+Nk
         5GZptffVIfs6PPa4RSI4GGmRsiSdGLyvyintzaCDQG4Oeq6Gvw1pG6BSf0lM+RquQo
         a8k+uD/xK9+bw==
Date:   Mon, 11 Apr 2022 10:40:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8450-qrd: add missing PMIC
 includes
Message-ID: <YlO4NGOfZbQZWygq@matsya>
References: <20220410205127.1670705-1-dmitry.baryshkov@linaro.org>
 <20220410205127.1670705-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410205127.1670705-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-04-22, 23:51, Dmitry Baryshkov wrote:
> Add includes for PMICs used on the SM8450-HDK. This makes GPIO blocks
> and thermal sensors available to the user of the platform.

Problem is that we need spmi driver and binding merged before we can
merge this. I have not sent the patch for that reason :(


> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> index 9526632d4029..b7ea92045bc4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> @@ -7,6 +7,13 @@
>  
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm8450.dtsi"
> +#include "pm8350.dtsi"
> +#include "pm8350b.dtsi"
> +#include "pm8350c.dtsi"
> +#include "pm8450.dtsi"
> +#include "pmk8350.dtsi"
> +#include "pmr735a.dtsi"
> +#include "pmr735b.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8450 QRD";
> -- 
> 2.35.1

-- 
~Vinod
