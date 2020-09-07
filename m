Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E69225FBA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 15:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbgIGNtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 09:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729693AbgIGNsD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 09:48:03 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E396C061573
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 06:48:02 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id k25so8861760qtu.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RpRB6iljb2M31wwzZybgy6AB4+l8J65CnWPoS2cjpPY=;
        b=Z4pE4+0zsGUqaenaa9Sotx3GjcxpCYEKHj5+k2JcptyuVQQuV4lpcx9TiwEJjrDsuu
         wFVJKo4XIWj01ZJfOQNxvUYP5rPBkQJZIgIdWkznFKvhYMNihLKn/LHPZ4SgUpAno2fA
         Uv0HZNF0qpkPRjerw+6nwTPRDLba7k+jViBz+ERSCn5hfvfGMkWsHdmLrEt2nqE+Sb9H
         vbCHqrrABx3w3RziRDbF2r3dIosDXjRSbR1JdXhb1TOEULn1+kobjk/xXQbYLcyd+yxt
         3aOjDrbwMv7qkcZEoz8KMnvHyGWS2dVsKwnzAdyoHuZobi0D7ShbOzEyQDI/STgCpSiU
         yakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RpRB6iljb2M31wwzZybgy6AB4+l8J65CnWPoS2cjpPY=;
        b=Xc3aAmAt2Abf80LN6MQzt8Vg2TdVDUhEG0kTSEdo5KoQCWR9y3r1n7LHTL5zqJuN1a
         Ph1lcWY+53DtWktmkcY7ukOmjY7NWKjw3piOtad9G4JCVB8kSTFqqjJylekbBtyL00to
         zXUHWPYsu8yTT+zpctkBDO7Wn5rcU8ehucoO/vAKXhJIqGWEB28ClkZdy7Qovqisfiy4
         fZmrmlvqz+rKSpntLjlYEHogbR0CbaFMSUuJdlEzlYXe3S5ySqarub48C+wf153aHOpf
         cCVh1seTXEPmMN9TTbVxW2KyJcWvdOK2P/ZmwYZ/x1FPzznN/4wv9SZgyQWK8YeK+5N0
         HoEw==
X-Gm-Message-State: AOAM531b5q4wcNJZI4/ZfWzYYD6m55ai27LwMor5vH2uR4KqwGNAJue+
        19iHQmoLbbEPYPtcTTWTa0hr0Q==
X-Google-Smtp-Source: ABdhPJyxkTrirT9I13DtZi1g3rHs4BUopE1qzFqaeXf+do879hoQZ6UGYPDN/a/4a8gotkwuRtVB/Q==
X-Received: by 2002:ac8:1c43:: with SMTP id j3mr20742825qtk.302.1599486481577;
        Mon, 07 Sep 2020 06:48:01 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id r34sm12164513qtr.18.2020.09.07.06.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 06:48:01 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: add ioctl for attaching to sensors pd
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200901003300.11985-1-jonathan@marek.ca>
 <fa436d55-b986-944f-e90f-b81cb32eeb0e@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <3f1f8ff1-cf23-ae2c-4cff-cdcce0b11e2e@marek.ca>
Date:   Mon, 7 Sep 2020 09:47:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <fa436d55-b986-944f-e90f-b81cb32eeb0e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/7/20 8:36 AM, Srinivas Kandagatla wrote:
> 
> 
> On 01/09/2020 01:32, Jonathan Marek wrote:
>> -#define FASTRPC_IOCTL_MMAP              _IOWR('R', 6, struct 
>> fastrpc_req_mmap)
>> -#define FASTRPC_IOCTL_MUNMAP            _IOWR('R', 7, struct 
>> fastrpc_req_munmap)
>> +#define FASTRPC_IOCTL_MMAP        _IOWR('R', 6, struct fastrpc_req_mmap)
>> +#define FASTRPC_IOCTL_MUNMAP        _IOWR('R', 7, struct 
>> fastrpc_req_munmap)
> 
> Looks like changes that do not belong to this patch!
> 
> I wanted to try this patch on SM8250.
> How do you test attaching fastrpc to sensor core?, I mean which 
> userspace lib/tool do you use?
> 
> --srini
> 

I pushed my sdsprpcd implementation to github, which is responsible for 
initializing the sensors, and uses this ioctl:

https://github.com/flto/fastrpc

Note: it uses my own WIP fastrpc "library" instead of the one from 
linaro, I also have other related code, like a sensor client, and 
cDSP/aDSP compute examples, but need to confirm that I can share them

Also, the corresponding dts patch I sent has a problem, the label = 
"dsps"; should be label = "sdsp"; (copied the "dsps" from downstream, 
but upstream expects "sdsp"), will send a v2 later today.

>> +#define FASTRPC_IOCTL_INIT_ATTACH_SNS    _IO('R', 8)
