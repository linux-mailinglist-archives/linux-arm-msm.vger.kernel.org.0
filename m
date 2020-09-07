Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C22F260212
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 19:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729757AbgIGODX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 10:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729750AbgIGOCh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 10:02:37 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529FCC061573
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 06:52:02 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id g72so12646367qke.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PTkTouL2czWP8WE5qgUgm7cqaQuyE0I/QNRM6mgOP0c=;
        b=RkYJt/sowuPk660AeGi8k0TKGfw7R8fezICrpHulamrnjeDus1mMTpxsIWFd8D4dC7
         7lpGSv7sikZ6Q9BvxsmwJzFL0vuxJhFNqNLJVncpFdsrRYrYwD1hSxKVQYA8DfJOvbSa
         RwJkUSNO7j4lUTwm76z0W/0OWjMpHbgy/rExIclghVSTBLYxw4R1J27T6uvav7WQXBPT
         L1G0L0X95cOws5jWWbfsTaaI6m1M6QmGci7OQXviSo4Bj+8P1W35vQs2GohffQ3k9k3F
         slWb2a47njZDem0eevasth1IaIjJcaHo/5XCxgS68BuXLU3OyxQKzrTTStG59SpxKbNU
         L3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PTkTouL2czWP8WE5qgUgm7cqaQuyE0I/QNRM6mgOP0c=;
        b=PZ7C96hirb/9zuQgpG8n4OPGD6E+Wu95px0YgbIXDqSKE4sTRFsQVSv5AmHS5UcK34
         9w132qRMnTgOruO/w0Vm1NibUMjdbG3Y5UFjRvXJWkYjmGLJIoYkb3jj/TWhMzq0NBSr
         mi2RY6kNYrXbxrV9dQTls5pzQv/gHFHAFpu4yqQp0SK0C/mNHnxvvYHM3EPV0lXA8zeS
         13MjyaQGq1EIgrNTvibnxbjUv6NSdS60eXpUW9BErkr0W1Tz9CQw1xQa9cumccJu1VmS
         YQkmzoGFY9GO+bf14zzxCNYy/qGfTiJ4HZVQXAZpozdCKK8OiwKk+TRIeBWaqcSDxSOM
         H/PQ==
X-Gm-Message-State: AOAM533SAaEfjXotJVskMuW0EovzDSUDhi93Vtb4QFr3M240LAtknMYK
        SyDrPXYvv3Q6918S20saEbERwA==
X-Google-Smtp-Source: ABdhPJwb/Iojc+yPbKGCE2w/zaWNEX18Z9XHEn4djmHHQz8vqGV9Ili06wfYjq3cq27keqH4oiq1LQ==
X-Received: by 2002:a05:620a:141a:: with SMTP id d26mr18900840qkj.217.1599486721448;
        Mon, 07 Sep 2020 06:52:01 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id u66sm10541652qka.136.2020.09.07.06.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 06:52:01 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: add ioctl for attaching to sensors pd
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200901003300.11985-1-jonathan@marek.ca>
 <20200907123344.GA2371705@kroah.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <a9d142c9-8a61-ee59-d849-393af1b3eaec@marek.ca>
Date:   Mon, 7 Sep 2020 09:51:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200907123344.GA2371705@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/7/20 8:33 AM, Greg Kroah-Hartman wrote:
> On Mon, Aug 31, 2020 at 08:32:59PM -0400, Jonathan Marek wrote:
>> Initializing sensors requires attaching to pd 2. Add an ioctl for that.
>>
>> This corresponds to FASTRPC_INIT_ATTACH_SENSORS in the downstream driver.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/misc/fastrpc.c      | 9 ++++++---
>>   include/uapi/misc/fastrpc.h | 5 +++--
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 7939c55daceb..ea5e9ca0d705 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1276,7 +1276,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>>   	return 0;
>>   }
>>   
>> -static int fastrpc_init_attach(struct fastrpc_user *fl)
>> +static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>>   {
>>   	struct fastrpc_invoke_args args[1];
>>   	int tgid = fl->tgid;
>> @@ -1287,7 +1287,7 @@ static int fastrpc_init_attach(struct fastrpc_user *fl)
>>   	args[0].fd = -1;
>>   	args[0].reserved = 0;
>>   	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>> -	fl->pd = 0;
>> +	fl->pd = pd;
>>   
>>   	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>>   				       sc, &args[0]);
>> @@ -1477,7 +1477,10 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>>   		err = fastrpc_invoke(fl, argp);
>>   		break;
>>   	case FASTRPC_IOCTL_INIT_ATTACH:
>> -		err = fastrpc_init_attach(fl);
>> +		err = fastrpc_init_attach(fl, 0);
>> +		break;
>> +	case FASTRPC_IOCTL_INIT_ATTACH_SNS:
>> +		err = fastrpc_init_attach(fl, 2);
> 
> Shouldn't you have #defines for those magic numbers somewhere?  What
> does 0 and 2 mean?
> 

This is based off a downstream driver which also uses magic numbers, 
although I can make an educated guess about the meaning.

Srini do you have any suggestions for how to name these values?

> thanks,
> 
> greg k-h
> 
