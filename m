Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C89470543F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 18:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjEPQnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 12:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjEPQnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 12:43:31 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B62418E
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:43:20 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so20075385a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684255398; x=1686847398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ZOAvhyxA95RofjLlLR11FjDxcxYHAHrGMmYu61fUjs=;
        b=Dv7an/6KD+W5Xd63hlfW3ttz36K6sbi1iFuNiQllmPTQhkNSy3iHOXepcGQ+d4DkOl
         yNiK3PmNk7Z+1D3txCakt9lTdY/5DeUeO0hDyWPpf2d5UyzbwopoCi1aCA746lTuLrAC
         HF+ozSckD75BDANBKyo/P9pg6RXKgI84SmHjSsym2Mf+UkRP4c+Ca3zXg9FrVz64fTgZ
         5hizTDNK6umw4zZIIXsYiRIpmqXOcy7Wwwl2OmkUhvus3lHVFJZKFpQS14R7fwl96wiZ
         F4V4a4ssE8PwKUwELTpWupkte1yFj+itZDMTYg1o8pKo+AKLWvY/AWvQharpESta/AY9
         KqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684255398; x=1686847398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZOAvhyxA95RofjLlLR11FjDxcxYHAHrGMmYu61fUjs=;
        b=h4sq4dK6H/697dQppVwvTqMO17bDntf3hKb8JhDbIE51qKYj2+WQscNXGiYnAukfE9
         nXIvsg3hIxud10VILOJ+iHxhuk8Sb+BKsmtEetOv/qmbKCkMONMLn3F9dV1UgOzLku12
         7QBKkwjBq8Km12RbK/upwXgjF8gMfUsa6QDx+Djc95/FZQSXcbHfKB87F0kv//z2GwWC
         n28/FLFqUzhe/6YoSVxBq91mxLwtBeWo5fnlFZOlNB3GJGO3uLMtZIiq/Uuspqb2yk8+
         5EAvuyJAoBYS52ZI6ojqS62223rMAcfpioPMuWgBKQ96OD19/6efvmACTGjLnz2CuhbX
         3CaA==
X-Gm-Message-State: AC+VfDzVoiqVYGgxGMtSg1bfueaBWSk2/hA73s5vArA3y3/Mo2skr3mV
        GW5C1SOSPGWOQIw/8zZ7E4REWQ==
X-Google-Smtp-Source: ACHHUZ5QBUhMbbYPJ3FFfVmL6YJJnFhhoYonM5rq6g9+g09lJZFNYofPfcq1AViw2emSGqbXUz96GA==
X-Received: by 2002:a05:6402:1806:b0:50d:8979:5722 with SMTP id g6-20020a056402180600b0050d89795722mr28080735edy.39.1684255398040;
        Tue, 16 May 2023 09:43:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id u24-20020a056402111800b0050bc4eb9846sm8354012edv.1.2023.05.16.09.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:43:17 -0700 (PDT)
Message-ID: <2e6f282c-33d9-7f96-0338-c4fd457d04fa@linaro.org>
Date:   Tue, 16 May 2023 18:43:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8550-qrd: add PCIe0
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230516133011.108093-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJpoTgseo3j_5Ab7cQs3ZZZymALpRqpuWGPyKpTEbXR-Cqw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpoTgseo3j_5Ab7cQs3ZZZymALpRqpuWGPyKpTEbXR-Cqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 18:39, Dmitry Baryshkov wrote:
> On Tue, 16 May 2023 at 16:30, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Add PCIe0 nodes used with WCN7851 device.  The PCIe1 is not connected,
>> thus skip pcie_1_phy_aux_clk input clock to GCC.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 32 +++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> index ccc58e6b45bd..e7a2bc5d788b 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> @@ -385,6 +385,38 @@ vreg_l3g_1p2: ldo3 {
>>         };
>>  };
>>
>> +&gcc {
>> +       clocks = <&bi_tcxo_div2>, <&sleep_clk>,
>> +                <&pcie0_phy>,
>> +                <&pcie1_phy>,
>> +                <0>,
>> +                <&ufs_mem_phy 0>,
>> +                <&ufs_mem_phy 1>,
>> +                <&ufs_mem_phy 2>,
>> +                <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>> +};
> 
> Is there any reason to disable the PCIe1 PHY AUX clock here? I mean,
> the PCIe1 is still enabled in the hardware.

I was thinking about this. The AUX clock seems to be an external clock,
although I could not find it in schematics. I assume that on QRD8550 it
could be missing, if it is really external. OTOH, downstream DTS did not
seem to care...

Best regards,
Krzysztof

