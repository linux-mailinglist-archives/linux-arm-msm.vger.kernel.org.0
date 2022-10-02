Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9C65F221F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Oct 2022 10:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiJBIt3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Oct 2022 04:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiJBIt2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Oct 2022 04:49:28 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554CE4E878
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 01:49:27 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a8so12684264lff.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 01:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IwRXdvg15JyBPBkAOvPX9idahFqd5EItuYjKOLK/4bU=;
        b=DlH9FfIaq4xKyKKnr3cHhORySj90Ur807i8E/TxVdFjRumCe5s4XDfMY7pXLnNPqZQ
         sykWMNoPq6jqk9/Ml1DBKgBOfkz9SajDgHGxKqWyFAGB3OHvRIqMpflNL/lw2JxVyaHr
         sGfVtsdLSN/KYkb9MVHlp30LHT+1AFFl/96lyctd2vupoMWG5PcnjRBa7Jj5vDis0XTt
         HQCBpC7nNBPtW2t4EhZAI5vVJXINJYKkzLaCBo5nT0QXso7332WUDHTxGJ+yiU0ev/JZ
         ip9rVv7lKRFB0m5BLwqdOjiJYENcIiwDUQHPeTxt3MZy7pG8SLPyXWtuX5nArgRq4DA5
         vMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IwRXdvg15JyBPBkAOvPX9idahFqd5EItuYjKOLK/4bU=;
        b=DpDPtRSx8Nuj+eZoLfOSNNyftE4IWHDMu28pCyvrmCdHEsEBtR4E/2+jYDPjQowwzR
         GbM3cYe/FrjbTn84mpyleHJ1BH9yQaMlmB3pYgPLqvZkQgjhK56svCx1Kxzu56bTg9RE
         modsdxwFmhUvTKKRncr2W73ztkF07LTPeeJ6HdVrZtZjoIOu6XHnm7Gi4dAWHoenSjWI
         OtpXr8/bTNE0GbDSf2myMpdfyxMd6tcWMNeIRb8nmv3GqGap9HsRMAlqQCbMcAWWth+T
         Z65vII4UGGDt9/0miMpqmGnrawDdBg54ZriII3Z+3Lrlnm1JcdkftEL9OppKF/0SIcUD
         dvpA==
X-Gm-Message-State: ACrzQf2fei028MPJ7GDRWv2tczrjNG0zNNDiHHVwNg19l2hiF1Qw334m
        hmda/ADfh/4domcfymgk1rqZj7lccVeoBA==
X-Google-Smtp-Source: AMsMyM5KnnciFze/GKbTePc3Yyfd9ZFjbMtig7tvLw9T3nof+XvJhjMdk3ndSTQc2n7pSFB3QVm4AQ==
X-Received: by 2002:a05:6512:1153:b0:49d:1d20:ea47 with SMTP id m19-20020a056512115300b0049d1d20ea47mr5343912lfg.342.1664700565656;
        Sun, 02 Oct 2022 01:49:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g19-20020ac25393000000b0049fb08e91cesm1016171lfh.214.2022.10.02.01.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 01:49:25 -0700 (PDT)
Message-ID: <a743d50f-fc59-161e-c98f-f10b26e2afe5@linaro.org>
Date:   Sun, 2 Oct 2022 10:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,spm: support regulator SAW2
 devics
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/10/2022 01:14, Dmitry Baryshkov wrote:
> Merge qcom,saw2.txt bindings to existing qcom,spm.yaml. This fixes
> compatibility of qcom,spm schema with regulator SAW2 devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/arm/msm/qcom,saw2.txt | 58 -------------------
>  .../bindings/soc/qcom/qcom,spm.yaml           | 44 +++++++++-----

You need to update reference in
Documentation/devicetree/bindings/arm/cpus.yaml

