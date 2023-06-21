Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C51DD738131
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 13:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbjFUKCf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 06:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjFUKBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 06:01:44 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1230F1991
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 03:01:25 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b455855fb2so78976321fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687341683; x=1689933683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3N1Cp+ZHd30+mMr+Qg3QOgcBjQtYpnarJP3zn5OpWSQ=;
        b=gf0AwFM5jwx/Nj2G/RlmZL42wzUcPNs+jtzfhOehyJjeMOe6g0GzdiJYmADGnMvukD
         CIaGPmWJrklQnUXIrz8VcxuZ4NWXsw5UwOJaNhhFcPcoIkoyWi22AGhQYRvU71Ft5rWE
         +vALsISZOTnQ4dkMlsd8Ny9LcKp5X7Zv5QjX+WqIulneclXlywQQzG1TbYMU9hZkcvOk
         UAnzRXr6A/Z0euuWYSKKBQ8oUenpBTLWRmTtvpK8ETamaZEfOA3fjlLl3hW3hAxfreny
         5155ToBCkrXryFjWgFialnDI4MGJM1cj402263j1hIlpqQ3Jk3dPOMbcU5+uv0WzUQh3
         j8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687341683; x=1689933683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3N1Cp+ZHd30+mMr+Qg3QOgcBjQtYpnarJP3zn5OpWSQ=;
        b=U7mHdeB+hs8g13rQjs79hNncUn4oE6GLHttirrTX4LS/RwsbVKnST68yrImIrWEbaU
         fULAknNIdtwYghu4cI0XoHK9G3qohEmC4tpqKxmpkM2nyczdgrxafRbJjpZCqwxRQ838
         LmzS5LMqqiXFhcaXFOPYXFo+G/+TCY459a6ufl2+X2Qg+XvgzYgyutzb+20NK3SF475k
         pX1qJIUVnpllfwxP3TUJ0lUSzCrgXlA09skmGSu3m8aLrixbEeI5Rf09eBclgLoo1w1r
         CBwIuED1S9wMcwc7cxAbWYmadXPiT7aWnlHRvp4DVXftgSzmx1FAf8CMePYSR2+m1Hur
         v4Ag==
X-Gm-Message-State: AC+VfDxtRsWwSrdhLzJezmtNdByiUVH3iAZu11TDK7pEebB//G4zD6x8
        njb7oaJRMZ9jNfdC9vSQOSLKkQ==
X-Google-Smtp-Source: ACHHUZ66a3AzllNSYDYkKMw7cpU5YXg+ZcxxJR8ML8T4JEUaot4oG3PY3PIPSa89oMUpCfBYkt14EQ==
X-Received: by 2002:a2e:a413:0:b0:2b4:6c47:6253 with SMTP id p19-20020a2ea413000000b002b46c476253mr6842618ljn.38.1687341683227;
        Wed, 21 Jun 2023 03:01:23 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id j6-20020a2e8506000000b002b473358e7asm801740lji.108.2023.06.21.03.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 03:01:22 -0700 (PDT)
Message-ID: <e31ad5ac-77ab-cf04-2e3e-d0857ccfdecf@linaro.org>
Date:   Wed, 21 Jun 2023 12:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add missing power-domains
 property to usb qmpphy node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230621-topic-sm8450-upstream-usb-phy-missing-power-domains-v1-1-d850c086c43c@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230621-topic-sm8450-upstream-usb-phy-missing-power-domains-v1-1-d850c086c43c@linaro.org>
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

On 21.06.2023 11:55, Neil Armstrong wrote:
> Add the missing property to fix the bindings check error:
> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@88e8000: 'power-domains' is a required property
>     From schema: Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Are you sure about this one? Historically PHYs have had their own GDSCs.

May just be a wrong binding fwiw

Konrad
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 5cd7296c7660..f921bd520e40 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2046,6 +2046,8 @@ usb_1_qmpphy: phy@88e8000 {
>  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>  			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>  
> +			power-domains = <&gcc USB30_PRIM_GDSC>;
> +
>  			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>  				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>  			reset-names = "phy", "common";
> 
> ---
> base-commit: 15e71592dbae49a674429c618a10401d7f992ac3
> change-id: 20230621-topic-sm8450-upstream-usb-phy-missing-power-domains-499a3d6c725f
> 
> Best regards,
