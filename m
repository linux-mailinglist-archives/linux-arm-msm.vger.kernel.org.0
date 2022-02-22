Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F994BEF8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 03:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbiBVClc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 21:41:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbiBVClb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 21:41:31 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314F125C6F
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 18:41:07 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id j17so3514690wrc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 18:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=F8EZpKYd1YA4m/weW3nrPOkwMsmkl5R8bOsF2q/+kU0=;
        b=HForMk1XC3MkMzJ+J54cA80wGm/GIyofNGNmGWu0B8Es9sy9F550QKc7PUw548wNL0
         fM7pt+A0LbhkzaNepRQYFk1jOVT8b5S6Js1iAB05M9QtEBVnPGTXzSupaslIdr/LyQEQ
         sBJX+EyhNEQCp71dIvjb4Jmkyum8WCTOHXBMhZSBiE1tYvmHZdHFNJ5VsxTXmeQKq6mm
         C8bg2FsKuCLOoD2tmIPjQhr7/8TSBmGmf6AE/WQPXRwJvHlfoJD3I6CEIC6uMHkDY9C9
         lpWTvufU+4islN8fKp3GLLJtfmTWMkQ+TH7FxEiY9eE/HFibNBNfvsRnYWmPBDo7uZh5
         D0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=F8EZpKYd1YA4m/weW3nrPOkwMsmkl5R8bOsF2q/+kU0=;
        b=qbdSaWL78mH3DI1de3JcOJyONJOwcsFylICkXChxgKGSKO3kPh45qRRzYKuT+DTSpy
         Bdg4k7jMqS3v+bJxDW6m3LmyvxE8EQjQa/8rmOKuCd/JWCWjfmXa9Pe3LpBS9htvCIRv
         3vF5ZJ5e92+n5IDO2Fx/7DahGr5wX8DI8DTza54un2qT1EsleSJ+u8KPrpvdYWKYmcyl
         7yI+UBRbObxbDwx6oVO++7fdFkIbuA0a/7cVSvZiYm4G6+QLw0EaABUzqb3OgrhJkhmq
         0MJ5kRcvix4FJ97fKdhpnEMC4boIvU3HUS7tGDEPT8G4V9qJLg+nJ8bpYTxek58M5RV4
         Aatg==
X-Gm-Message-State: AOAM5301R3gsZIys3UN0AInHWGyNTaEIppiJyaOCap8Ef0e3qqt5o584
        PxmSP08IKmn1sLntCOM5wMQV8g==
X-Google-Smtp-Source: ABdhPJxajEOCGHoJBRvOvFIfTrVcQeI5sLbNDPNbpduQzv3/9EyjjE2qz5FGJzbFat4Y5ELvavGxkw==
X-Received: by 2002:a5d:5090:0:b0:1e4:b66b:11a2 with SMTP id a16-20020a5d5090000000b001e4b66b11a2mr17906213wrt.360.1645497665611;
        Mon, 21 Feb 2022 18:41:05 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e7sm30613620wrg.44.2022.02.21.18.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 18:41:05 -0800 (PST)
Message-ID: <144e802c-588c-12e2-5815-5847d2a9fe29@linaro.org>
Date:   Tue, 22 Feb 2022 02:41:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq6018: Add mdio bus description
Content-Language: en-US
To:     Baruch Siach <baruch@tkos.co.il>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Robert Marko <robert.marko@sartura.hr>
Cc:     Baruch Siach <baruch.siach@siklu.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <a4b1ad7b15c13f368b637efdb903da143b830a88.1645454002.git.baruch@tkos.co.il>
 <5e7e06e0cb189bab4586646470894bbda572785d.1645454002.git.baruch@tkos.co.il>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5e7e06e0cb189bab4586646470894bbda572785d.1645454002.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/02/2022 14:33, Baruch Siach wrote:
> From: Baruch Siach <baruch.siach@siklu.com>
> 
> The IPQ60xx has the same MDIO bug block as IPQ4019. Add IO range and
> clock resources description.
> 
> Signed-off-by: Baruch Siach <baruch.siach@siklu.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 5eb7dc9cc231..093011d18ca6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -635,6 +635,16 @@ qrtr_requests {
>   			};
>   		};
>   
> +		mdio: mdio@90000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "qcom,ipq6018-mdio", "qcom,ipq4019-mdio";
> +			reg = <0x0 0x90000 0x0 0x64>;
> +			clocks = <&gcc GCC_MDIO_AHB_CLK>;
> +			clock-names = "gcc_mdio_ahb_clk";
> +			status = "disabled";
> +		};
> +
>   		qusb_phy_1: qusb@59000 {
>   			compatible = "qcom,ipq6018-qusb2-phy";
>   			reg = <0x0 0x059000 0x0 0x180>;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
