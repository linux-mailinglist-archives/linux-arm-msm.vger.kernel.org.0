Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229BF78C408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 14:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjH2MQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 08:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbjH2MPc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 08:15:32 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16053CE2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 05:15:03 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so5635411a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693311300; x=1693916100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuSqHXD31D4rgwV6avUd8bNaF7QG/6g57P8yYOHyObM=;
        b=yzCG2sGObYfnmIReGnbAydo4kKKSBPJb3gGuQ7DgchEAHmfvZ1UCs5Ip/8wJiAcwkv
         J7SZQWUjWzs09d8LsiGSeIhfiSGulbXF2+AsyR4LjGRwhZ0SlROX2UEzatjvxAR0gwcq
         gyTtvJEURpPTIcBC8cx4YejzqqbAaHmun54IFNwVoKQV3lULtlPl0NyUId4rzHYWYros
         5IFfjbgk5keSooHi6zhemQ+A0atZnBE7ZB4SD45wGSVxproEX68+HWEP734eUFFzweie
         JGyaEpEZwAlDBBuKv1tldgh9dpBy4FiywuxeGHmfo/3SCy+QnoOmwyviezIX1lCocuTd
         cDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693311300; x=1693916100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuSqHXD31D4rgwV6avUd8bNaF7QG/6g57P8yYOHyObM=;
        b=juJzCm06oDxGi4aBreoLyslue/DAawe9/iaxFTlPT5oVy++6DqNWbSQ9f7grKXJQwz
         JYiZllcU3cpdkbk3ZdIIlMZJBlowwqcxNtbaz6EhscnYblCeZ5U8QLSq1ooT4Cm+Z5Lr
         AZNi6PNrLCQQZhLJso+jyjf7aBUznwO/N/689A20hU0CJQn+ESYt7Xf/V2L9kOCte6yl
         iGFfC5mF6FDb4QicDLcmpxn7iRVdsV+5Z7KIV7+3cnYYnVBb1kZuOyyMwEE8qIGUiLuy
         jcAY9OBIWuq0f8EXjVjfeyG+jqhPFePPKKJ0JL3kL54MMm0AXXlEd2YE6k9N1di5EDMK
         2vcw==
X-Gm-Message-State: AOJu0YzAq60VVzj5K8TBLCwekz86DJSQmLVns/iMeYy++irksdTm2twp
        IBcNpSfVDkfMGMlXJGaky0EtfFB2kGBL+rJYKRU=
X-Google-Smtp-Source: AGHT+IFHGUVchPQl+mF3sfUS3twhA0v9fn2dsAElqV/Z6NlDSTjZS3t04ZJcxcPizZMoJHsXHGLXzg==
X-Received: by 2002:a17:906:224c:b0:9a1:bd33:4389 with SMTP id 12-20020a170906224c00b009a1bd334389mr13676379ejr.74.1693311299737;
        Tue, 29 Aug 2023 05:14:59 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id u22-20020a17090626d600b009a1fd22257fsm5891367ejc.207.2023.08.29.05.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 05:14:59 -0700 (PDT)
Message-ID: <ecc6076b-2278-70e6-3863-3dcf89adfd0f@linaro.org>
Date:   Tue, 29 Aug 2023 14:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v10 0/4] PCI: qcom: ep: Add basic interconnect support
Content-Language: en-US
To:     Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     helgaas@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_nitegupt@quicinc.com,
        quic_skananth@quicinc.com, quic_ramkri@quicinc.com
References: <1689751218-24492-1-git-send-email-quic_krichai@quicinc.com>
 <20230728025648.GC4433@thinkpad>
 <b7f5d32f-6f1a-d584-4cdd-4c5faf08a72e@quicinc.com>
 <73700e92-2308-3fe0-51b1-c2373be2893e@linaro.org>
 <bed64143-8803-5027-d9ec-eafaaeb64e35@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bed64143-8803-5027-d9ec-eafaaeb64e35@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/08/2023 14:13, Krishna Chaitanya Chundru wrote:
> 
> On 8/29/2023 5:26 PM, Krzysztof Kozlowski wrote:
>> On 29/08/2023 13:41, Krishna Chaitanya Chundru wrote:
>>> On 7/28/2023 8:26 AM, Manivannan Sadhasivam wrote:
>>>> On Wed, Jul 19, 2023 at 12:50:14PM +0530, Krishna chaitanya chundru wrote:
>>>>> Add basic support for managing "pcie-mem" interconnect path by setting
>>>>> a low constraint before enabling clocks and updating it after the link
>>>>> is up based on link speed and width the device got enumerated.
>>>>>
>>>> Krzysztof, can this series be merged for 6.6? Bjorn A will pick the dts patches.
>>>>
>>>> - Mani
>>> A Gentle ping
>>>
>> Whom do you ping and why me? If you choose not to use
>> scripts/get_maintainers.pl, it's your right, but then you might get
>> maintainers wrong and no surprise patches got not accepted...
>>
>> Plus, it's merge window, so why pinging now?
>>
>> Best regards,
>> Krzysztof
> 
> Krzyszto,
> 
> The series is already reviewed and there are some patches which is 
> reviewed by you also.
> 
> I am using the same command to send patches it looks like this script is 
> fetching based upon the source file where there was change due to that 
> only I was seeing the problem of all patches are not going to all the 
> maintainers.
> 
> I was trying to install b4 and make sure to send all patches to all the 
> maintainers next time on wards.
> 
> we pinged it now so that as this is already reviewed and no comments on 
> this series so that this can picked up.

It is the fifth same email from you. With just few differences. Please
stop. Please fix your email client.

Best regards,
Krzysztof

