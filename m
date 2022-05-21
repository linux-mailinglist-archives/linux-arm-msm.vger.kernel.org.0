Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8F952FE13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245457AbiEUQR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237279AbiEUQRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:17:55 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2660D77F20
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:17:54 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 210B520630;
        Sat, 21 May 2022 18:17:52 +0200 (CEST)
Date:   Sat, 21 May 2022 18:17:50 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sdm630: fix gpu's
 interconnect path
Message-ID: <20220521161750.3jvvmlfrvk6yxwkp@SoMainline.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521152049.1490220-8-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-21 18:20:45, Dmitry Baryshkov wrote:
> ICC path for the GPU incorrectly states <&gnoc 1 &bimc 5>, which is
> a path from SLAVE_GNOC_BIMC to SLAVE_EBI. According to the downstream

Note that I suggested to reword this sentence for readablity in v5:

https://lore.kernel.org/linux-arm-msm/20220515145108.zfmlb53vacx7sr33@SoMainline.org/

> GPU uses MASTER_OXILI here, <&bimc 1 ...>.
> 
> While we are at it, use defined names instead of the numbers for this
> interconnect path.
> 
> Fixes: 5cf69dcbec8b ("arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration")
> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

And also added my Reviewed-by there.  I think it is normal to have a
Reviewed-by on top of a Suggested-by/Reported-by, so that I as reviewer
confirm the contents of the patch?

Since this is the third patch missing these, It may just have been an
oversight.

- Marijn

> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 2b5dbc12bdf8..bcda3a1dd249 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
>  #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/interconnect/qcom,sdm660.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -1045,7 +1046,7 @@ adreno_gpu: gpu@5000000 {
>  			nvmem-cells = <&gpu_speed_bin>;
>  			nvmem-cell-names = "speed_bin";
>  
> -			interconnects = <&gnoc 1 &bimc 5>;
> +			interconnects = <&bimc MASTER_OXILI &bimc SLAVE_EBI>;
>  			interconnect-names = "gfx-mem";
>  
>  			operating-points-v2 = <&gpu_sdm630_opp_table>;
> -- 
> 2.35.1
> 
