Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D30C25E5BCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 09:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiIVHEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 03:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiIVHEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 03:04:35 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB337BCA1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:04:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x27so13240349lfu.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 00:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6AOWL8X+6363yl6dlkzkEYMc1TNcmq2VygjKTCBzm64=;
        b=bKHOfDZXtMpt20Subxu34+Lu5GEWthnW5vWbQiZd2mWo9MuEdinnZCTL41VaMH+5YA
         j+BtZuHj0f5UCku2oXQvitvnGdhstHYYf7FYqqlV3wD6KLqi8Lwf2dLw+xybPogs0F65
         GsEFETmLMZXbLODHYV4TJb1CE7rEfJWP9Yer/P6SGzJ5pGsfzFq7jj39IEN+lz1YIqRu
         SNSNgDFmS4rtv+nl/90YeII1yFQRFV2hBU+bUWEoyc1JX0zC0KhbALg3RdphN0RA23pv
         ZI0dzd1PSwXsESE4gN235sETE/HdTh00uW/Uhbvz2PujcXaFucIbGQLo2JT0iNfTrfXM
         GICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6AOWL8X+6363yl6dlkzkEYMc1TNcmq2VygjKTCBzm64=;
        b=U/CXM5Oh7Zfe0X+I1iKvJhEyoc4kFRswvMziG+8hadxXIrPXQ24VWara7pFNNBkbP3
         Q7mYjN1cJQHD5PXo7Xr4InC3wpqO+Am6XdX53uMk6Lb5jq6CzBnORzuAIUawbAgppvYZ
         JMybTYC+PtWhf6yuB9z9htJcs6KO+7RDsKf79SoMbzPbRwzOjJ/oRrnF7fmSgIsvoUTL
         Tnvh2SRBXktez0w74a3ctbS8MH3cpNke6Js+Etsuv5VOT9q54r8wGPACS9xnp0pofZWF
         ZivHk5/9MGqkO96wIfN//GAhUOfEAK0tYuhbKg62QV9zTQAfTPLrDsh3CajEtKLMHRcw
         jLTQ==
X-Gm-Message-State: ACrzQf3O5Y5k78AD/FpksFUlOwi0E6OybC7M2Oarlbe4SyuegtdIL4mC
        +kWVEeekDqArMTWMl+LBSqVIvw==
X-Google-Smtp-Source: AMsMyM7ywOFavyrwCMGphDto/G9dJRxjhNMo43envFpFsgAU1P4TxjX58T9WeF7u2TcHGBNlDv1A5g==
X-Received: by 2002:a05:6512:2304:b0:49b:24a:f0cf with SMTP id o4-20020a056512230400b0049b024af0cfmr709077lfu.373.1663830269640;
        Thu, 22 Sep 2022 00:04:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b004994117b0fdsm782114lfs.281.2022.09.22.00.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:04:29 -0700 (PDT)
Message-ID: <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
Date:   Thu, 22 Sep 2022 09:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

(...)

> -  "#interrupt-cells":
> -    const: 1
> -
>    iommus:
> -    items:
> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> -      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port1
> -
> -  ranges: true
> +    maxItems: 2
>  
>    interconnects:
> -    items:
> -      - description: Interconnect path from mdp0 port to the data bus
> -      - description: Interconnect path from mdp1 port to the data bus
> +    maxItems: 2

I think this is not equivalent now, because you have in total minItems:1
and maxItems:2, while in past minItems was 2.

The same might apply to iommus. clocks look good.

Best regards,
Krzysztof

