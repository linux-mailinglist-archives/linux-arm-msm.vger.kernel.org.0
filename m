Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 132E853067B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 00:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347364AbiEVWWX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 May 2022 18:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346321AbiEVWWW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 May 2022 18:22:22 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD1D240B3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 May 2022 15:22:20 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C60251F87C;
        Mon, 23 May 2022 00:22:17 +0200 (CEST)
Date:   Mon, 23 May 2022 00:22:16 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v7 08/11] arm64: dts: qcom:
 sdm636-sony-xperia-ganges-mermaid: correct sdc2 pinconf
Message-ID: <20220522222216.frhvf6sbohachuus@SoMainline.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
 <20220521202708.1509308-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521202708.1509308-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-21 23:27:05, Dmitry Baryshkov wrote:
> Fix the device tree node in the &sdc2_state_on override. The sdm630 uses
> 'clk' rather than 'pinconf-clk'.
> 
> Fixes: 4c1d849ec047 ("arm64: dts: qcom: sdm630-xperia: Retire sdm630-sony-xperia-ganges.dtsi")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> index b96da53f2f1e..58f687fc49e0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts
> @@ -19,7 +19,7 @@ / {
>  };
>  
>  &sdc2_state_on {
> -	pinconf-clk {
> +	clk {
>  		drive-strength = <14>;
>  	};
>  };
> -- 
> 2.35.1
> 
