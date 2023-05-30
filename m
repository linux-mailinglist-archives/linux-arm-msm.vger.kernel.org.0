Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A2F715F56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 14:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjE3M34 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 08:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjE3M3y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 08:29:54 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C254A1AE
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:29:39 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-33aa60f4094so10559655ab.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449778; x=1688041778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=db7pOK2qWllgoSD+hdy9un8RIi8jDZibrX+vbM0TbcI=;
        b=E3f6YBkCcce5sNygYmsqPom7hQcebcWA4FKh0jB+WuU4bCUNTTiVDOQ4oYLgDlkbaa
         +RIM1noTWHCjhF2Ve3BVHBooqefxmRSfa04XfNOEIjU3UVbYw6PptOdhcb86Pft+JLK3
         zrKLc5jfK02NFqj8hKTzoDVR42EKfq9IpM1KCGtmLoFN0dwef3sDgsRdxDF6HWltZGWe
         OPUuAcdUCowRP1t2kwVk1JqpElJ0HUP7QDw1pp3ZXNAmPvcOsdM3Bj5JG6BfUKZA5GEC
         TjNm4TPYZRmP+WRzwsS0MRUcGlExjiaeAuIEI1y7C5GuR1ISYq9tEEE2/qvQJgjIBycC
         C9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449778; x=1688041778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=db7pOK2qWllgoSD+hdy9un8RIi8jDZibrX+vbM0TbcI=;
        b=bpbMDuprLx5QpUBQUwtvC4b087wFJmNrsXkav63R/AU4T2ups/jfBNsRW2qXWJ5E3r
         Unp+9S+N5mkQ3Sqc7IMt6O/QeJtbdJNI2hkryEr3T6JtEQubQdVk2hZhcsho5fiuYEwu
         qcgGWOqoSIAV7Mf7ul5O/JO3loTV8XVzuT1r6AgQb7xmz/1JZUv+wuAKAc0JJptKAdCY
         ZcRFsfTHNStpXxXCwr9V7wNfbfeVc2yfvKO9Z8Kgyjpy/iyhk+g6GGmquQmTZDQGkqVO
         8306BF88aPddzvFwnburNBAFY+MNIi8iIBMhSmukmnnfxO3rIXo9N6zj4xamrSJTApIV
         mnzg==
X-Gm-Message-State: AC+VfDxLzHOK6WZBijBepYOuA6x8xS2DefkdZFKXwdUMZ4wwKQJWRJlk
        QvXMBKeRCgan4z7g4q9B9SDisA==
X-Google-Smtp-Source: ACHHUZ6TM/HJSRb/wKW1p0GHS4HzM3dN4kBjO5DaLuSqMt0fzSDZPsxL+zNlyWRu2e+sQg2eZZRvHQ==
X-Received: by 2002:a92:d688:0:b0:331:107d:e96e with SMTP id p8-20020a92d688000000b00331107de96emr1311753iln.16.1685449777883;
        Tue, 30 May 2023 05:29:37 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id g186-20020a025bc3000000b0041643b78cbesm707344jab.120.2023.05.30.05.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 05:29:37 -0700 (PDT)
Message-ID: <3c4d235d-8e49-61a2-a445-5d363962d3e7@linaro.org>
Date:   Tue, 30 May 2023 07:29:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net] net: ipa: Use the correct value for IPA_STATUS_SIZE
Content-Language: en-US
To:     Bert Karwatzki <spasswolf@web.de>,
        Simon Horman <simon.horman@corigine.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <7ae8af63b1254ab51d45c870e7942f0e3dc15b1e.camel@web.de>
 <ZHWhEiWtEC9VKOS1@corigine.com>
 <2b91165f667d3896a0aded39830905f62f725815.camel@web.de>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <2b91165f667d3896a0aded39830905f62f725815.camel@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/30/23 4:10 AM, Bert Karwatzki wrote:
