Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F010B7B602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 01:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfG3XCp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 19:02:45 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44719 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfG3XCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 19:02:45 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so29446485plr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2019 16:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=l67md0ipmih3vEYzhRRc7F2bAQdJBdaBVciR4FmReuc=;
        b=FoanKqKHePYQ/GrvPeWBEWvqtTZlkzE2ilWM53avnGJq/i7+zFPkZBhfZDKsatefR1
         /vUJBumYNSjcpb1s85/pZN3MhOWcMdMsG8jYjn0KJMxNSBFQgQNdbKyH9f3/GciscsFS
         YMsi0Q1Whsbp9UbLbS294SGQazWyStgu9hW84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=l67md0ipmih3vEYzhRRc7F2bAQdJBdaBVciR4FmReuc=;
        b=WkDs/E1ckoilG92AY7XC4aBrO2P9llwf8IT1s1Ix1LWlZ6lU7eNameoGIwYmWGa80t
         IwIrt+1Rdv87JT5lI9fOqhET7Kw35WxLwkZHVTpffCPROG14mCnvNJp+MpBGx/jaAZ7I
         6m1jkGbxcKlQQuzo9Gf+xgdbWAvgb+A2gZUyB6OIk3gTSl/ihyYC/SrQlI+ize7ujhDk
         LeoXwDXfoikYv36JvS0JL1i070ARayxjtsHH0emaIb0InN8IlaroDjpL/Dsfn9yghOGz
         rw7fSsRzWEwiHcm3N3m4WkrBkQ2+S6mFhOV103YlYPJ/hQY8D76dOyMUMp4LhigY0k3t
         j2kw==
X-Gm-Message-State: APjAAAXCIwjQJ3LOg7+aDLSwtT71IO5nhq52IIWzHiqSYaXL85aeMrpF
        WEEcNNeqZjFyzrcDI10c6csqBQ==
X-Google-Smtp-Source: APXvYqwUk27zn0JCuQwSvkSJo6y2lurAjkBcMNe5dHp0Tlc7AJtK0D/iS5BlcdMAfIqKU7IIdM1gwA==
X-Received: by 2002:a17:902:da4:: with SMTP id 33mr107262813plv.209.1564527764489;
        Tue, 30 Jul 2019 16:02:44 -0700 (PDT)
Received: from [10.136.13.136] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id b26sm74753491pfo.129.2019.07.30.16.02.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 16:02:43 -0700 (PDT)
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: add offset to
 request_firmware_into_buf
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 <20190523165605.GB21048@kroah.com> <20190527053607.GV31438@minitux>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <4aec9d4e-fd6c-afba-d051-6ab22bdfa17f@broadcom.com>
Date:   Tue, 30 Jul 2019 16:02:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190527053607.GV31438@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2019-05-26 10:36 p.m., Bjorn Andersson wrote:
> On Thu 23 May 09:56 PDT 2019, Greg Kroah-Hartman wrote:
>
>> On Thu, May 23, 2019 at 09:41:49AM -0700, Scott Branden wrote:
>>> Hi Greg,
>>>
>>> On 2019-05-22 10:52 p.m., Greg Kroah-Hartman wrote:
>>>> On Wed, May 22, 2019 at 07:51:13PM -0700, Scott Branden wrote:
>>>>> Adjust request_firmware_into_buf API to allow for portions
>>>>> of firmware file to be read into a buffer.  mdt_loader still
>>>>> retricts request fo whole file read into buffer.
>>>>>
>>>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>>>> ---
>>>>>    drivers/soc/qcom/mdt_loader.c | 7 +++++--
>>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
>>>>> index 1c488024c698..ad20d159699c 100644
>>>>> --- a/drivers/soc/qcom/mdt_loader.c
>>>>> +++ b/drivers/soc/qcom/mdt_loader.c
>>>>> @@ -172,8 +172,11 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
>>>>>    		if (phdr->p_filesz) {
>>>>>    			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
>>>>> -			ret = request_firmware_into_buf(&seg_fw, fw_name, dev,
>>>>> -							ptr, phdr->p_filesz);
>>>>> +			ret = request_firmware_into_buf
>>>>> +						(&seg_fw, fw_name, dev,
>>>>> +						 ptr, phdr->p_filesz,
>>>>> +						 0,
>>>>> +						 KERNEL_PREAD_FLAG_WHOLE);
>>>> So, all that work in the first 2 patches for no real change at all?  Why
>>>> are these changes even needed?
>>> The first two patches allow partial read of files into memory.
>>>
>>> Existing kernel drivers haven't need such functionality so, yes, there
>>> should be no real change
>>>
>>> with first two patches other than adding such partial file read support.
>>>
>>> We have a new driver in development which needs partial read of files
>>> supported in the kernel.
>> As I said before, I can not take new apis without any in-kernel user.
>> So let's wait for your new code that thinks it needs this, and then we
>> will be glad to evaluate all of this at that point in time.
>>
> The .mdt files are ELF files split to avoid having to allocate large
> (5-60MB) chunks of temporary firmware buffers while installing the
> segments.
>
> But for multiple reasons it would be nice to be able to load the
> non-split ELF files and the proposed interface would allow this.
>
> So I definitely like the gist of the series.
>
>> To do so otherwise is to have loads of unused "features" aquiring cruft
>> in the kernel source, and you do not want that.
>>
> Agreed.
>
> I'll take the opportunity and see if I can implement this (support for
> non-split Qualcomm firmware) based on the patches in this series.

I'm back from my leave now.

Have you managed to utilize my partial firmware read in your driver yet?

>
> Regards,
> Bjorn
