Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90AA574370B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjF3I0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjF3I0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:26:01 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963DD129
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:26:00 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-313f61890fbso1744475f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688113559; x=1690705559;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JN/skVFzqLdPw7AlE3XLmce7r2j1OJBz1+1w6/PJFoY=;
        b=aXuneFJUVUDufOAQdR4wSkHP3Z4W9okhCvGEmoa1q7Oqj066AEx6fVt7K3lFpVPzP/
         1zRodu+oZqIkGzhbyEnv43NatnIdVZ5aKV+qQTAepUajiskl4SAUxd7JOkrqF7YAWOjH
         mig5JpK2mlCMk6O1pVjJp4X2QfpDYvFoY0Eqx2ZJLaHEQdTTxmAkgCxLMSBimDyD+VaY
         wwnBoSrpyM7A1CPwpTUvCqEe0cG7sM2cGAoBoGYYvxkmh1k0mMhm0BGnHl+CuKgtxv7U
         tjp6h2uTWI1UoJT/ZHZnKt4kyuKzHgnFCEYsG2uld20AO1Xxv8ZHbEQOSY7QwgIAK+cd
         39iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113559; x=1690705559;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JN/skVFzqLdPw7AlE3XLmce7r2j1OJBz1+1w6/PJFoY=;
        b=kho/yEfzqlZTEqQXKruzw8BkacpVixFNzAFqJ4dlB/XXz1xnCwr0qxpb8x5NLsdJMF
         AJMCQrc94Jo+K2n6x5kCOis4M7BuMp6yEWI6U5/U3vP0xZsyAbzZU2w3h2V1o31EXlY/
         OS75uDcGy0707Ud00U7CRzxM2fvKdoZhxxSNLSPVxwiwVlvclgwxL/2EoIxGaJ124V5m
         iyLW+eMnhQ5jptiz6wKGim3LsRMFCl56GuY+stamGIlHIycaq7ZlvBcVtraZQmcXEF9b
         vPdebbK5XvTN88/RkKBvohApwVNtdL/nOTKxuJOPWStRMw1XsC/c2RMUxRvkOCEAlfcx
         O4CQ==
X-Gm-Message-State: ABy/qLbP6n5O/m4KWtRC/qF2qw4HDTTmpE2pKcHgXpLRR63Z9pr3L//H
        zet2K6BHxdX3eHksdAf9OCT9gg==
X-Google-Smtp-Source: APBJJlHa087MAwC780nBikc1q9i123IcPApI2AHu7dPIl8dKNMLM3FF0iBM0DpSao+JpY2tRW5YBsw==
X-Received: by 2002:a5d:4c43:0:b0:313:eee0:89a4 with SMTP id n3-20020a5d4c43000000b00313eee089a4mr1559018wrt.12.1688113559055;
        Fri, 30 Jun 2023 01:25:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:eac6:eb92:cae4:cfd2? ([2a01:e0a:982:cbb0:eac6:eb92:cae4:cfd2])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d5682000000b00313ec7dd652sm14860320wrv.44.2023.06.30.01.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:25:58 -0700 (PDT)
Message-ID: <f69b60b9-9c22-655c-3152-4874e2fb8865@linaro.org>
Date:   Fri, 30 Jun 2023 10:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8450-hdk: remove pmr735b PMIC
 inclusion
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-6-dmitry.baryshkov@linaro.org>
 <ace0b594-c1d1-09b9-7402-484091268a55@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <ace0b594-c1d1-09b9-7402-484091268a55@linaro.org>
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

On 30/06/2023 10:13, Konrad Dybcio wrote:
> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
>> The 8450-HDK doesn't use PMR735B PMIC. Drop its inclusion to remove the
>> warning during the HDK bootup.
>>
>> Fixes: 30464456a1ea ("arm64: dts: qcom: sm8450-hdk: add pmic files")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> That's.. strange.. Did you confirm this with schematics, or even better,
> socinfo?

I confirm it doesn't have a 735b from the Schematics

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
> Konrad
>>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index bc4c125d1832..dabb7e872f38 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -14,7 +14,6 @@
>>   #include "pm8450.dtsi"
>>   #include "pmk8350.dtsi"
>>   #include "pmr735a.dtsi"
>> -#include "pmr735b.dtsi"
>>   
>>   / {
>>   	model = "Qualcomm Technologies, Inc. SM8450 HDK";

