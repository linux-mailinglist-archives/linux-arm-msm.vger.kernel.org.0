Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB73D9D336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 17:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729781AbfHZPls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 11:41:48 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35902 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728221AbfHZPlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 11:41:47 -0400
Received: by mail-pg1-f193.google.com with SMTP id l21so10845290pgm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OFHbZ4oNFSxjFZCVr96ZdpAMPyMgbA9Alsj60HdaewI=;
        b=ByyjV9JHG63hj8brWPvTOWRMkb07LDwqViT/wl+ByOyHsb6BiCQgFeLQTJMzmddT7M
         LVHh3S1tn5tPnNPijiJYPg6diPhUhy4mAPULE1m88x1z5o8TtM2UHOW0324cmi17jDC5
         ppqTzE3a7/9LRhb/jRjWbldP9oSdeEYf6z1lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OFHbZ4oNFSxjFZCVr96ZdpAMPyMgbA9Alsj60HdaewI=;
        b=ibuIiZ6iD+1747CtWf1PAWkdREHgUxFjrgwmGUQdG2RDWwMtcynBI2OziwRVDked8Z
         lkfzRGS/UsmcQ3PF4w66HgUMgvN1x4danVMpPGtD0z4jxTkuDHs63xoatOld5ZoI94cs
         Y4A0kKott3z64eJYi3aBj2VO+ZpXI4AawQ/9p2jSfI/xXUsFDlLk43tePI9A63jJFkBF
         FhRJeZRcPeEWf2S9eMT/VEbyD6QXGAHzol+odWAhCAFyIwRsW0fqD0l3mfuwuYQoB2OA
         t4PGxQey+P6ccuOvGqCu5+2SP3h76n2IjqVrVV9hJoNOMg5iKgx11u0Dtpdp2S3oXfPt
         H32g==
X-Gm-Message-State: APjAAAUjK2m3pMWxUXRU48L0oyVgPGHBQnAkl5qygh3VpYvo4P5ij3nL
        IGhFbsOht9lZ7RMDdvfSWmRGIQ==
X-Google-Smtp-Source: APXvYqy4bSxYdli1WrXDqQe8R/DvGtZrO1Cy5GBw8/YXcCOZahjyYWX1rEKv/qFLyxrXQCEZcSOj0Q==
X-Received: by 2002:a17:90a:b781:: with SMTP id m1mr14092341pjr.141.1566834106841;
        Mon, 26 Aug 2019 08:41:46 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id v189sm12729023pfv.176.2019.08.26.08.41.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 08:41:44 -0700 (PDT)
Subject: Re: [PATCH 2/7] firmware: add offset to request_firmware_into_buf
To:     Takashi Iwai <tiwai@suse.de>
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
        Kees Cook <keescook@chromium.org>,
        linux-kselftest@vger.kernel.org
References: <20190822192451.5983-1-scott.branden@broadcom.com>
 <20190822192451.5983-3-scott.branden@broadcom.com>
 <s5hef1crybq.wl-tiwai@suse.de>
 <10461fcf-9eca-32b6-0f9d-23c63b3f3442@broadcom.com>
 <s5hr258j6ln.wl-tiwai@suse.de>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <93b8285a-e5eb-d4a4-545d-426bbbeb8008@broadcom.com>
Date:   Mon, 26 Aug 2019 08:41:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hr258j6ln.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI Takashi,

On 2019-08-26 8:20 a.m., Takashi Iwai wrote:
> On Fri, 23 Aug 2019 21:44:42 +0200,
> Scott Branden wrote:
>> Hi Takashi,
>>
>> Thanks for review.  comments below.
>>
>> On 2019-08-23 3:05 a.m., Takashi Iwai wrote:
>>> On Thu, 22 Aug 2019 21:24:46 +0200,
>>> Scott Branden wrote:
>>>> Add offset to request_firmware_into_buf to allow for portions
>>>> of firmware file to be read into a buffer.  Necessary where firmware
>>>> needs to be loaded in portions from file in memory constrained systems.
>>> AFAIU, this won't work with the fallback user helper, right?
>> Seems to work fine in the fw_run_tests.sh with fallbacks.
> But how?  You patch doesn't change anything about the fallback loading
> mechanism.
Correct - I didn't change any of the underlying mechanisms,
so however request_firmware_into_buf worked before it still does.
>   Or, if the expected behavior is to load the whole content
> and then copy a part, what's the merit of this API?
The merit of the API is that the entire file is not copied into a buffer.
In my use case, the buffer is a memory region in PCIe space that isn't
even large enough for the whole file.  So the only way to get the file 
is to read it
in portions.
>
>>> Also it won't work for the compressed firmware files as-is.
>> Although unnecessary, seems to work fine in the fw_run_tests.sh with
>> "both" and "xzonly" options.
> This looks also suspicious.  Loading a part of the file from the
> middle and decompression won't work together, from obvious reasons.
I don't know what the underlying mechanisms are doing right now.
If they decompress the whole file then that is why it's working.
An obvious improvement that could be made later is to only read
a portion of the file before writing it into the buffer in the non-xz case.
>
> If the test passes, it means that the test itself is more likely
> incorrect, I'm afraid.
Then all of the tests for "both" and "xzonly" could be broken.
>
>
> thanks,
>
> Takashi
Regards,
  Scott
