Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 262489A01E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 21:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392009AbfHVTdN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 15:33:13 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33592 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392001AbfHVTdM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 15:33:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id g2so4643508pfq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2019 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Kxz8pVF8gu53BVgVWU7hUlZxdFRU3sKUz9YMeEmEGGo=;
        b=X5tSxEVI7ukEorlWcO4kGGG81nwWerw3aBzMRrKLdaQbUCef4vcl5SUGE+qxmCRd70
         IpO8xy44ce+zENMbDowj9r6RsW5hg5Nn85pyoxqRuhXpYfBvRh5YbBUDtBE3PNyDYhBI
         zeTzJKiiOkMfEykSPew3FMtBD2vATJosslK18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Kxz8pVF8gu53BVgVWU7hUlZxdFRU3sKUz9YMeEmEGGo=;
        b=aFvqjJxPBKRJcMr7d94V6S/EbBJrrek10oA17BPltr9H+tFk3hCqbPta5EGo4vpt2y
         XqZg5hf2SFZKHax2rHmUiQf+4Yb3coJUDzgoyR2abY8YUJzzmsp8q0s5ckGnXMkNeXpt
         1SWCzc9h8O82OEhS5o2ZvOBMzLXLJUEHnXe92maEpKC8JaoFmsLQIhkrB9jrmkB263QT
         dLyAmO9B9CF/YyMe/CvhR7G4alO7oQQZOQGIcIhXm/bnRgnUthY5tTPXJ2sQiJ79OfkZ
         k/Fya3f4MhlWG8sbOLBVKTvfCVTElL/0e/RTQJeqOaR1CpAD/AIiMS8mUu7GHmTZuHeR
         NKfA==
X-Gm-Message-State: APjAAAU0YbWSVKE9c+2wqx7Gi6etluPVOewFYdFK2z5QvX8SUfYlG0+0
        z78BmbIWvoENXWqiZqfZ5HmHLQ==
X-Google-Smtp-Source: APXvYqx8Gm5xHLxdatCmdZBfwRCaxp8P3W/bi/mbQO7XiW3v0WPBitVletu99INnW2yU13lDvUqw9A==
X-Received: by 2002:a17:90a:9b08:: with SMTP id f8mr1330067pjp.103.1566502391469;
        Thu, 22 Aug 2019 12:33:11 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id p10sm193711pff.132.2019.08.22.12.33.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 12:33:10 -0700 (PDT)
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: add offset to
 request_firmware_into_buf
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>
References: <20190523025113.4605-1-scott.branden@broadcom.com>
 <20190523025113.4605-4-scott.branden@broadcom.com>
 <20190523055212.GA22946@kroah.com>
 <c12872f5-4dc3-9bc4-f89b-27037dc0b6ff@broadcom.com>
 <20190523165605.GB21048@kroah.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <9727af14-e368-97f8-7b98-36278fbef9de@broadcom.com>
Date:   Thu, 22 Aug 2019 12:33:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190523165605.GB21048@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On 2019-05-23 9:56 a.m., Greg Kroah-Hartman wrote:
> On Thu, May 23, 2019 at 09:41:49AM -0700, Scott Branden wrote:
>> Hi Greg,
>>
>> On 2019-05-22 10:52 p.m., Greg Kroah-Hartman wrote:
>>> On Wed, May 22, 2019 at 07:51:13PM -0700, Scott Branden wrote:
>>>> Adjust request_firmware_into_buf API to allow for portions
>>>> of firmware file to be read into a buffer.  mdt_loader still
>>>> retricts request fo whole file read into buffer.
>>>>
>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>>> ---
>>>>    drivers/soc/qcom/mdt_loader.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
>>>> index 1c488024c698..ad20d159699c 100644
>>>> --- a/drivers/soc/qcom/mdt_loader.c
>>>> +++ b/drivers/soc/qcom/mdt_loader.c
>>>> @@ -172,8 +172,11 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>>>>    		if (phdr->p_filesz) {
>>>>    			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
>>>> -			ret = request_firmware_into_buf(&seg_fw, fw_name, dev,
>>>> -							ptr, phdr->p_filesz);
>>>> +			ret = request_firmware_into_buf
>>>> +						(&seg_fw, fw_name, dev,
>>>> +						 ptr, phdr->p_filesz,
>>>> +						 0,
>>>> +						 KERNEL_PREAD_FLAG_WHOLE);
>>> So, all that work in the first 2 patches for no real change at all?  Why
>>> are these changes even needed?
>> The first two patches allow partial read of files into memory.
>>
>> Existing kernel drivers haven't need such functionality so, yes, there
>> should be no real change
>>
>> with first two patches other than adding such partial file read support.
>>
>> We have a new driver in development which needs partial read of files
>> supported in the kernel.
> As I said before, I can not take new apis without any in-kernel user.
> So let's wait for your new code that thinks it needs this, and then we
> will be glad to evaluate all of this at that point in time.

I have submitted all the necessary patches you requested here.

These include first adding tests for existing API that never had a 
kernel selftest:

https://lkml.org/lkml/2019/8/22/1367

Followed by API enhancement, tests updated, and a new driver requiring 
enhanced API:

https://lkml.org/lkml/2019/8/22/1404

>
> To do so otherwise is to have loads of unused "features" aquiring cruft
> in the kernel source, and you do not want that.
>
> thanks,
>
> greg k-h

Thanks,

Scott