> Am Dienstag, dem 30.05.2023 um 09:09 +0200 schrieb Simon Horman:
>> On Sat, May 27, 2023 at 10:46:25PM +0200, Bert Karwatzki wrote:
>>> commit b8dc7d0eea5a7709bb534f1b3ca70d2d7de0b42c introduced
>>> IPA_STATUS_SIZE as a replacement for the size of the removed struct
>>> ipa_status. sizeof(struct ipa_status) was sizeof(__le32[8]), use this
>>> as IPA_STATUS_SIZE.

This is better, however it really isn't done in a way that's
appropriate for a Linux kernel patch.  I will gladly help you
get it right if you have the patience for that.  But I'm not
going to say anything yet--until you say you want me to help
you do this.  If you prefer, I can submit the patch for you.

The reason this is important is your commit is permanent, and
just like code, commit messages are best if kept consistent
and readable.  I also am offering to help you understand so
you avoid any trouble next time you want to send a kernel patch.

Let me know what you prefer.

					-Alex

>>>
>>>>  From 0623148733819bb5d3648b1ed404d57c8b6b31d8 Mon Sep 17 00:00:00 2001
>>> From: Bert Karwatzki <spasswolf@web.de>
>>> Date: Sat, 27 May 2023 22:16:52 +0200
>>> Subject: [PATCH] Use the correct value for IPA_STATUS_SIZE.
>>> IPA_STATUS_SIZE
>>>   was introduced in commit b8dc7d0eea5a7709bb534f1b3ca70d2d7de0b42c as a
>>>   replacment for the size of the removed struct ipa_status which had
>>> size =
>>>   sizeof(__le32[8]).
>>>
>>> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
>>
>> Hi Bert,
>>
>> As well as the feedback provided by Jakub elsewhere in this
>> thread I think it would be useful to CC the author of the above mentioned
>> commit, Alex Elder <elder@linaro.org>. I have CCed him on this email.
>> Please consider doing likewise when you post v2.
>>
>> FWIIW, I did take a look.
>> And I do agree with your maths: struct ipa_status was 32 (= 8 x 4) bytes long.
>>
>>> ---
>>>   drivers/net/ipa/ipa_endpoint.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ipa/ipa_endpoint.c
>>> b/drivers/net/ipa/ipa_endpoint.c
>>> index 2ee80ed140b7..afa1d56d9095 100644
>>> --- a/drivers/net/ipa/ipa_endpoint.c
>>> +++ b/drivers/net/ipa/ipa_endpoint.c
>>> @@ -119,7 +119,7 @@ enum ipa_status_field_id {
>>>   };
>>>   
>>>   /* Size in bytes of an IPA packet status structure */
>>> -#define IPA_STATUS_SIZE                        sizeof(__le32[4])
>>> +#define IPA_STATUS_SIZE                        sizeof(__le32[8])
>>>   
>>>   /* IPA status structure decoder; looks up field values for a structure
>>> */
>>>   static u32 ipa_status_extract(struct ipa *ipa, const void *data,
>>> -- 
>>> 2.40.1
>>>
>>> Bert Karwatzki
> 
> Here is v2 of the patch, the first one was garbled by the linebreak setting of
> evolution.
> 
> From: Bert Karwatzki <spasswolf@web.de>
> Date: Tue, 30 May 2023 10:55:55 +0200
> Subject: [PATCH] IPA_STATUS_SIZE was introduced in commit b8dc7d0eea5a as a
>   replacement for the size of the removed struct ipa_status of size
>   sizeof(__le32[8]). Use this value as IPA_STATUS_SIZE.
> 
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
>   drivers/net/ipa/ipa_endpoint.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
> index 2ee80ed140b7..afa1d56d9095 100644
> --- a/drivers/net/ipa/ipa_endpoint.c
> +++ b/drivers/net/ipa/ipa_endpoint.c
> @@ -119,7 +119,7 @@ enum ipa_status_field_id {
>   };
>   
>   /* Size in bytes of an IPA packet status structure */
> -#define IPA_STATUS_SIZE			sizeof(__le32[4])
> +#define IPA_STATUS_SIZE			sizeof(__le32[8])
>   
>   /* IPA status structure decoder; looks up field values for a structure */
>   static u32 ipa_status_extract(struct ipa *ipa, const void *data,