>  2 files changed, 30 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> deleted file mode 100644
> index c0e3c3a42bea..000000000000
> --- a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -SPM AVS Wrapper 2 (SAW2)
> -
> -The SAW2 is a wrapper around the Subsystem Power Manager (SPM) and the
> -Adaptive Voltage Scaling (AVS) hardware. The SPM is a programmable
> -power-controller that transitions a piece of hardware (like a processor or
> -subsystem) into and out of low power modes via a direct connection to
> -the PMIC. It can also be wired up to interact with other processors in the
> -system, notifying them when a low power state is entered or exited.
> -
> -Multiple revisions of the SAW hardware are supported using these Device Nodes.
> -SAW2 revisions differ in the register offset and configuration data. Also, the
> -same revision of the SAW in different SoCs may have different configuration
> -data due the differences in hardware capabilities. Hence the SoC name, the
> -version of the SAW hardware in that SoC and the distinction between cpu (big
> -or Little) or cache, may be needed to uniquely identify the SAW register
> -configuration and initialization data. The compatible string is used to
> -indicate this parameter.
> -
> -PROPERTIES
> -
> -- compatible:
> -	Usage: required
> -	Value type: <string>
> -	Definition: Must have
> -			"qcom,saw2"
> -		    A more specific value could be one of:
> -			"qcom,apq8064-saw2-v1.1-cpu"
> -			"qcom,msm8226-saw2-v2.1-cpu"
> -			"qcom,msm8974-saw2-v2.1-cpu"
> -			"qcom,apq8084-saw2-v2.1-cpu"
> -
> -- reg:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: the first element specifies the base address and size of
> -		    the register region. An optional second element specifies
> -		    the base address and size of the alias register region.
> -
> -- regulator:
> -	Usage: optional
> -	Value type: boolean
> -	Definition: Indicates that this SPM device acts as a regulator device
> -			device for the core (CPU or Cache) the SPM is attached
> -			to.
> -
> -Example 1:
> -
> -	power-controller@2099000 {
> -		compatible = "qcom,saw2";
> -		reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
> -		regulator;
> -	};
> -
> -Example 2:
> -	saw0: power-controller@f9089000 {
> -		compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
> -		reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
> -	};
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> index f433e6e0a19f..8fe35fde70b8 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> @@ -16,23 +16,33 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - qcom,sdm660-gold-saw2-v4.1-l2
> -          - qcom,sdm660-silver-saw2-v4.1-l2
> -          - qcom,msm8998-gold-saw2-v4.1-l2
> -          - qcom,msm8998-silver-saw2-v4.1-l2
> -          - qcom,msm8909-saw2-v3.0-cpu
> -          - qcom,msm8916-saw2-v3.0-cpu
> -          - qcom,msm8226-saw2-v2.1-cpu
> -          - qcom,msm8974-saw2-v2.1-cpu
> -          - qcom,apq8084-saw2-v2.1-cpu
> -          - qcom,apq8064-saw2-v1.1-cpu
> +    oneOf:
>        - const: qcom,saw2

I understand old bindings had it, but I don't think we really want to
support the generic compatible on its own. Even old bindings indicated
that there are several differences between SAWs.

Especially confusing is that once qcom,saw2 can be alone and in other
cases must be preceded by specific compatible. IOW, you allow for
apq8064 two cases:

1. qcom,apq8064-saw2-v1.1-cpu, qcom,saw2
2. qcom,saw2

I think we should instead add everywhere specific compatibles.


> +      - items:
> +          - enum:
> +              - qcom,sdm660-gold-saw2-v4.1-l2
> +              - qcom,sdm660-silver-saw2-v4.1-l2
> +              - qcom,msm8998-gold-saw2-v4.1-l2
> +              - qcom,msm8998-silver-saw2-v4.1-l2
> +              - qcom,msm8909-saw2-v3.0-cpu
> +              - qcom,msm8916-saw2-v3.0-cpu
> +              - qcom,msm8226-saw2-v2.1-cpu
> +              - qcom,msm8974-saw2-v2.1-cpu
> +              - qcom,apq8084-saw2-v2.1-cpu
> +              - qcom,apq8064-saw2-v1.1-cpu
> +          - const: qcom,saw2
>  
>    reg:
> -    description: Base address and size of the SPM register region
> -    maxItems: 1
> +    description: Base address and size of the SPM register region. An optional
> +      second element specifies the base address and size of the alias register
> +      region.
> +    minItems: 1
> +    maxItems: 2

And it seems second region is not present on some variants?

> +
> +  regulator:
> +    type: boolean
> +    description: Indicates that this SPM device acts as a regulator device
> +      device for the core (CPU or Cache) the SPM is attached to.
>  
>  required:
>    - compatible
> @@ -79,4 +89,10 @@ examples:
>          reg = <0x17912000 0x1000>;
>      };


Best regards,
Krzysztof

