Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D09349E39E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 14:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241918AbiA0NgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 08:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242191AbiA0Nd6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 08:33:58 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5102C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 05:33:18 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ah7so5914667ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 05:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=G5ZQCLb9Euvd65w6sev74g5WHwa6rikpL+5X/0OQZ80=;
        b=NU5qJuAiYRasmkz1+At24KeJaHNj7163GMNhFpvAzg7hhOAj3MN1w9zpb7PHavzFnR
         yvQIHV+tLh+nwBehYDWhJNlji4YYcvp1qwVClgWMg+RDpjhx28W1gbDGb2WhwptgSFZz
         6fE40Wmxeir1SV/kkgTa/a+0Z2pPfE3/4dibjRO4TK2GNPF60vhbcbgYO7PmqFWNFf2r
         SlE1XgjjJAaj62N9Kh/a4Z5LeZii23aXJx2bukNWSMt1wdJMTJDnVpgYE2H/1IaMQ+Xc
         LsvLpLpCAp2i3qaCdgOsKA7W1Um7R1/Mz459dvW6+mrVNUTrBT2a7uOkzNyemknsfHUv
         ZMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G5ZQCLb9Euvd65w6sev74g5WHwa6rikpL+5X/0OQZ80=;
        b=H59RCXbnTMkdecrEdcMIILH90F2Kx7mFCadB4Qs+DAkv1wGewObSX6YXrthq5oPfvQ
         2rculqe09H3lzRrcw1N5d0IxwyJMb+VVO/APnWFBSyXoQej/aimp8L+BC4IxVKfpZxqn
         S2U85CgOJD+NujnNKZIRmlXZ2ecNsJWzT8YKX1MpQIAJYg4gvESGJnnqYGzXcl8P41o7
         7hZasJnTYRv04fMiNaxJZ4tLYDPchYGyqf2rBvRfJhXYxBXovxf/A+0xVxGi4GeqcS3z
         nWB3sCFwTgzL1Ft76D6CUnSc/elP5fr2lIvLBPVBsCRpTKe1Bn8UH7TzsdQydk0Dxxeu
         cinw==
X-Gm-Message-State: AOAM532nrn1h80MSN26tOgpcLltDEiSJqhXcaa7ZZgIze6CHkKA3Wvc0
        MTb6dyTZCVYDmILTZfy+g7TYNw==
X-Google-Smtp-Source: ABdhPJzraM5YaPTnqIduC+URaA84yy2WqMs5TkgpGTZPvxBS5OEpg2RZibwAtV5C1QXjjzo1Ngbqkg==
X-Received: by 2002:a17:907:a426:: with SMTP id sg38mr2980214ejc.229.1643290397329;
        Thu, 27 Jan 2022 05:33:17 -0800 (PST)
Received: from ?IPV6:2003:f6:af0b:1300:a70c:d30:e044:53b? (p200300f6af0b1300a70c0d30e044053b.dip0.t-ipconnect.de. [2003:f6:af0b:1300:a70c:d30:e044:53b])
        by smtp.gmail.com with ESMTPSA id f19sm8695159ejb.0.2022.01.27.05.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 05:33:17 -0800 (PST)
Message-ID: <7f886b66-0d6e-d73d-75ba-8f43e87058b4@grsecurity.net>
Date:   Thu, 27 Jan 2022 14:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] misc: fastrpc: avoid double fput() on failed usercopy
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220127130218.809261-1-minipli@grsecurity.net>
 <YfKdDUxj2wpglXQI@kroah.com>
From:   Mathias Krause <minipli@grsecurity.net>
In-Reply-To: <YfKdDUxj2wpglXQI@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am 27.01.22 um 14:24 schrieb Greg Kroah-Hartman:
> On Thu, Jan 27, 2022 at 02:02:18PM +0100, Mathias Krause wrote:
>> If the copy back to userland fails for the FASTRPC_IOCTL_ALLOC_DMA_BUFF
>> ioctl(), we shouldn't assume that 'buf->dmabuf' is still valid. In fact,
>> dma_buf_fd() called fd_install() before, i.e. "consumed" one reference,
>> leaving us with none.
>>
>> Calling dma_buf_put() will therefore put a reference we no longer own,
>> leading to a valid file descritor table entry for an already released
>> 'file' object which is a straight use-after-free.
>>
>> Simply avoid calling dma_buf_put() and rely on the process exit code to
>> do the necessary cleanup, if needed, i.e. if the file descriptor is
>> still valid.
>>
>> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
>> Signed-off-by: Mathias Krause <minipli@grsecurity.net>
>> ---
>>  drivers/misc/fastrpc.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4ccbf43e6bfa..aa1682b94a23 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1288,7 +1288,14 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>>  	}
>>  
>>  	if (copy_to_user(argp, &bp, sizeof(bp))) {
>> -		dma_buf_put(buf->dmabuf);
>> +		/*
>> +		 * The usercopy failed, but we can't do much about it, as
>> +		 * dma_buf_fd() already called fd_install() and made the
>> +		 * file descriptor accessible for the current process. It
>> +		 * might already be closed and dmabuf no longer valid when
>> +		 * we reach this point. Therefore "leak" the fd and rely on
>> +		 * the process exit path to do any required cleanup.
>> +		 */
>>  		return -EFAULT;
>>  	}
>>  
> 
> This feels wrong.  How do all other dma buf users handle this?

Other dma_buf_fd() users don't wrap the returned fd in another structure
and simply return the fd, i.e. have no error path on the way out of the
kernel.

Thanks,
Mathias

> And you forgot to cc: the dmabuf developers, I think get_maintainers.pl
> should have caught them on this patch.
> 
> thanks,
> 
> greg k-h
