Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52341649D37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 12:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiLLLKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 06:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbiLLLJP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 06:09:15 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74C9E0D
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:00:14 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id z26so19376lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 03:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M3x0iqp5aFPz8f2kzDNdPrCsTS3tTCB8nihQCK7Ujcw=;
        b=bXRlZpMTIild+Dxjk6apgmlu9Il+qjLhPOq9J0J1hEypjodLTVRxyg8MNOMvWqhqRP
         T45c287U3setZH4Mti8QK6YaAgHzKER67ZSyAPK4j4AkmGoVZ/CaRcqxY1QsqpY0I2/i
         6HL6vf6SvYzlrNHCEMkqrBOQmqlX8VnEDvYr38G+yovRYxUerOzwjOFYYw+OTg0bjSRB
         QY91vvJK+u4tOW5JNYp1Rd2HwQi8EWzuXEDRjowdUlT7TNZ7apq5EGDRpyWlTqcS7gvO
         txFxxZ/uEQmsE1729bgdw1quhYnSqArU0SSRNGjsGKRCyY5AR3fR1GIxbmzDUrMYiuUC
         i3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3x0iqp5aFPz8f2kzDNdPrCsTS3tTCB8nihQCK7Ujcw=;
        b=h6VzWJG0Q3RzHX7y3rIK2lD9IJnnCJtFcF03xpCEylfPvdsHJEDNLHkygZ4eBbDq7M
         dgVS4Qh4f4qFk7AO/60jifHwuSv2BSPJN5WB6yYknmEgXAoPqmLI1sAXmt6qP+fwWImW
         mpBOjWu5mMO734pz44+hbbpfMi+HGGi2PeWButJ9Fso8y8D9fsYjgrtfVN7vYpDg8/Tq
         Q4QjfiUi4HMObB8tLPO+V1HHCdmpl+XKRodnEbyTQGTVxMx5g7LlywKs6uzNMkGLaR36
         sp5jn/8nu2Yr6u6rittfRWIzei6xKN2N/9huUAJDhJ48aIQEfUmggWpeL8wQFUBrz0lK
         jtqg==
X-Gm-Message-State: ANoB5plD6ziCZJC3CrIARb70jAs7wU1W2iJzc/7o72h12Qbk0GJr4lxe
        OIuDphiae/BGaVvWIVI3hJiC8g==
X-Google-Smtp-Source: AA0mqf4qaFlUlwvilOU1C1c17UbZjKzRgdAXx+vap0wTJcndFZ0qJ/knDQkSYUBNQirD9djsjr4DTg==
X-Received: by 2002:ac2:5f6a:0:b0:4b5:61e8:8934 with SMTP id c10-20020ac25f6a000000b004b561e88934mr3245177lfc.64.1670842813000;
        Mon, 12 Dec 2022 03:00:13 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512312e00b004b550c26949sm1578128lfd.290.2022.12.12.03.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 03:00:12 -0800 (PST)
Message-ID: <57d3ba20-f1de-d7f3-d689-b25a02174379@linaro.org>
Date:   Mon, 12 Dec 2022 12:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM8150 DPU compatible
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20221212100617.18190-1-konrad.dybcio@linaro.org>
 <552EFDD5-4BBE-408D-90EA-C96F4A0876B7@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <552EFDD5-4BBE-408D-90EA-C96F4A0876B7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.12.2022 11:58, Dmitry Baryshkov wrote:
> 
> 
> On 12 December 2022 13:06:16 GMT+03:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>> From: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> Add the SM8150 DPU compatible to clients compatible list, as it also
>> needs the workarounds.
> 
> Please rebase on top of linux-next, this part was rewritten.
This one wasn't, but yeah it is based on some local changes
(see 6350/6375)..

Konrad
> 
> 
>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Depends on the binding here:
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20221212093315.11390-1-konrad.dybcio@linaro.org/T/#t
>>
>> drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 6610f5d2877d..cd74c1efcfde 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -255,6 +255,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>> 	{ .compatible = "qcom,sdm845-mss-pil" },
>> 	{ .compatible = "qcom,sm6350-mdss" },
>> 	{ .compatible = "qcom,sm6375-mdss" },
>> +	{ .compatible = "qcom,sm8150-mdss" },
>> 	{ .compatible = "qcom,sm8250-mdss" },
>> 	{ }
>> };
> 
