Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C46A3BDFC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 01:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhGFXaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 19:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhGFXaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 19:30:14 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E48AC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 16:27:35 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id r9-20020a7bc0890000b02901f347b31d55so2906951wmh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 16:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iH/uO8X6lzu661xsm/bQ7g0+PKIzSqv92KSs9LO2e1E=;
        b=mU49Etvau3e6/EIgkqIKUdXxU+pIeHa4fwWe7dHPhzeFd+mC6Pj3YZ3fTFbA6Fur/H
         rcnjGcb4tifSQAP0zGtE/Ep/p7h0uaO7ULhMgkLjx59V6Kt/kksTenIxtshrkonXPqyS
         0V2xzoglQODpoB1LfuOc63n0oAkWgS81xaUyF4kVGUVQtgyWpLSG/LGeA9Tj0Ury6yXI
         OV2wAd+BXkADoggLJWINQFg4K83vkbcMdUCUkrMqsm7Ahev4Z/P8AsE6KPzoW47AUX4V
         qn3Vf0rBiO9rj9Npd5r3zgYFreSpj21E9kZ4r8xwGI8dFbsn9rZRGi2DvZIyvS6M6lLF
         xsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iH/uO8X6lzu661xsm/bQ7g0+PKIzSqv92KSs9LO2e1E=;
        b=DaHT/Ed2OHfuClSZzFwzdeb54As9w0P9W60C/8vJJZgxFPObKrHZPi1P3tPQLuGwE4
         MqGjmaMM21dhN4hVsC33zL2v8Nl9pDciJkgPmwI18wZKzHjiIupwZkaSOgwuCEuaURV4
         Wc2486MxOUJ5txLOkNOqArUZqMbRZRupgsYmK9iV0EC7fN0tFmQDEKOs0bzYl86BdJp2
         +i9aGacYU57ZiXgKp09rhSEdcviX/JC0jplo7fdvVnD+JmxIA0rhmOziVQGbiJccPnlP
         Cou1sUY2A1QeyTEZNgkUdQmvnUktN+LEBvphwLMkA/BvjB6gCITbK3aeiuK2uHmDF+XH
         3Xhw==
X-Gm-Message-State: AOAM533d5YYMZl5VFkN28zZn5UoZ8uUxubUn4F2xBIRHpaBcMWFSfVWx
        pUf1CFpV4+6vPgRcSPUDMlgPsg==
X-Google-Smtp-Source: ABdhPJya14etts/rB0CCjHpV8FxjE3/BYgiZdYn276a6wWWWYNYABRZv2mtWY6k+mdkZD/Q/FvRCUA==
X-Received: by 2002:a05:600c:4f81:: with SMTP id n1mr3396967wmq.16.1625614053913;
        Tue, 06 Jul 2021 16:27:33 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c12sm20408679wrr.90.2021.07.06.16.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 16:27:33 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: fix usb2 qmp phy node
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-phy@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210706230702.299047-1-bryan.odonoghue@linaro.org>
 <20210706230702.299047-2-bryan.odonoghue@linaro.org>
 <CAA8EJpooqgScxnitvBjgofBk3cqEqOsO-sWU8VP07KpB10XT6A@mail.gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <adc0ff16-62ed-4e07-1cf8-3750b4222593@linaro.org>
Date:   Wed, 7 Jul 2021 00:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAA8EJpooqgScxnitvBjgofBk3cqEqOsO-sWU8VP07KpB10XT6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2021 00:26, Dmitry Baryshkov wrote:
> Him
> 
> On Wed, 7 Jul 2021 at 02:05, Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Use 'lanes' as SuperSpeed lanes device node instead of just 'lane' to
>> fix issues with TypeC support.
> 
> I think this should not be required anymore, it is a leftover from the
> previous series which used strcmp("lanes") to create phys.
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Fixes: be0624b99042 ("arm64: dts: qcom: sm8250: Add USB and PHY device nodes")
>> Cc: robh+dt@kernel.org
>> Cc: devicetree@vger.kernel.org
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 4c0de12aaba6..270d7ff59ec1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -2123,7 +2123,7 @@ usb_2_qmpphy: phy@88eb000 {
>>                                   <&gcc GCC_USB3_PHY_SEC_BCR>;
>>                          reset-names = "phy", "common";
>>
>> -                       usb_2_ssphy: lane@88eb200 {
>> +                       usb_2_ssphy: lanes@88eb200 {
>>                                  reg = <0 0x088eb200 0 0x200>,
>>                                        <0 0x088eb400 0 0x200>,
>>                                        <0 0x088eb800 0 0x800>;
>> --
>> 2.30.1
>>
> 
> 
> --
> With best wishes
> Dmitry
> 

Ok great.
