Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D6526020D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 19:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730616AbgIGRRu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 13:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729747AbgIGODe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 10:03:34 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB894C061573
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 07:03:14 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id 19so8350393qtp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q2snNkh/8isrbacTdRT9IDhnNRIGrd/zDDLSV57mtWo=;
        b=jS6SmYPSNEdaluIHy8psQ+x0EaoWY/zzMAGjW3acEMaHzdOif6FT6C/73RCaAj/T7o
         PUyD4Xe+iAeDIB3DsPEGlueKllP2Byn6TOu89FCTcYuWVbCIwHFQt8zzdYlh0cFSFwO9
         DX1sZSz/LJgrUSNZA1yOpYyIwZWXhVjosq7f3MmAWw2h2E4DrUZDJKJuNR9yw+rfmGUN
         tJkSix5B93LXh2j1yNmqbod4tQQzqLvyT6ioR/cP1yW5220krHciXXPMVBnmUnHjmr3g
         tMYPa/9txKNDgXWpzVm/o7oleCydW6pCmawPYZest5DjYHQZ+GhZox6doA8Apf6rVLOB
         /avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q2snNkh/8isrbacTdRT9IDhnNRIGrd/zDDLSV57mtWo=;
        b=pBZdV39X09NZdNXwY5P3qcLySeGy5P5NuPVxTycQaMk/rVag0U22TCxiO6djuEVpMA
         EXNje2nWldkUE28RY0nXsnhaMcJomfMXGUUrmoCppW4CgegDHbsCwQL2BTzz9xXAns9o
         dmdwILlFfv58YELFJg8lmjJrPiQF2nxWaOIsQFuKO2l+A8J5iWYpKZm3uB+fb22kmsM6
         bM7JthQNSrDESzfrvp1qQdD24GAsYmGh5ZOL49CZWY1S21lGrt123cFOVcs52F3sgc/7
         7uIBZ6JRy+e9fUEZQ2Pz/NAqj/iFLZ6rg8zArRO/shxywIk9S+NPGmSh70G6zarOlX7F
         0m7A==
X-Gm-Message-State: AOAM530NZiGBju8Ch8Vyl+m27NArtEAlSZpbgZaa+sUIq9c4JJOtYazt
        At/6yA+x/l0fIldYpepnA1DQlg==
X-Google-Smtp-Source: ABdhPJz0C+74EbzjrfxhYCFJZMQ2BCpQgm1Rp7FUDzOEFSIjO/lAPBhm3MRa80YQA9WAAIsKJi4ieg==
X-Received: by 2002:ac8:6d0e:: with SMTP id o14mr20103636qtt.31.1599487394088;
        Mon, 07 Sep 2020 07:03:14 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id p29sm6299918qtu.68.2020.09.07.07.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:03:13 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: add ioctl for attaching to sensors pd
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200901003300.11985-1-jonathan@marek.ca>
 <20200907123344.GA2371705@kroah.com>
 <a9d142c9-8a61-ee59-d849-393af1b3eaec@marek.ca>
 <e0db9beb-bbd2-8f20-d7f4-675b62acf782@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <4b617c4c-f0f8-3d6b-c726-9dd4bf705fbc@marek.ca>
Date:   Mon, 7 Sep 2020 10:02:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e0db9beb-bbd2-8f20-d7f4-675b62acf782@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/7/20 9:58 AM, Srinivas Kandagatla wrote:
> 
> 
> On 07/09/2020 14:51, Jonathan Marek wrote:
>>>> @@ -1477,7 +1477,10 @@ static long fastrpc_device_ioctl(struct file 
>>>> *file, unsigned int cmd,
>>>>           err = fastrpc_invoke(fl, argp);
>>>>           break;
>>>>       case FASTRPC_IOCTL_INIT_ATTACH:
>>>> -        err = fastrpc_init_attach(fl);
>>>> +        err = fastrpc_init_attach(fl, 0);
>>>> +        break;
>>>> +    case FASTRPC_IOCTL_INIT_ATTACH_SNS:
>>>> +        err = fastrpc_init_attach(fl, 2);
>>>
>>> Shouldn't you have #defines for those magic numbers somewhere?  What
>>> does 0 and 2 mean?
>>>
>>
>> This is based off a downstream driver which also uses magic numbers, 
>> although I can make an educated guess about the meaning.
>>
>> Srini do you have any suggestions for how to name these values?
> 
> These are domain id corresponding to each core.
> you can use SDSP_DOMAIN_ID in here!
> these are already defined in the file as:
> 
> #define ADSP_DOMAIN_ID (0)
> #define MDSP_DOMAIN_ID (1)
> #define SDSP_DOMAIN_ID (2)
> #define CDSP_DOMAIN_ID (3)
> 

I don't think this is right:

FASTRPC_IOCTL_INIT_ATTACH uses pd = 0
FASTRPC_IOCTL_INIT_CREATE uses pd = 1

And these two ioctl are used with all DSP cores. So it wouldn't make 
sense for the pd value to correspond to the domain id.

> 
> --srini
