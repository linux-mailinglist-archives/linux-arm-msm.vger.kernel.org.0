Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB6260FBD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 17:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiJ0PYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 11:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234884AbiJ0PYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 11:24:48 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449981DA44
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:24:46 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id x15so1609995qvp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Iv4yihl8R3+MqrWIVJu+D8Wg49pHiLfK8EszmRHeyo=;
        b=rYo/ycT7Egnx1TQLXOyxX1Hk+6kivX/M0VmYU7ymYjx15dxxEHKP9apakp39s3bKpA
         M85Mh72GwaMpK4/LaUfsLUOycolZ5nErtUMduT3H5eQ1TRGDwgRry887xbEEBDhzTxGf
         tPy4ytGIU0a4kZQ3SY/hgzL5pMk8A3dSWNHQLMqqpI25agMwN+RBMuZzYVWXql2J5xqR
         B2c8o7UWHhwbcvOzM+tMjga4KUrv0sk+7GVmQXovJ7RtMWynySnyYNry2B+ugQI8pn9H
         oZ6r872cBnWHyG2au7Q5XDOJgaOIAn3DXkgxA6bIlzU2twmlZKTsUqVbVlVp6sbdnGVX
         FnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Iv4yihl8R3+MqrWIVJu+D8Wg49pHiLfK8EszmRHeyo=;
        b=jIJ7cTeL5dKYGZm5IfrzuRSDbAfvJfhqkfZZfR6LAujrl9ihRqAsmkiMsZ5ubl5Lno
         9PtQnc9B7e40I21vprS1ZH+tBA8gtnM6e02kqZG7+UwZ9QBtkzKiXf4ji0hNjaMnb+ws
         ZFy9LBPe77xPZp0nLE2lsxohlaUYCmYdGwHP5Ean0pWelw1jxlkAC/VFvpr1aqJ0O9gs
         NEMskgEM9yGaj0gmE6bujU9rXEGu3pwbOJ/BOzzZrstjXzjEN1RBqlJryzyBr2YRvywz
         AWLpN2C7OWIhS4XyHVFdxY2YTmYi9p/iwADDS4rBQjsM9CRtQAo/hzoQDiIdSq0jl7mY
         ifIQ==
X-Gm-Message-State: ACrzQf3WaGEDj5/ecAd2sojjuzTX3KACYdBvJgoefGEYYNXcPNQ58kzH
        TwqNflK/RMVn+IjL/eeKQALi6A==
X-Google-Smtp-Source: AMsMyM5PcfyOaaWBzPJbnCh6VCwZ0bHo7Q37fM6oG5KBT7P6CcCtGK+/dpog6JFwhJjRtLq9AH3how==
X-Received: by 2002:a05:6214:ac7:b0:4bb:6236:e190 with SMTP id g7-20020a0562140ac700b004bb6236e190mr22366552qvi.87.1666884285577;
        Thu, 27 Oct 2022 08:24:45 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id j3-20020a05620a410300b006eef13ef4c8sm1143237qko.94.2022.10.27.08.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:24:45 -0700 (PDT)
Message-ID: <e607fe3a-b243-fbd4-51a3-d10738d456c4@linaro.org>
Date:   Thu, 27 Oct 2022 11:24:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/5] dt-bindings: firmware: scm: Add QDU1000/QRU1000
 compatibles
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190549.4005703-1-quic_molvera@quicinc.com>
 <20221026190549.4005703-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026190549.4005703-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/10/2022 15:05, Melody Olvera wrote:
> Add compatibles for scm driver for QDU1000 and QRU1000 platforms.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../devicetree/bindings/firmware/qcom,scm.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index be1b5746eddb..5352181aa393 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -38,6 +38,7 @@ properties:
>            - qcom,scm-msm8994
>            - qcom,scm-msm8996
>            - qcom,scm-msm8998
> +          - qcom,scm-qdu1000
>            - qcom,scm-sc7180
>            - qcom,scm-sc7280
>            - qcom,scm-sc8280xp
> @@ -81,6 +82,20 @@ properties:
>      description: TCSR hardware block
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,scm-qdu1000
> +    then:
> +      properties:
> +        '#reset-cells':
> +          maxItems: 1

This is wrong... how can you have here more items?

> +        clocks: false
> +        clock-names: false
> +
> +      required:
> +        - '#reset-cells'

Missing blank line.

>    - if:
>        properties:
>          compatible:

Best regards,
Krzysztof

