Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C0973B767
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 14:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjFWMeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 08:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjFWMeQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 08:34:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A332735
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 05:33:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so744965e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687523620; x=1690115620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJBbPxfWrIuV/htAq2D57dxg7jiTMZRQ5tzvyjJ5U0I=;
        b=obCSInjK7X4096fRkEPea7JwwnsafzrelyXkIFyENBxm8AVq38u32KeiNjuhlLKsVV
         1UheljHPXGlSq4bNOW0m5eZmOWtS54Sg3xQtMfIQx9ApUGvZOx/0DHyRqA+SXbDQFD4V
         YtzSVWYLXEHe8YeFETDHIR7byqi2iq74de+bjjRuUN424V8wnRb5dI6+KjiD5F/VBi+w
         1yuyBVWPyGKEBjVO1VdDPh03AY8JNoVzNn1IRl+RWP0V4lB59RvBGkGdX3KB40HQBqRc
         PYIcosaRtg/hFlhFxjkh8qgOp4S+oA/7qQglZgcZyBAkEeETTfbHYR9VUXtdkthWp1p2
         OQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687523620; x=1690115620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJBbPxfWrIuV/htAq2D57dxg7jiTMZRQ5tzvyjJ5U0I=;
        b=kP8FVQgeif31OPzamr24RCvNVrvKDa4T0yHs2+2UR2LJIphW3CDhNMubt0w656gFST
         fyrQVTIFnocod9jKnl8lSbUEji0HaxuucnWuEtIfncA21ZQhtq/jP9TfXTULRRtH5Qvq
         jqy2Uqj0VNge4j1GmB/0gpcBagd4MyAnzQD2zTBvA00i03AcgOmC8idTTi/Jx91QS9Q0
         n2kruPngpxMO2+4l2jZWFwydWqtfEAMiVKovPvtix86K6J2eAc04El2TvwLdYWvR8Unv
         Nl85eJBRbD1XOruja3n/XL1w/M6a932RwnbShIqTgO060DHomBffyYXy7IVa8q3eNVqX
         jMmA==
X-Gm-Message-State: AC+VfDxDbdNDMvodooMeT8xtwixu8KFedpeo/ccctLMEBYLy1iUnUKmB
        RjclSFwdptxprhIfTbC9ZoPL0g==
X-Google-Smtp-Source: ACHHUZ4D6vGRZleunmyW53hwe9ptNk+Pr8vApp749tDGYCvrBNMzpoUEmxmZagf3RvI/kCp5lfPBhA==
X-Received: by 2002:a19:ca08:0:b0:4f8:5792:3802 with SMTP id a8-20020a19ca08000000b004f857923802mr12828607lfg.10.1687523620328;
        Fri, 23 Jun 2023 05:33:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c204400b003f90a604885sm2213436wmg.34.2023.06.23.05.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 05:33:39 -0700 (PDT)
Message-ID: <1e66ae2e-d88d-7c7f-a42f-e4ba17fd254e@linaro.org>
Date:   Fri, 23 Jun 2023 14:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] scsi: dt-bindings: ufs: qcom: Add compatible for
 sm6115 and sm6125
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Lux Aliaga <they@mint.lgbt>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230623113009.2512206-1-abel.vesa@linaro.org>
 <20230623113009.2512206-3-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623113009.2512206-3-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/06/2023 13:30, Abel Vesa wrote:
> Add the compatible string for the UFS on sm6115 and sm6125 platforms.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index bdfa86a0cc98..46f454ec3688 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -29,6 +29,8 @@ properties:
>            - qcom,sa8775p-ufshc
>            - qcom,sc8280xp-ufshc
>            - qcom,sdm845-ufshc
> +          - qcom,sm6115-ufshc
> +          - qcom,sm6125-ufshc
>            - qcom,sm6350-ufshc
>            - qcom,sm8150-ufshc
>            - qcom,sm8250-ufshc
> @@ -163,6 +165,36 @@ allOf:
>            minItems: 2
>            maxItems: 2
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm6115-ufshc
> +              - qcom,sm6125-ufshc
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
> +            - const: ref_clk
> +            - const: tx_lane0_sync_clk
> +            - const: rx_lane0_sync_clk
> +            - const: ice_core_clk
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +        reg-names:
> +          items:
> +            - const: std
> +            - const: ice

Same comment about reg-names as for your further patch.

I guess this will supersed the
https://lore.kernel.org/all/20221215190404.398788-1-they@mint.lgbt/
(because it was abandoned... I keep rebasing this patch for half a year)

Best regards,
Krzysztof

