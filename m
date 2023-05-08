Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488C46FAE85
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 13:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236343AbjEHLpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 07:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236211AbjEHLpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 07:45:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CBB40317
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 04:44:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f00d41df22so28268902e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 04:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683546280; x=1686138280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrFJOAfBjIdtTM+83uca5CNg4mPkCFHSVpH+YbKzinI=;
        b=pIhQWKOFWJJ4QDF2fxfLs4j7GQxOqKxMkHQEqPhtb3WyxoFcjn63OxzbmDTN61s9Ok
         pt4MQwxT3cLaz9Sb2/kPhVfEU5xX9eq8OFEFv1W2QlTEaX6HqGIFAqt3vG10bxygAll6
         Pmf887VpWAYoFOOamsfCiZbEoY59NGLvkk0ioMqeisFlEVEiPSWhEhISnZaJPOd/ojZu
         wK3JRmzlWyx9sRhMLgMwv2uMbieRergvgr2au4kzHwLZFInbzIesOKh+ZvDu8ELzl6Ue
         A9d9r5DDaMAwz+QmTQ48tWLQ/GzCv0v0Le3JRLN/Om9j0/hOoMmDj98DxDSN+yYuXM4b
         imjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546280; x=1686138280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MrFJOAfBjIdtTM+83uca5CNg4mPkCFHSVpH+YbKzinI=;
        b=cMpzd2vQ8yJAoTZHZyQ5x+6rI7S4hllet31tNd9g9kQ28tBQ2oOM08LBW9TxzNOjcv
         d9AXboVWqacl0nfMgWM1mP0EUenY+oV8j9lHuVZg8Z3DzrD4NU5HMjT/8T/PK3jmqClF
         J79VhLb5wZtBTtKTxpEF7a3RZzXQnQpiPoEys7cUULhUI+XNtB1MQacUyIX9Uy+HxT+6
         DubbrKhNpcvyPs9+jCVeuoJMXCBZGcZcB0mvrEKNLWObzhBQBSw00+WyhAMAXDSdlXZN
         37rnyMijI25Q16gDcUpigIhYUN67TG75fnDlgCgbjT5zmJnVjpBMLsLIc9J2lQVESAvd
         C8HA==
X-Gm-Message-State: AC+VfDw5FPAwuC8kQDpBn8m3vQju7SdgrBeu/aGagg5Qd6aTls8UBXnA
        SXk2rb0sI2QCRWzjw6rO1BhJV07dEfvIlw8/070=
X-Google-Smtp-Source: ACHHUZ7k/sHtdOWkz6FywOau3EtKo7bHpFLlu6iVLv/fdn1jLRXXwFlNofzg48MX6oMuMg2DsnASdg==
X-Received: by 2002:a05:651c:39c:b0:2ac:820c:e39a with SMTP id e28-20020a05651c039c00b002ac820ce39amr2611137ljp.24.1683546280088;
        Mon, 08 May 2023 04:44:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h4-20020a2e9ec4000000b002a8c32fd2f3sm1163741ljk.89.2023.05.08.04.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 04:44:39 -0700 (PDT)
Message-ID: <bcc03b66-14c8-6a9f-c92d-34b34b401e54@linaro.org>
Date:   Mon, 8 May 2023 14:44:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] ARM: dts: qcom: apq8074-dragonboard: enable coincell
 charger
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
 <20230508003309.2363787-7-dmitry.baryshkov@linaro.org>
 <e6120d5e-cba5-200a-1c27-0a69ca7a5c5b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e6120d5e-cba5-200a-1c27-0a69ca7a5c5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 12:02, Konrad Dybcio wrote:
> 
> 
> On 8.05.2023 02:33, Dmitry Baryshkov wrote:
>> Enable coincell charger for the coin battery which can be installed on
>> the APQ8074 dragonboard.
> Wait.. you can insert a CR2023 or whatever and charge it?
> 
> That's the most expensive and ridiculous charger.. I love it..

Not a 2023, it is something smaller. I will try finding a correct size.

>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
>>   arch/arm/boot/dts/qcom-apq8074-dragonboard.dts | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> index 16d609b85dfe..1d1c08674254 100644
>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> @@ -113,6 +113,12 @@ &mdss {
>>   	status = "okay";
>>   };
>>   
>> +&pm8941_coincell {
>> +	qcom,rset-ohms = <2100>;
>> +	qcom,vset-millivolts = <3000>;
>> +	status = "okay";
>> +};
>> +
>>   &pm8941_gpios {
>>           msm_keys_default: pm8941-gpio-keys-state {
>>                   pinconf {

-- 
With best wishes
Dmitry

