Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC3D70C3DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 19:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjEVRBx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 13:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbjEVRBw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 13:01:52 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F81E9
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:01:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so2271442e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 10:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684774909; x=1687366909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lp2zqJrWGrwDzKRcSAr68eSrJD+PHpiAXTHJYQNw4CU=;
        b=BBYN3OdEolRiW4xC3AJUFObXodKjUoig2oSCbokBJd/KfXKR2w3bJdLPsYUh1BJJy3
         0t4PjPE9nUbcJTXijUGSVKu6vOtyvg7LqAcMUsf50ncJG7glPZgN/dHv7QOyLW1PaLg5
         yDVn444WRdpkyHnPWA6OTO6QgSmWJ/CsAT/G+b+q9xlbK/Z4EoOatBTbXkeGiPCL6n2k
         DbI92Iw5U3+Gzo0thqGjSdMfsiYk5Y7ry1SpVQkW5UpD6+EUQYChq/4scX8lXDVuIihv
         pjzhTWo4S+awsZeN0IS1Gk+fqG8XIgMAW7iG/Yows64tmp2Oo/kcYOZaBhYEJpmvZAMI
         9Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774909; x=1687366909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lp2zqJrWGrwDzKRcSAr68eSrJD+PHpiAXTHJYQNw4CU=;
        b=fzjvXaEHBL8rKTz4NRGsG1tYcY0CRd0KAbi2y17+oKeyEkeIav5YPbFXmCZwTIHycf
         fYuy6NoQ8KHtsTlWE+CoBqNNgG1CERNgwtoOTcty8j1IYyutkXhEgULjmxXrLb4p5Mrj
         ohidMopSFkQf3qupE9sgiRih3kl9hc64fu8sqKllcmS3qvvQv7r3mLvpLPVNk8wvyG3p
         Odx6iiNFU0Na1W6A892AgDpdPIsreTL7vmq3qXadH6/p4nPdXZoqPt6vYqXTO0BB26gj
         O3v4zvRNbO6rZjJzvztW2+j4qrwZOb7TvPwftBc4QaW/GAqiVvLJdTftlfEmbUp+HyCi
         kF8g==
X-Gm-Message-State: AC+VfDwm2ocATtuPGiOnORdRu2rpSWxk2XvHbqZ/1twI4K5aBXERk3jc
        9wJHinD18E56U/jEudxwyjfhAA==
X-Google-Smtp-Source: ACHHUZ78c82MrLYPLVleFSOQ7arvmErWiOIBUKBWCMJSVNWwTmk+lXwDuWhZ10mSxHg5EyglS7O3hg==
X-Received: by 2002:ac2:43cd:0:b0:4f2:6f55:2d6c with SMTP id u13-20020ac243cd000000b004f26f552d6cmr3576971lfl.5.1684774909262;
        Mon, 22 May 2023 10:01:49 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
        by smtp.gmail.com with ESMTPSA id d30-20020ac25ede000000b004f13711caedsm1044174lfq.103.2023.05.22.10.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 10:01:48 -0700 (PDT)
Message-ID: <9fca1a1d-9a2e-c048-4f01-d13e4c73f692@linaro.org>
Date:   Mon, 22 May 2023 19:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sm8350: switch UFS QMP PHY to
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
 <20230521203834.22566-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230521203834.22566-11-dmitry.baryshkov@linaro.org>
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
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index ebcb481571c2..6173521ff544 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -656,9 +656,9 @@ gcc: clock-controller@100000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <&ufs_mem_phy_lanes 0>,
> -				 <&ufs_mem_phy_lanes 1>,
> -				 <&ufs_mem_phy_lanes 2>,
> +				 <&ufs_mem_phy 0>,
> +				 <&ufs_mem_phy 1>,
> +				 <&ufs_mem_phy 2>,
>  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <0>;
>  		};
> @@ -1658,7 +1658,7 @@ ufs_mem_hc: ufshc@1d84000 {
>  				     "jedec,ufs-2.0";
>  			reg = <0 0x01d84000 0 0x3000>;
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&ufs_mem_phy_lanes>;
> +			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
>  			lanes-per-direction = <2>;
>  			#reset-cells = <1>;
> @@ -1702,10 +1702,8 @@ ufs_mem_hc: ufshc@1d84000 {
>  
>  		ufs_mem_phy: phy@1d87000 {
>  			compatible = "qcom,sm8350-qmp-ufs-phy";
> -			reg = <0 0x01d87000 0 0x1c4>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x01d87000 0 0x1000>;
> +
>  			clock-names = "ref",
>  				      "ref_aux";
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
> @@ -1713,17 +1711,11 @@ ufs_mem_phy: phy@1d87000 {
>  
>  			resets = <&ufs_mem_hc 0>;
>  			reset-names = "ufsphy";
> -			status = "disabled";
>  
> -			ufs_mem_phy_lanes: phy@1d87400 {
> -				reg = <0 0x01d87400 0 0x188>,
> -				      <0 0x01d87600 0 0x200>,
> -				      <0 0x01d87c00 0 0x200>,
> -				      <0 0x01d87800 0 0x188>,
> -				      <0 0x01d87a00 0 0x200>;
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
>  		ipa: ipa@1e40000 {
