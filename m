Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17D17819BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Aug 2023 15:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbjHSNfI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Aug 2023 09:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbjHSNfI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Aug 2023 09:35:08 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0745024C30
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Aug 2023 06:31:10 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so236415866b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Aug 2023 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692451868; x=1693056668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6u71a4GN6p55OTirDsp4k592nMNAa1SITGD9uIaliLA=;
        b=BRLCNoH9Ev+EnS8mjT0tFNZXuOUVtw36Q1L89be9WUdF2CmhlCL8aFJBGAloga7Wbt
         quu9HTXxApINWUqU2ZCHf5MxzusOYBIYkOyf/m8mlax2/A0VNmjzpWH5lKse+UEvdUt9
         CY9AmGo3g+xAnlQNRXbHS31Q1imuWJFKwtht/4xF19mgteWWTVxDfXdoX71LFBeBU2qB
         o/zPzTJZchl9q9scYo08omAdPAIjME2VyAdXv/waVcipCKo6ERZ12WMzVbsFziB4ETL5
         DlQZHoDY4y0lSVttzAqNOXliDuHwY8Z1cFCfaiZ89EhjDgU/BYdH6Piadt2UJAy3kw6L
         i/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692451868; x=1693056668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6u71a4GN6p55OTirDsp4k592nMNAa1SITGD9uIaliLA=;
        b=ZJFC9g8JYIYSVF1O7bw5XA+agAP9n4qmhE72qXksdmTbysHuKLIv8CdDyyZH32FGSw
         3P7kivPI/SNEzOZjHrSdMNu0SxTVFt7wC36TDWhKEtBJ7m5XMpaqn7YAl/x4g044BrIy
         4tfV4B0DpQ4fI2zjp7wZXJjfymVfmVvz4CgkfIdqZZCkWSncBlL0O+UMLFZAJ2qRhi+d
         AC+DludQGV+WEl12HzoZrEIJUscgwmsjkMlmzNFVSFC5M7QE/0j/jct66WgU0BwbTVWH
         FFRn+taqLl2cHagnzyYaA2swyghmMo/ncAAq317Jp9L6gpHPfzTwJy4g9jbPAjHzI71V
         jO/w==
X-Gm-Message-State: AOJu0Yxjrze4QyVMQ8bbOjVimiZdrHoV7HsOqO5iLMFylxfiKMp/d+Jw
        tY/m+gy7A5pY4HRSMzx2cZgC/g==
X-Google-Smtp-Source: AGHT+IEVcx34dx4up2eFiu04+FWi85Kw0alMYHRym8IFNh+XSRYSBnMl29STr6JLAnGaxsCq/r1M1w==
X-Received: by 2002:a17:907:7617:b0:994:5577:aeed with SMTP id jx23-20020a170907761700b009945577aeedmr1389041ejc.5.1692451868511;
        Sat, 19 Aug 2023 06:31:08 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id lv27-20020a170906bc9b00b0099cb349d570sm2716405ejb.185.2023.08.19.06.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 06:31:07 -0700 (PDT)
Message-ID: <9ed564a1-13a8-e63e-bdd0-901d4f357bab@linaro.org>
Date:   Sat, 19 Aug 2023 15:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 01/13] dt-bindings: phy: migrate QMP PCIe PHY bindings
 to qcom,sc8280xp-qmp-pcie-phy.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
 <20230731105759.3997549-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731105759.3997549-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/07/2023 12:57, Dmitry Baryshkov wrote:
> Migrate legacy bindings (described in qcom,ipq8074-qmp-pcie-phy.yaml)
> to qcom,sc8280xp-qmp-pcie-phy.yaml. This removes a need to declare
> the child PHY node or split resource regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 278 +++---------------
>  .../phy/qcom,msm8998-qmp-pcie-phy.yaml        |  97 ++++++
>  .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  34 ++-
>  3 files changed, 163 insertions(+), 246 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> index 3d42ee3901a1..5073007267ad 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> @@ -13,287 +13,79 @@ description:
>    QMP PHY controller supports physical layer functionality for a number of
>    controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
>  
> -  Note that these bindings are for SoCs up to SC8180X. For newer SoCs, see
> -  qcom,sc8280xp-qmp-pcie-phy.yaml.
> -
>  properties:
>    compatible:
>      enum:
>        - qcom,ipq6018-qmp-pcie-phy
>        - qcom,ipq8074-qmp-gen3-pcie-phy
>        - qcom,ipq8074-qmp-pcie-phy
> -      - qcom,msm8998-qmp-pcie-phy
> -      - qcom,sc8180x-qmp-pcie-phy
> -      - qcom,sdm845-qhp-pcie-phy
> -      - qcom,sdm845-qmp-pcie-phy
> -      - qcom,sdx55-qmp-pcie-phy
> -      - qcom,sm8250-qmp-gen3x1-pcie-phy
> -      - qcom,sm8250-qmp-gen3x2-pcie-phy
> -      - qcom,sm8250-qmp-modem-pcie-phy
> -      - qcom,sm8450-qmp-gen3x1-pcie-phy
> -      - qcom,sm8450-qmp-gen4x2-pcie-phy

...

> +        #phy-cells = <0>;
> +
> +        resets = <&gcc GCC_PCIE_0_PHY_BCR>, <&gcc GCC_PCIE_PHY_BCR>;
> +        reset-names = "phy", "common";
> +
> +        vdda-phy-supply = <&vreg_l1a_0p875>;
> +        vdda-pll-supply = <&vreg_l2a_1p2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index ca55ed9d74ac..a2c894a33c1c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -18,11 +18,21 @@ properties:
>      enum:
>        - qcom,sa8775p-qmp-gen4x2-pcie-phy
>        - qcom,sa8775p-qmp-gen4x4-pcie-phy
> +      - qcom,sc8180x-qmp-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x1-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x2-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x4-pcie-phy
> +      - qcom,sdm845-qhp-pcie-phy
> +      - qcom,sdm845-qmp-pcie-phy
> +      - qcom,sdx55-qmp-pcie-phy
>        - qcom,sdx65-qmp-gen4x2-pcie-phy
> +      - qcom,sm8150-qmp-gen3x1-pcie-phy

This was not present before. If you add new compatible, split it to new
patch.

> +      - qcom,sm8250-qmp-gen3x1-pcie-phy
> +      - qcom,sm8250-qmp-gen3x2-pcie-phy
> +      - qcom,sm8250-qmp-modem-pcie-phy
>        - qcom,sm8350-qmp-gen3x1-pcie-phy
> +      - qcom,sm8450-qmp-gen3x1-pcie-phy
> +      - qcom,sm8450-qmp-gen4x2-pcie-phy
>        - qcom,sm8550-qmp-gen3x2-pcie-phy
>        - qcom,sm8550-qmp-gen4x2-pcie-phy


The rest looks good to me.

Best regards,
Krzysztof

