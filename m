Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEECA70C3D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 19:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjEVRB1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 13:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbjEVRBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 13:01:25 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1EDF4
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:01:24 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af2c7f2883so31352121fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684774882; x=1687366882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3YdjmoGpKbkEmB2SC+vy1nNuTSfTE+qI8e9z7KNqO8g=;
        b=Lx8gKm0g26ZrJXx6eUyXp8B56GwdlZYNSPyzem3KlVnzd2N5Th3p19jZziE85OpwC3
         t8uk2gTRogMH8HKetsIktktsBm62SZfnTCr9XcSQFecoFkg0nW6mmFpasuFfoMb4RDQt
         DOosivTUEujWFDdJDhRwD5dN0B5S2bVvZlbyOeHNiRh3jrvg3WL888qojCjsRsoHv/IJ
         5ApG2K+FGQiYhLK0oOFDnDTFadcCz/eMyb+shXg3pMiQ/OrwN2UhZhRzju9bVXfKWvzM
         6sxtb54x4sO+TZEVOGN4hB0kQSVcBwp4wGoFldtMk6Ar+ThCufQK7Fyjwj2fBd8t2QQ9
         UI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774882; x=1687366882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YdjmoGpKbkEmB2SC+vy1nNuTSfTE+qI8e9z7KNqO8g=;
        b=S/TTHnfoUHzUq9mpPSjm40DlMTxeqh89ZxoV3DRWmMnxm5ZgAdF+qrm6Z7rWmB5YFq
         5KxCIgQ/GXAKapkGAnV3zrRNExH5esAHbfN0PHil15NHU9P87PnaCq3bLWtc/UUZWRjw
         iaNKTEKEkizuczgS9lU+Yge87T22DOWJC9rbikEl18gtLvjgIs0YlmN5zAKwvNmJP9CN
         Lo2dslzfcEc5e8n7esYXKcSqMOk6CVfbDZcQmt5aH+aQsACpRTG4MuhAO3j1Dp5jwBCC
         cPxJWS8cQwQJ43RDfJmhGOcMqvl72cUXjGGp8/HfoTytYgMMImd4gWWFUdkr8ZwNlYBj
         pXpQ==
X-Gm-Message-State: AC+VfDydp8Avx7Q+emro6Vz+6SPImtXrmR9APPPCDCiXp55rHDsOGcJf
        Ll0t85Zz10WrZytEV0vwkVEZMg==
X-Google-Smtp-Source: ACHHUZ4defUAbUbbazeZos4sMQGlt/Q2NOyt4urcQF5YoKKvlpSOg12v9KV3dRX4pZ6JWCrDpy3NDg==
X-Received: by 2002:a2e:2e0f:0:b0:2ac:f597:f823 with SMTP id u15-20020a2e2e0f000000b002acf597f823mr4062810lju.26.1684774882514;
        Mon, 22 May 2023 10:01:22 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
        by smtp.gmail.com with ESMTPSA id y25-20020a2e9d59000000b002a8c409f1f5sm1201645ljj.110.2023.05.22.10.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 10:01:22 -0700 (PDT)
Message-ID: <1e5f5a0f-9b4f-73e9-44ef-86ae9a712afc@linaro.org>
Date:   Mon, 22 May 2023 19:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sm8150: switch UFS QMP PHY to
 new style of bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
 <20230521203834.22566-9-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230521203834.22566-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.05.2023 22:38, Dmitry Baryshkov wrote:
> Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
> resource region, no per-PHY subnodes).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index e2e210e10475..98fd356e87e4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -2019,7 +2019,7 @@ ufs_mem_hc: ufshc@1d84000 {
>  			      <0 0x01d90000 0 0x8000>;
>  			reg-names = "std", "ice";
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&ufs_mem_phy_lanes>;
> +			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
>  			lanes-per-direction = <2>;
>  			#reset-cells = <1>;
> @@ -2064,10 +2064,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  		ufs_mem_phy: phy@1d87000 {
>  			compatible = "qcom,sm8150-qmp-ufs-phy";
> -			reg = <0 0x01d87000 0 0x1c0>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x01d87000 0 0x1000>;
> +
>  			clock-names = "ref",
>  				      "ref_aux";
>  			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
> @@ -2077,16 +2075,10 @@ ufs_mem_phy: phy@1d87000 {
>  
>  			resets = <&ufs_mem_hc 0>;
>  			reset-names = "ufsphy";
> -			status = "disabled";
>  
> -			ufs_mem_phy_lanes: phy@1d87400 {
> -				reg = <0 0x01d87400 0 0x16c>,
> -				      <0 0x01d87600 0 0x200>,
> -				      <0 0x01d87c00 0 0x200>,
> -				      <0 0x01d87800 0 0x16c>,
> -				      <0 0x01d87a00 0 0x200>;
> -				#phy-cells = <0>;
> -			};
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
>  		tcsr_mutex: hwlock@1f40000 {
