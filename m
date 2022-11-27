Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2889D639D18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Nov 2022 22:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiK0VF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Nov 2022 16:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiK0VF6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Nov 2022 16:05:58 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE21FBF61
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 13:05:56 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id d6so14596216lfs.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Nt+rYmibpu5dTdXk3Hdc1ryP5rBQWqr1sW/Ulf9bq0=;
        b=srCg+kNV7zBo4yvmtMoNhDSdq84K7EnTBQDQcycsqvubhznP6G0Kw+Ntl4XJTKoH/4
         lQ2WQnJmzU+IRQEc67VGOdSgP6b+VZei4Pr0KYyD6Rk/C4iswsf2pkEE+9QKEOtqPvxX
         TN2NkMjzHhs3SQHLZnGJ1RO7Tep1LhS1/Go0Ohx7P3FbYmEsk/GODhlQTBYb4KYklBSB
         X3xRCzruwUCAzwVC07b/zQhhPsoxBDqoBl3JMpCXlGFYJyF6v/q+f2kV3PIiXLVfmFC6
         v9qU57h2kCIkJPqUM8C+jFxMQ18JWLoA6VqCC5bOadzjdKqt5Z95HmKB7Cf95lq+rGD9
         /FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nt+rYmibpu5dTdXk3Hdc1ryP5rBQWqr1sW/Ulf9bq0=;
        b=xZyxE4258AW9L47x5ZmQ0sutRvdKSLybbuaLLf33R4ORgMuFfMRmluLR8J5uCYTN+G
         GnC33T6YA/Y/NhVbpkuDUoM0U44tsRlYIiUo0ZxWQgJ2LIXpCGdh/313VSdKxmnPyT4c
         xzt8sZetGsMG+an+oxFqid4tQ1nx7/P5FsxtbaV8bpVcznT9pLwkVmRyu4nQDxR1q/WC
         Dr/AhZvKfh0UEgPHwKCbfiLz0Vy1oAix/UDQxc2odHFveY2/tqEYbUVWeL5qYHhn52WD
         tdp2AIDJMCrCUvBJ6W9BY81xlIvfOtn0ubeNNi2Mi/pNixDnZbMlMuIfHqrK7v8mPgyk
         FP/w==
X-Gm-Message-State: ANoB5plGphJJdioU+AStOdW+CV+ixlryzNbQwO1J2OnbHdThfw07dQHl
        Ft7ix2hY0fCqzuE9mwlUikZsvA==
X-Google-Smtp-Source: AA0mqf7071rUuF/DfDP8jw/HF2yThwmGczn0XX4obQ6G6ilBWM5aMqFGIdR8YtNoYiWvfw07N5e+mg==
X-Received: by 2002:ac2:54b3:0:b0:4a2:4589:fa1e with SMTP id w19-20020ac254b3000000b004a24589fa1emr9855269lfk.444.1669583155100;
        Sun, 27 Nov 2022 13:05:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q21-20020a056512211500b00492dc29be7bsm1416100lfr.227.2022.11.27.13.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:05:54 -0800 (PST)
Message-ID: <1f5795ac-0391-ca61-9c44-9f648d44e5b3@linaro.org>
Date:   Sun, 27 Nov 2022 22:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document oneplus,bacon device
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221127181835.806410-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127181835.806410-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/11/2022 19:18, Luca Weiss wrote:
> Document the OnePlus One ("bacon") which is a smartphone based on the
> Snapdragon 801 SoC.
> 
> Also allow msm8974 devices to use qcom,msm-id and qcom,board-id.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 463509f0f23a..3d2cc8ae34d8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -167,6 +167,7 @@ properties:
>            - enum:
>                - fairphone,fp2
>                - lge,hammerhead
> +              - oneplus,bacon
>                - samsung,klte
>                - sony,xperia-amami
>                - sony,xperia-castor
> @@ -896,6 +897,7 @@ allOf:
>                - qcom,apq8026
>                - qcom,apq8094
>                - qcom,apq8096
> +              - qcom,msm8974

Someone will have to rebase:
https://lore.kernel.org/linux-devicetree/20221104172122.252761-4-angelogioacchino.delregno@collabora.com/

Patch is good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

