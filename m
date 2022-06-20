Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 089B455174F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241487AbiFTLY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241555AbiFTLY0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:24:26 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3707F15A2F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:24:23 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o9so5421688edt.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7YbItpgX2LBuNx7lKZqosV1saRLcfoQOlviZpKCZMRM=;
        b=T1nbdeKFeraRecCd3Hn8u72fu7OtLH6DrLq5ON5gSmWupN8DmcewNuz4ssWpaI6Xr3
         00ouvgo7T/iJfHEVzPbvCwzkVVC/FLD1F1VGObB6fhPWw8Z8ifaa7TJ1DbhA2jwSbvAL
         aMdd8ALj7hUvi3l0A8irE1JpXZ/LCYWWt4RDZ6IDBSakoQBhyBwmg84IbDt2f4kc3YP8
         FCIZps2S9S0/gun+pdnVlHrVXBxtOymYPB9Cp8hvq77lzgg4ncnndNWRtCy+H3PQVrrZ
         Nw+FUqRkquAcSwohuCdkIlMDoPCJ1KVupWwXmfxUgyUdz92JTE42DYq1e0dfYtT6lwPe
         tBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7YbItpgX2LBuNx7lKZqosV1saRLcfoQOlviZpKCZMRM=;
        b=oUO2sacjlij/K3MdjIaUJMk3dg5LCIbuV3v8AndlNkvHaaZys5oJHJqukUnpWkTwPO
         7S0V83gK4M1a+TS9loRVeYBQ4Yg0OieSC0SnUOZ+1ifqWhhUs3x2lr0qIn+H3rki7Kss
         qnOowBxU+IoDG5ab5EUddzKq/fw4ZG4b95qrN2qF6m6FQUPOFT8hL8KWzTQ/ftk7O/OA
         VKdTsNrdiKMJpDUy8AxlUoSyVkAj1gAPZ6+ptgsvH+q/87RTOIusRmLaXDfJ16SzmUmh
         lOvgWxnql0CgHYeiePJdB1XGCe8fa69tjR0CZMmtJHETjEMKnIVCsOeQDKUR67fhg1Cb
         TCDw==
X-Gm-Message-State: AJIora/tULv/YY2XsKAu2pdFnAOnc8iemd+OExaRCgzsh02Ef0PuKshK
        ki3d1n+hDicEsfyfQB3J3mRbbg==
X-Google-Smtp-Source: AGRyM1vlX+1cAORRQeoyJ5GjVZ99zgy5FGMZ5N3PChpplc/Pk3QKA+jkysUom51C8/8Xy+I1QI/eXw==
X-Received: by 2002:a05:6402:40c6:b0:42f:9ff8:62f8 with SMTP id z6-20020a05640240c600b0042f9ff862f8mr28458343edb.95.1655724261713;
        Mon, 20 Jun 2022 04:24:21 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906300f00b006f3ef214dd9sm5832791ejz.63.2022.06.20.04.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:24:19 -0700 (PDT)
Message-ID: <22f4ba43-2505-3000-24b6-b01d58d87e7f@linaro.org>
Date:   Mon, 20 Jun 2022 13:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: add GCC's optional clock
 sources
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
 <20220620071936.1558906-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620071936.1558906-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 09:19, Dmitry Baryshkov wrote:
> Add missing GCC clock sources. This includes PCIe and USB PIPE and UFS
> symbol clocks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index e97f193aefd3..6c7380f86383 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -689,8 +689,22 @@ gcc: clock-controller@300000 {
>  
>  			clocks = <&rpmcc RPM_SMD_BB_CLK1>,
>  				 <&rpmcc RPM_SMD_LN_BB_CLK>,
> -				 <&sleep_clk>;
> -			clock-names = "cxo", "cxo2", "sleep_clk";
> +				 <&sleep_clk>,
> +				 <&pciephy_0>,
> +				 <&pciephy_1>,
> +				 <&pciephy_2>,
> +				 <&ssusb_phy_0>,
> +				 <0>, <0>, <0>;

Since the clocks are optional, there is no need to pass <0> to them. I
think it does not bring any benefits.

> +			clock-names = "cxo",
> +				      "cxo2",
> +				      "sleep_clk",
> +				      "pcie_0_pipe_clk_src",
> +				      "pcie_1_pipe_clk_src",
> +				      "pcie_2_pipe_clk_src",
> +				      "usb3_phy_pipe_clk_src",
> +				      "ufs_rx_symbol_0_clk_src",
> +				      "ufs_rx_symbol_1_clk_src",
> +				      "ufs_tx_symbol_0_clk_src";
>  		};
>  
>  		tsens0: thermal-sensor@4a9000 {


Best regards,
Krzysztof
