Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F88F4114FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 14:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238875AbhITMzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 08:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238858AbhITMzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 08:55:09 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9943FC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 05:53:42 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id j13so61050042edv.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 05:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EtHYpsyKq+obMQJvRNPJVQMXf1iuDZUh4kTqBS/uYM8=;
        b=nNONN3xb1H+5+JXdtkASL0DQ3moevZl1ILUbtQ81z5bCCIUzOVY1VDOtQdsjxPXU1R
         ng04/g42xmWszmb8jK0nJm+YZSMkQiLf0uF/aNBai0uwjR55S5Sm/SdHxFuGnmzafS/1
         fbF9aZhVgBcHUneh1LdNMMK+P0ykoeVEC7kj3IHEE/2JlxRdihRfBSGa7qTVjrP9ma4J
         Y05ke1tqbhE3wCIyqtAvLMBHdp1bJ1jfJVdxN6a7DwxgWth8jbiHExKq5bDTUeatQHHa
         6BK6l/6LXLR+XDmLD0hhQpSf9LtKNar7Fd2ul7SPE+GNjEU3dvTZBTSJntlSDr26Z1ug
         hUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EtHYpsyKq+obMQJvRNPJVQMXf1iuDZUh4kTqBS/uYM8=;
        b=rtJfwbNd33aS4oZcKmgGz+uqyrBqB3HiwxOMNvBxgj5DB9akaltFs2hEQYOPPEF0Y+
         omvpNIUt2H7lfm/DEQKl0QnGPxXrZDWpMYePNYhE2S40HKOo8i4t7TtiIBhPun29dQ6D
         RrmHH6MXryMWF3FAu9E4XWR/TA1ct/FYuiJW7Z91Vstd40NlwCaSgoL9zW1V7u1i9t2O
         aZ/H1B1Uj0QiKuMQyOtvwygR07tIjmErQnqPkhiNR4kLT11O2i1UQXA/xVDi2P2ho7sX
         xF8AC7I2Og6lGwgI+TbY7m+VoiwBrYnZjbaWgym/D36pHWjRdUWoz5ujbn5uz2VTzKSE
         bKHQ==
X-Gm-Message-State: AOAM530Joe+PrDSMizbIkEPrPVdz5xfAmoWqMfhIlYBMGhrZP+1QWglN
        16VVy64t4/UAY6DWi1ydNFUafA==
X-Google-Smtp-Source: ABdhPJwrX21ltRM664L1DNZZYOaApHbWpHu5Z7CzKNWhhq27r9m7D1bzPoJw1xgYV5gmNFAzAsA7gQ==
X-Received: by 2002:a17:906:dbf2:: with SMTP id yd18mr14559102ejb.536.1632142421107;
        Mon, 20 Sep 2021 05:53:41 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id bm1sm6171601ejb.38.2021.09.20.05.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 05:53:40 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: Update number of max fastrpc sessions
To:     Greg KH <gregkh@linuxfoundation.org>, Jeya R <jeyr@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        fastrpc.upstream@qti.qualcomm.com
References: <1632123274-32054-1-git-send-email-jeyr@codeaurora.org>
 <YUg9dmThHg9s8XAy@kroah.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <88370a7c-9e28-ae1b-2f48-bc38a8cff78f@linaro.org>
Date:   Mon, 20 Sep 2021 13:53:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUg9dmThHg9s8XAy@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/09/2021 08:51, Greg KH wrote:
> On Mon, Sep 20, 2021 at 01:04:34PM +0530, Jeya R wrote:
>> For latest chipsets, upto 13 fastrpc sessions can be
>> supported. This includes 12 compute sessions and 1 cpz
>> session. Not updating this might result to out of bounds
>> memory access issues if more than 9 context bank nodes
>> are added to the DT file.
>>
>> Signed-off-by: Jeya R <jeyr@codeaurora.org>
>> ---
>>   drivers/misc/fastrpc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index beda610..bd7811e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -24,7 +24,7 @@
>>   #define SDSP_DOMAIN_ID (2)
>>   #define CDSP_DOMAIN_ID (3)
>>   #define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
>> -#define FASTRPC_MAX_SESSIONS	9 /*8 compute, 1 cpz*/
>> +#define FASTRPC_MAX_SESSIONS	13 /*12 compute, 1 cpz*/
>>   #define FASTRPC_ALIGN		128
>>   #define FASTRPC_MAX_FDLIST	16
>>   #define FASTRPC_MAX_CRCLIST	64
>> -- 
>> 2.7.4
>>
> 
> What happens if you run this on "older" chipsets?

This change should not have any implications on the older chips, as the 
existing compute context bank device tree entries will not exceed 9.

> 
> And is this an issue now, or can this wait to 5.16-rc1?

We could wait take in 5.16-rc1, as its an enhancement to allow more 
compute context banks.

--srini
> 
> thanks,
> 
> greg k-h
> 
