Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF52C70C3CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 19:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbjEVRAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 13:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjEVRAQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 13:00:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84295E9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:00:15 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af2602848aso42167691fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684774814; x=1687366814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HkWcCUxcGrEA3uBxRc2BHzxtLgYNVEfArtn5oBlXN0g=;
        b=YQ4E2ftUZW8n5lJdtWKosAUp3xTf6mUmTvNJyiWwCJMoATucjkrGmN7YKsqxSvrVue
         ZpHXKY2lCXq/nmKMk/1qnJlbCKIuKqAHgFjf4vHVb8INDt/ao5ziSz7KZryxLys48as2
         hUkDy95+uwHpxnSu4HEuHA8z1QkFBfKIHbHxMsZTu05EHVc+xIYTeHVJLEKQ9cdb9Z32
         S5K+zUdDANMrjQxvHdtKDl1Zp2N5AIckYdjuwZSLkbtQzx/jyGu9+suC04HWrxWmbq5L
         7xWA04zTTlosievpMOhbAWaN2E7pIxp8G1shhXVAxdgDW9b2PN+67GVWfH0eRkZ74JQt
         iXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774814; x=1687366814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkWcCUxcGrEA3uBxRc2BHzxtLgYNVEfArtn5oBlXN0g=;
        b=RB0KasWF6+iHevmnOTs23QTJH8xloATai7cR2nvEf70mx0aqIjySlQSVQoYI8bafdZ
         2dszB1Jra7+pWDEQfrGanWQQ+rOTSD+yueqdaaoIcd++5iZeAeKWJEpXcUm1e2NQrUE5
         U/fvcaFKpsHOc+8pqKeTJ020SD0+uZcq/V+KuJcoAvMsH4OB9nKrWdNszbhrwnKX2u0f
         4AMeQ1ZbKyBAxFCTG/5/3GrF2DoxdfR4p6neiRuUgU2kG8yZrYDwOTbG9nooiPelePKA
         injWpbSvI5Qq3OSivqRM0t+CRQfFlQ9Z4vMkryMQ2LnQNnyCAhw6SVuP1wgGypINJeoZ
         wYCg==
X-Gm-Message-State: AC+VfDyFooNIfbJL4KVSjX2AQ3lO6udBYU9bYymza5p1Qr/tKhovaj82
        eeQvPuCKEqo8zof0MdRFsu0imnpYcDN8SA06vaw=
X-Google-Smtp-Source: ACHHUZ4qb59tJVbyi9jl1nrj67y8E/oqqmW8h0vygntzj4aKcdIM1RZBxPie9H98W7jT7H4Nc3t35w==
X-Received: by 2002:a2e:9050:0:b0:2af:187b:3c88 with SMTP id n16-20020a2e9050000000b002af187b3c88mr4074672ljg.43.1684774813773;
        Mon, 22 May 2023 10:00:13 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
        by smtp.gmail.com with ESMTPSA id x15-20020ac2488f000000b004edd32d0bdesm1042830lfc.288.2023.05.22.10.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 10:00:13 -0700 (PDT)
Message-ID: <c267aee2-fdbf-5f51-c86a-7016d82d3fe9@linaro.org>
Date:   Mon, 22 May 2023 19:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/11] arm64: dts: qcom: sdm845: switch UFS QMP PHY to
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
 <20230521203834.22566-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230521203834.22566-6-dmitry.baryshkov@linaro.org>
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
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 6aa2f8f3affc..559a50c44da1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2566,7 +2566,7 @@ ufs_mem_hc: ufshc@1d84000 {
>  			      <0 0x01d90000 0 0x8000>;
>  			reg-names = "std", "ice";
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&ufs_mem_phy_lanes>;
> +			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
>  			lanes-per-direction = <2>;
>  			power-domains = <&gcc UFS_PHY_GDSC>;
> @@ -2612,10 +2612,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  		ufs_mem_phy: phy@1d87000 {
>  			compatible = "qcom,sdm845-qmp-ufs-phy";
> -			reg = <0 0x01d87000 0 0x18c>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x01d87000 0 0x1000>;
> +
>  			clock-names = "ref",
>  				      "ref_aux";
>  			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
> @@ -2625,14 +2623,7 @@ ufs_mem_phy: phy@1d87000 {
>  			reset-names = "ufsphy";
>  			status = "disabled";
>  
> -			ufs_mem_phy_lanes: phy@1d87400 {
> -				reg = <0 0x01d87400 0 0x108>,
> -				      <0 0x01d87600 0 0x1e0>,
> -				      <0 0x01d87c00 0 0x1dc>,
> -				      <0 0x01d87800 0 0x108>,
> -				      <0 0x01d87a00 0 0x1e0>;
> -				#phy-cells = <0>;
> -			};
> +			#phy-cells = <0>;
status last?

Konrad
>  		};
>  
>  		cryptobam: dma-controller@1dc4000 {
