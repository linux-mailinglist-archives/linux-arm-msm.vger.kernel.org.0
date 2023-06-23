Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA5973B76C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 14:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjFWMfD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 08:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjFWMfA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 08:35:00 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94381FCE
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 05:34:49 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fa70ec8d17so16899135e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687523688; x=1690115688;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1yZaWJGe9IcIKWNFpQUcAmfs5rS4cwacSwQxYTHl74=;
        b=GqNLDhDRTN6ok7PjO865yX7X3mT/Pb35GyUvaH6DePu01cUCOMxDbFwXI3LW/EoYZ3
         pKYniy2LaU83C7AdOUrghfd89pQbqxU1zh0i1yHzgKLFYzK9i8jYT+YsB0KG8DE/DA10
         pWOMsGunZ7GTpdNRQewlPEH4WyUnv9j4sedqUhKncv+1wI+5FEZq6EaOvwPpvoAkF1us
         gIkMZFR1pnCg1/YPb+wXpEuFTnMpi9cxC9JaR+sA0BwCRDfu45CeOws0/ma0Uohzxs4w
         nq0kLPupebWozyr4gM94xrPp8zeCX/DjwEri5XVVtJTneRCF+2U3EKDOABXRTiHoiYb8
         uWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687523688; x=1690115688;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1yZaWJGe9IcIKWNFpQUcAmfs5rS4cwacSwQxYTHl74=;
        b=QK6BZUelzsKNq3vN80eUzk1Acm+xt2NlrG5GOb1AFW/vq3pGsfRont27rfeOjNmAvu
         nUzcHMCMujINSds9uwTteUeYVTbGa/oFf9gQMFjUm3vvm6E7g4LeYDhmzHlt7U5+czTG
         2DMBU3HukmkaxPzSyIpDWzgPH2UVcWDz6IBZiP+zmx+IQDKHxrRM6Wd1VAGhazCFPaGq
         V7itBsrRVIr7QFASks2PNM68yaL/URW1/2wD8t+KhFb3+A118p4qGyTWbXWQ36of1UcD
         ZrvmlcgmfHHG6/6+tW+ScpRe3yL7Ey7f4NilsRr+zAfraN845h4snhmQG5MREZVkoQkQ
         g7Qg==
X-Gm-Message-State: AC+VfDzrUL2YXJLgJ0f1fvK0srmmQ1cykuV6gAmsGBHILgjy4gJrc4kc
        e6RtuGtGmQuGWAcQK0kZBaVFaw==
X-Google-Smtp-Source: ACHHUZ5yeHlhiQmXZLa1mYovHiOgvXzYqqfZRMhfDDvQP9zdkIqqawnzDkpqqWGh/UDGyzaIZZcDsg==
X-Received: by 2002:a05:600c:861a:b0:3fa:77b0:263d with SMTP id ha26-20020a05600c861a00b003fa77b0263dmr3876640wmb.14.1687523688208;
        Fri, 23 Jun 2023 05:34:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t23-20020a7bc3d7000000b003f9b0f640b1sm2250520wmj.22.2023.06.23.05.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 05:34:47 -0700 (PDT)
Message-ID: <472d7c85-2b73-aa7d-b060-5a1a87580f15@linaro.org>
Date:   Fri, 23 Jun 2023 14:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] scsi: dt-bindings: ufs: qcom: Add compatible for
 sm6115 and sm6125
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
        Lux Aliaga <they@mint.lgbt>,
        Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230623113009.2512206-1-abel.vesa@linaro.org>
 <20230623113009.2512206-3-abel.vesa@linaro.org>
 <1e66ae2e-d88d-7c7f-a42f-e4ba17fd254e@linaro.org>
In-Reply-To: <1e66ae2e-d88d-7c7f-a42f-e4ba17fd254e@linaro.org>
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

On 23/06/2023 14:33, Krzysztof Kozlowski wrote:
> On 23/06/2023 13:30, Abel Vesa wrote:
>> Add the compatible string for the UFS on sm6115 and sm6125 platforms.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> ---
>>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 32 +++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> index bdfa86a0cc98..46f454ec3688 100644
>> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>> @@ -29,6 +29,8 @@ properties:
>>            - qcom,sa8775p-ufshc
>>            - qcom,sc8280xp-ufshc
>>            - qcom,sdm845-ufshc
>> +          - qcom,sm6115-ufshc
>> +          - qcom,sm6125-ufshc
>>            - qcom,sm6350-ufshc
>>            - qcom,sm8150-ufshc
>>            - qcom,sm8250-ufshc
>> @@ -163,6 +165,36 @@ allOf:
>>            minItems: 2
>>            maxItems: 2
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm6115-ufshc
>> +              - qcom,sm6125-ufshc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 8
>> +          maxItems: 8
>> +        clock-names:
>> +          items:
>> +            - const: core_clk
>> +            - const: bus_aggr_clk
>> +            - const: iface_clk
>> +            - const: core_clk_unipro
>> +            - const: ref_clk
>> +            - const: tx_lane0_sync_clk
>> +            - const: rx_lane0_sync_clk
>> +            - const: ice_core_clk
>> +        reg:
>> +          minItems: 2
>> +          maxItems: 2
>> +        reg-names:
>> +          items:
>> +            - const: std
>> +            - const: ice
> 
> Same comment about reg-names as for your further patch.
> 
> I guess this will supersed the
> https://lore.kernel.org/all/20221215190404.398788-1-they@mint.lgbt/
> (because it was abandoned... I keep rebasing this patch for half a year)
> 

The 6115 is even older - from October:

https://lore.kernel.org/all/20221030094258.486428-2-iskren.chernev@gmail.com/

Let's go with your patch, but you anyway need to fix reg-names.

Best regards,
Krzysztof

