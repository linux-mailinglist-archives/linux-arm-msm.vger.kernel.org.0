Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D605A3655
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Aug 2022 11:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234063AbiH0JbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Aug 2022 05:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbiH0JbR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Aug 2022 05:31:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F282182771
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 02:31:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z6so4870128lfu.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=5+tRsHHFtIYtEhRxkDNtf2U4lHNbX9lSZYaEEg4PydM=;
        b=Gi8PUcyXTSmlMbVRETv1LJq3ymkcoTm9baot4bjs4PL7z7YF/rCeORhvyXC489Kprz
         AfT+zGYWDR5bZthID+qTc4HFO5om7t2NE+ubE1pGlP6QYZ0karOz4zvvOsLtPEuyPCn7
         O978JHSWbrXzYLcUni4fIQF0iz2FtS/jW/Pa9Atj96eDUBFDBKv0JxzOjOor5XqE7xgC
         8UOkQyCuOLlNz26/FAmLN9qQj8NOfWQMyNWeba6dD+7Osd2KO8Hfme+PWwmXSktLcC4f
         PeEVua/v8nhg8ZPgZ7Qda3T7cBvlA39p+8pCUIMVpbwbgME3Jg2pv49T1UfKwQ73UsWo
         86Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=5+tRsHHFtIYtEhRxkDNtf2U4lHNbX9lSZYaEEg4PydM=;
        b=fr9PcydK0VrgBOT5vM++r1ibNe7J6kuT9OLSAxazX/Lmk8zJdJCDM1MHThRjuEYtRz
         n5zqgi+AxDOUwR8bT0WY/nPwtlAKOnjcxuJxHMJmkPgvSFuNte/LhG18JHrfE3sU4pmW
         1gvHzdvt6i8VctupkW7xHs5p+iXiIXU0Lgqv5nSdjx5sSVaZRKNxoJRIOo9BCp0SRcnX
         m800QsMfF8RAwtSyNUx2X9kHvLnbUvXvxr4OhAo9kkwgsUpk+dB8yXtdWqw5DCOgEqHK
         B44hnneRiLJ6pCtMoHYSpx9MthWb/H65SQLYfDHEbJSYU3GkkwCcEZ1AciOHn1dxM0RK
         8vJA==
X-Gm-Message-State: ACgBeo24ES9RSiwriswZZ97nzdNhv2jeOZRVHYpsve22bgKcCRw9+Lhk
        2lPRq4kUpu1FLn8yGQuj2XTeAg==
X-Google-Smtp-Source: AA6agR7qqC2eQCM1x4pzhwMiF1ifFxSB9CvlDk/+rtzCjkzVYtMtC8P18Wt7CaFtjNbZ/KuH1CaruQ==
X-Received: by 2002:a05:6512:1687:b0:492:db5e:7768 with SMTP id bu7-20020a056512168700b00492db5e7768mr3750470lfb.118.1661592673212;
        Sat, 27 Aug 2022 02:31:13 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id d5-20020ac24c85000000b0048b0526070fsm626416lfl.71.2022.08.27.02.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 02:31:12 -0700 (PDT)
Message-ID: <15d7c1a8-18b6-e2a7-e4c1-1cdad6f3604f@linaro.org>
Date:   Sat, 27 Aug 2022 12:31:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: pwm: Drop PWM reg dependency
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220826123547.3392457-1-bryan.odonoghue@linaro.org>
 <20220826123547.3392457-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826123547.3392457-2-bryan.odonoghue@linaro.org>
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

On 26/08/2022 15:35, Bryan O'Donoghue wrote:
> Drop the reg dependency from the qcom PWM description.
> 
> The PWM driver doesn't depend on the reg so we should drop the dependency
> and remove the pwm@reg from the nodename.

Driver is not really a sufficient reason. Based on
https://lore.kernel.org/all/CAA8EJppGS38aP7gyd1c3kNgraAVJDoqUef2cDfZpu2aL_iwW0g@mail.gmail.com/
reason could be:

The PWM node is not a separate device and is expected to be part of
parent SPMI PMIC node, thus it obtains the address space from the
parent. One IO address in "reg" is also not correct description because
LPG block maps to several regions.

> 
> Fixes: e79a1385ab74 ("arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi                     | 3 +--

Patches should be split. One patchset, but two patches.

>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index 65cbc6dee545e..2a5bafe0660a0 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -92,6 +92,10 @@ properties:
>      type: object
>      $ref: /schemas/regulator/regulator.yaml#
>  

Best regards,
Krzysztof
