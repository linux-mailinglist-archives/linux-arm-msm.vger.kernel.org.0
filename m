Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357296FA6EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 12:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbjEHKZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 06:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234547AbjEHKZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 06:25:11 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747E1D84C
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 03:24:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f24cfb8539so1303943e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683541479; x=1686133479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5b1axjYU7Z/HNBec4s202rAT9q9NaOrWGm5FGLB+aw=;
        b=k59HEF9KgCyRMJijY/SXi9N5BvmCqLx8yvuPRnMUFWGKgZotfMQN/DOwvVfSGCYF6S
         szXjAmKkkgfE1PXwZPhFEOADyX+f+B8MayikFS6sAJ33PG8PP4H6IcvIOwpTtxwJjziW
         UyBhX1qWMQLaA6CtAgsiXAMl6KLgTQm+WQWFrLVi5QxbnQMk2eTlgQsU8TReNNvUUWfv
         R8efMG2+yLahW79xSbl4Yh2MV1asVHQr1fm9CLUMjiLPsMawkKDYwnB+2KgyOBD6SWYq
         rrMAbGT5CB37GRHYEGbJHD16LeyjN0vPwbbyBA6t8G2HXcM+GeHUEKmxBik/hsoNFLAQ
         8M1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683541479; x=1686133479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5b1axjYU7Z/HNBec4s202rAT9q9NaOrWGm5FGLB+aw=;
        b=MZAijs4GO3HMbbbHfhS30yUn73cxSiy5VE2ZgcaeLDoFdxRSCm5pJ9hHDoM2LXGtRz
         Q5omLHTsAdPGkZlhdlfmafp99D3RaUQJo+hUE6jlXlIcRV/z17S//TPMPUw0gcSiGhDA
         M5yXQj10cfdLe1hy3a7FVMPbGb0di3p6tqIHq+ZUXKSTjR0hCcc0GTiBB1QX9syJ07Eu
         LohgfGpLED7F5uU7PzJ+y/xjjTRIjgWgrD/ZeN64SMo8RluorckTJBSxbxZCBq3nGxgg
         AqQUCschlj5gJetT+93tIrg1cCLPWtE3I0MGORpjxGkYk2UbaWGPZDOHhv4w7pwGu/4R
         4CZg==
X-Gm-Message-State: AC+VfDx1iCfl7LZZs71f7DrSYCainbx6Xna9jpDSP0OhouAzUyWi6o8t
        wIEkcNklv/gW5mhChRA+5R+xHA==
X-Google-Smtp-Source: ACHHUZ6QzaiyYn3670VJ6ShRWtlutGRBQcW/dmwm/vOzt1VCah6EWHn7rTSuj+AKFTcnAmhna1lsfQ==
X-Received: by 2002:ac2:4831:0:b0:4ef:fed9:8eed with SMTP id 17-20020ac24831000000b004effed98eedmr2554217lft.30.1683541478740;
        Mon, 08 May 2023 03:24:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b3-20020ac25623000000b004edd490cf77sm1248895lff.275.2023.05.08.03.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:24:38 -0700 (PDT)
Message-ID: <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
Date:   Mon, 8 May 2023 13:24:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem clock to GPU
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
 <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 11:30, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
>> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
>>
>> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Uhh.. this clock should be managed by RPM with:
> 
> type = MEM
> id = 2
> 
> just like it's defined for 8994 today.
> 
> Could you try adding it in rpmcc and confirming?

There is an RPM_SMD_OCMEMGX_CLK clk already, it is a bus clock for the 
ocmemnoc.

> 
> Konrad
>>   arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> index 834ad95515b1..fb661c1bd3d5 100644
>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>>   
>>   			clocks = <&mmcc OXILI_GFX3D_CLK>,
>>   				 <&mmcc OXILICX_AHB_CLK>,
>> +				 <&mmcc OXILI_OCMEMGX_CLK>,
>>   				 <&mmcc OXILICX_AXI_CLK>;
>> -			clock-names = "core", "iface", "mem_iface";
>> +			clock-names = "core", "iface", "mem", "mem_iface";
>>   
>>   			sram = <&gmu_sram>;
>>   			power-domains = <&mmcc OXILICX_GDSC>;

-- 
With best wishes
Dmitry

