Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8345D6D870B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 21:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbjDETjM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 15:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDETjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 15:39:10 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1967DB0
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 12:38:33 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z42so38378282ljq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680723505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5f0mC+vCbK8/t6861d0Rm2iLKPedST0RJhiJavXpidc=;
        b=O9u3HSfoQYfNm6hUe5TGddkA7cx/XjoVwsGfqDgI7F3H+tUYOwSbPAseA3xNdBIIDK
         bBRAR5iK7zjnYQ3VOKqF700zJn4FuPbmEr8/GvFUm6YArkvGYHpcSh4oaisU2ezPOXOT
         sUHslTba6C7mypK/br5++omC6AonLN5v0G4WjZOMmo9iRNdZFYrtliDA/4vQWQV8um05
         NQhUBRstoghlaBAD7zIObzOfXVS3o5aAw+gBgmGviJCC4CborHlJg0hTc/KmNVUz7omK
         4ibETRW+fJ6DFbqcoiPFVyt20L7IYuTKdgROvdWw4pQlQxbWvx1GDh+r1rzq3JMz9b4F
         aDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680723505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5f0mC+vCbK8/t6861d0Rm2iLKPedST0RJhiJavXpidc=;
        b=WtJH5pIenQ9q3dLzfFS6GpUZhLCkddrGe8YWOmYMwmKw+j6rJj9ZIKvhsRJO3g6NC/
         1pso4pnGoEtj82blTJ5IuhWEZFzwfELW3LFiFlh9wzHdQyXWnj0kz+Cq/OViyKD2Xcti
         XNf3+rW+w2jcsOkXykwPItnzv6dxrrz7v77PiGsrI42NszNwPjW4ZbC64eeMN0J7JZWA
         ueEzqh+NY3zie3LZ9nT9BiCwv7IazAqrvsOyvuKhds58qYP3lqWzfQoNmnEBiYRVdi0m
         rK4Li93Mjb55RVYa9m7GnsfpcV/k46vzSer6RjYn2fOIPckRjtlwo6HC2fYriC4b3oCH
         GoEg==
X-Gm-Message-State: AAQBX9diWbH6Dz2VBNsQiPYBb5CpS6D6+1qyo4d0EAlG0WZbJ0tC4iB5
        EMwjmp8mFk9VMVXTLBep5t739g==
X-Google-Smtp-Source: AKy350aAERgJC0es3w+VWzIC+SauE/zhEA0eNoS8iq5QTbMpYVHS9MuKuSDX22w+FZJxFPZwvr9Ggw==
X-Received: by 2002:a2e:8085:0:b0:29a:95d8:3e04 with SMTP id i5-20020a2e8085000000b0029a95d83e04mr2084998ljg.50.1680723504998;
        Wed, 05 Apr 2023 12:38:24 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x23-20020a2e9c97000000b002934febffe4sm2966662lji.128.2023.04.05.12.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 12:38:24 -0700 (PDT)
Message-ID: <374d3d19-2459-064c-c7e6-7e13b4dc368d@linaro.org>
Date:   Wed, 5 Apr 2023 22:38:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom,qmp-usb: Fix phy subnode
 for SM6115 & QCM2290 USB3 PHY
Content-Language: en-GB
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, kishon@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230405191633.1864671-1-bhupesh.sharma@linaro.org>
 <20230405191633.1864671-2-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230405191633.1864671-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 22:16, Bhupesh Sharma wrote:
> The USB3 SS (QMP) PHY found on Qualcomm SM6115 & QCM2290 SoCs is
> similar to sm8150 QMP PHY (which is named as 'usb_1_qmpphy' in
> sm8150 dtsi file, see [1]) in the sense that the phy subnode supports

usb_1_qmpphy on sm8150 is a USB+DP PHY, see 
https://patchwork.kernel.org/project/linux-phy/patch/20230324215550.1966809-4-dmitry.baryshkov@linaro.org/

> 6 regs, namely TX lane 1, RX lane 1, PCS, TX lane 2, RX lane 2 and
> PCS_MISC.
> 
> Update the dt-bindings document to reflect the same.
> 
> [1]. https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sm8150.dtsi#n3394
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   .../devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> index e81a38281f8c..1575dc70bcf2 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-usb3-phy.yaml
> @@ -276,7 +276,9 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,qcm2290-qmp-usb3-phy
>                 - qcom,sdm845-qmp-usb3-phy
> +              - qcom,sm6115-qmp-usb3-phy
>                 - qcom,sm8150-qmp-usb3-phy
>                 - qcom,sm8350-qmp-usb3-phy
>                 - qcom,sm8450-qmp-usb3-phy
> @@ -318,12 +320,10 @@ allOf:
>               enum:
>                 - qcom,ipq6018-qmp-usb3-phy
>                 - qcom,ipq8074-qmp-usb3-phy
> -              - qcom,qcm2290-qmp-usb3-phy
>                 - qcom,sc7180-qmp-usb3-phy
>                 - qcom,sc8180x-qmp-usb3-phy
>                 - qcom,sdx55-qmp-usb3-uni-phy
>                 - qcom,sdx65-qmp-usb3-uni-phy
> -              - qcom,sm6115-qmp-usb3-phy
>                 - qcom,sm8150-qmp-usb3-uni-phy
>                 - qcom,sm8250-qmp-usb3-phy
>       then:

-- 
With best wishes
Dmitry

