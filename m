Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9544A716D13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 21:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjE3TEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 15:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbjE3TEh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 15:04:37 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F60106
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 12:04:35 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7770b7c2fa5so279209339f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 12:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685473475; x=1688065475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfQuZmnPQJmPq4FD0skpyrp1OyYgS6QeSjx3Y7QLJpo=;
        b=HmRpw8pGvyPSbo1Qzvek5/4weOk51Rnlxpp6EOvPssKH3D5hQ5EDzw0EoSd7xiUZus
         mms608q4JqR/J3lQg/7HKynivqzzxZS7UppVP37EvxglMzvkpSsKDvOV28aW6L42SERH
         SJ/y7tIVas1/E/bcbtlnn5M3X+cIKQiUNEYlvmyWmANy80Sa1xHxwRdCLY7FJvWUvbPQ
         Z15dxzNpvzEGaRcjiV+7ndsDr30d3hH3TkjzvG0MCU3Tf4JLuSpQoc45cw4HNc+d2AIl
         S61L/WYbLv72GF90UiZgLuA4usY//Xlm2bnxQbOV9jCeI8ZHIDqjgpJGcMTjbW96unsN
         vt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685473475; x=1688065475;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfQuZmnPQJmPq4FD0skpyrp1OyYgS6QeSjx3Y7QLJpo=;
        b=OdQlUdpAiV+eVrFPlfN9uJmA/Vz96TSNDjRpIGrzswUDUqkNcCXGFMBJx0p8hVgI5U
         lwOwoBd184w7CS87JnTbIkUdCEuYdezCh7xFBw9RIFAB5dhkABMWhinRKqNJr5le6vo/
         NR914oGzkf/oW54I+hbv95RwDftRGkh3RZ925YvFp+MQOp/bzapjg8aRfl+iBdPP01fR
         zhzLZoCAlOjwn0rR1dVpI9PylS9YjEQYTir7iGASHbjWn8setcTweJs0bAAZxpr0nuZI
         Nx9jUgSspXf3MeVBUgaIFfi/cidRDvacaFZE+V4R1BaGHlYs2llm/oDKZpJWO/6HBUbN
         pEzg==
X-Gm-Message-State: AC+VfDwAD1IX+7/fDd6nbiCxkj6XffgOYfn/VJFgda51qYvQHt8lBvw5
        8PTehRwrm5V9zdVLyF6YDvfFjw==
X-Google-Smtp-Source: ACHHUZ6eBRiUgFq4mXt5B6sXnYlZU3E7fxaNdGF17ikXkootwxAujomGFgxAC2KRPKLqROgo4vGERw==
X-Received: by 2002:a92:d581:0:b0:33b:151a:e29f with SMTP id a1-20020a92d581000000b0033b151ae29fmr363228iln.11.1685473474944;
        Tue, 30 May 2023 12:04:34 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id z96-20020a0293e9000000b004178754b24bsm920068jah.166.2023.05.30.12.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 12:04:34 -0700 (PDT)
Message-ID: <f9ccdc27-7b5f-5894-46ab-84c1e1650d9f@linaro.org>
Date:   Tue, 30 May 2023 14:04:32 -0500
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
 <3c4d235d-8e49-61a2-a445-5d363962d3e7@linaro.org>
 <8d0e0272c80a594e7425ffcdd7714df7117edde5.camel@web.de>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <8d0e0272c80a594e7425ffcdd7714df7117edde5.camel@web.de>
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

On 5/30/23 1:36 PM, Bert Karwatzki wrote:
> Am Dienstag, dem 30.05.2023 um 07:29 -0500 schrieb Alex Elder:
>> On 5/30/23 4:10 AM, Bert Karwatzki wrote:
>>> Am Dienstag, dem 30.05.2023 um 09:09 +0200 schrieb Simon Horman:
>>>> On Sat, May 27, 2023 at 10:46:25PM +0200, Bert Karwatzki wrote:
>>>>> commit b8dc7d0eea5a7709bb534f1b3ca70d2d7de0b42c introduced
>>>>> IPA_STATUS_SIZE as a replacement for the size of the removed struct
>>>>> ipa_status. sizeof(struct ipa_status) was sizeof(__le32[8]), use this
>>>>> as IPA_STATUS_SIZE.
>>
>> This is better, however it really isn't done in a way that's
>> appropriate for a Linux kernel patch.  I will gladly help you
>> get it right if you have the patience for that.  But I'm not
>> going to say anything yet--until you say you want me to help
>> you do this.  If you prefer, I can submit the patch for you.
>>
>> The reason this is important is your commit is permanent, and
>> just like code, commit messages are best if kept consistent
>> and readable.  I also am offering to help you understand so
>> you avoid any trouble next time you want to send a kernel patch.
>>
>> Let me know what you prefer.
>>
>>                                          -Alex
>>
>>>>
> 
> So here's v3 of the patch, done (I hope) in a way that is more standard
> conforming.
> 
>  From e0dc802b5f6f41c0a388c7281aabe077a4e3c5a2 Mon Sep 17 00:00:00 2001
> From: Bert Karwatzki <spasswolf@web.de>
> Date: Tue, 30 May 2023 20:23:29 +0200
> Subject: [PATCH] net/ipa: Use correct value for IPA_STATUS_SIZE
> 
> IPA_STATUS_SIZE was introduced in commit b8dc7d0eea5a as a replacement
> for the size of the removed struct ipa_status which had size
> sizeof(__le32[8]). Use this value as IPA_STATUS_SIZE.
> 
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>

This is better, but there are a few more things to do differently.
- When re-submitting a patch, please indicate a (new) version in
   the subject line.  Since you haven't been doing that, it should
   be sufficient to just use "version 2", something like this:
     [PATCH net v2] net: ipa: Use the correct value for IPA_STATUS_SIZE
- Add a "Fixes" tag above your "Signed-off-by:" line:
     Fixes: b8dc7d0eea5a ("net: ipa: stop using sizeof(status)")
- Do not send information above the patch in the e-mail.  An easy
   way to get it right is to use "git send-email".  For example:
     - git format-patch -1
     - Edit 0001-*.patch, adding lines like this below the "From:" line:
	To: davem@davemloft.net
	To: edumazet@google.com
	To: kuba@kernel.org
	To: pabeni@redhat.com
	Cc: elder@kernel.org
	Cc: netdev@vger.kernel.org
	Cc: linux-arm-msm@vger.kernel.org
	Cc: linux-kernel@vger.kernel.org
     - Run this:
         git send-email --dry-run 0001-*.patch
       to try to catch any errors
     - Finally, run this:
         git send-email 0001-*.patch
       to actually send the patch.  This will require a password.

Even if you don't use "git send-email", just let the e-mail
itself indicate the "From:" and "Subject:" lines.  And have
the content of the e-mail be the patch itself.

I hope this helps.

					-Alex

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

