Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E44A1AAE43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 18:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416000AbgDOQ2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 12:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1415990AbgDOQ23 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 12:28:29 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD52C061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 09:28:28 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k11so614665wrp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 09:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=76FV3ox/3TPbATAAAJw9w7kb0H0TlBYb5fVvS13JcLY=;
        b=G/nt7PIUIjDbbyNK0gIoeOLcY8ZJ6ogrh7xIpJK5ptEMrpyqCvnEq1Gpc5ntN7Nohb
         FbLVbkv/SqyxTIKPSI8ArbB3aQC2cnsW7CNY285Nq6a2PjxHNIr/8pFYAG+7EVv0mbSo
         E9pam/kjTQC+Xto1u4FPAB7uQLe+D9C1L1s3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=76FV3ox/3TPbATAAAJw9w7kb0H0TlBYb5fVvS13JcLY=;
        b=Hhk3y4aU+FmihTj3BeI07nTXAUjXNHnqFR6bEhcw2Gwj87HKOCYk9XB0SXxTTKaqkB
         mB3gVkdxIuxUJhKKhUErY6cdTL39Qr8ebIR10h6NwXKKNYOe6W+B3UBMbrRCZ+GaMLP4
         dQYXnfjWUEUUiVYNHJcbJxXUqCWSZSGGwpfA7oEsAYGV5C0SQu27i6KIn70rmEXvZUqC
         XfKjJpPOtJtJ/k8dodJwAmWmbYuAicN/oHjERnRmijJijtB8WL2Y+4d2d/CZuujq7Ewi
         pPE3gAs9MLtb4ZpCZaKsQTP+hXUbGK1SLpeN1Bm3PH/ZAPJf3oOfFoVZiHQouX4u/dcm
         HKzA==
X-Gm-Message-State: AGi0PuZIBeodOD0+HmHny4yIEdAMmBCHQ6T7pwSwUJgp3bQsNuYCi6jW
        RDpwwQN6VPDicS98nWrUTcKBkQ==
X-Google-Smtp-Source: APiQypKNypW8de1wzfd0hzKcNgFo6MjAP9f8TaX90Pu8qjLQ0NPRPLlzR/MtI88oH6r++vBFgaj4EQ==
X-Received: by 2002:a5d:5742:: with SMTP id q2mr29365255wrw.414.1586968107226;
        Wed, 15 Apr 2020 09:28:27 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id h2sm5682392wro.9.2020.04.15.09.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 09:28:26 -0700 (PDT)
Subject: Re: [PATCH] test_firmware: remove unnecessary test_fw_mutex in
 test_dev_config_show_xxx
To:     Kees Cook <keescook@chromium.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Andy Gross <agross@kernel.org>
References: <20200415002517.4328-1-scott.branden@broadcom.com>
 <202004142010.C0847F5@keescook>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <e2b95fde-0ab7-c0d1-2c64-cceffc458673@broadcom.com>
Date:   Wed, 15 Apr 2020 09:28:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <202004142010.C0847F5@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kees,

On 2020-04-14 8:10 p.m., Kees Cook wrote:
> On Tue, Apr 14, 2020 at 05:25:17PM -0700, Scott Branden wrote:
>> Remove unnecessary use of test_fw_mutex in test_dev_config_show_xxx
>> functions that show simple bool, int, and u8.
> I would expect at least a READ_ONCE(), yes?
I don't understand why you need a READ_ONCE when removing a mutex around 
an assignment
of a parameter passed into a function being assigned to a local variable.

Could you please explain your expectations.
>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>   lib/test_firmware.c | 26 +++-----------------------
>>   1 file changed, 3 insertions(+), 23 deletions(-)
>>
>> diff --git a/lib/test_firmware.c b/lib/test_firmware.c
>> index 0c7fbcf07ac5..9fee2b93a8d1 100644
>> --- a/lib/test_firmware.c
>> +++ b/lib/test_firmware.c
>> @@ -310,27 +310,13 @@ static int test_dev_config_update_bool(const char *buf, size_t size,
>>   	return ret;
>>   }
>>   
>> -static ssize_t
>> -test_dev_config_show_bool(char *buf,
>> -			  bool config)
>> +static ssize_t test_dev_config_show_bool(char *buf, bool val)
>>   {
>> -	bool val;
>> -
>> -	mutex_lock(&test_fw_mutex);
>> -	val = config;
>> -	mutex_unlock(&test_fw_mutex);
>> -
>>   	return snprintf(buf, PAGE_SIZE, "%d\n", val);
>>   }
>>   
>> -static ssize_t test_dev_config_show_int(char *buf, int cfg)
>> +static ssize_t test_dev_config_show_int(char *buf, int val)
>>   {
>> -	int val;
>> -
>> -	mutex_lock(&test_fw_mutex);
>> -	val = cfg;
>> -	mutex_unlock(&test_fw_mutex);
>> -
>>   	return snprintf(buf, PAGE_SIZE, "%d\n", val);
>>   }
>>   
>> @@ -354,14 +340,8 @@ static int test_dev_config_update_u8(const char *buf, size_t size, u8 *cfg)
>>   	return size;
>>   }
>>   
>> -static ssize_t test_dev_config_show_u8(char *buf, u8 cfg)
>> +static ssize_t test_dev_config_show_u8(char *buf, u8 val)
>>   {
>> -	u8 val;
>> -
>> -	mutex_lock(&test_fw_mutex);
>> -	val = cfg;
>> -	mutex_unlock(&test_fw_mutex);
>> -
>>   	return snprintf(buf, PAGE_SIZE, "%u\n", val);
>>   }
>>   
>> -- 
>> 2.17.1
>>

