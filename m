Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631E95B3079
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 09:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbiIIHjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 03:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiIIHix (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 03:38:53 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAC3124610
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 00:35:53 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id l12so810344ljg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=555JM3E3kG8yPe2JWLkJCiVLUYiSpaWOeW349uC31mA=;
        b=GVP49Aqh8XFH5zTOQOiwICGGzG0Y+YD79RjoInSRl0WHma35J8zZoSogeT3sUx4xoj
         sp8g1WsO2IDhFqiFIxy4Jk8F08KUwRS50dlbN73jtu8Qsnm7jW6TWMhDNfZjHSPByzqa
         G/YHbvWVf/4C3rXj1O0V2j01rNtypZXB5vuVIMF8Qz0LlxWYpHcjymO6leVQ3XgxzXfd
         VVJ4pIswb+b6Lxf8JBUkJIVToCZ+3jBzvzUxgysC23zpD1GFX4XRdmG8RClIfImon4dL
         EXWxLvQ9/slO3r4DLg/nZMfIVT5qaBDn2At1MIE5JtktTarTgNUn9mmpDlpCRJ1Qs772
         h7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=555JM3E3kG8yPe2JWLkJCiVLUYiSpaWOeW349uC31mA=;
        b=IxpIzwBqYzCZYOqoUGVW17dpI7X1GnIRcFOXmE9UPShih2GojdNicPwuKBILYqSuQ5
         spEc+6HzqpZwhdfQ3KXz/ogayV1j7mVTqiHFlmsAjfghTN8BDQHtmiD0mGBhztxYEph8
         kViHgh5pY2oMv60gqu7QirIngmDa2+2fsiJOrbMS2Id2sggP/1uOBlCSGXLAm3cORyvS
         2f3dkIAkhJU2hv/A5qJfXdNDz4B0A7vVkYBjITDPATrZt79+Ywbbtqp1n6ZHsYluzHxG
         9qMeRVyPfRAjRx1mNXAPIHZq6kiSU1T/qdmhTQnb255NlcZMW259RF3eOnurakhqCQmB
         IgTg==
X-Gm-Message-State: ACgBeo0LMUIz2YUId7GZrouG2QG+Qc5yffhTfQVC01Zuy2U8+MjCRbiq
        hs+2bXzefddAfPV4U1Xg5pyhvg==
X-Google-Smtp-Source: AA6agR5+9OZpQc/apjMdPrSeSbMl1+YhF8ynIZ+NrlpyerosYwA1YdN0TD3MuDYyujc8ahYgwRssfQ==
X-Received: by 2002:a2e:7019:0:b0:26b:db2a:577f with SMTP id l25-20020a2e7019000000b0026bdb2a577fmr1678252ljc.105.1662708949663;
        Fri, 09 Sep 2022 00:35:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t23-20020a056512209700b004974da17c2bsm178594lfr.0.2022.09.09.00.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:35:49 -0700 (PDT)
Message-ID: <a34c93dd-bb6e-6479-295f-90507f112828@linaro.org>
Date:   Fri, 9 Sep 2022 09:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] pinctrl: qcom: spmi-gpio: Fix the GPIO strength
 mapping
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anirudh Ghayal <quic_aghayal@quicinc.com>
References: <20220907201528.9351-1-quic_amelende@quicinc.com>
 <20220907201528.9351-3-quic_amelende@quicinc.com>
 <2b809e98-85ea-6ad9-e810-106563937ddc@linaro.org>
 <330b5f46-1bd2-5727-b63c-c730fbdda22c@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <330b5f46-1bd2-5727-b63c-c730fbdda22c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 01:52, Anjelique Melendez wrote:
pio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>>> index e5df5ce45a0f..950be952ad3e 100644
>>> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>>> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
>>
>> You cannot mix bindings with driver. This is an ABI break.
> Ack - Will separate into two changes.
>>> @@ -12,9 +12,14 @@
>>>  #define PMIC_GPIO_PULL_UP_1P5_30	3
>>>  
>>>  #define PMIC_GPIO_STRENGTH_NO		0
>>> -#define PMIC_GPIO_STRENGTH_HIGH		1
>>> +#define PMIC_GPIO_STRENGTH_LOW		1
>>>  #define PMIC_GPIO_STRENGTH_MED		2
>>> -#define PMIC_GPIO_STRENGTH_LOW		3
>>> +#define PMIC_GPIO_STRENGTH_HIGH		3
>>
>> Didn't you just break all DTSes in the world?
> Ack - lol. Next version will include changes to update any DTS
> that uses PMIC_GPIO_STRENGTH_ 

There is discussion with David, so please wait till consensus is
reached. It seems you want to change DT binding constant to match
register value which is not appropriate. Constants are not change'able.
Constants are abstractions which might or might not match register value.

Best regards,
Krzysztof
