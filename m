Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D212218BF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 16:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfEIOiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 10:38:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56980 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfEIOiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 10:38:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BD3A960779; Thu,  9 May 2019 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557412699;
        bh=m/9MIbexuBdPxCFPr6oX4nJ8E4mDFLipijNpmR33xf0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EJX8j9RinsUzb5V1hvPYqVOPERp2yIR1uT/0HBSVR0Q+O6CI0LwmKwYLq0rKQ4ies
         zGVXpsPJRiso66Ua8hTfNohOiDKOVE8jhxX3gZ3wJ3mbNjHr2fSOS1Zb7OUpvuUkBI
         Xt2uYLXIwmn05nTC5BwCkI2TIq8o8q0yazTOrfbQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.204.78.109] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9491D6016D;
        Thu,  9 May 2019 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557412698;
        bh=m/9MIbexuBdPxCFPr6oX4nJ8E4mDFLipijNpmR33xf0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KVLMA6xnVzPYMMB8pD2qrzzyV4Ipd559Wuq/B/1f73knIZWmE0yQ3DBOJxGoFNIz8
         PcGr67buW45zYJd+Hi9O/tZuj7J0sKHqYyxJxSxSZgaXyJl25MdQLz0eLBFB6kqPO0
         hUp/EkRKZzI8FDXFHswA4oppfmczHonEPG+nM4tc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9491D6016D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH] driver core: Fix use-after-free and double free on glue
 directory
To:     Greg KH <gregkh@linuxfoundation.org>,
        Muchun Song <smuchun@gmail.com>
Cc:     rafael@kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        zhaowuyun@wingtech.com, linux-arm-msm@vger.kernel.org
References: <20190423143258.96706-1-smuchun@gmail.com>
 <24b0fff3775147c04b006282727d94fea7f408b4.camel@kernel.crashing.org>
 <CAPSr9jHhwASv7=83hU+81mC0JJyuyt2gGxLmyzpCOfmc9vKgGQ@mail.gmail.com>
 <a37e7a49c3e7fa6ece2be2b76798fef3e51ade4e.camel@kernel.crashing.org>
 <CAPSr9jHCVCHNK+AmKkUBgs4dPC0UC5KdYKqMinkauyL3OL6qrQ@mail.gmail.com>
 <79fbc203bc9fa09d88ab2c4bff8635be4c293d49.camel@kernel.crashing.org>
 <CAPSr9jHw9hgAZo2TuDAKdSLEG1c6EtJG005MWxsxfnbsk1AXow@mail.gmail.com>
 <20190504153440.GB19654@kroah.com>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <e79201c2-a00b-d226-adc2-62769ae1ad81@codeaurora.org>
Date:   Thu, 9 May 2019 20:08:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504153440.GB19654@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi ,

Last patch will serialize the addition of child to parent directory, 
won't it affect performance.

Regards
Gaurav

On 5/4/2019 9:04 PM, Greg KH wrote:
> On Sat, May 04, 2019 at 10:47:07PM +0800, Muchun Song wrote:
>> Benjamin Herrenschmidt <benh@kernel.crashing.org> 于2019年5月2日周四 下午2:25写道：
>>
>>>>> The basic idea yes, the whole bool *locked is horrid though.
>>>>> Wouldn't it
>>>>> work to have a get_device_parent_locked that always returns with
>>>>> the mutex held,
>>>>> or just move the mutex to the caller or something simpler like this
>>>>> ?
>>>>>
>>>>
>>>> Greg and Rafael, do you have any suggestions for this? Or you also
>>>> agree with Ben?
>>>
>>> Ping guys ? This is worth fixing...
>>
>> I also agree with you. But Greg and Rafael seem to be high latency right now.
> 
> It's in my list of patches to get to, sorry, hopefully will dig out of
> that next week with the buffer that the merge window provides me.
> 
> thanks,
> 
> greg k-h
> 

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
