Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9720721618
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 12:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjFDKas (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 06:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjFDKar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 06:30:47 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC086AD
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 03:30:45 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-974638ed5c5so443918466b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685874644; x=1688466644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3vNtqVcROm9cmZSGS8p4DNNUaV8+gQlhQTyNTjrVxA=;
        b=sIAWbBAdGBryZiwlY/mxdtpBJH501zroa5MrYPht8XNpeAuh3rCyvqrasCFIOIzj3Y
         ZSthWz30e9fCXpHBTQBqC9N8QevoGrxDGC3QqnusdLiNQg4cNeQ/DPmuu2Ocksp+Z+U1
         lPgQKtqcEYhr3kG0EDbhVFPpizaeRKwlD9u1+7BHwiKUR45OH5lh4fa86EjKtHvP4T5H
         aeX/xUxZLk/HHp47e9zJBgLwbxDkrLo5X02HbARjsTK/AAt8oD/6Jp+ZDWJSR0AQcmpt
         gZg2NXBSq5A3R6Mzxc6VR4jhonHy0N2GMBbThuna3Tszq7PDt5HGXCDIDGMVMCFRYsED
         8Vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685874644; x=1688466644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3vNtqVcROm9cmZSGS8p4DNNUaV8+gQlhQTyNTjrVxA=;
        b=hwJKXv0RisZJAhOHPU9ZY7VeZV7l5SivaZXar+HiJ0BCizx8NNEc5Rwpu33ZsHEoxt
         xbfCN6T4r/yMgmBAm7RXhRp6e3HeQTRVSP6Oetdsprr1UFuqgePs62qNq/EhZ0dRXbQW
         uOE4jbh3lG3kVkydWWr4Ab8NmmxCLjjhICJcqrjAeTv/Zz0AkORGgVyERUL51aX/MEsC
         coraEAf0OIO2LJSDfyDHBlvKcstZn1xoMLa0uKHJgDkzJLHEXca2PEs0tQQbonDNPII3
         NT7GnRLBT6OCljh1ZdgfH2NB/X/4i7y1RGLj+vCqiM+3CIxN+wBwa6x8dKeZGLH6YLjZ
         zLmg==
X-Gm-Message-State: AC+VfDzCk3hB3CXiGMP9B+16ozWLwLyGI8Fe1PwTeDIJin8G+ooWGyb9
        4jJ14D7kC2q5vEryoULnMfTiKg==
X-Google-Smtp-Source: ACHHUZ4u0X18Wv6y5mJX9vW4ELGhL1rGBQ1iVfd46vcj0kfhIfImleIiVNDPTsUMG7E9UKpX3WbtOg==
X-Received: by 2002:a17:907:6d86:b0:96f:94f1:b0a5 with SMTP id sb6-20020a1709076d8600b0096f94f1b0a5mr3247852ejc.8.1685874644395;
        Sun, 04 Jun 2023 03:30:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id sd17-20020a170906ce3100b0095fbb1b72c2sm2910853ejb.63.2023.06.04.03.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 03:30:43 -0700 (PDT)
Message-ID: <3c781ae6-4a45-1d6d-840c-d25f33684b00@linaro.org>
Date:   Sun, 4 Jun 2023 12:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Content-Language: en-US
To:     Rudraksha Gupta <guptarud@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20230604063032.365775-1-guptarud@gmail.com>
 <20230604063032.365775-3-guptarud@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230604063032.365775-3-guptarud@gmail.com>
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

On 04/06/2023 08:30, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> index aa97478dd016..63b6914993fe 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> @@ -13,7 +13,9 @@ if:
>    properties:
>      compatible:
>        contains:
> -        const: qcom,usb-hs-phy-apq8064
> +        items:
> +          - const: qcom,usb-hs-phy-apq8064
> +          - const: qcom,usb-hs-phy-msm8960

I have no clue what you want to achieve here. You break the bindings.

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof

