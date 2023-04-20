Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1E946E9FA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 01:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbjDTXGq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 19:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjDTXGp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 19:06:45 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA43A2682
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 16:06:43 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2a8bca69e8bso9402881fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 16:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682032002; x=1684624002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VRh02ehzyoEGyY6i274n9E5kMLeidpEP/WyJpL8/txg=;
        b=o7pJh+V3DXABmhqqjUT2GIRj4YzEXjjsNIhqO9PWJtLbJ6OqCTNODz2Zj3Y5XnVi0M
         c23bz9hig8SpV9Dafj/O1iy3aT/dTX0xTgRr8LMX4C3bz6AxdW9NoweNgLtbL1SSTJXA
         s6kS2pvkmI2ffyW3fZOFb/6Ubz7n6Gzugu/1FYoADCIURseNUg/RTtabJ8s6iI7i7v65
         pyQQbXZ/5jZOT/dC5X1hdLCfTN4rX5p7QBSgNamnm3/jd7CUfZY5ke2vMnTrov34Nktw
         avlT9N0A2ghIcyPO/IAu2f85+7wUJuvoCCR3iTOMHCl2EfpFjqXtOQfvkFKtXJrEiTaK
         zj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682032002; x=1684624002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRh02ehzyoEGyY6i274n9E5kMLeidpEP/WyJpL8/txg=;
        b=U/hnWfUKMwqAVq+A7eugAFjSDw1op7gwgUrzwCwB3PO6YwCjwEZZJFs8i8HTAjsuuQ
         J5mrRPAyuv2lOy7E4ZD6f24j1tnOIz+l8Oev1l9EJuOFdaq56/+oHYORTMTdDGE1QiiS
         oiDq8o3K1FmOm9gd+eIh7tnTOOBu1HEEEQq9iJVgApNcOVIGvdyCs/I6/z9d+1NqwxTb
         1xQYTYcLuHxi3j/SUl0bGwc+pmfgtqq1JE5na5ZyIKwX8QwpDP0+ORlcW2LZhp3P3rNb
         NI/UGQy2ARsieb+H08d5o8rHjCFGCi840au64UaobNlnooybNf07/grQoz+HPiXNVBgQ
         1QXA==
X-Gm-Message-State: AAQBX9eq+BGPBZs1RNpZTBxLaGt8JOiZfUMYM1XC/SZhaGESTK061pTY
        QIL37JrGYHWMbV43q4e5Zy/LHw==
X-Google-Smtp-Source: AKy350Zq1ZNhlNj99Jgmj7Jd7rtWn0FVrNeuvn9rsoQRNxoUsAMADZcAou5pslRf8Kz+PdunXzJxqg==
X-Received: by 2002:a2e:8508:0:b0:2a8:a916:6b1c with SMTP id j8-20020a2e8508000000b002a8a9166b1cmr114673lji.4.1682032001972;
        Thu, 20 Apr 2023 16:06:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id y24-20020ac255b8000000b004cb41b43c25sm350956lfg.197.2023.04.20.16.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 16:06:41 -0700 (PDT)
Message-ID: <f71427ee-afca-549b-37c4-a09dcbedf979@linaro.org>
Date:   Fri, 21 Apr 2023 01:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 10/13] drm/msm: mdss: Add SM6375 support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
 <26832d5c-f55c-1dd0-947a-0278bcbf08de@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <26832d5c-f55c-1dd0-947a-0278bcbf08de@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.04.2023 00:50, Dmitry Baryshkov wrote:
> On 21/04/2023 01:31, Konrad Dybcio wrote:
>> Add support for MDSS on SM6375.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>> index 4e3a5f0c303c..f2470ce699f7 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -546,6 +546,15 @@ static const struct msm_mdss_data sm6350_data = {
>>       .highest_bank_bit = 1,
>>   };
>>   +static const struct msm_mdss_data sm6375_data = {
>> +    .ubwc_version = UBWC_2_0,
>> +    .ubwc_dec_version = UBWC_2_0,
>> +    .ubwc_swizzle = 6,
>> +    .ubwc_static = 0x1e,
>> +    /* Possibly 0 for LPDDR3 */
>> +    .highest_bank_bit = 1,
>> +};
> 
> Nit: we can use sm6350 data here, can't we?
Nice catch!

Konrad
> 
>> +
>>   static const struct msm_mdss_data sm8150_data = {
>>       .ubwc_version = UBWC_3_0,
>>       .ubwc_dec_version = UBWC_3_0,
>> @@ -580,6 +589,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>       { .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
>>       { .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
>>       { .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
>> +    { .compatible = "qcom,sm6375-mdss", .data = &sm6375_data },
>>       { .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
>>       { .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
>>       { .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
>>
> 
