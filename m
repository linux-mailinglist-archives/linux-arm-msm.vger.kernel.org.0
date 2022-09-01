Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636F15A9CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 18:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbiIAQLt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 12:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbiIAQLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 12:11:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AAE66E8BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 09:11:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq23so25151888lfb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ZT0UUgL98furUMTTllJ+IvKDmlJK1HsHd+roqciqR7g=;
        b=XmjqaXzcNHK1fQAUkelNc1TLbofd+c3HoDH/xwjX0atcCtDwNCfThcM2oD1jrv6mD0
         HUr4r+fomvVC7Ul6Iac4NE1Tr5yPTwFWGkETeoZJsaETaH2SHh+T9dXPx5r5F1mEl4Qz
         4a822TemsMhKG3+p8mYh/6k9vvg2YWdYsQkK5lUCaxqW/hJbZqQlf8JoshSr6abUlpOj
         fXvbFN1zzHUDVcnXxe++nT7/B9Z0y+8TLmQ1BpseEqZFjpc5X34gfHjEgS5hIZskNuGH
         jPV9bFxm6+IRHr98dw8dDx6zTFwZNQSVpfy6Mp+miAStK1ZDk9PADZQHX4/mdIUkGDYz
         T6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ZT0UUgL98furUMTTllJ+IvKDmlJK1HsHd+roqciqR7g=;
        b=RquQ+C/R0GCvL+gudy37r03CsPpTbTMgZhAAoVCE/4/e9AFEQRjh43wcVqOjtoKuZ7
         VcQKp1SbiXgbp0jPJg9o2aVqmg2gYR15lwt/EgWeS8yA0EAkueJPCZE1KWDylAgnK2Ql
         c/36df8YMeZqH8o8xeU43Njyjk64Lj8oUDSDW/+ONZ6eMgpqhmLvRQz43kcfXsZRxKzS
         gxtmamzyMb6bOGKxZes4zAKvztvuOa29Pc+smm+QDOswek97nFZE6nFTA8q1wGF6Eg4f
         76hC5YO4rXtPv9DDLWYZDUqBRtHa29ZSOzlonxqsVCOFcCS8kvTWFhLu7b2CYmUbQXS6
         6ggQ==
X-Gm-Message-State: ACgBeo3LkfJ1vIzXDkJH+hfE5pNXbvem8T1AoxhG62qENtC4hLU5lwTK
        U9VPc9hLxPoLYcuHPv0ixXdpvA==
X-Google-Smtp-Source: AA6agR7fa2cffMYhl6EVvGJvlvaohMBq/6GEuVCGGl4FC8t88eKtvkuzfo4WFJl3V4F8xXTCVl/DRA==
X-Received: by 2002:a05:6512:260d:b0:492:df5a:e4f9 with SMTP id bt13-20020a056512260d00b00492df5ae4f9mr10306759lfb.90.1662048702494;
        Thu, 01 Sep 2022 09:11:42 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id bd8-20020a05651c168800b002687e283bf1sm754869ljb.134.2022.09.01.09.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:11:41 -0700 (PDT)
Message-ID: <7804ffbe-4e27-d8bd-dbe2-75d1323da064@linaro.org>
Date:   Thu, 1 Sep 2022 19:11:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 08/14] dt-bindings: ufs: qcom: Add sm6115 binding
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220901072414.1923075-1-iskren.chernev@gmail.com>
 <20220901072414.1923075-9-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901072414.1923075-9-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 10:24, Iskren Chernev wrote:
> Add SM6115 UFS to DT schema.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index f2d6298d926c..7c5f6e2e6d4c 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -28,6 +28,7 @@ properties:
>            - qcom,msm8998-ufshc
>            - qcom,sc8280xp-ufshc
>            - qcom,sdm845-ufshc
> +          - qcom,sm6115-ufshc
>            - qcom,sm6350-ufshc
>            - qcom,sm8150-ufshc
>            - qcom,sm8250-ufshc
> @@ -178,6 +179,31 @@ allOf:
>            minItems: 1
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm6115-ufshc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +          maxItems: 8
> +        clock-names:
> +          items:
> +            - const: core_clk
> +            - const: bus_aggr_clk
> +            - const: iface_clk
> +            - const: core_clk_unipro
> +            - const: core_clk_ice

Use existing name and put it in the same place as existing variant - sdm845:
ice_core_clk


Best regards,
Krzysztof
