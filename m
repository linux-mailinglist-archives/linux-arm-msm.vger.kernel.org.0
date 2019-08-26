Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8492D9D4DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 19:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732298AbfHZRY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 13:24:27 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33023 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfHZRY0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 13:24:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so11019777pgn.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rb7iuoQ+Gomsu2YAozXkWUQXactVdSD0FsFa8hD/asE=;
        b=HBeA4vv1OE7pU+fZx/EbqN3SIPc9pJCssSACM6VAx0KIsNSmqCt9TNcKSo6ViYIta8
         VnGF0hO9m6P/IFiHhsdNYqw+PIqEQWlLsr7vza+YyHFuS6wxvDtgwFRWaV3JvV8j3y0X
         ZamFoBKQfRUeDH2RTk0zPBc0yXtO9k7lpVEW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rb7iuoQ+Gomsu2YAozXkWUQXactVdSD0FsFa8hD/asE=;
        b=A6nMGzVaIPKWRbn6+jmwZs36rQ5ZU9LFnpdvoiJNAj5tbk63kW+KVxr4mPKV4USikX
         hXlheJHkGJV1BXGh1JGiODLaZD0+za55i2sXAGfROqCRaFgv81kQXAkxaNTqozwxwEzP
         EknvQJOeyuwDp4NcUuw5JiWgo0ALU+h+yIAJCdsl3v3CcIunV11yCdlmEJ12DPIoi8bx
         JSINVQ3dHBCqKi86EkbdNDlwa62menxL3l1XG9/igE4wKKAFW2o653Na26lqK+6BZSc7
         nFWDkomc8T9WHX748drYrDH4fnOYsZs9nacmlY7Mm774jKXn8Rr6BIte8XSiXOzHRgGF
         9D3Q==
X-Gm-Message-State: APjAAAWZoORiEBaNjRMbbxI7l2BnQ8339p0qpUXGWNmmQbLvPani11ru
        4L7wcQBSD1Yok1FkjlnXwoyoJg==
X-Google-Smtp-Source: APXvYqy2UucAHzKtHomdYNdhdeh/53QLrBQTZBYCiOe75MQZJzjbcSg4NTGKaSXApN0+GGxaWaPfYA==
X-Received: by 2002:a63:f758:: with SMTP id f24mr17277542pgk.319.1566840265911;
        Mon, 26 Aug 2019 10:24:25 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id c22sm11740149pfi.82.2019.08.26.10.24.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 10:24:24 -0700 (PDT)
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
 <93b8285a-e5eb-d4a4-545d-426bbbeb8008@broadcom.com>
 <s5ho90byhnv.wl-tiwai@suse.de>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <b440f372-45be-c06c-94a1-44ae6b1e7eb8@broadcom.com>
Date:   Mon, 26 Aug 2019 10:24:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5ho90byhnv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Takashi,

On 2019-08-26 10:12 a.m., Takashi Iwai wrote:
> On Mon, 26 Aug 2019 17:41:40 +0200,
> Scott Branden wrote:
>> HI Takashi,
>>
>> On 2019-08-26 8:20 a.m., Takashi Iwai wrote:
>>> On Fri, 23 Aug 2019 21:44:42 +0200,
>>> Scott Branden wrote:
>>>> Hi Takashi,
>>>>
>>>> Thanks for review.  comments below.
>>>>
>>>> On 2019-08-23 3:05 a.m., Takashi Iwai wrote:
>>>>> On Thu, 22 Aug 2019 21:24:46 +0200,
>>>>> Scott Branden wrote:
>>>>>> Add offset to request_firmware_into_buf to allow for portions
>>>>>> of firmware file to be read into a buffer.  Necessary where firmware
>>>>>> needs to be loaded in portions from file in memory constrained systems.
>>>>> AFAIU, this won't work with the fallback user helper, right?
>>>> Seems to work fine in the fw_run_tests.sh with fallbacks.
>>> But how?  You patch doesn't change anything about the fallback loading
>>> mechanism.
>> Correct - I didn't change any of the underlying mechanisms,
>> so however request_firmware_into_buf worked before it still does.
>>>    Or, if the expected behavior is to load the whole content
>>> and then copy a part, what's the merit of this API?
>> The merit of the API is that the entire file is not copied into a buffer.
>> In my use case, the buffer is a memory region in PCIe space that isn't
>> even large enough for the whole file.  So the only way to get the file
>> is to read it
>> in portions.
> BTW: does the use case above mean that the firmware API directly
> writes onto the given PCI iomem region?  If so, I'm not sure whether
> it would work as expected on all architectures.  There must be a
> reason of the presence of iomem-related API like memcpy_toio()...
Yes, we access the PCI region directly in the driver and thus also 
through request_firmware_into_buf.
I will admit I am not familiar with every subtlety of PCI accesses. Any 
comments to the Valkyrie driver in this patch series are appreciated.
But not all drivers need to work on all architectures. I can add a 
depends on x86 64bit architectures to the driver to limit it to such.
>
>
> thanks,
>
> Takashi

