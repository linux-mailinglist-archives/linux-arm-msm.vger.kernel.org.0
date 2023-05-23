Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6090770E72A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 23:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjEWVLh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 17:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjEWVLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 17:11:37 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDE8BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 14:11:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f122ff663eso398457e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684876294; x=1687468294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwIhmrsQJ7QnwL7e4eq0vww7jWtKFFsjD60ecviXONI=;
        b=QudcRyYAP6hxa8i19Pfje/JYk1suIs8GeAR66+BIieeRu+Q+L7AzIwyWGaZwav5aeG
         ktISua9geZswTQGhYdO3vIrcJ/Ne+0XCMRZs0kPXR/CzbJRYkqFR4SfQdDHOm28JTpGF
         aB0CrDKneInYUwtXvFSFJ8rBNnl5xqiEn0Y0D/udWkpzyZTBhyO4y0fCHxJbbpKwGTfj
         DHVaB5TRZzbljaEuZI+7kiDIsYEHmMdmD84M4HOFhWH2vqjsBF89DumiWMJORbT5QWiM
         UfQEgv11F0R3XV5S/Jyfu0kzfe0dUN9jACVA22Wx3iNlX4qx/o4F6GKRqsEE2/rrvei3
         kWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684876294; x=1687468294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwIhmrsQJ7QnwL7e4eq0vww7jWtKFFsjD60ecviXONI=;
        b=NZ3TqTFczVJM1sNhL6Px0CYLaIqcahb/IyEpaD0QXx/0FnixEvk9O9BVQuvIi7yQ4o
         KggcqUxHuvpc1003RX063OLL6PHhJCADTJP87GbOIOaXkJzL/9ERDip3u2vJdjz6ybqs
         zRa2tuQevVJW3RXHmDz6ruMVj0IhchqJYzzjdxboASknYZrPJlii8VgkZVuyfnvrTmUn
         rSdhQ3clXsCwmG7e+u32wAO2tlkRw6Wko8uCQ+mjCkIWxT6BBhI5D1/Y1/69jKYIJ7Dc
         GAVOCL/PmSrjCvbvYUqPqNKmzIoSI0Rd36U1G/wFDXDNxTINfBeuH3SHRSNMQOiPb21p
         vNzA==
X-Gm-Message-State: AC+VfDzV9O6n09XFvRn1f0MX5N5AsG4vXsMGeiyrCEwdxu3K0ifCgiUU
        YQHWilhJ1mcqvy9c1sgjfrHyKA==
X-Google-Smtp-Source: ACHHUZ72lhmju7p99i7g5ka41ue3CdFXr+eThZetSZtVFbM49HxjPrQ9kj8HfJQG/FuH42QQL2tsfQ==
X-Received: by 2002:a05:6512:38d1:b0:4f3:96ac:6dd8 with SMTP id p17-20020a05651238d100b004f396ac6dd8mr5115269lft.4.1684876293846;
        Tue, 23 May 2023 14:11:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b1-20020ac25e81000000b004f14591a942sm1446151lfq.271.2023.05.23.14.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 14:11:33 -0700 (PDT)
Message-ID: <bacae75a-6030-ff8b-179f-7d662140bae7@linaro.org>
Date:   Wed, 24 May 2023 00:11:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/5] arm64: defconfig: Build interconnect driver for
 QCM2290
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
 <20230523165411.1136102-4-vladimir.zapolskiy@linaro.org>
 <21baf481-347f-d4b1-87df-833ed16cb729@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <21baf481-347f-d4b1-87df-833ed16cb729@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2023 20:30, Konrad Dybcio wrote:
> 
> 
> On 23.05.2023 18:54, Vladimir Zapolskiy wrote:
>> Build Qualcomm QCM2290 interconnect driver.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
> Do we know why some are =y and some are =m?
> 
> I'm for =y either way, if we can.

I think this might change from platform to platform. What is the 
condition for selecting 'y' or 'm' for the core drivers? Is it 'should 
boot to rootfs without modules' or 'should boot to UART and load initrd 
without modules' ?

> 
> Konrad
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index e2f6a352a0ad..ec9b828b14e2 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1415,6 +1415,7 @@ CONFIG_INTERCONNECT_QCOM=y
>>   CONFIG_INTERCONNECT_QCOM_MSM8916=m
>>   CONFIG_INTERCONNECT_QCOM_MSM8996=m
>>   CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>> +CONFIG_INTERCONNECT_QCOM_QCM2290=y
>>   CONFIG_INTERCONNECT_QCOM_QCS404=m
>>   CONFIG_INTERCONNECT_QCOM_SA8775P=y
>>   CONFIG_INTERCONNECT_QCOM_SC7180=y

-- 
With best wishes
Dmitry

