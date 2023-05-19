Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C71F709539
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 12:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjESKk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 06:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjESKkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 06:40:25 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A6219B2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:40:03 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b51eso29750195e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684492800; x=1687084800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hElkZpZGFxCq2hRA3HiBp8TkWcTF4I4dj9+bw52Lj/8=;
        b=Z45E2XWnOWUEsXEdE8TOvsyDTHVft/cWpy48WHE/+3mX/c7wvnA71FMvwFI+nlKnou
         YDM12u+urpiG5bfv6c8ib5vy79jW3vqJpz/B0e6/PQRtWTrcXuDNiM/FDHWYnzBjXliB
         /ALU5Xz8IbnNGeV10NY+qKD7G+7mI0j0uRh14Ga8oW/cLgLXAYqPyKVHc0ZE/P3TIymt
         s6Z/RlIBsbjjAcGajhjDhHjYQ7vXhuEj736RyTudCTRq/y/+2kSuZupEGZGxWuAI/J9z
         fOejTxLU13sw3d9ZqTqk72NLVPRjf3ss7Dx695UgjvvXADhDRh+qeVbapljCIG7w6BFw
         2mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684492800; x=1687084800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hElkZpZGFxCq2hRA3HiBp8TkWcTF4I4dj9+bw52Lj/8=;
        b=A4iyv6LTYYo9JpgCc8G5ve4oTM0NFZUnEYpMPcanrcGmOflmPHB3RZRKEoHJpceBPt
         lTB49GPZNNB2CkTdAiwg8lWJZr2T/HHM+E9lBVVmbOOUFEgnWwebYtlf0CHlO23vFKDB
         jcWHt5807RT9KeTeNweIzPwQEY2u9cOx5XQsMxZirAXBjt2IbnCill+cLgTBXDdBNUlV
         f/2mp/QWal0OiiSjFtaHkeJaaTZAGttcXXy4L69k7v+ezparzV/oiZyDHBVi5RhwXb36
         LXIALgCR8iK/N20DIqDQ0mNeOfsKcOWEO5PBlo3nMvDqNSjqz+N32nC91ayyT0U24759
         kCkg==
X-Gm-Message-State: AC+VfDxRnjd/5mZ16jV/bo3tPCwCuGQzO9lSuAxGO5KGllVHEY+urBO0
        nI02iH1GUsfkD/YK9qlIhcTOZRQiMRNbt5pp0Ao=
X-Google-Smtp-Source: ACHHUZ4w1xxWTdD9aPa8s/wTf1iTxD/jsKsKiv3au9oS9eSFzuqxNS8NL35Ec2ej7sqUrxOEh9N/JA==
X-Received: by 2002:a7b:cb90:0:b0:3f3:1cb7:b2a6 with SMTP id m16-20020a7bcb90000000b003f31cb7b2a6mr1002586wmi.6.1684492800642;
        Fri, 19 May 2023 03:40:00 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id g21-20020a7bc4d5000000b003f42456c490sm1960510wmk.33.2023.05.19.03.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 03:39:59 -0700 (PDT)
Message-ID: <4aa42c38-e0e2-4d2d-bfe2-15bc151f7117@linaro.org>
Date:   Fri, 19 May 2023 11:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] misc: fastrpc: Fix double free of 'buf' in error path
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Sukrut Bellary <sukrut.bellary@linux.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230518100829.515143-1-sukrut.bellary@linux.com>
 <9194ebdf-f335-4cd6-bf89-bb4f86a57784@kili.mountain>
 <f47b17c1-1c02-2aa3-ba10-fcef70cb25a8@linaro.org>
 <b0115d7d-d15a-4948-8726-09a8b37f3f36@kili.mountain>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <b0115d7d-d15a-4948-8726-09a8b37f3f36@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19/05/2023 11:22, Dan Carpenter wrote:
>> ----------------------->cut<---------------------------
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index f60bbf99485c..3fdd326e1ae8 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1891,7 +1891,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl,
>> char __user *argp)
>>                                        &args[0]);
>>          if (err) {
>>                  dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
>> -               goto err_invoke;
>> +               fastrpc_buf_free(buf);
>> +               return err;
>>          }
>>
>>          /* update the buffer to be able to deallocate the memory on the DSP
>> */
>> @@ -1930,11 +1931,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl,
>> char __user *argp)
>>          return 0;
>>
>>   err_assign:
>> -       fastrpc_req_munmap_impl(fl, buf);
>> -err_invoke:
>> -       fastrpc_buf_free(buf);
>> -
>> -       return err;
>> +       return fastrpc_req_munmap_impl(fl, buf);
> 
> This will return success if copy_to_user() fails.
> 
that is true, using return value of fastrpc_req_munmap_impl does not 
really make sense here we should just return err in either case to the user.

--srini

> regards,
> dan carpenter
> 
