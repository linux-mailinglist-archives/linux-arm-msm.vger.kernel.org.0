Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F28C71633B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 16:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbjE3OJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 10:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbjE3OJY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 10:09:24 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F69B2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 07:09:23 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30aea656e36so1606397f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685455762; x=1688047762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOYMCp0L07cWN0lYoOOkUaK3rDnXqzBq3iFkTu/EpE0=;
        b=LeOGtkKLtPfTlTTsoG1iavtRGpS4FyMVhh2osvBdBLWF/48HT7n40bh8ysO8q7A2b3
         1Y7HvgFI/ZKaRnLkZUf7o//6WRN1xquv9rhGN+Buo7k1A+vG05aXsmZu4ApCmP2g9CTY
         nq9K36zqqjg458nr/jc2P6bQsEmw8+f2TP6eM7fP2Xwu0zGej+aeR+WTuwFmdUT1NlFG
         KljYZztHoFzkCmFhzdObd6Iat20z0yZDvZPN+/maF/S39ZP+bvo8xla3sygh8ohx0379
         VO9CiwNV3zRI405DdwOxolh8Hq5ZrpIRrQWVH3sVJWOtnWZgs9jugbM1RIyE9OXkn/ow
         vagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455762; x=1688047762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOYMCp0L07cWN0lYoOOkUaK3rDnXqzBq3iFkTu/EpE0=;
        b=D4pIcHljeU0CU43OUTOBRQrUyxlPIqQ7K+diZzRUElGCW0dgRJin+uAGAikWyMNCbC
         Nf9lUrbN/rhcTn3PSS4LU33EkFBs2OtaK6l9Lf+EBJO9rid+NhySCIUQV3uqkZNvC6qT
         Us77/+PYFJ3KmuHJnNSyrxdsXgNCy/gsLuonN1tls4F7h/PTVirlSfqJLkndBZUQSXla
         g3vNW2gPl0KxDU3gIE1av7sEgx4q9Y6H7nAx0gFMpJwt6KnRtQnSXGiIXBWg2gfbo1sT
         EPDa4hEBaLuJEXL3qC235COJnRVsTS+S7pZ75W+CcKyZ0ZQZMppU/QjUgwQB3DQM5Ms4
         /+hQ==
X-Gm-Message-State: AC+VfDwIiq75ZJa6jwabANwey+ZOTcq4c2NHAG+igz4rbwuK5zJ/fuPI
        aD4plSrspTFuT5YGpD7zO58wiA==
X-Google-Smtp-Source: ACHHUZ7OurhTqt8eEgJm6Ad0VCEpvSE4MlYPa+jOtlM6LfI7PhjrKdo45j7v0IhM+vAXx3kevWaC1g==
X-Received: by 2002:adf:fd4e:0:b0:309:303b:3dc5 with SMTP id h14-20020adffd4e000000b00309303b3dc5mr1545579wrs.7.1685455761959;
        Tue, 30 May 2023 07:09:21 -0700 (PDT)
Received: from [192.168.0.84] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id l12-20020a5d4bcc000000b003062b2c5255sm3490569wrt.40.2023.05.30.07.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:09:21 -0700 (PDT)
Message-ID: <448257f2-1b7d-5ec1-5847-94024dac6208@linaro.org>
Date:   Tue, 30 May 2023 15:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sm8150: turn first USB PHY into
 USB+DP PHY
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230521193635.3078983-1-dmitry.baryshkov@linaro.org>
 <20230521193635.3078983-4-dmitry.baryshkov@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230521193635.3078983-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21/05/2023 20:36, Dmitry Baryshkov wrote:
> The first USB PHY on the sm8150 platform is really the USB+DP combo
> PHY. Add the DP part of the PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 2273fa571988..1f442e1be63a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3399,20 +3399,19 @@ usb_2_hsphy: phy@88e3000 {
>  		};
>  
>  		usb_1_qmpphy: phy@88e9000 {
> -			compatible = "qcom,sm8150-qmp-usb3-phy";
> +			compatible = "qcom,sm8150-qmp-usb3-dp-phy";

Subnodes need to be renamed to usb3-phy and dp-phy respectively,
otherwise this fails to probe for me.

With that, for the series:

Tested-by: Caleb Connolly <caleb.connolly@linaro.org>
>  			reg = <0 0x088e9000 0 0x18c>,
> -			      <0 0x088e8000 0 0x10>;
> +			      <0 0x088e8000 0 0x38>,
> +			      <0 0x088ea000 0 0x40>;
>  			status = "disabled";
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> -
>  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>  			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
> -
>  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>  			reset-names = "phy", "common";
> @@ -3430,6 +3429,16 @@ usb_1_ssphy: phy@88e9200 {
>  				clock-names = "pipe0";
>  				clock-output-names = "usb3_phy_pipe_clk_src";
>  			};
> +
> +			usb_1_dpphy: phy@88ea200 {
> +				reg = <0 0x088ea200 0 0x200>,
> +				      <0 0x088ea400 0 0x200>,
> +				      <0 0x088eaa00 0 0x200>,
> +				      <0 0x088ea600 0 0x200>,
> +				      <0 0x088ea800 0 0x200>;
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +			};
>  		};
>  
>  		usb_2_qmpphy: phy@88eb000 {

-- 
// Caleb (they/them)
