Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F06264A137
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 14:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbiLLNhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 08:37:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbiLLNgf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 08:36:35 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3D113F53
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:36:13 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id y25so18588210lfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 05:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhOhVWNnPyT63E3DtamMnAYp9h13i/6nUA89R8VpbXo=;
        b=kqA13dMxhqoBmHqUPtz9pkZmf/mhG7Tv7jdlFKv0rwIUAMbDIuSCcaV+RDL9h40m18
         4FJJThBECkyrTd+2zJeobMKyzP4emI2+3S5UUWyigGomzb00Kkg70C5AV+uDS8GIjD9j
         E1x0xOXgXMrxuawtuUspbxS9eLVDbXLpyW3eDNqUvvq+NnDfkIl+g+GkWNYhr3n8gVbp
         hlCVw4D1BoXk9GemLeal5aN7ZwQj2ctVNcX8hDbkScHowBi5Wc9oxiaJNgg6I+pQJySa
         Vo4UZKJ/FHkMaznKYwPUUvQIqKmU2+k3vJTBfeskxIHr5eu9q5hnqKqOniGdY9drEdxI
         h2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhOhVWNnPyT63E3DtamMnAYp9h13i/6nUA89R8VpbXo=;
        b=wZS5Aapv2W88CyCkC1Xq8fphvji9Td6jOMQbqe1dJcpngVrsbmOtdb7BqFHydZ1rvU
         bb5RpTIgUMvna69u7g0jhBaltHxU4GMQ6mnCKF1+fxb1oROQPo8lxe/ojlaYbzKx9csd
         Bsp92viqTYZ5fRAGi9kvQd6Oyp8JKS9LN4Iq8dYQHGs8g6UR6nCSlS/zNcpkeSar17ST
         e+NRj4RVypA4LKCythi1TohlOvGxp+Q43xD97gi+BzEV0p14PKIF11p5XOzQEtOkqTlz
         l5fR3CSb13sYtWooefZ3nj17KCiQMpSRdL6wCaRNxaDLoEzpGkFxldIrAbLzm/u+ggou
         xFXg==
X-Gm-Message-State: ANoB5pksLojjiRNVYhfTdHHKkSBNGHZqylF5e1VCSM25LNpYAw+QpJnd
        4OnG99sOzxvQUEa3k+2CI3k4mA==
X-Google-Smtp-Source: AA0mqf41bKKsPxTR6vHTJo77zDLCpd7DAmd9IVhr8u1la7Z+nfLY7s80XcBRTQ9+zmuaI/JZT8zWDQ==
X-Received: by 2002:ac2:4f0c:0:b0:4b4:9994:2990 with SMTP id k12-20020ac24f0c000000b004b499942990mr5289332lfr.55.1670852172164;
        Mon, 12 Dec 2022 05:36:12 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id d24-20020a194f18000000b00492ce573726sm1635266lfb.47.2022.12.12.05.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 05:36:11 -0800 (PST)
Message-ID: <43d54ef0-c95c-c53b-9298-4b55b9e3f2fb@linaro.org>
Date:   Mon, 12 Dec 2022 14:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: correct SPMI bus address
 cells
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221212133303.39610-1-krzysztof.kozlowski@linaro.org>
 <20221212133303.39610-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221212133303.39610-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.12.2022 14:33, Krzysztof Kozlowski wrote:
> The SPMI bus uses two address cells and zero size cells (secoond reg
secoond

> entry - SPMI_USID - is not the size):
> 
>   spmi@c440000: #address-cells:0:0: 2 was expected
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 27f5c2f82338..3cb4ca6c53eb 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1947,8 +1947,8 @@ spmi_bus: spmi@c440000 {
>  			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
>  			qcom,ee = <0>;
>  			qcom,channel = <0>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
>  			interrupt-controller;
>  			#interrupt-cells = <4>;
>  		};
