Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442E265C807
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 21:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjACUZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 15:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbjACUZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 15:25:29 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AE013CF8
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 12:25:27 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id v14so22702409qtq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 12:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iARVLMD3v8IODdCw3GdczKsFsUhthsaW0rxu4UEbvTk=;
        b=XaaaoCFcnicDj2syudEzP6QsRP6hWeKn0p+ctG9G7m+fmb3ZiSvqVPiEG5VMa0at6b
         h4OWCrAFPNBpncx/vd7h6y4kS493H45Txq908qdKEobXGxL7fJPE9JPvX2ZRo2gKsGV7
         mgcfBQlIr1PRQqD2UsjUJhoAzQye7bpvamzq36EnCCIM0oxzPsi3I62SKWU20dVt407I
         u7s7CywiZXWb00xRb7iVdQ3T2SQRlJtr+4999L+P5mE8To03yEFqMuXb5MbXqOaOFLEa
         ihZ+exCUEONWeoUrj5Ioe0xK23UuJlWAkn0pkpRv3Sd5v49tqbuOV5tsVlc+MjnmJZY7
         xQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iARVLMD3v8IODdCw3GdczKsFsUhthsaW0rxu4UEbvTk=;
        b=z6uUchoUjBNu5zslmcWX1HDJZQi2p5KJe0URodPKH8zApPw+qtLtGAwpMl3HRGx/O7
         DgUCG6zsC12l6lHiTm+yZJMR25nKvZvI5IYF+GTTDG9Egp8YqAlFFaCh2nsPm1hiVpAN
         gJqExipzNmqlzdVEvJOCzcw+k3MHcUDA/kqSD6qwEHySF+ek7N+HXrW24XsBetXsI9K6
         Tt9T2UZ0QTcghEDdJIjdJ8UE/BP8tLPD3SXF+vq6zMEQP7Qc45vS2hv8fc1WfKesyx0G
         AyojBOLtMWAaq+MiaDgLjLu8RTWhpZ+un7vvXBoqdxIOtnUk7beqPsqqkOogdnAD0Nt0
         ha9g==
X-Gm-Message-State: AFqh2kovJboInn7ANrTGdOmtKDIu8gOtxG7RzbP4geOQVoVUmIPTWglS
        bBwJCtw8iQ+6kiNESq7qv9e+sg==
X-Google-Smtp-Source: AMrXdXvBvT7RbkeGYJ+AxMrhF0TW14Ntz4Ek3DmsmesFrA4OPGdMpshhSzSKebvi316jMXL+rfkfzQ==
X-Received: by 2002:ac8:7386:0:b0:3a8:fd7:7347 with SMTP id t6-20020ac87386000000b003a80fd77347mr65246203qtp.32.1672777526289;
        Tue, 03 Jan 2023 12:25:26 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id i1-20020ac84881000000b003a7ec97c882sm19318413qtq.6.2023.01.03.12.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 12:25:25 -0800 (PST)
Message-ID: <444adc6b-809f-be35-2114-f05b54db48bf@linaro.org>
Date:   Tue, 3 Jan 2023 14:25:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next 3/6] net: ipa: enable IPA interrupt handlers
 separate from registration
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221230232230.2348757-1-elder@linaro.org>
 <20221230232230.2348757-4-elder@linaro.org>
 <de723e81-f3ba-19f3-827f-28134e904c97@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <de723e81-f3ba-19f3-827f-28134e904c97@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/31/22 11:56 AM, Caleb Connolly wrote:
>>
>> diff --git a/drivers/net/ipa/ipa_interrupt.h 
>> b/drivers/net/ipa/ipa_interrupt.h
>> index f31fd9965fdc6..5f7d2e90ea337 100644
>> --- a/drivers/net/ipa/ipa_interrupt.h
>> +++ b/drivers/net/ipa/ipa_interrupt.h
>> @@ -85,6 +85,20 @@ void ipa_interrupt_suspend_clear_all(struct 
>> ipa_interrupt *interrupt);
>>    */
>>   void ipa_interrupt_simulate_suspend(struct ipa_interrupt *interrupt);
>> +/**
>> + * ipa_interrupt_enable() - Enable an IPA interrupt type
>> + * @ipa:    IPA pointer
>> + * @ipa_irq:    IPA interrupt ID
>> + */
>> +void ipa_interrupt_enable(struct ipa *ipa, enum ipa_irq_id ipa_irq);
> 
> I think you forgot a forward declaration for enum ipa_irq_id
> 
> Kind Regards,
> Caleb

OK I checked this.

You are correct that ipa_irq_id should be declared as an
enum at the top of "ipa_interrupt.h".  In addition to the
new function declarations, there were some existing
references to the enumerated type.  I believe this became
a (not-reported) problem starting with this commit:

   322053105f095 net: ipa: move definition of enum ipa_irq_id

It being missing did not result in any build warnings,
however.  Here's why.

The ipa_irq_id enumerated type is defined in "ipa_reg.h".

Note that "ipa_reg.h" is included by "ipa_endpoint.h".  So if
"ipa_endpoint.h" is included before "ipa_interrupt.h", the
ipa_irq_id type will have been defined before it's referenced
in "ipa_interrupt.h".

These files include "ipa_interrupt.h":

ipa.h:
It is included after "ipa_endpoint.h", so the enumerated type
is defined before it's needed in "ipa_interrupt.h".

ipa_main.c:
Here too, "ipa_endpoint.h" (as well as "ipa_reg.h") is included
before "ipa_interrupt.h", so the enumerated type is defined
before it's used there.

ipa_interrupt.c
In this case "ipa_reg.h" is included, then "ipa_endpoint.h",
before "ipa_interrupt.h".  So again, the enumerated type is
defined before it's referenced in "ipa_interrupt.h".

Nevertheless, your point is a good one and I'm going to
implement your suggestion when I post version 2.

Thank you!

					-Alex
