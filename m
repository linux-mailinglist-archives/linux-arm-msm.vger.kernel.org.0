Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F256F8839
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 19:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbjEERzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 13:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbjEERz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 13:55:26 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89311A614
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 10:55:03 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bcc565280so3172746a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 10:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683309294; x=1685901294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnrC5KbWM7NW+1rdcdep21pD1YRsAygMgxxRqzKCAY8=;
        b=vflr857KdOHNGGSgi1/lYVg09hlv83Gvww0WupAJDSWmXrq9Sljm03Vk+O1Y8FGXHH
         8nfgHVuW5j2gFyUGsBfAJUjpu0TtIf8jO6M+6N5lGHvyAznhi3XMKmYi5eR2q69m2kjv
         nr3LJhfBH7d+k1QYM7mtzIzR3/jQdB5lEbq6KygbXhF15vkRMCvALeuidWFljblY1v0B
         tMzx3gpLfmDCRIZoxcOvphZU3JE3WRSrA5IACVjFAaSN5bYvPjd5gBH7L36g6or0mdq+
         EREFp2P61hPqqQB2zBNVJUG3glZaXLDTN6rJ91TFQjOUWQRlKVECKrQ96Vhp/FsOeb/D
         o4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309294; x=1685901294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnrC5KbWM7NW+1rdcdep21pD1YRsAygMgxxRqzKCAY8=;
        b=Ig5wYVZuaD89U+aJOpTfuUurMsFKQSbG2J0Q5DYufR5i+uMFkcQRGD85u1U0x2CKTW
         SQII8x6+ScsxvegHbyH8OSufmTM6JvrQgPj3U2jJKomO/8ShZk8AoGALylT+oH78mKzD
         TbevgKxWlIu78WUWk8TIChsobZ1ZRDOfCqWEHMsTSFeLcjjwQQfmomXruWYNql94BMmh
         vVTfCFW9y/YJfuVbA2eMp/Wpxoc4yiQbcWEPZnTpJKQKEV7svgF+wFlZJ5FI9nQO1P8i
         /udX+6N9O5JOJKawIA6rfWCdCpIWVYr6HE7RFa8UxW9WqO9yg+/cA7eAruWFxDptuS8g
         Z6QQ==
X-Gm-Message-State: AC+VfDwbKw3CPZGWwDGu+JMyiHqTd1DPioDStS8he2iKp1rmPk5sIIKb
        XFnUU6p2Z6ZC9NJSUFL5YR2zKw==
X-Google-Smtp-Source: ACHHUZ6qwa4b7FK5QlqahPRiXKFKWV6KzKwBRMW7+KVwzSD6Xh0orsW703ArW5+qjxpHuSOr26vkyA==
X-Received: by 2002:a17:906:fe4e:b0:94a:44ef:853d with SMTP id wz14-20020a170906fe4e00b0094a44ef853dmr1810355ejb.68.1683309294295;
        Fri, 05 May 2023 10:54:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id ia24-20020a170907a07800b00959b3c30f2csm1195972ejc.222.2023.05.05.10.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 10:54:53 -0700 (PDT)
Message-ID: <e60af365-4260-a56f-1ec1-c7c60d172b38@linaro.org>
Date:   Fri, 5 May 2023 19:54:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/5] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250
 support
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230505064039.1630025-1-bhupesh.sharma@linaro.org>
 <20230505064039.1630025-3-bhupesh.sharma@linaro.org>
 <1374d7ea-94a3-60b0-f9db-7528aae22a34@linaro.org>
 <CAH=2NtzuYqOV8pHcOJE-V=gCAF3pKZKSWsNbrXD48iXWstmruA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAH=2NtzuYqOV8pHcOJE-V=gCAF3pKZKSWsNbrXD48iXWstmruA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/05/2023 18:27, Bhupesh Sharma wrote:
> Hi Krzysztof,
> 
> On Fri, 5 May 2023 at 21:54, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 05/05/2023 08:40, Bhupesh Sharma wrote:
>>> Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.
>>>
>>> On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
>>> needs to be set first to 'enable' the eud module.
>>>
>>> So, update the dt-bindings to accommodate the third register
>>> property (TCSR Base) required by the driver on these SoCs.
>>>
>>> Also for these SoCs, introduce a new bool property
>>> 'qcom,secure-mode-enable', which indicates that the mode manager
>>> needs to be accessed only via the secure world.
>>
>> Cannot it be implied by compatible?
> 
> I can see this will be used by future SoCs as well from the available
> EUD documentation.
> 
> So let's keep a dedicated dt property as suggested by Bjorn in earlier
> reviews, as otherwise the compatible checks would start getting bigger
> / messier in the driver code, in my opinion, when we add EUD support
> for other SoCs + boards.

I don't understand the last part about compatible checks would grow. Why
would you have any compatible check in the driver? This looks standard
as we do with all SoC properties, so via driver data.

Best regards,
Krzysztof

